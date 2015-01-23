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

#include <stdlib.h>
#include <stdio.h>

#include "parser.h"
#include "input.h"
#include "text.h"
#include "labels.h"
#include "indices.h"

#define element_type_name(e) element_type_names[(e)->type]

#define TREE_ROOT_VAR "$TREE"

int indent = 0;

/* A dump to fill in references from one part of the tree to another. */
static TEXT fixup_dump;

/* A dump to fill in references from the parse tree to the indices 
   information.  */
static TEXT tree_to_indices_dump;

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

/* Ouput S escaping single quotes and backslashes, so that
   Perl can read it in when it is surrounded by single quotes.  */
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
   to the element into DUMP. */
void
dump_route_to_element (ELEMENT *e, TEXT *dump)
{
  if (e->parent)
    dump_route_to_element (e->parent, dump);

  switch (e->parent_type)
    {
    case route_args:
      text_append (dump, "{'args'}");
      text_printf (dump, "[%d]", e->index_in_parent);
      break;
    case route_contents:
      text_append (dump, "{'contents'}");
      text_printf (dump, "[%d]", e->index_in_parent);
      break;
    case route_uninitialized:
      if (e->parent)
        abort ();
      text_append (dump, TREE_ROOT_VAR "->");
      break;
    default:
      abort ();
    }
}

