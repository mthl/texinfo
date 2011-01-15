# Text.pm: output tree as simple text.
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

package Texinfo::Convert::Text;

use 5.00405;
use strict;

# accent commands list.
use Texinfo::Common;
use Texinfo::Convert::Unicode;
use Data::Dumper;

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration       use Texinfo::Convert::Text ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
  convert
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';

# this is in fact not needed for 'footnote', 'shortcaption', 'caption'
# since they have no brace_command_arg below.
my %ignored_brace_commands;
foreach my $ignored_brace_command ('xref','ref','pxref','inforef','anchor',
   'footnote', 'shortcaption', 'caption', 'hyphenation') {
  $ignored_brace_commands{$ignored_brace_command} = 1;
}

#my %code_style_commands;
#foreach my $command ('code', 'command', 'env', 'file', 'kbd', 'key', 'option',
#   'samp', 'indicateurl', 'verb') {
#  $code_style_commands{$command} = 1;
#}

my %ignored_block_commands;
foreach my $ignored_command ('titlepage', 'copying', 'documentdescription',
  'html', 'tex', 'xml', 'docbook', 'ignore', 'macro', 'rmacro') {
  $ignored_block_commands{$ignored_command} = 1;
}

our %text_brace_no_arg_commands = (
               'TeX'                => 'TeX',
               'LaTeX'              => 'LaTeX',
               'bullet'             => '*',
               'copyright'          => '(C)',
               'registeredsymbol'   => '(R)',
               'dots'         => '...',
               'enddots'      => '...',
               'equiv'        => '==',
# FIXME i18n
               'error'        => 'error-->',
               'expansion'    => '==>',
               'arrow'        => '->',
               'minus'        => '-',
               'point'        => '-!-',
               'print'        => '-|',
               'result'       => '=>',
               'today'        => '',
               'aa'           => 'aa',
               'AA'           => 'AA',
               'ae'           => 'ae',
               'oe'           => 'oe',
               'AE'           => 'AE',
               'OE'           => 'OE',
               'o'            => '/o',
               'O'            => '/O',
               'ss'           => 'ss',
               'l'            => '/l',
               'L'            => '/L',
               'DH'           => 'D',
               'dh'           => 'd',
               'TH'           => 'TH', # http://www.evertype.com/standards/wynnyogh/thorn.html

               'th'           => 'th',
               'exclamdown'   => '!',
               'questiondown' => '?',
               'pounds'       => '#',
               'ordf'         => 'a',
               'ordm'         => 'o',
               'comma'        => ',',
               'euro'         => 'Euro',
               'geq'          => '>=',
               'leq'          => '<=',
               'tie'          => ' ',
               'textdegree'      => 'o',
               'quotedblleft'    => '``',
               'quotedblright'   => "''",
               'quoteleft'       => '`',
               'quoteright'      => "'",
               'quotedblbase'    => ',,',
               'quotesinglbase'  => ',',
               'guillemetleft'   => '<<',
               'guillemetright'  => '>>',
               'guillemotleft'   => '<<',
               'guillemotright'  => '>>',
               'guilsinglleft'   => '<',
               'guilsinglright'  => '>',
               'click'           => '', # specially treated
);

my %sort_brace_no_arg_commands = (
  'copyright' => 'C',
  'registeredsymbol' => 'R',
  'today' => 't'
);

our %text_no_brace_commands = (
           '*', "\n",
           ' ', ' ',
           "\t", ' ',
           "\n", ' ',
           '-', '',  # hyphenation hint
           '|', '',  # used in formatting commands @evenfooting and friends
           '/', '',
           ':', '',
           '!', '!',
           '?', '?',
           '.', '.',
           '@', '@',
           '}', '}',
           '{', '{',
           '\\', '\\',  # should only appear in math
);

my %accent_commands = %Texinfo::Common::accent_commands;

