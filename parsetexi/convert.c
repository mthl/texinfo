#include <stdlib.h>

#include "tree_types.h"

/* Stub for Texinfo::Convert::Text::convert */
char *
text_convert (ELEMENT *e)
{
  int which = e->contents.number;
  which--;
  if (which > 0)
    {
      if (e->contents.list[which]->type == ET_spaces_at_end)
        which--;

      if (which > 0)
        return e->contents.list[which]->text.text;
    }
  return "bar";
}

/* Stub for Texinfo::Convert::NodeNameNormalization::normalize_node. */
char *
convert_to_normalized (ELEMENT *label)
{
  int i;

  /* Return text of the first contents child that has text. */
  for (i = 0; i < label->contents.number; i++)
    {
      if (label->contents.list[i]->text.end > 0)
        return label->contents.list[i]->text.text;
    }
  return 0;
}
