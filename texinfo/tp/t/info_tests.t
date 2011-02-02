use strict;

require 't/test_utils.pl';

my @test_cases = (
['paragraphindent_and_preamble',
'@copying
In copying.

Copying second para.
@end copying

@node Top
@top test @@paragraphindent effect in preamble

First para.

Before paragraphindent.

@paragraphindent 1

After paragraphindent.

@bye

'],
['text_before_node',
'@node Top

@menu
* chapter node::
@end menu

text.
@node chapter node
@chapter chapter']);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['info'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('info_tests', [@test_cases], $arg_test_case,
   $arg_generate, $arg_debug);

1;

