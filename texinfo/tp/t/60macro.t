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
'@macro no-macrobody {arg}
@end macro

@no-macrobody line arg

@no-macrobody{arg brace}.
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

@macro bad-space{first, in 2arg}
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
['too_much_args',
'@macro twoargs {first, second}
first arg: \first\
second arg: \second\
@end macro

@twoargs{one, two, three}.
'],
['macro_expansion','
@macro macro1 {arg1, arg2 }
result of a macro with \arg1\ and 
@verbatim
\arg2\
@end verbatim
@end macro

2 simple args. @macro1 {first arg, second arg}.

comma in command. @macro1{aaa @samp{a macro , } bbb}.

call on the line. @macro1 my arg.

recursive call. @macro1{first arg, @macro1{nested second arg}}.

protect stuff. @macro1{first \, arg, \{\} \\\\ }.

multi-line arg. @macro1{arg 1

now, arg3

}.'],
['implicit_quoting_one_arg',
'
@macro FIXME{a}
@strong{FIXME: \a\}
@end macro

@FIXME{Many arguments, separated by commas, are processed here}
'],
['implicit_quoting_recursion',
'@rmacro cat{a,b}
\a\\\\b\
@end rmacro

@cat{@cat{@cat{@cat{@cat{@cat{na, to}, po}, co}, tu}, oto},tam}
'],
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
result: @emph{\arg1\} protected \\\\ -> \\\\arg1\\\\ @emph{\arg2\}
@end macro

the @macro1 { @samp{f\irst arg}, second arg } after macro.
'],
['protect_in_body_one_arg',
'@macro macro1 { arg1 , arg2 }
result: @emph{\arg1\} protected \\\\ -> \\\\arg1\\\\ @emph{\arg2\}
@end macro

@macro1 { @samp{f\irst arg}}
'],
['protect_in_body_line_arg',
'@macro macro1 { arg1 , arg2 }
result: @emph{\arg1\} protected \\\\ -> \\\\arg1\\\\ @emph{\arg2\}
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
'],
['paragraph_and_macro',
'@macro empty
@end macro

@macro space
   
@end macro

@macro word
a word
@end macro

@empty{}

  @empty{}  

@empty{} text after empty.

@space{}

  @space{}  

@space{} text after space.
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

@macro mymacro-with-args{arg}
in with args
now the arg \arg\
after
@end macro


@@mymacro@{@} @@mymacro@{@}
@mymacro{} @mymacro{}

@@mymacro @@mymacro@{@}
@mymacro @mymacro{}

@@mymacro@{@} @@mymacro
@mymacro{} @mymacro

with args
@mymacro-with-args {an
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
['macro_in_brace_command',
'@macro foo
foo-expansion
@end macro

@macro bar
bar-expansion
@end macro

@itemize @bullet
@item @email{@foo{}@@@bar{}},
  also helped.
@end itemize
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
@macro2{aa\,bb}
@end iftex
@macro4{}
}

Call macro7
@macro7{aaa}

'],
['expansion_order',
'@macro bidule{arg}
@machin{}
@end macro

@macro machin
\\\\arg\\\\

@end macro

@bidule{ab}
'],
['ifclear_in_macro',
'@macro note {arg}
@ifclear notes 
\arg\
@end ifclear
@end macro

@note{
arg
}
'],
['macro_in_ifset',
'@macro macro1 {arg}
@end ifset
@end macro

@ifset a
@macro1
in ifset
@end ifset
'],
['macro_in_ifset_end_in_arg',
'@macro macro1 {arg}
@end ifset
@end macro

@ifset a
@macro1{
@end ifset
}
in ifset
@end ifset
'],
['ifset_in_macro',
'@macro note {arg}
@ifset notes 
\arg\
@end ifset
@end macro

@note{
arg
}
'],
['ifset_in_macro_set',
'@macro note {arg}
@ifset notes 
\arg\
@end ifset
@end macro

@note{
arg
}
', {'values' => {'notes' => 1}}],
# unmacro is required for C makeinfo to avoid a warning.
# texi2dvi breaks.
['arg_body_expansion_order',
'
@macro othermacro
initial
@end macro

@macro redefineothermacro {arg}
@unmacro othermacro
@macro othermacro
different
@end macro
\arg\
@end macro

@redefineothermacro{@othermacro{}}
'],
# FIXME this tests much more than macro, but also index related stuff.
# This part should certainly be elsewhere.
['macro_in_line_commands',
'@macro cp
cp
@end macro
@macro fn 
fn
@end macro
@macro syncodeindex-command 
@syncodeindex
@end macro

@syncodeindex @cp{} @fn{}
@syncodeindex-command{} cp fn

@macro en 
en
@end macro
@macro documentlanguage-command 
@documentlanguage
@end macro

documentlanguage @documentlanguage  @en{}

documentlanguage on its line
@documentlanguage-command{}  en
line following documentlanguage

@macro truc 
truc
@end macro

definedx truc
@defindex @truc{}
after

@macro trucindex-command 
@trucindex
@end macro

@trucindex-command{} index truc

@macro codeidx 
codeidx
@end macro

@defcodeindex @codeidx{}

@macro defcodeindex-entry 
a @var{index entry} t@\'e @^{@dotless{i}}
@end macro

@codeidxindex @defcodeindex-entry{}

@cindex cindex entry

@syncodeindex ky pg

@kindex @truc{} kindex
@pindex pindex @codeidx{}

@synindex truc cp

@defindex abc
@defindex defg

@synindex abc defg
@synindex defg ky

@defgindex defg index entry

@abcindex abc index entry

pg
@printindex pg

ky
@printindex ky

truc
@printindex truc

value truc
@printindex @truc{}

cp
@printindex cp

value cp
@printindex @cp{}

defg
@printindex defg

abc
@printindex abc

fn
@printindex fn
']
);

my @todo =(
['glossary',
'@macro glossarytext
@table @asis
@end macro

@macro glossary
@glossarytext{}
@end table

@end macro

@macro gentry {id, name, text}
@ifhtml
@ref{\id\,\name\}
@end ifhtml
@ifnothtml
\name\ (@pxref{\id\})
@end ifnothtml
@unmacro expandglossary
@macro expandglossary{glossary}
@unmacro glossarytext
@macro glossarytext
\\\\glossary\\\\
@item \name\ @anchor{\id\}
\text\
@end macro
@end macro
@expandglossary {@glossarytext{}}

@end macro

The @gentry{id1, name1, text1\, arg1 } is used in many cases while
@gentry{id2, name2, text2} is quite specific

@glossary{}
']
);


our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('macro', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

