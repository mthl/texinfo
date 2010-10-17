use strict;

use Test::More;

require 't/test_utils.pl';

my @test_cases = (
[ 'simple',
'@include inc_file.texi
'],
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('include', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

