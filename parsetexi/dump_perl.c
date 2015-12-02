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
#include "api.h"

#define element_type_name(e) element_type_names[(e)->type]

#define TREE_ROOT_VAR "$TREE"

static int indent = 0;

/* A dump to fill in references from one part of the tree to another. */
static TEXT fixup_dump;

/* A dump for information about the indices. */
static TEXT indices_dump;

/* A dump to fill in references from the parse tree to the indices 
   information.  */
static TEXT tree_to_indices_dump;

void dump_contents (ELEMENT *, TEXT *);
void dump_element (ELEMENT *, TEXT *);
void dump_args (ELEMENT *, TEXT *);

/* Output INDENT spaces. */
static void
dump_indent (TEXT *text)
{
  int i;

  for (i = 0; i < indent; i++)
    text_append_n (text, " ", 1);
}

/* Ouput S escaping single quotes and backslashes, so that
   Perl can read it in when it is surrounded by single quotes.  */
void
dump_string (char *s, TEXT *text)
{
 while (*s)
   {
     if (*s == '\''
       || *s == '\\')
       text_append_n (text, "\\", 1);
     text_append_n (text, s++, 1);
   }
}

void
dump_args (ELEMENT *e, TEXT *text)
{
  int i;
  int not_in_tree = 0;

  /* Don't set routing information if not dumping from a route
     directly from the root, that is via an extra value. */
  if (e->parent_type == route_not_in_tree
      || (e->parent_type == route_uninitialized && e->parent))
    not_in_tree = 1;
  text_append_n (text, "[\n", 2);
  indent += 2;

  for (i = 0; i < e->args.number; i++)
    {
      if (!not_in_tree)
        {
          e->args.list[i]->parent_type = route_args;
          e->args.list[i]->index_in_parent = i;
        }

      dump_indent (text);
      dump_element (e->args.list[i], text);
      text_append_n (text, ",\n", 2);
    }

  indent -= 2;
  dump_indent (text);
  text_append_n (text, "],\n", 3);
}

