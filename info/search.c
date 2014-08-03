/* search.c -- searching large bodies of text.
   $Id$

   Copyright 1993, 1997, 1998, 2002, 2004, 2007, 2008, 2009, 2011, 2013,
   2014 Free Software Foundation, Inc.

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
#include <regex.h>

#include "search.h"
#include "nodes.h"

/* The search functions take two arguments:

     1) a string to search for, and

     2) a pointer to a SEARCH_BINDING which contains the buffer, start,
        and end of the search.

   They return a long, which is the offset from the start of the buffer
   at which the match was found.  An offset of -1 indicates failure. */

/* A function which makes a binding with buffer and bounds. */
SEARCH_BINDING *
make_binding (char *buffer, long int start, long int end)
{
  SEARCH_BINDING *binding;

  binding = xmalloc (sizeof (SEARCH_BINDING));
  binding->buffer = buffer;
  binding->start = start;
  binding->end = end;
  binding->flags = 0;

  return binding;
}

/* Make a copy of BINDING without duplicating the data. */
SEARCH_BINDING *
copy_binding (SEARCH_BINDING *binding)
{
  SEARCH_BINDING *copy;

  copy = make_binding (binding->buffer, binding->start, binding->end);
  copy->flags = binding->flags;
  return copy;
}


/* **************************************************************** */
/*                                                                  */
/*                 The Actual Searching Functions                   */
/*                                                                  */
/* **************************************************************** */

/* Search forwards or backwards for the text delimited by BINDING.
   The search is forwards if BINDING->start is greater than BINDING->end. */
enum search_result
search (char *string, SEARCH_BINDING *binding, long *poff)
{
  enum search_result result;

  /* If the search is backwards, then search backwards, otherwise forwards. */
  if (binding->start > binding->end)
    result = search_backward (string, binding, poff);
  else
    result = search_forward (string, binding, poff);

  return result;
}

