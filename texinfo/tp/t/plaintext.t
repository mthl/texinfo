# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Texinfo-Parser.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;

#use Test;
use Test::More;
use Data::Dumper;
BEGIN { plan tests => 1 };
use lib '../texi2html/lib/Unicode-EastAsianWidth/lib/';
#push @INC, '../texi2html/lib/Unicode-EastAsianWidth/lib/';
use Texinfo::Parser;
use Texinfo::Convert::Texinfo;
ok(1, "modules loading"); # If we made it this far, we're ok.

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $parser = Texinfo::Parser::parser();
my $tree = $parser->parse_texi_line('@quotation q arg
@end quotation');
my $quotation = $tree->{'contents'}->[0];
my $quotation_arg = Texinfo::Convert::Texinfo::convert(
          {'contents' => $quotation->{'extra'}->{'block_command_line_contents'}->[0]});
my $prepended = Texinfo::Parser::parse_texi_line (undef, '@b{'.${quotation_arg}.':} ');

#print STDERR Data::Dumper->Dump([$prepended]);

1;
