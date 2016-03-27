# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Parsetexi.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 3;
BEGIN { use_ok('Parsetexi') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $root;
Parsetexi::parse_file ("t/sample.texi");
$root = Parsetexi::get_root ();

my $type;
$type = Parsetexi::element_type_name ($root);

is ($type, 'document_root');

my $first_child;
$first_child = Parsetexi::contents_child_by_index ($root, 0);
$type = Parsetexi::element_type_name ($first_child);

is ($type, 'text_root');

print STDERR "Num children is " . Parsetexi::num_contents_children ($root);