my %unicode_to_eight_bit = (
   'iso8859_1' => {
      '00A0' => 'A0',
      '00A1' => 'A1',
      '00A2' => 'A2',
      '00A3' => 'A3',
      '00A4' => 'A4',
      '00A5' => 'A5',
      '00A6' => 'A6',
      '00A7' => 'A7',
      '00A8' => 'A8',
      '00A9' => 'A9',
      '00AA' => 'AA',
      '00AB' => 'AB',
      '00AC' => 'AC',
      '00AD' => 'AD',
      '00AE' => 'AE',
      '00AF' => 'AF',
      '00B0' => 'B0',
      '00B1' => 'B1',
      '00B2' => 'B2',
      '00B3' => 'B3',
      '00B4' => 'B4',
      '00B5' => 'B5',
      '00B6' => 'B6',
      '00B7' => 'B7',
      '00B8' => 'B8',
      '00B9' => 'B9',
      '00BA' => 'BA',
      '00BB' => 'BB',
      '00BC' => 'BC',
      '00BD' => 'BD',
      '00BE' => 'BE',
      '00BF' => 'BF',
      '00C0' => 'C0',
      '00C1' => 'C1',
      '00C2' => 'C2',
      '00C3' => 'C3',
      '00C4' => 'C4',
      '00C5' => 'C5',
      '00C6' => 'C6',
      '00C7' => 'C7',
      '00C7' => 'C7',
      '00C8' => 'C8',
      '00C9' => 'C9',
      '00CA' => 'CA',
      '00CB' => 'CB',
      '00CC' => 'CC',
      '00CD' => 'CD',
      '00CE' => 'CE',
      '00CF' => 'CF',
      '00D0' => 'D0',
      '00D1' => 'D1',
      '00D2' => 'D2',
      '00D3' => 'D3',
      '00D4' => 'D4',
      '00D5' => 'D5',
      '00D6' => 'D6',
      '00D7' => 'D7',
      '00D8' => 'D8',
      '00D9' => 'D9',
      '00DA' => 'DA',
      '00DB' => 'DB',
      '00DC' => 'DC',
      '00DD' => 'DD',
      '00DE' => 'DE',
      '00DF' => 'DF',
      '00E0' => 'E0',
      '00E1' => 'E1',
      '00E2' => 'E2',
      '00E3' => 'E3',
      '00E4' => 'E4',
      '00E5' => 'E5',
      '00E6' => 'E6',
      '00E7' => 'E7',
      '00E8' => 'E8',
      '00E9' => 'E9',
      '00EA' => 'EA',
      '00EB' => 'EB',
      '00EC' => 'EC',
      '00ED' => 'ED',
      '00EE' => 'EE',
      '00EF' => 'EF',
      '00F0' => 'F0',
      '00F1' => 'F1',
      '00F2' => 'F2',
      '00F3' => 'F3',
      '00F4' => 'F4',
      '00F5' => 'F5',
      '00F6' => 'F6',
      '00F7' => 'F7',
      '00F8' => 'F8',
      '00F9' => 'F9',
      '00FA' => 'FA',
      '00FB' => 'FB',
      '00FC' => 'FC',
      '00FD' => 'FD',
      '00FE' => 'FE',
      '00FF' => 'FF',
   },
   'iso8859_15' => {
      '00A0' => 'A0',
      '00A1' => 'A1',
      '00A2' => 'A2',
      '00A3' => 'A3',
      '20AC' => 'A4',
      '00A5' => 'A5',
      '0160' => 'A6',
      '00A7' => 'A7',
      '0161' => 'A8',
      '00A9' => 'A9',
      '00AA' => 'AA',
      '00AB' => 'AB',
      '00AC' => 'AC',
      '00AD' => 'AD',
      '00AE' => 'AE',
      '00AF' => 'AF',
      '00B0' => 'B0',
      '00B1' => 'B1',
      '00B2' => 'B2',
      '00B3' => 'B3',
      '017D' => 'B4',
      '00B5' => 'B5',
      '00B6' => 'B6',
      '00B7' => 'B7',
      '017E' => 'B8',
      '00B9' => 'B9',
      '00BA' => 'BA',
      '00BB' => 'BB',
      '0152' => 'BC',
      '0153' => 'BD',
      '0178' => 'BE',
      '00BF' => 'BF',
      '00C0' => 'C0',
      '00C1' => 'C1',
      '00C2' => 'C2',
      '00C3' => 'C3',
      '00C4' => 'C4',
      '00C5' => 'C5',
      '00C6' => 'C6',
      '00C7' => 'C7',
      '00C8' => 'C8',
      '00C9' => 'C9',
      '00CA' => 'CA',
      '00CB' => 'CB',
      '00CC' => 'CC',
      '00CD' => 'CD',
      '00CE' => 'CE',
      '00CF' => 'CF',
      '00D0' => 'D0',
      '00D1' => 'D1',
      '00D2' => 'D2',
      '00D3' => 'D3',
      '00D4' => 'D4',
      '00D5' => 'D5',
      '00D6' => 'D6',
      '00D7' => 'D7',
      '00D8' => 'D8',
      '00D9' => 'D9',
      '00DA' => 'DA',
      '00DB' => 'DB',
      '00DC' => 'DC',
      '00DD' => 'DD',
      '00DE' => 'DE',
      '00DF' => 'DF',
      '00E0' => 'E0',
      '00E1' => 'E1',
      '00E2' => 'E2',
      '00E3' => 'E3',
      '00E4' => 'E4',
      '00E5' => 'E5',
      '00E6' => 'E6',
      '00E7' => 'E7',
      '00E8' => 'E8',
      '00E9' => 'E9',
      '00EA' => 'EA',
      '00EB' => 'EB',
      '00EC' => 'EC',
      '00ED' => 'ED',
      '00EE' => 'EE',
      '00EF' => 'EF',
      '00F0' => 'F0',
      '00F1' => 'F1',
      '00F2' => 'F2',
      '00F3' => 'F3',
      '00F4' => 'F4',
      '00F5' => 'F5',
      '00F6' => 'F6',
      '00F7' => 'F7',
      '00F8' => 'F8',
      '00F9' => 'F9',
      '00FA' => 'FA',
      '00FB' => 'FB',
      '00FC' => 'FC',
      '00FD' => 'FD',
      '00FE' => 'FE',
      '00FF' => 'FF',
   },
   'iso8859_2' => {
      '00A0' => 'A0',
      '0104' => 'A1',
      '02D8' => 'A2',
      '0141' => 'A3',
      '00A4' => 'A4',
      '013D' => 'A5',
      '015A' => 'A6',
      '00A7' => 'A7',
      '00A8' => 'A8',
      '015E' => 'AA',
      '0164' => 'AB',
      '0179' => 'AC',
      '00AD' => 'AD',
      '017D' => 'AE',
      '017B' => 'AF',
      '00B0' => 'B0',
      '0105' => 'B1',
      '02DB' => 'B2',
      '0142' => 'B3',
      '00B4' => 'B4',
      '013E' => 'B5',
      '015B' => 'B6',
      '02C7' => 'B7',
      '00B8' => 'B8',
      '0161' => 'B9',
      '015F' => 'BA',
      '0165' => 'BB',
      '017A' => 'BC',
      '02DD' => 'BD',
      '017E' => 'BE',
      '017C' => 'BF',
      '0154' => 'C0',
      '00C1' => 'C1',
      '00C2' => 'C2',
      '0102' => 'C3',
      '00C4' => 'C4',
      '0139' => 'C5',
      '0106' => 'C6',
      '00C7' => 'C7',
      '010C' => 'C8',
      '00C9' => 'C9',
      '0118' => 'CA',
      '00CB' => 'CB',
      '011A' => 'CC',
      '00CD' => 'CD',
      '00CE' => 'CE',
      '010E' => 'CF',
      '0110' => 'D0',
      '0143' => 'D1',
      '0147' => 'D2',
      '00D3' => 'D3',
      '00D4' => 'D4',
      '0150' => 'D5',
      '00D6' => 'D6',
      '00D7' => 'D7',
      '0158' => 'D8',
      '016E' => 'D9',
      '00DA' => 'DA',
      '0170' => 'DB',
      '00DC' => 'DC',
      '00DD' => 'DD',
      '0162' => 'DE',
      '00DF' => 'DF',
      '0155' => 'E0',
      '00E1' => 'E1',
      '00E2' => 'E2',
      '0103' => 'E3',
      '00E4' => 'E4',
      '013A' => 'E5',
      '0107' => 'E6',
      '00E7' => 'E7',
      '010D' => 'E8',
      '00E9' => 'E9',
      '0119' => 'EA',
      '00EB' => 'EB',
      '011B' => 'EC',
      '00ED' => 'ED',
      '00EE' => 'EE',
      '010F' => 'EF',
      '0111' => 'F0',
      '0144' => 'F1',
      '0148' => 'F2',
      '00F3' => 'F3',
      '00F4' => 'F4',
      '0151' => 'F5',
      '00F6' => 'F6',
      '00F7' => 'F7',
      '0159' => 'F8',
      '016F' => 'F9',
      '00FA' => 'FA',
      '0171' => 'FB',
      '00FC' => 'FC',
      '00FD' => 'FD',
      '0163' => 'FE',
      '02D9' => 'FF',
   },
   'koi8' => {
      '0415' => 'A3',
      '0454' => 'A4',
      '0456' => 'A6',
      '0457' => 'A7',
      '04D7' => 'B3',
      '0404' => 'B4',
      '0406' => 'B6',
      '0407' => 'B7',
      '042E' => 'C0',
      '0430' => 'C1',
      '0431' => 'C2',
      '0446' => 'C3',
      '0434' => 'C4',
      '0435' => 'C5',
      '0444' => 'C6',
      '0433' => 'C7',
      '0445' => 'C8',
      '0438' => 'C9',
      '0439' => 'CA',
      '043A' => 'CB',
      '043B' => 'CC',
      '043C' => 'CD',
      '043D' => 'CE',
      '043E' => 'CF',
      '043F' => 'D0',
      '044F' => 'D1',
      '0440' => 'D2',
      '0441' => 'D3',
      '0442' => 'D4',
      '0443' => 'D5',
      '0436' => 'D6',
      '0432' => 'D7',
      '044C' => 'D8',
      '044B' => 'D9',
      '0437' => 'DA',
      '0448' => 'DB',
      '044D' => 'DC',
      '0449' => 'DD',
      '0447' => 'DE',
      '044A' => 'DF',
      '042D' => 'E0',
      '0410' => 'E1',
      '0411' => 'E2',
      '0426' => 'E3',
      '0414' => 'E4',
      '0415' => 'E5',
      '0424' => 'E6',
      '0413' => 'E7',
      '0425' => 'E8',
      '0418' => 'E9',
      '0419' => 'EA',
      '041A' => 'EB',
      '041B' => 'EC',
      '041C' => 'ED',
      '041D' => 'EE',
      '041E' => 'EF',
      '041F' => 'F0',
      '042F' => 'F1',
      '0420' => 'F2',
      '0421' => 'F3',
      '0422' => 'F4',
      '0423' => 'F5',
      '0416' => 'F6',
      '0412' => 'F7',
      '042C' => 'F8',
      '042B' => 'F9',
      '0417' => 'FA',
      '0428' => 'FB',
      '042D' => 'FC',
      '0429' => 'FD',
      '0427' => 'FE',
      '042A' => 'FF',
   },
);

