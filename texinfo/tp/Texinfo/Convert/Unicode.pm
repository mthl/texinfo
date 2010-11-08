# Unicode.pm: handle conversion to unicode.
#
# Copyright 2010 Free Software Foundation, Inc.
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License,
# or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 
# Original author: Patrice Dumas <pertusus@free.fr>

package Texinfo::Convert::Unicode;

use 5.006;
use strict;

use Encode;
use Unicode::Normalize;
use Texinfo::Convert::Text;

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration       use Texinfo::Covert::Text ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';

our %unicode_diacritics = (
       'H'          => '030B', 
       'ringaccent' => '030A', 
       "'"          => '0301',
       'v'          => '030C', 
       ','          => '0327', 
       '^'          => '0302', 
       'dotaccent'  => '0307',
       '`'          => '0300',
       '='          => '0304', 
       '~'          => '0303',
       '"'          => '0308', 
       'udotaccent' => '0323', 
       'ubaraccent' => '0332', 
       'u'          => '0306',
       'tieaccent'  => '0361',
       'ogonek'     => '0328'
);

our %unicode_accented_letters = (
    'dotaccent' => { # dot above
        'A' => '0226', #C moz-1.2 
        'a' => '0227', #c moz-1.2
        'B' => '1E02',
        'b' => '1E03',
        'C' => '010A',
        'c' => '010B',
        'D' => '1E0A',
        'd' => '1E0B',
        'E' => '0116',
        'e' => '0117',
        'F' => '1E1E',
        'f' => '1E1F',
        'G' => '0120',
        'g' => '0121',
        'H' => '1E22',
        'h' => '1E23',
        'i' => '0069',
        'I' => '0130',
        'N' => '1E44',
        'n' => '1E45',
        'O' => '022E', #Y moz-1.2
        'o' => '022F', #v moz-1.2
        'P' => '1E56',
        'p' => '1E57',
        'R' => '1E58',
        'r' => '1E59',
        'S' => '1E60',
        's' => '1E61',
        'T' => '1E6A',
        't' => '1E6B',
        'W' => '1E86',
        'w' => '1E87',
        'X' => '1E8A',
        'x' => '1E8B',
        'Y' => '1E8E',
        'y' => '1E8F',
        'Z' => '017B',
        'z' => '017C',
    },
    'udotaccent' => { # dot below
        'A' => '1EA0',
        'a' => '1EA1',
        'B' => '1E04',
        'b' => '1E05',
        'D' => '1E0C',
        'd' => '1E0D',
        'E' => '1EB8',
        'e' => '1EB9',
        'H' => '1E24',
        'h' => '1E25',
        'I' => '1ECA',
        'i' => '1ECB',
        'K' => '1E32',
        'k' => '1E33',
        'L' => '1E36',
        'l' => '1E37',
        'M' => '1E42',
        'm' => '1E43',
        'N' => '1E46',
        'n' => '1E47',
        'O' => '1ECC',
        'o' => '1ECD',
        'R' => '1E5A',
        'r' => '1E5B',
        'S' => '1E62',
        's' => '1E63',
        'T' => '1E6C',
        't' => '1E6D',
        'U' => '1EE4',
        'u' => '1EE5',
        'V' => '1E7E',
        'v' => '1E7F',
        'W' => '1E88',
        'w' => '1E89',
        'Y' => '1EF4',
        'y' => '1EF5',
        'Z' => '1E92',
        'z' => '1E93',
    },
    'ubaraccent' => { # line below
        'B' => '1E06',
        'b' => '1E07',
        'D' => '1E0E',
        'd' => '1E0F',
        'h' => '1E96',
        'K' => '1E34',
        'k' => '1E35',
        'L' => '1E3A',
        'l' => '1E3B',
        'N' => '1E48',
        'n' => '1E49',
        'R' => '1E5E',
        'r' => '1E5F',
        'T' => '1E6E',
        't' => '1E6F',
        'Z' => '1E94',
        'z' => '1E95',
    },
    ',' => { # cedilla
        'C' => '00C7',
        'c' => '00E7',
        'D' => '1E10',
        'd' => '1E11',
        'E' => '0228', #C moz-1.2
        'e' => '0229', #c moz-1.2
        'G' => '0122',
        'g' => '0123',
        'H' => '1E28',
        'h' => '1E29',
        'K' => '0136',
        'k' => '0137',
        'L' => '013B',
        'l' => '013C',
        'N' => '0145',
        'n' => '0146',
        'R' => '0156',
        'r' => '0157',
        'S' => '015E',
        's' => '015F',
        'T' => '0162',
        't' => '0163',
    },
    '=' => { # macron
        'A' => '0100',
        'a' => '0101',
        'E' => '0112',
        'e' => '0113',
        'I' => '012A',
        'i' => '012B',
        'G' => '1E20',
        'g' => '1E21',
        'O' => '014C',
        'o' => '014D',
        'U' => '016A',
        'u' => '016B',
        'Y' => '0232', #? moz-1.2
        'y' => '0233', #? moz-1.2
    },
    '"' => { # diaeresis
        'A' => '00C4',
        'a' => '00E4',
        'E' => '00CB',
        'e' => '00EB',
        'H' => '1E26',
        'h' => '1E27',
        'I' => '00CF',
        'i' => '00EF',
        'O' => '00D6',
        'o' => '00F6',
        't' => '1E97',
        'U' => '00DC',
        'u' => '00FC',
        'W' => '1E84',
        'w' => '1E85',
        'X' => '1E8C',
        'x' => '1E8D',
        'y' => '00FF',
        'Y' => '0178',
    },
    'u' => { # breve
        'A' => '0102',
        'a' => '0103',
        'E' => '0114',
        'e' => '0115',
        'G' => '011E',
        'g' => '011F',
        'I' => '012C',
        'i' => '012D',
        'O' => '014E',
        'o' => '014F',
        'U' => '016C',
        'u' => '016D',
    },
    "'" => { # acute
        'A' => '00C1',
        'a' => '00E1',
        'C' => '0106',
        'c' => '0107',
        'E' => '00C9',
        'e' => '00E9',
        'G' => '01F4',
        'g' => '01F5',
        'I' => '00CD',
        'i' => '00ED',
        'K' => '1E30',
        'k' => '1E31',
        'L' => '0139',
        'l' => '013A',
        'M' => '1E3E',
        'm' => '1E3F',
        'N' => '0143',
        'n' => '0144',
        'O' => '00D3',
        'o' => '00F3',
        'P' => '1E54',
        'p' => '1E55',
        'R' => '0154',
        'r' => '0155',
        'S' => '015A',
        's' => '015B',
        'U' => '00DA',
        'u' => '00FA',
        'W' => '1E82',
        'w' => '1E83',
        'Y' => '00DD',
        'y' => '00FD',
        'Z' => '0179',
        'z' => '018A',
    },
    '~' => { # tilde
        'A' => '00C3',
        'a' => '00E3',
        'E' => '1EBC',
        'e' => '1EBD',
        'I' => '0128',
        'i' => '0129',
        'N' => '00D1',
        'n' => '00F1',
        'O' => '00D5',
        'o' => '00F5',
        'U' => '0168',
        'u' => '0169',
        'V' => '1E7C',
        'v' => '1E7D',
        'Y' => '1EF8',
        'y' => '1EF9',
    },
    '`' => { # grave
        'A' => '00C0',
        'a' => '00E0',
        'E' => '00C8',
        'e' => '00E8',
        'I' => '00CC',
        'i' => '00EC',
        'N' => '01F8',
        'n' => '01F9',
        'O' => '00D2',
        'o' => '00F2',
        'U' => '00D9',
        'u' => '00F9',
        'W' => '1E80',
        'w' => '1E81',
        'Y' => '1EF2',
        'y' => '1EF3',
    },
    '^' => { # circumflex
        'A' => '00C2',
        'a' => '00E2',
        'C' => '0108',
        'c' => '0109',
        'E' => '00CA',
        'e' => '00EA',
        'G' => '011C',
        'g' => '011D',
        'H' => '0124',
        'h' => '0125',
        'I' => '00CE',
        'i' => '00EE',
        'J' => '0134',
        'j' => '0135',
        'O' => '00D4',
        'o' => '00F4',
        'S' => '015C',
        's' => '015D',
        'U' => '00DB',
        'u' => '00FB',
        'W' => '0174',
        'w' => '0175',
        'Y' => '0176',
        'y' => '0177',
        'Z' => '1E90',
        'z' => '1E91',
    },
    'ringaccent' => { # ring
        'A' => '00C5',
        'a' => '00E5',
        'U' => '016E',
        'u' => '016F',
        'w' => '1E98',
        'y' => '1E99',
    },
    'v' => { # caron
        'A' => '01CD',
        'a' => '01CE',
        'C' => '010C',
        'c' => '010D',
        'D' => '010E',
        'd' => '010F',
        'E' => '011A',
        'e' => '011B',
        'G' => '01E6',
        'g' => '01E7',
        'H' => '021E', #K with moz-1.2
        'h' => '021F', #k with moz-1.2
        'I' => '01CF',
        'i' => '01D0',
        'K' => '01E8',
        'k' => '01E9',
        'L' => '013D', #L' with moz-1.2
        'l' => '013E', #l' with moz-1.2
        'N' => '0147',
        'n' => '0148',
        'O' => '01D1',
        'o' => '01D2',
        'R' => '0158',
        'r' => '0159',
        'S' => '0160',
        's' => '0161',
        'T' => '0164',
        't' => '0165',
        'U' => '01D3',
        'u' => '01D4',
        'Z' => '017D',
        'z' => '017E',
    },
    'H' => { # double acute
        'O' => '0150',
        'o' => '0151',
        'U' => '0170',
        'u' => '0171',
    },
    'ogonek' => {
        'A' => '0104',
        'a' => '0105',
        'E' => '0118',
        'e' => '0119',
        'I' => '012E',
        'i' => '012F',
        'U' => '0172',
        'u' => '0173',
        'O' => '01EA',
        'o' => '01EB',
    },
);

