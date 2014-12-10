#include <stdarg.h>
#include <stdio.h>

/* Whether to dump debugging output on stderr. */
int debug_output = 1;

void
debug (char *s, ...)
{
  va_list v;

  if (!debug_output)
    return;
  va_start (v, s);
  vfprintf (stderr, s, v);
  fputc ('\n', stderr);
}

void
debug_nonl (char *s, ...)
{
  va_list v;

  if (!debug_output)
    return;
  va_start (v, s);
  vfprintf (stderr, s, v);
}
