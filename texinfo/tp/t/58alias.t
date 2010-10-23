use strict;

require 't/test_utils.pl';

my @test_cases = (
[ 'simple',
'@alias myalias = code

@alias o-theralias=verb @c comment

Should be code: @myalias{code}

Should be verb: @o-theralias{!verb!}

@table @myalias
@item table item (code)
@end table
'],
['bad_line',
'
@alias garbage-on-line =cmd garbage

@alias garbage-on-line =cmd @code{in code}
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('alias', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

