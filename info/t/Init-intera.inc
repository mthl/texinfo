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

# Wait for file to actually appear, and to contain a
# valid name of a device file.
while :
do
	PTS_DEVICE="$(cat $GINFO_PTY_FILE | tr -d '\n')"
	if test -c "$PTS_DEVICE"
	then
		break
	fi
	usleep 1000 2>/dev/null || sleep 1
done
rm -f $GINFO_PTY_FILE

echo "Redirecting stdin and stdout to $PTS_DEVICE."
exec 0>$PTS_DEVICE 1<&0

# glibc can kill a running process if it detects a condition like a
# double free.  This specifies that the message it prints when it does
# this should be sent to stderr so it can be recorded in the test *.log
# files.
export LIBC_FATAL_STDERR_=1

