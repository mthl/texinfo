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
);

my @html_cases = (
['accentenc_no_iso_no_entity',
$latin1_accents_text, {}, {'ENABLE_ENCODING_USE_ENTITY' => 0, 'USE_ISO' => 0}
],
);

foreach my $test (@test_cases) {
  push @{$test->[2]->{'test_formats'}}, 'plaintext';
  push @{$test->[2]->{'test_formats'}}, 'html';
}

foreach my $test (@html_cases) {
  push @{$test->[2]->{'test_formats'}}, 'html';
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('converters_tests', [@test_cases, @html_cases], $arg_test_case,
   $arg_generate, $arg_debug);

1;

