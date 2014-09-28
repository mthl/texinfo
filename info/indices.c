/* indices.c -- deal with an Info file index.
   $Id$

   Copyright 1993, 1997, 1998, 1999, 2002, 2003, 2004, 2007, 2008, 2011,
   2013, 2014 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.

   Originally written by Brian Fox. */

#include "info.h"
#include "info-utils.h"
#include "session.h"
#include "echo-area.h"
#include "indices.h"
#include "variables.h"

/* User-visible variable controls the output of info-index-next. */
int show_index_match = 1;

/* The combined indices of the last file processed by
   info_indices_of_file_buffer. */
static REFERENCE **index_index = NULL;

/* The offset of the most recently selected index element. */
static int index_offset = 0;
/* Whether we are doing partial index search */
static int index_partial = 0;

/* Variable which holds the last string searched for. */
static char *index_search = NULL;

/* A couple of "globals" describing where the initial index was found. */
static char *initial_index_filename = NULL;
static char *initial_index_nodename = NULL;

/* A structure associating index names with index offset ranges. */
typedef struct {
  char *name;                   /* The nodename of this index. */
  int first;                    /* The index in our list of the first entry. */
  int last;                     /* The index in our list of the last entry. */
} INDEX_NAME_ASSOC;

/* An array associating index nodenames with index offset ranges. */
static INDEX_NAME_ASSOC **index_nodenames = NULL;
static size_t index_nodenames_index = 0;
static size_t index_nodenames_slots = 0;

/* Add the name of NODE, and the range of the associated index elements
   (passed in ARRAY) to index_nodenames.  ARRAY must have at least one
   element. */
static void
add_index_to_index_nodenames (REFERENCE **array, NODE *node)
{
  register int i, last;
  INDEX_NAME_ASSOC *assoc;

  for (last = 0; array[last + 1]; last++);
  assoc = xmalloc (sizeof (INDEX_NAME_ASSOC));
  assoc->name = xstrdup (node->nodename);

  if (!index_nodenames_index)
    {
      assoc->first = 0;
      assoc->last = last;
    }
  else
    {
      for (i = 0; index_nodenames[i + 1]; i++);
      assoc->first = 1 + index_nodenames[i]->last;
      assoc->last = assoc->first + last;
    }
  add_pointer_to_array (assoc, index_nodenames_index, index_nodenames, 
                        index_nodenames_slots, 10);
}

/* Find and concatenate the indices of FILE_BUFFER.  The indices are defined
   as the first node in the file containing the word "Index" and any
   immediately following nodes whose names also contain "Index".  All such
   indices are concatenated and the result returned.  Neither the returned
   array nor its elements should be freed by the caller. */
REFERENCE **
info_indices_of_file_buffer (FILE_BUFFER *file_buffer)
{
  register int i;
  REFERENCE **result = NULL;

  /* No file buffer, no indices. */
  if (!file_buffer)
    return NULL;

  /* Reset globals describing where the index was found. */
  free (initial_index_filename);
  free (initial_index_nodename);
  initial_index_filename = NULL;
  initial_index_nodename = NULL;

  if (index_nodenames)
    {
      for (i = 0; index_nodenames[i]; i++)
        {
          free (index_nodenames[i]->name);
          free (index_nodenames[i]);
        }

      index_nodenames_index = 0;
      index_nodenames[0] = NULL;
    }

  /* Grovel the names of the nodes found in this file. */
  if (file_buffer->tags)
    {
      NODE *tag;

      for (i = 0; (tag = file_buffer->tags[i]); i++)
        {
          if (string_in_line ("Index", tag->nodename) != -1
              && tag->nodelen != 0) /* Not an anchor. */
            {
              NODE *node;
              REFERENCE **menu;

              node = info_node_of_tag (file_buffer, &file_buffer->tags[i]);

              if (!node)
                continue;

              if (!initial_index_filename)
                {
                  /* Remember the filename and nodename of this index. */
                  initial_index_filename = xstrdup (file_buffer->filename);
                  initial_index_nodename = xstrdup (tag->nodename);
                }

              menu = node->references;

              /* If we have a non-empty menu, add this index's nodename
                 and range to our list of index_nodenames. */
              if (menu && menu[0])
                {
                  add_index_to_index_nodenames (menu, node);

                  /* Concatenate the references found so far. */
                  {
                  REFERENCE **old_result = result;
                  result = info_concatenate_references (result, menu);
                  free (old_result);
                  }
                }
              free (node);
            }
        }
    }

  /* If there is a result, clean it up so that every entry has a filename. */
  for (i = 0; result && result[i]; i++)
    if (!result[i]->filename)
      result[i]->filename = xstrdup (file_buffer->filename);

  /* Store result so that if we call do_info_index_search later, it
     will be set. */
  free (index_index);
  index_index = result;
  return result;
}

