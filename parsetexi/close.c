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

// 1512
void
close_command_cleanup (ELEMENT *current)
{
  if (!current->cmd)
    return;

  if (current->cmd == CM_multitable)
    {
      if (counter_value (&count_cells, current) != -1)
        counter_pop (&count_cells);
      /* TODO
      if (counter_value (&max_columns, current) != -1)
        counter_pop (&count_cells);
      */
    }
  else if (current->cmd == CM_itemize || current->cmd == CM_enumerate)
    {
      counter_pop (&count_items);
    }

  /* Put everything after the last @def*x command in a def_item type
     container. */
  if (command_data(current->cmd).flags & CF_def)
    {
      gather_def_item (current);
    }

  if (current->cmd == CM_table
      || current->cmd == CM_ftable
      || current->cmd == CM_vtable)
    {
      if (current->contents.number > 0)
        gather_previous_item (current, 0);
    }

  // 1570
  /* Block commands that contain @item's - e.g. @multitable, @table,
     @itemize. */
  if (command_data(current->cmd).flags & CF_blockitem
      && current->contents.number > 0)
    {
      int have_leading_spaces = 0;
      ELEMENT *before_item;
      if (current->contents.number >= 0
          && current->contents.list[0]->type == ET_empty_line_after_command
          && current->contents.list[1]->type == ET_before_item)
        {
          have_leading_spaces = 1;
          before_item = current->contents.list[1];
        }
      else
        {
          before_item = current->contents.list[0];
          /* TODO: before_item is ELEMENT or ELEMENT * ? */
        }

      /* Perl code here checks if before_item exists, but it already assumed
         that it existed by accessing 'type' key on it. */

      // 1585
      /* Reparent @end from a ET_before_item to the block command */
      {
      KEY_PAIR *k = lookup_extra_key (current, "end_command");
      ELEMENT *e = k ? k->value : 0;
      if (k && last_contents_child (before_item)
          && last_contents_child (before_item) == e)
        {
          add_to_element_contents (current,
                                   pop_element_from_contents (before_item));
        }
      }

      /* Now if the ET_before_item is empty, remove it. */
      if (before_item->contents.number == 0)
        {
          destroy_element (remove_from_contents (current,
                                                 have_leading_spaces ? 1 : 0));
        }
      else /* Non-empty ET_before_item */
        {
          int empty_before_item = 1, i;
          /* Check if contents consist soley of @comment's. */
          for (i = 0; i < before_item->contents.number; i++)
            {
              enum command_id c = before_item->contents.list[i]->cmd;
              if (c != CM_c && c != CM_comment)
                {
                  empty_before_item = 0;
                }
            }

          if (!empty_before_item)
            {
              int empty_format = 1;
              /* Check for an element that could represent an @item in the
                 block.  The type of this element will depend on the block 
                 command we are in. */
              for (i = 0; i < current->contents.number; i++)
                {
                  ELEMENT *e = current->contents.list[i];
                  if (e == before_item)
                    continue;
                  if (e->cmd != CM_NONE
                         && (e->cmd != CM_c && e->cmd != CM_comment
                             && e->cmd != CM_end)
                      || e->type != CM_NONE
                         && e->type != ET_empty_line_after_command)
                    {
                      empty_format = 0;
                      break;
                    }
                }

              if (empty_format)
                line_warnf ("@%s has text but no @item",
                            command_name(current->cmd));
            }
        }

    } // 1635
}

/* 1642 */
static ELEMENT *
close_current (ELEMENT *current)
{
  /* Element is a command */
  if (current->cmd)
    {
      debug ("CLOSING (close_current) %s", command_name(current->cmd));
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
      line_errorf ("unmatched @end %s", command_name(closed_command));
    }

  return current;
}
