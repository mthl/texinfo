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

/* Information about a possible target of a cross-reference, often a node. */
typedef struct {
    /* The normalized node name for HTML output of the target, used as a key.  
       Using the normalized node name as a key is a way to avoid clashes if 
       different node names containing @-commands end up as the same. */
    char *label;

    /* Pointer to the element for the command defining this label, usually a
       node element.  FIXME: I'm not sure if we actualy need to get to the
       target - much of the use of the labels_information is to check that 
       references are to real places. */
    ELEMENT *target;
} LABEL;

extern LABEL *labels_list;
extern size_t labels_number;
void register_label (ELEMENT *current, ELEMENT *label);
