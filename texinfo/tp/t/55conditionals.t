use strict;

require 't/test_utils.pl';

my @test_cases = (
[ 'not_set',
'@ifset a

Flag a is set.

@end ifset
'],
['nested_ignore',
'@ignore
@ignore

@end ignore

@ignore
@end iftex
@ifinfo
@end ignore

@ignore 
@end ifclear
@ifclear
@end ignore
'],
['empty_set_in_ifset',
'@set a

@ifset a
a is set to:|@value{a}|.
@end ifset'
],
['empty_set_in_ifclear',
'@set a

@ifclear a
a is set to:|@value{a}|.
@end ifclear'
],
['consecutive_conditionals',
'@ifinfo
in ifinfo
@end ifinfo
@iftex
in iftex
@end iftex

@set b

@ifclear b
in ifclear
@end ifclear
@ifset a
in ifset
@end ifset
'],
['ifnot_format_conditional',
'@ifnottex
not tex
@end ifnottex

After.'],
['many_conditionals',
'@html
This is html text.
@end html

@ifhtml
This is ifhtml text.
@end ifhtml

@ifnothtml
This is ifnothtml text.
@end ifnothtml


@ifinfo
This is ifinfo text.
@end ifinfo

@ifnotinfo
This is ifnotinfo text.
@end ifnotinfo


@tex
This is tex text.
@end tex

@iftex
This is iftex text.
@end iftex

@ifnottex
This is ifnottex text.
@end ifnottex
', { 'expanded_formats' => ['info', 'html'] }],
['empty_ifclear',
'@ifclear

Something

@end ifclear
'],
['empty_ifset',
'@ifset

Something

@end ifset
'],
['ignore_not_closed',
'@ignore

This is ignored
']

);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('conditionals', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

