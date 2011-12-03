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
@node Top
@printindex fn'],
['printindex_before_document',
'
@printindex cp
'],
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
['syncode_index_print_both',
'@syncodeindex fn cp

@node Top

@cindex c---oncept
@findex f---un


Print fn

@printindex fn

Print vr

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
'],
['printindex_with_space_before',
'@node Top

@cindex index

Text.
@printindex cp
'],
['image_lines_count',
'@node Top

@image{count_image}

@cindex index entry

@printindex cp
'],
['image_text_lines_count',
'@node Top

@image{count_image_text}

@cindex index entry

@printindex cp
'],
['empty_index_entry',
'@node Top

@deffn {} { }
@end deffn

@printindex fn
'],
['empty_cindex_entry',
'@node Top
@cindex
'],
['empty_string_index_entry',
'@node Top

@findex @w{}

@ftable @code
@item @w{}
@end ftable

@defun {@w{}} {} {}
@defunx {@w{}} {} {}
@end defun

@printindex fn
'],
['printindex_index_entry_in_copying',
'@copying

@findex Copying this document

@defun fun arg
@defunx xf arg
Defun
@end defun

@ftable @asis
@item ftable item
@itemx xftable xitem
@end ftable

@printindex fn

@end copying

@node Top
@top top

Top.
@insertcopying

@menu
* chapter::
@end menu

@node chapter
@chapter Chapter

@insertcopying

@printindex fn

'],
['printindex_index_entry_in_copying_no_insertcopying',
'@copying

@findex Copying this document

@defun fun arg
@defunx xf arg
Defun
@end defun

@ftable @asis
@item ftable item
@itemx xftable xitem
@end ftable

@printindex fn

@end copying

@node Top
@top top

Top.

@menu
* chapter::
@end menu

@node chapter
@chapter Chapter


@printindex fn

'],
['index_entry_before_first_node',
'
@cindex before nodes

@node Top

@printindex cp
'],
['index_entry_in_footnote',
'@node Top

Top node@footnote{in footnote
@cindex index entry in footnote
}

@printindex cp
'],
['index_entry_in_footnote_separate',
'@footnotestyle separate
@node Top

@menu
* First::
@end menu

Top node@footnote{in footnote
@cindex index entry in footnote

Blah

Blih

@cindex counting entry
}

@node First

@printindex cp
'],
['printindex_index_entry_in_copying_in_footnote',
'@copying

Copying@footnote{
In footnote
@cindex Copying this document

}.

@printindex cp

@end copying

@node Top
@top top

Top.
@insertcopying

@menu
* chapter::
@end menu

@node chapter
@chapter Chapter

@insertcopying

'],
);

foreach my $test (@test_formatted) {
  $test->[2]->{'test_formats'} = ['info'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('indices', [@test_cases, @test_formatted], $arg_test_case,
   $arg_generate, $arg_debug);