our %unicode_simple_character_map = (
            ' ' => '0020',
            '!' => '0021',
            '"' => '0022',
            '#' => '0023',
            '$' => '0024',
            '%' => '0025',
            '&' => '0026',
            "'" => '0027',
            '(' => '0028',
            ')' => '0029',
            '*' => '002A',
            '+' => '002B',
            ',' => '002C',
            '-' => '002D',
            '.' => '002E',
            '/' => '002F',
            ':' => '003A',
            ';' => '003B',
            '<' => '003C',
            '=' => '003D',
            '>' => '003E',
            '?' => '003F',
            '@' => '0040',
            '[' => '005B',
            '\\' => '005C',
            ']' => '005D',
            '^' => '005E',
            '_' => '005F',
            '`' => '0060',
            '{' => '007B',
            '|' => '007C',
            '}' => '007D',
            '~' => '007E',
);


# Also discussed on the texinfo list.
# taken from
#Latin extended additionnal
#http://www.alanwood.net/unicode/latin_extended_additional.html
#C1 Controls and Latin-1 Supplement
#http://www.alanwood.net/unicode/latin_1_supplement.html
#Latin Extended-A
#http://www.alanwood.net/unicode/latin_extended_a.html
#Latin Extended-B
#http://www.alanwood.net/unicode/latin_extended_b.html
#dotless i: 0131

