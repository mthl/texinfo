use strict;

require 't/test_utils.pl';

my $test_text = 
'@top top

@chapter chapter

@section section

@subsection subsection

@subsubsection subsubsection

@part part

@chapter chapter in part

@chapter second chapter in part

@unnumbered unnumbered

@appendix appendix

@appendixsec appendixsec
';

my @tests_converted = (
['setcontentsaftertitlepage',
'@setcontentsaftertitlepage
'
.$test_text.
'
@contents
'],
['setshortcontentsaftertitlepage',
'@setshortcontentsaftertitlepage
'
.$test_text.
'
@shortcontents
'],
['contents',
$test_text.
'
@contents
'],
['shortcontents',
$test_text.
'
@shortcontents
'],
['section_below_unnumbered',
'
@contents

@node Top
@top Top

Top node.

@menu
* Unn::
@end menu


@node Unn
@unnumbered Unn

@menu
* Sec::
@end menu

@node Sec
@section Sec

Should be unnumbered.

@bye
'
],
);

my @test_cases = (
[ 'node',
'
@node one arg1 
@node one arg2, two arg
@node one arg3, two arg, three arg
@node one arg4, two arg, three arg, four arg
@node one arg5, two arg, three arg, four arg, five arg

@node comment @comment

@node arg1 @comma{} arg2, @,cedilla, @strong{comma in strong,} @c comma , end
'],
['space_in_node',
'
@node Top

@menu
* Chap    first here::
* Test    title   :Test   title.
@end menu

@node  Chap first	here

@node Test               title
'],
['empty_nodes_with_commands',
'
@node @c comment

@node @
@node @:
@node @asis{ }
'],
['sections',
'@chapter a chapter
'],
['unnumbered_no_argument',
'@unnumbered
'],
['a_comma_after_node',
'@node Commands, Requirements, Nodes and Menus

A comma in text, end.
'],
['nodename_parentheses',
'@node Top
@top The top node

@menu
* Node (with parentheses)::
* Other node::
* (manual)node::
@end menu

@node Node (with parentheses)
@chapter Section (nodename with parentheses)

Dummy section

@node Other node
@chapter Section (nodename without parentheses)

Dummy link to @ref{Node (with parentheses)}.

Dummy link to @ref{(manual)node}.

@node (manual)node
@chapter (manual)node

Dummy section with (manual)node node syntax.

@anchor{(manual)anchor}.

'],
['node_empty_direction',
'@node name, '
],
['character_and_spaces_in_node',
'
@node Top
@node other nodes, !_"#$%&\'()*+-., Top, Top
@node !_"#$%&\'()*+-., /;<=>?[\\]^_`|~, other nodes, other nodes
@node /;<=>?[\\]^_`|~,local   node,!_"#$%&\'()*+-., other nodes
@node  local   node,,/;<=>?[\\]^_`|~,other nodes
'],
['at_commands_in_node',
'@node A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}'
],
['unknown_node_in_menu',
'@node Top

@menu
* unknown::
@end menu
'],
['character_and_spaces_in_refs',
'@node Top
@top Test refs

@menu
* other nodes::
@end menu

@subheading Testing distant nodes

@ref{ a  node ,,, manual}
@ref{:,,,manual}
@ref{ top ,,, manual}
@ref{(texinfo)Cross References}
@ref{node,,, ../manual/doc.texi}
@ref{!_"#$%&\'()*+-.}
@ref{/;<=>?[\\]^_`|~}
@ref{ Top}
@ref{  local   node}

@node other nodes, !_"#$%&\'()*+-., Top, Top
@chapter Chapter with nodes

@menu
* !_"#$%&\'()*+-.::
* /;<=>?[\\]^_`|~::
* local node::
@end menu

@node !_"#$%&\'()*+-., /;<=>?[\]^_`|~, other nodes, other nodes

@node /;<=>?[\]^_`|~,local   node,!_"#$%&\'()*+-., other nodes

@node  local   node,,/;<=>?[\\]^_`|~,other nodes

@bye
'],
['some_at_commands_in_ref_nodes',
'
@node Top
@top Top

@menu
* A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}::
@end menu

@node A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}
@chapter  A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}

see @ref{a @strong{strong} ref with @sc{sc}@comma{} a i trema @"i@comma{} a dotless i trema @"{@dotless{i}} @`{@=E} and exclamdown @exclamdown{},,,manual}.
'],
['at_commands_in_refs',
'@node Top
@top Top

@menu
* @- @{ @}::
* @  @   @! @* @. @: .@: @? @@::
* @LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}::
* @equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}::
* @geq{} @leq{} @arrow{}::
* @ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}::
* @result{} @textdegree{} a@tie{}b @today{} @aa{}::
* @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}::
* @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}::
* @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}::
* @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}::
* @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}::
* `` \'\' --- --::
* @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}::
* @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}::
* @email{someone@@somewher, the someone} @email{no_explain@@there}::
* @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}::
* @verb{. @ {} . .}::
* @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}::
* @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}::
* 8.27@dmn{in}::
* @sansserif{sansserif} @slanted{slanted}::
* @indicateurl{indicateurl}::
* @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}::
@end menu

@node @- @{ @}
@chapter @- @{ @}

@node @  @       @! @* @. @: .@: @? @@
@chapter @  @    @! @* @. @: .@: @? @@

@node @LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
@chapter @LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}

@node @equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
@chapter @equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}

@node @geq{} @leq{} @arrow{}
@chapter @geq{} @leq{} @arrow{}

@node @ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
@chapter @ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}

@node @result{} @textdegree{} a@tie{}b @today{} @aa{}
@chapter @result{} @textdegree{} a@tie{}b @today{} @aa{}

@node @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{} 
@chapter @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{} 

@node @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
@chapter  @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}

@node @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
@chapter @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}

@node @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
@chapter @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}

@node @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
@chapter @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}

@node `` \'\' --- --
@chapter `` \'\' --- --

@node @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
@chapter @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}

@node @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
@ifnottex
@chapter @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
@end ifnottex

@node @email{someone@@somewher, the someone} @email{no_explain@@there}
@chapter @email{someone@@somewher, the someone} @email{no_explain@@there}

@node @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
@ifnottex
@chapter @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
@end ifnottex

@node @verb{. @ {} . .}
@ifnottex
@chapter @verb{. @ {} . .}
@end ifnottex

@node @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
@chapter @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}

@node @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
@chapter @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}

@node 8.27@dmn{in}
@chapter 8.27@dmn{in}

@node @sansserif{sansserif} @slanted{slanted}
@chapter @sansserif{sansserif} @slanted{slanted}

@node @indicateurl{indicateurl}
@chapter @indicateurl{indicateurl}

@node @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
@chapter @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}

@ref{@- @{ @}}

@ref{@  @        @! @* @. @: .@: @? @@}
@ref{@LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}}
@ref{@equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}}

@ref{@geq{} @leq{} @arrow{}}

@ref{@ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}}
@ref{@result{} @textdegree{} a@tie{}b @today{} @aa{}}
@ref{@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}}
@ref{@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}}
@ref{@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}}
@ref{@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}}
@ref{@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}}
@ref{`` \'\' --- --}
@ref{@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}}
@ifnottex
@ref{@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}}
@end ifnottex
@ref{@email{someone@@somewher, the someone} @email{no_explain@@there}}
@ifnottex
@ref{@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}}
@ref{@verb{. @ {} . .}}
@end ifnottex
@ref{@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}}
@ref{@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}}
@ref{8.27@dmn{in}}
@ref{@sansserif{sansserif} @slanted{slanted}}
@ref{@indicateurl{indicateurl}}
@ref{@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}}

@bye
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
'],
['empty_node',
'@node

@node , next, prev, up
'],
['empty_anchor',
'@anchor{}. 
@anchor{   }.
'],
['double_node_anchor_float',
'@node node1

@node node1

@anchor{node1}

@anchor{anchor1}

@node anchor1

@float Text, node1
@end float

@float Text, anchor1
@end float

@float Text, float1
@end float

@node float1
'],
['double_top',
'@node ToP, top

@node top,,ToP,Top

@anchor{TOP}.
'],
['double_top_in_menu',
'@node ToP, top
Top node

@menu
* top::
* TOP:: myself
@end menu

@node top,,ToP,Top
second node.
'],
['rec_nodes',
'@node ToP
Top node

@menu
* second node::
* node following second::
@end menu

@node second node,,Top,Top

@menu
* other node::
* second node::
@end menu

@node other node,,,second node

@menu 
* other node::
@end menu

@node node up node following second,,,node following second
@menu
* node following second::
@end menu

in node up node following second

@node node following second,,,node up node following second

in node following second
@menu
* node up node following second::
@end menu
'],
['semi_auto',
'@node Top
@top Top

@menu
* Chap1::
* Section non auto::
@end menu

@node Chap1
@chapter Chapter 1

@menu
* Sec in chapter::
@end menu

@node Sec in chapter
@section Sec in chapter

@node Section non auto,, Chap1, Top
@section Section
'],
['novalidate',
'
@novalidate

@node first, unknown node

@menu
* not a node::
@end menu
'],
['loop_nodes',
'
@node Top
@top top

@menu
* node up::
@end menu

@node node up,,,node down

@menu
* node middle::
@end menu

@node node middle,,,node up

@menu
* node down::
@end menu

@node node down
'],
['complex',
'@node Top,First node,(dir)
@top
@menu
* First node:: 
* between node::
* Second node::   node 2
* Third node unnumbered:: unnumbered in Top menu
* Last node no description::
@end menu

@node First node,,Top,Top
@chapter first node chapter

first node chapter text
@menu
* unnumbered:: un
* unnumbered2:: un2
* numbered:: nu

@end menu

@node unnumbered
@unnumberedsec unnumbered section

@menu
* unnumbered sub:: un
* numbered sub:: nu
* unnumbered sub2:: un2
* numbered sub2:: nu2
@end menu

@node unnumbered sub
@unnumberedsubsec unnumbered subsection

@node numbered sub
@subsection numbered subsection

@node unnumbered sub2
@unnumberedsubsec unnumbered subsection2

@node numbered sub2
@subsection numbered subsection2

@node unnumbered2
@unnumberedsec unnumbered section2

@menu
*  numbered sub3::
@end menu

@node numbered sub3
@subsection numbered subsection3


@node numbered
@section  numbered section

@node between node,,,Top

between node, node without sectioning node

@node Second node,Third node unnumbered,,Top

Second node text

@chapter second node chapter

second node chapter text.

@node Third node unnumbered
@unnumbered unnumbered chapter

unnumbered chapter text.


@node Last node no description,,Third node unnumbered,Top

@contents
@bye
'],
['double_top_section',
'@top First top

First top.

@top Second top

Second top.
'],
['setfilename_on_top_and_after_node',
'@node Top
@top In top @setfilename very badly placed setfilename

@setfilename a bit too late
']
);

foreach my $test (@tests_converted) {
  $test->[2]->{'test_formats'} = ['plaintext'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('sectioning', [@test_cases, @tests_converted], $arg_test_case,
   $arg_generate, $arg_debug);

