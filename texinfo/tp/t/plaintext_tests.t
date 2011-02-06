use strict;

require 't/test_utils.pl';

my @test_cases = (
['anchor_and_empty_lines',
'text 1.

@anchor{in anchor}

text 2.
'],
['empty_line_in_example_end',
'@example
in example

@end example

After line
'],
);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['plaintext'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('plaintext_tests', [@test_cases], $arg_test_case,
   $arg_generate, $arg_debug);

1;