/* Search forwards or backwards for anything matching the regexp in the text
   delimited by BINDING. The search is forwards if BINDING->start is greater
   than BINDING->end.

   If PEND is specified, it receives a copy of BINDING at the end of a
   succeded search.  Its START and END fields contain bounds of the found
   string instance.

   If WINDOW is specified, pass back the list of matches in WINDOW->matches.
*/
enum search_result
regexp_search (char *regexp, SEARCH_BINDING *binding, 
	       long *poff, SEARCH_BINDING *pend, WINDOW *window)
{
  static regex_t preg; /* Compiled pattern buffer for regexp. */

  /* Store the last regular expression to avoid recompiling. */
  static char *previous_regexp = NULL;
  static int was_insensitive = 0;

  regoff_t start = 0, end;

  /* Remember the last buffer the search was over.  We can optimize by reusing
     the results from last time. */
  static char *previous_content = NULL;
  static long previous_start = 0, previous_end = 0;

  static regmatch_t *matches; /* List of matches. */
  static size_t match_alloc = 0;
  static size_t match_count = 0;

  /* Check if we need to compile a new regexp. */
  if (previous_regexp == NULL
      || (binding->flags & S_FoldCase) != was_insensitive
      || strcmp (previous_regexp, regexp) != 0)
    {
      int result;
      char *unescaped_regexp;
      char *p, *q;

      previous_content = NULL;

      if (previous_regexp != NULL)
        {
          free (previous_regexp);
          previous_regexp = NULL;
          regfree (&preg);
        }

      was_insensitive = binding->flags & S_FoldCase;

      /* expand the \n and \t in regexp */
      unescaped_regexp = xmalloc (1 + strlen (regexp));
      for (p = regexp, q = unescaped_regexp; *p != '\0'; p++, q++)
        {
          if (*p == '\\')
            switch(*++p)
              {
              case 'n':
                *q = '\n';
                break;
              case 't':
                *q = '\t';
                break;
              case '\0':
                *q = '\\';
                p--;
                break;
              default:
                *q++ = '\\';
                *q = *p;
                break;
              }
          else
            *q = *p;
        }
      *q = '\0';

      result = regcomp (&preg, unescaped_regexp,
			REG_EXTENDED|
			REG_NEWLINE|
			(was_insensitive ? REG_ICASE : 0));
      free (unescaped_regexp);

      if (result != 0)
        {
          int size = regerror (result, &preg, NULL, 0);
          char *buf = xmalloc (size);
          regerror (result, &preg, buf, size);
          info_error (_("regexp error: %s"), buf);
          return search_failure;
        }

      previous_regexp = xstrdup (regexp);
    }

  if (binding->start < binding->end)
    {
      start = binding->start;
      end = binding->end;
    }
  else
    {
      start = binding->end;
      end = binding->start;
    }
  
  /* Check if we need to calculate new results. */
  if (binding->buffer != previous_content
      || start < previous_start
      || end > previous_end)
    {
      char saved_char;
      regoff_t offset = start;

      /* Save for next time. */
      previous_content = binding->buffer;
      previous_start = start;
      previous_end = end;

      saved_char = previous_content[end];
      previous_content[end] = '\0';

      for (match_count = 0; offset < end; )
        {
          int result = 0;
          if (match_count == match_alloc)
            {
              /* The match list is full.  Initially allocate 256 entries,
                 then double every time we fill it. */
	      if (match_alloc == 0)
		match_alloc = 256;
	      matches = x2nrealloc (matches, &match_alloc, sizeof matches[0]);
            }

          result = regexec (&preg, &previous_content[offset],
                            1, &matches[match_count], 0);
          if (result == 0)
            {
              if (matches[match_count].rm_eo == 0)
                {
                  /* ignore empty matches */
                  offset++;
                }
              else
                {
                  matches[match_count].rm_so += offset;
                  matches[match_count].rm_eo += offset;
                  offset = matches[match_count++].rm_eo;
                }
            }
          else
	    break;
        }
      previous_content[end] = saved_char;
    }

  /* Pass back the full list of results. */
  if (window)
    {
      window->matches = matches;
      window->match_count = match_count;
    }

  if (binding->start > binding->end)
    {
      /* searching backward */
      int i;
      for (i = match_count - 1; i >= 0; i--)
        {
          if (matches[i].rm_so < start)
            break; /* No matches found in search area. */

          if (matches[i].rm_so < end)
	    {
	      if (pend)
		{
		  pend->buffer = binding->buffer;
		  pend->flags = binding->flags;
		  pend->start = matches[i].rm_so;
		  pend->end = matches[i].rm_eo;
		}
	      *poff = matches[i].rm_so;
	      return search_success;
	    }
        }
    }
  else
    {
      /* searching forward */
      int i;
      for (i = 0; i < match_count; i++)
        {
          if (matches[i].rm_so >= end)
            break; /* No matches found in search area. */

          if (matches[i].rm_so >= start)
            {
	      if (pend)
		{
		  pend->buffer = binding->buffer;
		  pend->flags = binding->flags;
		  pend->start = matches[i].rm_so;
		  pend->end = matches[i].rm_eo;
		}
              if (binding->flags & S_SkipDest)
                *poff = matches[i].rm_eo;
              else
                *poff = matches[i].rm_so;
	      return search_success;
            }
        }
    }

  /* not found */
  return search_not_found;
}

/* Search forwards for STRING through the text delimited in BINDING. */
enum search_result
search_forward (char *string, SEARCH_BINDING *binding, long *poff)
{
  register int c, i, len;
  register char *buff, *end;
  char *alternate = NULL;

  len = strlen (string);

  /* We match characters in the search buffer against STRING and ALTERNATE.
     ALTERNATE is a case reversed version of STRING; this is cheaper than
     case folding each character before comparison.   Alternate is only
     used if the case folding bit is turned on in the passed BINDING. */

  if (binding->flags & S_FoldCase)
    {
      alternate = xstrdup (string);

      for (i = 0; i < len; i++)
        {
          if (islower (alternate[i]))
            alternate[i] = toupper (alternate[i]);
          else if (isupper (alternate[i]))
            alternate[i] = tolower (alternate[i]);
        }
    }

  buff = binding->buffer + binding->start;
  end = binding->buffer + binding->end + 1;

  while (buff < (end - len))
    {
      for (i = 0; i < len; i++)
        {
          c = buff[i];

          if ((c != string[i]) && (!alternate || c != alternate[i]))
            break;
        }

      if (!string[i])
        {
          if (alternate)
            free (alternate);
          if (binding->flags & S_SkipDest)
            buff += len;
          *poff = buff - binding->buffer;
	  return search_success;
        }

      buff++;
    }

  if (alternate)
    free (alternate);

  return search_not_found;
}

