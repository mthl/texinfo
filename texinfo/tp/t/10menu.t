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
['bad_beginning',
'@menu
*   
*
*something::
*@code{in code}::
@end menu'
]
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('menu', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);
