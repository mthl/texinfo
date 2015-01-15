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

#include "parser.h"

static void
add_extra_key (ELEMENT *e, char *key, ELEMENT *value)
{
  if (e->extra_number == e->extra_space)
    {
      e->extra = realloc (e->extra,
                          (e->extra_space += 5) * sizeof (KEY_PAIR));
      if (!e->extra)
        abort ();
    }

  e->extra[e->extra_number].key = key;
  e->extra[e->extra_number++].value = value;
}

/* Add an extra key that is a reference to another element (for example, 
   'associated_section' on a node command element. */
void
add_extra_key_element (ELEMENT *e, char *key, ELEMENT *value)
{
  add_extra_key (e, key, value);
  e->extra[e->extra_number - 1].type = extra_element;
}

/* Add an extra key that is a reference to the contents array of another
   element (for example, 'node_content' on a node command element). */
void
add_extra_key_contents (ELEMENT *e, char *key, ELEMENT *value)
{
  add_extra_key (e, key, value);
  e->extra[e->extra_number - 1].type = extra_element_contents;
}

/* Add an extra key that is a reference to the text field of another
   element. */
void
add_extra_key_text (ELEMENT *e, char *key, ELEMENT *value)
{
  add_extra_key (e, key, value);
  e->extra[e->extra_number - 1].type = extra_element_text;
}

void
add_extra_key_index_entry (ELEMENT *e, char *key, INDEX_ENTRY *value)
{
  add_extra_key (e, key, (ELEMENT *) value);
  e->extra[e->extra_number - 1].type = extra_index_entry;
}

void
add_extra_key_misc_args (ELEMENT *e, char *key, ELEMENT *value)
{
  add_extra_key (e, key, value);
  e->extra[e->extra_number - 1].type = extra_misc_args;
}

KEY_PAIR *
lookup_extra_key (ELEMENT *e, char *key)
{
  int i;
  for (i = 0; i < e->extra_number; i++)
    {
      if (!strcmp (e->extra[i].key, key))
        return &e->extra[i];
    }
  return 0;
}
