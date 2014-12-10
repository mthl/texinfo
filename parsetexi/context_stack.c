#include <stdlib.h>

#include "context_stack.h"

static enum context *stack;
static size_t top; /* One above last pushed context. */
static size_t space;

void
push_context (enum context c)
{
  if (top >= space)
    {
      stack = realloc (stack, (space += 5) * sizeof (enum context));
    }

  stack[top++] = c;
}

enum context
pop_context ()
{
  if (top == 0)
    abort ();

  return stack[--top];
}

enum context
current_context (void)
{
  if (top == 0)
    return ct_NONE;

  return stack[top - 1];
}
