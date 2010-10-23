use strict;

require 't/test_utils.pl';

my @test_cases = (
['empty_line',
'@example
example

after empty line
@end example
'],
['empty_line_style_command',
'@example
example @samp{in samp

after empty} line
@end example
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('preformatted', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

