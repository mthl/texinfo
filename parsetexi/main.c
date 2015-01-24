/* Copyright 2014, 2015 Free Software Foundation, Inc.

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
#include <stdio.h>

#include "parser.h"
#include "input.h"
#include "indices.h"
#include "api.h"

int
main (int argc, char **argv)
{
  if (argc <= 1)
    {
      fprintf (stderr, "Please give the name of a file to process.\n");
      exit (1);
    }
  init_index_commands ();
  parse_texi_file (argv[1]);
  dump_tree_to_perl (Root);

  exit (0);
}
