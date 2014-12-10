#define _GNU_SOURCE

#include <stdlib.h>
#include <string.h>

#include "parser.h"
#include "tree.h"
#include "text.h"
#include "input.h"

typedef struct {
    char *macro_name;
    ELEMENT *element;
    enum command_id cmd;
} MACRO;

static MACRO *macro_list;
static size_t macro_number;
static size_t macro_space;


/* Macro definition. */

void
new_macro (char *name, ELEMENT *macro)
{
  enum command_id new;

  if (macro_number == macro_space)
    {
      macro_list = realloc (macro_list, (macro_space += 5) * sizeof (MACRO));
      if (!macro_list)
        abort ();
    }

  macro_list[macro_number].macro_name = name; /* strdup ? */
  macro_list[macro_number].element = macro;

  new = add_texinfo_command (name);
  macro_list[macro_number++].cmd = new;
  new &= ~USER_COMMAND_BIT;

  user_defined_command_data[new].flags |= CF_MACRO;
}

// 1088
/* COMMAND_ID will be either CM_macro or CM_rmacro.  Read the line defining a 
   macro's name and the arguments it takes, and return this information in a 
   new ELEMENT. */
ELEMENT *
parse_macro_command_line (enum command_id cmd, char **line_inout,
                          ELEMENT *parent)
{
  char *line = *line_inout;
  ELEMENT *macro, *macro_name;
  char *name, *args_ptr;
  int index;

  macro = new_element (ET_NONE);
  macro->cmd = cmd;

  line += strspn (line, whitespace_chars);
  name = read_command_name (&line);
  if (!name)
    {
      abort (); //error
    }

  macro_name = new_element (ET_macro_name);
  text_append (&macro_name->text, name);
  free (name);
  add_to_element_args (macro, macro_name);

  args_ptr = line;
  args_ptr += strspn (args_ptr, whitespace_chars);

  if (*args_ptr != '{')
    {
      /* Either error or no args. */
      line = args_ptr;
      goto funexit;
    }
  args_ptr++;

  index = 0;
  do
    {
      /* args_ptr is after a '{' or ','. */

      char *q, *q2;
      ELEMENT *arg;

      args_ptr += strspn (args_ptr, whitespace_chars);

      /* Find end of current argument. */
      q = args_ptr;
      while (*q != '\0' && *q != ',' && *q != '}')
        q++;

      if (!*q)
        {
          /* End of string reached before closing brace. */
          abort ();
        }

      /* Disregard trailing whitespace. */
      q2 = q;
      while (q2 > q && strchr (whitespace_chars, q2[-1]))
        q2--;

      if (q2 == args_ptr)
        {
          // 1126 - argument is completely whitespace
          if (index == 0)
            break; /* Empty arg list, like "@macro m { }". */
          abort ();
        }

      arg = new_element (ET_macro_arg);
      text_append_n (&arg->text, args_ptr, q2 - args_ptr);
      add_to_element_args (macro, arg);

      args_ptr = q + 1;

      if (*q == '}')
        break;

      index++;
    }
  while (1);
  line = args_ptr;

  /* FIXME: What if there is stuff after the '}'? */
  line += strlen (line); /* Discard rest of line. */

funexit:
  *line_inout = line;
  return macro;
}


/* Macro use. */

/* Return index into given arguments to look for the value of NAME. */
int
lookup_macro_parameter (char *name, ELEMENT *macro)
{
  int i, pos;
  ELEMENT **args;
  
  /* Find 'arg' in MACRO parameters. */
  args = macro->args.list;
  pos = 0;
  for (i = 0; i < macro->args.number; i++)
    {
      if (args[i]->type == ET_macro_arg)
        {
          if (!strcmp (args[i]->text.text, name))
            return pos;
          pos++;
        }
    }
  abort ();
  return -1;
}

