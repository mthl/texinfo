# Set up test environment 
# This file is not to be run directly 

# Allow running with "make check" and individual tests at the command-line
srcdir=${srcdir:-.}

# Use the second line to run the program under valgrind.
GINFO="./ginfo --init-file $srcdir/t/Infokey-config"
#GINFO="valgrind --log-file=$0.val.log --leak-check=full ./ginfo --init-file $srcdir/t/Infokey-config"

# Set this to the name of the process
GINFO_NAME=ginfo
#GINFO_NAME=memcheck-x86-li

# Only look for Info files in our test directory
export infodir=$srcdir/t/infodir
export INFOPATH=$infodir

export t=$srcdir/t

GINFO_OUTPUT=$0.out
# Remove left over file from previous tests
rm -f $GINFO_OUTPUT

# File to dump nodes to with M-x print-node
export INFO_PRINT_COMMAND=">$GINFO_OUTPUT"

# Not an interactive test
PTY_PID=0

# Get error messages in English
LC_ALL=C; export LC_ALL

# Make sure that non-interactive operation works even if terminal is dumb
export TERM=dumb
