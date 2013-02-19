#! /usr/bin/perl -w

# Patrice Dumas pertusus at free.fr, 2008:
# this file is in the public domain

# the resulting code may be under the texinfo/makeinfo/lang.c license.

# ./parse_8bit_makeinfo_maps.pl > eigth_bit_makeinfo_maps.pl

use strict;

my $lang_file = '../texinfo/makeinfo/lang.c';

open (LANGF, "$lang_file") or die "Cannot open $lang_file: $!\n";

my $in_map=0;
my %unicode_translit = ();

print "%makeinfo_eight_bit_map = (\n";

while (<LANGF>)
{
  if ($in_map)
  {
    if  (/^\s*\{\s*NULL\s*,\s*0\s*,\s*0\s*\}/)
    {
       $in_map=0;
       print "   },\n";
       next;
    }
    elsif (/^\s*\{\s*\"(\w*)\"\s*,\s*0x([0-9abcdef]{2})\s*,\s*0x([0-9abcdef]{4})\s*(,\s*\"(\w*)\"\s*)?\}/i)
    {
       my $entity = $1;
       my $eight_bit = uc($2);
       my $unicode = uc($3);
       my $transliteration_str = 'UNDEF';
       my $transliteration;
       if (defined($5))
       {
          $transliteration_str = $transliteration = $5;
          
          if (exists($unicode_translit{$unicode}) and $unicode_translit{$unicode} ne $transliteration)
          {
             print STDERR "$in_map,$eight_bit,$unicode: $unicode_translit{$unicode} ne $transliteration\n";
          }
          $unicode_translit{$unicode} = $transliteration;
       }
       print "      '$unicode' => '$eight_bit',\n";
#print STDERR "$entity $eight_bit $unicode $transliteration_str\n";
    }
  }
  elsif (/^\s*static\s+iso_map_type\s+(\w+?)_map/)
  {
    next if /\s*\{\s*NULL\s*,\s*0\s*,\s*0\s*\}/;
    $in_map = $1;
    #print STDERR "$in_map\n";
    print "   '$in_map' => {\n";
  }
}

print ");\n\n";

print "%makeinfo_transliterate_map = (\n";
foreach my $unicode (keys(%unicode_translit))
{
  print "  '$unicode' => '$unicode_translit{$unicode}',\n";
}
print ");\n\n";
