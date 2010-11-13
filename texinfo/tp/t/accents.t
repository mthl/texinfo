use strict;

use Test::More;
BEGIN { plan tests => 18 };

use lib '../texi2html/lib/Unicode-EastAsianWidth/lib/';
use Texinfo::Convert::Text;
use Texinfo::Parser;

ok(1, "modules loading");


sub test_accent_stack ($)
{
  my $test = shift;
  my $texi = $test->[0];
  my $name = $test->[1]; 
  my $reference = $test->[2]; 
  my $parser = Texinfo::Parser::parser({'context' => 'preformatted'});
  my $tree = $parser->parse_texi_text($texi);
  my ($text, $innermost_accent, $stack) = 
    Texinfo::Convert::Text::_find_innermost_accent($tree->{'contents'}->[0]);
  if (defined($reference)) {
    ok ($reference eq join('|',($text, @$stack)), 'innermost '.$name);
  } else {
    print STDERR join('|',($text, @$stack))."\n";
  }
}

foreach my $test (['@~e', 'simple', 'e|~'],
          ['@~{@dotless{i}}','dotless','i|~|dotless'],
          ['@~{@c comment
e}', 'comment', 'e|~'],
          ['@~{@@}','no_brace_command', '@|~'],
          ['@~{@TeX{}}','no_brace_command', 'TeX|~'],
        ) { 
  test_accent_stack($test);
}

sub test_enable_encoding ($)
{
  my $test = shift;
  my $texi = $test->[0];
  my $name = $test->[1]; 
  my $reference = $test->[2]; 
  my $parser = Texinfo::Parser::parser({'context' => 'preformatted'});
  my $tree = $parser->parse_texi_text($texi);
  my $result = 
       Texinfo::Convert::Text::eight_bit_accents($tree->{'contents'}->[0], 
    'iso-8859-1', \&Texinfo::Convert::Text::ascii_accent);
  if (defined($reference)) {
    #ok (Encode::decode('iso-8859-1', $reference) eq $result, $name);
    #ok ($reference eq Encode::encode('iso-8859-1', $result), $name);
    is (Encode::encode('iso-8859-1', $result), $reference, $name);
  } else {
    my $ord = '';
    foreach my $char (split '', $result) {
      $ord .= ord($char).'-';
    }
    $ord =~ s/-$//;
    print STDERR "$name ($ord)--> utf8: ".Encode::encode('utf8', $result).
        " latin1: ".Encode::encode('iso-8859-1', $result)."\n";
  }
}

# some come from encodings/weird_accents.texi
foreach my $test (
        ['@~e',                   'no 8bit encoding',    "e~"],
        ['@~n',                   'simple encoding',     chr(241)],
        ['@~{n}' ,                'brace encoding',      chr(241)],
        ['@^{@dotless{i}}',       'dotless',             chr(238)],
        ['@~{@dotless{i}}',       'no 8bit dotless',     'i~'],
        ['@={@~{@dotless{i}}}',   'no 8 cplx dotless',   'i~='],
        ['@={@^{@dotless{i}}}',   'complex dotless',     chr(238).'='],
        ['@={@,{@~{n}}}',         'complex encoding',    chr(241).',='],
        ['@udotaccent{r}',        'udotaccent',          '.r'],
        ['@={@ubaraccent{a}}',    'complex ubaraccent',  'a_='],
        ['@^{@udotaccent{@`r}}',  'complex udotaccent',  '.r`^' ],
        ['@={@code{@\'{@`{r}}}}', 'command in accent',   '=']
                 ) {
  test_enable_encoding($test);
}

1;