DECLARE_INFO_COMMAND (info_index_search,
   _("Look up a string in the index for this file"))
{
  do_info_index_search (window, file_buffer_of_window (window), count, 0);
}

/* Look up SEARCH_STRING in the index for this file.  If SEARCH_STRING
   is NULL, prompt user for input.  */ 
void
do_info_index_search (WINDOW *window, FILE_BUFFER *fb,
                      int count, char *search_string)
{
  char *line;

  /* Reset the index offset, since this is not the info-index-next command. */
  index_offset = 0;

  if (!fb)
    return;

  /* The user is selecting a new search string, so flush the old one. */
  free (index_search);
  index_search = NULL;

  /* If the file is not the same as the one that we last built an
     index for, build and remember an index now. */
  if (!initial_index_filename ||
      (FILENAME_CMP (initial_index_filename, fb->filename) != 0))
    {
      window_message_in_echo_area (_("Finding index entries..."));
      info_indices_of_file_buffer (fb); /* Sets index_index. */
    }

  /* If there is no index, quit now. */
  if (!index_index)
    {
      info_error (_("No indices found."));
      return;
    }

  /* Okay, there is an index.  Look for SEARCH_STRING, or, if it is
     empty, prompt for one.  */
  if (search_string && *search_string)
    line = xstrdup (search_string);
  else
    {
      line = info_read_maybe_completing (_("Index entry: "), index_index);
      window = active_window;

      /* User aborted? */
      if (!line)
        {
          info_abort_key (active_window, 1, 0);
          return;
        }

      /* Empty line means move to the Index node. */
      if (!*line)
        {
          free (line);

          if (initial_index_filename && initial_index_nodename)
            {
              NODE *node;

              node = info_get_node (initial_index_filename,
                                    initial_index_nodename);
              info_set_node_of_window (window, node);
              return;
            }
        }
    }
  
  /* The user typed either a completed index label, or a partial string.
     Find an exact match, or, failing that, the first index entry containing
     the partial string.  So, we just call info_next_index_match () with minor
     manipulation of INDEX_OFFSET. */
  {
    int old_offset;

    /* Start the search right after/before this index. */
    if (count < 0)
      {
        register int i;
        for (i = 0; index_index[i]; i++);
        index_offset = i;
      }
    else
      {
	index_offset = -1;
	index_partial = 0;
      }
    
    old_offset = index_offset;

    /* The "last" string searched for is this one. */
    index_search = line;

    /* Find it, or error. */
    info_next_index_match (window, count, 0);

    /* If the search failed, return the index offset to where it belongs. */
    if (index_offset == old_offset)
      index_offset = 0;
  }
}

/* Return 1 if STRING appears in indicies of FB, 0 otherwise. */
int
index_entry_exists (FILE_BUFFER *fb, char *string)
{
  register int i;

  /* If there is no previous search string, the user hasn't built an index
     yet. */
  if (!string)
    return 0;

  if (!initial_index_filename ||
      !fb ||
      (FILENAME_CMP (initial_index_filename, fb->filename) != 0))
    {
      free (index_index);
      index_index = info_indices_of_file_buffer (fb);
    }

  /* If there is no index, that is an error. */
  if (!index_index)
    return 0;

  for (i = 0; (i > -1) && (index_index[i]); i++)
    if (strcmp (string, index_index[i]->label) == 0)
      break;

  /* If that failed, look for the next substring match. */
  if ((i < 0) || (!index_index[i]))
    {
      for (i = 0; (i > -1) && (index_index[i]); i++)
        if (string_in_line (string, index_index[i]->label) != -1)
          break;

      if ((i > -1) && (index_index[i]))
        string_in_line (string, index_index[i]->label);
    }

  /* If that failed, return 0. */
  if ((i < 0) || (!index_index[i]))
    return 0;

  return 1;
}

