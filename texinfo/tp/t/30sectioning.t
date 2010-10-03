use strict;

use Test::More;

require 't/test_utils.pl';

my @test_cases = (
[ 'node',
'
@node one arg 
@node one arg, two arg
@node one arg, two arg, three arg
@node one arg, two arg, three arg, four arg
@node one arg, two arg, three arg, four arg, five arg

@node comment @comment

@node arg1 @comma{} arg2, @,cedilla, @strong{comma in strong,} @c comma , end
'],
['sections',
'@chapter a chapter
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('sectioning', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

