use strict;

require 't/test_utils.pl';

my @test_cases = (
['listoffloats_with_commands',
'@listoffloats th@\'eor@`eme
'],
['empty_listoffloats',
'@listoffloats
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('float', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

