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
@chapter chapter'
],
['footnote_no_number',
'@node Top

Para@footnote{Footnote 1.}.

Para2@footnote{Footnote 2.}.
',{} , {'NUMBER_FOOTNOTES' => 0}],
['footnote_no_number_separate',
'@node Top

Para@footnote{Footnote 1.}.

Para2@footnote{Footnote 2.}.
',{} , {'NUMBER_FOOTNOTES' => 0, 'footnotestyle' => 'separate'}],
['ref_tests',
'
@node Top

@ref{(m)in ref followed by comma}, 
@ref{(m)in ref not followed by comma} after ref.
@code{@ref{(m)in ref followed by end command}}.


@ref{(m)in ref followed by comma, name},
@ref{(m)in ref not followed by comma, name} after ref.
@code{@ref{(m)in ref followed by end command, name}}.
@ref{(m)in ref ending with a dot., name} after ref.

'],
['xref_test',
'
@node Top

@xref{(m)in xref}. @xref{(m)bad xref} after xref.
@code{@xref{(m)bad nested xref}}.
@xref{(m)in ref ending with a dot., name} ! after xref and dot inside.
@xref{(m)in ref followed by symbol}# g.
'],
['contents_setcontentsaftertitlepage_before_node',
'
@contents
@setcontentsaftertitlepage

@node Top
@top Double contents
'],
['anchor_in_command',
'@node Top

@strong{aaa @TeX{} @emph{in emph} after 
@c emph @emph{emph2 @anchor{anchor in emph} }}.
emph @emph{emph2 @anchor{anchor in emph}}}.
'],
['anchor_and_spaces',
'@node Top
@top Element
@anchor{anchor 0}

Now @anchor{anchor1}.

No space@anchor{anchor2}.
'],
['image_quotes', 
'@node Top

@image{f--ile,,,alt""\\}
'],
['image_in_paragraph',
'@node Top

Para.
@image{f--ile,,,alt""\\}. End para.
'],
[ 'multitable_anchor_and_index_entry',
'@node Top

@multitable @columnfractions 0.4 0.6
@headitem mu--ltitable headitem @tab another tab
@item mu--ltitable item @tab multitable tab
@c comment in multitable
@item mu--ltitable item 2 @tab multitable tab 2
@cindex index entry within multitable
@anchor{anchor in multitable}
@item lone mu--ltitable item
@end multitable

@multitable {A} {B}
@item A
B

C
@tab G
@item lsfd mlkdsf lk s
mlsdmjlfdsjm mdsfk 
@cindex index entry
@item lsfd2 mlkdsf2 lk2 s2
mlsdmjlfdsjm mdsfk2
@tab ATTTTTTTTTTTTTTTTTTTTT
BTTTTTTt @anchor{mark}

CTTTTTT

@end multitable

@printindex cp
@ref{mark}
@ref{anchor in multitable}
'],
['note_in_strong',
'@node Top

One @strong{Note}.

3 @strong{Note a}.



2 @strong{note}.

4 @strong{note b}.

6 @strong{ note}.
'],
['nested_multitable_anchor_index',
'@node Top

@multitable {truc AAAA   machin}    {bidule}
@item
@multitable {AAAA} {machin}
@item AAAA @tab machin @anchor{mark inside}
@cindex index entry inside
@end multitable
 @tab bidule
@item other item @tab in tab @anchor{mark}
@cindex index entry
@end multitable

@printindex cp

@xref{mark}.
@xref{mark inside}.
'],
['def_in_copying',
'@macro mymacro
@deffn aa bb cc
@deffnx aax bbx ccx
deffnx lines
@end deffn
@end macro

@node Top
@top Test for definition commands

@copying
In copying
@mymacro{}
@end copying

In text
@mymacro{}

@printindex fn
'],
);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['info'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('info_tests', [@test_cases], $arg_test_case,
   $arg_generate, $arg_debug);

1;

