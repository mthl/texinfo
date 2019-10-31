#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <dirent.h>
#include <sys/stat.h>

#include <gmodule.h>

#include "infopath.h"

char *default_path[] = { "/usr/share/info/html",
                         "/usr/local/share/info/html",
                         NULL };

static GArray *dirs;

static int initialized = 0;

void
init_infopath (void)
{
  initialized = 1;

  dirs = g_array_new (TRUE, TRUE, sizeof (char *));

  char **p;
  for (p = default_path; (*p); p++)
    {
      g_array_append_val (dirs, *p);
    }

  char *datadir = getenv ("INFO_HTML_DIR");
  if (datadir)
    {
      g_array_append_val (dirs, datadir);
    }
}

/* Return pathname of the idirectory containing an HTML manual.*/
char *
locate_manual (const char *manual)
{
  if (!initialized)
    init_infopath ();

  int i;
  char *datadir;

  for (i = 0; (datadir = g_array_index (dirs, char *, i)); i++)
    {
      /* Check if datadir exists. */
      DIR *d = opendir (datadir);
      if (!d)
        continue;
      closedir (d);

      char *s = malloc (strlen (datadir) + strlen ("/") + strlen (manual) + 1);
      sprintf (s, "%s/%s", datadir, manual);

      d = opendir (s);
      if (!d)
        {
          free (s);
          continue;
        }
      closedir (d);

      char *s2 = malloc (strlen (datadir) + strlen ("/")
                         + strlen (manual) + strlen ("/index.html") + 1);
      sprintf (s2, "%s/%s/index.html", datadir, manual);

      struct stat dummy;
      if (stat (s2, &dummy) == -1)
        {
          free (s); free (s2);
          continue;
        }

      free (s2);
      return s;
    }
  return 0;
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
