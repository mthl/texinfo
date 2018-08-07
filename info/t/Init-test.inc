# Copyright (C) 2014, 2015, 2016, 2017, 2018 Free Software Foundation, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Set up standalone info test environment 
# This file is to be sourced, not to be run directly 

# write each expanded command to the *.log file for the test.
set -x

# Allow running with "make check" and individual tests at the command-line
srcdir=${srcdir:-.}

# Use the second line to run the program under valgrind.
GINFO="./ginfo --init-file $srcdir/t/Infokey-config"
#GINFO="valgrind --log-file=$0.val.log --leak-check=full ./ginfo --init-file $srcdir/t/Infokey-config"

# Set this to the name of the process
GINFO_NAME=ginfo
#GINFO_NAME=memcheck-x86-li

# Only look for Info files in our test directory
infodir=$srcdir/t/infodir; export infodir
INFOPATH=$infodir; export INFOPATH

t=$srcdir/t; export t

GINFO_OUTPUT=t/`basename $0.out`

# These are only used for interactive tests
PIPEIN=t/`basename $0.pipein`
PTY_TYPE=t/`basename $0.pipeout`

# Remove left over file from previous tests
rm -f $GINFO_OUTPUT

# File to dump nodes to with M-x print-node
INFO_PRINT_COMMAND=">$GINFO_OUTPUT"; export INFO_PRINT_COMMAND

# Not an interactive test
PTY_PID=0

# Get error messages in English
LC_ALL=C; export LC_ALL

# Make sure that non-interactive operation works even if terminal is dumb
TERM=dumb; export TERM

# For interactive tests, we try to set this in Init-inter.inc
STTY=true
reset_required=no

# Clean up if the test is interrupted, for example if the user types
# C-c, to avoid lingering child processes.  Signal 2 is SIGINT.
trap cleanup 2

# Cleanup and exit
cleanup ()
{
  # Delete created files and kill spawned processes if any.
  test $PTY_PID -ne 0 && kill $PTY_PID

  rm -f $GINFO_OUTPUT
  rm -f $PIPEIN $PTY_TYPE
  
  # We do this because some versions of ksh93 (including that in
  # Solaris 11) have a bug where a timed-out "read -t" can mess up
  # the terminal settings, leading to characters not being echoed.
  # This is only done if we don't start with "-echo" at the beginning.
  test $reset_required = yes && { $STTY | grep '[-]echo' ; } && $STTY sane

  #killall `basename $0`  # see below
  exit $RETVAL
}

# Uncomment this line and "killall" above if previous test runs were not
# cleaned up properly, and rerun "make check".

#cleanup

timeout_test ()
{
  wait $GINFO_PID
  status=$?

  # If the program was not ended by a signal, kill the subshell that 
  # is waiting to send it a signal.
  test $status -lt 128 && kill $KILLER_PID
  
  RETVAL=0
  if test $status != 0; then
    RETVAL=1
  fi
  
  # Program is gone, so avoid trying to kill it in cleanup
  GINFO_PID=0
}

# Functions for interactive tests


#  we may look up whether a couple of utilities exist.

path_sep=":"

# findprog PROG - Return true if PROG is somewhere in PATH, else false.
findprog ()
{
  saveIFS=$IFS
  IFS=$path_sep  # break path components at the path separator
  for dir in $PATH; do
    IFS=$saveIFS
    # The basic test for an executable is `test -f $f && test -x $f'.
    # (`test -x' is not enough, because it can also be true for directories.)
    # We have to try this both for $1 and $1.exe.
    #
    # Note: On Cygwin and DJGPP, `test -x' also looks for .exe.  On Cygwin,
    # also `test -f' has this enhancement, but not on DJGPP.  (Both are
    # design decisions, so there is little chance to make them consistent.)
    # Thusly, it seems to be difficult to make use of these enhancements.
    #
    if   { test -f "$dir/$1"     && test -x "$dir/$1"; } \
      || { test -f "$dir/$1.exe" && test -x "$dir/$1.exe"; }; then
      return 0
    fi
  done
  return 1
}

# Initialize test of interactive operation
init_interactive_test ()
{
  test -v initialization_done && return 0
  initialization_done=1

  # Skip test if pseudotty wasn't built
  test -x pseudotty || exit 77
  
  # Avoid ginfo complaining that terminal is too dumb
  TERM=vt100; export TERM
  
  # See 'cleanup' function
  findprog stty && { STTY=stty ; reset_required=yes ; }
  test $reset_required=yes && { $STTY | grep [-]echo ; } && reset_required=no
  
  # Create named pipes to communicate with pseudotty program, or quit.
  rm -f $PIPEIN $PTY_TYPE # must already be defined
  if findprog mkfifo; then
    mkfifo $PIPEIN
    mkfifo $PTY_TYPE
    #
    if test ! -r $PIPEIN || test ! -r $PTY_TYPE; then
      echo "$0: could not mkfifo pipes" >&2
      exit 77
    fi
    # ok, we'll proceed with the test.
  else
    echo "$0: mkfifo program not found - cannot make named pipes" >&2
    exit 77
  fi
  
  # We can feed input bytes into $PTY_TYPE to be passed onto ginfo, as
  # if they were typed by a user in an interactive session.
  # We redirect to the FIFO within a subshell, because under NetBSD 6.1.4
  # it hangs otherwise.
  (exec ./pseudotty "$PTY_TYPE" >$PIPEIN) &
  PTY_PID=$!
  # Get name of pseudo-terminal slave device
  read PTS_DEVICE <$PIPEIN
  
  # Keeping the FIFO open for writing prevents the select call in
  # pseudotty returning EOF after a single "printf something >$PTY_TYPE".
  exec 7>$PTY_TYPE
  
  # glibc can kill a running process if it detects a condition like a
  # double free.  This specifies that the message it prints when it does
  # this should be sent to stderr so it can be recorded in the test *.log
  # files.
  LIBC_FATAL_STDERR_=1; export LIBC_FATAL_STDERR
}

run_ginfo ()
{
  init_interactive_test
  (
    exec 7>&- ; # Close fd from parent shell

    exec $GINFO $GINFO_OPTIONS "$@" 0<>$PTS_DEVICE 1<&0 ; ) &

  GINFO_PID=$!
  (sleep 3 ; kill $GINFO_PID) &
  KILLER_PID=$!
}
