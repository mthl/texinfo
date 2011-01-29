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
use Texinfo::Report;
use Texinfo::Convert::Texinfo;
use Texinfo::Convert::Text;
use Texinfo::Convert::Paragraph;
use Texinfo::Convert::Line;
use Texinfo::Convert::UnFilled;
use Texinfo::Parser qw(gdt);

use Carp qw(cluck);

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter Texinfo::Report);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration       use Texinfo::Covert::Text ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
  convert
  output
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';

# misc commands that are of use for formatting.
my %formatting_misc_commands = %Texinfo::Convert::Text::formatting_misc_commands;

my $NO_NUMBER_FOOTNOTE_SYMBOL = '*';

my @informative_global_commands = ('paragraphindent', 'firstparagraphindent',
'frenchspacing', 'documentencoding', 'footnotestyle');

my %informative_commands;
foreach my $informative_command (@informative_global_commands, 
                                 'documentlanguage') {
  $informative_commands{$informative_command} = 1;
}

foreach my $kept_command(keys (%informative_commands),
  'verbatiminclude', 'insertcopying', 
  'listoffloats', 'printindex',
  'contents', 'shortcontents', 'summarycontents') {
  $formatting_misc_commands{$kept_command} = 1;
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
  $formatting_misc_commands{$def_command} = 1 if ($misc_commands{$def_command});
}

my %preformatted_context_commands = %preformatted_commands;
foreach my $preformatted_command ('verbatim', keys(%menu_commands)) {
  $preformatted_context_commands{$preformatted_command} = 1;
}

my %ignored_misc_commands;
foreach my $misc_command (keys(%misc_commands)) {
  $ignored_misc_commands{$misc_command} = 1 
    unless ($formatting_misc_commands{$misc_command});
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
  'documentdescription', 'titlepage', 'direntry') {
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
            'empty_spaces_before_argument', 'empty_spaces_before_paragraph',
            'empty_spaces_after_close_brace') {
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
  'frenchspacing'        => 'off',
  'paragraphindent'      => 3,
  'firstparagraphindent' => 'none',
  'ENABLE_ENCODING'      => 1,
  'footnotestyle'        => 'end',
  'fillcolumn'           => 72,
#  'documentencoding'     => 'us-ascii',
#  'encoding'             => 'us-ascii',
#  'output_encoding'      => 'us-ascii',
  'documentencoding'     => undef,
  'encoding'             => undef,
  'output_encoding'      => undef,
  'OUTFILE'              => undef,
  'SUBDIR'               => undef,
  'documentlanguage'     => undef,
  'NUMBER_FOOTNOTES'     => 1,
  'empty_lines_count'    => undef,
  'SPLIT_SIZE'           => 300000,
  'expanded_formats'     => undef,
  'include_directories'  => undef,
  'NUMBER_SECTIONS'      => 1,

  'DEBUG'                => 0,
  'TEST'                 => 0,
);

sub push_top_formatter($$)
{
  my $self = shift;
  my $top_context = shift;
  push @{$self->{'context'}}, $top_context;
  push @{$self->{'format_context'}}, {
                                     'cmdname' => '_top_format',
                                     'paragraph_count' => 0,
                                     'indent_level' => 0,
                                     'max' => $self->{'fillcolumn'}
                                   };
  push @{$self->{'formatters'}}, $self->new_formatter('line');
  $self->{'formatters'}->[-1]->{'_top_formatter'} = 1;
}

sub _informative_command($$)
{
  my $self = shift;
  my $root = shift;
  return if ($self->{'set'}->{$root->{'cmdname'}});

  if (exists($root->{'extra'}->{'text'})) {
    $self->{$root->{'cmdname'}} = $root->{'extra'}->{'text'};
  } elsif ($misc_commands{$root->{'cmdname'}} eq 'skipline') {
    $self->{$root->{'cmdname'}} = 1;
  } elsif ($root->{'extra'} and $root->{'extra'}->{'misc_args'} 
           and exists($root->{'extra'}->{'misc_args'}->[0])) {
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
      if (defined($root->{'extra'})
           and defined($root->{'extra'}->{'encoding_alias'})) {
        $self->{'encoding'} = $root->{'extra'}->{'encoding_alias'};
      } else {
        $self->{'encoding'} = undef;
      }
    }
  }
}

sub _set_global_multiple_commands($)
{
  my $converter = shift;

  foreach my $global_command (@informative_global_commands) {
    if (defined($converter->{'extra'}->{$global_command})
        and ref($converter->{'extra'}->{$global_command}) eq 'ARRAY') {
      my $root = $converter->{'extra'}->{$global_command}->[0];
      $converter->_informative_command($root);
    }
  }
}

sub _unset_global_multiple_commands($)
{
  my $converter = shift;

  foreach my $global_command (@informative_global_commands) {
    if (defined($converter->{'extra'}->{$global_command})
        and ref($converter->{'extra'}->{$global_command}) eq 'ARRAY') {
      my $root = $converter->{'extra'}->{$global_command}->[0];
      next if ($converter->{'set'}->{$root->{'cmdname'}} 
               or !exists($defaults{$root->{'cmdname'}}));
      $converter->{$root->{'cmdname'}} = $defaults{$root->{'cmdname'}};
    }
  }
}

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
  foreach my $key (keys(%defaults)) {
    $converter->{$key} = $defaults{$key};
  }
  if (defined($conf)) {
    if ($conf->{'parser'}) {
      $converter->{'parser'} = $conf->{'parser'};
      $converter->{'extra'} 
         = $converter->{'parser'}->global_commands_information();
      $converter->{'info'} = $converter->{'parser'}->global_informations();
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
      $converter->{'gettext'} = $converter->{'parser'}->{'gettext'};
      foreach my $global_command (@informative_global_commands) {
        if (defined($converter->{'extra'}->{$global_command})) {
          my $root = $converter->{'extra'}->{$global_command};
          #if (ref($root) eq 'ARRAY') {
          #  $root = $converter->{'extra'}->{$global_command}->[0];
          #}
          if (ref($root) ne 'ARRAY') {
            $converter->_informative_command($root);
          }
        }
      }
      delete $conf->{'parser'};
    }
    foreach my $key (keys(%$conf)) {
      if (!exists($defaults{$key})) {
        # many things may be passed down
        #warn "$key not a possible configuration in $name\n";
      } else {
        $converter->{$key} = $conf->{$key};
        $converter->{'set'}->{$key} = 1;
      }
    }
  }
  if (!defined($converter->{'expanded_formats'})) {
    if ($converter->{'parser'}) {
      $converter->{'expanded_formats'} = $converter->{'parser'}->{'expanded_formats'};
    } else {
      $converter->{'expanded_formats'} = [];
    }
  }
  if (!defined($converter->{'include_directories'})) {
    if ($converter->{'parser'}) {
      $converter->{'include_directories'} = $converter->{'parser'}->{'include_directories'};
    } else {
      $converter->{'include_directories'} = [ '.' ];
    }
  }

  $converter->{'context'} = [];
  $converter->{'format_context'} = [];
  $converter->push_top_formatter('_Root_context');
  push @{$converter->{'count_context'}}, {'lines' => 0, 'bytes' => 0,
                                     'locations' => []};

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
  $converter->Texinfo::Report::new();

  return $converter;
}

