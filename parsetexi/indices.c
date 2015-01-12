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

#include "commands.h"
#include "command_ids.h"

static struct index_name {
    char *name;
    char prefix;
    // int in_code;
} index_names[] = {
    "cp", 'c',
    "fn", 'f',
    "vr", 'v',
    "ky", 'k',
    "pg", 'p',
    "tp", 't'
};

void
init_index_commands (void)
{
  struct index_name *i;
  char name[] = "?index";
  for (i = index_names;
       i < &index_names[sizeof(index_names)/sizeof(*index_names)];
       i++)
    {
      enum command_id new;
      name[0] = i->prefix;
      new = add_texinfo_command (name);
      user_defined_command_data[new & ~USER_COMMAND_BIT].flags = CF_misc;
      user_defined_command_data[new & ~USER_COMMAND_BIT].data = MISC_line;
    }
}
