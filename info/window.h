/* window.h -- Structure and flags used in manipulating Info windows.
   $Id$

   Copyright 1993, 1997, 2004, 2007, 2011 2013, 2014
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
   along with this program.  If not, see <http://www.gnu.org/licenses/>.

   Originally written by Brian Fox. */

#ifndef INFO_WINDOW_H
#define INFO_WINDOW_H

#include "infomap.h"
#include "nodes.h"

/* Smallest number of visible lines in a window.  The actual height is
   always one more than this number because each window has a modeline. */
#define WINDOW_MIN_HEIGHT 2

/* Smallest number of screen lines that can be used to fully present a
   window.  This number includes the modeline of the window. */
#define WINDOW_MIN_SIZE (WINDOW_MIN_HEIGHT + 1)

/* A line map structure keeps a table of point values corresponding to
   column offsets within the current line.  It is used to convert
   point values into columns on screen and vice versa. */
typedef struct line_map_struct
{
  NODE *node;      /* Node to which this line pertains */
  size_t nline;    /* Line number for which the map is computed. */
  size_t size;     /* Number of elements map can accomodate */
  size_t used;     /* Number of used map slots */
  long *map;       /* The map itself */
} LINE_MAP;

/* The exact same elements are used within the WINDOW_STATE structure and a
   subsection of the WINDOW structure.  We could define a structure which
   contains this elements, and include that structure in each of WINDOW_STATE
   and WINDOW.  But that would lead references in the code such as
   window->state->node which we would like to avoid.  Instead, we #define the
   elements here, and simply include the define in both data structures. Thus,
   if you need to change window state information, here is where you would
   do it.  NB> The last element does NOT end with a semi-colon. */
#define WINDOW_STATE_DECL \
   NODE *node;          /* The node displayed in this window. */ \
   long pagetop;        /* LINE_STARTS[PAGETOP] is first line in WINDOW. */ \
   long point           /* Offset within NODE of the cursor position. */

typedef struct {
  WINDOW_STATE_DECL;            /* What gets saved. */
} WINDOW_STATE;

/* Structure which defines a window.  Windows are doubly linked, next
   and prev. The list of windows is kept on WINDOWS.  The structure member
   window->height is the total height of the window.  The position location
   (0, window->height + window->first_row) is the first character of this
   windows modeline.  The number of lines that can be displayed in a window
   is equal to window->height - 1. */
typedef struct window_struct
{
  struct window_struct *next;      /* Next window in this chain. */
  struct window_struct *prev;      /* Previous window in this chain. */
  long width;           /* Width of this window. */
  long height;          /* Height of this window. */
  long first_row;       /* Offset of the first line in the_screen. */
  long goal_column;     /* The column we would like the cursor to appear in. */
  WINDOW_STATE_DECL;    /* Node, pagetop and point. */
  LINE_MAP line_map;    /* Current line map */
  char *modeline;       /* Calculated text of the modeline for this window. */
  long *line_starts;    /* Offsets of printed line starts in node->contents.*/
  long *log_line_no;    /* Number of logical line corresponding to each
                           physical one. */
  long line_count;      /* Number of elements in LINE_STARTS and LOG_LINE_NO.*/
  size_t line_slots;    /* Allocated space in LINE_STARTS and LOG_LINE_NO. */

  int flags;            /* See below for details. */

  /* History of nodes visited in this window. */
  WINDOW_STATE **hist;       /* Nodes visited in this window. */
  size_t hist_index;            /* Index where to add the next node. */
  size_t hist_slots;            /* Number of slots allocated to HIST. */
} WINDOW;

/* Structure defining the current state of an incremental search. */
typedef struct {
  WINDOW_STATE_DECL;    /* The node, pagetop and point. */
  int search_index;     /* Offset of the last char in the search string. */
  int direction;        /* The direction that this search is heading in. */
  int failing;          /* Whether or not this search failed. */
} SEARCH_STATE;

#define W_UpdateWindow  0x01    /* WINDOW needs updating. */
#define W_WindowIsPerm  0x02    /* This WINDOW is a permanent object. */
#define W_WindowVisible 0x04    /* This WINDOW is currently visible. */
#define W_InhibitMode   0x08    /* This WINDOW has no modeline. */
#define W_NoWrap        0x10    /* Lines do not wrap in this window. */
#define W_InputWindow   0x20    /* Window accepts input. */
#define W_TempWindow    0x40    /* Window is less important. */

extern WINDOW *windows;         /* List of visible Info windows. */
extern WINDOW *active_window;   /* The currently active window. */
extern WINDOW *the_screen;      /* The Info screen is just another window. */
extern WINDOW *the_echo_area;   /* THE_ECHO_AREA is a window in THE_SCREEN. */

extern int show_malformed_multibyte_p; /* Show malformed multibyte sequences */

