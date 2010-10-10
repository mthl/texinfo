use strict;

use Test::More;

require 't/test_utils.pl';

my @test_cases = (
[ 'not_set',
'@ifset a

Flag a is set.

@end ifset
'],
['nested_ignore',
'@ignore
@ignore

@end ignore

@ignore
@end iftex
@ifinfo
@end ignore

@ignore 
@end ifclear
@ifclear
@end ignore
'],
['empty_set_in_ifset',
'@set a

@ifset a
a is set to:|@value{a}|.
@end ifset'
],
['empty_set_in_ifclear',
'@set a

@ifclear a
a is set to:|@value{a}|.
@end ifclear'
]
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('conditionals', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

