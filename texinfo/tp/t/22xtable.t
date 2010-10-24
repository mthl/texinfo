use strict;

require 't/test_utils.pl';

my @test_cases = (
['lone_end_table',
'Text.
@end table
'],
['invalid_command_and_brace_in_table',
'@table
{ @itemTop,, title
long title}
Item line
@end table
'],
['headitem_in_table',
'@table @strong
@headitem headitem in table

headitem In table text.

@item item
@end table
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('xtable', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

