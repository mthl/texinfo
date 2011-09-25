use strict;

require 't/test_utils.pl';

my @test_cases = (
[ 'simple',
'@include inc_file.texi
'],
['macro_definition_in_include',
'@include macro_included.texi

Call macro
@themacro{}
'],
['value_expansion_in_include',
'@set testvar incl-incl.txi

@c test - in the variable name, and concatenation of text after.
@set test-var incl-incl.tx

@c test - in the variable name, and concatenation of text before and after.
@set test_var ncl-incl.tx


@node Top

testvar include: @include @value{testvar}

testvar verbatiminclude: @verbatiminclude @value{testvar}


test-var include: @include @value{test-var}i

test-var verbatiminclude: @verbatiminclude @value{test-var}i


test_var include: @include i@value{test_var}i

test_var verbatiminclude: @verbatiminclude i@value{test_var}i
'],
['macro_in_early_commands',
'@macro begin-file
macro_in_pass
@end macro
@macro end-file-name {ext}
texi_commands.\ext\
@end macro

@setfilename @begin-file{}@end-file-name{info}

@macro latin1 
ISO-8859-1
@end macro

@macro documentencoding-command
@documentencoding
@end macro

@documentencoding-command @latin1{}

@macro multiinclude
macro_included.texi
@include inc_file.texi
@end macro

@node Top
@top top

@include @multiinclude

@themacro{}

macro_in_pass_texi_commands@{info@}
@end-file-name{info}
'],
['macro_and_commands_in_early_commands',
'@macro begin-file
macro_i--n_pass@@
@end macro

@setfilename @begin-file{}texi_commands.info

@macro latin1 
ISO-8859-1@@
@end macro

@documentencoding @latin1{}

@macro multiinclude
macro_included.texi
@include inc_@@f--ile.texi
@end macro

@node Top
@top top

@include @multiinclude

@themacro{}

@verbatiminclude inc_@@f--ile.texi
'],
['test_paths',
'@include inc_file.texi

@include ./t/include_dir/inc_file.texi

@@include dot path.
@include ./inc_file.texi 
'],
['include_comment',
'@include inc_file.texi@c comment'],
['include_space_comment',
'@include inc_file.texi @c comment'],
['include_space',
'@include inc_file.texi  
'],
['double_include',
'
@include inc_file.texi @include inc_file.texi
'],
['include_at_end_line',
'@include inc_file.texi@

After.'],
['include_with_setfilename',
'@include included_file_with_setfilename.texi 
'],
['include_setfilename_on_setfilename_line',
'@setfilename file @setfilename other file @include are you joking!
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('include', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

