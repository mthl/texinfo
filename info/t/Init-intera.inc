# Initialize test of interactive operation

# Code to redirect output to pseudoterminal
# We could perhaps use AM_TESTS_FD_REDIRECT in Makefile.am instead,
# although this would stop us from running test scripts from the command-line.

rm -f pty_file
./pseudotty >pty_file &
PTY_PID=$!
# Wait for pseudotty process to create file
while test ! -f pty_file; do sleep 1; done
exec >"$(cat pty_file | tr -d '\n')"

