#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <dirent.h>
#include <sys/stat.h>

#include "infopath.h"

static char *datadir;
long datadir_len;

/* Return pathname of the main index.html file for a HTML manual.*/
char *
locate_manual (const char *manual)
{
  if (!datadir)
    {
      datadir = getenv ("INFO_HTML_DIR");
      if (!datadir)
        return 0;
      datadir_len = strlen (datadir);
      g_print ("datadir is %s\n", datadir);
    }

  /* Check if datadir exists. */
  DIR *d = opendir (datadir);
  if (!d)
    {
      fprintf (stderr, "Could not open %s\n", datadir);
      return 0;
    }
  closedir (d);

  char *s = malloc (datadir_len + strlen ("/") + strlen (manual) + 1);
  sprintf (s, "%s/%s", datadir, manual);

  d = opendir (s);
  if (!d)
    {
      fprintf (stderr, "Could not open %s\n", s);
      free (s);
      return 0;
    }
  closedir (d);

  free (s);
  s = malloc (datadir_len + strlen ("/")
                    + strlen (manual) + strlen ("/index.html") + 1);
  sprintf (s, "%s/%s/index.html", datadir, manual);

  struct stat dummy;
  if (stat (s, &dummy) == -1)
    {
      fprintf (stderr, "no file %s\n", s);
      return 0;
    }
  return s;
}

/* Extract the manual and node from a URL like "file:/.../MANUAL/NODE.html".  */
void
parse_external_url (const char *url, char **manual, char **node)
{
  char *m = 0, *n = 0;

  /* Find the second last / in the url. */
  char *p1 = 0, *p2 = 0;
  char *p, *q;

  p1 = strchr (url, '/');
  if (!p1)
    goto failure;
  p2 = strchr (p1 + 1, '/');
  if (!p2)
    goto failure;

  while (1)
    {
      /* p1 and p2 are two subsequent / in the string. */

      q = strchr (p2+1, '/');
      if (!q)
        break;

      p1 = p2;
      p2 = q;
    }

  p = p1 + 1;
  q = p2;

  m = malloc (q - p + 1);
  memcpy (m, p, q - p);
  m[q - p] = '\0';

  *manual = m;

  q++; /* after '/' */
  p = strchr (q, '.');
  if (memcmp (p, ".html", 5) != 0)
    goto failure;
  n = malloc (p - q + 1);
  memcpy (n, q, p - q);
  n[p - q] = '\0';

  *node = n;

  return;

failure:
  g_print ("failure\n");
  free (m); free(n);
  *manual = 0;
  *node = 0;
  return;
}
