use strict;

require 't/test_utils.pl';

my @test_cases = (
['commands',
'@TeX{}. Ab. @@. @
@~e, @^{@dotless{i}}

Hohoh

@example 
truc
@end example

@vtable @samp
@item vitem table

text
@end vtable'],
['flushright',
'
@flushright
  aaa bb @anchor{rrr} ada   
 dad  sff sd @anchor{a1} and @anchor{a2} dsdbf

dqs
sqdd

@anchor{alone}

new para.

@end flushright
'],
['multitable',
'
@multitable {aaa} {bb1} {ccc}
@item aaa @tab bb @anchor{anch 1}
@tab ccc
@item @tab @anchor{anch2}
@end multitable
']);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['debugcount'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('test_count', [@test_cases], $arg_test_case,
   $arg_generate, $arg_debug);

1;

