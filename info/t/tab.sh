#!/bin/sh

. t/Init-test.inc
. t/Init-intera.inc

# Tab to first link and follow it
$GINFO -f intera --restore t/tab.drib

test -f t/ginfo-output || exit 1
diff t/ginfo-output t/node-target
RETVAL=$?

. t/Cleanup.inc

