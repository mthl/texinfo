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

#include "parser.h"
#include "errors.h"

/* In parser.c. */
ELEMENT *end_paragraph (ELEMENT *current);

// 1512
void
close_command_cleanup (ELEMENT *current)
{
  if (!current->cmd)
    return;

  if (current->cmd == CM_multitable)
    {
    }

  /* Put everything after the last @def*x command in a def_item type
     container. */
  if (command_data(current->cmd).flags & CF_def)
    {
      /* "At this point the end command hasn't been added to the command
         contents, so checks cannot be done at this point." */
      gather_def_item (current);
    }

  /* "item_line" commands */
  if (current->cmd == CM_table
      || current->cmd == CM_ftable
      || current->cmd == CM_vtable)
    {
      /* "At this point the end command hasn't been added to the command
         contents, so checks cannot be done at this point." */
      if (current->contents.number > 0)
        ;//gather_previous_item (current);
    }

  // 1570
  if (command_data(current->cmd).flags & CF_blockitem)
    {
    } // 1635
}

/* 1642 */
static ELEMENT *
close_current (ELEMENT *current)
{
  /* Element is a command */
  if (current->cmd)
    {
      debug ("CLOSING (close_current) %s", command_data(current->cmd).cmdname);
      current = current->parent; /* TODO */
    }
  else if (current->type != ET_NONE)
    {
      enum context c;
      debug ("CLOSING type %s", element_type_names[current->type]);
      switch (current->type)
        {
        case ET_bracketed:
          command_error ("misplaced {");
          current = current->parent;
          break;
        case ET_menu_comment:
        case ET_menu_entry_description:
          c = pop_context ();
          if (c != ct_preformatted)
            abort ();

          /* 1700 Remove empty menu_comment */
          if (current->contents.number == 0)
            {
              current = current->parent;
              destroy_element (pop_element_from_contents (current));
            }
          else
            current = current->parent;

          break;
        case ET_misc_line_arg:
        case ET_block_line_arg:
          c = pop_context ();
          if (c != ct_line && c != ct_def)
            {
              /* error */
              abort ();
            }
          current = current->parent;
          break;
        default:
          current = current->parent;
          break;
        }
    }
  else
    {
      if (current->parent)
        current = current->parent;
      /* error */
    }

  return current;
}

/* 1725 */
/* Return lowest level ancestor of CURRENT containing a CLOSED_COMMAND
   element.  Set CLOSED_ELEMENT to the element itself.  INTERRUPTING is used in 
   close_brace_command 1246 to display an error message.  Remove a context from 
   context stack if it was added by this command. */
ELEMENT *
close_commands (ELEMENT *current, enum command_id closed_command,
                ELEMENT **closed_element, enum command_id interrupting)
{
  *closed_element = 0;
  current = end_paragraph (current);
  current = end_preformatted (current);

  while (current->parent
         && (!closed_command || current->cmd != closed_command)
     /* Stop if in a root command. */
         && !(current->cmd && command_flags(current) & CF_root))
    {
      close_command_cleanup (current);
      current = close_current (current);
    }

  if (closed_command && current->cmd == closed_command)
    {
      /* 1758 - various error messages */
      if (command_data(current->cmd).flags & CF_preformatted)
        {
          if (pop_context () != ct_preformatted)
            abort ();
        }
      else if (command_data(current->cmd).flags & CF_format_raw)
        {
          if (pop_context () != ct_rawpreformatted)
            abort ();
          // pop expanded formats stack
        }
      else if (command_data(current->cmd).flags & CF_menu)
        {
          enum context c;
          c = pop_context ();
          if (c != ct_menu && c != ct_preformatted)
            abort ();
        }

      // 1784 maybe pop regions stack
      *closed_element = current;
      current = current->parent; /* 1788 */
    }
  else if (closed_command)
    {
      line_errorf ("unmatched @end %s", command_data(closed_command).cmdname);
    }

  return current;
}