/* Return true if ENT->label matches "S( <[0-9]+>)?", where S stands
   for the first LEN characters from STR. */
static int
index_entry_matches (REFERENCE *ent, const char *str, size_t len)
{
  char *p;
  
  if (strncmp (ent->label, str, len))
    return 0;
  p = ent->label + len;
  if (!*p)
    return 1;
  if (p[0] == ' ' && p[1] == '<')
    {
      for (p += 2; *p; p++)
	{
	  if (p[0] == '>' && p[1] == 0)
	    return 1;
	  else if (!isdigit (*p))
	    return 0;
	}
    }
  return 0;
}

DECLARE_INFO_COMMAND (info_next_index_match,
 _("Go to the next matching index item from the last '\\[index-search]' command"))
{
  register int i;
  int partial, dir;
  size_t search_len;
  
  /* If there is no previous search string, the user hasn't built an index
     yet. */
  if (!index_search)
    {
      info_error (_("No previous index search string."));
      return;
    }

  /* If there is no index, that is an error. */
  if (!index_index)
    {
      info_error (_("No index entries."));
      return;
    }

  /* The direction of this search is controlled by the value of the
     numeric argument. */
  if (count < 0)
    dir = -1;
  else
    dir = 1;

  /* Search for the next occurence of index_search. */
  partial = 0;
  search_len = strlen (index_search);

  if (!index_partial)
    {
      /* First try to find an exact match. */
      for (i = index_offset + dir; (i > -1) && (index_index[i]); i += dir)
	if (index_entry_matches (index_index[i], index_search, search_len))
	  break;

      /* If that failed, look for the next substring match. */
      if ((i < 0) || (!index_index[i]))
	{
	  index_offset = 0;
	  index_partial = 1;
	}
    }

  if (index_partial)
    {
      /* When looking for substrings, take care not to return previous exact
	 matches. */
      for (i = index_offset + dir; (i > -1) && (index_index[i]); i += dir)
        if (!index_entry_matches (index_index[i], index_search, search_len))
	  {
	    partial = string_in_line (index_search, index_index[i]->label);
	    if (partial != -1)
	      break;
	  }
      index_partial = partial > 0;
    }
  
  /* If that failed, print an error. */
  if ((i < 0) || (!index_index[i]))
    {
      info_error (index_offset > 0 ?
		  _("No more index entries containing '%s'.") :
		  _("No index entries containing '%s'."),
		  index_search);
      index_offset = 0;
      return;
    }

  /* Okay, we found the next one.  Move the offset to the current entry. */
  index_offset = i;

  /* Report to the user on what we have found. */
  {
    register int j;
    const char *name = _("CAN'T SEE THIS");
    char *match;

    for (j = 0; index_nodenames[j]; j++)
      {
        if ((i >= index_nodenames[j]->first) &&
            (i <= index_nodenames[j]->last))
          {
            name = index_nodenames[j]->name;
            break;
          }
      }

    /* If we had a partial match, indicate to the user which part of the
       string matched. */
    match = xstrdup (index_index[i]->label);

    if (partial > 0 && show_index_match)
      {
        int k, ls, start, upper;

        ls = strlen (index_search);
        start = partial - ls;
        upper = isupper (match[start]) ? 1 : 0;

        for (k = 0; k < ls; k++)
          if (upper)
            match[k + start] = tolower (match[k + start]);
          else
            match[k + start] = toupper (match[k + start]);
      }

    {
      char *format;

      format = replace_in_documentation
        (_("Found '%s' in %s. ('\\[next-index-match]' tries to find next.)"),
         0);

      window_message_in_echo_area (format, match, (char *) name);
    }

    free (match);
  }

  info_select_reference (window, index_index[i]);
}

/* **************************************************************** */
/*                                                                  */
/*                 Info APROPOS: Search every known index.          */
/*                                                                  */
/* **************************************************************** */

/* For every menu item in DIR, search the indices of that file for
   SEARCH_STRING. */