void
dump_contents (ELEMENT *e, TEXT *text)
{
  int i;
  int not_in_tree = 0;

  /* Don't set routing information if not dumping from a route
     directly from the root, that is via an extra value. */
  if (e->parent_type == route_not_in_tree
      || (e->parent_type == route_uninitialized && e->parent))
    not_in_tree = 1;

  text_append_n (text, "[\n", 2);
  indent += 2;

  for (i = 0; i < e->contents.number; i++)
    {
      if (!not_in_tree)
        {
          e->contents.list[i]->parent_type = route_contents;
          e->contents.list[i]->index_in_parent = i;
        }

      dump_indent (text);
      dump_element (e->contents.list[i], text);
      text_append_n (text, ",\n", 2);
    }

  indent -= 2;
  dump_indent (text);
  text_append_n (text, "],\n", 3);
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
dump_node_spec (NODE_SPEC_EXTRA *value, TEXT *text)
{
  text_append_n (text, "{\n", 2);
  indent += 2;
  if (value->manual_content)
    {
      dump_indent (text);
      text_append (text, "'manual_content' => ");
      dump_contents (value->manual_content, text);
    }
  if (value->node_content)
    {
      dump_indent (text);
      text_append (text, "'node_content' => ");
      dump_contents (value->node_content, text);
    }
  if (value->normalized)
    {
      dump_indent (text);
      text_append (text, "'normalized' => '");
      dump_string (value->normalized, text);
      text_append_n (text, "'\n", 2);
    }
  indent -= 2;
  dump_indent (text);
  text_append_n (text, "},\n", 3);
}

/* Dump a skeleton for the 'extra' key.  For each key, if the referenced 
   element has been dumped yet and we know its, append a line filling in the 
   value of the key to FIXUP_DUMP.  Otherwise, record the reference in the 
   'pending_references' field.  Look through the pending references in E itself 
   for references to this element from elsewhere. */
void
dump_extra (ELEMENT *e, TEXT *text)
{
  int i;

  text_append_n (text, "{\n", 2);
  indent += 2;

  if (e->extra_number > 0)
    {
      for (i = 0; i < e->extra_number; i++)
        {
          if (e->extra[i].type == extra_deleted)
            continue;
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

          dump_indent (text);

          if (e->extra[i].type == extra_misc_args)
            {
              int j;
              /* A "misc_args" value is just an array of strings. */
              text_append_n (text, "'", 1);
              text_append (text, e->extra[i].key);
              text_append (text, "' => [");
              for (j = 0; j < e->extra[i].value->contents.number; j++)
                {
                  if (e->extra[i].value->contents.list[j]->text.end > 0)
                    {
                      text_append_n (text, "'", 1);
                      dump_string(e->extra[i].value->contents.list[j]
                                    ->text.text, text);
                      text_append_n (text, "',", 2);
                    }
                  /* else an error? */
                }
              text_append_n (text, "],\n", 3);
            }
          else if (e->extra[i].type == extra_node_spec)
            {
              NODE_SPEC_EXTRA *value = (NODE_SPEC_EXTRA *) e->extra[i].value;

              text_printf (text, "'%s' => ", e->extra[i].key);
              dump_node_spec (value, text);
            }
          else if (e->extra[i].type == extra_node_spec_array)
            {
              NODE_SPEC_EXTRA **array = (NODE_SPEC_EXTRA **) e->extra[i].value;

              text_append_n (text, "'", 1);
              text_append (text, e->extra[i].key);
              text_append (text, "' => [\n");
              while (*array)
                {
                  dump_indent (text);
                  dump_node_spec (*array, text);
                  array++;
                }
              dump_indent (text);
              text_append_n (text, "],\n", 3);
            }
          else if (e->extra[i].type == extra_string)
            {
              char *value = (char *) e->extra[i].value;

              text_append_n (text, "'", 1);
              text_append (text, e->extra[i].key);
              text_append (text, "' => '");
              dump_string (value, text);
              text_append_n (text, "',\n", 3);
            }
          else if (e->extra[i].type == extra_def_args)
            {
              DEF_ARGS_EXTRA *value = (DEF_ARGS_EXTRA *) e->extra[i].value;
              int j;
              char *label;

              text_append_n (text, "'", 1);
              text_append (text, e->extra[i].key);
              text_append (text, "' => [\n");

              for (j = 0; (label = value->labels[j]); j++)
                {
                  dump_indent (text);
                  text_append_n (text, "['", 2);
                  text_append (text, label);
                  text_append_n (text, "', ", 3);

                  dump_element (value->elements[j], text);
                  text_append_n (text, "],\n", 3);
                }
              dump_indent (text);
              text_append_n (text, "],\n", 3);
              /* TODO: Also output a "def_parsed_hash". */
            }
          else if (e->extra[i].value->parent_type == route_not_in_tree)
            {
              switch (e->extra[i].type)
                {
                  int j;
                case extra_element:
                  dump_element (e->extra[i].value, text);
                  break;
                case extra_element_contents:
                  text_append_n (text, "'", 1);
                  text_append (text, e->extra[i].key);
                  text_append (text, "' => ");
                  dump_contents (e->extra[i].value, text);
                  break;
                case extra_element_contents_array:
                  /* Like extra_element_contents, but this time output an array
                     of arrays (instead of an array). */
                  text_append_n (text, "'", 1);
                  text_append (text, e->extra[i].key);
                  text_append (text, "' => [\n");
                  indent += 2;
                  for (j = 0; j < e->extra[i].value->contents.number; j++)
                    {
                      dump_indent (text);
                      dump_contents (e->extra[i].value->contents.list[j], 
                                     text);
                    }
                  indent -= 2;
                  dump_indent (text);
                  text_append (text, "],\n");
                  break;
                default:
                  abort ();
                }
            }
          else
            {
              if (e->extra[i].type != extra_element)
                abort ();

              text_append_n (text, "'", 1);
              text_append (text, e->extra[i].key);
              text_append (text, "' => {},\n");

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
  dump_indent (text);
  text_append_n (text, "},\n", 3);
}

void
dump_line_nr (LINE_NR *line_nr, TEXT *text)
{
  text_append_n (text, "{\n", 2);
  indent += 2;

  dump_indent (text);
  text_printf (text, "'file_name' => '%s',\n",
               line_nr->file_name ?
               line_nr->file_name : "");

  if (line_nr->line_nr)
    {
      dump_indent (text);
      text_append (text, "'line_nr' => ");
      text_printf (text, "%d", line_nr->line_nr);
      text_append (text, ",\n");
    }

  /* TODO: macro. */
  dump_indent (text);
  text_append (text, "'macro' => ''\n");

  indent -= 2;
  dump_indent (text);
  text_append_n (text, "},\n", 3);
}

void
dump_element (ELEMENT *e, TEXT *text)
{
  text_append_n (text, "{\n", 2);
  indent += 2;
  
  if (e->type)
    {
      dump_indent (text);
      if (e->cmd != CM_verb)
        text_printf (text, "'type' => '%s',\n", element_type_name(e));
      else
        {
          char c = (char) e->type;
          text_printf (text, "'type' => '");
          if (c == '\'' || c == '\\') /* Escaping for Perl. */
            text_append_n (text, "\\", 1);
          text_append_n (text, &c, 1);
          text_printf (text, "',\n");
        }
    }

  if (e->cmd)
    {
      dump_indent (text);
      text_append (text, "'cmdname' => '");
      dump_string (command_data(e->cmd).cmdname, text);
      text_append_n (text, "',\n", 3);
    }
  
  if (e->line_nr.line_nr)
    {
      dump_indent (text);
      text_append (text, "'line_nr' => ");
      dump_line_nr (&e->line_nr, text);
    }

  if (e->text.text)
    {
      dump_indent (text);
      text_append (text, "'text' => '");
      dump_string (e->text.text, text);
      text_append_n (text, "',\n", 3);
    }

  if (e->args.number > 0)
    {
      dump_indent (text);
      text_append (text, "'args' => ");
      dump_args (e, text);
    }

  if (e->extra_number > 0)
    {
      dump_indent (text);
      text_append (text, "'extra' => ");
      dump_extra (e, text);
    }

  if (e->contents.number > 0)
    {
      dump_indent (text);
      text_append (text, "'contents' => ");
      dump_contents (e, text);
    }

  indent -= 2;
  dump_indent (text);
  text_append_n (text, "}", 1);
}

/* Append to FIXUP_DUMP information about the labels. */
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

  text_printf (&indices_dump, "\n'index_entries' => [");
  for (i = 0; i < idx->index_number; i++)
    {
      e = &idx->index_entries[i];
      text_printf (&indices_dump, "\n{");
      text_printf (&indices_dump, "'index_name' => '%s',", e->index_name);
      text_printf (&indices_dump, "'index_prefix' => '%s',", e->index_prefix);

      text_printf (&indices_dump, "\n");
      text_printf (&indices_dump, "'index_at_command' => '%s',",
                  command_data(e->index_at_command).cmdname);
      text_printf (&indices_dump, "'index_type_command' => '%s',\n", 
                   command_data(e->index_type_command).cmdname);

      text_printf (&indices_dump, "'command' => ");
      dump_route_to_element (e->command, &indices_dump);
      text_printf (&indices_dump, ",\n");

      text_printf (&indices_dump, "'number' => %d,", e->number);

      if (e->content)
        {
          text_printf (&indices_dump, "'content' => ");
          if (e->content->parent_type != route_not_in_tree)
            dump_route_to_element (e->content, &indices_dump);
          else
            dump_element (e->content, &indices_dump);
          text_printf (&indices_dump, "{'contents'}");
          text_printf (&indices_dump, ",\n");
        }

      if (e->node)
        {
          text_printf (&indices_dump, "'node' => ");
          dump_route_to_element (e->node, &indices_dump);
          text_printf (&indices_dump, ",\n");
        }

      text_printf (&indices_dump, "},");
    }
  text_printf (&indices_dump, "],\n");
}

/* Append to INDICES_DUMP information about the indices. */
static void
dump_indices_information (void)
{
  INDEX **i, *idx;

  text_append (&indices_dump, "\n$INDEX_NAMES = {\n");
  for (i = index_names; (idx = *i); i++)
    {
      text_printf (&indices_dump, "'%s' => {", idx->name);
      text_printf (&indices_dump, "'name' => '%s',", idx->name);
      text_printf (&indices_dump, "'in_code' => 0,");

      /* TODO: This is a list of recognized prefixes for the index. */
      text_printf (&indices_dump, "'prefix' => ['%c', '%s'],",
                   *idx->name, idx->name);

      /* TODO: Handle index merging. */
      text_printf (&indices_dump, "'contained_indices' => {'%s'=>1},",
                   idx->name);

      dump_entries_of_index (idx);

      text_printf (&indices_dump, "},\n");
    }

  text_append (&indices_dump, "};\n");
}

void
dump_tree_to_perl (ELEMENT *root)
{
  TEXT output;

  text_init (&output);
  text_init (&fixup_dump);
  text_init (&tree_to_indices_dump);

  text_append (&output, TREE_ROOT_VAR " = ");
  dump_element (root, &output);
  text_append_n (&output, ";\n", 2);

  /* All the elements in the tree have routing information now. */

  if (output.end > 0)
    printf ("%s", output.text);

  dump_labels_information ();

  dump_indices_information ();

  if (fixup_dump.end > 0)
    printf ("%s", fixup_dump.text);

  if (indices_dump.end > 0)
    printf ("%s", indices_dump.text);

  /* This must be output at the end so that both the tree and the indices
     will exist by the time this is read. */
  if (tree_to_indices_dump.end > 0)
    printf ("%s", tree_to_indices_dump.text);

  free (output.text);
}

/************************************************************/
/* Following are functions each returning Perl code to be
   eval'd.  When done in the right order the data will be
   transferred into the Perl program. */

char *
dump_root_element_1 (void)
{
  ELEMENT *e = Root;
  TEXT textb;
  TEXT *text;

  text = &textb;
  text_init (text);

  text_append (text, TREE_ROOT_VAR " = ");
  text_append_n (text, "{\n", 2);
  indent += 2;
  
  if (e->type)
    {
      dump_indent (text);
      text_printf (text, "'type' => '%s',\n", element_type_name(e));
    }

  if (e->cmd)
    {
      dump_indent (text);
      text_append (text, "'cmdname' => '");
      dump_string (command_data(e->cmd).cmdname, text);
      text_append_n (text, "',\n", 3);
    }
  
  if (e->line_nr.line_nr)
    {
      dump_indent (text);
      text_append (text, "'line_nr' => ");
      dump_line_nr (&e->line_nr, text);
    }

  if (e->text.text)
    {
      dump_indent (text);
      text_append (text, "'text' => '");
      dump_string (e->text.text, text);
      text_append_n (text, "',\n", 3);
    }

  if (e->args.number > 0)
    {
      dump_indent (text);
      text_append (text, "'args' => ");
      dump_args (e, text);
    }

  if (e->extra_number > 0)
    {
      dump_indent (text);
      text_append (text, "'extra' => ");
      dump_extra (e, text);
    }
  text_append_n (text, "};\n", 3);
  return textb.text;
}

char *
dump_root_element_2 (void)
{
  static int i = 0;
  TEXT text;
  ELEMENT *e = Root;

  if (i == e->contents.number)
    {
      i++;
      return 0;
    }

  text_init (&text);
  text_printf (&text, TREE_ROOT_VAR "->{'contents'}[%d] = ", i);

  e->contents.list[i]->parent_type = route_contents;
  e->contents.list[i]->index_in_parent = i;
  dump_element (e->contents.list[i], &text);
  text_append (&text, ";");
  
  i++;
  return text.text;
}

char *
dump_tree_to_string_1 (void)
{
  text_init (&fixup_dump);
  text_init (&indices_dump);
  text_init (&tree_to_indices_dump);

  return "";
}

char *
dump_tree_to_string_2 (void)
{
  dump_labels_information ();

  if (fixup_dump.end > 0)
     return fixup_dump.text;
  return "";
}

char *
dump_tree_to_string_25 (void)
{
  dump_indices_information ();

  if (indices_dump.end > 0)
     return indices_dump.text;
  return "";
}

char *
dump_tree_to_string_3 (void)
{
  /* This must be output at the end so that both the tree and the indices
     will exist by the time this is read. */
  if (tree_to_indices_dump.end > 0)
     return tree_to_indices_dump.text;
  return "";
}
