use strict;

require 't/test_utils.pl';

my $accents_text = '@node Top
@top top

should be e`: @`{e} @`e

should be e\': @\'{e} @\'e

should be e^: @^{e} @^e

should be u": @"{u} @"u

should be i`: @`{i} @`i

should be i\': @\'{i} @\'i

should be i^: @^{i} @^i

should be u": @"{u} @"u

should be c,: @,{c} @,c

should be n~: @~{n} @~n

should be e=: @={e} @=e

should be e@w{\'}\': @H{e} @H e

should be e.: @dotaccent{e} @dotaccent e

should be e*: @ringaccent{e} @ringaccent e

should be ee[: @tieaccent{ee}

should be e(: @u{e} @u e

should be e_: @ubaraccent{e} @ubaraccent e

should be .e: @udotaccent{e} @udotaccent e

should be e<: @v{e} @v e

should be a; : @ogonek{a} @ogonek a

should be e; : @ogonek{e} @ogonek e

upside down: @questiondown{} @exclamdown{}

A-with-circle: @aa{},@AA{}

AE, OE ligatures: @ae{} @AE{} @oe{} @OE{}

dotless i, j: @dotless{i} @dotless{j}

Polish suppressed-L: @l{} @L{}

O-with-slash: @o{} @O{}

es-zet or sharp S: @ss{}

pounds sterling: @pounds{}

@c arg is command -- @dotless{i} is special-cased for HTML
should be dotless i`: @`{@dotless{i}}

should be dotless i\': @\'{@dotless{i}}

should be dotless i^: @^{@dotless{i}}

should be dotless i": @"{@dotless{i}}

@c arg is command -- @dotless{j}
should be dotless j`: @`{@dotless{j}}

should be dotless j\': @\'{@dotless{j}}

should be dotless j^: @^{@dotless{j}}

should be dotless j": @"{@dotless{j}}
';

my $latin1_accents_text = '@documentencoding ISO-8859-1

'.$accents_text;

my $weird_accents_text = '@documentencoding ISO-8859-1

@node Top
@top top

@={@~{@dotless{i}}}

@={@,{@~{n}}}

@={@ubaraccent{a}}

@^{@udotaccent{@`r}}

@={@\'{@`{r}}}
';

my @test_cases = (
['accentenc',
$latin1_accents_text
],
['weird_accents',
$weird_accents_text
],
['weird_accents_disable_encoding',
$weird_accents_text, {}, {'ENABLE_ENCODING' => 0}
],
['accent',
$accents_text
],
['accent_with_text',
'@u{--a} @dotless{--b} @^{--@dotless{i}} @^{--@dotless{j}} @^{--a}
'],
['refs_formatting',
'@node chapter
@chapter chapter

@code{@@ref@{chapter,cross ref name@}} @ref{chapter,cross ref name}
@code{@@ref@{chapter,,title@}} @ref{chapter,,title}
@code{@@ref@{chapter,,,file name@}} @ref{chapter,,,file name}
@code{@@ref@{chapter,,,,manual@}} @ref{chapter,,,,manual}
@code{@@ref@{chapter,cross ref name,title,@}} @ref{chapter,cross ref name,title,}
@code{@@ref@{chapter,cross ref name,,file name@}} @ref{chapter,cross ref name,,file name}
@code{@@ref@{chapter,cross ref name,,,manual@}} @ref{chapter,cross ref name,,,manual}
@code{@@ref@{chapter,cross ref name,title,file name@}} @ref{chapter,cross ref name,title,file name}
@code{@@ref@{chapter,cross ref name,title,,manual@}} @ref{chapter,cross ref name,title,,manual}
@code{@@ref@{chapter,cross ref name,title, file name, manual@}} @ref{chapter,cross ref name,title, file name, manual}
@code{@@ref@{chapter,,title,file name@}} @ref{chapter,,title,file name}
@code{@@ref@{chapter,,title,,manual@}} @ref{chapter,,title,,manual}
@code{@@ref@{chapter,,title, file name, manual@}} @ref{chapter,,title, file name, manual}
@code{@@ref@{chapter,,,file name,manual@}} @ref{chapter,,,file name,manual}

@code{@@ref@{(pman)anode,cross ref name@}} @ref{(pman)anode,cross ref name}
@code{@@ref@{(pman)anode,,title@}} @ref{(pman)anode,,title}
@code{@@ref@{(pman)anode,,,file name@}} @ref{(pman)anode,,,file name}
@code{@@ref@{(pman)anode,,,,manual@}} @ref{(pman)anode,,,,manual}
@code{@@ref@{(pman)anode,cross ref name,title,@}} @ref{(pman)anode,cross ref name,title,}
@code{@@ref@{(pman)anode,cross ref name,,file name@}} @ref{(pman)anode,cross ref name,,file name}
@code{@@ref@{(pman)anode,cross ref name,,,manual@}} @ref{(pman)anode,cross ref name,,,manual}
@code{@@ref@{(pman)anode,cross ref name,title,file name@}} @ref{(pman)anode,cross ref name,title,file name}
@code{@@ref@{(pman)anode,cross ref name,title,,manual@}} @ref{(pman)anode,cross ref name,title,,manual}
@code{@@ref@{(pman)anode,cross ref name,title, file name, manual@}} @ref{(pman)anode,cross ref name,title, file name, manual}
@code{@@ref@{(pman)anode,,title,file name@}} @ref{(pman)anode,,title,file name}
@code{@@ref@{(pman)anode,,title,,manual@}} @ref{(pman)anode,,title,,manual}
@code{@@ref@{(pman)anode,,title, file name, manual@}} @ref{(pman)anode,,title, file name, manual}
@code{@@ref@{(pman)anode,,,file name,manual@}} @ref{(pman)anode,,,file name,manual}

@code{@@inforef@{chapter, cross ref name, file name@}} @inforef{chapter, cross ref name, file name}
@code{@@inforef@{chapter@}} @inforef{chapter}
@code{@@inforef@{chapter, cross ref name@}} @inforef{chapter, cross ref name}
@code{@@inforef@{chapter,,file name@}} @inforef{chapter,,file name}
'],
['ref_error_formatting',
'
@code{@@ref@{node@}} @ref{node}

@code{@@ref@{,cross ref name@}} @ref{,cross ref name}
@code{@@ref@{,,title@}} @ref{,,title}
@code{@@ref@{,,,file name@}} @ref{,,,file name}
@code{@@ref@{,,,,manual@}} @ref{,,,,manual}
@code{@@ref@{node,cross ref name@}} @ref{node,cross ref name}
@code{@@ref@{node,,title@}} @ref{node,,title}
@code{@@ref@{node,,,file name@}} @ref{node,,,file name}
@code{@@ref@{node,,,,manual@}} @ref{node,,,,manual}
@code{@@ref@{node,cross ref name,title,@}} @ref{node,cross ref name,title,}
@code{@@ref@{node,cross ref name,,file name@}} @ref{node,cross ref name,,file name}
@code{@@ref@{node,cross ref name,,,manual@}} @ref{node,cross ref name,,,manual}
@code{@@ref@{node,cross ref name,title,file name@}} @ref{node,cross ref name,title,file name}
@code{@@ref@{node,cross ref name,title,,manual@}} @ref{node,cross ref name,title,,manual}
@code{@@ref@{node,cross ref name,title, file name, manual@}} @ref{node,cross ref name,title, file name, manual}
@code{@@ref@{node,,title,file name@}} @ref{node,,title,file name}
@code{@@ref@{node,,title,,manual@}} @ref{node,,title,,manual}
@code{@@ref@{node,,title, file name, manual@}} @ref{node,,title, file name, manual}
@code{@@ref@{node,,,file name,manual@}} @ref{node,,,file name,manual}
@code{@@ref@{,cross ref name,title,@}} @ref{,cross ref name,title,}
@code{@@ref@{,cross ref name,,file name@}} @ref{,cross ref name,,file name}
@code{@@ref@{,cross ref name,,,manual@}} @ref{,cross ref name,,,manual}
@code{@@ref@{,cross ref name,title,file name@}} @ref{,cross ref name,title,file name}
@code{@@ref@{,cross ref name,title,,manual@}} @ref{,cross ref name,title,,manual}
@code{@@ref@{,cross ref name,title, file name, manual@}} @ref{,cross ref name,title, file name, manual}
@code{@@ref@{,,title,file name@}} @ref{,,title,file name}
@code{@@ref@{,,title,,manual@}} @ref{,,title,,manual}
@code{@@ref@{,,title, file name, manual@}} @ref{,,title, file name, manual}
@code{@@ref@{,,,file name,manual@}} @ref{,,,file name,manual}

@code{@@inforef@{,cross ref name @}} @inforef{,cross ref name }
@code{@@inforef@{,,file name@}} @inforef{,,file name}
@code{@@inforef@{,cross ref name, file name@}} @inforef{,cross ref name, file name}
@code{@@inforef@{@}} @inforef{}

@code{@@inforef@{node, cross ref name, file name@}} @inforef{node, cross ref name, file name}
@code{@@inforef@{node@}} @inforef{node}
@code{@@inforef@{node, cross ref name@}} @inforef{node, cross ref name}
@code{@@inforef@{node,,file name@}} @inforef{node,,file name}
'],
['unknown_value',
'@value{unknown}'],
['test_sp',
'Para
@sp 1
other para
Now lone @@sp:

@sp 1

@sp 2
Para after sp

A
@sp 2
B

sp after para
@sp 1
'],
['sp_in_example',
'@example
Para
@sp 1
other para
Now lone @@sp:

@sp 1

@sp 2
Para after sp

A
@sp 2
B

sp after para
@sp 1
@end example
'],
['documentencoding_utf8_and_insertions',
'@documentencoding utf-8

-- --- \'\' `` @code{in code}. @~e.

@example
-- --- \'\' `` @code{in code}. @~e.
@end example
'],
['no_documentencoding_and_insertions',
'
-- --- \'\' `` @code{in code}. @~e.

@example
-- --- \'\' `` @code{in code}. @~e.
@end example
'],

);

# This should go to a file, not to code...
my @html_text_cases = (
['accentenc_no_iso_no_entity',
$latin1_accents_text, {}, {'ENABLE_ENCODING' => 1,
                           'ENABLE_ENCODING_USE_ENTITY' => 0, 'USE_ISO' => 0}
],
);

foreach my $test (@test_cases) {
  push @{$test->[2]->{'test_formats'}}, 'plaintext';
  push @{$test->[2]->{'test_formats'}}, 'html_text';
  #push @{$test->[2]->{'test_formats'}}, 'xml';
  push @{$test->[2]->{'test_formats'}}, 'docbook';
}

foreach my $test (@html_text_cases) {
  push @{$test->[2]->{'test_formats'}}, 'html_text';
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('converters_tests', [@test_cases, @html_text_cases], $arg_test_case,
   $arg_generate, $arg_debug);

1;