REFERENCE **
apropos_in_all_indices (char *search_string, int inform)
{
  size_t i, dir_index;
  REFERENCE **all_indices = NULL;
  REFERENCE **dir_menu = NULL;
  NODE *dir_node;

  dir_node = get_dir_node ();

  /* It should be safe to assume that dir nodes do not contain any
     cross-references, i.e., its references list only contains
     menu items. */
  if (dir_node)
    dir_menu = dir_node->references;

  if (!dir_menu)
    {
      free (dir_node);
      return NULL;
    }

  /* For every menu item in DIR, get the associated file buffer and
     read the indices of that file buffer.  Gather all of the indices into
     one large one. */
  for (dir_index = 0; dir_menu[dir_index]; dir_index++)
    {
      REFERENCE **this_index, *this_item;
      FILE_BUFFER *this_fb;

      this_item = dir_menu[dir_index];

      /* If we already scanned this file, don't do that again.
         In addition to being faster, this also avoids having
         multiple identical entries in the *Apropos* menu.  */
      for (i = 0; i < dir_index; i++)
        if (FILENAME_CMP (this_item->filename, dir_menu[i]->filename) == 0)
          break;
      if (i < dir_index)
        continue;

      this_fb = info_find_file (this_item->filename);

      if (!this_fb)
        continue;

      if (this_fb && inform)
        message_in_echo_area (_("Scanning indices of '%s'..."), this_item->filename);

      this_index = info_indices_of_file_buffer (this_fb);

      if (this_fb && inform)
        unmessage_in_echo_area ();

      if (this_index)
        {
          /* Remember the filename which contains this set of references. */
          for (i = 0; this_index && this_index[i]; i++)
            if (!this_index[i]->filename)
              this_index[i]->filename = xstrdup (this_fb->filename);

          /* Concatenate with the other indices.  */
          {
          REFERENCE **old_indices = all_indices;
          all_indices = info_concatenate_references (all_indices, this_index);
          free (old_indices);
          }
        }
      /* Try to avoid running out of memory */
      free (this_fb->contents);
      this_fb->contents = NULL;
    }

  /* Build a list of the references which contain SEARCH_STRING. */
  if (all_indices)
    {
      REFERENCE *entry, **apropos_list = NULL;
      size_t apropos_list_index = 0;
      size_t apropos_list_slots = 0;

      for (i = 0; (entry = all_indices[i]); i++)
        {
          if (string_in_line (search_string, entry->label) != -1)
            {
              add_pointer_to_array (entry, apropos_list_index, apropos_list, 
                                    apropos_list_slots, 100);
            }
        }

      free (all_indices);
      all_indices = apropos_list;
    }
  free (dir_node);
  return all_indices;
}

static char *apropos_list_nodename = "*Apropos*";

DECLARE_INFO_COMMAND (info_index_apropos,
   _("Grovel all known info file's indices for a string and build a menu"))
{
  char *line;

  line = info_read_in_echo_area (_("Index apropos: "));

  window = active_window;

  /* User aborted? */
  if (!line)
    {
      info_abort_key (window, 1, 1);
      return;
    }

  /* User typed something? */
  if (*line)
    {
      REFERENCE **apropos_list;
      NODE *apropos_node;
      struct text_buffer message;

      apropos_list = apropos_in_all_indices (line, 1);

      if (!apropos_list)
        { 
          info_error (_(APROPOS_NONE), line);
          free (line);
          return;
        }
      else
        {
          /* Create the node.  FIXME: Labels and node names taken from the
             indices of Info files may be in a different character encoding to 
             the one currently being used. */
          register int i;

          text_buffer_init (&message);
          text_buffer_add_char (&message, '\n');
          text_buffer_printf (&message, _("Index entries containing "
                              "'%s':\n"), line);
          text_buffer_printf (&message, "\n* Menu:");
          text_buffer_printf (&message, " \b[index \b]");
          text_buffer_add_char (&message, '\n');

          for (i = 0; apropos_list[i]; i++)
            {
              int line_start = text_buffer_off (&message);
              char *filename;

              /* Remove file extension. */
              filename = program_name_from_file_name
                (apropos_list[i]->filename);

              /* The label might be identical to that of another index
                 entry in another Info file.  Therefore, we make the file
                 name part of the menu entry, to make them all distinct.  */
              text_buffer_printf (&message, "* %s [%s]: ",
                      apropos_list[i]->label, filename);

              while (text_buffer_off (&message) - line_start < 40)
                text_buffer_add_char (&message, ' ');
              text_buffer_printf (&message, "(%s)%s.\n",
                                  filename, apropos_list[i]->nodename);
              free (filename);
            }
        }

      apropos_node = text_buffer_to_node (&message);
      scan_node_contents (0, &apropos_node);

      add_gcable_pointer (apropos_node->contents);
      name_internal_node (apropos_node, xstrdup (apropos_list_nodename));
      apropos_node->flags |= N_Unstored;

      /* Find/Create a window to contain this node. */
      {
        WINDOW *new;
        NODE *node;

        /* If a window is visible and showing an apropos list already,
           re-use it. */
        for (new = windows; new; new = new->next)
          {
            node = new->node;

            if (internal_info_node_p (node) &&
                (strcmp (node->nodename, apropos_list_nodename) == 0))
              break;
          }

        /* If we couldn't find an existing window, try to use the next window
           in the chain. */
        if (!new && window->next)
          new = window->next;

        /* If we still don't have a window, make a new one to contain
           the list. */
        if (!new)
          new = window_make_window ();

        /* If we couldn't make a new window, use this one. */
        if (!new)
          new = window;

        /* Lines do not wrap in this window. */
        new->flags |= W_NoWrap;

        info_set_node_of_window (new, apropos_node);
        active_window = new;
      }
      free (apropos_list);
    }
  free (line);
}