/* Global variable control redisplay of scrolled windows.  If non-zero, it
   is the desired number of lines to scroll the window in order to make
   point visible.  A user might set this to 1 for smooth scrolling.  If
   set to zero, the line containing point is centered within the window. */
extern int window_scroll_step;

 /* Make the modeline member for WINDOW. */
extern void window_make_modeline (WINDOW *window);

/* Initalize the window system by creating THE_SCREEN and THE_ECHO_AREA.
   Create the first window ever, and make it permanent.
   You pass WIDTH and HEIGHT; the dimensions of the total screen size. */
extern void window_initialize_windows (int width, int height);

/* Make a new window by splitting an existing one. If the window could
   not be made return a null pointer.  The active window is not changed .*/
extern WINDOW *window_make_window (void);

/* Delete WINDOW from the list of known windows.  If this window was the
   active window, make the next window in the chain be the active window,
   or the previous window in the chain if there is no next window. */
extern void window_delete_window (WINDOW *window);

/* Set WINDOW to display NODE. */
extern void window_set_node_of_window (WINDOW *window, NODE *node);

/* Tell the window system that the size of the screen has changed.  This
   causes lots of interesting things to happen.  The permanent windows
   are resized, as well as every visible window.  You pass WIDTH and HEIGHT;
   the dimensions of the total screen size. */
extern void window_new_screen_size (int width, int height);

/* Change the height of WINDOW by AMOUNT.  This also automagically adjusts
   the previous and next windows in the chain.  If there is only one user
   window, then no change takes place. */
extern void window_change_window_height (WINDOW *window, int amount);

extern void set_window_pagetop (WINDOW *window, int desired_top);

/* Adjust the pagetop of WINDOW such that the cursor point will be visible. */
extern void window_adjust_pagetop (WINDOW *window);

/* Tile all of the windows currently displayed in the global variable
   WINDOWS.  If argument DO_INTERNALS is non-zero, tile windows displaying
   internal nodes as well. */
#define DONT_TILE_INTERNALS 0
#define TILE_INTERNALS      1
extern void window_tile_windows (int style);

/* Toggle the state of line wrapping in WINDOW.  This can do a bit of fancy
   redisplay. */
extern void window_toggle_wrap (WINDOW *window);

/* For every window in CHAIN, set the flags member to have FLAG set. */
extern void window_mark_chain (WINDOW *chain, int flag);

/* For every window in CHAIN, clear the flags member of FLAG. */
extern void window_unmark_chain (WINDOW *chain, int flag);

/* Make WINDOW start displaying at PERCENT percentage of its node. */
extern void window_goto_percentage (WINDOW *window, int percent);

/* Build a new node which has AP printed according to FORMAT as the
   contents. */
extern NODE *build_message_node (const char *format, va_list ap);

extern NODE *format_message_node (const char *format, ...)
  TEXINFO_PRINTFLIKE(1,2);

struct text_buffer;
extern NODE *text_buffer_to_node (struct text_buffer *tb);

/* Make a message appear in the echo area, built from arguments formatted
   according to FORMAT.

   The message appears immediately.  If there was
   already a message appearing in the echo area, it is removed. */
extern void window_message_in_echo_area (const char *format, ...)
  TEXINFO_PRINTFLIKE(1,2);

extern void vwindow_message_in_echo_area (const char *format, va_list ap);

extern void free_echo_area (void);

/* Place a temporary message in the echo area built from arguments
   formatted as per FORMAT.

   The message appears immediately, but does not destroy
   any existing message.  A future call to unmessage_in_echo_area ()
   restores the old contents. */
extern void message_in_echo_area (const char *format, ...)
  TEXINFO_PRINTFLIKE(1,2);

extern void unmessage_in_echo_area (void);

/* Clear the echo area, removing any message that is already present.
   The echo area is cleared immediately. */
extern void window_clear_echo_area (void);

/* Return the index of the line containing point. */
extern int window_line_of_point (WINDOW *window);

/* Get and return the printed column offset of the cursor in this window. */
extern int window_get_cursor_column (WINDOW *window);

/* Get and Set the node, pagetop, and point of WINDOW. */
extern void window_get_state (WINDOW *window, SEARCH_STATE *state);
extern void window_set_state (WINDOW *window, SEARCH_STATE *state);

/* Count the number of characters in current line of WIN that precede
   the printed column offset of GOAL. */
extern int window_chars_to_goal (WINDOW *win, int goal);

extern size_t process_node_text
        (WINDOW *win, char *start,
         int (*fun) (WINDOW *, size_t, size_t, size_t, char *,
		     size_t, size_t));

int info_tag (mbi_iterator_t iter, size_t *plen);

extern void window_compute_line_map (WINDOW *win);

extern int window_point_to_column (WINDOW *win, long point, long *np);

extern void window_line_map_init (WINDOW *win);

extern long window_end_of_line (WINDOW *win);

extern long window_log_to_phys_line (WINDOW *window, long ln);

#endif /* not INFO_WINDOW_H */
