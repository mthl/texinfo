# Initialize test of interactive operation  
# This file is not to be run directly

# Code to redirect output to pseudoterminal
# We could use AM_TESTS_FD_REDIRECT in Makefile.am instead, but
# this would stop us from running test scripts from the command-line.

# Avoid info complaining that terminal is too dumb
export TERM=vt100

GINFO_PTY_FILE=$0.pty
rm -f $GINFO_PTY_FILE
./pseudotty >$GINFO_PTY_FILE &
PTY_PID=$!

# Wait for pseudotty process to create file containing name
# of pts device file to use for input/output.
while test ! -f $GINFO_PTY_FILE
do
	# Sleep for 1 ms if usleep is available
	usleep 1000 2>/dev/null || sleep 1
done
PTS_DEVICE="$(cat $GINFO_PTY_FILE | tr -d '\n')"
rm -f $GINFO_PTY_FILE

# Wait for pts device file to actually appear.  This shouldn't be
# necessary, but occasionally we get a "no such file or directory"
# error when we redirect the file descriptors below.
while test ! -c $PTS_DEVICE
do
	usleep 1000 2>/dev/null || sleep 1
done

echo "Redirecting standard file descriptors to $PTS_DEVICE."
exec 0>$PTS_DEVICE 1<&0 2<&0

