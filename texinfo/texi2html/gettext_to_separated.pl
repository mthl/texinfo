#! /usr/bin/perl -w

use strict;

my $msgtxt = '';
my $separator = '||qg::fd||';

while (<STDIN>)
{
   $msgtxt .= $_;
}
print "$ENV{'MSGEXEC_MSGID'}$separator\n$msgtxt$separator\n";