/* Append to FIXUP_DUMP a line assigning the I'th 'extra' key of E. */
void
dump_fixup_line (ELEMENT *e, int i)
{
  dump_route_to_element (e, &fixup_dump);
  text_printf (&fixup_dump, "{'extra'}{'%s'}", e->extra[i].key);

  text_append (&fixup_dump, " = ");
  dump_route_to_element (e->extra[i].value, &fixup_dump);

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

static void
dump_node_spec (NODE_SPEC_EXTRA *value)
{
  printf ("{\n");
  indent += 2;
  if (value->manual_content)
    {
      dump_indent ();
      printf ("'manual_content' => ");
      dump_contents (value->manual_content);
    }
  if (value->node_content)
    {
      dump_indent ();
      printf ("'node_content' => ");
      dump_contents (value->node_content);
    }
  if (value->normalized)
    {
      dump_indent ();
      printf ("'normalized' => '");
      dump_string (value->normalized);
      printf ("'\n");
    }
  indent -= 2;
  dump_indent ();
  printf ("},\n");
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
          if (e->extra[i].type == extra_index_entry)
            {
              /* A "index_entry" extra key on a command defining an index
                 entry.  Unlike the other keys, the value is not in the
                 main parse tree, but in the indices_information.  It would
                 be much nicer if we could get rid of the need for this key. */

              INDEX_ENTRY_REF *ire = (INDEX_ENTRY_REF *) e->extra[i].value;
              INDEX_ENTRY *value = &ire->index->index_entries[ire->entry];

              dump_route_to_element (e, &tree_to_indices_dump);
              text_printf (&tree_to_indices_dump, "{'extra'}{'%s'} = ",
                           e->extra[i].key);
              text_printf (&tree_to_indices_dump,
                           "$INDEX_NAMES->{'%s'}{'index_entries'}[%d];\n",
                           value->index_name, value->number - 1);
              /* value->number is 1-based so we needed to subtract 1. */

              continue;
            }

          dump_indent ();

          if (e->extra[i].type == extra_misc_args)
            {
              int j;
              /* A "misc_args" value is just an array of strings. */
              printf ("'%s' => [", e->extra[i].key);
              for (j = 0; j < e->extra[i].value->contents.number; j++)
                {
                  if (e->extra[i].value->contents.list[j]->text.end > 0)
                    {
                      printf("'");
                      dump_string(e->extra[i].value->contents.list[j]
                                    ->text.text);
                      printf("',");
                    }
                  /* else an error? */
                }
              printf ("],\n");
            }
          else if (e->extra[i].type == extra_node_spec)
            {
              NODE_SPEC_EXTRA *value = (NODE_SPEC_EXTRA *) e->extra[i].value;

              printf ("'%s' => ", e->extra[i].key);
              dump_node_spec (value);
            }
          else if (e->extra[i].type == extra_node_spec_array)
            {
              NODE_SPEC_EXTRA **array = (NODE_SPEC_EXTRA **) e->extra[i].value;

              printf ("'%s' => [\n", e->extra[i].key);
              while (*array)
                {
                  dump_indent ();
                  dump_node_spec (*array);
                  array++;
                }
              dump_indent ();
              printf ("],\n");
            }
          else if (e->extra[i].type == extra_string)
            {
              char *value = (char *) e->extra[i].value;

              printf ("'%s' => '", e->extra[i].key);
              dump_string (value);
              printf ("',\n");
            }
          else if (e->extra[i].value->parent_type == route_not_in_tree)
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
  dump_indent ();
  printf ("'macro' => ''\n");

  indent -= 2;
  dump_indent ();
  printf ("},\n");
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

static void
dump_labels_information (void)
{
  int i;

  text_append (&fixup_dump, "\n$LABELS = {\n");

  for (i = 0; i < labels_number; i++)
    {
      text_printf (&fixup_dump, "'%s' => ", labels_list[i].label);
      dump_route_to_element (labels_list[i].target, &fixup_dump);
      text_append (&fixup_dump, ",\n");
    }

  text_append (&fixup_dump, "};\n");
}

static void
dump_entries_of_index (INDEX *idx)
{
  int i;
  INDEX_ENTRY *e;

  text_printf (&fixup_dump, "\n'index_entries' => [");
  for (i = 0; i < idx->index_number; i++)
    {
      e = &idx->index_entries[i];
      text_printf (&fixup_dump, "\n{");
      text_printf (&fixup_dump, "'index_name' => '%s',", e->index_name);
      text_printf (&fixup_dump, "'index_prefix' => '%s',", e->index_prefix);

      text_printf (&fixup_dump, "\n");
      text_printf (&fixup_dump, "'index_at_command' => '%s',",
                  command_data(e->index_at_command).cmdname);
      text_printf (&fixup_dump, "'index_type_command' => '%s',\n", 
                   command_data(e->index_type_command).cmdname);

      text_printf (&fixup_dump, "'command' => ");
      dump_route_to_element (e->command, &fixup_dump);
      text_printf (&fixup_dump, ",\n");

      if (e->content)
        {
          text_printf (&fixup_dump, "'content' => ");
          dump_route_to_element (e->content, &fixup_dump);
          text_printf (&fixup_dump, "{'contents'}");
          text_printf (&fixup_dump, ",\n");
        }

      if (e->node)
        {
          text_printf (&fixup_dump, "'node' => ");
          dump_route_to_element (e->node, &fixup_dump);
          text_printf (&fixup_dump, ",\n");
        }

      text_printf (&fixup_dump, "},");
    }
  text_printf (&fixup_dump, "],\n");
}

static void
dump_indices_information (void)
{
  INDEX *i;

  text_append (&fixup_dump, "\n$INDEX_NAMES = {\n");
  for (i = index_names; i->name; i++)
    {
      text_printf (&fixup_dump, "'%s' => {", i->name);
      text_printf (&fixup_dump, "'name' => '%s',", i->name);
      text_printf (&fixup_dump, "'in_code' => 0,");

      /* TODO: This is a list of recognized prefixes for the index. */
      text_printf (&fixup_dump, "'prefix' => ['%c', '%s'],",
                   *i->name, i->name);

      /* TODO: Handle index merging. */
      text_printf (&fixup_dump, "'contained_indices' => {'%s'=>1},",
                   i->name);

      dump_entries_of_index (i);

      text_printf (&fixup_dump, "},\n");
    }

  text_append (&fixup_dump, "};\n");
}

void
dump_tree_to_perl (ELEMENT *root)
{
  text_init (&fixup_dump);
  text_init (&tree_to_indices_dump);

  printf (TREE_ROOT_VAR " = ");
  dump_element (root);
  printf (";\n");

  /* All the elements in the tree have routing information now. */

  dump_labels_information ();

  dump_indices_information ();

  if (fixup_dump.end > 0)
    printf ("%s", fixup_dump.text);

  /* This must be output at the end so that both the tree and the indices
     will exist by the time this is read. */
  if (tree_to_indices_dump.end > 0)
    printf ("%s", tree_to_indices_dump.text);
}
