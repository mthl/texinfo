use strict;

require 't/test_utils.pl';

my @test_cases = (
[ 'node',
'
@node one arg 
@node one arg, two arg
@node one arg, two arg, three arg
@node one arg, two arg, three arg, four arg
@node one arg, two arg, three arg, four arg, five arg

@node comment @comment

@node arg1 @comma{} arg2, @,cedilla, @strong{comma in strong,} @c comma , end
'],
['sections',
'@chapter a chapter
'],
['a_comma_after_node',
'@node Commands, Requirements, Nodes and Menus

A comma in text, end.
'],
['raiselowersections',
'\input texinfo @c -*-texinfo-*-

@node Top
@top
@menu
* Chapter::
* Second chapter::
@end menu

@node Chapter
@chapter Chapter

@menu
@ifclear include
* Chapter in included file::
@end ifclear
@end menu

@set do-top

@lowersections

@ifclear include
@include section_file.texi
@end ifclear
@raisesections

@clear do-top

@node Second chapter
@chapter Second chapter

Second chapter

@contents
@bye
']

);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('sectioning', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

