#include <stdlib.h>
#include <stdio.h>

#include "parser.h"
#include "input.h"

#define element_type_name(e) element_type_names[(e)->type]

int indent = 0;

void dump_contents (ELEMENT *);
void dump_element (ELEMENT *);

/* Output INDENT spaces. */
void
dump_indent (void)
{
  int i;
  for (i = 0; i < indent; i++)
    printf (" ");
}

void
dump_args (ELEMENT *e)
{
  int i;
  printf ("[\n");
  indent += 2;

  for (i = 0; i < e->args.number; i++)
    {
      dump_indent ();
      dump_element (e->args.list[i]);
      printf (",\n");
    }

  indent -= 2;
  dump_indent ();
  printf ("],\n");
}

void
dump_contents (ELEMENT *e)
{
  int i;
  printf ("[\n");
  indent += 2;

  for (i = 0; i < e->contents.number; i++)
    {
      dump_indent ();
      dump_element (e->contents.list[i]);
      printf (",\n");
    }

  indent -= 2;
  dump_indent ();
  printf ("],\n");
}

void
dump_string (char *s)
{
     while (*s)
       {
         if (*s == '\''
           || *s == '\\')
           putchar ('\\');
         putchar (*s++);
       }
}

void
dump_element (ELEMENT *e)
{
  printf ("{\n");
  indent += 2;
  
  if (e->type)
    {
      dump_indent ();
      printf ("'type' => '%s',\n", element_type_name(e));
    }

  if (e->cmd)
    {
      dump_indent ();
      printf ("'cmdname' => '");
      dump_string (command_data(e->cmd).cmdname);
      printf ("',\n");
    }
  
  if (e->text.text)
    {
      char *s;
      dump_indent ();
      /* FIXME: Need to escape backslashes, e.g. output
         \\input instead of \input. */
      printf ("'text' => '");
      dump_string (e->text.text);
      printf ("',\n");
    }

  if (e->args.number > 0)
    {
      dump_indent ();
      printf ("'args' => ");
      dump_args (e);
    }

  if (e->contents.number > 0)
    {
      dump_indent ();
      printf ("'contents' => ");
      dump_contents (e);
    }

  indent -= 2;
  dump_indent ();
  printf ("}");
}

void
dump_tree_to_perl (ELEMENT *root)
{
  printf ("$VAR1 = ");
  dump_element (root);
  printf (";\n");
}


int
main (int argc, char **argv)
{
  ELEMENT *root;
  if (argc <= 1)
    {
      fprintf (stderr, "Please give the name of a file to process.\n");
      exit (1);
    }
  input_push_file (argv[1]);
  init_index_commands ();
  root = parse_texi_file ();
  dump_tree_to_perl (root);

  exit (0);
}
