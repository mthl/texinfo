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
);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['info'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('info_tests', [@test_cases], $arg_test_case,
   $arg_generate, $arg_debug);

1;

