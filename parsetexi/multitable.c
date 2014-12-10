#include "parser.h"

/* Return the parent if in an item_line command, @*table */
ELEMENT *
item_line_parent (ELEMENT *current)
{
  if (current->cmd == CM_item || current->cmd == CM_itemx)
    current = current->parent->parent;
  else if (current->type == ET_before_item && current->parent)
    current = current->parent;

  if (item_line_command (current->cmd))
    return current;

  return 0;
}

/* Return the parent if in a multitable. */
ELEMENT *
item_multitable_parent (ELEMENT *current)
{
  if (current->cmd == CM_headitem
      || current->cmd == CM_item
      || current->cmd == CM_tab)
    {
      if (current->parent && current->parent->parent)
        current = current->parent->parent;
    }
  else if (current->type == ET_before_item)
    {
      current = current->parent;
    }

  if (current->cmd == CM_multitable)
    return current;

  return 0;
}