/* Search for STRING backwards through the text delimited in BINDING. */
enum search_result
search_backward (char *input_string, SEARCH_BINDING *binding, long *poff)
{
  register int c, i, len;
  register char *buff, *end;
  char *string;
  char *alternate = NULL;

  len = strlen (input_string);

  /* Reverse the characters in the search string. */
  string = xmalloc (1 + len);
  for (c = 0, i = len - 1; input_string[c]; c++, i--)
    string[i] = input_string[c];

  string[c] = '\0';

  /* We match characters in the search buffer against STRING and ALTERNATE.
     ALTERNATE is a case reversed version of STRING; this is cheaper than
     case folding each character before comparison.   ALTERNATE is only
     used if the case folding bit is turned on in the passed BINDING. */

  if (binding->flags & S_FoldCase)
    {
      alternate = xstrdup (string);

      for (i = 0; i < len; i++)
        {
          if (islower (alternate[i]))
            alternate[i] = toupper (alternate[i]);
          else if (isupper (alternate[i]))
            alternate[i] = tolower (alternate[i]);
        }
    }

  buff = binding->buffer + binding->start - 1;
  end = binding->buffer + binding->end;

  while (buff > (end + len))
    {
      for (i = 0; i < len; i++)
        {
          c = *(buff - i);

          if (c != string[i] && (!alternate || c != alternate[i]))
            break;
        }

      if (!string[i])
        {
          free (string);
          if (alternate)
            free (alternate);

          if (binding->flags & S_SkipDest)
            buff -= len;
          *poff = 1 + buff - binding->buffer;
	  return search_success;
        }

      buff--;
    }

  free (string);
  if (alternate)
    free (alternate);

  return search_not_found;
}

/* Find STRING in LINE, returning the offset of the end of the string.
   Return an offset of -1 if STRING does not appear in LINE.  The search
   is bound by the end of the line (i.e., either NEWLINE or 0). */
int
string_in_line (char *string, char *line)
{
  register int end;
  SEARCH_BINDING binding;
  long offset;
  
  /* Find the end of the line. */
  for (end = 0; line[end] && line[end] != '\n'; end++);

  /* Search for STRING within these confines. */
  binding.buffer = line;
  binding.start = 0;
  binding.end = end;
  binding.flags = S_FoldCase | S_SkipDest;

  if (search_forward (string, &binding, &offset) == search_success)
    return offset;
  return -1;
}

/* Return non-zero if STRING is the first text to appear at BINDING. */
int
looking_at (char *string, SEARCH_BINDING *binding)
{
  long search_end;

  if (search (string, binding, &search_end) != search_success)
    return 0;

  /* If the string was not found, SEARCH_END is -1.  If the string was found,
     but not right away, SEARCH_END is != binding->start.  Otherwise, the
     string was found at binding->start. */
  return search_end == binding->start;
}

/* **************************************************************** */
/*                                                                  */
/*                    Small String Searches                         */
/*                                                                  */
/* **************************************************************** */

/* Function names that start with "skip" are passed a string, and return
   an offset from the start of that string.  Function names that start
   with "find" are passed a SEARCH_BINDING, and return an absolute position
   marker of the item being searched for.  "Find" functions return a value
   of -1 if the item being looked for couldn't be found. */

/* Return the index of the first non-whitespace character in STRING. */
int
skip_whitespace (char *string)
{
  register int i;

  for (i = 0; string && whitespace (string[i]); i++);
  return i;
}

/* Return the index of the first non-whitespace or newline character in
   STRING. */
int
skip_whitespace_and_newlines (char *string)
{
  register int i;

  for (i = 0; string && whitespace_or_newline (string[i]); i++);
  return i;
}