our %formatting_misc_commands;
foreach my $command ('sp', 'center', 'exdent', 
                     'item', 'itemx', 'tab', 'headitem',
    'node',
    'top',
    'chapter',
    'unnumbered',
    'chapheading',
    'appendix',
    'section',
    'unnumberedsec',
    'heading',
    'appendixsec',
    'subsection',
    'unnumberedsubsec',
    'subheading',
    'appendixsubsec',
    'subsubsection',
    'unnumberedsubsubsec',
    'subsubheading',
    'appendixsubsubsec',
    'part',
    'appendixsection',
    'majorheading',
    'chapheading',
    'centerchap') {
  $formatting_misc_commands{$command} = 1;
}
 
my %ignored_types;
foreach my $type ('empty_line_after_command', 'preamble',
            'empty_spaces_after_command', 'spaces_at_end',
            'empty_spaces_before_argument', 'empty_spaces_before_paragraph') {
  $ignored_types{$type} = 1;
}

# find the innermost accent and the correspponding text
sub _find_innermost_accent($)
{
  my $current = shift;
  my @accent_commands = ();
  my $text = '';
  my $done = 0;
  my $debug = 0;
 ACCENT:
  while (1) {
    if (!$current->{'args'} or !$current->{'cmdname'} 
        or !$accent_commands{$current->{'cmdname'}}) {
      print STDERR "BUG: Not an accent command in accent\n";
      print STDERR Texinfo::Convert::Texinfo::convert($current)."\n";
      print STDERR Data::Dumper->Dump([$current]);
      last;
    }
    push @accent_commands, $current->{'cmdname'};
    my $arg = $current->{'args'}->[0];
    # a construct like @'e without content
    if (defined($arg->{'text'})) {
      return ($arg->{'text'}, $current, \@accent_commands);
    }
    if (!$arg->{'contents'}) {
      print STDERR "BUG: No content in accent command\n";
      print STDERR Data::Dumper->Dump([$current]);
      print STDERR Texinfo::Convert::Texinfo::convert($current)."\n";
      last;
    }
    # inside the braces of an accent
    foreach my $content (@{$arg->{'contents'}}) {
      if (!($content->{'extra'} and $content->{'extra'}->{'invalid_nesting'})
         and !($content->{'cmdname'} and ($content->{'cmdname'} eq 'c'
                                  or $content->{'cmdname'} eq 'comment'))) {
        if (defined($content->{'text'})) {
          $text .= $content->{'text'};
          print STDERR "TEXT: $text\n" if ($debug);
        } elsif ($content->{'cmdname'} and 
               defined($text_no_brace_commands{$content->{'cmdname'}})) {
          $text .= $text_no_brace_commands{$content->{'cmdname'}};
          print STDERR "NO BRACE COMMAND: $text\n" if ($debug);
        } elsif ($content->{'cmdname'} and $text_brace_no_arg_commands{$content->{'cmdname'}}) {
          $text .= $text_brace_no_arg_commands{$content->{'cmdname'}};
          print STDERR "BRACE NO ARG COMMAND: $text\n" if ($debug);
        } else {
          $current = $content;
          next ACCENT;
        }
      }
    }
    last;
  }
  return ($text, $current, \@accent_commands);
}

