use strict;

require 't/test_utils.pl';

my @test_cases = (
['empty_line',
'@example
example

after empty line
@end example
'],
);

my @test_invalid = (
['empty_line_style_command',
'@example
example @samp{in samp

after empty} line
@end example
']
);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['plaintext'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('preformatted', [@test_cases, @test_invalid], $arg_test_case,
   $arg_generate, $arg_debug);

