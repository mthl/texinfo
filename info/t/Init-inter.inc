# Copyright (C) 2014 Free Software Foundation, Inc.
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

# Initialize test of interactive operation
# This file is not to be run directly

# Avoid ginfo complaining that terminal is too dumb
export TERM=vt100

# Create named pipes to communicate with pseudotty program
rm -f $0.pipein $0.pipeout
mknod $0.pipein p
mknod $0.pipeout p
PTY_TYPE=$0.pipeout

# We can feed input bytes into $PTY_TYPE to be passed onto ginfo.  pseudotty
# only reads from fd 3, but opening the pipe read-write means: (i) there will
# always be a process with it open for writing, so pseudotty will not hang when
# opening it; and (ii) select() will never return for an end-of-file on fd 3.
./pseudotty >$0.pipein 3<>$PTY_TYPE &
PTY_PID=$!

# Get name of pseudo-terminal slave device
read PTS_DEVICE <$0.pipein

# Must redirect fd 0 read-write if we want to duplicate it for reading on fd 1
echo "Redirecting stdin and stdout to $PTS_DEVICE."
exec 0<>$PTS_DEVICE 1<&0

# glibc can kill a running process if it detects a condition like a
# double free.  This specifies that the message it prints when it does
# this should be sent to stderr so it can be recorded in the test *.log
# files.
export LIBC_FATAL_STDERR_=1

run_ginfo ()
{
  rm -f $0.finished
  mkfifo $0.finished
  { $GINFO "$@" ; test $? -eq 0 || echo failure >$0.finished ;
    echo finished >$0.finished ; } 0<>$PTS_DEVICE 1<&0 &
}


