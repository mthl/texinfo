use strict;

use Test::More;

require 't/test_utils.pl';

my @test_cases = (
[ 'simple', '@set a-_5b the value @b{b} @c comment

@value{a-_5b} After value.
'],
['bad_syntax','
@set
@set 
@set ?
@set :-/ hey!

@value{gurgl

@value{unknown}
'],
['value_zero',
'@set zero 0
Value
@value{zero}'
],
['empty_set',
'@set myspace

1 @value{myspace} 1
'],
['empty_value_in_line',
'@set myspace

1 
@value{myspace} 
1
'],
['value_in_node',
'@set node1 Node 1

@node Top, (dir), (dir), (dir)
@top Expansion in Node Names

@menu
* @value{node1}  ::
@end menu

@node @value{node1},, Top, Top
@chapter Chapter 1

@set sec1 Section 1.1

@menu
* @value{sec1}::
@end menu

@node Section 1.1, , Node 1, Node 1

@xref{@value{node1}}.
'],
['value_node_directions',
'@set a--foo bar

@node Top, @value{a--foo}, (dir), (dir)
@top Var @value{a--foo}
@value{a--foo}

@node @value{a--foo}, BarFoo, Top, (dir)
@chapter BarFoo

@node BarFoo, , @value{a--foo}, (dir)
@chapter bar
'],
['value_after_accent',
'@set a_letter a
@ringaccent @value{a_letter}
@~@value{a_letter}'
],
['value_in_line_commands',
'@set cp cp
@set fn fn
@set syncodeindex_command @syncodeindex

@syncodeindex @value{cp} @value{fn}
@value{syncodeindex_command} cp fn

@set en en
@set documentlanguage_command @documentlanguage

documentlanguage @documentlanguage  @value{en}

documentlanguage on its line
@value{documentlanguage_command}  en
line following documentlanguage

@set truc truc

definedx truc
@defindex @value{truc}
after

@set trucindex_command @trucindex

@value{trucindex_command} index truc

@set codeidx codeidx

@defcodeindex @value{codeidx}

@set defcodeindex_entry a @var{index entry} t@\'e @^{@dotless{i}}

@codeidxindex @value{defcodeindex_entry}

@cindex cindex entry

@syncodeindex ky pg

@kindex @value{truc} kindex
@pindex pindex @value{codeidx}

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
@printindex @value{truc}

cp
@printindex cp

value cp
@printindex @value{cp}

defg
@printindex defg

abc
@printindex abc

fn
@printindex fn
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('value', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

