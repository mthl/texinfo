/* float.c -- float environment functions.
   $Id: float.c,v 1.1 2003-11-23 23:19:04 dirt Exp $

   Copyright (C) 2003 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

   Written by Alper Ersoy <dirt@gtk.org>.  */

#include "system.h"
#include "makeinfo.h"
#include "float.h"
#include "sectioning.h"

static FLOAT_ELT *float_stack = NULL;

void
add_new_float (id, title, type)
    char *id;
    char *title;
    char *type;
{
  FLOAT_ELT *new = xmalloc (sizeof (FLOAT_ELT));

  new->id = id;
  new->type = type;
  new->title = title;

  new->number = current_chapter_number ();
  /* Append dot if not @unnumbered.  */
  if (strlen (new->number) > 0)
    strcat (new->number, ".");

  { /* Append the current float number.  */
    char s[100];

    snprintf (s, 100, "%s%d", new->number,
        count_floats_of_type_in_chapter (text_expansion (type), new->number) + 1);
    free (new->number);
    new->number = xstrdup (s);
  }

  new->next = float_stack;
  float_stack = new;
}

int
count_floats_of_type_in_chapter (type, chapter)
    char *type;
    char *chapter;
{
  int i = 0;
  int l = strlen (chapter);
  FLOAT_ELT *temp = float_stack;

  while (temp && strncmp (temp->number, chapter, l) == 0)
    {
      if (STREQ (text_expansion (temp->type), type))
        i++;
      temp = temp->next;
    }

  return i;
}

char *
current_float_title ()
{
  return float_stack->title;
}

char *
current_float_type ()
{
  return float_stack->type;
}

char *
current_float_number ()
{
  return float_stack->number;
}

char *
current_float_id ()
{
  return float_stack->id;
}
