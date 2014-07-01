# Cleanup and exit. 

# Delete created files and kill spawned processes if any.
rm -f $GINFO_OUTPUT
rm -f $0.pipein $0.pipeout
test $PTY_PID -ne 0 && kill $PTY_PID

exit $RETVAL
