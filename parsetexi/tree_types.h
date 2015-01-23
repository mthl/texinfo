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
#include "command_ids.h"
#include "element_types.h"

typedef struct TEXT {
    char *text;
    size_t space; /* Allocated bytes in 'text', including terminating null. */
    size_t end;
} TEXT;

enum extra_type {
    extra_element,
    extra_element_contents,
    extra_element_text,
    extra_index_entry,
    extra_misc_args,
    extra_node_spec,
    extra_node_spec_array,
    extra_string
};

typedef struct KEY_PAIR {
    char *key;
    enum extra_type type;
    struct ELEMENT *value;
} KEY_PAIR;

typedef struct ELEMENT_LIST {
    struct ELEMENT **list;
    size_t number;
    size_t space;
} ELEMENT_LIST;

typedef struct LINE_NR {
    int line_nr;
    char *file_name;
    char *macro;
} LINE_NR;

/* Type of a link in the route from the root of the tree to an element. */
enum route_element_type { route_uninitialized, route_contents, route_args,
    route_not_in_tree };

typedef struct {
    /* Element that contains a reference to this one. */
    struct ELEMENT *element;

    /* Index into the referring element's extra keys that is the reference. */
    int extra_index;
} PENDING_REFERENCE;

typedef struct ELEMENT {
    enum command_id cmd;
    TEXT text;
    enum element_type type;
    ELEMENT_LIST args;
    ELEMENT_LIST contents;
    struct ELEMENT *parent;
    LINE_NR line_nr;

    KEY_PAIR *extra;
    size_t extra_number;
    size_t extra_space;

    /* Not used in final output. */
    int remaining_args; /* Could be a stack instead. */

    /********* Used when dumping to a text stream only. ************/

    int index_in_parent;
    enum route_element_type parent_type;

    PENDING_REFERENCE *pending_references;
    size_t pending_number;
    size_t pending_space;
} ELEMENT;

typedef struct GLOBAL_INFO {
    char *input_file_name;
    char *input_encoding_name;
} GLOBAL_INFO;

typedef struct {
    char *index_name;
    char *index_prefix;
    enum command_id index_at_command;
    enum command_id index_type_command;

    /* content->contents is the index entry text */
    ELEMENT *content;
    /* content_normalized */
    ELEMENT *command;
    ELEMENT *node;
    int number; /* Index of entry in containing index, 1-based. */
    enum command_id region;
} INDEX_ENTRY;

typedef struct {
    char *name;
    char *prefix;
    // int in_code;

    INDEX_ENTRY *index_entries;
    size_t index_number;
    size_t index_space;
} INDEX;

/* Used when dumping to a text stream only.  A reference to an
   index entry, in the "index_entry" extra key of an element.
   index->index_entries[entry] is the referred-to index entry. */
typedef struct {
    INDEX *index;
    int entry;
} INDEX_ENTRY_REF;

/* See parse_node_manual function. */
typedef struct {
    ELEMENT *manual_content;
    ELEMENT *node_content;
    char *normalized;
} NODE_SPEC_EXTRA;

