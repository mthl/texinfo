# Initialize test of interactive operation  
# This file is not to be run directly

# Code to redirect output to pseudoterminal
# We could perhaps use AM_TESTS_FD_REDIRECT in Makefile.am instead,
# although this would stop us from running test scripts from the command-line.

GINFO_PTY_FILE=$0.pty
rm -f $GINFO_PTY_FILE
./pseudotty >$GINFO_PTY_FILE &
PTY_PID=$!
# Wait for pseudotty process to create file
while test ! -f $GINFO_PTY_FILE; do sleep 1; done
exec >"$(cat $GINFO_PTY_FILE | tr -d '\n')" 2>&1 0<&1
rm -f $GINFO_PTY_FILE

