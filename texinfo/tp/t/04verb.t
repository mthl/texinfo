use strict;

require 't/test_utils.pl';

my @test_cases = (
['simple', '@verb{.  }   .  .}'],
['multiline', '@verb{@
qdsqsddqsdsq

@}after verb.'],
['nested', '@b{in b @verb{/ in verb { } /} in b end}'],
['comments', '@verb{a comment @c comment
in a verb a}@c comment

something @verb{, in verb,} @c other comment'],
['end_of_line', 'verb at end of line @verb{

@{ in verb at end of line @c comment
and now end}after end.']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('verb', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

