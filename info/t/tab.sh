#!/bin/sh

. t/Init-test.inc

# Tab to first link and follow it

./pseudotty >pty_file &
PTY_PID=$!
exec >"$(cat pty_file | tr -d '\n')"
rm -f pty_file

rm -f t/ginfo-output
$GINFO -f intera --restore t/tab.drib
kill $PTY_PID

test -f t/ginfo-output || exit 1
diff t/ginfo-output t/node-target
RETVAL=$?
rm -f t/ginfo-output

exit $RETVAL

