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

#include "context_stack.h"

static enum context *stack;
static size_t top; /* One above last pushed context. */
static size_t space;

void
push_context (enum context c)
{
  if (top >= space)
    {
      stack = realloc (stack, (space += 5) * sizeof (enum context));
    }

  stack[top++] = c;
}

enum context
pop_context ()
{
  if (top == 0)
    abort ();

  return stack[--top];
}

enum context
current_context (void)
{
  if (top == 0)
    return ct_NONE;

  return stack[top - 1];
}