#define NODECOL 41
#define LINECOL 62

static void
format_reference (REFERENCE *ref, const char *filename, struct text_buffer *buf)
{
  size_t n;
  
  n = text_buffer_printf (buf, "* %s: ", ref->label);
  if (n < NODECOL)
    n += text_buffer_fill (buf, ' ', NODECOL - n);
  
  if (ref->filename && strcmp (ref->filename, filename))
    n += text_buffer_printf (buf, "(%s)", ref->filename);
  n += text_buffer_printf (buf, "%s. ", ref->nodename);

  if (n < LINECOL)
    n += text_buffer_fill (buf, ' ', LINECOL - n);
  else
    {
      text_buffer_add_char (buf, '\n');
      text_buffer_fill (buf, ' ', LINECOL);
    }
  
  text_buffer_printf (buf, "(line %4d)\n", ref->line_number);
}

DECLARE_INFO_COMMAND (info_virtual_index,
   _("List all matches of a string in the index"))
{
  char *line;
  FILE_BUFFER *fb;
  NODE *node;
  struct text_buffer text;
  size_t i;
  size_t cnt;
  
  fb = file_buffer_of_window (window);

  if (!initial_index_filename ||
      !fb ||
      (FILENAME_CMP (initial_index_filename, fb->filename) != 0))
    {
      free (index_index);
      window_message_in_echo_area (_("Finding index entries..."));
      index_index = info_indices_of_file_buffer (fb);
    }

  if (!index_index)
    {
      info_error (_("No index"));
      return;
    }
    
  line = info_read_maybe_completing (_("Index topic: "), index_index);

  /* User aborted? */
  if (!line || !*line)
    {
      free (line);
      info_abort_key (window, 1, 1);
      return;
    }
  
  text_buffer_init (&text);
  text_buffer_printf (&text,
		      "File: %s,  Node: Index for '%s'\n\n"
		      "Virtual Index\n"
		      "*************\n\n"
		      "Index entries that match '%s':\n"
                      " \b[index \b]"
		      "\n* Menu:\n\n",
                      fb->filename, line, line);

  cnt = 0;
  for (i = 0; index_index[i]; i++)
    {
      if (string_in_line (line, index_index[i]->label) != -1)
	{
	  format_reference (index_index[i], fb->filename, &text);
	  cnt++;
	}
    }
  text_buffer_add_char (&text, '\0');

  if (cnt == 0)
    {
      text_buffer_free (&text);
      info_error (_("No index entries containing '%s'."), line);
      free (line);
      return;
    }

  node = info_create_node ();
  asprintf (&node->nodename, "Index for '%s'", line);
  node->fullpath = fb->filename;
  node->contents = text_buffer_base (&text);
  node->nodelen = text_buffer_off (&text) - 1;
  node->body_start = strcspn (node->contents, "\n");
  node->flags |= (N_IsInternal | N_Unstored);

  scan_node_contents (0, &node);
  info_set_node_of_window (window, node);

  free (line);
}

NODE *allfiles_node = 0;

DECLARE_INFO_COMMAND (info_all_files, _("Show all matching files"))
{
  if (!allfiles_node)
    {
      info_error (_("No file index"));
      return;
    }

  /* FIXME: Copy allfiles_node so it is unique in the window history? */
  info_set_node_of_window (window, allfiles_node);
}
