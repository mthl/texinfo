use strict;

require 't/test_utils.pl';

my @test_cases = (
['paragraph_in_cells',
'@multitable {AAA}  {BBB}
@item truc @tab bidule
@item begin item

new paragraph in item.

@tab begin tab

new paragraph in tab.
@end multitable'],
['multitable_in_example',
'@example
@multitable {AAA}  {BBB}
@item truc @tab bidule example
@item begin item example

new paragraph in item. example

@tab begin tab example

new paragraph in tab. example
@end multitable
@end example'],
['w_in_multitable',
'@multitable {aaaaaaaaa} {bbbbbbbbbbb}
@item @w{aaaaaaaa
bbbbbbbbbb}
@tab gg
@end multitable
']
);

my @test_invalid = (
['empty_multitable_with_cells',
'@multitable
@item item in empty multitable @tab tab in empty m @tab second tab in empty m
@item item in empty m
@end multitable
'],
['multitable_one_column_too_much_cells',
'@multitable {a}
@item a @tab additional tab @tab other additional tab @tab 3rd  additiona tab
@item a1
@item a2 @tab additional tab2 @tab other additional tab2 @tab 3rd  additional tab2
@item a3 @tab one additional tab
@end multitable
'],
['multitable_two_columns_too_much_cells',
'@multitable @columnfractions 0.4 0.6
@item first @tab second @tab first out @tab second out @tab third out
@item first1 
@item first2 @tab second2 @tab first2 out
@end multitable
'],
['multitable_not_closed_item_tab',
'@multitable {r} {t}
@item rt @tab ds
'],
['multitable_not_closed_item',
'@multitable {r} {t}
@item rt 
'],
['multitable_not_closed',
'@multitable {r} {t}
'],
['multitable_begin_with_tab',
'@multitable {a} {b}
@tab t
@end multitable

@multitable {c} {d}
@tab t2
@item it
@end multitable
']
);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['plaintext'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('multitable', [@test_cases, @test_invalid], $arg_test_case,
   $arg_generate, $arg_debug);

