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

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration       use Texinfo::Parser ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
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

my %brace_no_arg_commands = (
               'TeX'          => 'TeX',
               'LaTeX'          => 'LaTeX',
               'bullet'       => '*',
               'copyright' => '(C)',
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
               'textdegree'          => 'o',
               'quotedblleft'          => '``',
               'quotedblright'          => "''",
               'quoteleft'          => '`',
               'quoteright'          => "'",
               'quotedblbase'          => ',,',
               'quotesinglbase'          => ',',
               'guillemetleft'          => '<<',
               'guillemetright'          => '>>',
               'guillemotleft'          => '<<',
               'guillemotright'          => '>>',
               'guilsinglleft'          => '<',
               'guilsinglright'          => '>',
);

my %no_brace_commands = (
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
);

my %accent_commands;
foreach my $accent_command ('"','~','^','`',"'",',','=',
                           'ringaccent','H','dotaccent','u','ubaraccent',
                           'udotaccent','v','ogonek','tieaccent') {
  $accent_commands{$accent_command} = 1;
}

# node?
my %kept_misc_commands;
foreach my $command ('sp', 'center', 'item', 'itemx', 'tab', 'headitem',
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
  $kept_misc_commands{$command} = 1;
}
 
my %ignored_types;
foreach my $type ('empty_line_after_command', 'empty_spaces_after_command') {
  $ignored_types{$type} = 1;
}

sub ascii_accents($$)
{
  my $text = shift;
  my $accent = shift;
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
  my $state = shift;
  
  $state = {} if (!defined($state));

  if (0) {
    print STDERR "root\n";
    print STDERR "  Command: $root->{'cmdname'}\n" if ($root->{'cmdname'});
    print STDERR "  Type: $root->{'type'}\n" if ($root->{'type'});
    print STDERR "  Text: $root->{'text'}\n" if (defined($root->{'text'}));
  }

  return '' if (($root->{'type'} and $ignored_types{$root->{'type'}})
     or ($root->{'cmdname'} 
        and ($ignored_brace_commands{$root->{'cmdname'}} 
           or $ignored_block_commands{$root->{'cmdname'}}
             # here ignore most of the misc commands
           or ($root->{'args'} and $root->{'args'}->[0] 
               and $root->{'args'}->[0]->{'type'} 
               and ($root->{'args'}->[0]->{'type'} eq 'misc_line_arg'
                    or $root->{'args'}->[0]->{'type'} eq 'misc_arg') 
               and !$kept_misc_commands{$root->{'cmdname'}}))));
  my $result = '';
  if (defined($root->{'text'})) {
    $result = $root->{'text'};
    $result =~ s/\s*$// if ($state->{'trim_end_space'});
    $result =~ s/^\s*// if ($state->{'trim_begin_space'});
  }
  if ($root->{'cmdname'}) {
    if ($no_brace_commands{$root->{'cmdname'}}) {
      return $no_brace_commands{$root->{'cmdname'}};
    } elsif ($brace_no_arg_commands{$root->{'cmdname'}}) {
      return $brace_no_arg_commands{$root->{'cmdname'}};
    # commands with braces
    } elsif ($accent_commands{$root->{'cmdname'}}) {
      return '' if (!$root->{'args'});
      return ascii_accents(convert($root->{'args'}->[0]), $root->{'cmdname'});
    } elsif ($root->{'cmdname'} eq 'image') {
      return convert($root->{'args'}->[0], {'trim_around_spaces' => 1});
    } elsif ($root->{'cmdname'} eq 'email') {
      my $mail = _normalise_space(convert($root->{'args'}->[0]));
      my $text;
      $text = _normalise_space(convert($root->{'args'}->[1])) 
         if (defined($root->{'args'}->[1]));
      return $text if (defined($text) and ($text ne ''));
      return $mail;
    } elsif ($root->{'args'} and $root->{'args'}->[0] 
           and (($root->{'args'}->[0]->{'type'}
                and $root->{'args'}->[0]->{'type'} eq 'brace_command_arg')
                or $root->{'cmdname'} eq 'math')) {
      return convert($root->{'args'}->[0]);
    # block commands
    } elsif (($root->{'cmdname'} eq 'quotation'
          or $root->{'cmdname'} eq 'smallquotation')) {
      if ($root->{'args'}) {
        $result = convert($root->{'args'}->[0]) ."\n";
      }
    } elsif ($kept_misc_commands{$root->{'cmdname'}} and $root->{'args'}) {
      if ($root->{'cmdname'} eq 'sp') {
        if ($root->{'special'} and $root->{'special'}->{'misc_args'}
            and $root->{'special'}->{'misc_args'}->[0]) {
          # this useless copy avoids perl changing the type to integer!
          my $sp_nr = $root->{'special'}->{'misc_args'}->[0];
          $result = "\n" x $sp_nr;
        }
      } else {
        $result = convert($root->{'args'}->[0]);
        # we always want an end of line even if is was eaten by a 
        chomp ($result);
        $result .= "\n";
      }
    }
  }
  if ($root->{'type'} and $root->{'type'} eq 'menu_entry') {
    foreach my $arg (@{$root->{'args'}}) {
      $result .= convert($arg);
    }
  }
  if ($root->{'contents'}) {
    my $content_nr = 0;
    foreach my $content (@{$root->{'contents'}}) {
      $content_nr++;
      my $convert_state = {};
      if ($state->{'trim_around_spaces'}) {
        if ($content_nr == 1) {
          $convert_state = {'trim_begin_space' => 1};
        } elsif ($content_nr == scalar(@{$root->{'contents'}})) {
          $convert_state = {'trim_end_space' => 1};
        }
      }
      $result .= convert($content, $convert_state);
    }
  }
  $result = '{'.$result.'}' 
     if ($root->{'type'} and $root->{'type'} eq 'bracketed');
  return $result;
}

1;
