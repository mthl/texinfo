# Cleanup and exit. 

# Delete created files and kill spawned processes if any.
rm -f t/ginfo-output
rm -f pty_file
test $PTY_PID -ne 0 && kill $PTY_PID

exit $RETVAL