/* LINE points to after opening brace in a macro invocation. */
// 1984
char **
expand_macro_arguments (ELEMENT *macro, char **line_inout)
{
  char *line = *line_inout;
  char *pline = line;
  TEXT arg;
  int braces_level = 1;

  char **arg_list = 0;
  size_t arg_number = 0;
  size_t arg_space = 0;

  text_init (&arg);

  while (braces_level > 0)
    {
      /* At the beginning of this loop pline is at the start
         of an argument. */
      char *sep;

      sep = pline + strcspn (pline, "\\,{}");
      if (!*sep)
        {
          debug ("MACRO ARG end of line");
          // FIXME: How to free line?
          // We could keep a reference to it in a static variable in
          // new_line.
          line = new_line ();
          pline = line;
        }

      text_append_n (&arg, pline, sep - pline);

      // 2002
      switch (*sep)
        {
        case '\\':
          if (*pline)
            text_append_n (&arg, pline, 1);
          pline = sep + 1;
          break;
        case '{':
          braces_level++;
          pline = sep + 1;
          break;
        case '}':
          braces_level--;
          if (braces_level > 0)
            {
              text_append_n (&arg, sep, 1);
              pline = sep + 1;
              break;
            }

          /* Fall through to add argument. */
        case ',':
          if (braces_level > 1)
            {
              text_append_n (&arg, sep, 1);
              pline = sep + 1;
              break;
            }

          // 2021 check for too many args

          /* Add the last argument read to the list. */
          if (arg.end > 0)
            {
              if (arg_number == arg_space)
                {
                  arg_list = realloc (arg_list,
                                      (arg_space += 5) * sizeof (char *));
                  if (!arg_list)
                    abort ();
                }
              arg_list[arg_number++] = arg.text;
              text_init (&arg);
            }
          else
          // then what? e.g. is "@m {     }" one empty argument or none?
            if (arg_number != 0)
              abort;

          debug ("MACRO NEW ARG");
          pline = sep + 1;
          break;
        }

      if (*sep == ',')
        pline += strspn (pline, whitespace_chars);
    }

  debug ("END MACRO ARGS EXPANSION");
  line = pline;

  *line_inout = line;
  return arg_list;
}

/* ARGUMENTS are the arguments used in the macro invocation.  EXPANDED gets the 
   result of the expansion. */
static void
expand_macro_body (ELEMENT *macro, char *arguments[], TEXT *expanded)
{
  char *arg;
  int pos; /* Index into arguments. */
  int i; /* Index into macro contents. */
  ELEMENT **body;
  
  /* Initialize TEXT object. */
  expanded->end = 0;

  body = macro->contents.list;
  for (i = 0; i < macro->contents.number; i++)
    {
      char *ptext;

      if (body[i]->type != ET_raw)
        continue; /* Could be an ET_last_raw_newline. */

      /* There should be at least a newline. */
      if (body[i]->text.end == 0)
        abort ();

      ptext = body[i]->text.text;
      if (i == macro->contents.number - 1)
        ; // strip newline
      
      while (1)
        {
          /* At the start of this loop ptext is at the beginning or
             just after the last backslash sequence. */

          char *bs; /* Pointer to next backslash. */

          bs = strchrnul (ptext, '\\');
          text_append_n (expanded, ptext, bs - ptext);
          if (!*bs)
            break; /* End of line. */

          ptext = bs + 1;
          if (*ptext == '\\')
            {
              text_append_n (expanded, "\\", 1); /* Escaped backslash (\\). */
              ptext++;
            }
          else
            {
              bs = strchr (ptext, '\\');
              if (!bs)
                {
                  // error - malformed
                  abort ();
                }

              *bs = '\0';
              pos = lookup_macro_parameter (ptext, macro);
              if (pos == -1)
                abort ();
              *bs = '\\';

              text_append (expanded, arguments[pos]);
              ptext = bs + 1;
            }
        }
    }
}

static MACRO *
lookup_macro (enum command_id cmd)
{
  int i;

  for (i = 0; i < macro_number; i++)
    {
      if (macro_list[i].cmd == cmd)
        return &macro_list[i];
    }
  return 0;
}

// 3898
ELEMENT *
handle_macro (ELEMENT *current, char **line_inout, enum command_id cmd)
{
  char *line;
  MACRO *macro_record;
  ELEMENT *macro;
  TEXT expanded;
  char **arguments;

  line = *line_inout;
  text_init (&expanded);

  macro_record = lookup_macro (cmd);
  if (!macro_record)
    abort ();
  macro = macro_record->element;

  // 3907 Get number of args.

  line += strspn (line, whitespace_chars);
  if (*line == '{')
    {
      line++;
      /* In the Perl version formfeed is excluded for some reason. */
      line += strspn (line, whitespace_chars);
      arguments = expand_macro_arguments (macro, &line);
    }

  expand_macro_body (macro, arguments, &expanded);
  debug ("MACROBODY: %s||||||", expanded.text);

  /* Free arguments. */
  {
    char **s = arguments;
    while (*s)
      {
        free (*s);
        s++;
      }
    free (arguments);
  }


  // 3958 Pop macro stack

  // 3961 Split expansion into lines.
  input_push_text (expanded.text);

  *line_inout = line;
  return current;
}
