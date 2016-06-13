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

int debug_output;
int
main (int argc, char **argv)
{
  //extern int element_counter;
  debug_output = 1;

  if (argc <= 1)
    {
      fprintf (stderr, "Please give the name of a file to process.\n");
      exit (1);
    }
  parse_texi_file (argv[1]);
  dump_tree_to_perl (Root);
  //build_texinfo_tree ();
  /* ^ doesn't work because there's no active perl instance */
  //printf ("About %d elements in tree\n", element_counter);

  exit (0);
}
