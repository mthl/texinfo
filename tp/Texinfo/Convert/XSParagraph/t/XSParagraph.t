# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl XSParagraph.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 2;
BEGIN { use_ok('Texinfo::Convert::XSParagraph::XSParagraph') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $paragraph = Texinfo::Convert::XSParagraph::XSParagraph::new({});

my $input = "Some text.";
my $text = $paragraph->add_text($input);
$text .=  $paragraph->end();

is($text, $input."\n");
