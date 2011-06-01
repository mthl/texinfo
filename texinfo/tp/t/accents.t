use strict;

use Test::More;
BEGIN { plan tests => 50 };

use lib '../texi2html/lib/Unicode-EastAsianWidth/lib/';
use lib '../texi2html/lib/libintl-perl/lib/';
use lib '../texi2html/lib/Text-Unidecode/lib/';
use Texinfo::Convert::Text;
use Texinfo::Convert::Converter;
use Texinfo::Convert::HTML;
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
          ['@~{@TeX{}}','brace_no_arg_command', 'TeX|~'],
          ['@~{@TeX{}@^{a@dotless{i}}}','text_and_accent', 'i|~|^|dotless'],
          ['@~{@^{a}@ringaccent b}}','two_accents', 'a|~|^'],
        ) { 
  test_accent_stack($test);
}

sub test_enable_encoding ($)
{
  my $test = shift;
  my $texi = $test->[0];
  my $name = $test->[1]; 
  my $reference = $test->[2];
  my $reference_xml = $test->[3];
  my $reference_xml_entity = $test->[4];
  my $parser = Texinfo::Parser::parser({'context' => 'preformatted'});
  my $text_root = $parser->parse_texi_text($texi);
  my $tree = $text_root->{'contents'}->[0];
  my $result = 
       Texinfo::Convert::Text::eight_bit_accents($tree, 
    'iso-8859-1', \&Texinfo::Convert::Text::ascii_accent);
  my $html_converter = Texinfo::Convert::HTML->converter();
  $html_converter->{'conf'}->{'USE_NUMERIC_ENTITY'} = 0;
  my $result_xml = Texinfo::Convert::Converter::xml_accents($html_converter, 
                                                            $tree);
  $html_converter->{'conf'}->{'USE_NUMERIC_ENTITY'} = 1;
  my $result_xml_entity 
      = Texinfo::Convert::Converter::xml_accents($html_converter, $tree);
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
  if (defined($reference_xml)) {
    is ($result_xml, $reference_xml, "$name xml");
  } else {
    print STDERR "$name xml: $result_xml\n";
    #print STDERR "<p>$texi $name xml: $result_xml\n</p>";
  }
  if (defined($reference_xml_entity)) {
    is ($result_xml_entity, $reference_xml_entity, "$name xml");
  } else {
    print STDERR "$name xml entity: $result_xml_entity\n";
    #print STDERR "<p>$texi $name xml entity: $result_xml_entity\n</p>";
  }
}

# some come from encodings/weird_accents.texi
foreach my $test (
  ['@~e',                   'no 8bit encoding',    "e~", 'e~', '&#7869;'],
  ['@~n',                   'simple encoding',     chr(241), 
                                                   '&ntilde;', '&ntilde;'],
  ['@~{n}' ,                'brace encoding',      chr(241), 
                                                   '&ntilde;', '&ntilde;'],
  ['@^{@dotless{i}}',       'dotless',             chr(238), '&icirc;', 
                                                             '&icirc;'],
  ['@~{@dotless{i}}',       'no 8bit dotless',     'i~', 'i~', '&#297;'],
  ['@={@~{@dotless{i}}}',   'no 8 cplx dotless',   'i~=', 'i~=', 
                                                          '&#297;='],
  ['@={@^{@dotless{i}}}',   'complex dotless',     chr(238).'=', 
                                                   '&icirc;=', '&icirc;='],
  ['@={@,{@~{n}}}',         'complex encoding',    chr(241).',=', '&ntilde;,=',
                                                                  '&ntilde;,='],
  ['@udotaccent{r}',        'udotaccent',          '.r', '.r', '&#7771;'],
  ['@={@ubaraccent{a}}',    'complex ubaraccent',  'a_=', 'a_=', 'a_='],
  ['@^{@udotaccent{@`r}}',  'complex udotaccent',  '.r`^', '.r`^', '.r`^'],
  ['@v{@\'{r}}',            'utf8 possible inside', 'r\'<', 'r\'&lt;', 
                                                    '&#341;&lt;'],
  ['@={@code{@\'{@`{r}}}}', 'command in accent',   '=', '=', '=']
            ) {
  test_enable_encoding($test);
}

#my $aa = Texinfo::Parser::parse_texi_line(undef, '@aa{}');
my $res_e = Texinfo::Parser::parse_texi_line(undef, '@^e');
my $result = Texinfo::Convert::Text::convert($res_e, {'enabled_encoding' => 'utf-8'});
is ($result, "\x{00EA}", 'enable encoding @^e');

my $res_aa = Texinfo::Parser::parse_texi_line(undef, '@aa{}');
$result = Texinfo::Convert::Text::convert($res_aa, {'enabled_encoding' => 'utf-8'});
is ($result, "\x{00E5}", 'enable encoding @aa{}');

$result = Texinfo::Convert::Text::convert($res_aa, {'enabled_encoding' => 'iso-8859-1'});
is ($result, "\x{00E5}", 'enable encoding latin1 @aa{}');
#print STDERR "$result\n";
#print STDERR "`$result'\n".ord($result)."\n".sprintf("%x\n",ord($result));
#print STDERR "".Encode::encode('utf8', "\x{00E5}\n");

1;
