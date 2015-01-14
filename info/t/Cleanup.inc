# Copyright (C) 2014, 2015 Free Software Foundation, Inc.
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

# Cleanup and exit for tests

# Delete created files and kill spawned processes if any.
rm -f $GINFO_OUTPUT
rm -f $PIPEIN $PIPEOUT
test $PTY_PID -ne 0 && kill $PTY_PID

if test -n "$TIMED_OUT"; then
  return 1
fi
exit $RETVAL
