use strict;

require 't/test_utils.pl';

my @test_cases = (
[ 'nested_macros', '@macro truc   { arg,  ex}
in macro \arg\
@macro othermacro 
other macro
@end macro
@macro
@end macro
@end macro
'],
['misc_raw','
@html 
in html @end html

@tex in tex
@end tex

@verbatim
in verbatim
in verbatim2
@end verbatim
'],
['misc_raw_comments','
@html @c comment space
in html @end html@c comment no space

@tex in tex
@end tex    @c comment after end tex

@verbatim
in verbatim @c in verbatim
in verbatim2
@end verbatim
'],
['raw_in_para',
'para
@verbatim
in verbatim
@end verbatim

para b html
@html
in html
@end html
in para

para b tex
@tex
in tex1

in tex2
@end tex

End.
'],
['raw_not_closed',
'@html

This is some html
<address> my address </address>
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('raw', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

