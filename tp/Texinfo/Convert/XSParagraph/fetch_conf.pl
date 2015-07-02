#!/usr/bin/env perl
use strict;

use Config;

my $name = shift;
print $Config{$name};


