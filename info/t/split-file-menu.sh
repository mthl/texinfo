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
. $t/Init-intera.inc

# Follow a menu entry in a split file to a node in a different subfile from
# the one containing "Top".  Check that we arrived properly and remembered
# that we are in a split file by going back to "Top" with "t".
$GINFO -f split 'Second' --restore $t/back-to-top.drib

if ! test -f $GINFO_OUTPUT
then
	RETVAL=1
else
	grep 'Node: Top' $GINFO_OUTPUT
	RETVAL=$?
fi

. $t/Cleanup.inc
