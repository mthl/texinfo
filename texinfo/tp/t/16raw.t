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
['raw_in_example',
'@example
@html
in html
@end html
@end example
'],
['braces_in_tex',
'
@tex
$$ 
\chi^2 = \sum_{i=1}^N
\left(y_i - (a + b x_i)
\over \sigma_i\right)^2 
$$
@end tex


@example
@tex
$$ 
\chi^2 = \sum_{i=1}^N
\left(y_i - (a + b x_i)
\over \sigma_i\right)^2 
$$
@end tex
@end example

']
);

my @test_invalid = (
['raw_not_closed',
'@html

This is some html
<address> my address </address>
'],
['tex_not_closed',
'@tex

This is some \LaTeX{}
'],
['verbatim_not_closed',
'@verbatim

some verbatim @

@macro

'],
['raw_in_brace_command',
'@code{
@html
in html
@end html
}

@samp{
@verbatim
in verbatim
@end verbatim
}
']
);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['plaintext'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('raw', [@test_cases, @test_invalid], $arg_test_case,
   $arg_generate, $arg_debug);

