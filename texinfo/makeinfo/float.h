/* float.h -- declarations for the float environment.
   $Id: float.h,v 1.1 2003-11-23 23:19:04 dirt Exp $

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

#ifndef FLOAT_H
#define FLOAT_H

typedef struct float_elt
{
  struct float_elt *next;
  char *id;
  char *type;
  char *title;
  char *number;
} FLOAT_ELT;

/* Information retrieval about the current float env.  */
extern char *current_float_id (), *current_float_title (),
  *current_float_number ();

#endif /* not FLOAT_H */
