#include <stdlib.h>
#include <stdio.h>

#include "parser.h"
#include "input.h"

int
main (int argc, char **argv)
{
  ELEMENT *root;
  if (argc <= 1)
    {
      fprintf (stderr, "Please give the name of a file to process.\n");
      exit (1);
    }
  input_push_file (argv[1]);
  init_index_commands ();
  root = parse_texi_file ();
  dump_tree_to_perl (root);

  exit (0);
}
