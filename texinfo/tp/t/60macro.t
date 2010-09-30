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
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('macro', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

