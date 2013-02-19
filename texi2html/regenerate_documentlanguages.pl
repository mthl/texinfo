#! /usr/bin/perl -w

use strict;

system ("wget -N http://www.iana.org/assignments/language-subtag-registry");

open (TXT,"language-subtag-registry") or die "Open language-subtag-registry: $!\n";

my $entry;
my @entries;
while (<TXT>)
{
   if (/^%%/)
   {
      push @entries, $entry if (defined($entry));
      $entry = undef;
   }
   else
   {
       if (/^(\w+): (.*)/)
       {
           $entry->{$1} = $2;
       }
   }
}

open (OUT, ">documentlanguages.pl") or die "Open documentlanguages.pl: $!\n";

print OUT '%language_codes = ('."\n";
foreach my $entry (@entries)
{
   # Scope collection macrolanguage are used
   if ($entry->{'Type'} eq 'language' and !defined($entry->{'Preferred-Value'})
         and !defined($entry->{'Macrolanguage'}) and 
         (!defined($entry->{'Scope'}) or ($entry->{'Scope'} ne 'special' and
           $entry->{'Scope'} ne 'private-use')))
   {
       print OUT "'$entry->{'Subtag'}' => 1,\n";
       print STDERR "$entry->{'Subtag'} Scope $entry->{'Scope'}\n" if defined($entry->{'Scope'});
   }
}
print OUT ");\n\n";

print OUT '%region_codes = ('."\n";
foreach my $entry (@entries)
{
   if ($entry->{'Type'} eq 'region' and !defined($entry->{'Preferred-Value'})
        and $entry->{'Description'} ne 'Private use' and $entry->{'Subtag'} !~ /^\d{3}$/)
   {
       print OUT "'$entry->{'Subtag'}' => 1,\n";
   }
}
print OUT ");\n\n";

