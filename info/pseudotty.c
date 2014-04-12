/* Copyright 2014 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>. */

/* pseudotty - open pseudo-terminal and print name of slave device to
   standard output.  Read and ignore any data sent to terminal.  This
   is so we can run tests interactively without messing up the screen. */

#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/ioctl.h>

int master, slave;
char *name;
char dummy; 

main ()
{
  if ((master = getpt ()) == -1)
    exit (1);

  if (grantpt (master) < 0 || unlockpt (master) < 0)
    exit (1);
  if (!(name = ptsname (master)))
    exit (1);

  slave = open (name, O_RDWR);
  if (slave == -1)
    exit (1);
  printf ("%s\n", name);
  fclose (stdout);

  while (read (master, &dummy, 1) > 0)
    ;
}
