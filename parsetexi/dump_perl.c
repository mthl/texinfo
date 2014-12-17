#include <stdlib.h>
#include <stdio.h>

#include "parser.h"
#include "input.h"
#include "text.h"

#define element_type_name(e) element_type_names[(e)->type]

#define TREE_ROOT_VAR "$VAR1"

int indent = 0;

/* A dump to fill in references from one part of the tree to another. */
static TEXT fixup_dump;

void dump_contents (ELEMENT *);
void dump_element (ELEMENT *);
void dump_args (ELEMENT *);

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
      e->args.list[i]->parent_type = route_args;
      e->args.list[i]->index_in_parent = i;

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
      e->contents.list[i]->parent_type = route_contents;
      e->contents.list[i]->index_in_parent = i;

      dump_indent ();
      dump_element (e->contents.list[i]);
      printf (",\n");
    }

  indent -= 2;
  dump_indent ();
  printf ("],\n");
}

/* Recursively go up to the root of the tree.  On the way back print the path 
   to the element into FIXUP_DUMP. */
void
dump_route_to_element (ELEMENT *e)
{
  if (e->parent)
    dump_route_to_element (e->parent);

  switch (e->parent_type)
    {
    case route_args:
      text_append (&fixup_dump, "{'args'}");
      text_printf (&fixup_dump, "[%d]", e->index_in_parent);
      break;
    case route_contents:
      text_append (&fixup_dump, "{'contents'}");
      text_printf (&fixup_dump, "[%d]", e->index_in_parent);
      break;
    case route_uninitialized:
      if (e->parent)
        abort ();
      text_append (&fixup_dump, TREE_ROOT_VAR "->");
      break;
    default:
      abort ();
    }
}

/* Append to FIXUP_DUMP a line assigning the I'th 'extra' key of E. */
void
dump_fixup_line (ELEMENT *e, int i)
{
  dump_route_to_element (e);
  text_printf (&fixup_dump, "{'extra'}{'%s'}", e->extra[i].key);

  text_append (&fixup_dump, " = ");
  dump_route_to_element (e->extra[i].value);

  switch (e->extra[i].type)
    {
    case extra_element:
      break;
    case extra_element_contents:
      text_append (&fixup_dump, "->{'contents'}");
      break;
    case extra_element_text:
      text_append (&fixup_dump, "->{'text'}");
      break;
    default:
      abort ();
    }
  text_append (&fixup_dump, ";\n");
}

/* Dump a skeleton for the 'extra' key.  For each key, if the referenced 
   element has been dumped yet and we know its, append a line filling in the 
   value of the key to FIXUP_DUMP.  Otherwise, record the reference in the 
   'pending_references' field.  Look through the pending references in E itself 
   for references to this element from elsewhere. */
void
dump_extra (ELEMENT *e)
{
  int i;

  printf ("{\n");
  indent += 2;

  if (e->extra_number > 0)
    {
      for (i = 0; i < e->extra_number; i++)
        {
          dump_indent ();

          if (e->extra[i].value->parent_type == route_not_in_tree)
            {
              switch (e->extra[i].type)
                {
                case extra_element:
                  dump_element (e->extra[i].value);
                  break;
                case extra_element_contents:
                  printf ("'%s' => ", e->extra[i].key);
                  dump_contents (e->extra[i].value);
                  break;
                default:
                  abort ();
                }
            }
          else
            {
              printf ("'%s' => {},\n", e->extra[i].key);

              if (e->extra[i].value->parent_type != route_uninitialized)
                {
                  dump_fixup_line (e, i);
                }
              else /* Add a pending reference to this element. */
                {
                  ELEMENT *e2;

                  e2 = e->extra[i].value;

                  if (e2->pending_number == e2->pending_space)
                    {
                      e2->pending_references = realloc (e2->pending_references,
                        (e2->pending_space += 2) * sizeof (PENDING_REFERENCE));
                      if (!e2->pending_references)
                        abort ();
                    }

                  e2->pending_references[e2->pending_number].element = e;
                  e2->pending_references[e2->pending_number++].extra_index = i;
                }
            }
        }
    }

  if (e->pending_number > 0)
    {
      for (i = 0; i < e->pending_number; i++)
        {
          ELEMENT *referring;
          int index;

          referring = e->pending_references[i].element;
          index = e->pending_references[i].extra_index;
          dump_fixup_line (referring, index);
        }
    }

  indent -= 2;
  dump_indent ();
  printf ("},\n");
}

void
dump_line_nr (ELEMENT *e)
{
  printf ("{\n");
  indent += 2;

  if (e->line_nr.file_name)
    {
      dump_indent ();
      printf ("'file_name' => '%s',\n", e->line_nr.file_name);
    }

  if (e->line_nr.line_nr)
    {
      dump_indent ();
      printf ("'line_nr' => %d,\n", e->line_nr.line_nr);
    }

  /* TODO: macro. */
  printf ("'macro' => ''\n");

  indent -= 2;
  dump_indent ();
  printf ("},\n");
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
  
  if (e->line_nr.line_nr)
    {
      dump_indent ();
      printf ("'line_nr' => ");
      dump_line_nr (e);
    }

  if (e->text.text)
    {
      dump_indent ();
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

  if (e->extra_number > 0)
    {
      dump_indent ();
      printf ("'extra' => ");
      dump_extra (e);
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
  text_init (&fixup_dump);
  printf (TREE_ROOT_VAR " = ");
  dump_element (root);
  printf (";\n");
  if (fixup_dump.end > 0)
    printf ("%s", fixup_dump.text);
}