# return the 8 bit, if it exists, and the unicode codepoint
sub _eight_bit_and_unicode_point($$)
{
  my $char = shift;
  my $encoding_map_name = shift;
  my ($eight_bit, $codepoint);
  if (ord($char) <= 128) { 
    # 7bit ascii characters, the same in every 8bit encodings
    $eight_bit = uc(sprintf("%02x",ord($char)));
    $codepoint = uc(sprintf("%04x",ord($char)));
  } elsif (ord($char) <= hex(0xFFFF)) {
    $codepoint = uc(sprintf("%04x",ord($char)));
    if (exists($unicode_to_eight_bit{$encoding_map_name}->{$codepoint})) {
     $eight_bit 
         = $unicode_to_eight_bit{$encoding_map_name}->{$codepoint};
    }
  }
  return ($eight_bit, $codepoint);
}

sub eight_bit_accents($$$)
{
  my $current = shift;
  my $encoding = shift;
  my $convert_accent = shift;

  my $debug;
  #$debug = 1;

  my ($text, $innermost_accent, $stack) = _find_innermost_accent($current);

  print STDERR "INNERMOST: $innermost_accent->{'cmdname'}($text)\n"
    if ($debug);

  # accents are formatted and the intermediate results are kept, such
  # that we can return the maximum of multiaccented letters that can be
  # rendered with a given eight bit formatting.
  my $accent = $innermost_accent;
  my $current_result = $text;
  my @results_stack;

  while (1) {
    $current_result 
      = Texinfo::Convert::Unicode::unicode_accent($current_result, $accent,
                                                    $convert_accent);
    push @results_stack, [$current_result, $accent];
    last if ($accent eq $current);
    $accent = $accent->{'parent'}->{'parent'};
  }

  if ($debug) {
    print STDERR "stack: ".join('|',@$stack)."\nPARTIAL_RESULATS_STACK:\n";
    foreach my $partial_result (@results_stack) {
      print STDERR "   -> ".Encode::encode('utf8', $partial_result->[0])
                            ."|$partial_result->[1]->{'cmdname'}\n";
    }
  }

  my $encoding_map_name 
       = $Texinfo::Common::eight_bit_encoding_aliases{$encoding};
  # At this point we have the utf8 encoded results for the accent
  # commands stack, with all the intermediate results.
  # For each one we'll check if it is possible to encode it in the 
  # current eight bit output encoding table
  my ($eight_bit, $dummy) 
     = _eight_bit_and_unicode_point($text, $encoding_map_name);
  my $eight_bit_command_index = -1;
  foreach my $partial_result (@results_stack) {
    my $char = $partial_result->[0];

    my ($new_eight_bit, $new_codepoint) = _eight_bit_and_unicode_point($char,
                                                           $encoding_map_name);
    if ($debug) {
      my $eight_bit_txt = 'undef';
      $eight_bit_txt = $eight_bit if (defined($eight_bit));
      print STDERR "" . Encode::encode('utf8', $char) . " ($partial_result->[1]->{'cmdname'}), new_codepoint: $new_codepoint 8bit: $new_eight_bit old:$eight_bit_txt\n";
    }

    # no corresponding eight bit character found for a composed character
    last if (!$new_eight_bit);

    # in that case, the new eight bit character is the same than the one 
    # found with one less character (and it isn't a @dotless{i}). It may
    # hapen in 2 case, both meaning that there is no corresponding 8bit char:
    #
    # -> there are 2 characters in accent. This could happen, for example
    #    if an accent that cannot be rendered is found and it leads to 
    #    appending or prepending a character. For example this happens for
    #    @={@,{@~{n}}}, where @,{@~{n}} is expanded to a 2 character:
    #    n with a tilde, followed by a , 
    #    In that case, the additional utf8 diacritic is appended, which 
    #    means that it is composed with the , and leaves n with a tilde 
    #    untouched. 
    # -> the diacritic is appended but the normal form doesn't lead
    #    to a composed character, such that the first character
    #    of the string is unchanged. This, for example, happens for 
    #    @ubaraccent{a} since there is no composed accent with a and an 
    #    underbar.
    last if (($new_eight_bit eq $eight_bit)
       and !($partial_result->[1]->{'cmdname'} eq 'dotless' and $char eq 'i'));
    $eight_bit = $new_eight_bit;
    $eight_bit_command_index++;
  }
  # handle the remaining accents, that have not been converted to 8bit
  # compatible unicode
  my $result = $text;
  $result = $results_stack[$eight_bit_command_index]->[0] 
    if ($eight_bit_command_index > -1);
  for (my $remaining_accents = $eight_bit_command_index+1; 
          $remaining_accents <= $#results_stack; $remaining_accents++) {
    $result = &$convert_accent($result, $results_stack[$remaining_accents]->[1]);
    print STDERR "REMAINING($remaining_accents) "
       .Encode::encode('utf8', $result)."\n" if ($debug);
  }

  # An important remark is that the final conversion to 8bit is left to
  # perl.
  return $result;
}

