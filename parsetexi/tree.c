#include <stdlib.h>
#include <string.h>

#include "tree_types.h"
#include "tree.h"

ELEMENT *
new_element (enum element_type type)
{
  ELEMENT *e = malloc (sizeof (ELEMENT));

  /* Zero all elements */
  memset (e, 0, sizeof (*e));

  e->type = type;
  e->cmd = CM_NONE;
  e->args.list = 0;
  e->args.space = 0;
  e->args.number = 0;
  e->contents.list = 0;
  e->contents.space = 0;
  e->contents.number = 0;
  e->parent = 0;
  e->extra = 0;

  return e;
}

void
destroy_element (ELEMENT *e)
{
  free (e);
}

/* Make sure there is space for at least one more element. */
static void
reallocate_list (ELEMENT_LIST *list)
{
  if (list->number + 1 >= list->space)
    {
      list->space += 10;
      list->list = realloc (list->list, list->space * sizeof (ELEMENT));
      if (!list->list)
        abort (); /* Out of memory. */
    }
}

void
add_to_element_contents (ELEMENT *parent, ELEMENT *e)
{
  ELEMENT_LIST *list = &parent->contents;
  reallocate_list (list);

  list->list[list->number++] = e;
  e->parent = parent;
}

void
add_to_element_args (ELEMENT *parent, ELEMENT *e)
{
  ELEMENT_LIST *list = &parent->args;
  reallocate_list (list);

  list->list[list->number++] = e;
  e->parent = parent;
}

void
insert_into_contents (ELEMENT *parent, ELEMENT *e, int where)
{
  ELEMENT_LIST *list = &parent->contents;
  reallocate_list (list);

  if (where < 0)
    where = list->number + where;

  if (where < 0 || where > list->number)
    abort ();

  memmove (&list->list[where + 1], &list->list[where],
           (list->number - where) * sizeof (ELEMENT));
  list->list[where] = e;
  list->number++;
}


ELEMENT *
pop_element_from_contents (ELEMENT *parent)
{
  ELEMENT_LIST *list = &parent->contents;

  return list->list[--list->number];
}

ELEMENT *
last_args_child (ELEMENT *current)
{
  if (current->args.number == 0)
    return 0;

  return current->args.list[current->args.number - 1];
}

ELEMENT *
last_contents_child (ELEMENT *current)
{
  if (current->contents.number == 0)
    return 0;

  return current->contents.list[current->contents.number - 1];
}

ELEMENT *
contents_child_by_index (ELEMENT *e, int index)
{
  if (index < 0)
    index = e->contents.number + index;

  if (index < 0 || index >= e->contents.number)
    return 0;

  return e->contents.list[index];
}

ELEMENT *
args_child_by_index (ELEMENT *e, int index)
{
  if (index < 0)
    index = e->args.number + index;

  if (index < 0 || index >= e->args.number)
    return 0;

  return e->args.list[index];
}