#http://www.alanwood.net/unicode/arrows.html 21**
#http://www.alanwood.net/unicode/general_punctuation.html 20**
#http://www.alanwood.net/unicode/mathematical_operators.html 22**

our %unicode_map = (
               'bullet'            => '2022',
               'copyright'         => '00A9',
               'registeredsymbol'  => '00AE',
               'dots'              => '2026',
               'enddots'           => '',
               'equiv'             => '2261',
               'error'             => '',
               'expansion'         => '2192',
               'arrow'             => '2192',
               'minus'             => '2212', # in mathematical operators
#               'minus'             => '002D', # in latin1
               'point'             => '2605',
               'print'             => '22A3',
               'result'            => '21D2',
               'today'             => '',
               'aa'                => '00E5',
               'AA'                => '00C5',
               'ae'                => '00E6',
               'oe'                => '0153',
               'AE'                => '00C6',
               'OE'                => '0152',
               'o'                 => '00F8',
               'O'                 => '00D8',
               'ss'                => '00DF',
               'DH'                => '00D0',
               'dh'                => '00F0',
               'TH'                => '00DE',
               'th'                => '00FE',
               'l'                 => '0142',
               'L'                 => '0141',
               'exclamdown'        => '00A1',
               'questiondown'      => '00BF',
               'pounds'            => '00A3',
               'ordf'              => '00AA',
               'ordm'              => '00BA',
               'comma'             => '002C',
               'euro'              => '20AC',
               'geq'               => '2265',
               'leq'               => '2264',
               'tie'               => '',
#               'tie'               => '0020',
               'textdegree'        => '00B0',
               'quotedblleft'      => '201C',
               'quotedblright'     => '201D',
               'quoteleft'         => '2018',
               'quoteright'        => '2019',
               'quotedblbase'      => '201E',
               'quotesinglbase'    => '201A',
               'guillemetleft'     => '00AB',
               'guillemetright'    => '00BB',
               'guillemotleft'     => '00AB',
               'guillemotright'    => '00BB',
               'guilsinglleft'     => '2039',
               'guilsinglright'    => '203A',
             );

