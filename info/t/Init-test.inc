# Set up test environment. This file is not to be run directly, but to
# be sourced by the other tests.

# Allow running with "make check" and individual tests at the command-line
srcdir=${srcdir:-.}

GINFO="./ginfo --init-file $srcdir/t/Info-config"

# Only look for Info files in our test directory
export infodir=$srcdir/t/infodir
export INFOPATH=$infodir

# Dump nodes with M-x print-node
# TODO: Use different output files in each test to allow running them
# in parallel.
export INFO_PRINT_COMMAND='>t/ginfo-output'

# Remove any accidentally left over files from previous tests
rm -f t/ginfo-output

# Not an interactive test
PTY_PID=0
