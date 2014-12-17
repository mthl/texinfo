#define _GNU_SOURCE

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "tree_types.h"
#include "input.h"
#include "text.h"

enum input_type { IN_file, IN_text };

typedef struct {
    enum input_type type;

    FILE *file;
    char *filename;

    char *text;
    char *ptext; /* How far we are through 'text'. */
    int line_number;
} INPUT;

static INPUT *input_stack = 0;
static size_t input_number = 0;
static size_t input_space = 0;

/* Current filename and line number. */
LINE_NR line_nr;

/* Collect text until a newline is found. */
// I don't really understand the difference between this and next_text.
// When would next_text not return a string ending in a newline?
// Unlike new_text, new_line's return value doesn't end in '\n'.
// Return value should not be freed by caller, and becomes invalid after
// a subsequent call.
// 1961
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
        {
          t.text[t.end - 1] = '\0';
          break;
        }
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
          i->ptext = p + 1;
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
                *comment = '\n';

              // 1920 CPP_LINE_DIRECTIVES

              line_nr.line_nr++;
              return line;
            }
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

void
input_push_text (char *text)
{
  save_line_nr ();

  if (input_number == input_space)
    {
      input_stack = realloc (input_stack,
                             (input_space *= 1.5) * sizeof (INPUT));
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

void
input_push_file (char *filename)
{
  FILE *stream;
  save_line_nr ();

  stream = fopen (filename, "r");

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