# set the %unicode_character_brace_no_arg_commands value to the character
# corresponding to the hex value in %unicode_map.
our %unicode_character_brace_no_arg_commands;
foreach my $command (keys(%unicode_map)) {
  if ($unicode_map{$command} ne '') {
    my $char_nr = hex($unicode_map{$command});
    if ($char_nr > 126 and $char_nr < 255) {
      # this is very strange, indeed.  The reason lies certainly in the 
      # magic backward compatibility support in perl for 8bit encodings.
      $unicode_character_brace_no_arg_commands{$command} = 
         Encode::decode("iso-8859-1", chr($char_nr));
    } else {
      $unicode_character_brace_no_arg_commands{$command} = chr($char_nr);
    }
  }
}

sub unicode_accent($$$)
{
  my $text = shift;
  my $command = shift;
  my $fallback_convert_accent = shift;

  my $accent = $command->{'cmdname'};

  # special handling of @dotless{i}.
  # \x{0131}\x{0308} for @dotless{i} @" doesn't lead to NFC 00ef.
  # so it is set to a real dotless i only if not in an accent command.
  if ($accent eq 'dotless') {
    if ($text eq 'i' and (!$command->{'parent'} 
                         or !$command->{'parent'}->{'parent'}
                         or !$command->{'parent'}->{'parent'}->{'cmdname'}
                         or !$unicode_accented_letters{$command->{'parent'}->{'parent'}->{'cmdname'}})) {
      return "\x{0131}";
    }
    #return "\x{}" if ($text eq 'j'); # dotless j not known i unicode !
    return $text;
  }

  return Unicode::Normalize::NFC($text . chr(hex($unicode_diacritics{$accent})))
    if (defined($unicode_diacritics{$accent}));
  return &$fallback_convert_accent($text, $command);
}

sub unicode_text($$)
{
  my $self = shift;
  my $command = shift;
  my $text = $command->{'text'};

  if (!$self->{'code'} and !$self->{'context'}->[-1] eq 'preformatted') {
    $text =~ s/---/\x{2014}/g;
    $text =~ s/--/\x{2013}/g;
    $text =~ s/``/\x{201C}/g;
    $text =~ s/''/\x{201D}/g;
  }
  return Unicode::Normalize::NFC($text);
}

1;
