# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl XSParagraph.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 1;
BEGIN { use_ok('XSParagraph') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $paragraph;
$paragraph = {'word' => 'hello world', 'end_sentence' => 0};

print STDERR "Perl: here 1\n";
XSParagraph::set_state ($paragraph);
print STDERR "Perl: here 2\n";
XSParagraph::get_state ($paragraph);
print STDERR "In Perl: word set is ", $paragraph->{'word'}, "\n";
print STDERR "In Perl: end_sentence is ", $paragraph->{'end_sentence'}, "\n";