sub ascii_accent($$)
{
  my $text = shift;
  my $command = shift;
  my $accent = $command->{'cmdname'};
  return $text if ($accent eq 'dotless');
  return $text . "''" if ($accent eq 'H');
  return $text . '.' if ($accent eq 'dotaccent');
  return $text . '*' if ($accent eq 'ringaccent');
  return $text . '[' if ($accent eq 'tieaccent');
  return $text . '(' if ($accent eq 'u');
  return $text . '_' if ($accent eq 'ubaraccent');
  return '.' . $text  if ($accent eq 'udotaccent');
  return $text . '<' if ($accent eq 'v');
  return $text . ';' if ($accent eq 'ogonek');
  return $text . $accent;
}

# format a stack of accents as ascii
sub ascii_accents ($)
{
  my $current = shift;
  my ($result, $innermost_accent, $stack) = _find_innermost_accent($current);

  foreach my $accent_command (reverse(@$stack)) {
    $result = ascii_accent ($result, {'cmdname' => $accent_command});
  }
  return $result;
}

# format a stack of accents as unicode
sub unicode_accents ($$)
{
  my $current = shift;
  my $format_accents = shift;
  my ($result, $innermost_accent, $stack) = _find_innermost_accent($current);

  foreach my $accent_command (reverse(@$stack)) {
    $result = Texinfo::Convert::Unicode::unicode_accent($result, 
       {'cmdname' => $accent_command}, \&ascii_accent);
  }
  return $result;
}

