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
'
@node Top

@table @xref
@end table

@table @code
@item @indent @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
in item@footnote{footnote in item}
@item @ref{Top,, title
long title}
@item @center centered text in item
@item @cindex index
@end table

@vtable @asis
@item @cindex index
@option{opt}
More text
@item @cindex 2 index
@option{nopt}
Even more
@end vtable

@printindex fn

@printindex cp
'],
['table_on_item_line',
'@table @asis
@item item @table @asis
   @item in nested table item
   in nested table line
   @end table
in table line
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

@code{@center in center in code}

@table @asis
@center centered line with item @item first item on center line
@end table

@table @emph
@item item
@center centered line with item @item second item on center line
@end table

Empty double center:
@center @center

@center @samp{something @center end of samp}

@center after first center @samp{@center after second center

End of samp}

@multitable {AAA}  {BBB}
@item truc @tab bidule
@center @item ctruc @tab cbidule
@center @item cstruc
@end multitable

@center before the table @table @asis
@item item in center
Line in center
@item second item
@end table

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

@table @asis
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
@top top

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
@top top

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

@table @asis
@item item
table line

Some text.
@enumerate

@item first item
@item an item

@end example
'],
['section_in_table',
'@table @asis
@item Before

@section Subsection

@item After

@end table
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
* (gcc):: text @table @asis
@item item
table line
@end menu
'],
['table_not_closed_in_menu_comment',
'@menu
* (manual):: desc

@table @asis
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
['cartouche_in_style_command',
'@code{
@cartouche
cartouche
@end cartouche
}
'],
['multitable_in_style_command',
'@code{
Multitable
@multitable {truc} {machin}
@item truc @tab machin
@end multitable
}'],
['enumerate_in_style_command',
'@code{
@enumerate 1
@item item
@end enumerate
}'],
['quotation_in_style_command',
'@code{
@quotation
a quotation
@end quotation
}'],
['def_in_style_command',
'@code{
@defun name args...
text
@end defun
}'],
['flushright_in_style_command',
'@code{
@flushright
in flushright
@end flushright
}'],
['example_in_style_command',
'@code{
@example
example
@end example
}'],
['verbatim_in_style_command',
'@code{
@verbatim
verbatim
@end verbatim
}'],
['float_in_style_command',
'@code{
@float A, B
in float
@caption{Caption}
@end float
}'],
['menu_in_style_command',
'@node Top

@code{
@menu
* (truc)::
@end menu
}'],
['item_in_ref',
'@table @asis
@item first item
First item text

@ref{Top,, title in first item
@item second item}
@end table
'],
['ref_in_anchor',
'@node Top
@anchor{TOP @ref{Top}}'],
['ref_in_ref',
'@node Top
@ref{@ref{Top}}']
);

my @formatted_cases = (
['table_in_code',
'@code{
in code
@table @emph
@item line
text
@end table
}
'],
);

foreach my $test (@formatted_cases) {
  $test->[2]->{'test_formats'} = ['plaintext'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('invalid_nestings', [@test_cases, @formatted_cases], $arg_test_case,
   $arg_generate, $arg_debug);

