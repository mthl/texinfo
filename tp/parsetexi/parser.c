/* Copyright 2010, 2011, 2012, 2013, 2014, 2015
   Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>. */

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

#include "parser.h"
#include "text.h"
#include "input.h"
#include "tree.h"
#include "api.h"
#include "errors.h"


/* Utility functions */

const char *whitespace_chars = " \t\f\r\n";
const char *digit_chars = "0123456789";

// [^\S\r\n] in Perl
const char *whitespace_chars_except_newline = " \t\f";

/* Check if the contents of S2 appear at S1). */
int
looking_at (char *s1, char *s2)
{
  return !strncmp (s1, s2, strlen (s2));
}

/* Look for a sequence of alphanumeric characters or hyphens, where the
   first isn't a hyphen.  This is the format of (non-single-character) Texinfo 
   commands, but is also used elsewhere.  Return value to be freed by caller.
   *PTR is advanced past the read name.  Return 0 if name is invalid. */
// 4161
char *
read_command_name (char **ptr)
{
  char *p = *ptr, *q;
  char *ret = 0;

  q = p;
  if (!isalnum (*q))
    return 0; /* Invalid. */

  while (isalnum (*q) || *q == '-' || *q == '_')
    q++;
  ret = strndup (p, q - p);
  p = q;

  *ptr = p;
  return ret;
}


/* Current node and section. */

ELEMENT *current_node = 0;
ELEMENT *current_section = 0;


/* Conditional stack. */

enum command_id *conditional_stack;
size_t conditional_number;
size_t conditional_space;

void
push_conditional_stack (enum command_id cond)
{
  if (conditional_number == conditional_space)
    {
      conditional_stack = realloc (conditional_stack,
                                   (conditional_space += 5)
                                   * sizeof (enum command_id));
      if (!conditional_stack)
        abort ();
    }
  conditional_stack[conditional_number++] = cond;
}

enum command_id
pop_conditional_stack (void)
{
  if (conditional_number == 0)
    return CM_NONE;
  return conditional_stack[--conditional_number];
}


/* Counters */
COUNTER count_remaining_args;
COUNTER count_items;
COUNTER count_cells;


/* Information that is not local to where it is set in the Texinfo input,
   for example document language and encoding. */
GLOBAL_INFO global_info;
char *global_clickstyle = "arrow";
char *global_documentlanguage = "";

enum kbd_enum global_kbdinputstyle = kbd_distinct;

void
wipe_global_info (void)
{
  global_clickstyle = "arrow";
  global_kbdinputstyle = kbd_distinct;
  global_documentlanguage = "";
  memset (&global_info, 0, sizeof (global_info));
}


/* 835 */
void
parse_texi_file (char *filename)
{
  char *p, *q;
  char *linep, *line = 0;
  ELEMENT *root = new_element (ET_text_root);
  ELEMENT *preamble = 0;
  char c;

  int status;
  
  status = input_push_file (filename);
  if (status)
    {
      /* TODO document_error */
      abort ();
    }

  //filename = strdup (filename);

  /* Strip off a leading directory path, by looking for the last
     '/' in filename. */
  p = 0;
  q = strchr (filename, '/');
  while (q)
    {
      p = q;
      q = strchr (q + 1, '/');
    }

  if (p)
    {
      c = *p;
      *p = '\0';
      add_include_directory (filename);
      *p = c;
    }

  /* Check for preamble. */
  while (1)
    {
      ELEMENT *l;

      /* FIXME: _next_text isn't used in Perl. */
      free (line);
      line = next_text ();
      if (!line)
        abort (); /* Empty file? */

      linep = line; 
      linep += strspn (linep, whitespace_chars);
      if (*linep && !looking_at (linep, "\\input"))
        {
          /* This line is not part of the preamble.  Shove back
             into input stream. */
          input_push (line, 0, line_nr.file_name, line_nr.line_nr);
          break;
        }

      if (!preamble)
        preamble = new_element (ET_preamble);

      l = new_element (ET_preamble_text);
      text_append (&l->text, line);
      add_to_element_contents (preamble, l);
    }

  if (preamble)
    add_to_element_contents (root, preamble);

  Root = parse_texi (root);
} /* 916 */


int
begin_paragraph_p (ELEMENT *current)
{
  return (current->type == ET_NONE /* "True for @-commands" */
           || current->type == ET_before_item
           || current->type == ET_text_root
           || current->type == ET_document_root
           || current->type == ET_brace_command_context)
         && in_paragraph_context (current_context ());
}

/* Line 1146 */
/* If in a context where paragraphs are to be started, start a new 
   paragraph.  */
ELEMENT *
begin_paragraph (ELEMENT *current)
{
  if (begin_paragraph_p (current))
    {
      ELEMENT *e;
      enum command_id indent = 0;

      /* Check if an @indent precedes the paragraph (to record it
         in the 'extra' key). */
      if (current->contents.number > 0)
        {
          int i = current->contents.number - 1;
          while (i >= 0)
            {
              ELEMENT *child = contents_child_by_index (current, i);
              if (child->type == ET_empty_line
                  || child->type == ET_paragraph)
                break;
              if (close_paragraph_command(child->cmd))
                break;
              if (child->cmd == CM_indent
                  || child->cmd == CM_noindent)
                {
                  indent = child->cmd;
                  break;
                }
              i--;
            }

        }

      e = new_element (ET_paragraph);
      if (indent)
        add_extra_string (e, indent == CM_indent ? "indent" : "noindent", "1");
      add_to_element_contents (current, e);
      current = e;

      debug ("PARAGRAPH");
    }
  return current;
}

// 1190
ELEMENT *
begin_preformatted (ELEMENT *current)
{
  if (current_context() == ct_preformatted
      || current_context() == ct_rawpreformatted)
    {
      ELEMENT *e;
      enum element_type et;

      if (current_context() == ct_preformatted)
        et = ET_preformatted;
      else
        et = ET_rawpreformatted;
      e = new_element (et);
      add_to_element_contents (current, e);
      current = e;
      debug ("PREFORMATTED %s", et == ET_preformatted ? "preformatted"
                                                      : "rawpreformatted");
    }
  return current;
}

