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

#define _GNU_SOURCE

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "tree_types.h"
#include "input.h"
#include "text.h"
#include "api.h"

enum input_type { IN_file, IN_text };

typedef struct {
    enum input_type type; /* IN_file or IN_text */

    FILE *file;
    char *filename;

    char *text;  /* Input text to be parsed as Texinfo. */
    char *ptext; /* How far we are through 'text'.  Used to split 'text'
                    into lines. */
    int line_number;
} INPUT;

static INPUT *input_stack = 0;
static size_t input_number = 0;
static size_t input_space = 0;

/* Current filename and line number. */
LINE_NR line_nr;

// 1961
/* Collect text from the input sources until a newline is found.  This is used 
   instead of next_text when we need to be sure we get an entire line of 
   Texinfo input (for example as a line argument to a command), which might not 
   be the case if the input is the result of a macro expansion.

   Return value should not be freed by caller, and becomes invalid after
   a subsequent call. */
char *
new_line (void)
{
  static TEXT t;
  char *new = 0;

  t.end = 0;

  while (1)
    {
      new = next_text ();
      if (!new)
        break;
      text_append (&t, new);
      free (new);

      if (t.text[t.end - 1] == '\n')
        break;
    }

  if (t.end > 0)
    return t.text;
  else
    return 0;
}

/* Return value to be freed by caller.  Return null if we are out of input. */
char *
next_text (void)
{
  ssize_t status;
  char *line = 0;
  size_t n;
  FILE *input_file;

  while (input_number > 0)
    {
      /* Check for pending input. */
      INPUT *i = &input_stack[input_number - 1];

      switch (i->type)
        {
          char *p, *new;
        case IN_text:
          if (!*i->ptext)
            {
              /* End of text reached. */
              free (i->text);
              break;
            }
          p = strchrnul (i->ptext, '\n');
          new = strndup (i->ptext, p - i->ptext + 1);
          if (*p)
            i->ptext = p + 1;
          else
            i->ptext = p; /* The next time, we will pop the input source. */

          if (line_nr.line_nr != -1)
            line_nr.line_nr++;

          return new;
          // what if it doesn't end in a newline ?

          break;
        case IN_file: // 1911
          input_file = input_stack[input_number - 1].file;
          status = getline (&line, &n, input_file);
          while (status != -1)
            {
              char *comment;
              if (feof (input_file))
                ; // Add a newline to the read line if one is missing.

              /* Strip off a comment. */
              comment = strchr (line, '\x7F');
              if (comment)
                {
                  *comment = '\n';
                  comment[1] = '\0';
                }

              /* TODO: convert from @documentencoding to UTF-8, assuming we 
                 want to use UTF-8 internally. */

              /* Could and check for malformed input: see
                 <http://savannah.gnu.org/bugs/?42896>. */

              // 1920 CPP_LINE_DIRECTIVES

              line_nr.line_nr++;
              return line;
            }
          free (line); line = 0;
          break;
        default:
          abort ();
        }

      /* Top input source failed.  Pop it and try the next one. */
      
      if (input_stack[input_number - 1].type == IN_file)
        {
          FILE *file = input_stack[input_number - 1].file;

          if (file != stdin)
            {
              if (fclose (input_stack[input_number - 1].file) == EOF)
                abort (); // error
            }
        }
      input_number--;
      if (input_number > 0 && input_stack[input_number - 1].type == IN_file)
        {
          /* Restore LINE_NR. */
          line_nr.line_nr = input_stack[input_number - 1].line_number;
          line_nr.file_name = input_stack[input_number - 1].filename;
        }
    }
  return 0;
}

static void
save_line_nr (void)
{
  if (input_number == 0)
    return;

  if (input_stack[input_number - 1].type == IN_file)
    {
      input_stack[input_number - 1].line_number = line_nr.line_nr;
    }
}

/* Store TEXT as a source for Texinfo content.  TEXT will be later free'd
   and must be allocated on the heap. */
void
input_push_text (char *text)
{
  save_line_nr ();

  if (input_number == input_space)
    {
      input_space++; input_space *= 1.5;
      input_stack = realloc (input_stack, input_space * sizeof (INPUT));
      if (!input_stack)
        abort ();
    }

  input_stack[input_number].type = IN_text;
  input_stack[input_number].text = text;
  input_stack[input_number].ptext = text;
  input_number++;

  /* TODO: What goes in LINE_NR?  It depends whether this text is the result of 
     a macro expansion, or was pushed back when reading the file preamble. */
}

/* Used in tests - like input_push_text, but the lines from the text have
   line numbers. */
void
input_push_text_with_line_nos (char *text)
{
  input_push_text (text);
  line_nr.line_nr = 0;
  line_nr.file_name = 0;
}


static char **include_dirs;
static size_t include_dirs_number;
static size_t include_dirs_space;

void
add_include_directory (char *filename)
{
  if (include_dirs_number == include_dirs_space)
    {
      include_dirs = realloc (include_dirs,
                              sizeof (char *) * (include_dirs_space += 5));
    }
  include_dirs[include_dirs_number++] = filename;
}

/* Try to open a file called FILENAME, looking for it in the list of include
   directories. */
void
input_push_file (char *filename)
{
  FILE *stream;
  int i;

  save_line_nr ();

  for (i = 0; i < include_dirs_number; i++)
    {
      /* TODO: The Perl code (in Common.pm, 'locate_include_file') handles a 
         volume in a path (like "A:"), possibly more general treatment with 
         File::Spec module. */
      /* Also checks if filename is absolute. */

      char *fullpath;
      asprintf (&fullpath, "%s/%s", include_dirs[i], filename);
      stream = fopen (fullpath, "r");
      free (fullpath);
      if (stream)
        break;
    }

  if (!stream)
    {
      fprintf (stderr, "Could not open %s\n", filename);
      exit (1);
    }

  if (input_number == input_space)
    {
      input_stack = realloc (input_stack, (input_space += 5) * sizeof (INPUT));
      if (!input_stack)
        abort ();
    }

  input_stack[input_number].type = IN_file;
  input_stack[input_number].file = stream;
  input_stack[input_number].filename = filename;
  input_stack[input_number].line_number = 0;
  input_number++;

  line_nr.line_nr = 0;
  line_nr.file_name = filename;

  return;
}

