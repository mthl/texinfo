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
['text_before_after',
'before @macro mymacro
in macro
@end macro after
'],
['no_macrobody',
'@macro no_macrobody {arg}
@end macro

@no_macrobody line arg

@no_macrobody{arg brace}.
'],
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
['macro_no_arg_expansion',
'@macro test1
res1
@end macro

@test1{} abc
'],
['macro_no_arg_bad_expansion',
'@macro test1
res1
@end macro

@test1 abc
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

protect stuff. @macro1{first \\, arg, \\{\\} \\\\ }.

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

the @macro1 { @samp{f\\irst arg}, second arg } after macro.
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

@macro1 @samp{f\\irst arg}, second arg
'],
['protect_comma_macro_line',
'@macro macro2 { arg }
we get \\arg\\ and another \\arg\\
and another one on another line \\arg\\

and a last in another paragraph
@end macro

@macro2  arg,  comma \\,
'],
['nested_macro_call',
'@macro machin{}
(machin)
@end macro

@macro truc{}
@machin{}

@end macro

Before @truc{} after truc.
'],
['two_macros_on_a_line',
'@macro mymacro
in mymacro
@end macro

@macro mymacro_with_args{arg}
in with args
now the arg \\arg\\
after
@end macro


@@mymacro@{@} @@mymacro@{@}
@mymacro{} @mymacro{}

@@mymacro @@mymacro@{@}
@mymacro @mymacro{}

@@mymacro@{@} @@mymacro
@mymacro{} @mymacro

with args
@mymacro_with_args {an
arg

in macro} @mymacro{}
'],
['macro_in_macro_arg','
@macro macro1
a, @macro2
@end macro

@macro macro2{arg}
hello \arg\ after arg
@end macro

@macro macro3{text, arg}
\text\
&&&& \arg\
@end macro

@macro3{@macro1{}text for macro2}
'],
['macro_in_macro_arg_simpler',
'@macro macro11
a, macro2
@end macro

@macro macro3{text, arg}
\text\
&&&& \arg\
@end macro

@macro3{@macro11{}text for macro2}
'],
['complex_argument',
'@macro macro2{arg}
coucou \arg\ after arg
@end macro

@macro macro4 {}
1
2
3
4
@end macro

@macro macro3{text, arg}
\text\
&&&& \arg\
@end macro

@macro3{@verb{% @macro2 %}
@c @macro4
@pagesizes 4 @macro4{}
@headings doubleafter @macro4{}
@verbatim
@macro2
@end verbatim
@ignore
@macro4
@end ignore
@macro macro7 {truc}
@emph{\\\\truc\\\\}
@end macro
macro7 defined
@ifinfo
@macro4
@end ifinfo
@iftex
@macro2{aa\\,bb}
@end iftex
@macro4{}
}

Call macro7
@macro7{aaa}

']
);


our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('macro', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