sub text_accents($$)
{
  my $accent = shift;
  my $encoding = shift;
  
  return '' if (!$accent->{'args'});
  if ($encoding and $encoding eq 'utf-8') {
    return unicode_accents($accent, \&ascii_accent);
  } elsif ($encoding 
           and $Texinfo::Common::eight_bit_encoding_aliases{$encoding}) {
    return eight_bit_accents($accent, $encoding, \&ascii_accent);
  } else {
    return ascii_accents($accent);
  }
}

sub brace_no_arg_command($;$$)
{
  my $root = shift;
  my $encoding = shift;
  my $sort_string = shift;

  my $command = $root->{'cmdname'};
  $command = $root->{'extra'}->{'clickstyle'}
     if ($root->{'extra'}
      and defined($root->{'extra'}->{'clickstyle'})
      and defined($text_brace_no_arg_commands{$root->{'extra'}->{'clickstyle'}}));
  if ($encoding 
    and (($encoding eq 'utf-8' 
       and $Texinfo::Convert::Unicode::unicode_character_brace_no_arg_commands{$command})
        or ($Texinfo::Common::eight_bit_encoding_aliases{$encoding}
        and $unicode_to_eight_bit{$Texinfo::Common::eight_bit_encoding_aliases{$encoding}}->{$Texinfo::Convert::Unicode::unicode_map{$command}}))) {
    return $Texinfo::Convert::Unicode::unicode_character_brace_no_arg_commands{$command};
  } elsif ($sort_string and $sort_brace_no_arg_commands{$command}) {
    return $sort_brace_no_arg_commands{$command};
  } else {
    return $text_brace_no_arg_commands{$command};
  }
}

