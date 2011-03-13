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
['detailmenu_on_subnodes',
'@node Top

@menu
* chapter::
* chapter 2::

@detailmenu
* section::
@end detailmenu

@detailmenu
Chap 2

* section chap 2::
* unnumberedsec::
@end detailmenu
@end menu

@node chapter
@chapter chapter

@menu
* section::
@end menu

@node section
@section section

@node chapter 2
@chapter chapter 2

@menu
* section chap 2::
* unnumberedsec::
@end menu

@node section chap 2
@section section chap 2

@node unnumberedsec
@unnumberedsec unnumberedsec
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
['example_in_menu_comment',
'@menu
* entry::

@example
in 

example
@end example

menu comment.

@end menu
'],
['dash_in_menu',
'
@menu
* entry---in: (manual)n---ode.         description --- in.

comment --- in.
@end menu
'],
['formats_in_menu',
'@node Top

@menu
* (gcc):: text
@table @asis
@item item
* table line::
@end table

* (info)::
@verbatim
some @ verb{x atim
* texinfo:: in @ verbatim
@end verbatim
* (manual2):: %
@html

<i></i>
@end html
Log$
* (truc):: @acronym{description
* acronym::}
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
'],
['menu_in_deffn',
'@node Top

@deffn a b c 
@menu
* (mynode)::
@end menu
@end deffn
'],
['multiple_menus',
'@node Top

@menu
* (a)a::
@end menu

@menu
* (b)b::
@end menu
'],
);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['plaintext'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('menu', [@test_cases, @test_invalid], $arg_test_case,
   $arg_generate, $arg_debug);
