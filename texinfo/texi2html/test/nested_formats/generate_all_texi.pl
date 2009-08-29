#! /usr/bin/perl -w

# expand the manuals with nested formats using texi2html and test
# with makeinfo on these expanded manuals (it is likely that makeinfo 
# cannot expand those manuals in some cases).
use strict;

open (TXT, 'tests.txt') or die "Cannot open tests.txt: $!\n";

mkdir ("all_texi");

while (<TXT>)
{
   next if /^\s*\#/;
   if (/^(\w+) nested_formats.texi -D (\w+) *$/)
   {
      my $dir = $1;
      my $def = $2;
      my $format;
      mkdir ("all_texi/$dir");
      if ($def =~ /[a-z]+_([a-z]+)$/)
      {
         $format = $1;
      }
      system("perl -w -x ../../texi2html.pl  nested_formats.texi -D $def --macro-expand=all_texi/$format-nested_formats.texi");
      system ("cp all_texi/$format-nested_formats.texi all_texi/$dir/nested_formats.texi");
      #system ("perl -w -x ../../texi2html.pl -D $def --expand-macro=all_texi/$dir/$format-nested_formats.texi");
      system ("cd all_texi/$dir/ && makeinfo --force nested_formats.texi 2>nested_formats.2");
   }
   else
   {
       print STDERR "Ignoring $_";
   }
}
