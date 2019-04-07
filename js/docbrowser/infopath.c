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
  fprintf (stderr, "In C now, looking for %s\n", manual);

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

  char *s = malloc (datadir_len + strlen ("/examples/")
                    + strlen (manual) + 1);
  sprintf (s, "%s/examples/%s", datadir, manual);

  d = opendir (s);
  if (!d)
    {
      fprintf (stderr, "Could not open %s\n", s);
      return 0;
    }
  closedir (d);

  fprintf (stderr, "success so far\n");
  free (s);
  s = malloc (datadir_len + strlen ("/examples/")
                    + strlen (manual) + strlen ("/index.html") + 1);
  sprintf (s, "%s/examples/%s/index.html", datadir, manual);

  struct stat dummy;
  if (stat (s, &dummy) == -1)
    {
      fprintf (stderr, "no file %s\n", s);
      return 0;
    }
  return s;
}