/* 1310 */
ELEMENT *
end_paragraph (ELEMENT *current,
               enum command_id closed_command,
               enum command_id interrupting_command)
{
  current = close_all_style_commands (current,
                                      closed_command, interrupting_command);
  if (current->type == ET_paragraph)
    {
      debug ("CLOSE PARA");
      current = current->parent;
    }

  return current;
}

/* 1328 */
ELEMENT *
end_preformatted (ELEMENT *current,
                  enum command_id closed_command,
                  enum command_id interrupting_command)
{
  current = close_all_style_commands (current,
                                      closed_command, interrupting_command);
  if (current->type == ET_preformatted
      || current->type == ET_rawpreformatted)
    {
      debug ("CLOSE PREFORMATTED %s",
             current->type == ET_preformatted ? "preformatted"
                                              : "rawpreformatted");
      if (current->contents.number == 0)
        {
          current = current->parent;
          destroy_element (pop_element_from_contents (current));
          debug ("popping");
        }
      else
        current = current->parent;
    }
  return current;
}

/* Line 1798 */
/* Add TEXT to the contents of CURRENT, maybe starting a new paragraph. */
ELEMENT *
merge_text (ELEMENT *current, char *text)
{
  int no_merge_with_following_text = 0;
  int leading_spaces = strspn (text, whitespace_chars);
  ELEMENT *last_child = last_contents_child (current);

  /* Is there a non-whitespace character in the line? */
  if (text[leading_spaces])
    {
      char *additional = 0;

      if (last_child
          && (last_child->type == ET_empty_line_after_command
              || last_child->type == ET_empty_spaces_after_command
              || last_child->type == ET_empty_spaces_before_argument
              || last_child->type == ET_empty_spaces_after_close_brace))
        {
          no_merge_with_following_text = 1;
        }

      if (leading_spaces)
        {
          additional = malloc (leading_spaces + 1);
          if (!additional)
            abort ();
          memcpy (additional, text, leading_spaces);
          additional[leading_spaces] = '\0';
        }

      if (abort_empty_line (&current, additional))
        text += leading_spaces;

      free (additional);

      current = begin_paragraph (current);
    }

  last_child = last_contents_child (current);
  if (last_child
      /* There is a difference between the text being defined and empty,
         and not defined at all.  The latter is true for 'brace_command_arg'
         elements.  We need either to make sure that we initialize all elements 
         with text_append (&e->text, "") where we want merging with following
         text, or treat as a special case here.
         Unfortunately we can't make a special case for 
         ET_empty_spaces_before_argument, because abort_empty_line above 
         produces such an element that shouldn't be merged with. */
      && (last_child->text.space > 0
            && !strchr (last_child->text.text, '\n')
             ) //|| last_child->type == ET_empty_spaces_before_argument)
      && last_child->cmd != CM_value
      && !no_merge_with_following_text)
    {
      /* Append text to contents */
      text_append (&last_child->text, text);
      debug ("MERGED TEXT: %s|||", text);
    }
  else
    {
      ELEMENT *e = new_element (ET_NONE);
      text_append (&e->text, text);
      add_to_element_contents (current, e);
      debug ("NEW TEXT: %s|||", text);
    }

  return current;
}

/* 2106 */
int
abort_empty_line (ELEMENT **current_inout, char *additional_text)
{
  ELEMENT *current = *current_inout;
  int retval;

  ELEMENT *last_child = last_contents_child (current);

  if (!additional_text)
    additional_text = "";

  if (last_child
      && (last_child->type == ET_empty_line
          || last_child->type == ET_empty_line_after_command
          || last_child->type == ET_empty_spaces_before_argument
          || last_child->type == ET_empty_spaces_after_close_brace))
    {
      debug ("ABORT EMPTY %s additional text |%s| "
             "current |%s|",
             element_type_name(last_child),
             additional_text,
             last_child->text.text);
      text_append (&last_child->text, additional_text);

      /* Remove element altogether if it's empty. */
      if (last_child->text.end == 0) //2121
        {
          KEY_PAIR *k = 0; ELEMENT *e;
          
          /* Remove extra key from either from current or current->parent.  */
          if (current)
            k = lookup_extra_key (current, "spaces_before_argument");
          if (k && k->value == last_contents_child (current))
            {
              k->key = "";
              k->value = 0;
              k->type = extra_deleted;
            }
          else if (current->parent)
            {
              k = lookup_extra_key (current->parent, "spaces_before_argument");
              if (k && k->value == last_contents_child (current))
                {
                  k->key = "";
                  k->value = 0;
                  k->type = extra_deleted;
                }
            }

          if (current)
            k = lookup_extra_key (current, "spaces_after_command");
          if (k && k->value == last_contents_child(current))
            {
              k->key = "";
              k->value = 0;
              k->type = extra_deleted;
            }
          else if (current->parent)
            {
              k = lookup_extra_key (current->parent, "spaces_after_command");
              if (k && k->value == last_contents_child (current))
                {
                  k->key = "";
                  k->value = 0;
                  k->type = extra_deleted;
                }
            }

          e = pop_element_from_contents (current);
          e->parent = 0; e->parent_type = route_not_in_tree;
          destroy_element (e);
          /* TODO: Maybe we could avoid adding it in the first place? */
        }
      else if (last_child->type == ET_empty_line) //2132
        {
          last_child->type = begin_paragraph_p (current)
                             ? ET_empty_spaces_before_paragraph : ET_NONE;
        }
      else if (last_child->type == ET_empty_line_after_command)
        {
          last_child->type = ET_empty_spaces_after_command;
        }
      retval = 1;
    }
  else
    retval = 0;

  *current_inout = current;
  return retval;
}

/* 2149 */
/* Split any trailing whitespace on the last contents child of CURRENT into
   its own element, ET_spaces_at_end by default.
  
   This is used for the argument to a line command, and for the arguments to a 
   brace command taking a given number of arguments.

   This helps with argument parsing as there will be no leading or trailing 
   spaces.

   Also, "to help expansion disregard unuseful spaces".  Could that mean
   macro expansion? */
