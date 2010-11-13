# Plaintext.pm: output tree as text.
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

package Texinfo::Convert::Plaintext;

use 5.00405;
use strict;

use Texinfo::Common;
use Texinfo::Convert::Texinfo;
use Texinfo::Convert::Text;
use Texinfo::Convert::Paragraph;
use Texinfo::Convert::Line;

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
  convert
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';

my %kept_misc_commands = %Texinfo::Convert::Text::kept_misc_commands;
# 'sp', 'center', 'exdent',
#                     'item', 'itemx', 'tab', 'headitem',
#    'node',

foreach my $kept_command('verbatiminclude', 'insertcopying', 'printindex',
  'listoffloats', 'dircategory', 'paragraphindent', 'firstparagraphindent',
  'frenchspacing', 'documentencoding', 'footnotestyle', 'documentlanguage',
  'setshortcontentsaftertitlepage', 'setcontentsaftertitlepage',
  'contents', 'shortcontents', 'summarycontents', 
  'author', 'shorttitle', 'shorttitlepage', 'settitle', 'subtitle',
  'title') {
  $kept_misc_commands{$kept_command} = 1;
}
my %text_no_brace_commands = %Texinfo::Convert::Text::text_no_brace_commands;
my %text_brace_no_arg_commands = %Texinfo::Convert::Text::text_brace_no_arg_commands;
my %accent_commands = %Texinfo::Common::accent_commands;
my %misc_commands = %Texinfo::Common::misc_commands;
my %sectioning_commands = %Texinfo::Common::sectioning_commands;

my %ignored_misc_commands;
foreach my $misc_command (keys(%misc_commands)) {
  $ignored_misc_commands{$misc_command} = 1 
    unless ($kept_misc_commands{$misc_command});
}

my %ignored_commands = %ignored_misc_commands;
foreach my $ignored_brace_commands ('caption', 'shortcation', 
  'hyphenation') {
  $ignored_commands{$ignored_brace_commands} = 1;
}

# FIXME pass raw formats handled (or not handled)
foreach my $ignored_block_commands ('ignore', 'macro', 'rmacro') {
  $ignored_commands{$ignored_block_commands} = 1;
}

my %code_style_commands;
foreach my $command ('code', 'command', 'env', 'file', 'kbd', 'key', 'option',
   'samp', 'indicateurl', 'verb') {
  $code_style_commands{$command} = 1;
}

my %ignored_types;
foreach my $type ('empty_line_after_command', 
            'empty_spaces_after_command', 'spaces_at_end',
            'empty_spaces_before_argument', 'empty_spaces_before_paragraph') {
  $ignored_types{$type} = 1;
}

# All those commands run with the text.
# FIXME w may be diferent here.
my %style_map = (
  'strong' => '*',
  'dfn'    => '"',
  'emph'   => '_',
);

foreach my $command (keys(%style_map)) {
  $style_map{$command} = [$style_map{$command}, $style_map{$command}];
}

my @asis_commands = ('asis', 'w', 'b', 'ctrl', 'i', 'math', 'sc', 't', 'r',
  'slanted', 'sansserif', 'var', 'titlefont', 'verb', 'clickstyle',
  'headitemfont');

foreach my $asis_command (@asis_commands) {
  $style_map{$asis_command} = ['', ''];
}

my @quoted_commands = ('cite', 'code', 'command', 'env', 'file', 'kbd',
  'option', 'samp');

foreach my $quoted_command (@quoted_commands) {
  $style_map{$quoted_command} = ['`', "'"];
}

$style_map{'key'} = ['<', '>'];
$style_map{'indicateurl'} = ['<', '>'];

# in those commands, there is no addition of double space after a dot.
my %no_punctation_munging_commands;
foreach my $command ('var', 'cite', 'math', keys(%code_style_commands)) {
  $no_punctation_munging_commands{$command} = 1;
}

my %defaults = (
  'frenchspacing'        => 0,
  'paragraphindent'      => 3,
  'firstparagraphindent' => 'none',
  'enable_encoding'      => 1,
  'footnotestyle'        => 'end',
  'fillcolumn'           => 72,
  'documentencoding'     => 'us-ascii',
  'number_footnotes'     => 1,

  'debug'                => 0
);

