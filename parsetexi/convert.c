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

#include "tree_types.h"

/* Stub for Texinfo::Convert::Text::convert */
char *
text_convert (ELEMENT *e)
{
  int which = e->contents.number;
  which--;
  if (which > 0)
    {
      if (e->contents.list[which]->type == ET_spaces_at_end)
        which--;

      if (which > 0)
        return e->contents.list[which]->text.text;
    }
  return "bar";
}

/* Stub for Texinfo::Convert::NodeNameNormalization::normalize_node. */
char *
convert_to_normalized (ELEMENT *label)
{
  int i;

  /* Return text of the first contents child that has text. */
  for (i = 0; i < label->contents.number; i++)
    {
      if (label->contents.list[i]->text.end > 0)
        return label->contents.list[i]->text.text;
    }
  return 0;
}
