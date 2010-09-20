# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Texinfo-Parser.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;

#use Test;
use Test::More;
BEGIN { plan tests => 2 };
use Texinfo::Parser qw(:all);
use Data::Dumper;
use Data::Compare;
ok(1, "modules loading"); # If we made it this far, we're ok.

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

use vars qw($manual_tree $manual_tree_result);

require 't/manual_tree.pl';

is (tree_to_texi($manual_tree), $manual_tree_result, "tree_to_texi on a manually written tree");

#print STDERR tree_to_texi($manual_tree);
#print STDERR "".Data::Dumper->Dump([$manual_tree], ['$manual_tree']);
# returns 1 if they are the same
# Data::Compare::Compare($manual_tree, $manual_tree)."\n";
