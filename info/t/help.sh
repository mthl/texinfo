#!/bin/sh

. t/Init-test.inc

# Test --help flag
$GINFO --help | grep 'strict-node-location'
