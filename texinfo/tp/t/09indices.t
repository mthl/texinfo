use strict;

require 't/test_utils.pl';

my @test_cases = (
['wrong_synindex',
'@defindex aaa
@synindex aaa aaa'],
['recursive_synindex',
'@defindex aaa
@defindex bbb
@synindex aaa bbb
@synindex bbb aaa'],
['unknown_index_entry',
'@someindex someindex entry.
'],
['unknown_then_known_index_entry',
'@someindex someindex entry.
@defindex some
@someindex someindex entry.
'],
['unknown_printindex',
'@printindex bidule'],
['unknown_synindex',
'@synindex c truc'],
['print_merged_index',
'@syncodeindex fn cp
@printindex fn']

);

my @test_formatted = (
['double_index_entry',
'@node Top

@cindex aaa

Text

@cindex aaa

@menu
* other node::
@end menu

@node other node,,,Top

@cindex aaa

@printindex cp
'],
['index_entries_locations',
'
@node Top

Initial paragraph.

Paragraph
@cindex entry in paragraph
end paragraph.
@cindex entry at end of paragraph.

New paragraph.

@cindex Entry before paragraph
Another paragraph.

@cindex lone entry

Last paragraph.

@printindex cp
'],
['index_entry_before_node',
'@node Top

@menu
* first::
* second::
@end menu

@node first,second,,Top

Para.

@cindex lone entry

@node second,,first,Top

@printindex cp
']
);

foreach my $test (@test_formatted) {
  $test->[2]->{'test_formats'} = ['info'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('indices', [@test_cases, @test_formatted], $arg_test_case,
   $arg_generate, $arg_debug);

