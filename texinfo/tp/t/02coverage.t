use strict;

require 't/test_utils.pl';

my @test_cases = (
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('coverage', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

1;
