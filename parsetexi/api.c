#include <stdlib.h>
#include <stdio.h>

#include "parser.h"
#include "input.h"

static ELEMENT *root;

/* Set ROOT to root of tree obtained by parsing FILENAME. */
void
parse_file (char *filename)
{
  debug_output = 0;
  input_push_file (filename);
  init_index_commands ();
  root = parse_texi_file ();
}

ELEMENT *
get_root (void)
{
  return root;
}

char *
element_type_name (ELEMENT *e)
{
  return element_type_names[(e)->type];
}

int
num_contents_children (ELEMENT *e)
{
  return e->contents.number;
}

int
num_args_children (ELEMENT *e)
{
  return e->args.number;
}

