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
#include <iconv.h>
#include <errno.h>

#include "tree_types.h"
#include "input.h"
#include "text.h"
#include "api.h"

enum input_type { IN_file, IN_text };

enum character_encoding {
    ce_latin1,
    ce_utf8
};

typedef struct {
    enum input_type type;

    FILE *file;
    enum character_encoding input_encoding;
    LINE_NR line_nr;

    char *text;  /* Input text to be parsed as Texinfo. */
    char *ptext; /* How far we are through 'text'.  Used to split 'text'
                    into lines. */
} INPUT;

static INPUT *input_stack = 0;
int input_number = 0;
int input_space = 0;

/* Current filename and line number.  Used for reporting. */
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


/* TODO: integrate with gnulib */
#define ICONV_CONST

static iconv_t iconv_from_latin1 = (iconv_t) 0;

/* Run iconv using text buffer as output buffer. */
size_t
text_buffer_iconv (TEXT *buf, iconv_t iconv_state,
                   ICONV_CONST char **inbuf, size_t *inbytesleft)
{
  size_t out_bytes_left;
  char *outptr;
  size_t iconv_ret;

  outptr = buf->text + buf->end;
  if (buf->end == buf->space - 1)
    {
      errno = E2BIG;
      return (size_t) -1;
    }
  out_bytes_left = buf->space - buf->end - 1;
  iconv_ret = iconv (iconv_state, inbuf, inbytesleft,
                     &outptr, &out_bytes_left);

  buf->end = outptr - buf->text;

  return iconv_ret;
}



/* Return conversion of S according to ENC.  This function frees S. */
static char *
convert_to_utf8 (char *s, enum character_encoding enc)
{
  iconv_t our_iconv;
  static TEXT t;
  char *inptr; size_t bytes_left;
  size_t iconv_ret;

  /* Convert from @documentencoding to UTF-8.
       It might be possible not to convert to UTF-8 and use an 8-bit encoding
     throughout, but then we'd have to not set the UTF-8 flag on the Perl 
     strings in api.c.  If multiple character encodings were used in a single 
     file, then we'd have to keep track of which strings needed the UTF-8 flag
     and which didn't. */

  /* Could and check for malformed input: see
     <http://savannah.gnu.org/bugs/?42896>. */

  if (iconv_from_latin1 == (iconv_t) 0)
    {
      /* Initialize the conversion for the first time. */
      iconv_from_latin1 = iconv_open ("UTF-8", "ISO-8859-1");
      if (iconv_from_latin1 == (iconv_t) -1)
        {
          abort ();

          /* big trouble.  if we do return it unconverted, we will have to
             remember not to set the UTF-8 flags on the Perl strings, otherwise
             Perl will choke. */
          return s;
        }
    }

  switch (enc)
    {
    case ce_latin1:
      our_iconv = iconv_from_latin1;
      break;
    case ce_utf8:
      return s; /* no conversion required. */
      break;
    }

  t.end = 0;
  inptr = s;
  bytes_left = strlen (s);
  text_alloc (&t, 10);

  while (1)
    {
      iconv_ret = text_buffer_iconv (&t, our_iconv,
                                     &inptr, &bytes_left);

      /* Make sure libiconv flushes out the last converted character.
         This is required when the conversion is stateful, in which
         case libiconv might not output the last character, waiting to
         see whether it should be combined with the next one.  */
      if (iconv_ret != (size_t) -1
          && text_buffer_iconv (&t, our_iconv, 0, 0) != (size_t) -1)
        /* Success: all of input converted. */
        break;

      switch (errno)
        {
        case E2BIG:
          text_alloc (&t, t.space + 20);
          break;
        default:
          abort ();
          break;
        }
    }

  free (s);
  t.text[t.end] = '\0';
  //fprintf (stderr, "CONVERTED STRING IS <<%s>>", t.text);
  return strdup (t.text);
}

int
expanding_macro (char *macro)
{
  int i;
  for (i = 0; i < input_number; i++)
    {
      if (input_stack[i].line_nr.macro
          && !strcmp (input_stack[i].line_nr.macro, macro))
        {
          return 1;
        }
    }
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
          /* Split off a line of input. */
          p = strchrnul (i->ptext, '\n');
          new = strndup (i->ptext, p - i->ptext + 1);
          if (*p)
            i->ptext = p + 1;
          else
            i->ptext = p; /* The next time, we will pop the input source. */

          if (!i->line_nr.macro)
            i->line_nr.line_nr++;

          line_nr = i->line_nr;

          return convert_to_utf8 (new, 0); // i->input_encoding);

          break;
        case IN_file: // 1911
          input_file = input_stack[input_number - 1].file;
          status = getline (&line, &n, input_file);
          while (status != -1)
            {
              char *comment;
              if (feof (input_file))
                {
                  /* Add a newline at the end of the file if one is missing. */
                  char *line2;
                  asprintf (&line2, "%s\n", line);
                  free (line);
                  line = line2;
                }

              /* Strip off a comment. */
              comment = strchr (line, '\x7F');
              if (comment)
                *comment = '\0';

              // 1920 CPP_LINE_DIRECTIVES

              i->line_nr.line_nr++;
              line_nr = i->line_nr;

              return convert_to_utf8 (line, 0); // i->input_encoding);
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
    }
  return 0;
}

void
input_push (char *text, char *macro, char *filename, int line_number)
{
  if (input_number == input_space)
    {
      input_space++; input_space *= 1.5;
      input_stack = realloc (input_stack, input_space * sizeof (INPUT));
      if (!input_stack)
        abort ();
    }

  input_stack[input_number].type = IN_text;
  input_stack[input_number].file = 0;
  input_stack[input_number].text = text;
  input_stack[input_number].ptext = text;

  if (!macro)
    line_number--;
  input_stack[input_number].line_nr.line_nr = line_number;
  input_stack[input_number].line_nr.file_name = filename;
  input_stack[input_number].line_nr.macro = macro;
  input_number++;
}

/* Store TEXT as a source for Texinfo content.  TEXT will be later free'd
   and must be allocated on the heap.  MACRO is the name of a macro that
   the text came from. */
void
input_push_text (char *text, char *macro)
{
  if (text)
    input_push (text, macro, 0, line_nr.line_nr);
}

/* Used in tests - like input_push_text, but the lines from the text have
   line numbers. */
void
input_push_text_with_line_nos (char *text, int starting)
{
  input_push (text, 0, 0, starting);
  input_stack[input_number - 1].type = IN_text;
}

void
input_reset_input_stack (void)
{
  input_number = 0;
  /* TODO: free the memory */
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
  input_stack[input_number].line_nr.file_name = filename;
  input_stack[input_number].line_nr.line_nr = 0;
  input_stack[input_number].line_nr.macro = 0;
  input_stack[input_number].text = 0;
  input_stack[input_number].ptext = 0;
  input_number++;

  return;
}

