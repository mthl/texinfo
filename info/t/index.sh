#!/bin/sh

. t/Init-test.inc
. t/Init-intera.inc 

# Follow an index entry

rm -f t/ginfo-output
$GINFO -f intera --restore t/index.drib
kill $PTY_PID

test -f t/ginfo-output || exit 1

# Return non-zero (test failure) if files differ
diff t/ginfo-output t/node-target