sub _convert_node($$)
{
  my $self = shift;
  my $node = shift;

  my $result = '';

  print STDERR "NEW NODE\n" if ($self->{'DEBUG'});
  die "Too much count_context\n" if (scalar(@{$self->{'count_context'}}) != 1);

  $self->{'count_context'}->[-1]->{'lines'} = 0;
  $result .= $self->_convert($node);

  print STDERR "END NODE ($self->{'count_context'}->[-1]->{'lines'},$self->{'count_context'}->[-1]->{'bytes'})\n" if ($self->{'DEBUG'});

  $result .= $self->_footnotes($node);

  print STDERR "AFTER FOOTNOTES ($self->{'count_context'}->[-1]->{'lines'},$self->{'count_context'}->[-1]->{'bytes'})\n" if ($self->{'DEBUG'});

  return $result;
}

sub convert($$)
{
  my $self = shift;
  my $root = shift;

  my $result = '';

  my $elements = Texinfo::Structuring::split_by_node($root);
  if (!defined($elements)) {
    $result = $self->_convert($root);
    my $footnotes = $self->_footnotes();
    $result .= $footnotes;
  } else {
    foreach my $node (@$elements) {
      my $node_text = $self->_convert_node($node);
      $result .= $node_text;
    }
  }

  return $result;
}

