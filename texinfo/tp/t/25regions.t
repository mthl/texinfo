use strict;

require 't/test_utils.pl';

my @test_cases = (
['copying_not_closed',
'@copying

This is a copyright notice
'],
['double_copying',
'@copying

This is a copyright notice

@copying
And a second one (?)
@end copying
@end copying
']

);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('regions', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

