use strict;

require 't/test_utils.pl';

my @test_cases = (
['commands','@@ @TeX{} @
@"e @^{@dotless{i}} @~{a} @ringaccent a
@clicksequence{File @click{} Open}@.
@email{a, b}

@cindex index entry in text @LaTeX{}

@majorheading majorheading @b{in b}
'],
['accents',
'@ringaccent    a

accent at end of line @ringaccent
accent at end of line and spaces @ringaccent  
accent followed by @@ @ringaccent@.

accent character with spaces @~ following.
accent character at end of line @~
accent character followed by @@ @~@.

With @@:
@ringaccent @@. @^@@.
'],
['accent_no_closed',
'@~{e'],
['accent_no_closed_newline',
'@~{e

'],
['accent_no_closed_paragraph',
'@~{e

other para.
'],
['accent_no_closed_comment',
'@~{e @c comment
'],
['math',
'Simple math
@math{{x^i}\over{\tan y}}

Math with @@-command
@math{@code{math code} a < b}

Complex
@math{ \underline{@code{math \hbox{ code }}} @\i \sum_{i}{\underline{f}}}

@@\ outside of math
@\

'],
['block_commands','
@group
in group
@end group

@quotation warning
in quotation
@end quotation

@float a float, b float
In float


@caption{in caption

in caption}
@end float
'],
['item_container','
@itemize +
@item i--tem +
@end itemize

@itemize @bullet
@item
 b--ullet
@end itemize
'],
['table','
@table @asis
@item table item
@itemx table itemx

In table
@end table

@vtable @samp@c samp
@c after vtable
@cindex index entry

@item vtable item
@c after item
@kindex key
@itemx itemx vtable @comment comment in itemx line

@end vtable
'],
['table_command_comment',
'@table @code@c in comment
@item item
@end table'
],
['multitable','
@multitable @columnfractions 6 7
@headitem mu--ltitable headitem @tab another tab
@item mu--ltitable item @tab multitable tab
@c comment in multitable
@item mu--ltitable item 2 @tab multitable tab 2
@cindex index entry within multitable
@item lone mu--ltitable item
@end multitable

@multitable {truc} {bidule}
@item truc @tab bidule
@end multitable
'],
['preformatted','
@example
e--xample  some  

   text
@end example

@format
@vtable @code
@item item in table in format

in table in format
@end vtable
@end format
'],
['def','
@deffn {c--ategory} d--effn_name a--rguments...
d--effn
@end deffn

@deffn cate--gory de--ffn_name ar--guments @
   more args @* even more so
def--fn
@end deffn

@deffn fset @var{i} a g
@deffnx {cmde} truc {}
@deffnx Command {log trap} {}
@deffnx Command { log trap1} {}  
@deffnx Command {log trap2 } {}
@deffnx cmde @b{id ule} truc
@deffnx cmde2 @b{id @samp{i} ule} truc
@deffnx{} machin
@deffnx{} {bidule machin}
@deffnx{truc} machin
@deffnx {truc} followed by a comment
@c comment
Various deff lines
@deffnx {truc} after a deff item
@c comment
text in def item for second def item
@deffnx {truc} deffnx before end deffn
@end deffn
'],
['nested_block_commands',
'@group
In group
@quotation
in quotation
@end quotation
@end group

@group
@quotation
in quotation
@end quotation
@end group

@group
In group
@quotation
in quotation
@end quotation
after quotation
@end group

@group

In group sp b
@quotation
in quotation
@end quotation
@end group

@group

In group sp b a

@quotation
in quotation
@end quotation
@end group

@group
In group sp a

@quotation
in quotation
@end quotation
@end group

@group
@quotation

in quotation sp b
@end quotation
@end group

@group
@quotation

in quotation sp b a

@end quotation
@end group

@group
@quotation
in quotation sp a

@end quotation
@end group

@group
@quotation
in quotation
@end quotation

After quotation sp b
@end group

@group
@quotation
in quotation
@end quotation
After quotation sp a

@end group

@group
@quotation
in quotation
@end quotation

After quotation sp b a

@end group
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('coverage', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);
