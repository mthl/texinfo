use strict;

require 't/test_utils.pl';

my @test_cases = (
['simple','
@menu
comment
* menu entry name : node.    description
* node name::                description new
* other entry: node,    
* last::
                 description next line
                 still description

new comment
* last node entry ::
@end menu
'],
['menu_entry_node',
'@menu
* (f)a1::
* (f)a2::  
* (f)a3::         d
* (f)@@a@::: 
@end menu
'],
['menu_entry_node_comments',
'@menu
* (f)a1c::@c c
* (f)a2c::  @c c
* (f)a3c::         d@c c
* (f) a4 ::   @c c
@end menu
'],
['menu_entry_name',
'@menu
* a: (f)b
* a: (f)b1.c,
* a: (f)b2.c,     
* a: (f)b3.c,    d
* a: (f)b1.. 
* a : (f) b2 ..
* a.n: (f)b3..         d
* a: (f)b1.c.
* a: (f)b2.c.  
* a: (f)b3.c. d
@end menu
'],
['menu_entry_name_comment',
'@menu
* a: (f)b@c c
* a: (f)b @c c
* a: (f)b1c.c,@c c
* a: (f)b2c.c,     @c c
* a: (f)b3c.c,    d@c c
@end menu
'],
['detailmenu',
'
@menu
* Copying Conditions::          Your rights.

@detailmenu
* detailmenu::
@end detailmenu
@end menu
'],
['reference_to_external_manual',
'
@node Top

@menu
* (info)::
@end menu
'],
['menu_entry_no_entry',
'@menu
* a1:
* a2:  
* a1c:@c c
* a2c:  @c c
* a4@b{a}: 
* a5@b{b}: @c c
@end menu
'],
);

my @test_invalid = (
['bad_beginning',
'@menu
*   
*
*something::
*@code{in code}::
@end menu'
],
['menu_no_closed_after_empty_line',
'@menu
* (manual_in_menu):: desc2


'],
['menu_no_closed_in_description',
'@menu
* (manual_in_menu):: desc'
],
['menu_no_closed_in_entry',
'@menu
* a1:'
],
['menu_no_closed_entry_beginning',
'@menu
* node'
],
['menu_no_closed_star',
'@menu
* '
],
['direntry_dircategory_after_first_node',
'@node Top
@top direntry direcategory after first node

@dircategory Cat
@direntry
* in text: (in_text). in text
@end direntry
']
);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['plaintext'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('menu', [@test_cases, @test_invalid], $arg_test_case,
   $arg_generate, $arg_debug);
