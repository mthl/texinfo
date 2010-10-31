use strict;

require 't/test_utils.pl';

my @test_cases = (
['on_section_line',
'@section @noindent Text @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
'],
['on_block_command_line',
'@multitable {@anchor{in anchor}} @titlefont{in titlefont}
@item @titlefont{in titlefont}
@end multitable

@quotation @indent @titlefont{in titlefont} @anchor{in quotation anchor}@footnote{footnote} @exdent exdent
@end quotation
'],
['on_def_line',
'@deffn {@anchor{in anchor}} @titlefont{in titlefont} @footnote{footnote} @exdent exdent
@deffnx {@anchor{in anchorx}} @titlefont{in titlefontx} @footnote{footnotex} @exdent exdentx
@end deffn
'],
['ignored_text',
'@node before ignore @ifinfo
in ifinfo
@end ifinfo on the node line'],
['in_table',
'@table @xref
@end table

@table @code
@item @indent @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
in item@footnote{footnote in item}
@end table
'],
['on_itemize_line',
'@itemize @indent @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
@item in item.
@end itemize

@itemize on line @item in item
@end itemize
'],
['on_index_entry_line',
'@cindex @indent @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
'],
['center',
'@center @indent @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote}

@center center @cindex cindex

@center @quotation
in quotation
@end quotation

@center center @center second center

@center @code{in code in center

}

@center @code{in code in center @center center in code in center

}
'],
['accents',
'Valid
@~{@TeX{}}. @~{@@}.

Invalid
@~{@code{a}}.  @^{@anchor{truc}}.
'],
['block_not_matching',
'@quotation
A quotation
@end cartouche

@deffn {Function Reference} print_navigation $filehandle
Text
@end deftypefun

@table
@item item
line
@end vtable

@table @emph
@item ref
@example
example
@end display
@end table

@group
in group
@end table

@group
in group 2
@end cartouche

@cartouche
cartouche
@end group

@cartouche
carouche
@end float
'],
['bad_style_nesting',
'@code{
@quotation
in quotation}
@end quotation
'],
['bad_tab_nesting',
'@multitable {truc} {bidule}
@item truc
@code{@tab bidule}
@end multitable
'],
['tab_in_index',
'@multitable {one nonlettered character} {normal text}
@item one nonlettered character @tab aaa
@vindex in index entry @tab in tab
@end multitable
'],
['multitable_item_in_index',
'@multitable {aaa} {bbb}
@vindex @item on item line
@end multitable
'],
['style_not_closed_no_newline_root_commands',
'@node Top

@menu
* chapter::
@end menu

@code{not closed
@node chapter
@chapter chapter

@code{still not closed
@bye
'],
['style_not_closed_root_commands',
'@node Top

@menu
* chapter::
@end menu

@code{not closed

@node chapter
@chapter chapter

@code{still not closed

@bye
'],
['style_not_closed_before_first_node',
'@code{in code

@node Top
In node
'],
['style_not_closed_in_block_command',
'@cartouche
cartouche @code{in code 
@end cartouche
'],
['style_not_closed_in_table_line',
'@table @asis
@item first item
line
line @code{in code @item in item
@end table
'],
['formats_not_closed_in_example',
'@example

@table @minus
@item item
table line

Some text.
@enumerate

@item first item
@item an item

@end example
'],
['itemx_in_itemize_enumerate_in_table',
'@table @strong
@item item

In item, nested itemize
@itemize
@itemx in nested itemize itemx
@end itemize

@enumerate
@itemx in nested enumerate itemx
@end enumerate

@end table
'],
['item_tab_outside_of_table_lists',
'@itemx itemx outside.
@headitem headitem outside.
@someitem someitem outside.
@tab tab outside
'],
['node_in_copying',
'@copying
@node node

@end copying
'],
['node_in_copying_not_closed',
'@copying

This is an unterminatted copyright notice


@node Top
@top Top section

@insertcopying
'],
['table_not_closed_in_menu_description',
'@menu
* (gcc):: text @table @minus
@item item
table line
@end menu
'],
['table_not_closed_in_menu_comment',
'@menu
* (manual):: desc

@table @bullet
@item item
comment
* (manual2)::
@end menu
'],
['def_not_closed_in_menu_description',
'@menu
* (info):: before deff @deffn bidule truc chose

deffn text
@end menu
'],
['recursive_copying',
'@copying

In copying.

@insertcopying
@end copying

@insertcopying
'],
['unclosed_verb_on_misc_line',
'@setfilename name @verb{file.texi'],
['unclosed_verb_on_section_line',
'@section in section @verb{Truc

Now text.
'],
['unclosed_verb_end_of_line_on_misc_line',
'@setfilename name @verb{
'],
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('invalid_nestings', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

