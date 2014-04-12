#!/bin/sh

. t/Init-test.inc

# Try to select a non-existent menu item
$GINFO --output - file-menu 'Not an entry' 2>&1 | grep 'No menu item'