void
isolate_last_space (ELEMENT *current, enum element_type element_type)
{
  ELEMENT *last = last_contents_child (current);

  if (!element_type)
    element_type = ET_spaces_at_end;

  if (last)
    {
      int index = -1;
      ELEMENT *indexed_elt;

      /* If a "misc" (i.e. line) command is last on line, isolate the space in 
         the element before it.  This covers the case of a "@c" at the end
         of a line. */
      if (element_contents_number (current) > 1)
        {
          if (last->cmd)
            {
              if (command_flags(last) & CF_misc)
                index = -2;
            }
        }

      indexed_elt = contents_child_by_index (current, index);
      if (indexed_elt)
        {
          char *text = element_text (indexed_elt);
          if (!text || !*text)
            return;

          if (indexed_elt->type == ET_NONE)
            {
              int text_len = strlen (text);
              /* 2170 */
              /* Does the text end in whitespace? */
              if (strchr (whitespace_chars, text[text_len - 1]))
                {
                  /* If text all whitespace */
                  if (text[strspn (text, whitespace_chars)] == '\0')
                    indexed_elt->type = element_type;
                  else
                    {
                      /* 2173 */
                      ELEMENT *new_spaces;
                      int i, trailing_spaces;

                      /* "strrcspn" */
                      trailing_spaces = 0;
                      for (i = strlen (text) - 1;
                           i > 0 && strchr (whitespace_chars, text[i]);
                           i--)
                        trailing_spaces++;
                      
                      new_spaces = new_element (element_type);
                      text_append_n (&new_spaces->text,
                                     text + text_len - trailing_spaces,
                                     trailing_spaces);
                      text[text_len - trailing_spaces] = '\0';
                      indexed_elt->text.end -= trailing_spaces;

                      if (index == -1)
                        add_to_element_contents (current, new_spaces);
                      else
                        insert_into_contents (current, new_spaces, -1);
                    }
                }
            }
        }
    }
}

// 5467, also in Common.pm 1334
/* Return a new element whose contents are the same as those of ORIGINAL,
   but with some elements representing empty spaces removed.  Elements like 
   these are used to represent some of the "content" extra keys. */
ELEMENT *
trim_spaces_comment_from_content (ELEMENT *original)
{
  ELEMENT *trimmed;
  int i, j, k;
  enum element_type t;

  trimmed = new_element (ET_NONE);
  trimmed->parent_type = route_not_in_tree;

  if (original->contents.number == 0)
    return trimmed;

  i = 1;
  t = original->contents.list[0]->type;
  if (t != ET_empty_line_after_command
      && t != ET_empty_spaces_after_command
      && t != ET_empty_spaces_before_argument
      && t != ET_empty_space_at_end_def_bracketed
      && t != ET_empty_spaces_after_close_brace)
    i = 0;

  for (j = original->contents.number - 1; j >= 0; j--)
    {
      enum element_type t = original->contents.list[j]->type;
      if (original->contents.list[j]->cmd != CM_c
          && original->contents.list[j]->cmd != CM_comment
          && t != ET_spaces_at_end
          && t != ET_space_at_end_block_command)
        break;
    }
  for (k = i; k <= j; k++)
    {
      add_to_contents_as_array (trimmed, original->contents.list[k]);
    }

  return trimmed;
}


/* 3491 */
/* Add an "ET_empty_line_after_command" element containing the whitespace at 
   the beginning of the rest of the line.  This element can be later changed to 
   a "ET_empty_spaces_after_command" element in 'abort_empty_line' if more
   text follows on the line.  Used after line commands or commands starting
   a block. */
void
start_empty_line_after_command (ELEMENT *current, char **line_inout,
                                ELEMENT *command)
{
  char *line = *line_inout;
  ELEMENT *e;
  int len;

  len = strspn (line, whitespace_chars_except_newline);
  e = new_element (ET_empty_line_after_command);
  add_to_element_contents (current, e);
  text_append_n (&e->text, line, len);
  line += len;

  if (command)
    {
      add_extra_element (e, "command", command);
      add_extra_element (command, "spaces_after_command", e);
    }

  *line_inout = line;
}


/* If the parent element takes a command as an argument, like
   @itemize @bullet. */
int
command_with_command_as_argument (ELEMENT *current)
{
  return current->type == ET_block_line_arg
    && (current->parent->cmd == CM_itemize
        || item_line_command (current->parent->cmd));
//    && (current->contents.number == 1);
  //    || current->contents.number == 2 and the first child's text is
  // all non-whitespace characters??
}

// 3633
/* If INVALID_PARENT is defined, then that command was used in the input
   document and contained, incorrectly, a COMMAND command. Issue
   a warning message. */
void
mark_and_warn_invalid (enum command_id command,
                       enum command_id invalid_parent,
                       ELEMENT *marked_as_invalid_command)
{
  if (invalid_parent)
    {
      line_warn ("@%s should not appear in @%s",
                 command_name(command),
                 command_name(invalid_parent));
      if (marked_as_invalid_command)
        add_extra_string (marked_as_invalid_command, "invalid_nesting", "1");
    }
}

/* Used at line 3755 */
/* Check if line is "@end ..." for current command.  If so, advance LINE. */
int
is_end_current_command (ELEMENT *current, char **line,
                        enum command_id *end_cmd)
{
  char *linep;
  char *cmdname;

  linep = *line;

  linep += strspn (linep, whitespace_chars);
  if (!looking_at (linep, "@end"))
    return 0;

  linep += 4;
  if (!strchr (whitespace_chars, *linep))
    return 0;

  linep += strspn (linep, whitespace_chars);
  if (!*linep)
    return 0;

  cmdname = read_command_name (&linep);
  *end_cmd = lookup_command (cmdname);
  free (cmdname);
  if (*end_cmd != current->cmd)
    return 0;

  *line = linep;
  return 1;
}

#define GET_A_NEW_LINE 0
#define STILL_MORE_TO_PROCESS 1
#define FINISHED_TOTALLY 2

