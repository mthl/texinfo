#!/bin/sh

. t/Init-test.inc

# Follow a menu in a file
$GINFO --output - file-menu 'First entry' | grep 'Arrived at Node 1.'

