use strict;

require 't/test_utils.pl';

my @test_cases = (
['accent_on_table_line',
'@table @~
@item first item
@item no at-command @code{code}
@end table
'],
['definfoenclose_on_table_line',
'@definfoenclose phi,:,:

@table @phi
@item item
@itemx item x

table content.
@end table
'],
['empty_item_itemx',
'@vtable @asis

VTable

@item first item
@itemx
@itemx after an empty itemx, before an empty item
@item 
@item in item before end table
@end vtable
'],
['long_item',
'@table @emph
@item first item      aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaa
@itemx second itemx bbbbbbbbbbbbbbbbbbbbbbbbbbbbb b b b b b b b b b b b b b

Text.
'],
);

my @test_invalid = (
['lone_end_table',
'Text.
@end table
'],
['invalid_command_and_brace_in_table',
'@table @asis
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
'],
['no_arg_brace_command_on_table_line',
'@table @bullet
@item item
@end table
'],
['no_argument_for_table',
'@table
@item item
In item.
@end table
']
);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['plaintext'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('xtable', [@test_cases, @test_invalid], $arg_test_case,
   $arg_generate, $arg_debug);

