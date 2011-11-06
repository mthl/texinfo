use strict;

require 't/test_utils.pl';

my @test_cases = (
['verbatim_in_multitable_in_example',
'@example
@multitable @columnfractions 0.5 0.5
@item in item
@tab in tab
@item
@verbatim
in first column, verbatim
@end verbatim
@tab
@verbatiminclude inc_file.texi
@end multitable
@end example
'],
['commands_in_alt',
'@image{f--ile,,,alt -- @b{in b}}

@example
@image{f--ile,,,alt -- @b{in b}}
@end example
'],
['commands_in_abbr',
'@abbr{A, @b{abbr} -- b}.

@example
@abbr{A, @b{abbr} -- b}.
@end example
'],
['raw_html',
'@html
<i>
@end html
'],
['xml_protected_in_verb',
'@verbatim
<a>
@end verbatim

@verb{. <i> .}.

@verbatiminclude file_with_xml_chars.texi
'],
['index_and_node_same_name',
'@top top
@node index node

@cindex node
@printindex cp

'],
['documentdescription',
'@documentdescription
in @code{documentdescri---ption} --- @bullet{} @enddots{} @verb{:"verb:} @aa{} @^{@dotless{i}} @email{@code{some}body}
@end documentdescription

@top top
'],
['index_below',
'@top top

@chapter chap

@section sec

@cindex entry
@printindex cp
', {'test_split' => 'section'}, {'USE_NODES', 0}],
['simple_menu',
'@menu
* (ggg):: description
@itemize
@item idescr
@end itemize
AAA

CCC

@itemize
@item iaa
@end itemize

BBB

@itemize
@item ibb
@end itemize
* (manual)::

comment

* (after_comment):: description
in description
* (after_description)::

@detailmenu
* (detailggg):: detaildescription
@itemize
@item idetaildescr
@end itemize
detailAAA

detailCCC

@itemize
@item detailiaa
@end itemize

detailBBB

@itemize
@item detailibb
@end itemize
* (detailmanual)::

detailcomment

* (detailafter_comment):: detaildescription
in detaildescription
* (detailafter_description)::

@end detailmenu
@end menu
' ,{'SIMPLE_MENU' => 1, 'test_formats' => ['info']}
],
['character_number_leading_toc_stoc',
'@top top
@chapter 0
@unnumbered _
@section ?

@contents

@shortcontents

'],
['shortcontents_no_top',
'@chapter chap

@chapter chap2

@section sec

@shortcontents
'],
['test_xrefautomaticsectiontitle',
'@node Top
@top top

@menu
* chap::
@end menu

@node chap
@chapter chapter

@xrefautomaticsectiontitle on

@xref{chap}.

@xrefautomaticsectiontitle off

@xref{chap}.
']
,['tex_expanded_in_copying',
'@copying
@tex
aa
@end tex
@end copying
', {'expanded_formats' => ['tex']}
],
);

my @test_cases_text = (
['commands_in_email',
'@email{endots @enddots{} @code{in code}}'
],
);

# problem is that the result is code with accented letters,
# it may not come out right.  So this test is left unused for now.
# Also could be in converters_tests
my @todo = (
['enable_encoding',
'@documentencoding utf-8

@u{--a}
@^{--a}
@AA{} @~{@dotless{i}} @dotless{i}.
@equiv{}
@sc{@AA{} @~{@dotless{i}} @dotless{i}}.
',{}, {'ENABLE_ENCODING' => 1}]
);

foreach my $test (@test_cases) {
  push @{$test->[2]->{'test_formats'}}, 'html';
}
foreach my $test (@test_cases_text) {
  push @{$test->[2]->{'test_formats'}}, 'html_text';
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('html_tests', [@test_cases, @test_cases_text], $arg_test_case,
   $arg_generate, $arg_debug);

1;

