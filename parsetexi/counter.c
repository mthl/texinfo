#include "tree_types.h"
#include "counter.h"

void
counter_push (COUNTER *c, ELEMENT *elt, int num)
{
  if (c->nvalues >= c->space - 1)
    {
      c->space += 5;
      c->values = realloc (c->values, c->space * sizeof (int));
      c->elts = realloc (c->elts, c->space * sizeof (ELEMENT *));
      if (!c->values)
        abort ();
    }
  c->values[c->nvalues] = num;
  c->elts[c->nvalues] = elt;

  c->nvalues++;
  c->values[c->nvalues] = 0;
  c->elts[c->nvalues] = 0;
}

void
counter_pop (COUNTER *c)
{
  if (!c->nvalues)
    abort ();

  c->nvalues--;
  c->values[c->nvalues] = 0;
  c->elts[c->nvalues] = 0;
}

void
counter_inc (COUNTER *c)
{
  c->values[c->nvalues - 1]++;
}

void
counter_dec (COUNTER *c)
{
  c->values[c->nvalues - 1]--;
}

/* Return value of counter if the top counter is for element ELT, otherwise
   return -1. */
int
counter_value (COUNTER *c, ELEMENT *elt)
{
  if (c->nvalues > 0 && c->elts[c->nvalues - 1] == elt)
    return c->values[c->nvalues - 1];
  else
    return -1;
}
