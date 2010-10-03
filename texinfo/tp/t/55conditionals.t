use strict;

use Test::More;

require 't/test_utils.pl';

my @test_cases = (
[ 'not_set',
'@ifset a

Flag a is set.

@end ifset
'],
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('conditionals', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

