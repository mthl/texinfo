use strict;

require 't/test_utils.pl';

my @test_cases = (
['settitle_and_empty_top',
'@settitle Title

@top

'],
['anchor_and_empty_lines',
'text 1.

@anchor{in anchor}

text 2.
'],
['long_line',
'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBBBBBBBBBB

AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB

AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaa BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBb
1AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBB
2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBB
3AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBB
4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBB
5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBB
6AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBB
7AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBB
8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBB
9AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBB
10AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBB
11AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBB
'],
['commands_and_punctuation',
'SomthingA@.   and now inhibit.@: Now dots @dots{} and enddots @enddots{} and'],
['accent_command_punctuation',
'@dotaccent{e} after'],
['empty_line_in_example_end',
'@example
in example

@end example

After line
'],
['protected_space_end_line',
'First para

This is a very simple texi manual followed by tab a <>.
followed by @ @ newline.

This is a very simple texi manual followed by tab a <>.
followed @ @ @ newline.

This is a very simple texi manual followed by tab a <>. @ @ @ @ @ @ @ @ @ @
text.
'],
['end_sentence_space_protected',
'Some text. @
Next sentence.
'],
['protect_spaces_on_line',
'
Before samp. @samp{a}. after samp, w @w{in   w. after dot}  afterw

@quotation
@exdent before samp. @samp{a}. after samp, w @w{in   w. after dot}  afterw
@end quotation
'],
['html_expanded',
'Before
@html
html
@end html
after.
',{'expanded_formats' => ['html']}
],
['isolated_html_expanded',
'
@html
html
@end html
',{'expanded_formats' => ['html']}
],
['space_at_menu_end',
'@node Top

@menu
* (out)::

@end menu

A para.
'],
['star_at_command_formatting',
'@macro mymacro
Some text @*
more text. @
Even more text. @* not at eol.

Now followed by @@ : followed@*@ 
And now followed by a space and @@ : follow @* @ 
And now followed by a space and @@ and text: follow @* @ text
Followed by empty asis and a space @asis{} 
Followed by asis with space and a space @asis{ } 
And now with * empty @@asis: @*@asis{} 
And now with * asis with space @@asis: @* @asis{ }
And end para.
@end macro

@mymacro{}

@example
Example
@mymacro{}
@end example

@quotation
Quotation
@mymacro{}
@end quotation

'],
['line_passed_and_formats',
'@node Top

@quotation special
Quotation special.
@quotation 
Nested quotation sdflkmsfdlkmfsdqmlkfsdq mlfdsqlkmfdsqmlkfdsq klm fsqdlkmfdsq
fdsfsdqmlkfsqd m lqlkmf qskmlfq sklm fqds
@end quotation
@end quotation

@quotation
quotation  text
@example
example in   quotation
@end example
@end quotation

@example
 In  example.
@quotation
   In quotation   in example
@end quotation
@end example

@example
In 1 example
@end example
@example
In 2 example
@end example

@quotation
In 1 quotation
@end quotation
@quotation
In 2 quotation
@end quotation

@quotation 
Quotation
@quotation 
Nested quotation
@end quotation
Quotation 2
@end quotation

@example
In  example.
@quotation
In quotation   in example
@end quotation
In  example 2.
@end example

@quotation
quotation  text
@example
example in   quotation
@end example
quotation  text 2
@end quotation

Before quotation
@quotation
quotation  text
@end quotation
after end

Before example
@example
In example
@end example
After example

Before quotation and empty line
@quotation

In quotation

@end quotation
After quotation

Before example and empty line
@example

In example

@end example
After example

Nested and empty lines

Quotation empty out, spaces inside
@quotation

@quotation

In nested

@end quotation

@end quotation

Quotation empty out, no spaces inside
@quotation

@quotation
In nested
@end quotation

@end quotation

Example empty out, spaces inside
@example

@example

In nested

@end example

@end example

Example empty out, no spaces inside
@example

@example
In nested
@end example

@end example

menu
@menu
* (manual)node::
@end menu
end menu
'],
['multitable',
'@multitable {truc}    {bidule}
@item truc @tab bidule
@item   truc2     @tab bidule2
@end multitable

@multitable {t}    {b}
@item AAAAAAAAAAAA @tab BBBBBBBBBBBBBBB
@item A @tab B
@item AA @tab BB
@item AAA @tab BBB
@item AAAA @tab BBBB
@item 1 1 @tab 1 2B
@item 1 3BB @tab 1 4BBB
@item 2A 1 @tab AA AA
@item 2A 3BB @tab 2A 4BBB
@item 3AA 1 @tab 3AA 2B
@item 3AA 3BB @tab 3AA 4BBB
@item 4AAA 1 @tab 4AAA 2B
@item 4AAA 3BB @tab 4AAA 4BBB
@headitem he @tab th
@end multitable

@multitable {AA} {BB}
@item a b @tab AA BB
@item aa b @tab AA B
@item aaa b @tab A BB
@end multitable

@multitable {A}
@item A
B
@item a b
@end multitable

@multitable {A} {B}
@item U
V
@tab u
v
@item a b
@tab A B
@end multitable
'],
['nested_multitable',
'
@multitable {truc AAAA @  machin}    {bidule}
@item
@multitable {AAAA} {machin}
@item AAAA @tab machin
@end multitable
 @tab bidule
@item other item @tab in tab
@end multitable
'],
['empty_multitable_in_itemize',
'@itemize a--n itemize line
@item in macro

@multitable
@end multitable

@end itemize
'],
['long_uref_after_item',
'@itemize
@item
@uref{http://foo.org/some/long/url/which/goes/past/eighty/columns/and/has/no/alternative/text.html}
@end itemize
'],
['before_accent_punctuation',
'a. @^a'],
['invalid_accent_punctuation',
'a. @^@@'],
['sc_with_utf8_enable_encoding',
'@documentencoding utf-8
@sc{in sc}.
'],
['flushright_not_closed_and_format',
'@flushright
flushright

@quotation 
A quot---ation
@end quotation
'],
['characters_and_commands_in_var',
'@var{aaa}. @var{dlksfjf ) }. @var{(fdfdsfsd}. @var{sqdq,qdsdsq}.

@var{somethingf  @c ]
vvar}.

@var{AA@,c @u{r} @`e}.

AAA@footnote{jdhfmqsdf
dsf
ds @var{rrrr , azeeaz}
end footnote}
'],
['accents_in_var_enable_encoding',
'@documentencoding utf-8

@var{AA@,c @u{r} @`e}.
']
);

my @deep_recursion_tests = (
# more than 100 calls
['deep_recursion_in_formats',
'
@enumerate
@item
@example
@example
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@itemize truc
@item
@table @asis
@item t
@smallexample
@enumerate
@item

@end enumerate
@end smallexample
@end table
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end itemize
@end example
@end example
@end enumerate
'],
['deep_recursion_in_brace_commands',
'@code{@samp{@code{@sc{@b{@var{@code{@samp{@code{@sc{@b{@var{
@code{@samp{@code{@sc{@b{@var{@code{@samp{@code{@sc{@b{@var{
@code{@samp{@code{@sc{@b{@var{@code{@samp{@code{@sc{@b{@var{
@code{@samp{@code{@sc{@b{@var{@code{@samp{@code{@sc{@b{@var{
@code{@samp{@code{@sc{@b{@var{@code{@samp{@code{@sc{@b{@var{
}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
'],
);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['plaintext'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('plaintext_tests', [@test_cases], $arg_test_case,
   $arg_generate, $arg_debug);

1;

