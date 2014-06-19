# Set up test environment 
# This file is not to be run directly 

# Allow running with "make check" and individual tests at the command-line
srcdir=${srcdir:-.}

GINFO="./ginfo --init-file $srcdir/t/Infokey-config"

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

# TODO: Exit test after so long, in case (for example) we get stuck in
# interactive mode.
