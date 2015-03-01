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

#include <string.h>
#include <stdio.h>

#include "parser.h"
#include "indices.h"

INDEX **index_names;
int number_of_indices;
int space_for_indices;

typedef struct {
    enum command_id cmd;
    INDEX *idx;
} CMD_TO_IDX;

/* Array mapping Texinfo commands to index data structures. */
static CMD_TO_IDX *cmd_to_idx = 0;
static size_t num_index_commands = 0;
static size_t cmd_to_idx_space = 0;

static void
associate_command_to_index (enum command_id cmd, INDEX *idx)
{
  if (num_index_commands == cmd_to_idx_space)
    {
      cmd_to_idx = realloc (cmd_to_idx,
                            sizeof (CMD_TO_IDX) * (cmd_to_idx_space += 10));
      if (!cmd_to_idx)
        abort ();
    }

  cmd_to_idx[num_index_commands].cmd = cmd;
  cmd_to_idx[num_index_commands++].idx = idx;
}

/* Get the index associated with CMD. */
INDEX *
index_of_command (enum command_id cmd)
{
  int i;

  for (i = 0; i < num_index_commands; i++)
    {
      if (cmd_to_idx[i].cmd == cmd)
        return cmd_to_idx[i].idx;
    }
  return 0;
}

void
add_index_command (char *cmdname, INDEX *idx)
{
  enum command_id new = add_texinfo_command (cmdname);
  user_defined_command_data[new & ~USER_COMMAND_BIT].flags
    = CF_misc | CF_index_entry_command;
  user_defined_command_data[new & ~USER_COMMAND_BIT].data = MISC_line;
  associate_command_to_index (new, idx);
}

static INDEX *
add_index_internal (char *name, int in_code)
{
  INDEX *idx = malloc (sizeof (INDEX));
  char *cmdname;

  memset (idx, 0, sizeof *idx);
  idx->name = name;
  idx->prefix = name;
  if (number_of_indices == space_for_indices)
    {
      space_for_indices += 5;
      index_names = realloc (index_names, (space_for_indices + 1)
                             * sizeof (INDEX *));
    }
  index_names[number_of_indices++] = idx;
  index_names[number_of_indices] = 0;

  /* For example, "rq" -> "rqindex". */
  asprintf (&cmdname, "%s%s", name, "index");
  add_index_command (cmdname, idx);
  free (cmdname);
  return idx;
}

void
add_index (char *name, int in_code)
{
  INDEX *idx;

  idx = add_index_internal (name, in_code);
}

void
init_index_commands (void)
{
  INDEX *idx;
  char **p;
  char *default_indices[] = {
    "cp",
    "fn",
    "vr",
    "ky",
    "pg",
    "tp",
    0,
  };
  char name[] = "?index";

  for (p = default_indices; *p; p++)
    {
      /* Both @cpindex and @cindex are added. */
      idx = add_index_internal (*p, 0);
      *name = **p;
      add_index_command (name, idx);
    }
}


// 2530
/* INDEX_AT_COMMAND is the Texinfo @-command defining the index entry.
   CONTENT is an element whose contents represent the text of the
   index entry.  CURRENT is the element in the main body of the manual that
   the index entry refers to. */
void
enter_index_entry (enum command_id index_type_command,
                   enum command_id index_at_command,
                   ELEMENT *current,
                   ELEMENT *content /*, content_normalized */ )
{
  INDEX *idx;
  INDEX_ENTRY *entry;
  INDEX_ENTRY_REF *ier;

  idx = index_of_command (index_type_command);
  if (idx->index_number == idx->index_space)
    {
      idx->index_entries = realloc (idx->index_entries,
                             sizeof (INDEX_ENTRY) * (idx->index_space += 20));
      if (!idx->index_entries)
        abort ();
    }
  entry = &idx->index_entries[idx->index_number++];
  memset (entry, 0, sizeof (INDEX_ENTRY));


  entry->index_name = idx->name;
  entry->index_at_command = index_at_command;
  entry->index_type_command = index_type_command;
  entry->index_prefix = idx->prefix;
  entry->content = content;
  //entry->content_normalized = ... ;
  entry->command = current;
  entry->number = idx->index_number;

  entry->node = current_node;

  entry->number = idx->index_number;

  ier = malloc (sizeof (INDEX_ENTRY_REF));
  ier->index = idx;
  ier->entry = idx->index_number - 1;

  add_extra_key_index_entry (current, "index_entry", ier);

}
