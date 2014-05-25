/* info.h -- Header file which includes all of the other headers.
   $Id$

   Copyright 1993, 1997, 1998, 1999, 2001, 2002, 2003, 2004, 2007, 2011,
   2013, 2014 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.

   Originally written by Brian Fox. */

#ifndef INFO_H
#define INFO_H

/* We always want these, so why clutter up the compile command?  */
#define NAMED_FUNCTIONS
#define INFOKEY

/* System dependencies.  */
#include "system.h"

/* Some of our other include files use these.  */
typedef int Function ();
typedef void VFunction ();
typedef char *CFunction ();

#include "filesys.h"
#include "doc.h"
#include "display.h"
#include "session.h"
#include "echo-area.h"
#include "footnotes.h"
#include "gc.h"

#include "string.h"
#include "mbiter.h"
#include "mbchar.h"

#define info_toupper(x) (islower (x) ? toupper (x) : x)
#define info_tolower(x) (isupper (x) ? tolower (x) : x)

#if !defined (whitespace)
#  define whitespace(c) ((c == ' ') || (c == '\t'))
#endif /* !whitespace */

#if !defined (whitespace_or_newline)
#  define whitespace_or_newline(c) (whitespace (c) || (c == '\n'))
#endif /* !whitespace_or_newline */

/* Add ELT to the list of elements found in ARRAY.  SLOTS is the number
   of slots that have already been allocated.  IDX is the index into the
   array where ELT should be added.  MINSLOTS is the number of slots to
   start the array with in case it is empty. */
#define add_pointer_to_array(elt, idx, array, slots, minslots)	\
  do									\
    {									\
       if (idx + 2 >= slots)						\
	 {								\
	   if (slots == 0)						\
	     slots = minslots;						\
	   array = x2nrealloc (array, &slots, sizeof(array[0]));	\
	 }								\
       array[idx++] = elt;						\
       array[idx] = 0; /* null pointer for pointer types */       	\
    }									\
  while (0)

#define add_element_to_array add_pointer_to_array


/* A structure associating the nodes visited in a particular window. */
typedef struct {
  WINDOW *window;               /* The window that this list is attached to. */
  NODE **nodes;                 /* Array of nodes visited in this window. */
  int *pagetops;                /* For each node in NODES, the pagetop. */
  long *points;                 /* For each node in NODES, the point. */
  int current;                  /* Index in NODES of the current node. */
  int nodes_index;              /* Index where to add the next node. */
  int nodes_slots;              /* Number of slots allocated to NODES. */
} INFO_WINDOW;

/* Array of structures describing for each window which nodes have been
   visited in that window. */
extern INFO_WINDOW **info_windows;

/* For handling errors.  If you initialize the window system, you should
   also set info_windows_initialized_p to non-zero.  It is used by the
   info_error () function to determine how to format and output errors. */
extern int info_windows_initialized_p;

/* Non-zero if an error message has been printed. */
extern int info_error_was_printed;

/* Non-zero means ring terminal bell on errors. */
extern int info_error_rings_bell_p;

/* Non-zero means default keybindings are loosely modeled on vi(1).  */
extern int vi_keys_p;

/* Non-zero means don't remove ANSI escape sequences from man pages.  */
extern int raw_escapes_p;

/* Non-zero means don't try to be smart when searching for nodes.  */
extern int strict_node_location_p;

extern unsigned debug_level;

#define debug(n,c)							\
  do									\
    {									\
      if (debug_level >= (n))						\
	info_debug c;							\
    }									\
  while (0)

extern void vinfo_debug (const char *format, va_list ap);
extern void info_debug (const char *format, ...) TEXINFO_PRINTFLIKE(1,2);

/* Print args as per FORMAT.  If the window system was initialized,
   then the message is printed in the echo area.  Otherwise, a message is
   output to stderr. */
extern void info_error (const char *format, ...) TEXINFO_PRINTFLIKE(1,2);

extern void vinfo_error (const char *format, va_list ap);

extern void add_file_directory_to_path (char *filename);

/* Error message defines. */
extern const char *msg_cant_find_node;
extern const char *msg_cant_file_node;
extern const char *msg_cant_find_window;
extern const char *msg_cant_find_point;
extern const char *msg_cant_kill_last;
extern const char *msg_no_menu_node;
extern const char *msg_no_foot_node;
extern const char *msg_no_xref_node;
extern const char *msg_no_pointer;
extern const char *msg_unknown_command;
extern const char *msg_term_too_dumb;
extern const char *msg_at_node_bottom;
extern const char *msg_at_node_top;
extern const char *msg_one_window;
extern const char *msg_win_too_small;
extern const char *msg_cant_make_help;


/* Found in m-x.c.  */
extern char *read_function_name (const char *prompt, WINDOW *window);

extern void show_error_node (char *error_msg);

/* In infopath.c, but also used in man.c. */

/* Given a string containing units of information separated by colons,
   return the next one pointed to by IDX, or NULL if there are no more.
   Advance IDX to the character after the colon. */
char *extract_colon_unit (char *string, int *idx);

#endif /* !INFO_H */