sub output($$)
{
  my $self = shift;
  my $root = shift;

  my $outfile = '-';
  if (defined($self->{'OUTFILE'})) {
    $outfile = $self->{'OUTFILE'};
  }
  
  my $fh = $self->Texinfo::Common::open_out ($outfile,
                                             $self->{'encoding'});
  if (!$fh) {
    $self->document_error(sprintf($self->__("Could not open %s for writing: $!"),
                                  $outfile));
    return undef;
  }
  my $result = $self->convert($root);
  if (defined($result)) {
    print $fh $result;
    return $self;
  } else {
    return undef;
  }
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

sub _process_text($$$)
{
  my $self = shift;
  my $command = shift;
  my $context = shift;
  my $text = $command->{'text'};

  $text = uc($text) if ($self->{'formatters'}->[-1]->{'upper_case'});
  if ($self->{'ENABLE_ENCODING'} and $self->{'documentencoding'} 
      and $self->{'documentencoding'} eq 'utf-8') {
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
         'indent_level'        => $self->{'format_context'}->[-1]->{'indent_level'}, 
  };
  $container_conf->{'frenchspacing'} = 1 if ($self->{'frenchspacing'} eq 'on');
  $container_conf->{'counter'} = $self->{'format_context'}->[-1]->{'counter'}
    if (defined($self->{'format_context'}->[-1]->{'counter'}));
  $container_conf->{'DEBUG'} = 1 if ($self->{'DEBUG'});
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
  my $formatter = $self->new_formatter('line', $conf);
  push @{$self->{'formatters'}}, $formatter;
  my $text = $self->_convert($converted);
  $text .= $self->_count_added($formatter->{'container'},
                               $formatter->{'container'}->end());
  pop @{$self->{'formatters'}};
  return $text;
}

sub convert_unfilled($$;$)
{
  my $self = shift;
  my $converted = shift;
  my $conf = shift;
  my $formatter = $self->new_formatter('unfilled', $conf);
  $formatter->{'code'} = 1;
  push @{$self->{'formatters'}}, $formatter;
  my $result = $self->_convert($converted);
  $result .= $self->_count_added($formatter->{'container'},
                                 $formatter->{'container'}->end());
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
  #  if ($self->{'DEBUG'});
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

sub count_bytes($$) 
{
  my $self = shift;
  my $string = shift;

  if ($self->{'output_encoding'} and $self->{'output_encoding'} ne 'us-ascii') {
    return length(Encode::encode($self->{'output_encoding'}, $string));
  } else {
    return length($string);
  }
}

sub _add_text_count($$)
{
  my $self = shift;
  my $text = shift;
  $self->{'count_context'}->[-1]->{'bytes'} += $self->count_bytes($text);
}

sub _add_lines_count($$)
{
  my $self = shift;
  my $lines_count = shift;
  $self->{'count_context'}->[-1]->{'lines'} += $lines_count;
}

sub _add_location($$)
{
  my $self = shift;
  my $root = shift;
  my $location = { 'lines' => $self->{'count_context'}->[-1]->{'lines'} };
  push @{$self->{'count_context'}->[-1]->{'locations'}}, $location;
  if (!($root->{'extra'} and $root->{'extra'}->{'index_entry'})) {
    $location->{'bytes'}
      = $self->{'count_context'}->[-1]->{'bytes'};
    $location->{'root'} = $root;
  } else {
    $location->{'index_entry'} = $root;
  }
  return $location;
}

sub _count_added($$$)
{
  my $self = shift;
  my $container = shift;
  my $text = shift;

  $self->_add_lines_count($container->end_line_count());
  $self->_add_text_count($text);
  return $text;
}

sub _update_locations_counts($$)
{
  my $self = shift;
  my $locations = shift;
  foreach my $location (@$locations) {
    $location->{'bytes'} += $self->{'count_context'}->[-1]->{'bytes'}
       if (defined($location->{'bytes'}));
    $location->{'lines'} += $self->{'count_context'}->[-1]->{'lines'}
      if (defined($location->{'lines'}));
  }
}

sub _add_newline_if_needed($) {
  my $self = shift;
  if (defined($self->{'empty_lines_count'}) 
       and $self->{'empty_lines_count'} == 0) {
    $self->_add_text_count("\n");
    $self->_add_lines_count(1);
    $self->{'empty_lines_count'} = 1;
    return "\n";
  }
  return '';
}

my $footnote_indent = 3;
sub _footnotes($$)
{
  my $self = shift;
  my $element = shift;

  my $result = '';
  if (scalar(@{$self->{'pending_footnotes'}})) {
    $result .= $self->_add_newline_if_needed();
    if ($self->{'footnotestyle'} eq 'end' or !defined($element)) {
      my $footnotes_header = "   ---------- Footnotes ----------\n\n";
      $result .= $footnotes_header;
      $self->_add_text_count($footnotes_header);
      $self->_add_lines_count(2);
      $self->{'empty_lines_count'} = 1;
    } else {

      my $footnotes_node = {
        'cmdname' => 'node',
        'node_up' => $element->{'extra'}->{'node'},
        'extra' => {'node_content' => 
             [@{$element->{'extra'}->{'node'}->{'extra'}->{'node_content'}},
                                     {'text' => '-Footnotes'}]}
      };
      $result .= $self->_node($footnotes_node);
      $self->{'count_context'}->[-1]->{'lines'} = 0;
    }
    while (@{$self->{'pending_footnotes'}}) {
      my $footnote = shift (@{$self->{'pending_footnotes'}});

      $self->_add_location({'cmdname' => 'anchor',
                      'extra' => {'node_content' => 
               [@{$element->{'extra'}->{'node'}->{'extra'}->{'node_content'}},
                              {'text' => "-Footnote-$footnote->{'number'}"}]}
                     }) if ($element);
      # this pushes on 'context', 'format_context' and 'formatters'
      $self->push_top_formatter('footnote');
      my $footnote_text = ' ' x $footnote_indent 
               . "($footnote->{'number'}) ";
      $result .= $footnote_text;
      $self->{'format_context'}->[-1]->{'counter'} += 
         Texinfo::Convert::Unicode::string_width($footnote_text);
      $self->_add_text_count($footnote_text);

      $result .= $self->_convert($footnote->{'root'}->{'args'}->[0]); 
      $result .= $self->_add_newline_if_needed();
      
      pop @{$self->{'context'}};
      pop @{$self->{'format_context'}};
      pop @{$self->{'formatters'}};
    }
  }
  $self->{'footnote_index'} = 0;

  return $result;
}

sub in_flushright($)
{
  my $self = shift;
  my $index = -1;
  $index--
    while (!$flush_commands{$self->{'format_context'}->[$index]->{'cmdname'}});
  if ($self->{'format_context'}->[$index]->{'cmdname'} eq 'flushright') {
    return 1;
  } else {
    return 0;
  }
}

sub flushright_index ($)
{
  my $self = shift;
  my $index = -1;
  $index--
    while (!$flush_commands{$self->{'format_context'}->[$index]->{'cmdname'}});
  return $index;
}

sub _align_lines($$$$$)
{
  my $self = shift;
  my $text = shift;
  my $max_column = shift;
  my $direction = shift;
  my $locations = shift;

  my $result = '';

  my $updated_locations = {};
  if ($locations and @$locations) {
    foreach my $location (@$locations) {
      next unless (defined($location->{'bytes'}));
      #print STDERR "L anchor $location->{'root'}->{'extra'}->{'normalized'}: $location->{'lines'} ($location->{'bytes'})\n";
      push @{$updated_locations->{$location->{'lines'}}}, $location;
    }
  }

  my $bytes_count = 0;
  my $delta_bytes = 0;
  my $line_index = 0;
  foreach my $line (split /^/, $text) {
    my $line_bytes_begin = 0;
    my $line_bytes_end = 0;
    my $chomped = chomp($line);
    # for debugging.
    my $orig_line = $line;
    $line_bytes_end -= $self->count_bytes($chomped);
    $line =~ s/^(\s*)//;
    $line_bytes_begin -= $self->count_bytes($1);
    $line =~ s/(\s*)$//;
    $line_bytes_end -= $self->count_bytes($1);
    my $line_width = Texinfo::Convert::Unicode::string_width($line);
    if ($line_width == 0) {
      $result .= "\n";
      $line_bytes_end += $self->count_bytes("\n");
      $bytes_count += $self->count_bytes("\n");
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
      $line_bytes_begin += $self->count_bytes(' ' x$spaces_prepended);
      $line_bytes_end += $self->count_bytes("\n");
      if ($updated_locations->{$line_index}) {
        foreach my $location (@{$updated_locations->{$line_index}}) {
          $location->{'bytes'} += $line_bytes_begin + $delta_bytes;
          #print STDERR "UPDATE ALIGN: $location->{'root'}->{'extra'}->{'normalized'}: ($location->{'bytes'})\n";
        }
      }
      $bytes_count += $line_bytes_begin + $line_bytes_end 
                      + $self->count_bytes($line);
    }
    $delta_bytes += $line_bytes_begin + $line_bytes_end;
    #print STDERR "ALIGN $orig_line ($line_index. lbb $line_bytes_begin, lbe $line_bytes_end, delta $delta_bytes, bytes_count $bytes_count)\n";
    $line_index++;
  }
  return ($result, $bytes_count);
}

sub _align_environment($$$$)
{
  my $self = shift;
  my $result = shift;
  my $max = shift;
  my $align = shift;

  my $counts = pop @{$self->{'count_context'}};
  my $bytes_count;
  ($result, $bytes_count) = $self->_align_lines($result, $max,
                      $align, $counts->{'locations'});
  $self->_update_locations_counts($counts->{'locations'});
  $self->{'count_context'}->[-1]->{'bytes'} += $bytes_count;
  $self->{'count_context'}->[-1]->{'lines'} += $counts->{'lines'};
  push @{$self->{'count_context'}->[-1]->{'locations'}},
                       @{$counts->{'locations'}};
  return $result;
}

sub _contents($$$)
{
  my $self = shift;
  my $section_root = shift;
  my $contents_or_shortcontents = shift;

  my $contents = 1 if ($contents_or_shortcontents eq 'contents');

  my $section = $section_root->{'section_childs'}->[0];
  my $root_level = $section->{'level'};

  # FIXME return bytes count?
  my $result = '';
  my $lines_count = 0;
  while ($section and $section ne $section_root) {
    push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0};
    my ($section_title) = $self->convert_line({'contents'
                => $section->{'extra'}->{'misc_content'}});
    pop @{$self->{'count_context'}};
    my $text = Texinfo::Convert::Text::numbered_heading($section, 
                            $section_title, $self->{'NUMBER_SECTIONS'})."\n";
    $result .= (' ' x (2*($section->{'level'} - ($root_level+1)))) . $text;
    $lines_count++;
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
  return ($result, $lines_count);
}

sub _menu($$)
{
  my $self = shift;
  my $menu_command = shift;

  if ($menu_command->{'cmdname'} eq 'menu') {
    my $result = "* Menu:\n\n";
    $self->_add_text_count($result);
    $self->_add_lines_count(2);
    return $result;
  } else {
    return '';
  }
}

sub _printindex($$)
{
  my $self = shift;
  my $printindex = shift;
  return ('');
}

sub _node($$)
{
  my $self = shift;
  my $node = shift;

  return '';
}

sub _anchor($$)
{
  my $self = shift;
  my $anchor = shift;

  # 'lines_count' is in fact only needed when in @flush and @multitable
  $self->_add_location($anchor);
  return '';
}

my $listoffloat_entry_length = 41;
my $listoffloat_append = '...';

sub ensure_end_of_line($$)
{
  my $self = shift;
  my $text = shift;
  my $chomped = chomp ($text);
  if ($chomped) {
    $self->{'count_context'}->[-1]->{'bytes'} -= $self->count_bytes($chomped);
    $self->{'count_context'}->[-1]->{'lines'} -= 1;
  }
  $self->{'empty_lines_count'} = 0 unless ($text eq '');
  $text .= "\n";
  $self->_add_text_count("\n");
  $self->_add_lines_count(1);
  return $text;
}

sub _image_text($$$)
{
  my $self = shift;
  my $root = shift;
  my $basefile = shift;

  my $txt_file = $self->Texinfo::Parser::_locate_include_file ($basefile.'.txt');
  if (!defined($txt_file)) {
    $self->line_warn(sprintf($self->__("Cannot find \@image file `%s.txt'"), $basefile), $root->{'line_nr'});
  } else {
    if (open (TXT, $txt_file)) {
    # FIXME encoding
    # my $in_encoding = get_conf('IN_ENCODING');
    # binmode(TXT, ":encoding($in_encoding)");
      my $result = '';
      while (<TXT>) {
        $result .= $_;
      }
      # remove last end of line
      chomp ($result);
      close (TXT);
      return $result;
    } else {
      $self->line_warn(sprintf($self->__("\@image file `%s' unreadable: %s"), $txt_file, $!), $root->{'line_nr'});
    }
  }
  return undef;
}

sub _image($$)
{
  my $self = shift;
  my $root = shift;

  if (defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
    my $basefile = Texinfo::Convert::Text::convert(
     {'contents' => $root->{'extra'}->{'brace_command_contents'}->[0]});
    my $result = $self->_image_text($root, $basefile);
    if (defined($result)) {
      if (!$self->{'formatters'}->[-1]->{'_top_formatter'}) {
        $result = '['.$result.']';
      }
      return $result;
    }
  }
  return '';
}

# on top, the converter object which holds some global information
# 
# context (for footnotes, multitable cells):
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
  if ($self->{'DEBUG'}) {
    my $is_top_formatter = 0;
    $is_top_formatter = 1 if ($formatter->{'_top_formatter'});
    my $empty_lines_count = '';
    $empty_lines_count = $self->{'empty_lines_count'} if defined($self->{'empty_lines_count'});
    print STDERR "ROOT (@{$self->{'context'}}|@{$self->{'format_context'}},$empty_lines_count|$is_top_formatter)";
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

  # NUMBER_FOOTNOTES SPLIT_SIZE IN_ENCODING FILLCOLUMN ENABLE_ENCODING
  # OUT_ENCODING ENCODING_NAME

  if (($root->{'type'} and $self->{'ignored_types'}->{$root->{'type'}})
       or ($root->{'cmdname'} 
            and $self->{'ignored_commands'}->{$root->{'cmdname'}})) {
    print STDERR "IGNORED\n" if ($self->{'DEBUG'});
    return '';
  }
  my $result = '';


  if (defined($root->{'text'})) {
    if (!$formatter->{'_top_formatter'}) {
      $result = $self->_count_added($formatter->{'container'},
                    $formatter->{'container'}->add_text(
                       $self->_process_text($root, $formatter)));
      return $result;
    # the following is only possible if paragraphindent is set to asis
    } elsif ($root->{'type'} and $root->{'type'} eq 'empty_spaces_before_paragraph') {
      $self->_add_text_count($root->{'text'});
      return $root->{'text'};
    # ignore text outside of any format, but warn if ignored text not empty
    } elsif ($root->{'text'} =~ /\S/) {
      warn "BUG: ignored text not empty `$root->{'text'}'\n";
      return '';
    }
  }

  if ($root->{'extra'} and $root->{'extra'}->{'invalid_nesting'}) {
    print STDERR "INVALID_NESTING\n" if ($self->{'DEBUG'});
    return '';
  }

  my $preformatted;
  my $cell;
  if ($root->{'cmdname'}) {
    my $unknown_command;
    my $command = $root->{'cmdname'};
    if (defined($text_no_brace_commands{$command})) {
      if ($command eq ':') {
        $formatter->{'container'}->inhibit_end_sentence();
        return '';
      } elsif ($command eq '*') {
        $result = $self->_count_added($formatter->{'container'},
                              $formatter->{'container'}->add_pending_word());
        $result .= $self->_count_added($formatter->{'container'},
                              $formatter->{'container'}->end_line());
      } elsif ($command eq '.' or $command eq '?' or $command eq '!') {
        $result .= $self->_count_added($formatter->{'container'},
            $formatter->{'container'}->add_next($command, undef, 1));
      } elsif ($command eq ' ' or $command eq "\n" or $command eq "\t") {
        $result .= $self->_count_added($formatter->{'container'}, 
            $formatter->{'container'}->add_next($text_no_brace_commands{$command}));
      } else {
        $result .= $self->_count_added($formatter->{'container'}, 
            $formatter->{'container'}->add_text($text_no_brace_commands{$command}));
      }
      return $result;
    } elsif (defined($text_brace_no_arg_commands{$root->{'cmdname'}})) {
      my $text = Texinfo::Convert::Text::brace_no_arg_command($root, 
                                                    $self->{'encoding'});
      if ($command eq 'enddots') {
        $result .= $self->_count_added($formatter->{'container'},
                    $formatter->{'container'}->add_next($text, undef, 1));
      } else {
        $result .= $self->_count_added($formatter->{'container'}, 
                       $formatter->{'container'}->add_text($text)); 
        if ($command eq 'dots') {
          $formatter->{'container'}->inhibit_end_sentence();
        }
      }
      return $result;
    # commands with braces
    } elsif ($accent_commands{$root->{'cmdname'}}) {
      $result .= $self->_count_added($formatter->{'container'},
         $formatter->{'container'}->add_text(
          Texinfo::Convert::Text::text_accents($root, $self->{'encoding'})));
      return $result;
    } elsif ($style_map{$command} 
         or ($root->{'type'} and $root->{'type'} eq 'definfoenclose_command')) {
      if ($code_style_commands{$command}) {
        $formatter->{'code'}++;
        push @{$formatter->{'frenchspacing_stack'}}, 'on';
        $formatter->{'container'}->set_space_protection(undef,
          undef,undef,1);
      }
      $formatter->{'upper_case'}++ if ($upper_case_commands{$command});
      if ($command eq 'w') {
        $formatter->{'w'}++;
        $formatter->{'container'}->set_space_protection(1,1)
          if ($formatter->{'w'} == 1);
      }
      my ($text_before, $text_after);
      if ($root->{'type'} and $root->{'type'} eq 'definfoenclose_command') {
        $text_before = $root->{'extra'}->{'begin'};
        $text_after = $root->{'extra'}->{'end'};
      } else {
        $text_before = $style_map{$command}->[0];
        $text_after = $style_map{$command}->[1];
      }
      $result = $self->_count_added($formatter->{'container'},
               $formatter->{'container'}->add_text($text_before));
      if ($root->{'args'}) {
        $result .= $self->_convert($root->{'args'}->[0]);

      }
      $result .= $self->_count_added($formatter->{'container'},
               $formatter->{'container'}->add_text($text_after));
      if ($command eq 'w') {
        $formatter->{'w'}--;
        $formatter->{'container'}->set_space_protection(0,0)
          if ($formatter->{'w'} == 0);
      }
      if ($code_style_commands{$command}) {
        $formatter->{'code'}--;
        pop @{$formatter->{'frenchspacing_stack'}};
        my $frenchspacing = 0;
        $frenchspacing = 1 if ($formatter->{'frenchspacing_stack'}->[-1] eq 'on');
        $formatter->{'container'}->set_space_protection(undef,
          undef, undef, $frenchspacing);
      }
      $formatter->{'upper_case'}-- if ($upper_case_commands{$command});
      return $result;
    } elsif ($root->{'cmdname'} eq 'image') {
      # FIXME count lines
      $result = $self->_image($root);
      $self->_add_text_count($result);
      return $result;
    } elsif ($root->{'cmdname'} eq 'email') {
      # nothing is output for email, instead the command is substituted.
      my @email_contents;
      if ($root->{'extra'} and $root->{'extra'}->{'brace_command_contents'}) {
        my $name;
        my $email;
        if (scalar (@{$root->{'extra'}->{'brace_command_contents'}}) == 2
            and defined($root->{'extra'}->{'brace_command_contents'}->[-1])) {
          $name = $root->{'extra'}->{'brace_command_contents'}->[1];
        }
        if (defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
          $email = $root->{'extra'}->{'brace_command_contents'}->[0];
        }
        my $prepended;
        if ($name and $email) {
          $prepended = $self->gdt('{name} @indicateurl{{email}}', 
                           {'name' => $name, 'email' => $email});
        } elsif ($email) {
          $prepended = $self->gdt('@indicateurl{{email}}', 
                           {'email' => $email});
        } elsif ($name) {
          $prepended = {'contents' => $name};
        } else {
          return '';
        }
        unshift @{$self->{'current_contents'}->[-1]}, $prepended;
      }
      return '';
    } elsif ($command eq 'uref' or $command eq 'url') {
      if ($root->{'extra'} and $root->{'extra'}->{'brace_command_contents'}) {
        if (scalar(@{$root->{'extra'}->{'brace_command_contents'}}) == 3
             and defined($root->{'extra'}->{'brace_command_contents'}->[2])) {
          unshift @{$self->{'current_contents'}->[-1]}, 
            {'contents' => $root->{'extra'}->{'brace_command_contents'}->[2]};
        } elsif (defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
          # no mangling of --- and similar in url.
          my $url = {'type' => 'code',
              'contents' => $root->{'extra'}->{'brace_command_contents'}->[0]};
          if (scalar(@{$root->{'extra'}->{'brace_command_contents'}}) == 2
             and defined($root->{'extra'}->{'brace_command_contents'}->[1])) {
            my $prepended = $self->gdt('{text} ({url})', 
                 {'text' => $root->{'extra'}->{'brace_command_contents'}->[1],
                  'url' => $url });
            unshift @{$self->{'current_contents'}->[-1]}, $prepended;
          } else {
            my $prepended = $self->gdt('@code{{url}}', 
                                        {'url' => $url});
            unshift @{$self->{'current_contents'}->[-1]}, $prepended
          }
        }
      }
      return '';
    } elsif ($command eq 'footnote') {
      my $multiple_pass = 0;
      foreach my $context (reverse (@{$self->{'context'}})) {
        if ($context eq 'listoffloats') {
          $multiple_pass = 1;
          last;
        }
      }
      my $footnote_number;
      if ($self->{'NUMBER_FOOTNOTES'}) {
        $self->{'footnote_index'}++ unless ($multiple_pass);
        $footnote_number = $self->{'footnote_index'};
      } else {
        $footnote_number = $NO_NUMBER_FOOTNOTE_SYMBOL;
      }
      push @{$self->{'pending_footnotes'}}, {'root' => $root, 
                                             'number' => $footnote_number}
          unless ($multiple_pass);
      return $self->_count_added($formatter->{'container'},
               $formatter->{'container'}->add_text("($footnote_number)"));
    } elsif ($command eq 'anchor') {
      $result = $self->_count_added($formatter->{'container'},
                   $formatter->{'container'}->add_pending_word());
      $result .= $self->_anchor($root);
      return $result;
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
      return '';
    } elsif ($explained_commands{$command}) {
      if ($root->{'extra'} and $root->{'extra'}->{'brace_command_contents'}
          and defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
        # in abbr spaces never end a sentence.
        my $argument;
        if ($command eq 'abbr') {
          $argument = {'type' => 'frenchspacing',
                     'contents' => $root->{'extra'}->{'brace_command_contents'}->[0]};
        } else {
          $argument = {'contents' => $root->{'extra'}->{'brace_command_contents'}->[0]};
        }
        if (scalar (@{$root->{'extra'}->{'brace_command_contents'}}) == 2
           and defined($root->{'extra'}->{'brace_command_contents'}->[-1])) {
          my $prepended = $self->gdt('{abbr_or_acronym} ({explanation})', 
                           {'abbr_or_acronym' => $argument, 
                            'explanation' => 
                             $root->{'extra'}->{'brace_command_contents'}->[-1]});
          #print STDERR "".Data::Dumper->Dump([$prepended])."\n";
          unshift @{$self->{'current_contents'}->[-1]}, $prepended;
        } else {
          unshift @{$self->{'current_contents'}->[-1]}, $argument;
        }
      }
      return '';
    } elsif ($command eq 'math') {
      push @{$self->{'context'}}, 'math';
      if ($root->{'args'}) {
        $result .= $self->_convert($root->{'args'}->[0]);
      }
      pop @{$self->{'context'}};
      return $result;
    } elsif ($command eq 'titlefont') {
      push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0};
      ($result) = $self->convert_line ($root->{'args'}->[0]);
      pop @{$self->{'count_context'}};
      $result = Texinfo::Convert::Text::heading({'level' => 0, 
           'cmdname' => 'titlefont'}, $result, $self->{'NUMBER_SECTIONS'});
      $self->{'empty_lines_count'} = 0 unless ($result eq '');
      $self->_add_text_count($result);
      $self->_add_lines_count(2);
      return $result;
    } elsif ($command eq 'value') {
      my $expansion = $self->gdt('@{No value for `{value}\'@}', 
                                    {'value' => $root->{'type'}});
        unshift @{$self->{'current_contents'}->[-1]}, $expansion;
      return '';
    } elsif ($root->{'args'} and $root->{'args'}->[0] 
             and $root->{'args'}->[0]->{'type'}
             and $root->{'args'}->[0]->{'type'} eq 'brace_command_arg') {
      warn "Unhandled command with braces $root->{'cmdname'}\n";
      $result .= "!!!!! Unhandled command with braces $root->{'cmdname'} !!!!!\n";
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
               'max' => $self->{'format_context'}->[-1]->{'max'},
             };
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
          my $prepended = $self->gdt('@b{{quotation_arg}:} ', 
             {'quotation_arg' => $root->{'extra'}->{'block_command_line_contents'}->[0]});
          #print STDERR Data::Dumper->Dump([$prepended]);
          $result .= $self->convert_line($prepended);
          $self->{'format_context'}->[-1]->{'counter'} += 
             Texinfo::Convert::Unicode::string_width($result);
          $self->{'empty_lines_count'} = 0 unless ($result eq '');
        }
      } elsif ($menu_commands{$root->{'cmdname'}}) {
        $result .= $self->_menu($root);
      } elsif ($root->{'cmdname'} eq 'multitable') {
        my $columnsize;
        if ($root->{'extra'}->{'columnfractions'}) {
          foreach my $fraction (@{$root->{'extra'}->{'columnfractions'}}) {
            push @$columnsize, int($fraction * $self->{'format_context'}->[-1]->{'max'} +0.5);
          }
        } elsif ($root->{'extra'}->{'prototypes'}) {
          foreach my $prototype (@{$root->{'extra'}->{'prototypes'}}) {
            push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0};
            my ($formatted_prototype) = $self->convert_line($prototype, 
                                                        {'indent_length' => 0});
            pop @{$self->{'count_context'}};
            print STDERR " MULTITABLE_PROTO {$formatted_prototype}\n" 
              if ($self->{'DEBUG'});
            push @$columnsize, 
                 2+Texinfo::Convert::Unicode::string_width($formatted_prototype);
          }
        }
        print STDERR "MULTITABLE_SIZES @$columnsize\n" if ($self->{'DEBUG'});
        $self->{'format_context'}->[-1]->{'columns_size'} = $columnsize;
        $self->{'format_context'}->[-1]->{'row_empty_lines_count'} 
          = $self->{'empty_lines_count'};
      } elsif ($root->{'cmdname'} eq 'float' and $root->{'extra'}
               and $root->{'extra'}->{'normalized'}) {
        $result .= $self->_anchor($root);
      }
    } elsif ($root->{'cmdname'} eq 'node') {
      $result .= $self->_node($root);
      $self->{'format_context'}->[-1]->{'paragraph_count'} = 0;
    } elsif ($sectioning_commands{$root->{'cmdname'}}) {
      if ($self->{'setcontentsaftertitlepage'} 
           and $root_commands{$root->{'cmdname'}}) {
        my ($contents, $lines_count) 
                = $self->_contents($self->{'structuring'}->{'sectioning_root'}, 
                                  'contents');
        $contents .= "\n";
        $self->{'empty_lines_count'} = 1;
        $self->{'setcontentsaftertitlepage'} = 0;
        $self->_add_text_count($contents);
        $self->_add_lines_count($lines_count+1);
        $result .= $contents;
      } 
      if ($self->{'setshortcontentsaftertitlepage'} 
            and $root_commands{$root->{'cmdname'}}) {
        my ($contents, $lines_count) 
                = $self->_contents($self->{'structuring'}->{'sectioning_root'}, 
                              'shortcontents');
        $contents .= "\n";
        $self->{'empty_lines_count'} = 1;
        $self->{'setshortcontentsaftertitlepage'} = 0;
        $self->_add_text_count($contents);
        $self->_add_lines_count($lines_count+1);
        $result .= $contents;
      }
      if ($root->{'args'}) {
        push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0};
        my ($heading) = $self->convert_line($root->{'args'}->[0]);
        pop @{$self->{'count_context'}};
        my $heading_underlined = 
             Texinfo::Convert::Text::heading ($root, $heading, 
                                              $self->{'NUMBER_SECTIONS'});
        $result .= $self->_add_newline_if_needed();
        $self->{'empty_lines_count'} = 0 unless ($heading_underlined eq '');
        $self->_add_text_count($heading_underlined);
        # FIXME œ@* and @c?
        $self->_add_lines_count(2);
        $result .= $heading_underlined;
      }
      $self->{'format_context'}->[-1]->{'paragraph_count'} = 0;
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
                  {'indent_level'
                    => $self->{'format_context'}->[-1]->{'indent_level'} -1});
      $result = $self->ensure_end_of_line($result);
      
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
        $result = $self->_count_added($line->{'container'},
            $line->{'container'}->add_next(
               Texinfo::Convert::Text::enumerate_item_representation(
                 $root->{'parent'}->{'extra'}->{'enumerate_specification'},
                 $root->{'extra'}->{'item_number'}) . '. '));
      } elsif ($root->{'parent'}->{'extra'}->{'block_command_line_contents'}) {
        # FIXME convert_line and no array of contents?
        $result = $self->_convert(
          {'contents' => 
             [@{$root->{'parent'}->{'extra'}->{'block_command_line_contents'}->[0]},
              { 'text' => ' ' }]
          });
      }
      $result .= $self->_count_added($line->{'container'}, 
                                     $line->{'container'}->end());
      print STDERR "  $root->{'parent'}->{'cmdname'}($root->{'extra'}->{'item_number'}) -> |$result|\n" 
         if ($self->{'DEBUG'});
      pop @{$self->{'formatters'}};
      $self->{'format_context'}->[-1]->{'counter'} += 
         Texinfo::Convert::Unicode::string_width($result);
      $self->{'empty_lines_count'} = 0 unless ($result eq '');
    # open a multitable cell
    } elsif ($root->{'cmdname'} eq 'headitem' or $root->{'cmdname'} eq 'item'
             or $root->{'cmdname'} eq 'tab') {
      my $cell_width = $self->{'format_context'}->[-1]->{'columns_size'}->[$root->{'extra'}->{'cell_number'}-1];
      $self->{'format_context'}->[-1]->{'item_command'} = $root->{'cmdname'}
        if ($root->{'cmdname'} ne 'tab');
      print STDERR "CELL [$root->{'extra'}->{'cell_number'}]: \@$root->{'cmdname'}. Width: $cell_width\n"
            if ($self->{'DEBUG'});
      die if (!defined($cell_width));
      $self->{'empty_lines_count'} 
         = $self->{'format_context'}->[-1]->{'row_empty_lines_count'};

      push @{$self->{'format_context'}},
           { 'cmdname' => $root->{'cmdname'},
             'paragraph_count' => 0,
             'indent_level' => 0,
             'max' => $cell_width - 2 };
      push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0,
                                                   'locations' => []};
      if ($self->{'context'}->[-1] eq 'preformatted') {
        $preformatted = $self->new_formatter('unfilled');
        push @{$self->{'formatters'}}, $preformatted;
      }
      $cell = 1;
    } elsif ($root->{'cmdname'} eq 'center') {
      #my ($counts, $new_locations);
      push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0, 
                                                   'locations' => []};
      $result = $self->convert_line (
                       {'contents' => $root->{'extra'}->{'misc_content'}},
                       {'indent_length' => 0});
      $result = $self->ensure_end_of_line($result);

      $result = $self->_align_environment ($result, 
             $self->{'format_context'}->[-1]->{'max'}, 'center'); 

      $self->{'empty_lines_count'} = 0 unless ($result eq '');
      $self->{'format_context'}->[-1]->{'paragraph_count'}++;
      return $result;
    } elsif ($root->{'cmdname'} eq 'exdent') {
      $result = $self->convert_line ({'contents' => $root->{'extra'}->{'misc_content'}},
         {'indent_level' 
          => $self->{'format_context'}->[-1]->{'indent_level'} -1});
      $result = $self->ensure_end_of_line ($result);
      return $result;
    } elsif ($root->{'cmdname'} eq 'verbatiminclude') {
      my $expansion = $self->Texinfo::Parser::expand_verbatiminclude($root);
      unshift @{$self->{'current_contents'}->[-1]}, $expansion
        if ($expansion);
      return '';
    } elsif ($root->{'cmdname'} eq 'insertcopying') {
      if ($self->{'extra'} and $self->{'extra'}->{'copying'}) {
        unshift @{$self->{'current_contents'}->[-1]}, 
           {'contents' => $self->{'extra'}->{'copying'}->{'contents'}};
      }
      return '';
    } elsif ($root->{'cmdname'} eq 'printindex') {
      $result = $self->_printindex($root);
      return $result;
    } elsif ($root->{'cmdname'} eq 'listoffloats') {
      if ($root->{'extra'} and $root->{'extra'}->{'type'}
          and defined($root->{'extra'}->{'type'}->{'normalized'}) 
          and $self->{'floats'} 
          and $self->{'floats'}->{$root->{'extra'}->{'type'}->{'normalized'}}
          and @{$self->{'floats'}->{$root->{'extra'}->{'type'}->{'normalized'}}}) {
        push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0};
        my $lines_count = 0;
        if (!$self->{'empty_lines_count'}) {
          $result .= "\n";
          $lines_count++;
        }
        $result .= "* Menu:\n\n";
        $lines_count += 2;
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
          my ($float_line) = $self->convert_line($float_entry);
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
            push @{$self->{'context'}}, 'listoffloats';
            # FIXME should there be some indentation?
            my ($caption_text) = $self->_convert({'contents' => $caption->{'args'}->[0]->{'contents'},
                        'type' => $caption->{'cmdname'}.'_listoffloats'});
            pop @{$self->{'context'}};
            while ($caption_text =~ s/^\s*(\p{Unicode::EastAsianWidth::InFullwidth}\s*|\S+\s*)//) {
              my $new_word = $1;
              $new_word =~ s/\n//g;
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
          $lines_count++;
        }
        $result .= "\n";
        $lines_count++;
        $self->_add_lines_count($lines_count);
        $self->{'empty_lines_count'} = 1;
        pop @{$self->{'count_context'}};
      }
      $self->{'format_context'}->[-1]->{'paragraph_count'}++;
      $self->_add_text_count($result);
      return $result;
    } elsif ($root->{'cmdname'} eq 'sp') {
      if ($root->{'extra'}->{'misc_args'}->[0]) {
        # this useless copy avoids perl changing the type to integer!
        my $sp_nr = $root->{'extra'}->{'misc_args'}->[0];
        $result = "\n" x $sp_nr;
        $self->_add_text_count($result);
        $self->{'empty_lines_count'} += $sp_nr;
        $self->_add_lines_count($sp_nr);
      }
      return $result;
    } elsif ($root->{'cmdname'} eq 'contents') {
      if (!defined($self->{'setcontentsaftertitlepage'})
           and $self->{'structuring'}
           and $self->{'structuring'}->{'sectioning_root'}) {
        my $lines_count;
        ($result, $lines_count) 
            = $self->_contents($self->{'structuring'}->{'sectioning_root'}, 
                              'contents');
        $self->_add_lines_count($lines_count);
        $self->_add_text_count($result);
      }
      return $result;
    } elsif ($root->{'cmdname'} eq 'shortcontents' 
               or $root->{'cmdname'} eq 'summarycontents') {
      if (!defined($self->{'setshortcontentsaftertitlepage'})
            and $self->{'structuring'}
            and $self->{'structuring'}->{'sectioning_root'}) {
        my $lines_count;
        ($result, $lines_count) 
              = $self->_contents($self->{'structuring'}->{'sectioning_root'}, 
                              'shortcontents');
        $self->_add_lines_count($lines_count);
        $self->_add_text_count($result);
      }
      return $result;
    # all the @-commands that have an information for the formatting, like
    # @paragraphindent, @frenchspacing...
    } elsif ($informative_commands{$root->{'cmdname'}}) {
      $self->_informative_command($root);
      return '';
    } else {
      $unknown_command = 1;
    }
    #} els
    if ($unknown_command and !($root->{'extra'} 
                               and $root->{'extra'}->{'index_entry'})) {
      warn "Unhandled $root->{'cmdname'}\n";
      $result .= "!!!!!!!!! Unhandled $root->{'cmdname'} !!!!!!!!!\n";
    }
    
  }
  if ($root->{'extra'} and $root->{'extra'}->{'index_entry'}) {
    my $location = $self->_add_location($root);
    $self->{'index_entries_line_location'}->{$root} = $location;
    print STDERR "INDEX ENTRY lines_count $location->{'lines'}, index_entry $location->{'index_entry'}\n" 
       if ($self->{'DEBUG'});
  }

  # open 'type' constructs.
  my $paragraph;
  if ($root->{'type'}) {
    if ($root->{'type'} eq 'paragraph') {
      $self->{'empty_lines_count'} = 0;
      my $conf;
      # indent. Not first paragraph.
      if ($self->{'DEBUG'}) {
        print STDERR "OPEN PARA ($self->{'format_context'}->[-1]->{'cmdname'}) "
           . "cnt ". 
            (defined($self->{'format_context'}->[-1]->{'counter'}) ? 
             $self->{'format_context'}->[-1]->{'counter'} : 'UNDEF'). ' '
           . "para cnt $self->{'format_context'}->[-1]->{'paragraph_count'} "
           . "fparaindent $self->{'firstparagraphindent'} "
           . "paraindent $self->{'paragraphindent'}\n";
      }
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
      if ($self->{'context'}->[-1] eq 'flush' and $self->in_flushright()) {
        push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0,
                                                   'locations' => []};
      }
    } elsif ($root->{'type'} eq 'empty_line') {
      print STDERR "EMPTY_LINE ($self->{'empty_lines_count'})\n"
        if ($self->{'DEBUG'});
      delete $self->{'format_context'}->[-1]->{'counter'};
      $self->{'empty_lines_count'}++;
      if ($self->{'empty_lines_count'} <= 1
          or $self->{'context'}->[-1] eq 'preformatted') {
        $result = "\n";
        $self->_add_text_count($result);
        $self->_add_lines_count(1);
        return $result;
      } else {
        return '';
      }
    } elsif ($root->{'type'} eq 'def_line') {
      if ($root->{'extra'} and $root->{'extra'}->{'def_args'}
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

        $result .= $self->_count_added($def_paragraph->{'container'}, 
                        $def_paragraph->{'container'}->add_next(" -- "));
        $result .= $self->_convert({'type' => 'code', 'contents' => \@contents});
        $result .= $self->_count_added($def_paragraph->{'container'},
                                      $def_paragraph->{'container'}->end());

        pop @{$self->{'formatters'}};
        $self->{'empty_lines_count'} = 0;
        print STDERR "     --> $result" if ($self->{'DEBUG'});
      }
    } elsif ($root->{'type'} eq 'menu_entry') {
      foreach my $arg (@{$root->{'args'}}) {
        $result .= $self->_convert($arg);
      }
      $result = $self->ensure_end_of_line($result);
    } elsif ($root->{'type'} eq 'frenchspacing') {
      push @{$formatter->{'frenchspacing_stack'}}, 'on';
      $formatter->{'container'}->set_space_protection(undef,
        undef,undef,1);
    } elsif ($root->{'type'} eq 'code') {
      $formatter->{'code'}++;
      push @{$formatter->{'frenchspacing_stack'}}, 'on';
      $formatter->{'container'}->set_space_protection(undef,
        undef,undef,1);
    } elsif ($root->{'type'} eq 'bracketed') {
      #and $self->{'context'}->[-1] eq 'math') {
      $result .= $self->_count_added($formatter->{'container'}, 
                   $formatter->{'container'}->add_text('{'));
    }
  }

  if ($root->{'contents'}) {
    my @contents = @{$root->{'contents'}};
    push @{$self->{'current_contents'}}, \@contents;
    while (@contents) {
      my $content = shift @contents;
      my $text = $self->_convert($content);
      $self->{'empty_lines_count'} = 0 if ($preformatted and $text ne '');
      $result .= $text;
    }
    pop @{$self->{'current_contents'}};
  }

  # now closing
  if ($root->{'type'}) {
    if ($root->{'type'} eq 'frenchspacing') {
      pop @{$formatter->{'frenchspacing_stack'}};
      my $frenchspacing = 0;
      $frenchspacing = 1 if ($formatter->{'frenchspacing_stack'}->[-1] eq 'on');
      $formatter->{'container'}->set_space_protection(undef,
        undef, undef, $frenchspacing);
    } elsif ($root->{'type'} eq 'code') {
      $formatter->{'code'}--;
      pop @{$formatter->{'frenchspacing_stack'}};
      my $frenchspacing = 0;
      $frenchspacing = 1 if ($formatter->{'frenchspacing_stack'}->[-1] eq 'on');
      $formatter->{'container'}->set_space_protection(undef,
        undef, undef, $frenchspacing);
    } elsif ($root->{'type'} eq 'bracketed') {
      $result .= $self->_count_added($formatter->{'container'}, 
                                     $formatter->{'container'}->add_text('}'));
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

      $cell_idx = 0;
      my $cell_updated_locations;
      my @row_locations;
      foreach my $cell_locations (@{$self->{'format_context'}->[-1]->{'row_counts'}}) {
        foreach my $location (@{$cell_locations->{'locations'}}) {
          next unless (defined($location->{'bytes'}) and defined($location->{'lines'}));
          push @{$cell_updated_locations->[$cell_idx]->{$location->{'lines'}}},
                 $location;
          print STDERR "MULTITABLE anchor $location->{'root'}->{'extra'}->{'normalized'}: c $cell_idx, l $location->{'lines'} ($location->{'bytes'})\n"
                if ($self->{'DEBUG'});
          $max_lines = $location->{'lines'}+1 
                            if ($location->{'lines'}+1 > $max_lines);
        }
        push @row_locations, @{$cell_locations->{'locations'}};
        $cell_idx++;
      }

      print STDERR "ROW, max_lines $max_lines, indent_len $indent_len\n" 
         if ($self->{'DEBUG'});
      
      # this is used to keep track of the last cell with content.
      my $max_cell = scalar(@{$self->{'format_context'}->[-1]->{'row'}});
      my $bytes_count = 0;
      my $line;
      for (my $line_idx = 0; $line_idx < $max_lines; $line_idx++) {
        my $line_width = $indent_len;
        $line = '';
        # determine the last cell in the line, to fill spaces in 
        # cells preceding that cell on the line
        my $last_cell = 0;
        for (my $cell_idx = 0; $cell_idx < $max_cell; $cell_idx++) {
          $last_cell = $cell_idx+1 if (defined($cell_lines[$cell_idx]->[$line_idx])
                                       or defined($cell_updated_locations->[$cell_idx]->{$line_idx}));
        }
        print STDERR "  L(last_cell $last_cell): $line_idx\n"
          if ($self->{'DEBUG'});

        for (my $cell_idx = 0; $cell_idx < $last_cell; $cell_idx++) {
          my $cell_text = $cell_lines[$cell_idx]->[$line_idx];
          if (defined($cell_text)) {
            chomp($cell_text);
            if ($line eq '' and $cell_text ne '') {
              $line = ' ' x $indent_len;
              $bytes_count += $self->count_bytes($line);
            }
            print STDERR "  C($cell_idx) `$cell_text'\n" if ($self->{'DEBUG'});
            $line .= $cell_text;
            $bytes_count += $self->count_bytes($cell_text);
            $line_width += Texinfo::Convert::Unicode::string_width($cell_text);
          }
          if (defined($cell_updated_locations->[$cell_idx]->{$line_idx})) {
            foreach my $location (@{$cell_updated_locations->[$cell_idx]->{$line_idx}}) {
              print STDERR "MULTITABLE UPDATE ANCHOR (l $line_idx, c $cell_idx): $location->{'root'}->{'extra'}->{'normalized'}: $location->{'bytes'} -> $bytes_count\n"
                if ($self->{'DEBUG'});
              $location->{'bytes'} = $bytes_count;
            }
          }
          if ($cell_idx+1 < $last_cell) {
            if ($line_width < $indent_len + $cell_beginnings[$cell_idx+1]) {
              if ($line eq '') {
                $line = ' ' x $indent_len;
                $bytes_count += $self->count_bytes($line);
              }
              my $spaces = ' ' x ($indent_len + $cell_beginnings[$cell_idx+1] - $line_width);
              $line_width += Texinfo::Convert::Unicode::string_width($spaces);
              $line .= $spaces;
              $bytes_count += $self->count_bytes($spaces);
            }
          }
        }
        $line .= "\n";
        $bytes_count += $self->count_bytes("\n");
        $result .= $line;
      }
      if ($self->{'format_context'}->[-1]->{'item_command'} eq 'headitem') {
        # at this point cell_beginning is at the beginning of
        # the cell following the end of the table -> full width
        my $line = ' ' x $indent_len . '-' x $cell_beginning . "\n";
        $bytes_count += $self->count_bytes($line);
        $result .= $line;
        $self->{'empty_lines_count'} = 0;
        $max_lines++;
      } elsif ($line eq "\n") {
        $self->{'empty_lines_count'} = 1;
      } else {
        $self->{'empty_lines_count'} = 0;
      }
      $self->_update_locations_counts(\@row_locations);
      push @{$self->{'count_context'}->[-1]->{'locations'}}, @row_locations;
      $self->{'count_context'}->[-1]->{'bytes'} += $bytes_count;
      $self->{'count_context'}->[-1]->{'lines'} += $max_lines;
      $self->{'format_context'}->[-1]->{'row'} = [];
      $self->{'format_context'}->[-1]->{'row_counts'} = [];
      $self->{'format_context'}->[-1]->{'row_empty_lines_count'} 
        = $self->{'empty_lines_count'};
    }
  }
  if ($paragraph) {
    $result .= $self->_count_added($paragraph->{'container'},
                                   $paragraph->{'container'}->end());
    if ($self->{'context'}->[-1] eq 'flush' and $self->in_flushright()) {
      $result = $self->_align_environment ($result, 
        $self->{'format_context'}->[$self->flushright_index]->{'max'}, 'right');
    }
    pop @{$self->{'formatters'}};
    delete $self->{'format_context'}->[-1]->{'counter'};
  }

  if ($root->{'cmdname'}) {
    if ($root->{'cmdname'} eq 'float') {
      if ($self->{'DEBUG'}) {
        my $type_texi = '';
        $type_texi = Texinfo::Convert::Texinfo::convert({'contents' => $root->{'extra'}->{'type'}->{'content'}})
          if ($root->{'extra'} and $root->{'extra'}->{'type'});
        my $number = '';
        $number = $root->{'number'} if (defined($root->{'number'}));
        print STDERR "FLOAT: ($number) ($type_texi)\n";
      }

      if ($root->{'extra'}) {
        # FIXME add an end if line if there is not already one?
        my $caption;
        if ($root->{'extra'}->{'caption'}) {
          $caption = $root->{'extra'}->{'caption'};
        } elsif ($root->{'extra'}->{'shortcaption'}) {
          $caption = $root->{'extra'}->{'shortcaption'};
        }
        #if ($self->{'DEBUG'}) {
        #  my $caption_texi = 
        #    Texinfo::Convert::Texinfo::convert({ 'contents' => $caption->{'contents'}});
        #  print STDERR "  CAPTION: $caption_texi\n";
        #}
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
          my $float_number = $self->convert_line ($prepended);
          $result .= $float_number;
          $self->{'format_context'}->[-1]->{'counter'} += 
            Texinfo::Convert::Unicode::string_width($float_number);
        }
        if ($caption) {
          # FIXME not sure it is right.
          $self->{'format_context'}->[-1]->{'paragraph_count'} = 0;
          $result .= $self->_convert($caption->{'args'}->[0]);
        }
      }
    } elsif ($root->{'cmdname'} eq 'quotation' and $root->{'extra'} 
             and $root->{'extra'}->{'authors'}) {
      foreach my $author (@{$root->{'extra'}->{'authors'}}) {
        $result .= $self->_convert(
                 $self->gdt("\@center --- \@emph{{author}}\n",
                    {'author' => $author->{'extra'}->{'misc_content'}}));
      }
    }
    if ($advance_paragraph_count_commands{$root->{'cmdname'}}) {
      $self->{'format_context'}->[-1]->{'paragraph_count'}++;
    }
  }
  if ($preformatted) {
    $result .= $self->_count_added($preformatted->{'container'},
                                   $preformatted->{'container'}->end());
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
    my $cell_counts = pop @{$self->{'count_context'}};
    push @{$self->{'format_context'}->[-1]->{'row_counts'}}, $cell_counts;
    $result = '';
  }

  return $result;
}

1;
