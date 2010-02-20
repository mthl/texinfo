#! /usr/bin/perl -w

use strict;

use Data::Dumper;

my $lang = shift @ARGV;
my $separator = quotemeta ('||qg::fd||');

my $in_msgid = 1;
my $text = '';
my $msgid = '';
my $LANGUAGES;

while (<STDIN>)
{
   my $separated = 0;
   if (/^(.*)$separator$/)
   {
      $text .= $1;
      $separated = 1;
   }
   else
   {
      $text .= $_;
   }
   #print STDERR "  --> ($separated) ($in_msgid)\n";
   if ($separated)
   {
      if ($in_msgid)
      {
         $msgid = $text;
         $in_msgid = 0;
      }
      else
      {
         #print "\n$msgid === $text|\n";
         #$LANGUAGES->{$lang}->{$msgid} = $text if ($text !~ /^Project-Id-Version/);
         $LANGUAGES->{$lang}->{$msgid} = $text if ($msgid ne '');
         $in_msgid = 1;
      }
      $text = '';
   }
}

$Data::Dumper::Sortkeys = 1;
print "" . Data::Dumper->Dump([$LANGUAGES->{$lang}], [ "LANGUAGES->{'$lang'}" ]);
