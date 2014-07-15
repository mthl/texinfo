# Copyright (C) 2014 Free Software Foundation, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Shell script snippet.  Wait for program to finish.

read -t 3 FINISHED <>$0.finished
rm -f $0.finished
if ! test "$FINISHED" = finished
then
  echo 'Program timed out after 3 seconds' >&2
  TIMED_OUT=1

  # We could kill ginfo here if we had its PID.  However, it will probably exit
  # with an I/O error when pseudotty is killed in Cleanup.inc.
fi
