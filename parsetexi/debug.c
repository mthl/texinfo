#include <stdarg.h>
#include <stdio.h>


void
debug (char *s, ...)
{
  //return;
  va_list v;
  va_start (v, s);
  vfprintf (stderr, s, v);
  fputc ('\n', stderr);
}

void
debug_nonl (char *s, ...)
{
  //return;
  va_list v;
  va_start (v, s);
  vfprintf (stderr, s, v);
}
