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

ELEMENT *new_element (enum element_type type);
void add_to_element_contents (ELEMENT *parent, ELEMENT *e);
void add_to_element_args (ELEMENT *parent, ELEMENT *e);
void insert_into_contents (ELEMENT *parent, ELEMENT *e, int where);
ELEMENT *last_args_child (ELEMENT *current);
ELEMENT *last_contents_child (ELEMENT *current);
ELEMENT *pop_element_from_args (ELEMENT *parent);
ELEMENT *pop_element_from_contents (ELEMENT *parent);
ELEMENT *contents_child_by_index (ELEMENT *e, int index);
ELEMENT *args_child_by_index (ELEMENT *e, int index);
void destroy_element (ELEMENT *e);

#define element_contents_number(e) ((e)->contents.number)
#define element_args_number(e) ((e)->args.number)
#define element_text(e) (text_base (&(e)->text))

