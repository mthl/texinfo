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
      datadir = getenv ("QTINFO_DATADIR");
      if (!datadir)
        return 0;
      datadir_len = strlen (datadir);
    }

  /* Check if datadir exists. */
  DIR *d = opendir (datadir);
  if (!d)
    {
      fprintf (stderr, "Could not open %s\n", datadir);
      return 0;
    }
  closedir (d);

  char *s = malloc (datadir_len + strlen ("/test/")
                    + strlen (manual) + 1);
  sprintf (s, "%s/test/%s", datadir, manual);

  d = opendir (s);
  if (!d)
    {
      fprintf (stderr, "Could not open %s\n", s);
      return 0;
    }
  closedir (d);

  free (s);
  s = malloc (datadir_len + strlen ("/test/")
                    + strlen (manual) + strlen ("/index.html") + 1);
  sprintf (s, "%s/test/%s/index.html", datadir, manual);

  struct stat dummy;
  if (stat (s, &dummy) == -1)
    {
      fprintf (stderr, "no file %s\n", s);
      return 0;
    }
  return s;
}

/* Extract the manual and node from a URL like "../MANUAL/NODE.html" */
void
parse_external_url (const char *url, char **manual, char **node)
{
  char *m = 0, *n = 0;

  char *p = strchr (url, '/') + 1; /* after "../" */
  if (!p)
    goto failure;
  char *q = strchr (p, '/');
  if (!q)
    goto failure;

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
  free (m); free(n);
  *manual = 0;
  *node = 0;
  return;
}