/* line 3725 */
/* *LINEP is a pointer into the line being processed.  It is advanced past any
   bytes processed.  Return 0 when we need to read a new line. */
int
process_remaining_on_line (ELEMENT **current_inout, char **line_inout)
{
  ELEMENT *current = *current_inout;
  char *line = *line_inout;
  char *line_after_command;
  int retval = 1; /* Return value of function */
  enum command_id end_cmd;
  char *p;

  enum command_id cmd = CM_NONE;

  /********* BLOCK_raw or (ignored) BLOCK_conditional ******************/
  /* If in raw block, or ignored conditional block. */
  // 3727
  if (command_flags(current) & CF_block
      && (command_data(current->cmd).data == BLOCK_raw
          || command_data(current->cmd).data == BLOCK_conditional))
    { /* 3730 */
      /* Check if we are using a macro within a macro. */
      if (current->cmd == CM_macro || current->cmd == CM_rmacro)
        {
          enum command_id cmd = 0;
          char *p = line;
          p += strspn (p, whitespace_chars);
          if (!strncmp (p, "@macro", strlen ("@macro")))
            {
              p += strlen ("@macro");
              cmd = CM_macro;
            }
          else if (!strncmp (p, "@rmacro", strlen ("@rmacro")))
            {
              p += strlen ("@rmacro");
              cmd = CM_rmacro;
            }
          if (cmd)
            {
              ELEMENT *e = new_element (ET_NONE);
              e->cmd = cmd;
              line = p;
              add_to_element_contents (current, e);
              add_extra_string (e, "arg_line", strdup (line));
              current = e;
              retval = GET_A_NEW_LINE;
              goto funexit;
            }
        }

      /* Else check for nested @ifset (so that @end ifset doesn't
         end the outermost @ifset). */
      if (current->cmd == CM_ifclear || current->cmd == CM_ifset
          || current->cmd == CM_ifcommanddefined
          || current->cmd == CM_ifcommandnotdefined)
        {
          ELEMENT *e;
          char *p = line;
          p += strspn (p, whitespace_chars);
          if (*p == '@'
              && !strncmp (p + 1, command_name(current->cmd),
                           strlen (command_name(current->cmd))))
            {
              line = p + 1;
              p += strlen (command_name(current->cmd));
              e = new_element (ET_NONE);
              e->cmd = current->cmd;
              add_extra_string (e, "line", strdup (line));
              add_to_element_contents (current, e);
              current = e;
              retval = GET_A_NEW_LINE;
              goto funexit;
            }
        }

      /* 3755 Else check if line is "@end ..." for current command. */
      p = line;
      if (is_end_current_command (current, &line, &end_cmd))
        {
          ELEMENT *last_child;
          ELEMENT *raw_command = current;
          char *tmp = 0;

          last_child = last_contents_child (current);
           
          if (strchr (whitespace_chars, *p))
            {
              ELEMENT *e;
              int n = strspn (line, whitespace_chars);
              e = new_element (ET_raw);
              text_append_n (&e->text, line, n);
              line += n;
              line_warn ("@end %s should only appear at the "
                         "beginning of a line", command_name(end_cmd));
            }
          else if (last_child
                   && last_child->type == ET_raw
                   && current->cmd != CM_verbatim)
            {
              if (last_child->text.end > 0
                  && last_child->text.text[last_child->text.end - 1] == '\n')
                {
                  ELEMENT *lrn;
                  last_child->text.text[--last_child->text.end] = '\0';
                  lrn = new_element (ET_last_raw_newline);
                  text_append (&lrn->text, "\n");
                  add_to_element_contents (current, lrn);
                }
            }

          // 3779
          /* 'line' is now advanced past the "@end ...".  Check if
             there's anything after it. */
          p = line + strspn (line, whitespace_chars);
          if (*p && *p != '@')
            goto superfluous_arg;
          if (*p)
            {
              p++;
              tmp = read_command_name (&p);
              if (tmp && (!strcmp (tmp, "c") || !strcmp (tmp, "comment")))
                {
                }
              else if (*p && p[strspn (p, whitespace_chars)])
                {
superfluous_arg:
                  line_warn ("superfluous argument to @end %s: %s",
                             command_name (current->cmd), line);
                }
              free (tmp);
            }
          

          /* For macros, define a new macro (unless we are in a nested
             macro definition). */
          if ((end_cmd == CM_macro || end_cmd == CM_rmacro)
              && (!current->parent
                  || (current->parent->cmd != CM_macro
                      && current->parent->cmd != CM_rmacro)))
            {
              char *name;
              enum command_id existing;
              if (current->args.number > 0)
                {
                  name = element_text (args_child_by_index (current, 0));

                  existing = lookup_command (name);
                  if (existing)
                    {
                      MACRO *macro;
                      macro = lookup_macro (existing);
                      if (macro)
                        {
                          line_error_ext (1, &current->line_nr,
                             "macro `%s' previously defined", name);
                          line_error_ext (1, &macro->element->line_nr,
                             "here is the previous definition of `%s'", name);
                        }
                      else if (!(existing & USER_COMMAND_BIT))
                        {
                          line_error_ext (1, &current->line_nr,
                            "redefining Texinfo language command: @%s",
                            name);
                        }
                    }
                  if (!lookup_extra_key (current, "invalid_syntax"))
                    {
                      new_macro (name, current); // 3808
                    }
                }
            }

          current = current->parent;

          /* Check for conditionals. */
          if (command_data(end_cmd).flags & CF_block
              && command_data(end_cmd).data == BLOCK_conditional)
            {
              // 3813 Remove an ignored block.
              ELEMENT *popped;
              popped = pop_element_from_contents (current);
              if (popped->cmd != end_cmd)
                abort(); //error
              destroy_element_and_children (popped);

              /* Ignore until end of line */
              if (!strchr (line, '\n'))
                {
                  debug ("IGNORE CLOSE LINE");
                  line = new_line ();
                }
              debug ("CLOSED conditional %s", command_name(end_cmd));
              retval = GET_A_NEW_LINE;
              goto funexit;
            }
          else
            {
              ELEMENT *e;
              int n;

              debug ("CLOSED raw %s", command_name(end_cmd)); // 3830
              e = new_element (ET_empty_line_after_command);
              n = strspn (line, whitespace_chars_except_newline);
              text_append_n (&e->text, line, n);
              line += n;
              add_extra_element (e, "command", raw_command);
              add_to_element_contents (current, e);
            }
        }
      else /* 3833 save the line verbatim */
        {
          ELEMENT *last = last_contents_child (current);
          /* Append to existing element only if the text is all
             whitespace.  */
          if (last && last->type == ET_empty_line_after_command
              && line[strspn (line, whitespace_chars)] == '\0'
              && !strchr (last->text.text, '\n'))
            {
              text_append (&last->text, line);
            }
          else
            {
              ELEMENT *e;
              e = new_element (ET_raw);
              text_append (&e->text, line);
              add_to_element_contents (current, e);
            }

          retval = GET_A_NEW_LINE; /* 3844 */
          goto funexit;
        }
    } /********* BLOCK_raw or (ignored) BLOCK_conditional 3897 *************/

  /* Check if parent element is 'verb' */
  else if (current->parent && current->parent->cmd == CM_verb) /* 3847 */
    {
      char c;
      char *q;

      c = (char) current->parent->type;
      if (c)
        {
          /* Look forward for the delimiter character followed by a close
             brace. */
          q = line;
          while (1)
            {
              q = strchr (q, c);
              if (!q || q[1] == '}')
                break;
              q++;
            }
        }
      else
        {
          /* Look forward for a close brace. */
          q = strchr (line, '}');
        }

      if (q)
        {
          /* Save up to the delimiter character. */
          if (q != line)
            {
              ELEMENT *e = new_element (ET_raw);
              text_append_n (&e->text, line, q - line);
              add_to_element_contents (current, e);
            }
          debug ("END VERB");
          if (c)
            line = q + 1;
          else
            line = q;
          /* The '}' will close the @verb command in handle_separator below. */
        }
      else
        {
          /* Save the rest of line. */
          ELEMENT *e = new_element (ET_raw);
          text_append (&e->text, line);
          add_to_element_contents (current, e);

          debug_nonl ("LINE VERB: %s", line);

          retval = GET_A_NEW_LINE; goto funexit;  /* Get next line. */
        }
    } /* CM_verb */

  /* Skip empty lines.  If we reach the end of input, continue in case there
     is an @include. */

  /* There are cases when we need more input, but we don't want to
     get it in the top-level loop in parse_texi - this is mostly
     (always?) when we don't want to start a new, empty line, and
     need to get more from the current, incomplete line of input. */
  // 3878
  while (*line == '\0')
    {
      static char *allocated_text;
      debug ("EMPTY TEXT");

      /* Each place we supply Texinfo input we store the supplied
         input in a static variable like allocated_text, to prevent
         memory leaks.  */
      free (allocated_text);
      line = allocated_text = next_text ();

      if (!line)
        {
          /* TODO: Can this only happen at end of file? */
          current = end_line (current);
          retval = GET_A_NEW_LINE;
          goto funexit;
        }
    }

  if (*line == '@')
    {
      line_after_command = line + 1;

      /* List of single character Texinfo commands. */
      if (strchr ("([\"'~@}{,.!?"
                  " \f\n\r\t"
                  "*-^`=:|/\\",
              *line_after_command))
        {
          char single_char[2];
          single_char[0] = *line_after_command++;
          single_char[1] = '\0';
          cmd = lookup_command (single_char);
        }
      else
        {
          char *command = read_command_name (&line_after_command);

          if (command)
            {
              cmd = lookup_command (command);
              if (!cmd)
                {
                  line_error ("unknown command `%s'", command); // 4877
                  line = line_after_command;
                  debug ("COMMAND (UNKNOWN) %s", command);
                }
            }
          free (command);
          if (!cmd)
            {
              ELEMENT *paragraph;
              // 4226
              abort_empty_line (&current, 0);

              // 4276
              paragraph = begin_paragraph (current);
              if (paragraph)
                current = paragraph;
              //goto funexit;
            }
        }
      if (cmd && (command_data(cmd).flags & CF_ALIAS))
        cmd = command_data(cmd).data;
    }

  /* Handle user-defined macros before anything else because their expansion 
     may lead to changes in the line. */
  if (cmd && (command_data(cmd).flags & CF_MACRO)) // 3894
    {
      static char *allocated_line;
      line = line_after_command;
      current = handle_macro (current, &line, cmd);
      free (allocated_line);
      allocated_line = next_text ();
      line = allocated_line;
    }

  /* 3983 Cases that may "lead to command closing": brace commands that don't 
     need a brace: accent commands.
     @definfoenclose. */
  /* This condition is only checked immediately after the command opening, 
     otherwise the current element is in the 'args' and not right in the 
     command container. */
  else if (command_flags(current) & CF_brace && *line != '{')
    {
      if (command_with_command_as_argument (current->parent)) // 3988
        {
          debug ("FOR PARENT @%s command_as_argument @%s",
                 command_name(current->parent->parent->cmd),
                 command_name(current->cmd));
          if (!current->type)
            current->type = ET_command_as_argument;
          add_extra_element (current->parent->parent, 
                                 "command_as_argument", current);
          current = current->parent;
        }
      else if (command_flags (current) & CF_accent) // 3996 - accent commands
        {
          if (strchr (whitespace_chars_except_newline, *line))
            {
              if (isalpha (command_name(current->cmd)[0]))
              /* e.g. @dotaccent */
                {
                  char *p; char *s;
                  KEY_PAIR *k;
                  p = line + strspn (line, whitespace_chars_except_newline);
                  k = lookup_extra_key (current, "spaces");
                  if (!k)
                    {
                      asprintf (&s, "%.*s", (int) (p - line), line);
                      add_extra_string (current, "spaces", s);
                    }
                  else
                    {
                      asprintf (&s, "%s%.*s",
                                (char *) k->value,
                                (int) (p - line), p);
                      free (k->value);
                      k->value = (ELEMENT *) s;
                    }
                  line = p;
                }
              else
                {
                  line_warn ("accent command `@%s' must not be followed "
                             "by whitespace", command_name(current->cmd));
                  current = current->parent;
                }
            }
          else if (*line == '@')
            {
              line_error ("use braces to give a command as an argument "
                          "to @%s", command_name(current->cmd));
              current = current->parent;
            }
          else if (*line != '\0' && *line != '\n' && *line != '\r')
            {
              ELEMENT *e, *e2;
              debug ("ACCENT");
              e = new_element (ET_following_arg);
              add_to_element_args (current, e);
              e2 = new_element (ET_NONE);
              text_append_n (&e2->text, line, 1);
              add_to_element_contents (e, e2);

              if (current->cmd == CM_dotless
                  && *line != 'i' && *line != 'j')
                {
                  line_error ("@dotless expects `i' or `j' as argument, "
                              "not `%c'", *line);
                }
              if (isalpha (command_name(current->cmd)[0]))
                e->type = ET_space_command_arg;
              while (current->contents.number > 0)
                destroy_element (pop_element_from_contents (current));
              line++;
              current = current->parent;
            }
          else // 4032
            {
              debug ("STRANGE ACC");
              line_warn ("accent command `@%s' must not be followed by "
                         "new line", command_name(current->cmd));
              current = current->parent;
            }
          goto funexit;
        }
      else // 4041
        {
          /* TODO: Check 'IGNORE_SPACES_AFTER_BRACED_COMMAND_NAME' config
             variable. */
          if (1)
            {
              char *p;
              p = line + strspn (line, whitespace_chars);
              if (p != line)
                {
                  line = p;
                  goto funexit;
                }
            }
          line_error ("@%s expected braces",
                       command_name(current->cmd));
          current = current->parent;
        }
    }
  else if (handle_menu (&current, &line))
    {
      ; /* Nothing - everything was done in handle_menu. */
    }

  /* line 4161 */
  /* Any other @-command. */
  else if (cmd)
    {
      enum command_id invalid_parent = 0;
      line = line_after_command;
      debug ("COMMAND %s", command_name(cmd));

      /* 4172 @value */
      if (cmd == CM_value)
        {
          char *arg_start;
          line += strspn (line, whitespace_chars);
          if (*line != '{')
            goto value_invalid;

          line++;
          if (!isalnum (*line) && *line != '-' && *line != '_')
            {
              line--;
              goto value_invalid;
            }
          arg_start = line;

          line++;
          line = strpbrk (line,
                   " \t\f\r\n"       /* whitespace */
                   "{\\}~^+\"<>|@"); /* other bytes that aren't allowed */
          if (*line != '}')
            {
              line = arg_start - 1;
              goto value_invalid;
            }

          if (1) /* @value syntax is valid */
            {
              char *value;
value_valid:
              value = fetch_value (arg_start, line - arg_start);
              if (!value)
                {
                  /* Add element for unexpanded @value.
                     This is not necessarily an error - in
                     Texinfo::Report::gdt we deliberately pass
                     in undefined values. */
                  ELEMENT *value_elt;

                  line_warn ("undefined flag: %.*s", line - arg_start, 
                             arg_start);

                  abort_empty_line (&current, NULL);
                  value_elt = new_element (ET_NONE);
                  value_elt->cmd = CM_value;
                  text_append_n (&value_elt->text, arg_start,
                                 line - arg_start);
                  /* In the Perl code, the name of the flag is stored in
                     the "type" field.  We need to store in 'text' instead
                     and then output it as the type in
                     dump_perl.c / api.c. */

                  add_to_element_contents (current, value_elt);

                  line++; /* past '}' */
                  retval = STILL_MORE_TO_PROCESS;
                }
              else
                {
                  line++; /* past '}' */
                  input_push_text (strdup (line), line_nr.macro);
                  input_push_text (strdup (value), 0);
                  line += strlen (line);
                  retval = STILL_MORE_TO_PROCESS;
                }
              goto funexit;
            }
          else
            {
value_invalid:
              line_error ("bad syntax for @value");
              retval = STILL_MORE_TO_PROCESS;
              goto funexit;
            }
        }

      /* Warn on deprecated command */
      if (command_data(cmd).flags & CF_deprecated)
        {
          line_warn ("@%s is obsolete.", command_name(cmd));
        }

      /* warn on not appearing at line beginning 4226 */
      // begin line commands 315
      // TODO maybe have a command flag for this
      if (!abort_empty_line (&current, NULL)
          && ((cmd == CM_node || cmd == CM_bye)
              || (command_data(cmd).flags & CF_block)
              || ((command_data(cmd).flags & CF_misc)
                  && cmd != CM_comment
                  && cmd != CM_c
                  && cmd != CM_sp
                  && cmd != CM_refill
                  && cmd != CM_noindent
                  && cmd != CM_indent
                  && cmd != CM_columnfractions
                  && cmd != CM_tab
                  && cmd != CM_item
                  && cmd != CM_headitem
                  && cmd != CM_verbatiminclude
                  && cmd != CM_set
                  && cmd != CM_clear
                  && cmd != CM_vskip
                  && !(command_data(cmd).flags & CF_in_heading))))
        {
          line_warn ("@%s should only appear at the beginning of a line", 
                     command_name(cmd));
        }

      /* 4233 invalid nestings */
      if (current->parent)
        {
          /* Check whether outer command can contain cmd.  Commands are
             classified according to what commands they can contain:

             accents
             full text
             simple text
             full line
             full line no refs

           */

          int ok = 0; /* Whether nesting is allowed. */

          /* Whether command is a "simple text" command.  Use a variable
             to avoid repeating a complex conditional. */
          int simple_text_command = 0;

          enum command_id outer = current->parent->cmd;
          unsigned long outer_flags = command_data(outer).flags;
          unsigned long cmd_flags = command_data(cmd).flags;

          // much TODO here.

          /* 409 "simple text commands" */
          if ((outer_flags & CF_misc
                    && (command_data(outer).data >= 0
                        || (command_data(outer).data == MISC_line
                            && !(outer_flags & (CF_def | CF_sectioning)))
                        || command_data(outer).data == MISC_text)
                    && outer != CM_center
                    && outer != CM_exdent) // 423
              || outer == CM_titlefont // 425
              || outer == CM_anchor
              || outer == CM_xref
              || outer == CM_ref
              || outer == CM_pxref
              || outer == CM_inforef
              || outer == CM_shortcaption
              || outer == CM_math
              || outer == CM_indicateurl
              || outer == CM_email
              || outer == CM_uref
              || outer == CM_url
              || outer == CM_image
              || outer == CM_abbr
              || outer == CM_acronym
              || outer == CM_dmn
              || (outer_flags & CF_index_entry_command) // 563
              || (outer_flags & CF_block // 475
                  && !(outer_flags & CF_def)
                  && command_data(outer).data != BLOCK_raw
                  && command_data(outer).data != BLOCK_conditional))
            {
              simple_text_command = 1;
            }

          if (outer_flags & CF_root && current->type != ET_misc_line_arg)
            ok = 1; // 4242
          else if (outer_flags & CF_block
                   && current->type != ET_block_line_arg)
            ok = 1; // 4247
          else if ((outer == CM_item
                   || outer == CM_itemx)
                   && current->type != ET_misc_line_arg)
            ok = 1; // 4252
          else if (outer_flags & CF_accent) // 358
            {
              if (cmd_flags & (CF_nobrace | CF_accent))
                ok = 1;
              else if (cmd_flags & CF_brace
                       && command_data(cmd).data == 0)
                ok = 1; /* glyph command */
              if (cmd == CM_c || cmd == CM_comment)
                ok = 1;
            }


          else if (outer == CM_ctrl
                   || outer == CM_errormsg)
            {
              ok = 0;
            }
          // 432 "full text commands"
          else if ((outer_flags & CF_brace
                     && ((outer_flags & CF_inline)
                         || command_data(outer).data == BRACE_style))

          // 445 "full line commands"
                   || outer == CM_center
                   || outer == CM_exdent
                   || outer == CM_item
                   || outer == CM_itemx

                   || (!current->parent->cmd && current_context () == ct_def)

          // 420 "full line no refs commands"
                   || (outer_flags & (CF_sectioning | CF_def))
          // 4261
                   || (!current->parent->cmd && current_context () == ct_def)

          // 409 "simple text commands"
                   || simple_text_command)
            {
              // "in full text commands".
              if (cmd_flags & CF_nobrace) // 370
                ok = 1;
              if (cmd_flags & CF_brace && !(cmd_flags & CF_INFOENCLOSE)) // 370
                ok = 1;
              else if (cmd == CM_c
                       || cmd == CM_comment
                       || cmd == CM_refill
                       || cmd == CM_noindent
                       || cmd == CM_indent
                       || cmd == CM_columnfractions
                       || cmd == CM_set
                       || cmd == CM_clear
                       || cmd == CM_end) // 373
                ok = 1;
              else if (cmd_flags & CF_format_raw)
                ok = 1; // 379
              if (cmd == CM_caption || cmd == CM_shortcaption)
                ok = 0; // 381
              if (cmd_flags & CF_block
                  && command_data(cmd).data == BLOCK_conditional)
                ok = 1; // 384

              // 390 exceptions for all of "full line commands",
              //     "full line commands no refs" and "simple text commands"
             if (!(outer_flags & CF_brace
                     && (command_data(outer).data == 1)))
                {
                  if (cmd == CM_indent || cmd == CM_noindent)
                    ok = 0;
                }

              // 396 exceptions for "full line no refs" and "simple text"
              if (outer_flags & (CF_sectioning | CF_def)
                  // 4261
                  || (!current->parent->cmd && current_context () == ct_def)
                  || simple_text_command)
                {
                  if (cmd == CM_titlefont
                      || cmd == CM_anchor
                      || cmd == CM_footnote
                      || cmd == CM_verb
                      || cmd == CM_indent || cmd == CM_noindent)
                    ok = 0;
                }

              // 405 exceptions for "simple text commands" only
              if (simple_text_command)
                {
                  if (cmd == CM_xref
                      || cmd == CM_ref
                      || cmd == CM_pxref
                      || cmd == CM_inforef) // 404
                    ok = 0;
                }
            }
          else
            {
              /* Default to valid nesting, for example for commands for which 
                 it is not defined which commands can occur within them (e.g. 
                 @tab?). */
              ok = 1;
            }

          if (!ok)
            {
              invalid_parent = current->parent->cmd;
              if (!invalid_parent)
                {
                  /* current_context () == ct_def.  Find def block containing 
                     command.  4258 */
                  ELEMENT *d = current;
                  while (d->parent
                         && d->parent->type != ET_def_line)
                    d = d->parent;
                  invalid_parent = d->parent->parent->cmd;
                }
            }
        }

      /* 4274 */
      if (current_context () == ct_def && cmd == CM_NEWLINE)
        {
          retval = GET_A_NEW_LINE;
          goto funexit;
        }

      /* 4276 check command doesn't start a paragraph */
      /* TODO store this in cmd->flags.  Or better, change the meaning
         of CF_misc. */
      if (!(command_data(cmd).flags & (CF_misc | CF_block)
            || cmd == CM_titlefont
            || cmd == CM_caption
            || cmd == CM_shortcaption
            || cmd == CM_image
            || cmd == CM_ASTERISK /* @* */
            || cmd == CM_hyphenation
            || cmd == CM_anchor
            || cmd == CM_errormsg
            || (command_data(cmd).flags & CF_index_entry_command)))
          {
          /*
             Unless no paragraph commands (line 311):
             All misc commands
             All block commands
             'titlefont', 'caption', 'shortcaption',
             'image', '*', 'hyphenation', 'anchor', 'errormsg'
             Index commands
           */

          ELEMENT *paragraph;
          paragraph = begin_paragraph (current);
          if (paragraph)
            current = paragraph;
        }

      // 4281
      if (cmd != 0)
        {
          if (close_paragraph_command (cmd))
            current = end_paragraph (current, 0, 0);
          if (close_preformatted_command (cmd))
            current = end_preformatted (current, 0, 0);
        }

      if (cmd == 0)
        {
          // 4287 Unknown command
          retval = 1;
          goto funexit;
        }
      /* line 4289 */
      /* the 'misc-commands' - no braces and not block commands (includes
         @end).  Mostly taking a line argument, except for a small number
         of exceptions, like @tab. */
      else if (command_data(cmd).flags & CF_misc)
        {
          int status;
          current = handle_misc_command (current, &line, cmd, &status,
                                         invalid_parent);
          if (status == 1)
            {
              retval = GET_A_NEW_LINE;
              goto funexit;
            }
          else if (status == 2)
            {
              retval = FINISHED_TOTALLY;
              goto funexit;
            }
        }

      /* line 4632 */
      else if (command_data(cmd).flags & CF_block)
        {
          int new_line = 0;
          current = handle_block_command (current, &line, cmd, &new_line,
                                          invalid_parent);
          if (new_line)
            {
              /* For @macro, to get a new line.  This is done instead of
                 doing the EMPTY TEXT (3879) code on the next time round. */
              retval = GET_A_NEW_LINE; goto funexit;
            }
        }

      else if (command_data(cmd).flags & CF_brace
               || command_data(cmd).flags & CF_accent) /* line 4835 */
        {
          current = handle_brace_command (current, &line,
                                          cmd, invalid_parent);
        }

      /* No-brace command */
      else if (command_data(cmd).flags & CF_nobrace) /* 4864 */
        {
          ELEMENT *nobrace;

          nobrace = new_element (ET_NONE);
          nobrace->cmd = cmd;
          add_to_element_contents (current, nobrace);

          if (cmd == CM_BACKSLASH && current_context () != ct_math)
            {
              line_warn ("@\\ should only appear in math context");
            }
          if (cmd == CM_NEWLINE)
            {
              current = end_line (current);
              retval = GET_A_NEW_LINE;
              goto funexit;
            }
        }
#if 0
      else
        {
          /* error: unknown command */
        }
#endif
    }
  /* "Separator" - line 4881 */
  else if (*line != '\0' && strchr ("{}@,:\t.\f", *line))
    {
      char separator = *line++;
      debug ("SEPARATOR: %c", separator);
      if (separator == '@')
        line_error ("unexpected @");
      else
        current = handle_separator (current, separator, &line);
    } /* 5326 */
  /* "Misc text except end of line." */
  else if (*line && *line != '\n') /* 5326 */
    {
      size_t len;
      
      /* Output until next command, separator or newline. */
      {
        char saved; /* TODO: Have a length argument to merge_text? */
        len = strcspn (line, "{}@,:\t.\n\f");
        saved = line[len];
        line[len] = '\0';
        current = merge_text (current, line);
        line += len;
        *line = saved;
      }

      retval = 1;
      goto funexit;
    }
  else /* 5331 End of line */
    {
      if (current->type)
        debug ("END LINE (%s)", element_type_names[current->type]);
      else if (current->cmd)
        debug ("END LINE (@%s)", command_name(current->cmd));
      else
        debug ("END LINE");
      if (current->parent)
        {
          debug_nonl (" <- ");
          if (current->parent->cmd)
            debug_nonl("@%s", command_name(current->parent->cmd));
          if (current->parent->type)
            debug_nonl("(%s)", element_type_names[current->parent->type]);
          debug ("");
          debug ("");
        }

      if (*line == '\n')
        {
          current = merge_text (current, "\n");
          line++;
        }
      else
        ;//abort ();

      /* '@end' is processed in here. */
      current = end_line (current); /* 5344 */
      retval = GET_A_NEW_LINE;
    }

funexit:
  *current_inout = current;
  *line_inout = line;
  return retval;
}

