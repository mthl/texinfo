#!/bin/sh

. t/Init-test.inc

# Load a node in loaded file using --node.  Note that the file has to specified
# by --file, and not reached through the dir file.

$GINFO --output - --file file-menu --node Unreachable \
	| grep 'not linked to elsewhere'