# decompose a decimal number on a given base. The algorithm looks like
# the division with growing powers (division suivant les puissances
# croissantes) ?
sub _decompose_integer($$)
{
  my $number = shift;
  my $base = shift;
  my @result = ();

  return (0) if ($number == 0);
  my $power = 1;
  my $remaining = $number;

  while ($remaining) {
    my $factor = $remaining % ($base ** $power);
    $remaining -= $factor;
    push (@result, $factor / ($base ** ($power - 1)));
    $power++;
  }
  return @result;
}

# the enumerate item number or letter.
sub enumerate_item_representation($$)
{
  my $specification = shift;
  my $number = shift;

  if ($specification =~ /^[0-9]$/) {
    return $specification + $number;
  }

  my $result = '';
  my $base_letter = ord('a');
  $base_letter = ord('A') if (ucfirst($specification) eq $specification);
  my @letter_ords = _decompose_integer(ord($specification) - $base_letter + $number, 26);
  foreach my $ord (@letter_ords) {
    # FIXME we go directly to 'ba' after 'z', and not 'aa'
    #because 'ba' is 1,0 and 'aa' is 0,0.
    $result = chr($base_letter + $ord) . $result;
  }
  return $result;
}

my %underline_symbol = (
  0 => '*',
  1 => '*',
  2 => '=',
  3 => '-',
  4 => '.'
);

sub numbered_heading($$$)
{
  my $current = shift;
  my $text = shift;
  my $numbered = shift;

  $text = $current->{'number'}.' '.$text if (defined($current->{'number'}) 
                                         and ($numbered or !defined($numbered)));
  if ($current->{'cmdname'} eq 'appendix' and $current->{'level'} == 1) {
    # FIXME i18n
    $text = 'Appendix '.$text;
  }
  chomp ($text);
  return $text;
}

sub heading($$$)
{
  my $current = shift;
  my $text = shift;
  my $numbered = shift;

  $text = numbered_heading($current, $text, $numbered);
  return '' if ($text !~ /\S/);
  my $result = $text ."\n";
  $result .=($underline_symbol{$current->{'level'}} 
     x Texinfo::Convert::Unicode::string_width($text))."\n";
  return $result;
}

sub _normalise_space($)
{
  return undef unless (defined ($_[0]));
  my $text = shift;
  $text =~ s/\s+/ /go;
  $text =~ s/ $//;
  $text =~ s/^ //;
  return $text;
}

sub convert($;$);

