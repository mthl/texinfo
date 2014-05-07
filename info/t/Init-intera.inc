# Initialize test of interactive operation  
# This file is not to be run directly

# Code to redirect output to pseudoterminal
# We could perhaps use AM_TESTS_FD_REDIRECT in Makefile.am instead,
# although this would stop us from running test scripts from the command-line.

# FIXME: If ginfo segfaults in the middle of a test when running interactively,
# it will mess up the terminal settings, even though both stdout and stderr
# have been redirected.  A newline character sent to the terminal does not
# do a carriage return, and characters typed at the keyboard are not echoed.
# Find out why this is happening.  The program must still have some
# reference to the terminal.

GINFO_PTY_FILE=$0.pty
rm -f $GINFO_PTY_FILE
./pseudotty >$GINFO_PTY_FILE &
PTY_PID=$!
# Wait for pseudotty process to create file
while test ! -f $GINFO_PTY_FILE; do sleep 1; done
exec >"$(cat $GINFO_PTY_FILE | tr -d '\n')"
exec 2>"$(cat $GINFO_PTY_FILE | tr -d '\n')"
rm -f $GINFO_PTY_FILE

