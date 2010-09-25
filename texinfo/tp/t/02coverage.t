use strict;

require 't/test_utils.pl';

my @test_cases = (
['commands','@@ @TeX{} @
@"e @^{@dotless{i}} @~{a} @ringaccent a
@email{a, b}

@cindex index entry in text @LaTeX{}

@majorheading majorheading @b{in b}
'],
);
my @todo = (
['block_commands','
@group
in group
@end group

@quotation warning
in quotation
@end quotation

@float a float, b float
In float

@table asis
@item table item
@itemx table itemx

In table
@end table

@caption{in caption

in caption}
@end float

@itemize +
@item i--tem +
@end itemize

@itemize @bullet
@item
 b--ullet
@end itemize

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
@vtable code
@item item in table in format

in table in format
@end vtable
@end format
'],
['def','
@deffn c--ategory d--effn_name a--rguments...
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
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('coverage', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

1;
