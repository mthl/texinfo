use strict;

use Test::More;

require 't/test_utils.pl';

my @test_cases = (
['zero_argument',
'@macro foo {}
in foo
@end macro

@macro bar
in bar
@end macro'],
['empty_end','@macro foo {aaa, }
in foo
@end macro'],
[ 'bad_argument', '@macro
in macro
@end macro

@rmacro bar aaa
in
@end rmacro

@macro after-name {ggg} more
in macro
@end macro
'],
['bad_formal_arg',
'
@macro bad  { , not_empty}
in bad macro
@end macro

@macro bad_space{first, in 2arg}
bad space
@end macro

@macro bar {:::}
in bar
@macro foo {? aaa}
in macro foo
@end macro
@end macro
'],
['macro_expansion','
@macro macro1 {arg1, arg2 }
result of a macro with \arg1\ and 
@verbatim
\arg2\
@end verbatim
@end macro

2 simple args. @macro1 {first arg, second arg}.

3 simple args. @macro1{one , two, three}.

comma in command. @macro1{aaa @samp{a macro , } bbb}.

call on the line. @macro1 my arg.

recursive call. @macro1{first arg, @macro1{nested second arg}}.

protect stuff. @macro1{first \, arg, \{\} \\\\ }.

multi-line arg. @macro1{arg 1

now, arg3

}.'],
['arg_not_closed',
'@macro foo {arg}
foo
@end macro

call @foo{ something
'],
['expand_two_same',
'@macro macro2 { arg }
With a doubles arg \arg\ and re \arg\

@end macro
Call macro2
@macro2 { a simple @code{
arg}
}
Call macro2 with 2 args
@macro2 { arg with comma , here }
'],
['macro_zero',
'@macro zero
0
@end macro

Macro
@zero{}
'],
['protect_in_body',
'@macro macro1 { arg1 , arg2 }
result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}
@end macro

the @macro1 { @samp{f\irst arg}, second arg } after macro.
'],
['protect_in_body_one_arg',
'@macro macro1 { arg1 , arg2 }
result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}
@end macro

@macro1 { @samp{f\irst arg}}
'],
['protect_in_body_line_arg',
'@macro macro1 { arg1 , arg2 }
result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}
@end macro

@macro1 @samp{f\irst arg}, second arg
'],
['protect_comma_macro_line',
'@macro macro2 { arg }
we get \arg\ and another \arg\
and another one on another line \arg\

and a last in another paragraph
@end macro

@macro2  arg,  comma \,
']
);


our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('macro', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

