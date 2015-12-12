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

#define _GNU_SOURCE
#include <stdlib.h>
#include <stdarg.h>
#include <stdio.h>

#include "tree_types.h"
#include "input.h"
#include "text.h"
#include "dump_perl.h"
#include "errors.h"

enum error_type { error, warning };

typedef struct {
    char *message;
    enum error_type type;
    LINE_NR line_nr;
} ERROR_MESSAGE;

static ERROR_MESSAGE *error_list = 0;
static size_t error_number = 0;
static size_t error_space = 0;

static void
line_error_internal (enum error_type type, LINE_NR *cmd_line_nr,
                     char *format, va_list v)
{
  char *message;
  vasprintf (&message, format, v);
  if (!message) abort ();
  if (error_number == error_space)
    {
      error_list = realloc (error_list,
                            (error_space += 10) * sizeof (ERROR_MESSAGE));
    }
  error_list[error_number].message = message;
  error_list[error_number].type = type;

  if (cmd_line_nr)
    {
      if (cmd_line_nr->line_nr)
        error_list[error_number++].line_nr = *cmd_line_nr;
      else
        error_list[error_number++].line_nr = line_nr;
    }
  else
    error_list[error_number++].line_nr = line_nr;
}

void
line_error (char *format, ...)
{
  va_list v;

  va_start (v, format);
  line_error_internal (error, 0, format, v);
}

void
line_warn (char *format, ...)
{
  va_list v;

  va_start (v, format);
  line_error_internal (warning, 0, format, v);
}

void
command_warn (ELEMENT *e, char *format, ...)
{
  va_list v;

  va_start (v, format);
  line_error_internal (warning, &e->line_nr, format, v);
}

void
command_error (ELEMENT *e, char *format, ...)
{
  va_list v;

  va_start (v, format);
  line_error_internal (error, &e->line_nr, format, v);
}

void
wipe_errors (void)
{
  error_number = 0;
}

char *
dump_errors (void)
{
  int i;
  TEXT t;
  
  text_init (&t);
  text_append (&t, "$ERRORS = [\n");
  for (i = 0; i < error_number; i++)
    {
      text_append (&t, "{ 'message' =>\n'");
      dump_string (error_list[i].message, &t);
      text_append (&t, "',\n");
      text_printf (&t, "'type' => '%s',", error_list[i].type == error ? "error"
                                                                : "warning");
      text_append (&t, "'line_nr' => ");
      dump_line_nr (&error_list[i].line_nr, &t);
      text_append (&t, "},\n");
    }
  text_append (&t, "];\n");

  return t.text;
}


