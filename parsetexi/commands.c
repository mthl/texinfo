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
#include <string.h>

#include "command_ids.h"
#include "commands.h"
#include "command_data.c"

COMMAND *user_defined_command_data = 0;
static size_t user_defined_number = 0;
static size_t user_defined_space = 0;

static int
compare_command_fn (const void *a, const void *b)
{
  const COMMAND *ca = (COMMAND *) a;
  const COMMAND *cb = (COMMAND *) b;

  return strcmp (ca->cmdname, cb->cmdname);
}

/* Return element number in command_data array.  Return 0 if not found. */
enum command_id
lookup_command (char *cmdname)
{
  COMMAND *c;
  COMMAND target;
  int i;

  target.cmdname = cmdname;

  c = (COMMAND *) bsearch (&target, builtin_command_data + 1,
        /* number of elements */
        sizeof (builtin_command_data) / sizeof (builtin_command_data[0]) - 1,
        sizeof (builtin_command_data[0]),
        compare_command_fn);

  if (c)
    return c - &builtin_command_data[0];

  /* Check for user-defined commands: macros, indexes, etc. */
  for (i = 0; i < user_defined_number; i++)
    {
      if (!strcmp (user_defined_command_data[i].cmdname, cmdname))
        return ((enum command_id) i) | USER_COMMAND_BIT;
    }

  return 0;
}

/* Add a new user-defined Texinfo command, like an index or macro command.  No 
   reference to NAME is retained. */
enum command_id
add_texinfo_command (char *name)
{
  if (user_defined_number == user_defined_space)
    {
      user_defined_command_data
        = realloc (user_defined_command_data,
                   (user_defined_space += 10) * sizeof (COMMAND));
      if (!user_defined_command_data)
        abort ();
    }

  user_defined_command_data[user_defined_number].cmdname = strdup (name);
  user_defined_command_data[user_defined_number].flags = 0;
  user_defined_command_data[user_defined_number].data = 0;

  return ((enum command_id) user_defined_number++) | USER_COMMAND_BIT;
}

void
wipe_user_commands (void)
{
  user_defined_number = 0;
}

/* Common.pm:841. */
/* Commands that terminate a paragraph. */
/* We may replace this function with a macro, or represent this infomation in
   command_data. */
int
close_paragraph_command (enum command_id cmd_id)
{
  /* Block commands except 'raw' and 'conditional'.  */
  if (command_data(cmd_id).flags & CF_block)
    {
      if (command_data(cmd_id).data == BLOCK_conditional
          || command_data(cmd_id).data == BLOCK_raw)
        return 0;

      return 1;
    }

  /* several others Common.pm:852 */
  if (cmd_id == CM_titlefont
     || cmd_id == CM_insertcopying
     || cmd_id == CM_sp
     || cmd_id == CM_verbatiminclude
     || cmd_id == CM_page
     || cmd_id == CM_item
     || cmd_id == CM_itemx
     || cmd_id == CM_tab
     || cmd_id == CM_headitem
     || cmd_id == CM_printindex
     || cmd_id == CM_listoffloats
     || cmd_id == CM_center
     || cmd_id == CM_dircategory
     || cmd_id == CM_contents
     || cmd_id == CM_shortcontents
     || cmd_id == CM_summarycontents
     || cmd_id == CM_caption
     || cmd_id == CM_shortcaption
     || cmd_id == CM_setfilename
     || cmd_id == CM_exdent)
    return 1;

  /* def commands */

  return 0;
}

// Parser.pm:348
int
close_preformatted_command (enum command_id cmd_id)
{
  return cmd_id != CM_sp && close_paragraph_command (cmd_id);
}

int
item_line_command (enum command_id cmd_id)
{
  return cmd_id == CM_table || cmd_id == CM_ftable || cmd_id == CM_vtable;
}
