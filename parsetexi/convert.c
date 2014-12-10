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