sub convert($;$)
{
  my $root = shift;
  my $options = shift;

  if (0) {
    print STDERR "root\n";
    print STDERR "  Command: $root->{'cmdname'}\n" if ($root->{'cmdname'});
    print STDERR "  Type: $root->{'type'}\n" if ($root->{'type'});
    print STDERR "  Text: $root->{'text'}\n" if (defined($root->{'text'}));
    #print STDERR "  Special def_command: $root->{'extra'}->{'def_command'}\n"
    #  if (defined($root->{'extra'}) and $root->{'extra'}->{'def_command'});
  }

  return '' if (!($root->{'type'} and $root->{'type'} eq 'def_line')
     and (($root->{'type'} and $ignored_types{$root->{'type'}})
          or ($root->{'cmdname'} 
             and ($ignored_brace_commands{$root->{'cmdname'}} 
                 or $ignored_block_commands{$root->{'cmdname'}}
             # here ignore most of the misc commands
                 or ($root->{'args'} and $root->{'args'}->[0] 
                     and $root->{'args'}->[0]->{'type'} 
                     and ($root->{'args'}->[0]->{'type'} eq 'misc_line_arg'
                         or $root->{'args'}->[0]->{'type'} eq 'misc_arg') 
                     and !$formatting_misc_commands{$root->{'cmdname'}})))));
  my $result = '';
  if (defined($root->{'text'})) {
    $result = $root->{'text'};
  }
  if ($root->{'cmdname'}) {
    my $command = $root->{'cmdname'};
    if (defined($text_no_brace_commands{$root->{'cmdname'}})) {
      return $text_no_brace_commands{$root->{'cmdname'}};
    } elsif (defined($text_brace_no_arg_commands{$root->{'cmdname'}})) {
      return brace_no_arg_command($root, $options->{'enabled_encoding'}, 
                                  $options->{'sort_string'});
    # commands with braces
    } elsif ($accent_commands{$root->{'cmdname'}}) {
      return text_accents ($root, $options->{'enabled_encoding'});
    } elsif ($root->{'cmdname'} eq 'image') {
      return convert($root->{'args'}->[0], $options);
    } elsif ($root->{'cmdname'} eq 'email') {
      my $mail = _normalise_space(convert($root->{'args'}->[0], $options));
      my $text;
      $text = _normalise_space(convert($root->{'args'}->[1], $options)) 
         if (defined($root->{'args'}->[1]));
      return $text if (defined($text) and ($text ne ''));
      return $mail;
    } elsif ($root->{'args'} and $root->{'args'}->[0] 
           and (($root->{'args'}->[0]->{'type'}
                and $root->{'args'}->[0]->{'type'} eq 'brace_command_arg')
                or $root->{'cmdname'} eq 'math')) {
      return convert($root->{'args'}->[0], $options);
    # block commands
    } elsif (($root->{'cmdname'} eq 'quotation'
          or $root->{'cmdname'} eq 'smallquotation')) {
      if ($root->{'args'}) {
        $result = convert($root->{'args'}->[0], $options) ."\n";
      }
    } elsif ($formatting_misc_commands{$root->{'cmdname'}} and $root->{'args'}) {
      if ($root->{'cmdname'} eq 'sp') {
        if ($root->{'extra'} and $root->{'extra'}->{'misc_args'}
            and $root->{'extra'}->{'misc_args'}->[0]) {
          # this useless copy avoids perl changing the type to integer!
          my $sp_nr = $root->{'extra'}->{'misc_args'}->[0];
          $result = "\n" x $sp_nr;
        }
      } elsif ($root->{'cmdname'} ne 'node') {
        $result = convert($root->{'args'}->[0], $options);
        if ($Texinfo::Common::sectioning_commands{$root->{'cmdname'}}) {
          $result = heading ($root, $result, $options->{'NUMBER_SECTIONS'});
        } else {
        # we always want an end of line even if is was eaten by a 
          chomp ($result);
          $result .= "\n";
        }
      }
    } elsif ($root->{'cmdname'} eq 'item' 
            and $root->{'parent'}->{'cmdname'} 
            and $root->{'parent'}->{'cmdname'} eq 'enumerate') {
      $result .= enumerate_item_representation(
         $root->{'parent'}->{'extra'}->{'enumerate_specification'},
         $root->{'extra'}->{'item_number'}) . '. ';
    }
  }
  if ($root->{'type'} and $root->{'type'} eq 'def_line') {
    #print STDERR "$root->{'extra'}->{'def_command'}\n";
    $result = convert($root->{'args'}->[0], $options) if ($root->{'args'});
  } elsif ($root->{'type'} and $root->{'type'} eq 'menu_entry') {
    foreach my $arg (@{$root->{'args'}}) {
      $result .= convert($arg, $options);
    }
  }
  if ($root->{'contents'}) {
    foreach my $content (@{$root->{'contents'}}) {
      $result .= convert($content, $options);
    }
  }
  $result = '{'.$result.'}' 
     if ($root->{'type'} and $root->{'type'} eq 'bracketed'
         and (!$root->{'parent'}->{'type'} or
              ($root->{'parent'}->{'type'} ne 'block_line_arg'
               and $root->{'parent'}->{'type'} ne 'misc_line_arg')));
  return $result;
}

1;
