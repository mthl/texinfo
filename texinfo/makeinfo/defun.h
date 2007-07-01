/* defun.h -- declaration for defuns.
   $Id: defun.h,v 1.5 2007-07-01 18:31:41 karl Exp $

   Copyright (C) 1999, 2005, 2007 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

   Written by Karl Heinz Marbaise <kama@hippo.fido.de>.  */

#ifndef DEFUN_H
#define DEFUN_H

#include "insertion.h"

extern enum insertion_type get_base_type (enum insertion_type);
extern void cm_defun (void);

#endif /* !DEFUN_H */

