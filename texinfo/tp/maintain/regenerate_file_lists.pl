#! /usr/bin/perl -w

use strict;

use File::Find;

my %files;
find (\&wanted, ('t'));

sub wanted 
{
  if (/\.pl$/ and $File::Find::dir =~ /^t\/results\//) {
    $files{$File::Find::name} = 1;
  }
}

my %new_files = %files;

open (FILE, "MANIFEST") or die "Open MANIFEST: $!\n";

while (<FILE>) {
  chomp;
  delete ($new_files{$_});
}

print join("\n", sort(keys(%new_files))) ."\n";

#if (! -d "tmp") {
#  mkdir "tmp" or die "mkdir tmp: $!\n";
#}
#open (OUT, '>maintain/MANIFEST_test_results') or die "Open maintain/MANIFEST_test_results: $!\n";
open (INCLUDE, '>Makefile.incl') or die "Open Makefile.incl: $!\n";
print INCLUDE "test_results =";

foreach my $file (sort(keys(%files))) {
#  print OUT "$file\n";
  print INCLUDE " \\\n\t$file";
}
print INCLUDE "\n\n";
