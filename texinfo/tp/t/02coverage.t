# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Texinfo-Parser.t'

use strict;

use Test::More;
BEGIN { plan tests => 1 };
use Texinfo::Parser qw(:all);
use Data::Dumper;
use Data::Compare;

#require 't/manual_tree.pl';

ok(1);

#is (tree_to_texi($manual_tree), $manual_tree_result, "tree_to_texi on a manually written tree");

my $test_misc = '@chapter chapter
@c comment
@bye
';

# test nested macros and raw block commands.
my $test_raw = '@macro truc   { arg,  ex}
in macro \arg\
@macro othermacro 
other macro
@end macro
@macro
@end macro

@html 
in html @end html

@tex in tex
@end tex

@verbatim
in verbatim
in verbatim2
@end verbatim
'; 

##my $parser_test_raw = Texinfo::Parser->parser({'debug' => 1});
#my $parser_test_raw = Texinfo::Parser->parser();
##print STDERR "".Data::Dumper->Dump([$parser_test_raw]);
#my $tree_test_raw = $parser_test_raw->parse_texi_text($test_raw);
#print STDERR "".Data::Dumper->Dump([$tree_test_raw], ['$tree_test_raw_result']);
#print STDERR tree_to_texi($tree_test_raw);

#print STDERR tree_to_texi($manual_tree);
#print STDERR "".Data::Dumper->Dump([$manual_tree], ['$manual_tree']);
# returns 1 if they are the same
# Data::Compare::Compare($manual_tree, $manual_tree)."\n";