sub converter(;$)
{
  my $class = shift;
  my $converter = { 'set' => {} };

  my $conf;
  my $name = 'converter';

  if (ref($class) eq 'HASH') {
    $conf = $class;
    bless $converter;
  } elsif (defined($class)) {
    bless $converter, $class;
    $name = ref($class);
    $conf = shift;
  } else {
    bless $converter;
    $conf = shift;
    $name = ref($converter);
  }
  if (defined($conf)) {
    foreach my $key (keys(%$conf)) {
      if (!exists($defaults{$key})) {
        warn "$key not a possible configuration in $name\n";
      } else {
        $converter->{$key} = $conf->{$key};
        $converter->{'set'}->{$key} = 1;
      }
    }
  }
  foreach my $key (keys(%defaults)) {
    $converter->{$key} = $defaults{$key} if (!$converter->{'set'}->{$key});
  }
  $converter->{'paragraph_conf'} = { 
      'frenchspacing' => $converter->{'frenchspacing'},
      'max' => $converter->{'fillcolumn'},
  #    'indent' => $converter->{'paragraphindent'},
  #    'indent_length_next' => 0
   };
  $converter->{'context'} = ['_Root_context'];
  $converter->{'containers'} = [];
  return $converter;
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

sub process_text($$)
{
  my $self = shift;
  my $command = shift;
  my $text = $command->{'text'};

  $text = uc($text) if ($self->{'upper_case'});
  if ($self->{'enable_encoding'} and $self->{'document_encoding'} eq 'utf-8') {
    return Texinfo::Convert::Unicode($self, $command);
  } elsif (!$self->{'code'} and !$self->{'context'}->[-1] eq 'preformatted') {
    $text =~ s/---/\x{1F}/g;
    $text =~ s/--/-/g;
    $text =~ s/\x{1F}/--/g;
    $text =~ s/``/"/g;
    $text =~ s/\'\'/"/g;
  }
}

sub convert_line($$)
{
  my $self = shift;
  my $converted = shift;
  my $line = Texinfo::Convert::Line->new($self->{'paragraph_conf'});
  push @{$self->{'containers'}}, $line;
  my $result = $self->convert($converted);
  $result .= $line->end();
  pop @{$self->{'containers'}};
  return $result;
}

# code
# sp
# var, sc -> 'upper_case'
# preformatted
sub convert($$);

sub convert($$)
{
  my $self = shift;
  my $root = shift;

  if ($self->{'debug'}) {
    print STDERR "root (@{$self->{'context'}})\n";
    print STDERR "  Command: $root->{'cmdname'}\n" if ($root->{'cmdname'});
    print STDERR "  Type: $root->{'type'}\n" if ($root->{'type'});
    print STDERR "  Text: $root->{'text'}\n" if (defined($root->{'text'}));
    #print STDERR "  Special def_command: $root->{'extra'}->{'def_command'}\n"
    #  if (defined($root->{'extra'}) and $root->{'extra'}->{'def_command'});
    if (@{$self->{'containers'}}) {
      print STDERR "  Container:";
      $self->{'containers'}->[-1]->dump();
    }
  }

  # if it is a paragraph, process the text and commands.
  # if it is a simple_text_command 'indicateurl',
  #                    'email', 'uref', 'url',
  #                    'dmn', 'ctrl'
  #   accent_commands it is returned with the inside expanded
  # and further processed as text, with invalid_nesting commands ignored.
  # another @command is incorporated
  # 
  # other commands processed:
  # verbatiminclude
  # sp
  # insertcopying
  # printindex
  # listoffloats
  # dircategory
  # paragraphindent firstparagraphindent frenchspacing documentencoding
  #        footnotestyle
  # documentlanguage?
  # center
  # author (in quotation?)
  # shorttitle/shorttitlepage/settitle/subtitle/title
  # exdent
# not info but plaintext
# setshortcontentsaftertitlepage setcontentsaftertitlepage
# @contents or @shortcontents

  # paragraph left right center line

  # NUMBER_FOOTNOTES SPLIT_SIZE IN_ENCODING FILLCOLUMN ENABLE_ENCODING
  # OUT_ENCODING ENCODING_NAME

  return '' if (($root->{'type'} and $ignored_types{$root->{'type'}})
                or ($root->{'cmdname'} and $ignored_commands{$root->{'cmdname'}}));
  my $result = '';
  my $paragraph;
  my $line;
  if (defined($root->{'text'})) {
    # ignore text outside of any format. 
    if (ref($self->{'containers'}->[-1])) {
      $result .= $self->{'containers'}->[-1]->add_text($root->{'text'});
    # Warn if ignored text not empty
    } elsif ($root->{'text'} =~ /\S/) {
      warn "BUG: ignored text not empty `$root->{'text'}'\n";
    }
  }
  if ($root->{'cmdname'}) {
    my $command = $root->{'cmdname'};
    if (defined($text_no_brace_commands{$root->{'cmdname'}})) {
      if ($command eq ':') {
        $self->{'containers'}->[-1]->inhibit_end_sentence();
      } elsif ($command eq '*') {
        $result .= $self->{'containers'}->[-1]->add_pending_word();
        $result .= $self->{'containers'}->[-1]->end_line();
      } elsif ($command eq '.' or $command eq '?' or $command eq '!') {
        $result .= $self->{'containers'}->[-1]->add_next($command, undef, 1),
      } elsif ($command eq ' ' or $command eq "\n" or $command eq "\t") {
        $result .= $self->{'containers'}->[-1]->add_next($text_no_brace_commands{$root->{'cmdname'}});
      } else {
        $result .= $self->{'containers'}->[-1]->add_text($text_no_brace_commands{$root->{'cmdname'}});
      }
    } elsif (defined($text_brace_no_arg_commands{$root->{'cmdname'}})) {
      $command = $root->{'extra'}->{'clickstyle'}
         if ($root->{'extra'}
          and defined($root->{'extra'}->{'clickstyle'})
          and defined($text_brace_no_arg_commands{$root->{'extra'}->{'clickstyle'}}));
      $result .= $self->{'containers'}->[-1]->add_text($text_brace_no_arg_commands{$command});
    # commands with braces
    } elsif ($accent_commands{$root->{'cmdname'}}) {
      $result .= $self->{'containers'}->[-1]->add_text(
          Texinfo::Convert::Text::text_accents($root, $self->{'encoding'}));
      return $result;
    } elsif ($root->{'cmdname'} eq 'image') {
      return $self->convert($root->{'args'}->[0]);
    } elsif ($root->{'cmdname'} eq 'email') {

      my @email_contents;
      if ($root->{'extra'} and $root->{'extra'}->{'brace_command_contents'}) {
        if (scalar (@{$root->{'extra'}->{'brace_command_contents'}}) == 2
            and defined($root->{'extra'}->{'brace_command_contents'}->[-1])) {
          @email_contents = (@{$root->{'extra'}->{'brace_command_contents'}->[1]}, 
                             {'text' => ' '});
        }
        if (defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
          push @email_contents, {'cmdname' => 'indicateurl',
            'args' => [ { 'type' => 'brace_command_arg',
                          'contents' => $root->{'extra'}->{'brace_command_contents'}->[0],
                        } ],
            'extra' => {'brace_command_contents' => [$root->{'extra'}->{'brace_command_contents'}->[0]] } };
        }
        unshift @{$self->{'current_contents'}->[-1]}, @email_contents;
      }
      return;
    } elsif ($style_map{$command}) {
      $result .= $self->{'containers'}->[-1]->add_text($style_map{$command}->[0]);
      $result .= $self->convert($root->{'args'}->[0]);
      $result .= $self->{'containers'}->[-1]->add_text($style_map{$command}->[1]);
    } elsif ($command eq 'footnote') {
    } elsif ($command eq 'anchor') {
    } elsif ($root->{'args'} and $root->{'args'}->[0] 
             and (($root->{'args'}->[0]->{'type'}
                and $root->{'args'}->[0]->{'type'} eq 'brace_command_arg')
                or $root->{'cmdname'} eq 'math')) {
      return $self->convert($root->{'args'}->[0]);
    # block commands
    } elsif (($root->{'cmdname'} eq 'quotation'
          or $root->{'cmdname'} eq 'smallquotation')) {
      if ($root->{'extra'} and $root->{'extra'}->{'block_command_line_contents'}) {
        my $quotation_arg = Texinfo::Convert::Texinfo::convert(
          {'contents' => $root->{'extra'}->{'block_command_line_contents'}->[0]});
        my $prepended = Texinfo::Parser::parse_texi_line (undef, '@b{'.${quotation_arg}.':} ');
        $result = $self->convert_line($prepended);
        #return gdt('@b{{quotation_arg}:} ', {'quotation_arg' => $text}, {'keep_texi' => 1});
        #$result = convert($root->{'args'}->[0]) ."\n";
      }
    } elsif ($root->{'cmdname'} eq 'node') {
        # FIXME handle node
    } elsif ($root->{'extra'} and ($root->{'extra'}->{'misc_content'}
                                  or $root->{'extra'}->{'misc_args'})) {
      if ($sectioning_commands{$root->{'cmdname'}}
               or $root->{'cmdname'} eq 'item' or $root->{'cmdname'} eq 'itemx') {
        # FIXME handle sectioning commands with their underline
        # and item with their prepending
        $result = $self->convert_line($root->{'args'}->[0]);
        chomp ($result);
        $result .= "\n";
      } elsif ($root->{'cmdname'} eq 'sp') {
        if ($root->{'extra'}->{'misc_args'}->[0]) {
          # this useless copy avoids perl changing the type to integer!
          my $sp_nr = $root->{'extra'}->{'misc_args'}->[0];
          $result .= "\n" x $sp_nr;
        }
      } else {
        my $index_entry;
        $index_entry = 1 
          if ($root->{'extra'} and $root->{'extra'}->{'index_entry'});
        if ($root->{'cmdname'} eq 'item' or $root->{'cmdname'} eq 'itemx') {
          $index_entry = 0;
        }
        if ($root->{'extra'} and $root->{'extra'}->{'index_entry'}) {
          # FIXME do something for index entry?
        }
      }
    }
  } elsif ($root->{'type'} and $root->{'type'} eq 'paragraph') {
    $self->{'empty_lines_count'} = 0;
    $paragraph = Texinfo::Convert::Paragraph->new($self->{'paragraph_conf'});
    push @{$self->{'containers'}}, $paragraph;
  } 
  if ($root->{'type'} and $root->{'type'} eq 'def_line') {
    #print STDERR "$root->{'extra'}->{'def_command'}\n";
    foreach my $parsed_arg (@{$root->{'extra'}->{'def_args'}}) {
      
    }
    $result = $self->convert($root->{'args'}->[0]) if ($root->{'args'});
  } elsif ($root->{'type'} and $root->{'type'} eq 'menu_entry') {
    foreach my $arg (@{$root->{'args'}}) {
      $result .= $self->convert($arg);
    }
  }
  if ($root->{'contents'}) {
    my @contents = @{$root->{'contents'}};
    push @{$self->{'current_contents'}}, \@contents;
    while (@contents) {
      my $content = shift @contents;
      if (!$paragraph and $content->{'type'} 
          and $content->{'type'} eq 'empty_line') {
        $result .= "\n" if (!$self->{'empty_lines_count'});
        $self->{'empty_lines_count'}++;
      } else {
        $result .= $self->convert($content);
      }
    }
    pop @{$self->{'current_contents'}};
  }
  $result = '{'.$result.'}'
     if ($root->{'type'} and $root->{'type'} eq 'bracketed'
          and $self->{'context'}->[-1] eq 'math');
  if ($paragraph) {
    $result .= $paragraph->end();
    pop @{$self->{'containers'}};
  }
  return $result;
}

1;
