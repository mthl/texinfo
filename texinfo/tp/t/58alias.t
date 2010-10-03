use strict;

use Test::More;

require 't/test_utils.pl';

my @test_cases = (
[ 'simple',
'@alias myalias = code

@alias o-ther_alias=verb @c comment

Should be code: @myalias{code}

Should be verb: @o-ther_alias{!verb!}

@table @myalias
@item table item (code)
@end table
'],
['bad_line',
'
@alias garbage_on_line =cmd garbage

@alias garbage_on_line =cmd @code{in code}
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('alias', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

