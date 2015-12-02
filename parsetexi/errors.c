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

void
line_error (char *message)
{
  if (!message) abort ();
  if (error_number == error_space)
    {
      error_list = realloc (error_list,
                            (error_space += 10) * sizeof (ERROR_MESSAGE));
    }
  error_list[error_number].message = message;
  error_list[error_number].type = error;
  error_list[error_number++].line_nr = line_nr; /* Field-by-field copy. */
}

void
line_errorf (char *format, ...)
{
  va_list v;
  char *message;

  va_start (v, format);
  vasprintf (&message, format, v);
  line_error (message);
}

void
line_warn (char *message)
{
  if (!message) abort ();
  if (error_number == error_space)
    {
      error_list = realloc (error_list,
                            (error_space += 10) * sizeof (ERROR_MESSAGE));
    }
  error_list[error_number].message = message;
  error_list[error_number].type = warning;
  error_list[error_number++].line_nr = line_nr; /* Field-by-field copy. */
}

void
line_warnf (char *format, ...)
{
  va_list v;
  char *message;

  va_start (v, format);
  vasprintf (&message, format, v);
  line_warn (message);
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


