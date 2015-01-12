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

#include "parser.h"

/* Return the parent if in an item_line command, @*table */
ELEMENT *
item_line_parent (ELEMENT *current)
{
  if (current->cmd == CM_item || current->cmd == CM_itemx)
    current = current->parent->parent;
  else if (current->type == ET_before_item && current->parent)
    current = current->parent;

  if (item_line_command (current->cmd))
    return current;

  return 0;
}

/* Return the parent if in a multitable. */
ELEMENT *
item_multitable_parent (ELEMENT *current)
{
  if (current->cmd == CM_headitem
      || current->cmd == CM_item
      || current->cmd == CM_tab)
    {
      if (current->parent && current->parent->parent)
        current = current->parent->parent;
    }
  else if (current->type == ET_before_item)
    {
      current = current->parent;
    }

  if (current->cmd == CM_multitable)
    return current;

  return 0;
}
