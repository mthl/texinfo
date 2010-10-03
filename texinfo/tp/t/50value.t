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
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('value', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

