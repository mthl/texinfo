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
use Texinfo::Convert::UnFilled;

use Carp qw(cluck);

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

my %informative_commands;
foreach my $informative_command ('paragraphindent', 'firstparagraphindent',
  'frenchspacing', 'documentencoding', 'footnotestyle', 'documentlanguage',
  'setshortcontentsaftertitlepage', 'setcontentsaftertitlepage') {
  $informative_commands{$informative_command} = 1;
}

foreach my $kept_command(keys (%informative_commands),
  'verbatiminclude', 'insertcopying', 'printindex',
  'listoffloats', 'dircategory', 
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
my %def_commands = %Texinfo::Common::def_commands;
my %ref_commands = %Texinfo::Common::ref_commands;
my %block_commands = %Texinfo::Common::block_commands;
my %menu_commands = %Texinfo::Common::menu_commands;
my %root_commands = %Texinfo::Common::root_commands;
my %preformatted_commands = %Texinfo::Common::preformatted_commands;
my %explained_commands = %Texinfo::Common::explained_commands;
my %item_container_commands = %Texinfo::Common::item_container_commands;

foreach my $def_command (keys(%def_commands)) {
  $kept_misc_commands{$def_command} = 1 if ($misc_commands{$def_command});
}

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

my %item_indent_format_length = ('enumerate' => 2,
    'itemize' => 3,
    'table' => 0,
    'vtable' => 0,
    'ftable' => 0,
 );

my $indent_length = 5;

my %indented_commands;
foreach my $indented_command (keys (%item_indent_format_length), 
           keys (%preformatted_commands), 'quotation', 'smallquotation', 
           keys(%def_commands)) {
  $indented_commands{$indented_command} = 1 
    if exists($block_commands{$indented_command});
}

foreach my $non_indented('format', 'smallformat') {
  delete $indented_commands{$non_indented};
}

# commands that leads to advancing the paragraph number.  This is mostly
#used to determine the first line, in fact.
my %advance_paragraph_count_commands;
foreach my $command (keys(%block_commands)) {
  next if ($menu_commands{$command} 
            or $block_commands{$command} eq 'raw');
  $advance_paragraph_count_commands{$command} = 1;
}

# group and raggedright do more than not advancing para, they should also
# be transparent with respect to paragraph number counting.
foreach my $not_advancing_para ('group', 'raggedright',
  'titlepage', 'copying', 'documentdescription') {
  delete $advance_paragraph_count_commands{$not_advancing_para};
}

foreach my $advancing_para('center', 'verbatim', 'listoffloats') {
  $advance_paragraph_count_commands{$advancing_para} = 1;
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

my %upper_case_commands = (
 'sc' => 1,
 'var' => 1
);

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

# math  is special
my @asis_commands = ('asis', 'w', 'b', 'ctrl', 'i', 'sc', 't', 'r',
  'slanted', 'sansserif', 'var', 'titlefont', 'verb', 'clicksequence',
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
  $converter->{'context'} = ['_Root_context'];
  $converter->{'formatters'} = [];
  $converter->{'format_context'} = [{
                                     'cmdname' => '_top_format',
                                     'paragraph_count' => 0, 
                                     'indent_level' => 0,
                                     'max' => $converter->{'fillcolumn'}
                                   }];
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

sub process_text($$$)
{
  my $self = shift;
  my $command = shift;
  my $context = shift;
  my $text = $command->{'text'};

  $text = uc($text) if ($self->{'upper_case'});
  if ($self->{'enable_encoding'} and $self->{'documentencoding'} eq 'utf-8') {
    return Texinfo::Convert::Unicode($self, $command);
  } elsif (!$context->{'code'} and !$context->{'preformatted'}) {
    $text =~ s/---/\x{1F}/g;
    $text =~ s/--/-/g;
    $text =~ s/\x{1F}/--/g;
    $text =~ s/``/"/g;
    $text =~ s/\'\'/"/g;
  }
  return $text;
}

sub new_formatter($$;$)
{
  my $self = shift;
  my $type = shift;
  my $conf = shift;
  
  my $container;
  my $container_conf = { 
         'max'                 => $self->{'format_context'}->[-1]->{'max'},
         'frenchspacing'       => $self->{'frenchspacing'},
         'indent_level'        => $self->{'format_context'}->[-1]->{'indent_level'}, 
  };
  $container_conf->{'counter'} = $self->{'format_context'}->[-1]->{'counter'}
    if (defined($self->{'format_context'}->[-1]->{'counter'}));
  if ($conf) {
    foreach my $key (keys(%$conf)) {
      $container_conf->{$key} = $conf->{$key};
    }
  }
  $container_conf->{'indent_length'} = $indent_length*$container_conf->{'indent_level'}
    if (!defined($container_conf->{'indent_length'}));
  if ($type eq 'line') {
    $container = Texinfo::Convert::Line->new($container_conf);
  } elsif ($type eq 'paragraph') {
    $container = Texinfo::Convert::Paragraph->new($container_conf);
  } elsif ($type eq 'unfilled') {
    $container = Texinfo::Convert::UnFilled->new($container_conf);
  } else {
    die "Unknown container type $type\n";
  }
  my $formatter = {'container' => $container, 'upper_case' => 0,
                   'code' => 0, 'w' => 0, 
                   'frenchspacing_stack' => [$self->{'frenchspacing'}]};
  if (defined($self->{'preformatted'})) {
    $formatter->{'preformatted'} = $self->{'preformatted'};
  }
  return $formatter;
}

sub convert_line($$;$)
{
  my $self = shift;
  my $converted = shift;
  my $conf = shift;
  my $container = $self->new_formatter('line', $conf);
  push @{$self->{'formatters'}}, $container;
  my $result = $self->convert($converted);
  $result .= $container->{'container'}->end();
  pop @{$self->{'formatters'}};
  return $result;
}

sub convert_unfilled($$;$)
{
  my $self = shift;
  my $converted = shift;
  my $conf = shift;
  my $container = $self->new_formatter('unfilled', $conf);
  $container->{'code'} = 1;
  push @{$self->{'formatters'}}, $container;
  my $result = $self->convert($converted);
  $result .= $container->{'container'}->end();
  pop @{$self->{'formatters'}};
  return $result;
}

sub _def_argument_content($$)
{
  my $self = shift;
  my $converted = shift;
  if ($converted->{'type'} and $converted->{'type'} eq 'bracketed') {
    $converted = { 'contents' => $converted->{'contents'},
                   'type' => 'bracketed_def_content' };
  }
  return $converted;
}

sub _definition_category($$$)
{
  my $current = shift;
  my $arg_category = shift;
  my $arg_class = shift;
  return $arg_category->[0]
    if (!defined($arg_class->[1]) or $arg_class->[1] !~ /\S/);
  
  my $style = 
    $Texinfo::Common::command_index_prefix{$current->{'extra'}->{'def_command'}};
  my $category = Texinfo::Convert::Texinfo::convert($arg_category->[0]);
  my $class = Texinfo::Convert::Texinfo::convert($arg_class->[0]);
  print STDERR "DEFINITION CATEGORY($style): $category $class\n";
  if ($style eq 'f') {
    return Texinfo::Parser::parse_texi_line (undef, "$category on $class");
    #gdt('{category} on {class}', { 'category' => $category, 'class' => $class });
  } elsif ($style eq 'v') {
    return Texinfo::Parser::parse_texi_line (undef, "$category of $class");
  }
  return $arg_category->[0];
}

# on top, the converter object which holds some gloal information
# 
# context (for footntes, multitable cells):
# 'preformatted'
# 'max'
#
# format_context
# indentation + count for prepending text
# also paragraph count and maybe empty line count
#
# containers on their own stack
# in container
# 'upper_case'
# 'code'
# and (from the main context) preformatted
# 
# paragraph number: incremented with block commands except html and such
# and group and raggedright and menu*
# and also center and listoffloats
# and with paragraphs. 

# preformatted

sub convert($$);

sub convert($$)
{
  my $self = shift;
  my $root = shift;

  my $container_context;
  if (@{$self->{'formatters'}}) {
    $container_context = $self->{'formatters'}->[-1];
  }
  if ($self->{'debug'}) {
    print STDERR "ROOT (@{$self->{'context'}}|@{$self->{'format_context'}})";
    print STDERR " format_context: $self->{'format_context'}->[-1]->{'cmdname'}, $self->{'format_context'}->[-1]->{'paragraph_count'}, $self->{'format_context'}->[-1]->{'indent_level'}, $self->{'format_context'}->[-1]->{'max'}\n";
    print STDERR " cmd: $root->{'cmdname'}," if ($root->{'cmdname'});
    print STDERR " type: $root->{'type'}" if ($root->{'type'});
    print STDERR "\n";
    print STDERR "  Text: $root->{'text'}\n" if (defined($root->{'text'}));
    #print STDERR "  Special def_command: $root->{'extra'}->{'def_command'}\n"
    #  if (defined($root->{'extra'}) and $root->{'extra'}->{'def_command'});
    if ($container_context) {
      print STDERR "  Container:($container_context->{'code'},$container_context->{'upper_case'},$container_context->{'preformatted'},$container_context->{'frenchspacing_stack'}->[-1]) ";
      $container_context->{'container'}->dump();
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
  # center
  # author (in quotation?)
  # shorttitle/shorttitlepage/settitle/subtitle/title
  # exdent
# not info but plaintext
# setshortcontentsaftertitlepage setcontentsaftertitlepage
# @contents or @shortcontents

  # NUMBER_FOOTNOTES SPLIT_SIZE IN_ENCODING FILLCOLUMN ENABLE_ENCODING
  # OUT_ENCODING ENCODING_NAME

  if (($root->{'type'} and $ignored_types{$root->{'type'}})
       or ($root->{'cmdname'} and $ignored_commands{$root->{'cmdname'}})) {
    print STDERR "IGNORED\n" if ($self->{'debug'});
    return '';
  }
  my $result = '';

  if ($root->{'type'} and $root->{'type'} eq 'bracketed'
      and $self->{'context'}->[-1] eq 'math') {
    $result .= $container_context->{'container'}->add_text('{');
  }

  if (defined($root->{'text'})) {
    if ($container_context) {
      $result .= $container_context->{'container'}->add_text(
                      $self->process_text($root, $container_context));
    # ignore text outside of any format, but warn if ignored text not empty
    } elsif ($root->{'text'} =~ /\S/) {
      warn "BUG: ignored text not empty `$root->{'text'}'\n";
    }
  }
  my $preformatted;
  if ($root->{'cmdname'}) {
    my $unknown_command;
    my $command = $root->{'cmdname'};
    if (defined($text_no_brace_commands{$root->{'cmdname'}})) {
      if ($command eq ':') {
        $container_context->{'container'}->inhibit_end_sentence();
      } elsif ($command eq '*') {
        $result .= $container_context->{'container'}->add_pending_word();
        $result .= $container_context->{'container'}->end_line();
      } elsif ($command eq '.' or $command eq '?' or $command eq '!') {
        $result .= $container_context->{'container'}->add_next($command, undef, 1),
      } elsif ($command eq ' ' or $command eq "\n" or $command eq "\t") {
        $result .= $container_context->{'container'}->add_next($text_no_brace_commands{$root->{'cmdname'}});
      } else {
        $result .= $container_context->{'container'}->add_text($text_no_brace_commands{$root->{'cmdname'}});
      }
      return $result;
    } elsif (defined($text_brace_no_arg_commands{$root->{'cmdname'}})) {
      $command = $root->{'extra'}->{'clickstyle'}
         if ($root->{'extra'}
          and defined($root->{'extra'}->{'clickstyle'})
          and defined($text_brace_no_arg_commands{$root->{'extra'}->{'clickstyle'}}));
      if ($command eq 'enddots') {
        $result .= $container_context->{'container'}->add_next($text_brace_no_arg_commands{$command}, undef, 1),
      } else {
        $result .= $container_context->{'container'}->add_text($text_brace_no_arg_commands{$command});
        if ($command eq 'dots') {
          $container_context->{'container'}->inhibit_end_sentence();
        }
      }
      return $result;
    # commands with braces
    } elsif ($accent_commands{$root->{'cmdname'}}) {
      $result .= $container_context->{'container'}->add_text(
          Texinfo::Convert::Text::text_accents($root, $self->{'encoding'}));
      return $result;
    } elsif ($style_map{$command}) {
      if ($code_style_commands{$command}) {
        $container_context->{'code'}++;
        push @{$container_context->{'frenchspacing_stack'}}, 1;
        $container_context->{'container'}->set_space_protection(undef,
          undef,undef,1);
      }
      $container_context->{'upper_case'}++ if ($upper_case_commands{$command});
      if ($command eq 'w') {
        $container_context->{'w'}++;
        $container_context->{'container'}->set_space_protection(1,1)
          if ($container_context->{'w'} == 1);
      }
      $result .= $container_context->{'container'}->add_text($style_map{$command}->[0]);
      $result .= $self->convert($root->{'args'}->[0]) if ($root->{'args'});
      $result .= $container_context->{'container'}->add_text($style_map{$command}->[1]);
      if ($command eq 'w') {
        $container_context->{'w'}--;
        $container_context->{'container'}->set_space_protection(0,0)
          if ($container_context->{'w'} == 0);
      }
      if ($code_style_commands{$command}) {
        $container_context->{'code'}--;
        pop @{$container_context->{'frenchspacing_stack'}};
        $container_context->{'container'}->set_space_protection(undef,
          undef, undef, $container_context->{'frenchspacing_stack'}->[-1]);
      }
      $container_context->{'upper_case'}-- if ($upper_case_commands{$command});
    } elsif ($root->{'cmdname'} eq 'image') {
      # FIXME
      #return $self->convert($root->{'args'}->[0]);
    } elsif ($root->{'cmdname'} eq 'email') {
      # nothing is output for email, instead the command is substituted.

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
      return '';
    } elsif ($command eq 'uref' or $command eq 'url') {
      if ($root->{'extra'} and $root->{'extra'}->{'brace_command_contents'}) {
        my @contents;
        if (scalar(@{$root->{'extra'}->{'brace_command_contents'}}) == 3
             and defined($root->{'extra'}->{'brace_command_contents'}->[2])) {
          @contents = @{$root->{'extra'}->{'brace_command_contents'}->[2]};
        } elsif (defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
          if (scalar(@{$root->{'extra'}->{'brace_command_contents'}}) == 2
             and defined($root->{'extra'}->{'brace_command_contents'}->[1])) {
            @contents = (@{$root->{'extra'}->{'brace_command_contents'}->[1]},
                            {'text' => ' ('},
                            {'type' => 'code',
                             'contents' => [@{$root->{'extra'}->{'brace_command_contents'}->[0]}]
                            },
                            {'text' => ')'});
          } else {
            @contents = ({'cmdname' => 'code',
              'args' => [ { 'type' => 'brace_command_arg',
                          'contents' => $root->{'extra'}->{'brace_command_contents'}->[0],
                        } ],});
          }
        }
        unshift @{$self->{'current_contents'}->[-1]}, @contents;
      }
    } elsif ($command eq 'footnote') {
      # TODO
    } elsif ($command eq 'anchor') {
      # TODO
    } elsif ($ref_commands{$command}) {
      if ($root->{'extra'} and $root->{'extra'}->{'brace_command_contents'}
          and scalar(@{$root->{'extra'}->{'brace_command_contents'}})) {
        my @args = @{$root->{'extra'}->{'brace_command_contents'}};
        $args[0] = [{'text' => ''}] if (!defined($args[0]));
        if ($command eq 'inforef' and scalar(@args) == 3) {
          $args[3] = $args[2];
          $args[2] = undef;
        }
        my @contents;
        if ($command eq 'xref') {
          $contents[0] = {'text' => '*Note '};
          # FIXME error message about no punctuation character following xref.
        } else {
          $contents[0] = {'text' => '*note '};
        }
        my $name;
        if (defined($args[1])) {
          $name = $args[1];
        } elsif (defined($args[2])) {
          $name = $args[2];
        }
        my $file;
        if (defined($args[3])) {
          $file = [{'text' => '('},
                   {'type' => 'code',
                    'contents' => [@{$args[3]}]},
                   {'text' => ')'},];
        } elsif (defined($args[4])) {
          $file = [{'text' => '()'}];
        }
        if ($name) {
          push @contents, (@$name, {'text' => ': '});
          if ($file) {
            push @contents, @$file;
          }
          push @contents, ({'type' => 'code',
                            'contents' => [@{$args[0]}]});
          push @contents, {'text' => '.'} if ($command eq 'pxref');
        } else {
          push @contents, (@{$args[0]}, {'text' => '::'});
        }
        unshift @{$self->{'current_contents'}->[-1]}, @contents;
      }
    } elsif ($explained_commands{$command}) {
      my @contents;
      if ($root->{'extra'} and $root->{'extra'}->{'brace_command_contents'}
          and defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
        # in abbr spaces never end a sentence.
        if ($command eq 'abbr') {
          @contents = ({'type' => 'frenchspacing',
                     'contents' => [@{$root->{'extra'}->{'brace_command_contents'}->[0]}]});
        } else {
          @contents = @{$root->{'extra'}->{'brace_command_contents'}->[0]};
        }
        if (scalar (@{$root->{'extra'}->{'brace_command_contents'}}) == 2
          and defined($root->{'extra'}->{'brace_command_contents'}->[-1])) {
          push @contents, {'text' => ' ('},
                          @{$root->{'extra'}->{'brace_command_contents'}->[-1]},
                          {'text' => ')'};
        }
        unshift @{$self->{'current_contents'}->[-1]}, @contents;
      }
    } elsif ($command eq 'math') {
      push @{$self->{'context'}}, 'math';
      $result .= $self->convert($root->{'args'}->[0]) if ($root->{'args'});
      pop @{$self->{'context'}};
      return $result;
     # could this be used otherwise?
    } elsif ($root->{'args'} and $root->{'args'}->[0] 
             and $root->{'args'}->[0]->{'type'}
             and $root->{'args'}->[0]->{'type'} eq 'brace_command_arg') {
      die "Unhandled command with braces $root->{'cmdname'}\n";
      #return $self->convert($root->{'args'}->[0]);
    # block commands
    } elsif (exists($block_commands{$root->{'cmdname'}})) {
      # TODO
      # raw
      # verbatim
      # preformatted
      # quotation and smallquotation
      # multitable
      # *table
      # itemize
      # enumerate
      # menu
      # def
      # group and raggedright -> nothing on format stack
      # cartouche
      # flushleft and flushright -> keep track of result and add space
      #    at the end. do something specific here or at the end?
      #    punctuation munging is done, but end of lines are kept.

      if ($preformatted_commands{$root->{'cmdname'}} or $menu_commands{$root->{'cmdname'}}) {
        push @{$self->{'context'}}, 'preformatted';
      }
      if ($indented_commands{$root->{'cmdname'}}) {
        push @{$self->{'format_context'}}, { 'cmdname' => $root->{'cmdname'},
               'paragraph_count' => 0,
               'indent_level' => 
                   $self->{'format_context'}->[-1]->{'indent_level'} + 1,
               'max' => $self->{'format_context'}->[-1]->{'max'} };
        if ($self->{'context'}->[-1] eq 'preformatted') {
          $preformatted = $self->new_formatter('unfilled');
          push @{$self->{'formatters'}}, $preformatted;
        }
      }
      if ($root->{'cmdname'} eq 'quotation'
          or $root->{'cmdname'} eq 'smallquotation') {
        if ($root->{'extra'} and $root->{'extra'}->{'block_command_line_contents'}) {
          my $quotation_arg = Texinfo::Convert::Texinfo::convert(
            {'contents' => $root->{'extra'}->{'block_command_line_contents'}->[0]});
          my $prepended = Texinfo::Parser::parse_texi_line (undef, '@b{'.${quotation_arg}.':} ');
          $result = $self->convert_line ($prepended);
          $self->{'format_context'}->[-1]->{'counter'} += 
             Texinfo::Convert::Unicode::string_width($result);

          #return gdt('@b{{quotation_arg}:} ', {'quotation_arg' => $text}, {'keep_texi' => 1});
          #$result = convert($root->{'args'}->[0]) ."\n";
        }
      }
    } elsif ($root->{'cmdname'} eq 'node') {
        # FIXME handle node
    } elsif ($misc_commands{$root->{'cmdname'}}) {
      if (($sectioning_commands{$root->{'cmdname'}}
          or ($root->{'cmdname'} eq 'item' or $root->{'cmdname'} eq 'itemx'))
              and $root->{'args'}) {
        # FIXME handle sectioning commands with their underline
        # and item with their prepending
        $result = $self->convert_line($root->{'args'}->[0],
            {'indent_level' => $self->{'format_context'}->[-1]->{'indent_level'} -1});
        chomp ($result);
        $result .= "\n";
      } elsif ($root->{'cmdname'} eq 'item' and $root->{'parent'}->{'cmdname'}
               and $item_container_commands{$root->{'parent'}->{'cmdname'}}) {
        # TODO
      } elsif ($root->{'cmdname'} eq 'headitem' or $root->{'cmdname'} eq 'item'
               or $root->{'cmdname'} eq 'tab') {
      #} elsif ($root->{'cmdname'} eq 'tab') {
        # TODO
      } elsif ($root->{'cmdname'} eq 'listoffloats') {
        # FIXME handle listoffloats
      } elsif ($root->{'cmdname'} eq 'sp') {
        if ($root->{'extra'}->{'misc_args'}->[0]) {
          # this useless copy avoids perl changing the type to integer!
          my $sp_nr = $root->{'extra'}->{'misc_args'}->[0];
          $result .= "\n" x $sp_nr;
        }
      # all the @-commands that have an information for the formatting, like
      # @paragraphindent, @frenchspacing...
      } elsif ($informative_commands{$root->{'cmdname'}}) {
        if ($root->{'cmdname'} eq 'frenchspacing' and 
             $root->{'extra'} and $root->{'extra'}->{'misc_args'} and
             $root->{'extra'}->{'misc_args'}->[0]) {
          if ($root->{'extra'}->{'misc_args'}->[0] eq 'on') {
            $self->{$root->{'cmdname'}} = 1 
              if (!$self->{'set'}->{$root->{'cmdname'}});
          } elsif ($root->{'extra'}->{'misc_args'}->[0] eq 'off') {
            $self->{$root->{'cmdname'}} = 0 
              if (!$self->{'set'}->{$root->{'cmdname'}});
          }
        } elsif (exists($root->{'extra'}->{'text'})) {
          $self->{$root->{'cmdname'}} = $root->{'extra'}->{'text'}
              if (!$self->{'set'}->{$root->{'cmdname'}});
        } elsif ($misc_commands{$root->{'cmdname'}} eq 'skipline') {
          $self->{$root->{'cmdname'}} = 1;
        } elsif ($root->{'extra'} and $root->{'extra'}->{'misc_args'} 
                 and exists($root->{'extra'}->{'misc_args'}->[0])) {
          $self->{$root->{'cmdname'}} = $root->{'extra'}->{'misc_args'}->[0]
              if (!$self->{'set'}->{$root->{'cmdname'}});
        }
        return '';
      }
#    FIXME for @def*x commands, they are misc_comands? Or they have index
#          entries?
#          @def* commands should be handled with block commands.
#    } elsif ($def_commands{$root->{'cmdname'}}) {
#      # FIXME change indenting? Or in def_line?
#      # everything is done when in the def_line type
    } else {
      $unknown_command = 1;
    }
    if ($root->{'extra'} and $root->{'extra'}->{'index_entry'}) {
      # a real index entry?
      my $index_entry = 1;
      if ($root->{'cmdname'} eq 'item' or $root->{'cmdname'} eq 'itemx') {
        $index_entry = 0;
      }
      # FIXME do something for index entry?
    } elsif ($unknown_command) {
      die "Unhandled $root->{'cmdname'}\n";
    }

    if ($advance_paragraph_count_commands{$root->{'cmdname'}}) {
      $self->{'format_context'}->[-1]->{'paragraph_count'}++;
    } elsif ($root_commands{$root->{'cmdname'}}) {
      $self->{'format_context'}->[-1]->{'paragraph_count'} = 0;
    }
  }
  my $paragraph;
  if ($root->{'type'}) {
    if ($root->{'type'} eq 'paragraph') {
      $self->{'empty_lines_count'} = 0;
      # FIXME indenting.  First and not first paragraph.
      # FIXME also beware of 'asis'! The space before has to be kept then.
      #       it should be just before the paragraph. 
      #       Maybe just handle empty_spaces_before_paragraph instead of
      #       ignoring it?
      # my $paragraphindent = get_conf('paragraphindent');
      # $paragraphindent = 0 if ($paragraphindent eq 'none');
      # if ($paragraphindent ne 'asis' and $paragraphindent and $line_char_counter == 0 and (defined($content->{'paragraph_in_element_nr'})) and ($info_state->{'indent_para'} or (!defined($info_state->{'indent_para'}) and ($content->{'paragraph_in_element_nr'} or (get_conf('firstparagraphindent') eq 'insert')))))
      $paragraph = $self->new_formatter('paragraph');
      push @{$self->{'formatters'}}, $paragraph;
      $self->{'format_context'}->[-1]->{'paragraph_count'}++;
    } elsif ($root->{'type'} eq 'def_line') {
    #print STDERR "$root->{'extra'}->{'def_command'}\n";
      my @args = @{$root->{'extra'}->{'def_args'}};
      my ($category, $name, $class, $type) = ('', '', '', ''); 
      my ($parsed_category, $parsed_name, $parsed_class, $parsed_type);
      # FIXME this is all wrong. The def should be formatted as a paragraph,
      # see info.init.
      while (@args) {
        my $parsed_arg = shift @args;
        if ($parsed_arg->[0] eq 'category') {
          $parsed_category = $self->_def_argument_content($parsed_arg->[1]);
          $category = $self->convert_unfilled($parsed_category, {'indent_length' => 0});
        } elsif ($parsed_arg->[0] eq 'name') {
          $parsed_name = $self->_def_argument_content($parsed_arg->[1]);
          $name = $self->convert_unfilled($parsed_name, {'indent_length' => 0});
        } elsif ($parsed_arg->[0] eq 'class') {
          $parsed_class = $self->_def_argument_content($parsed_arg->[1]);
          $class = $self->convert_unfilled($parsed_class, {'indent_length' => 0});
        } elsif ($parsed_arg->[0] eq 'type') {
          $parsed_type = $self->_def_argument_content($parsed_arg->[1]);
          $type = $self->convert_unfilled($parsed_type, {'indent_length' => 0});
        } elsif ($parsed_arg->[0] eq 'arg' or $parsed_arg->[0] eq 'argtype') {
          unshift @args, $parsed_arg;
          last;
        }
      }
      print STDERR "DEF LINE(parsed) category `$category' name `$name' class `$class' type `$type'\n"
        if ($self->{'debug'});

      my $parsed_definition_category = _definition_category ($root, 
                                                 [$parsed_category, $category], 
                                                 [$parsed_class, $class]);
      my $definition_category = $self->convert_unfilled($parsed_definition_category, {'indent_length' => 0});
      my $type_name = '';
      $type_name .= "$type " if ($type ne '');
      $type_name .= $name if ($name ne '');

      my $arguments = '';
      foreach my $parsed_arg(@args) {
        my $arg_text;
        if ($parsed_arg->[0] eq 'spaces') {
          $arg_text = $parsed_arg->[1]->{'text'};
        } else {
          $arg_text 
          = $self->convert_unfilled($self->_def_argument_content($parsed_arg->[1]), {'indent_length' => 0});
        }
        $arguments .= $arg_text;
      }
      $arguments = ' '.$arguments if ($arguments ne '');
      print STDERR "DEF LINE definition_category `$definition_category' arguments `$arguments'\n"
        if ($self->{'debug'});
      $result = " -- $definition_category: ${type_name}$arguments";
      $result =~ s/\s*$//;
      $result .= "\n";
      print STDERR "     --> $result" if ($self->{'debug'});
    } elsif ($root->{'type'} eq 'menu_entry') {
      foreach my $arg (@{$root->{'args'}}) {
        $result .= $self->convert($arg);
      }
    } elsif ($root->{'type'} eq 'frenchspacing') {
      push @{$container_context->{'frenchspacing_stack'}}, 1;
      $container_context->{'container'}->set_space_protection(undef,
        undef,undef,1);
    } elsif ($root->{'type'} eq 'code') {
      $container_context->{'code'}++;
      push @{$container_context->{'frenchspacing_stack'}}, 1;
      $container_context->{'container'}->set_space_protection(undef,
        undef,undef,1);
    }
  }
  if ($root->{'contents'}) {
    my @contents = @{$root->{'contents'}};
    push @{$self->{'current_contents'}}, \@contents;
    while (@contents) {
      my $content = shift @contents;
      # FIXME an empty line between block commands don't seem to be 
      # output.
      if ($content->{'type'} 
          and $content->{'type'} eq 'empty_line') {
        $result .= "\n" if (!$self->{'empty_lines_count'} 
                            or $self->{'context'}->[-1] eq 'preformatted');
        $self->{'empty_lines_count'}++;
        delete $self->{'format_context'}->[-1]->{'counter'};
      } else {
        $result .= $self->convert($content);
      }
    }
    pop @{$self->{'current_contents'}};
  }
  if ($root->{'type'}) {
    if ($root->{'type'} eq 'frenchspacing') {
      pop @{$container_context->{'frenchspacing_stack'}};
      $container_context->{'container'}->set_space_protection(undef,
        undef, undef, $container_context->{'frenchspacing_stack'}->[-1]);
    } elsif ($root->{'type'} eq 'code') {
      $container_context->{'code'}--;
      pop @{$container_context->{'frenchspacing_stack'}};
      $container_context->{'container'}->set_space_protection(undef,
        undef, undef, $container_context->{'frenchspacing_stack'}->[-1]);
    } elsif ($root->{'type'} eq 'bracketed'
      and $self->{'context'}->[-1] eq 'math') {
      $result .= $container_context->{'container'}->add_text('}');
    }
  }
  if ($paragraph) {
    $result .= $paragraph->{'container'}->end();
    pop @{$self->{'formatters'}};
  }
  if ($preformatted) {
    $result .= $preformatted->{'container'}->end();
    pop @{$self->{'formatters'}};
    pop @{$self->{'context'}};
  }
  pop @{$self->{'format_context'}} 
    if ($root->{'cmdname'} and $indented_commands{$root->{'cmdname'}});
  return $result;
}

1;
