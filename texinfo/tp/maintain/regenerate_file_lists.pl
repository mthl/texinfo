#! /usr/bin/perl -w
#
# Copyright 2011 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
# Originally written by Patrice Dumas.

use strict;
use File::Find;

my %files;

(my $mydir = $0) =~ s,/[^/]+$,,;
chdir("$mydir/..") || die "chdir $mydir/..: $!";
-d "t" || (die "goodbye, no t directory in " . `pwd`);

find (\&wanted, ('t'));
sub wanted 
{
  if (/\.pl$/ and $File::Find::dir =~ /^t\/results\//) {
    $files{$File::Find::name} = 1;
  }
}

my %new_files = %files;
open (FILE, "MANIFEST") or die "Open MANIFEST: $!";
while (<FILE>) {
  chomp;
  delete ($new_files{$_});
}
#print join("\n", sort(keys(%new_files))) ."\n";

open (INCLUDE, '>Makefile.tres') or die "Open >Makefile.treas: $!";
print INCLUDE "test_results =";
foreach my $file (sort(keys(%files))) {
  print INCLUDE " \\\n  $file";
}
print INCLUDE "\n";
