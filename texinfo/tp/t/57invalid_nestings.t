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

@quotation @indent @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
@end quotation
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
'],
['accents',
'Valid
@~{@TeX{}}. @~{@@}.

Invalid
@~{@code{a}}.  @^{@anchor{truc}}.
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('invalid_nestings', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

