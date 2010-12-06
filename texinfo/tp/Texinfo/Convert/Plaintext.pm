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
use Texinfo::Parser qw(gdt);

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

my $NO_NUMBER_FOOTNOTE_SYMBOL = '*';

my %informative_commands;
foreach my $informative_command ('paragraphindent', 'firstparagraphindent',
  'frenchspacing', 'documentencoding', 'footnotestyle', 'documentlanguage') {
  $informative_commands{$informative_command} = 1;
}

# printindex not handled in plain text output.
#'printindex',
foreach my $kept_command(keys (%informative_commands),
  'verbatiminclude', 'insertcopying', 
  'listoffloats', 
  'contents', 'shortcontents', 'summarycontents') {
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
my %raw_commands = %Texinfo::Common::raw_commands;
my @out_formats = @Texinfo::Common::out_formats;

foreach my $def_command (keys(%def_commands)) {
  $kept_misc_commands{$def_command} = 1 if ($misc_commands{$def_command});
}

my %preformatted_context_commands = %preformatted_commands;
foreach my $preformatted_command ('verbatim', keys(%menu_commands)) {
  $preformatted_context_commands{$preformatted_command} = 1;
}

my %ignored_misc_commands;
foreach my $misc_command (keys(%misc_commands)) {
  $ignored_misc_commands{$misc_command} = 1 
    unless ($kept_misc_commands{$misc_command});
}

my %ignored_commands = %ignored_misc_commands;
foreach my $ignored_brace_commands ('caption', 'shortcaption', 
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

my %format_context_commands = %indented_commands;

foreach my $non_indented('format', 'smallformat') {
  delete $indented_commands{$non_indented};
}

foreach my $format_context_command (keys(%menu_commands), 'verbatim',
 'flushleft', 'flushright', 'multitable', 'float') {
  $format_context_commands{$format_context_command} = 1;
}

my %flush_commands = (
  'flushleft'  => 1,
  'flushright' => 1
);

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

foreach my $ignored_block_commands ('ignore', 'macro', 'rmacro', 'copying',
  'documentdescription', 'titlepage') {
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
foreach my $type ('empty_line_after_command', 'preamble',
            'empty_spaces_after_command', 'spaces_at_end',
            'empty_spaces_before_argument', 'empty_spaces_before_paragraph') {
  $ignored_types{$type} = 1;
}

# All those commands run with the text.
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
  'slanted', 'sansserif', 'var', 'verb', 'clicksequence',
  'headitemfont', 'dmn');

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
  'encoding'             => 'us-ascii',
  'documentlanguage'     => 'en',
  'number_footnotes'     => 1,
  'expanded_formats'     => [],

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
    if ($conf->{'parser'}) {
      $converter->{'parser'} = $conf->{'parser'};
      $converter->{'extra'} 
         = $converter->{'parser'}->global_commands_information();
      my $floats = $converter->{'parser'}->floats_information();
      $converter->{'structuring'} = $converter->{'parser'}->{'structuring'};

      $converter->{'floats'} = $floats if ($floats);
      $converter->{'setcontentsaftertitlepage'} = 1 
         if ($converter->{'extra'}->{'contents'} 
               and $converter->{'extra'}->{'setcontentsaftertitlepage'}
               and $converter->{'structuring'}
               and $converter->{'structuring'}->{'sectioning_root'});
      $converter->{'setshortcontentsaftertitlepage'} = 1 
         if (($converter->{'extra'}->{'shortcontents'} 
              or $converter->{'extra'}->{'summarycontents'})
               and $converter->{'extra'}->{'setshortcontentsaftertitlepage'}
               and $converter->{'structuring'}
               and $converter->{'structuring'}->{'sectioning_root'});
      delete $conf->{'parser'};
    }
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
  $converter->{'format_context'} = [{
                                     'cmdname' => '_top_format',
                                     'paragraph_count' => 0, 
                                     'indent_level' => 0,
                                     'max' => $converter->{'fillcolumn'}
                                   }];
  $converter->{'formatters'} = [$converter->new_formatter('line')];
  $converter->{'formatters'}->[-1]->{'_top_formatter'} = 1;
  %{$converter->{'ignored_types'}} = %ignored_types;
  %{$converter->{'ignored_commands'}} = %ignored_commands;
  $converter->{'footnote_index'} = 0;
  $converter->{'pending_footnotes'} = [];

  # turn the array to a hash for speed.  Not sure it really matters for such
  # a small array.
  foreach my $expanded_format(@{$converter->{'expanded_formats'}}) {
    $converter->{'expanded_formats_hash'}->{$expanded_format} = 1;
  }
  foreach my $format (@out_formats) {
    $converter->{'ignored_commands'}->{$format} = 1 
       unless ($converter->{'expanded_formats_hash'}->{$format});
  }

  return $converter;
}

sub convert($)
{
  my $self = shift;
  my $root = shift;

  return ($self->_convert($root) . $self->_footnotes());
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

  my $first_indent_length = $conf->{'first_indent_length'};
  delete $conf->{'first_indent_length'};
  
  my $container;
  my $container_conf = {
         'max'                 => $self->{'format_context'}->[-1]->{'max'},
         'frenchspacing'       => $self->{'frenchspacing'},
         'indent_level'        => $self->{'format_context'}->[-1]->{'indent_level'}, 
  };
  $container_conf->{'counter'} = $self->{'format_context'}->[-1]->{'counter'}
    if (defined($self->{'format_context'}->[-1]->{'counter'}));
  $container_conf->{'debug'} = 1 if ($self->{'debug'});
  if ($conf) {
    foreach my $key (keys(%$conf)) {
      $container_conf->{$key} = $conf->{$key};
    }
  }
  my $indent = $container_conf->{'indent_length'};
  $indent = $indent_length*$container_conf->{'indent_level'}
    if (!defined($indent));

  if ($first_indent_length) {
    $container_conf->{'indent_length'} = $first_indent_length;
    $container_conf->{'indent_length_next'} = $indent;
  } else {
    $container_conf->{'indent_length'} = $indent;
  }
    
  if ($type eq 'line') {
    $container = Texinfo::Convert::Line->new($container_conf);
  } elsif ($type eq 'paragraph') {
    $container = Texinfo::Convert::Paragraph->new($container_conf);
  } elsif ($type eq 'unfilled') {
    $container = Texinfo::Convert::UnFilled->new($container_conf);
  } else {
    die "Unknown container type $type\n";
  }

  if ($self->{'context'}->[-1] eq 'flush') {
    $container->set_space_protection(undef, 1, 1);
  }

  my $formatter = {'container' => $container, 'upper_case' => 0,
                   'code' => 0, 'w' => 0,
                   'frenchspacing_stack' => [$self->{'frenchspacing'}]};
  return $formatter;
}

sub convert_line($$;$)
{
  my $self = shift;
  my $converted = shift;
  my $conf = shift;
  my $container = $self->new_formatter('line', $conf);
  push @{$self->{'formatters'}}, $container;
  my $result = $self->_convert($converted);
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
  my $result = $self->_convert($converted);
  $result .= $container->{'container'}->end();
  pop @{$self->{'formatters'}};
  return $result;
}

sub _definition_category($$$$)
{
  my $self = shift;
  my $current = shift;
  my $arg_category = shift;
  my $arg_class = shift;
  return $arg_category
    if (!defined($arg_class));
  
  my $style = 
    $Texinfo::Common::command_index_prefix{$current->{'extra'}->{'def_command'}};
  #my $category = Texinfo::Convert::Texinfo::convert($arg_category->[0]);
  #my $class = Texinfo::Convert::Texinfo::convert($arg_class->[0]);
  #print STDERR "DEFINITION CATEGORY($style): $category $class\n"
  #  if ($self->{'debug'});
  if ($style eq 'f') {
    #return Texinfo::Parser::parse_texi_line (undef, "$category on $class");
    return $self->gdt('{category} on {class}', { 'category' => $arg_category, 
                                          'class' => $arg_class });
  } elsif ($style eq 'v') {
    #return Texinfo::Parser::parse_texi_line (undef, "$category of $class");
    return $self->gdt('{category} of {class}', { 'category' => $arg_category, 
                                          'class' => $arg_class });
  }
  return $arg_category;
}

my $footnote_indent = 3;
sub _footnotes($)
{
  my $self = shift;
  my $result = '';
  if (scalar(@{$self->{'pending_footnotes'}})) {
    $result .= "\n" unless ($self->{'empty_lines_count'});
    $result .= "   ---------- Footnotes ----------\n\n";
    while (@{$self->{'pending_footnotes'}}) {
      my $footnote = shift (@{$self->{'pending_footnotes'}});
      my $footnote_text = ' ' x $footnote_indent 
               . "($footnote->{'number'}) ";
      $result .= $footnote_text;
      $self->{'format_context'}->[-1]->{'counter'} += 
         Texinfo::Convert::Unicode::string_width($footnote_text);
      $result .= $self->_convert($footnote->{'root'}->{'args'}->[0]);
      $result .= "\n" unless ($self->{'empty_lines_count'});
    }
  }
  return $result;
}

sub _align_lines($$$)
{
  my $text = shift;
  my $max_column = shift;
  my $direction = shift;
  my $result = '';
  foreach my $line (split /^/, $text) {
    chomp($line);
    $line =~ s/^\s*//;
    $line =~ s/\s*$//;
    my $line_width = Texinfo::Convert::Unicode::string_width($line);
    if ($line_width == 0) {
      $result .= "\n";
    } else {
      my $spaces_prepended;
      if ($line_width > $max_column) {
        $spaces_prepended = 0;
      } elsif ($direction eq 'center') {
        $spaces_prepended = (($max_column -1 - $line_width) /2);
      } else {
        $spaces_prepended = ($max_column -1 - $line_width);
      }
      $result .= ' ' x$spaces_prepended . $line ."\n";
    }
  }
  return $result;
}

sub _flush_paragraph($$)
{
  my $self = shift;
  my $text = shift;

  my $index = -1;
  $index--
    while (!$flush_commands{$self->{'format_context'}->[$index]->{'cmdname'}});
  # nothing to do in case of flushleft
  if ($self->{'format_context'}->[$index]->{'cmdname'} eq 'flushleft') {
    return $text;
  }
  return _align_lines($text, $self->{'format_context'}->[$index]->{'max'},
                          'right');
}

sub _contents($$$)
{
  my $self = shift;
  my $section_root = shift;
  my $contents_or_shortcontents = shift;

  my $contents = 1 if ($contents_or_shortcontents eq 'contents');

  my $section = $section_root->{'section_childs'}->[0];
  my $root_level = $section->{'level'};
  my $result = '';
  while ($section and $section ne $section_root) {
    my $text = Texinfo::Convert::Text::numbered_heading($section,
        $self->convert_line({'contents' 
                => $section->{'extra'}->{'misc_content'}}))."\n";
    $result .= (' ' x (2*($section->{'level'} - ($root_level+1)))) . $text;
    if ($section->{'section_childs'} 
          and ($contents or $section->{'level'} < $root_level+1)) {
      $section = $section->{'section_childs'}->[0];
    } elsif ($section->{'section_next'}) {
      $section = $section->{'section_next'};
    } else {
      while ($section->{'section_up'}) {
        $section = $section->{'section_up'};
        if ($section->{'section_next'}) {
          $section = $section->{'section_next'};
          last;
        }
      }
    }
  }
  return $result;
}

my $listoffloat_entry_length = 41;
my $listoffloat_append = '...';

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
# 
# paragraph number: incremented with block commands except html and such
# and group and raggedright and menu*
# and also center and listoffloats
# and with paragraphs. 

# preformatted

sub _convert($$);

sub _convert($$)
{
  my $self = shift;
  my $root = shift;

  #my $formatter;
  #if (@{$self->{'formatters'}}) {
  my $formatter = $self->{'formatters'}->[-1];
  #}
  if ($self->{'debug'}) {
    my $empty_lines_count = '';
    $empty_lines_count = $self->{'empty_lines_count'} if defined($self->{'empty_lines_count'});
    print STDERR "ROOT (@{$self->{'context'}}|@{$self->{'format_context'}},$empty_lines_count)";
    print STDERR " format_context: $self->{'format_context'}->[-1]->{'cmdname'}, $self->{'format_context'}->[-1]->{'paragraph_count'}, $self->{'format_context'}->[-1]->{'indent_level'}, "
      .(defined($self->{'format_context'}->[-1]->{'counter'}) ? "counter: $self->{'format_context'}->[-1]->{'counter'}, " : '') 
       ."max: $self->{'format_context'}->[-1]->{'max'}\n";
    print STDERR " cmd: $root->{'cmdname'}," if ($root->{'cmdname'});
    print STDERR " type: $root->{'type'}" if ($root->{'type'});
    print STDERR "\n";
    print STDERR "  Text: $root->{'text'}\n" if (defined($root->{'text'}));
    #print STDERR "  Special def_command: $root->{'extra'}->{'def_command'}\n"
    #  if (defined($root->{'extra'}) and $root->{'extra'}->{'def_command'});
    if ($formatter) {
      print STDERR "  Container:($formatter->{'code'},$formatter->{'upper_case'},$formatter->{'frenchspacing_stack'}->[-1]) ";
      $formatter->{'container'}->dump();
    }
  }

  # FIXME remaining:
  # verbatiminclude
  # image

  # NUMBER_FOOTNOTES SPLIT_SIZE IN_ENCODING FILLCOLUMN ENABLE_ENCODING
  # OUT_ENCODING ENCODING_NAME

  if (($root->{'type'} and $self->{'ignored_types'}->{$root->{'type'}})
       or ($root->{'cmdname'} 
            and $self->{'ignored_commands'}->{$root->{'cmdname'}})) {
    print STDERR "IGNORED\n" if ($self->{'debug'});
    return '';
  }
  my $result = '';

  if ($root->{'type'} and $root->{'type'} eq 'bracketed'
      and $self->{'context'}->[-1] eq 'math') {
    $result .= $formatter->{'container'}->add_text('{');
  }

  if (defined($root->{'text'})) {
    if (!$formatter->{'_top_formatter'}) {
      $result .= $formatter->{'container'}->add_text(
                      $self->process_text($root, $formatter));
    } elsif ($root->{'type'} and $root->{'type'} eq 'empty_spaces_before_paragraph') {
      $result .= $root->{'text'};
    # ignore text outside of any format, but warn if ignored text not empty
    } elsif ($root->{'text'} =~ /\S/) {
      warn "BUG: ignored text not empty `$root->{'text'}'\n";
    }
  }
  my $preformatted;
  my $cell;
  if ($root->{'cmdname'}) {
    my $unknown_command;
    my $command = $root->{'cmdname'};
    if (defined($text_no_brace_commands{$root->{'cmdname'}})) {
      if ($command eq ':') {
        $formatter->{'container'}->inhibit_end_sentence();
      } elsif ($command eq '*') {
        $result .= $formatter->{'container'}->add_pending_word();
        $result .= $formatter->{'container'}->end_line();
      } elsif ($command eq '.' or $command eq '?' or $command eq '!') {
        $result .= $formatter->{'container'}->add_next($command, undef, 1),
      } elsif ($command eq ' ' or $command eq "\n" or $command eq "\t") {
        $result .= $formatter->{'container'}->add_next($text_no_brace_commands{$root->{'cmdname'}});
      } else {
        $result .= $formatter->{'container'}->add_text($text_no_brace_commands{$root->{'cmdname'}});
      }
      return $result;
    } elsif (defined($text_brace_no_arg_commands{$root->{'cmdname'}})) {
      my $text = Texinfo::Convert::Text::brace_no_arg_command($root, 
                                                    $self->{'encoding'});
      if ($command eq 'enddots') {
        $result .= $formatter->{'container'}->add_next($text, undef, 1),
      } else {
        $result .= $formatter->{'container'}->add_text($text);
        if ($command eq 'dots') {
          $formatter->{'container'}->inhibit_end_sentence();
        }
      }
      return $result;
    # commands with braces
    } elsif ($accent_commands{$root->{'cmdname'}}) {
      $result .= $formatter->{'container'}->add_text(
          Texinfo::Convert::Text::text_accents($root, $self->{'encoding'}));
      return $result;
    } elsif ($style_map{$command}) {
      if ($code_style_commands{$command}) {
        $formatter->{'code'}++;
        push @{$formatter->{'frenchspacing_stack'}}, 1;
        $formatter->{'container'}->set_space_protection(undef,
          undef,undef,1);
      }
      $formatter->{'upper_case'}++ if ($upper_case_commands{$command});
      if ($command eq 'w') {
        $formatter->{'w'}++;
        $formatter->{'container'}->set_space_protection(1,1)
          if ($formatter->{'w'} == 1);
      }
      $result .= $formatter->{'container'}->add_text($style_map{$command}->[0]);
      $result .= $self->_convert($root->{'args'}->[0]) if ($root->{'args'});
      $result .= $formatter->{'container'}->add_text($style_map{$command}->[1]);
      if ($command eq 'w') {
        $formatter->{'w'}--;
        $formatter->{'container'}->set_space_protection(0,0)
          if ($formatter->{'w'} == 0);
      }
      if ($code_style_commands{$command}) {
        $formatter->{'code'}--;
        pop @{$formatter->{'frenchspacing_stack'}};
        $formatter->{'container'}->set_space_protection(undef,
          undef, undef, $formatter->{'frenchspacing_stack'}->[-1]);
      }
      $formatter->{'upper_case'}-- if ($upper_case_commands{$command});
    } elsif ($root->{'cmdname'} eq 'image') {
      # FIXME
      #return $self->_convert($root->{'args'}->[0]);
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
                             'contents' => $root->{'extra'}->{'brace_command_contents'}->[0]
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
      my $footnote_number;
      if ($self->{'number_footnotes'}) {
        $self->{'footnote_index'}++;
        $footnote_number = $self->{'footnote_index'};
      } else {
        $footnote_number = $NO_NUMBER_FOOTNOTE_SYMBOL;
      }
      $formatter->{'container'}->add_text("($footnote_number)");
      push @{$self->{'pending_footnotes'}}, {'root' => $root, 
                                             'number' => $footnote_number}; 
    } elsif ($command eq 'anchor') {
      $result .= $formatter->{'container'}->add_pending_word();
    } elsif ($ref_commands{$command}) {
      # FIXME if it a reference to a float with a label, $arg[1] should 
      # be set to '$type $number' or '$number' if there is no type.
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
                    'contents' => $args[3]},
                   {'text' => ')'},];
        } elsif (defined($args[4])) {
          # FIXME this is a bit strange.
          $file = [{'text' => '()'}];
        }
        if ($name) {
          push @contents, (@$name, {'text' => ': '});
          if ($file) {
            push @contents, @$file;
          }
          # node name
          push @contents, ({'type' => 'code',
                            'contents' => $args[0]});
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
                     'contents' => $root->{'extra'}->{'brace_command_contents'}->[0]});
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
      $result .= $self->_convert($root->{'args'}->[0]) if ($root->{'args'});
      pop @{$self->{'context'}};
      return $result;
    } elsif ($command eq 'titlefont') {
      $result = Texinfo::Convert::Text::heading({'level' => 0, 
           'cmdname' => 'titlefont'},
           $self->convert_line ($root->{'args'}->[0]));
      $self->{'empty_lines_count'} = 0 unless ($result eq '');
      return $result;
    } elsif ($command eq 'value') {
      my $expansion = $self->gdt('@{No value for `{value}\'@}', 
                                    {'value' => $root->{'type'}});
        unshift @{$self->{'current_contents'}->[-1]}, $expansion;
    } elsif ($root->{'args'} and $root->{'args'}->[0] 
             and $root->{'args'}->[0]->{'type'}
             and $root->{'args'}->[0]->{'type'} eq 'brace_command_arg') {
      die "Unhandled command with braces $root->{'cmdname'}\n";
      #return $self->_convert($root->{'args'}->[0]);
    # block commands
    } elsif (exists($block_commands{$root->{'cmdname'}})) {
      # remark:
      # cartouche group and raggedright -> nothing on format stack

      if ($preformatted_context_commands{$root->{'cmdname'}}) {
        push @{$self->{'context'}}, 'preformatted';
      } elsif ($flush_commands{$root->{'cmdname'}}) {
        push @{$self->{'context'}}, 'flush';
      }
      if ($format_context_commands{$root->{'cmdname'}}) {
        push @{$self->{'format_context'}}, 
             { 'cmdname' => $root->{'cmdname'},
               'paragraph_count' => 0,
               'indent_level' => 
                   $self->{'format_context'}->[-1]->{'indent_level'},
               'max' => $self->{'format_context'}->[-1]->{'max'} };
        $self->{'format_context'}->[-1]->{'indent_level'}++
           if ($indented_commands{$root->{'cmdname'}});
        if ($self->{'context'}->[-1] eq 'preformatted') {
          $preformatted = $self->new_formatter('unfilled');
          push @{$self->{'formatters'}}, $preformatted;
        }
      }
      if ($root->{'cmdname'} eq 'quotation'
          or $root->{'cmdname'} eq 'smallquotation') {
        if ($root->{'extra'} and $root->{'extra'}->{'block_command_line_contents'}) {
          #my $quotation_arg = Texinfo::Convert::Texinfo::convert(
          #  {'contents' => $root->{'extra'}->{'block_command_line_contents'}->[0]});
          #my $prepended = Texinfo::Parser::parse_texi_line (undef, '@b{'.${quotation_arg}.':} ');
          my $prepended = $self->gdt('@b{{quotation_arg}:} ', 
             {'quotation_arg' => $root->{'extra'}->{'block_command_line_contents'}->[0]});
          #print STDERR Data::Dumper->Dump([$prepended]);
          $result = $self->convert_line ($prepended);
          $self->{'format_context'}->[-1]->{'counter'} += 
             Texinfo::Convert::Unicode::string_width($result);
          $self->{'empty_lines_count'} = 0 unless ($result eq '');

          #return gdt('@b{{quotation_arg}:} ', {'quotation_arg' => $text}, {'keep_texi' => 1});
          #$result = convert($root->{'args'}->[0]) ."\n";
        }
      } elsif ($root->{'cmdname'} eq 'menu') {
        $result .= "* Menu:\n\n";
      } elsif ($root->{'cmdname'} eq 'multitable') {
        my $columnsize;
        if ($root->{'extra'}->{'columnfractions'}) {
          foreach my $fraction (@{$root->{'extra'}->{'columnfractions'}}) {
            push @$columnsize, int($fraction * $self->{'format_context'}->[-1]->{'max'} +0.5);
          }
        } elsif ($root->{'extra'}->{'prototypes'}) {
          foreach my $prototype (@{$root->{'extra'}->{'prototypes'}}) {
            my $formatted_prototype = $self->convert_line($prototype, {'indent_length' => 0});
            print STDERR " MULTITABLE_PROTO {$formatted_prototype}\n" 
              if ($self->{'debug'});
            push @$columnsize, Texinfo::Convert::Unicode::string_width($formatted_prototype);
          }
        }
        print STDERR "MULTITABLE_SIZES @$columnsize\n" if ($self->{'debug'});
        $self->{'format_context'}->[-1]->{'columns_size'} = $columnsize;
      }

    } elsif ($root->{'cmdname'} eq 'node') {
      $self->{'footnote_index'} = 0;
      $result .= $self->_footnotes();
    } elsif ($sectioning_commands{$root->{'cmdname'}}) {
      if ($self->{'setcontentsaftertitlepage'} 
           and $root_commands{$root->{'cmdname'}}) {
        $result .= $self->_contents($self->{'structuring'}->{'sectioning_root'}, 
                              'contents') ."\n";
        $self->{'empty_lines_count'} = 0;
        $self->{'setcontentsaftertitlepage'} = 0;
      } 
      if ($self->{'setshortcontentsaftertitlepage'} 
            and $root_commands{$root->{'cmdname'}}) {
        $result .= $self->_contents($self->{'structuring'}->{'sectioning_root'}, 
                              'shortcontents')."\n";
        $self->{'empty_lines_count'} = 0;
        $self->{'setshortcontentsaftertitlepage'} = 0;
      }
      if ($root->{'args'}) {
        my $heading = $self->convert_line($root->{'args'}->[0]);
        $result .= Texinfo::Convert::Text::heading ($root, $heading);
        $self->{'empty_lines_count'} = 0 unless ($result eq '');
      }
    } elsif (($root->{'cmdname'} eq 'item' or $root->{'cmdname'} eq 'itemx')
            and $root->{'extra'} and $root->{'extra'}->{'misc_content'}) {
      my $contents = $root->{'extra'}->{'misc_content'};
      if ($root->{'parent'}->{'extra'} and $root->{'parent'}->{'extra'}->{'command_as_argument'}) {
        $contents = [{'cmdname' => $root->{'parent'}->{'extra'}->{'command_as_argument'},
                 'args' => [{'type' => 'brace_command_arg', 
                            'contents' => $contents}]
        }];
      }
      $result = $self->convert_line({'contents' => $contents},
          {'indent_level' => $self->{'format_context'}->[-1]->{'indent_level'} -1});
      chomp ($result);
      $self->{'empty_lines_count'} = 0 unless ($result eq '');
      $result .= "\n";
    } elsif ($root->{'cmdname'} eq 'item' and $root->{'parent'}->{'cmdname'}
             and $item_container_commands{$root->{'parent'}->{'cmdname'}}) {
      $self->{'format_context'}->[-1]->{'paragraph_count'} = 0;
      my $line = $self->new_formatter('line', 
          {'indent_length' => 
              ($self->{'format_context'}->[-1]->{'indent_level'} -1)
                * $indent_length
                 + $item_indent_format_length{$root->{'parent'}->{'cmdname'}}});
      push @{$self->{'formatters'}}, $line;
      if ($root->{'parent'}->{'cmdname'} eq 'enumerate') {
        $result .= $line->{'container'}->add_next(Texinfo::Convert::Text::enumerate_item_representation(
          $root->{'parent'}->{'extra'}->{'enumerate_specification'},
          $root->{'extra'}->{'item_number'}) . '. ');
      } else {
        $result .= $self->_convert(
          {'contents' => 
             [@{$root->{'parent'}->{'extra'}->{'block_command_line_contents'}->[0]},
              { 'text' => ' ' }]
          });
      }
      $result .= $line->{'container'}->end();
      print STDERR "  $root->{'parent'}->{'cmdname'}($root->{'extra'}->{'item_number'}) -> |$result|\n" 
         if ($self->{'debug'});
      pop @{$self->{'formatters'}};
      $self->{'format_context'}->[-1]->{'counter'} += 
         Texinfo::Convert::Unicode::string_width($result);
      $self->{'empty_lines_count'} = 0 unless ($result eq '');
    } elsif ($root->{'cmdname'} eq 'headitem' or $root->{'cmdname'} eq 'item'
             or $root->{'cmdname'} eq 'tab') {
      my $cell_width = $self->{'format_context'}->[-1]->{'columns_size'}->[$root->{'extra'}->{'cell_number'}-1];
      $self->{'format_context'}->[-1]->{'item_command'} = $root->{'cmdname'}
        if ($root->{'cmdname'} ne 'tab');
      print STDERR "CELL [$root->{'extra'}->{'cell_number'}]: \@$root->{'cmdname'}. Width: $cell_width\n"
            if ($self->{'debug'});
      die if (!defined($cell_width));
      push @{$self->{'format_context'}},
           { 'cmdname' => $root->{'cmdname'},
             'paragraph_count' => 0,
             'indent_level' => 0,
             'max' => $cell_width - 2 };
      if ($self->{'context'}->[-1] eq 'preformatted') {
        $preformatted = $self->new_formatter('unfilled');
        push @{$self->{'formatters'}}, $preformatted;
      }
      $cell = 1;
    } elsif ($root->{'cmdname'} eq 'center') {
      $result = $self->convert_line ({'contents' => $root->{'extra'}->{'misc_content'}},
                                     {'indent_length' => 0});
      $result = _align_lines ($result, $self->{'format_context'}->[-1]->{'max'},
                                  'center');
      chomp ($result);
      $self->{'empty_lines_count'} = 0 unless ($result eq '');
      $result .= "\n";
    } elsif ($root->{'cmdname'} eq 'exdent') {
      $result = $self->convert_line ({'contents' => $root->{'extra'}->{'misc_content'}},
        {'indent_level' => $self->{'format_context'}->[-1]->{'indent_level'} -1});
      chomp ($result);
      $self->{'empty_lines_count'} = 0 unless ($result eq '');
      $result .= "\n";
    } elsif ($root->{'cmdname'} eq 'insertcopying') {
      if ($self->{'extra'} and $self->{'extra'}->{'copying'}) {
        unshift @{$self->{'current_contents'}->[-1]}, 
           {'contents' => $self->{'extra'}->{'copying'}->{'contents'}};
      }
    } elsif ($root->{'cmdname'} eq 'listoffloats') {
      if ($root->{'extra'} and $root->{'extra'}->{'type'}
          and defined($root->{'extra'}->{'type'}->{'normalized'}) 
          and $self->{'floats'} 
          and $self->{'floats'}->{$root->{'extra'}->{'type'}->{'normalized'}}
          and @{$self->{'floats'}->{$root->{'extra'}->{'type'}->{'normalized'}}}) {
        $result = "* Menu:\n\n";
        foreach my $float (@{$self->{'floats'}->{$root->{'extra'}->{'type'}->{'normalized'}}}) {
          next if (!defined($float->{'extra'}->{'block_command_line_contents'}->[1]));
          my $float_entry;
          if (exists ($float->{'number'})) {
            $float_entry = 
             $self->gdt('* {float_type} {float_number}: {float_label}.', 
              {'float_type' => $root->{'extra'}->{'type'}->{'content'},
               'float_number' => $float->{'number'},
               'float_label' => $float->{'extra'}->{'block_command_line_contents'}->[1]});
          } else {
            $float_entry = $self->gdt('* {float_type}: {float_label}.', 
              {'float_type' => $root->{'extra'}->{'type'}->{'content'},
               'float_label' => $float->{'extra'}->{'block_command_line_contents'}->[1]
               });
          }
          #print STDERR "$float ".$self->convert_line($float_entry)."\n";
          my $float_line = $self->convert_line($float_entry);
          my $line_width 
             = Texinfo::Convert::Unicode::string_width($float_line);
          if ($line_width > $listoffloat_entry_length) {
            $float_line .= "\n" . ' ' x $listoffloat_entry_length;
          } else {
            $float_line .= ' ' x ($listoffloat_entry_length - $line_width);
          }
          $line_width = $listoffloat_entry_length;
          my $caption;
          if ($float->{'extra'}->{'shortcaption'}) {
            $caption = $float->{'extra'}->{'shortcaption'};
          } elsif ($float->{'extra'}->{'caption'}) {
            $caption = $float->{'extra'}->{'caption'};
          }
          if ($caption) {
            # FIXME should there be some indentation?
            my $caption_text = $self->convert({'contents' => $caption->{'args'}->[0]->{'contents'},
                        'type' => $caption->{'cmdname'}.'_listoffloats'});
            while ($caption_text =~ s/^\s*(\p{Unicode::EastAsianWidth::InFullwidth}\s*|\S+\s*)//) {
              my $new_word = $1;
              $new_word =~ s/\n/ /g;
              if ((Texinfo::Convert::Unicode::string_width($new_word) +
                   $line_width) > 
                       ($self->{'format_context'}->[-1]->{'max'} - 3)) {
                $float_line .= $listoffloat_append;
                last;
              } else {
                $float_line .= $new_word;
                $line_width += 
                  Texinfo::Convert::Unicode::string_width($new_word);
              }
            }
          }
          $result .= $float_line. "\n";
        }
        $result .= "\n";
        $self->{'empty_lines_count'} = 1;
      }
    } elsif ($root->{'cmdname'} eq 'sp') {
      if ($root->{'extra'}->{'misc_args'}->[0]) {
        # this useless copy avoids perl changing the type to integer!
        my $sp_nr = $root->{'extra'}->{'misc_args'}->[0];
        $result .= "\n" x $sp_nr;
        $self->{'empty_lines_count'} = $sp_nr;
      }
    } elsif ($root->{'cmdname'} eq 'contents') {
      if (!defined($self->{'setcontentsaftertitlepage'})
           and $self->{'structuring'}
           and $self->{'structuring'}->{'sectioning_root'}) {
        $result .= $self->_contents($self->{'structuring'}->{'sectioning_root'}, 
                              'contents');
      }
    } elsif ($root->{'cmdname'} eq 'shortcontents' 
               or $root->{'cmdname'} eq 'summarycontents') {
      if (!defined($self->{'setshortcontentsaftertitlepage'})
            and $self->{'structuring'}
            and $self->{'structuring'}->{'sectioning_root'}) {
        $result .= $self->_contents($self->{'structuring'}->{'sectioning_root'}, 
                              'shortcontents');
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
        if (!$self->{'set'}->{$root->{'cmdname'}}) {
          $self->{$root->{'cmdname'}} = $root->{'extra'}->{'misc_args'}->[0];
          if ($root->{'cmdname'} eq 'paragraphindent') {
            if ($root->{'extra'}->{'misc_args'}->[0] eq 'asis') {
              delete $self->{'ignored_types'}->{'empty_spaces_before_paragraph'};
            } else {
              $self->{$root->{'cmdname'}} = 0 
                if ($root->{'extra'}->{'misc_args'}->[0] eq 'none');
              $self->{'ignored_types'}->{'empty_spaces_before_paragraph'} = 1;
            }
          } elsif ($root->{'cmdname'} eq 'documentencoding') {
            $self->{'encoding'} = $root->{'extra'}->{'encoding_alias'} 
              if (defined($root->{'extra'}) 
                   and defined($root->{'extra'}->{'encoding_alias'}));
          }
        }
      }
      return '';
    } else {
      $unknown_command = 1;
    }
    if ($root->{'extra'} and $root->{'extra'}->{'index_entry'}) {
      # in fact nothing is done for regular plaintext, only handled in info.
      # a real index entry?
      my $index_entry = 1;
      if ($root->{'cmdname'} eq 'item' or $root->{'cmdname'} eq 'itemx') {
        $index_entry = 0;
      }
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
      my $conf;
      # indent. Not first paragraph.
      if ($self->{'format_context'}->[-1]->{'cmdname'} eq '_top_format'
          and ($self->{'format_context'}->[-1]->{'paragraph_count'} 
              or $self->{'firstparagraphindent'} eq 'insert') 
          and $self->{'paragraphindent'} ne 'asis' and $self->{'paragraphindent'}
          and !$self->{'format_context'}->[-1]->{'counter'}) {
        $conf->{'first_indent_length'} = $self->{'paragraphindent'};
      }
      $paragraph = $self->new_formatter('paragraph', $conf);
      push @{$self->{'formatters'}}, $paragraph;
      $self->{'format_context'}->[-1]->{'paragraph_count'}++;
    } elsif ($root->{'type'} eq 'def_line' and $root->{'extra'} 
             and $root->{'extra'}->{'def_args'}
             and @{$root->{'extra'}->{'def_args'}}) {
    #print STDERR "$root->{'extra'}->{'def_command'}\n";
      my $parsed_definition_category = $self->_definition_category ($root, 
              $root->{'extra'}->{'def_parsed_hash'}->{'category'},
              $root->{'extra'}->{'def_parsed_hash'}->{'class'});
      # FIXME need i18n here?
      my @contents = ($parsed_definition_category, {'text' => ': '});
      if ($root->{'extra'}->{'def_parsed_hash'}->{'type'}) {
        push @contents, ($root->{'extra'}->{'def_parsed_hash'}->{'type'}, 
                         {'text' => ' '});
      }
      push @contents, $root->{'extra'}->{'def_parsed_hash'}->{'name'};

      my @args = @{$root->{'extra'}->{'def_args'}};
      while (@args) {
        last if ($args[0]->[0] ne 'spaces' 
                and !$root->{'extra'}->{'def_parsed_hash'}->{$args[0]->[0]});
        shift @args;
      }

      if (@args) {
        push @contents, {'text' => ' '};
        foreach my $arg (@args) {
          push @contents, $arg->[1];
        }
      }

      my $def_paragraph = $self->new_formatter('paragraph', 
       { 'indent_length' => ($self->{'format_context'}->[-1]->{'indent_level'} -1) *$indent_length,
         'indent_length_next' => (1+$self->{'format_context'}->[-1]->{'indent_level'})*$indent_length});
      push @{$self->{'formatters'}}, $def_paragraph;

      $result .= $def_paragraph->{'container'}->add_next(" -- ");
      $result .= $self->_convert({'type' => 'code', 'contents' => \@contents});
      $result .= $def_paragraph->{'container'}->end();

      pop @{$self->{'formatters'}};
      $self->{'empty_lines_count'} = 0;
      print STDERR "     --> $result" if ($self->{'debug'});
    } elsif ($root->{'type'} eq 'menu_entry') {
      foreach my $arg (@{$root->{'args'}}) {
        $result .= $self->_convert($arg);
      }
      chomp($result);
      $result .= "\n";
    } elsif ($root->{'type'} eq 'frenchspacing') {
      push @{$formatter->{'frenchspacing_stack'}}, 1;
      $formatter->{'container'}->set_space_protection(undef,
        undef,undef,1);
    } elsif ($root->{'type'} eq 'code') {
      $formatter->{'code'}++;
      push @{$formatter->{'frenchspacing_stack'}}, 1;
      $formatter->{'container'}->set_space_protection(undef,
        undef,undef,1);
    }
  }
  if ($root->{'contents'}) {
    my @contents = @{$root->{'contents'}};
    push @{$self->{'current_contents'}}, \@contents;
    while (@contents) {
      my $content = shift @contents;
      if ($content->{'type'} and $content->{'type'} eq 'empty_line') {
        $result .= "\n" if (!$self->{'empty_lines_count'} 
                            or $self->{'context'}->[-1] eq 'preformatted');
        $self->{'empty_lines_count'}++;
        delete $self->{'format_context'}->[-1]->{'counter'};
      } else {
        my $new_text = $self->_convert($content);
        $result .= $new_text;
        $self->{'empty_lines_count'} = 0 if ($preformatted and $new_text ne '');
      }
    }
    pop @{$self->{'current_contents'}};
  }

  # now closing
  if ($root->{'type'}) {
    if ($root->{'type'} eq 'frenchspacing') {
      pop @{$formatter->{'frenchspacing_stack'}};
      $formatter->{'container'}->set_space_protection(undef,
        undef, undef, $formatter->{'frenchspacing_stack'}->[-1]);
    } elsif ($root->{'type'} eq 'code') {
      $formatter->{'code'}--;
      pop @{$formatter->{'frenchspacing_stack'}};
      $formatter->{'container'}->set_space_protection(undef,
        undef, undef, $formatter->{'frenchspacing_stack'}->[-1]);
    } elsif ($root->{'type'} eq 'bracketed'
      and $self->{'context'}->[-1] eq 'math') {
      $result .= $formatter->{'container'}->add_text('}');
    } elsif ($root->{'type'} eq 'row') {
      my @cell_beginnings;
      my @cell_lines;
      my $cell_beginning = 0;
      my $cell_idx = 0;
      my $max_lines = 0;
      my $indent_len = $indent_length 
             * $self->{'format_context'}->[-1]->{'indent_level'};
      foreach my $cell (@{$self->{'format_context'}->[-1]->{'row'}}) {
        $cell_beginnings[$cell_idx] = $cell_beginning;
        my $cell_width = $self->{'format_context'}->[-1]->{'columns_size'}->[$cell_idx];
        $cell_beginning += $cell_width +1;
        $cell_lines[$cell_idx] = [ split /^/, $cell ];
        $max_lines = scalar(@{$cell_lines[$cell_idx]}) 
          if (scalar(@{$cell_lines[$cell_idx]}) > $max_lines);
        $cell_idx++;
      }
      print STDERR "ROW, max_lines $max_lines, indent_len $indent_len\n" 
         if ($self->{'debug'});
      
      # this is used to keep track of the last cell with content.
      my $previous_last_cell = scalar(@{$self->{'format_context'}->[-1]->{'row'}});
      for (my $line_idx = 0; $line_idx < $max_lines; $line_idx++) {
        my $line_width = $indent_len;
        my $line = '';
        # determine the last cell in the line, to fill spaces in 
        # cells preceding that cell on the line
        my $last_cell = 0;
        for (my $cell_idx = 0; $cell_idx < $previous_last_cell; $cell_idx++) {
          $last_cell = $cell_idx+1 if (defined($cell_lines[$cell_idx]->[$line_idx]));
        }
        print STDERR "  L(last_cell $last_cell): $line_idx\n"
          if ($self->{'debug'});
        for (my $cell_idx = 0; $cell_idx < $last_cell; $cell_idx++) {
          my $cell_text = $cell_lines[$cell_idx]->[$line_idx];
          if (defined($cell_text)) {
            chomp($cell_text);
            if ($line eq '' and $cell_text ne '') {
              $line = ' ' x $indent_len;
            }
            print STDERR "  C($cell_idx) `$cell_text'\n" if ($self->{'debug'});
            $line .= $cell_text;
            $line_width += Texinfo::Convert::Unicode::string_width($cell_text);
          }
          if ($cell_idx+1 < $last_cell) {
            if ($line_width < $indent_len + $cell_beginnings[$cell_idx+1]) {
              if ($line eq '') {
                $line = ' ' x $indent_len;
              }
              my $spaces = ' ' x ($indent_len + $cell_beginnings[$cell_idx+1] - $line_width);
              $line_width += Texinfo::Convert::Unicode::string_width($spaces);
              $line .= $spaces;
            }
          }
        }
        $line .= "\n";
        $result .= $line;
        $previous_last_cell = $last_cell;
      }
      if ($self->{'format_context'}->[-1]->{'item_command'} eq 'headitem') {
        # at this point cell_beginning is at the beginning of
        # the cell following the end of the table -> full width
        my $line = ' ' x $indent_len . '-' x $cell_beginning . "\n";
        $result .= $line;
      }
      $self->{'format_context'}->[-1]->{'row'} = [];
    }
  }
  if ($paragraph) {
    $result .= $paragraph->{'container'}->end();
    if ($self->{'context'}->[-1] eq 'flush') {
      $result = $self->_flush_paragraph ($result);
    }
    pop @{$self->{'formatters'}};
    delete $self->{'format_context'}->[-1]->{'counter'};
  }

  if ($root->{'cmdname'}) {
    if ($root->{'cmdname'} eq 'float') {
      if ($self->{'debug'}) {
        my $type_texi = '';
        $type_texi = Texinfo::Convert::Texinfo::convert($root->{'extra'}->{'type'})
          if ($root->{'extra'} and $root->{'extra'}->{'type'});
        my $number = '';
        $number = $root->{'number'} if (defined($root->{'number'}));
        print STDERR "FLOAT: ($number) ($type_texi)\n";
      }

      if ($root->{'extra'}) {
        my $caption;
        if ($root->{'extra'}->{'caption'}) {
          $caption = $root->{'extra'}->{'caption'};
        } elsif ($root->{'extra'}->{'shortcaption'}) {
          $caption = $root->{'extra'}->{'shortcaption'};
        }
        if ($self->{'debug'}) {
          my $caption_texi = 
            Texinfo::Convert::Texinfo::convert({ 'contents' => $caption->{'contents'}});
          print STDERR "  CAPTION: $caption_texi\n";
        }
        my $type;
        if ($root->{'extra'}->{'type'}) {
          $type = {'contents' => $root->{'extra'}->{'type'}->{'content'}};
        }

        my $prepended;
        if ($type) {
          #print STDERR "AAAAAAA $root->{'extra'}->{'type'} "
          #   .Data::Dumper->Dump([$root->{'extra'}->{'type'}]);
          if ($caption) {
            if (defined($root->{'number'})) {
              $prepended = $self->gdt('{float_type} {float_number}: ', 
                  {'float_type' => $type,
                    'float_number' => $root->{'number'}});
            } else {
              $prepended = $self->gdt('{float_type}: ',
                  {'float_type' => $type});
            }
          } else {
            if (defined($root->{'number'})) {
              $prepended = $self->gdt("{float_type} {float_number}\n",
                  {'float_type' => $type,
                    'float_number' => $root->{'number'}});
            } else {
              $prepended = $self->gdt("{float_type}\n", 
                  {'float_type' => $type});
            }
          }
        } elsif (defined($root->{'number'})) {
          if ($caption) {
            $prepended = $self->gdt('{float_number}: ',
                 {'float_number' => $root->{'number'}});
          } else {
            $prepended = $self->gdt("{float_number}\n",
                 {'float_number' => $root->{'number'}});
          }
        }
        if ($prepended) {
          #print STDERR "PREPENDED ".Data::Dumper->Dump([$prepended]);
          $result .= $self->convert_line ($prepended);
          $self->{'format_context'}->[-1]->{'counter'} += 
            Texinfo::Convert::Unicode::string_width($result);
        }
        if ($caption) {
          $result .= $self->_convert($caption->{'args'}->[0]);
        }
      }
    } elsif ($root->{'cmdname'} eq 'quotation' and $root->{'extra'} 
             and $root->{'extra'}->{'authors'}) {
      foreach my $author (@{$root->{'extra'}->{'authors'}}) {
        $result .= $self->convert($self->gdt("\@center --- \@emph{{author}}\n",
                 {'author' => $author->{'extra'}->{'misc_content'}}));
      }
    }
  }
  if ($preformatted) {
    $result .= $preformatted->{'container'}->end();
    pop @{$self->{'formatters'}};
  }

  if ($root->{'cmdname'} and 
       ($preformatted_context_commands{$root->{'cmdname'}} 
        or $flush_commands{$root->{'cmdname'}})) {
    pop @{$self->{'context'}};
  }

  pop @{$self->{'format_context'}} 
    if ($root->{'cmdname'} and $format_context_commands{$root->{'cmdname'}}
        or $cell);
  if ($cell) {
    push @{$self->{'format_context'}->[-1]->{'row'}}, $result;
    $result = '';
  }

  return $result;
}

1;
