# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Parsetexi.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 2;
BEGIN { use_ok('Parsetexi') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $root;
Parsetexi::parse_file ("sample.texi");
$root = Parsetexi::get_root ();

my $root_type;
$root_type = Parsetexi::element_type_namex ($root);

is ($root_type, 'document_root');

print "Root type is $root_type.\n"

