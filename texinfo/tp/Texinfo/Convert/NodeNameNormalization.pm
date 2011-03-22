# NodeNameNormalization.pm: output tree as normalized node name.
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

# the rules for conversion are decribed in the Texinfo manual, for
# HTML crossrefs.

package Texinfo::Convert::NodeNameNormalization;

use 5.00405;
use strict;

use Unicode::Normalize;
use Text::Unidecode;
# for the accents definition
use Texinfo::Common;
# reuse some conversion hashes
use Texinfo::Convert::Text;
# use the hashes and functions
use Texinfo::Convert::Unicode;

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration   use Texinfo::Convert::NodeNameNormalization ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
  convert
  normalize_node
  transliterate_texinfo
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';

my %normalize_node_brace_no_arg_commands 
  = %Texinfo::Convert::Text::text_brace_no_arg_commands;
foreach my $command (keys(%Texinfo::Convert::Unicode::unicode_character_brace_no_arg_commands)) {
  $normalize_node_brace_no_arg_commands{$command} =
     $Texinfo::Convert::Unicode::unicode_character_brace_no_arg_commands{$command};
}

my %normalize_node_no_brace_commands 
  = %Texinfo::Convert::Text::text_no_brace_commands;
$normalize_node_no_brace_commands{'*'} = ' ';

my %accent_commands = %Texinfo::Common::accent_commands;

my %ignored_brace_commands;
foreach my $ignored_brace_command ('xref','ref','pxref','inforef','anchor',
   'footnote', 'shortcaption', 'caption', 'hyphenation') {
  $ignored_brace_commands{$ignored_brace_command} = 1;
}

my %ignored_types;
foreach my $type ('empty_line_after_command', 
            'empty_spaces_after_command', 'spaces_at_end',
            'empty_spaces_before_argument', 'space_at_end_menu_node',
            'space_at_end_block_command') {
  $ignored_types{$type} = 1;
}


sub normalize_node ($)
{
  my $root = shift;
  my $result = convert($root);
  $result = Unicode::Normalize::NFC($result);
  $result = _unicode_to_protected($result);
  $result = 'Top' if ($result =~ /^Top$/i);
  return $result;
}

sub transliterate_texinfo ($;$)
{
  my $root = shift;
  my $no_unidecode = shift;
  my $result = convert($root);
  $result = Unicode::Normalize::NFC($result);
  $result = _unicode_to_protected(
                _unicode_to_transliterate($result, $no_unidecode));
  return $result;
}

