#!/bin/sh
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

srcdir=${srcdir:-.}
. $srcdir/t/Init-test.inc
. $t/Init-inter.inc

# Go to anchor in a UTF-8 encoded file. 
1>$PTY_TYPE \
  printf 'ganchor-2\r\002\002\002\002\002\002\002\002\002\002\002\002\002\002\rDq' &

LANG=en_US.iso8859-1 $GINFO -f anchors

if ! test -f $GINFO_OUTPUT
then
	RETVAL=1
else
	# Return non-zero (test failure) if files differ
	diff $GINFO_OUTPUT $t/node-target
	RETVAL=$?
fi

. $t/Cleanup.inc

