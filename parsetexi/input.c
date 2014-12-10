#define _GNU_SOURCE

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "input.h"
#include "tree_types.h"
#include "text.h"

enum input_type { IN_file, IN_text };

typedef struct {
    enum input_type type;

    FILE *file;

    char *text;
    char *ptext; /* How far we are through 'text'. */
} INPUT;

static INPUT *input_stack = 0;
static size_t input_number = 0;
static size_t input_space = 0;

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
    }
  return 0;
}

void
input_push_text (char *text)
{
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
}

void
input_push_stream (FILE *stream)
{
  if (input_number == input_space)
    {
      input_stack = realloc (input_stack, (input_space += 5) * sizeof (INPUT));
      if (!input_stack)
        abort ();
    }

  input_stack[input_number].type = IN_file;
  input_stack[input_number].file = stream;
  input_number++;
}

void
input_push_file (char *filename)
{
  FILE *stream;
  stream = fopen (filename, "r");
  if (!stream)
    {
      fprintf (stderr, "Could not open %s\n", filename);
      exit (1);
    }

  input_push_stream (stream);
  return;
}