sub convert($)
{
  my $root = shift;
  my $result = _convert($root);
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

sub _unicode_to_protected($)
{
  my $text = shift;
  my $result = '';
  while ($text ne '') {
    if ($text =~ s/^([A-Za-z0-9]+)//o) {
      $result .= $1;
    } elsif ($text =~ s/^ //o) {
      $result .= '-';
    } elsif ($text =~ s/^(.)//o) {
      my $char = $1;
      if (exists($Texinfo::Convert::Unicode::unicode_simple_character_map{$char})) {
        $result .= '_' . lc($Texinfo::Convert::Unicode::unicode_simple_character_map{$char});
      } else {
        if (ord($char) <= hex(0xFFFF)) {
          $result .= '_' . lc(sprintf("%04x",ord($char)));
        } else {
          $result .= '__' . lc(sprintf("%06x",ord($char)));
        }
      }
    } else {
      print STDERR "Bug: unknown character in a cross ref (likely in infinite loop)\n";
      print STDERR "Text: !!$text!!\n";
      sleep 1;
    }
  }
  return $result;
}

sub _unicode_to_transliterate($;$)
{
  my $text = shift;
  my $no_unidecode = shift;
  if (chomp($text)) {
     print STDERR "Strange: end of line to transliterate: $text\n";
  }
  my $result = '';
  while ($text ne '') {
    if ($text =~ s/^([A-Za-z0-9 ]+)//o) {
      $result .= $1;
    } elsif ($text =~ s/^(.)//o) {
      my $char = $1;
      if (exists($Texinfo::Convert::Unicode::unicode_simple_character_map{$char})) {
        $result .= $char;
      } elsif (ord($char) <= hex(0xFFFF)
               and exists($Texinfo::Convert::Unicode::transliterate_map{uc(sprintf("%04x",ord($char)))})) {
        $result .= $Texinfo::Convert::Unicode::transliterate_map{uc(sprintf("%04x",ord($char)))};
      } elsif (ord($char) <= hex(0xFFFF) 
               and exists($Texinfo::Convert::Unicode::unicode_diacritics{uc(sprintf("%04x",ord($char)))})) {
        $result .= '';
      # in this case, we want to avoid calling unidecode, as we are sure
      # that there is no useful transliteration of the unicode character
      # instead we want to keep it as is.
      # This is the case, for example, for @exclamdown, is corresponds
      # with x00a1, but unidecode transliterates it to a !, we want
      # to avoid that and keep x00a1.
      } elsif (ord($char) <= hex(0xFFFF) 
               and exists($Texinfo::Convert::Unicode::no_transliterate_map{uc(sprintf("%04x",ord($char)))})) {
        $result .= $char;
      } else {
        if ($no_unidecode) {
          $result .= $char;
        } else {
          $result .= unidecode($char);
        }
      }
    } else {
      print STDERR "Bug: unknown character in cross ref transliteration (likely in infinite loop)\n";
      print STDERR "Text: !!$text!!\n";
      sleep 1;
    }
  }
  return $result;
}



sub _convert($;$);

sub _convert($;$)
{
  my $root = shift;
  my $in_sc = shift;

  if (0) {
    print STDERR "root\n";
    print STDERR "  Command: $root->{'cmdname'}\n" if ($root->{'cmdname'});
    print STDERR "  Type: $root->{'type'}\n" if ($root->{'type'});
    print STDERR "  Text: $root->{'text'}\n" if (defined($root->{'text'}));
    #print STDERR "  Special def_command: $root->{'extra'}->{'def_command'}\n"
    #  if (defined($root->{'extra'}) and $root->{'extra'}->{'def_command'});
  }

  return '' if (($root->{'type'} and $ignored_types{$root->{'type'}})
          or ($root->{'cmdname'} 
             and ($ignored_brace_commands{$root->{'cmdname'}} 
             # here ignore the misc commands
                 or ($root->{'args'} and $root->{'args'}->[0] 
                     and $root->{'args'}->[0]->{'type'} 
                     and ($root->{'args'}->[0]->{'type'} eq 'misc_line_arg'
                         or $root->{'args'}->[0]->{'type'} eq 'misc_arg')))));
  my $result = '';
  if (defined($root->{'text'})) {
    $result = $root->{'text'};
    $result =~ s/\s+/ /go;
    $result = uc($result) if ($in_sc);
  }
  if ($root->{'cmdname'}) {
    my $command = $root->{'cmdname'};
    if (defined($normalize_node_no_brace_commands{$root->{'cmdname'}})) {
      return $normalize_node_no_brace_commands{$root->{'cmdname'}};
    } elsif (defined($normalize_node_brace_no_arg_commands{$root->{'cmdname'}})) {
      $command = $root->{'extra'}->{'clickstyle'}
         if ($root->{'extra'}
          and defined($root->{'extra'}->{'clickstyle'})
          and defined($normalize_node_brace_no_arg_commands{$root->{'extra'}->{'clickstyle'}}));
      return $normalize_node_brace_no_arg_commands{$command};
    # commands with braces
    } elsif ($accent_commands{$root->{'cmdname'}}) {
      return '' if (!$root->{'args'});
      return Texinfo::Convert::Unicode::unicode_accent(_convert($root->{'args'}->[0]), 
                         $root, \&Texinfo::Convert::Text::ascii_accent);
    } elsif ($root->{'cmdname'} eq 'image') {
      return _convert($root->{'args'}->[0]);
    } elsif ($root->{'cmdname'} eq 'email') {
      my $mail = _normalise_space(_convert($root->{'args'}->[0]));
      my $text;
      $text = _normalise_space(_convert($root->{'args'}->[1])) 
         if (defined($root->{'args'}->[1]));
      return $text if (defined($text) and ($text ne ''));
      return $mail;
    } elsif ($root->{'args'} and $root->{'args'}->[0] 
           and (($root->{'args'}->[0]->{'type'}
                and $root->{'args'}->[0]->{'type'} eq 'brace_command_arg')
                or $root->{'cmdname'} eq 'math')) {
      my $sc = 1 if ($root->{'cmdname'} eq 'sc' or $in_sc);
      return _convert($root->{'args'}->[0], $sc);
    }
  }
  if ($root->{'contents'}) {
    foreach my $content (@{$root->{'contents'}}) {
      $result .= _convert($content, $in_sc);
    }
  }
  $result = '{'.$result.'}' 
     if ($root->{'type'} and $root->{'type'} eq 'bracketed');
  return $result;
}

1;
