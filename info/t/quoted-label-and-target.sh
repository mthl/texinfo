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

. t/Init-test.inc
. t/Init-intera.inc

# Follow a cross-reference with both the label and destination quoted.
$GINFO -f quoting --restore $t/quoted-label-and-target.drib

test -f $GINFO_OUTPUT || exit 1
# Return non-zero (test failure) if files differ
diff $GINFO_OUTPUT $t/node-target
RETVAL=$?

. t/Cleanup.inc

