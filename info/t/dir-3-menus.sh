#!/bin/sh

. t/Init-test.inc

# Follow several menus in a file to get to desired node
$GINFO --output - file-menu 'First entry' 'Node 2' 'Node 3' \
	| grep 'Arrived at Node 3.'

