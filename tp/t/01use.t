# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 01use.t'

#########################

use strict;

use Test::More;

use lib '.';
BEGIN {
  require 'Texinfo/ModulePath.pm';
  Texinfo::ModulePath::init(undef, undef, 'updirs' => 2);
}
use Texinfo::Convert::Texinfo;

plan tests => 2;

ok(1, "modules loading"); # If we made it this far, we're ok.

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

use vars qw($manual_tree $manual_tree_result);

require 't/manual_tree.pl';

is (Texinfo::Convert::Texinfo::convert($manual_tree), 
     $manual_tree_result, "tree_to_texi on a manually written tree");