/* Pass in and return root of a "Texinfo tree". */
/* 3676 */
ELEMENT *
parse_texi (ELEMENT *root_elt)
{
  ELEMENT *current = root_elt;
  char *allocated_line = 0, *line;

  /* Read input file line-by-line. */
  while (1)
    {
      free (allocated_line);
      line = allocated_line = next_text ();
      if (!allocated_line)
        break; /* Out of input. */

      debug_nonl ("NEW LINE %s", line);

      // 3706
      /* If not in 'raw' or 'conditional' and parent isn't a 'verb', collect
         leading whitespace and save as an "ET_empty_line" element.  This
         element type can be changed in 'abort_empty_line' when more text is
         read. */
      if (!((command_flags(current) & CF_block)
             && (command_data(current->cmd).data == BLOCK_raw
                 || command_data(current->cmd).data == BLOCK_conditional)
            || current->parent && current->parent->cmd == CM_verb)
          && current_context () != ct_def)
        {
          ELEMENT *e;
          int n;
          
          debug ("BEGIN LINE");
          e = new_element (ET_empty_line);
          add_to_element_contents (current, e);

          n = strspn (line, whitespace_chars_except_newline);
          text_append_n (&e->text, line, n);
          line += n;
        }

      /* Process from start of remaining line, advancing it until we run out
         of line. */
      while (1)
        {
          int status = process_remaining_on_line (&current, &line);
          if (status == GET_A_NEW_LINE)
            break;
          if (status == FINISHED_TOTALLY)
            goto finished_totally;
          if (!line)
            break;
        }
    }
finished_totally:

  /* Check for unclosed conditionals */
  while (conditional_number > 0)
    {
      line_error ("expected @end %s",
                  command_name(conditional_stack[conditional_number - 1]));
      conditional_number--;
    }

    {
      ELEMENT *dummy; // 5254
      current = close_commands (current, CM_NONE, &dummy, CM_NONE);

      /* Make sure we are at the very top - we could have stopped at the "top" 
         element, with "document_root" still to go.  (This happens if the file 
         didn't end with "@bye".) */
      while (current->parent)
        current = current->parent;
    }

  /* Check for "unclosed stacks". */

  return current;
} /* 5372 */



/* 5793 - end of code in Parser.pm */