/* Return the index of the first whitespace character in STRING. */
int
skip_non_whitespace (char *string)
{
  register int i;

  for (i = 0; string && string[i] && !whitespace (string[i]); i++);
  return i;
}

/* **************************************************************** */
/*                                                                  */
/*                   Searching FILE_BUFFER's                        */
/*                                                                  */
/* **************************************************************** */

/* Return the absolute position of the first occurence of a node separator
   starting in BINDING->buffer.  The search starts at BINDING->start.
   Return -1 if no node separator was found. */
long
find_node_separator (SEARCH_BINDING *binding)
{
  register long i;
  char *body;

  body = binding->buffer;

  /* A node is started by [^L]^_[^L]\n.  That is to say, the C-l's are
     optional, but the DELETE and NEWLINE are not.  This separator holds
     true for all separated elements in an Info file, including the tags
     table (if present) and the indirect tags table (if present). */
  for (i = binding->start; i < binding->end; i++)
      /* Note that bytes are read in order from the buffer, so if at any
         point a null byte is encountered signifying the end of the buffer,
         no more bytes will be read past that point. */
      if (   (body[i] == INFO_FF && body[i + 1] == INFO_COOKIE
              && (body[i + 2] == '\n'
                  || (body[i + 2] == INFO_FF && body[i + 3] == '\n')))
          || (body[i] == INFO_COOKIE
              && (body[i + 1] == '\n'
                  || (body[i + 1] == INFO_FF && body[i + 2] == '\n'))))
          return i;
  return -1;
}

/* Return the length of the node separator characters that BODY is
   currently pointing at. */
int
skip_node_separator (char *body)
{
  register int i;

  i = 0;

  if (body[i] == INFO_FF)
    i++;

  if (body[i++] != INFO_COOKIE)
    return 0;

  if (body[i] == INFO_FF)
    i++;

  if (body[i++] != '\n')
    return 0;

  return i;
}

/* Return the number of characters from STRING to the start of
   the next line. */
int
skip_line (char *string)
{
  register int i;

  for (i = 0; string && string[i] && string[i] != '\n'; i++);

  if (string[i] == '\n')
    i++;

  return i;
}

/* Return the absolute position of the beginning of a tags table in this
   binding starting the search at binding->start. */
long
find_tags_table (SEARCH_BINDING *binding)
{
  SEARCH_BINDING tmp_search;
  long position;

  tmp_search.buffer = binding->buffer;
  tmp_search.start = binding->start;
  tmp_search.end = binding->end;
  tmp_search.flags = S_FoldCase;

  while ((position = find_node_separator (&tmp_search)) != -1 )
    {
      tmp_search.start = position;
      tmp_search.start += skip_node_separator (tmp_search.buffer
          + tmp_search.start);

      if (looking_at (TAGS_TABLE_BEG_LABEL, &tmp_search))
        return position;
    }
  return -1;
}

/* Return the absolute position of the node named NODENAME in BINDING.
   This is a brute force search, and we wish to avoid it when possible.
   This function is called when a tag (indirect or otherwise) doesn't
   really point to the right node.  It returns the absolute position of
   the separator preceding the node. */
long
find_node_in_binding (char *nodename, SEARCH_BINDING *binding)
{
  long position;
  int offset;
  SEARCH_BINDING s;

  s.buffer = binding->buffer;
  s.start = binding->start;
  s.end = binding->end;
  s.flags = 0;

  while ((position = find_node_separator (&s)) != -1)
    {
      char *nodename_start;
      char *read_nodename;

      s.start = position;
      s.start += skip_node_separator (s.buffer + s.start);

      offset = string_in_line (INFO_NODE_LABEL, s.buffer + s.start);

      if (offset == -1)
        continue;

      s.start += offset;
      s.start += skip_whitespace (s.buffer + s.start); 
      nodename_start = s.buffer + s.start;
      read_quoted_string (nodename_start, "\n\t,", 0, &read_nodename);
      if (!read_nodename)
        return -1;

      if (!strcmp (read_nodename, nodename))
        {
          free (read_nodename);
          return position;
        }
    }
  return -1;
}
