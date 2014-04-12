#!/bin/sh

. t/Init-test.inc

# Look for a non-existent entry in dir
$GINFO --output - not-a-file 2>&1 | grep 'No menu item'

