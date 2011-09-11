# DocBook.pm: output tree as DocBook.
#
# Copyright 2011 Free Software Foundation, Inc.
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

# TODO block commands

package Texinfo::Convert::DocBook;

use 5.00405;
use strict;

use Texinfo::Convert::Converter;
use Texinfo::Common;
use Texinfo::Convert::Unicode;
# for debugging
use Texinfo::Convert::Texinfo;
use Data::Dumper;
use Carp qw(cluck);
use Texinfo::Parser qw(gdt);

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter Texinfo::Convert::Converter);

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

my $mdash = '&#'.hex('2014').';';
my $ndash = '&#'.hex('2013').';';
my $ldquo = '&#'.hex('201C').';';
my $rdquo = '&#'.hex('201D').';';
my $rsquo = '&#'.hex('2019').';';
my $lsquo = '&#'.hex('2018').';';

my %defaults = (
  #'ENABLE_ENCODING'      => 0,
  'SHOW_MENU'            => 0,
  'EXTENSION'            => 'xml', # dbk?
  'perl_encoding'        => 'utf8',
  'encoding_name'        => 'utf-8',
  'OUTFILE'              => undef,
  'SUBDIR'               => undef,
  'output_format'        => 'docbook',
  'SPLIT'                => 0,
  'documentlanguage'     => 'en',
  'OPEN_QUOTE_SYMBOL'    => $lsquo,
  'CLOSE_QUOTE_SYMBOL'   => $rsquo,
);

my @docbook_image_extensions
  = ('eps', 'gif', 'jpg', 'jpeg', 'pdf', 'png', 'svg');

my %docbook_specific_formatting = (
  'TeX' => '&tex;',
  'LaTeX' => '&latex;',
);
my %docbook_commands_formatting
  = %{$Texinfo::Convert::Converter::default_xml_commands_formatting{'normal'}};

foreach my $command (keys(%Texinfo::Convert::Unicode::unicode_map)) {
  $docbook_commands_formatting{$command}
   = '&#'.hex($Texinfo::Convert::Unicode::unicode_map{$command}).';'
    if ($Texinfo::Convert::Unicode::unicode_map{$command} ne '');
}

foreach my $command (keys(%docbook_specific_formatting)) {
  $docbook_commands_formatting{$command} 
    = $docbook_specific_formatting{$command};
}

my %quoted_style_commands = (
  'samp' => 1,
);

my %style_attribute_commands;
%style_attribute_commands = (
      'b'           => 'emphasis role="bold"',
      'cite'        => 'citetitle',
      'code'        => 'literal',
      'command'     => 'command',
      'dfn'         => 'firstterm',
      'emph'        => 'emphasis',
      'env'         => 'envar',
      'file'        => 'filename',
      'headitemfont' => 'emphasis role="bold"', # not really that, in fact it is 
                             # in <th> rather than <td>
      'i'           => 'wordasword',
      'indicateurl' => 'wordasword',
      'sansserif'   => 'span class="sansserif"',
      'kbd'         => 'userinput',
      'key'         => 'keycap',
      'option'      => 'option',
      'r'           => 'span class="roman"',
      'samp'        => 'literal',
      'strong'      => 'emphasis role="bold"',
      't'           => 'literal',
      'var'         => 'replaceable',
      'verb'        => 'literal',
      'footnote'    => 'footnote',
      'math'        => 'mathphrase',
);

# this weird construct does like uniq, it avoids duplicates.
# it may be required since math is not in the %style_commands as it is 
# in context command.
my @all_style_commands = keys %{{ map { $_ => 1 }
    (keys(%Texinfo::Common::style_commands), keys(%style_attribute_commands),
     'dmn', 'titlefont') }};
# 'w' is special

my %style_commands_formatting;
foreach my $command(@all_style_commands) {
  $style_commands_formatting{$command} = {};
  if ($style_attribute_commands{$command}) {
    $style_commands_formatting{$command}->{'attribute'} 
      = $style_attribute_commands{$command};
  }
  if ($quoted_style_commands{$command}) {
    $style_commands_formatting{$command}->{'quote'} = 1;
  }
}

my %misc_command_line_attributes = (
  'setfilename' => 'file',
  'documentencoding' => 'encoding',
  'verbatiminclude' => 'file',
  'documentlanguage' => 'language',
);

# FIXME printindex is special?
my %misc_command_numbered_arguments_attributes = (
  'definfoenclose' => [ 'command', 'open', 'close' ],
  'alias' => [ 'new', 'existing' ],
  'syncodeindex' => [ 'from', 'to' ],
  'synindex' => [ 'from', 'to' ],
#  'sp' => [ 'lines' ],
);

my %docbook_misc_elements_with_arg_map = (
  'settitle' => 'title',
);

my %docbook_misc_commands = %Texinfo::Common::misc_commands;

foreach my $command ('item', 'headitem', 'itemx', 'tab', 
                      keys %Texinfo::Common::def_commands) {
  delete $docbook_misc_commands{$command};
}

my %default_args_code_style 
  = %Texinfo::Convert::Converter::default_args_code_style;

my %commands_args_elements = (
  'inforef' => ['inforefnodename', 'inforefrefname', 'inforefinfoname'],
  'image' => ['imagefile', 'imagewidth', 'imageheight', 
              'alttext', 'imageextension'],
  'quotation' => ['quotationtype'],
  'float' => ['floattype', 'floatname'],
  'itemize' => ['itemfunction'],
);

foreach my $ref_cmd ('pxref', 'xref', 'ref') {
  $commands_args_elements{$ref_cmd} 
    = ['xrefnodename', 'xrefinfoname', 'xrefprinteddesc', 'xrefinfofile', 
       'xrefprintedname'];
}

foreach my $explained_command (keys(%Texinfo::Common::explained_commands)) {
  $commands_args_elements{$explained_command} = ["${explained_command}word",
                                                 "${explained_command}desc"];
}

my %commands_elements;
foreach my $command (keys(%Texinfo::Common::brace_commands)) {
  $commands_elements{$command} = [$command];
  if ($commands_args_elements{$command}) {
    push @{$commands_elements{$command}}, @{$commands_args_elements{$command}};
  }
}

my %defcommand_name_type = (
 'deffn'     => 'function',
 'defvr'     => 'variable',
 'deftypefn' => 'function',
 'deftypeop' => 'operation',
 'deftypevr' => 'variable',
 'defcv'     => 'classvar',
 'deftypecv' => 'classvar',
 'defop'     => 'operation',
 'deftp'     => 'datatype',
);

my %ignored_types;
foreach my $type (#'empty_line_after_command',
            'preamble',
            'empty_spaces_after_command', 
            #'spaces_at_end',
            'empty_spaces_before_argument', 'empty_spaces_before_paragraph',
            'empty_spaces_after_close_brace', 
            'empty_space_at_end_def_bracketed',
            # FIXME keep those? Information is lost...
            'menu_entry_separator',
            'menu_entry_leading_text',
  ) {
  $ignored_types{$type} = 1;
}

my %type_elements = (
  'paragraph' => 'para',
  'table_item' => 'listitem',
  'table_entry' => 'varlistentry',
  'row' => 'row',
  'multitable_head' => 'thead',
  'multitable_body' => 'tbody',
  # FIXME is this right?
  'def_item' => 'blockquote',
);

my %context_block_commands = (
  'float' => 1,
);

sub _defaults($)
{
  return %defaults;
}

sub _initialize($)
{
  my $self = shift;

  $self->{'document_context'} = [{}];
}

sub _global_commands($)
{
  return ('documentlanguage', 'documentencoding');
}

sub _informative_command($$)
{
  my $self = shift;
  my $root = shift;

  my $cmdname = $root->{'cmdname'};
  return if ($self->{'set'}->{$cmdname});

  if (exists($root->{'extra'}->{'text_arg'})) {
    $self->set_conf($cmdname, $root->{'extra'}->{'text_arg'});
    if ($cmdname eq 'documentencoding'
        and defined($root->{'extra'})
        and defined($root->{'extra'}->{'perl_encoding'})
       ){
        #and !$self->{'perl_encoding'}) {
      $self->{'encoding_name'} = $root->{'extra'}->{'encoding_name'};
      $self->{'perl_encoding'} = $root->{'extra'}->{'perl_encoding'};
    }
  }
}

sub _initialize_document($$)
{
  my $self = shift;
  my $root = shift;

  my $elements;

  $self->_set_global_multiple_commands(-1);
  $elements = Texinfo::Structuring::split_by_section($root);
  $self->{'elements'} = $elements;
  return $elements;
}

sub convert($$)
{
  my $self = shift;
  my $root = shift;

  my $elements = $self->_initialize_document($root);

  my $result = '';
  if (!defined($elements)) {
    $result = $self->_convert($root);
  } else {
    foreach my $element (@$elements) {
      my $element_text = $self->_convert($element);
      $result .= $element_text;
    }
  }

  return $result;
}

sub _normalize_top_node($)
{
  my $node = shift;
  return Texinfo::Common::normalize_top_node($node);
}

# output fo $fh if defined, otherwise return the text.
sub _output_text($$)
{
  my $text = shift;
  my $fh = shift;
  if ($fh) {
    print $fh $text;
    return '';
  } else {
    return $text;
  }
}

sub output($$)
{
  my $self = shift;
  my $root = shift;

  $self->_set_outfile();
  return undef unless $self->_create_destination_directory();

  my $fh;
  if (! $self->get_conf('OUTFILE') eq '') {
    $fh = $self->Texinfo::Common::open_out ($self->get_conf('OUTFILE'),
                                            $self->{'perl_encoding'});
    if (!$fh) {
      $self->document_error(sprintf($self->__("Could not open %s for writing: %s"),
                                    $self->get_conf('OUTFILE'), $!));
      return undef;
    }
  }

  my $elements = $self->_initialize_document($root);

  my $id;
  if ($self->get_conf('OUTFILE') ne '') {
    my $output_filename = $self->{'output_filename'};
    $id = " id=\"".$self->xml_protect_text($output_filename)."\"";
  } else {
    $id = '';
  }

  my $header = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
'. "<book${id} lang=\"".$self->get_conf('documentlanguage') ."\">\n";

  my $result = '';
  $result .= _output_text($header, $fh);
  if (!defined($elements)) {
    $result .= _output_text($self->_convert($root), $fh);
  } else {
    foreach my $element (@$elements) {
      $result .= _output_text($self->_convert($root), $fh);
    }
  }

  $result .= _output_text("</book>\n", $fh);
  return $result;
}

my %docbook_sections = (
  'top'  => 'chapter',
  'part' => 'part',
  'chapter'  => 'chapter',
  'unnumbered'  => 'chapter',
  'centerchap'  => 'chapter',
  'appendix' => 'appendix',
  'majorheading' => 'other',
  'chapheading' => 'other',
  'heading' => 'sect1',
  'subheading' => 'sect2',
  'subsubheading' => 'sect3',
  2 => 'sect1',
  3 => 'sect2',
  4 => 'sect3'
);

sub _docbook_section_element($$)
{
  my $self = shift;
  my $root = shift;
  my $heading_level = $root->{'level'};
  if (exists $docbook_sections{$heading_level}) {
    return $docbook_sections{$heading_level};
  }
  my $command = $self->_level_corrected_section($root);
  return $docbook_sections{$command};
}

sub _index_entry($$)
{
  my $self = shift;
  my $root = shift;
  if ($root->{'extra'} and $root->{'extra'}->{'index_entry'}) {
    my $index_entry = $root->{'extra'}->{'index_entry'};
    my $result = "<indexterm role=\"$index_entry->{'index_name'}\"><primary>";
    push @{$self->{'document_context'}}, {};
    $self->{'document_context'}->[-1]->{'code'}++ 
      if ($index_entry->{'in_code'});
    $result .= $self->_convert({'contents' => $index_entry->{'content'}});
    pop @{$self->{'document_context'}};
    return $result ."</primary></indexterm>"
  }
  return '';
}

sub docbook_accent($$;$$)
{
  my $text = shift;
  my $command = shift;
  my $in_upper_case = shift;
  my $accent = $command->{'cmdname'};

  if ($in_upper_case and $text =~ /^\w$/) {
    $text = uc ($text);
  }
  if (exists($Texinfo::Convert::Unicode::unicode_accented_letters{$accent})
      and exists($Texinfo::Convert::Unicode::unicode_accented_letters{$accent}->{$text})) {
    return '&#' .
      hex($Texinfo::Convert::Unicode::unicode_accented_letters{$accent}->{$text}). ';';
  }
  return $text . '&lt;' if ($accent eq 'v');
  # FIXME it is not possible to call xml_protect_text since what is in $text
  # may already be xml.  But this means that each time ascii_accent changes
  # it should be changed here too.
  return Texinfo::Convert::Text::ascii_accent($text, $command);
}

sub _parse_attribute($)
{
  my $element = shift;
  return ('', '') if (!defined($element));
  my $attributes = '';
  if ($element =~ /^(\w+)(\s+.*)/)
  {
    $element = $1;
    $attributes = $2;
  }
  return ($element, $attributes);
}


sub _convert($$;$);



sub _convert($$;$)
{
  my $self = shift;
  my $root = shift;

  if (0) {
  #if (1) {
    print STDERR "root\n";
    print STDERR "  Command: $root->{'cmdname'}\n" if ($root->{'cmdname'});
    print STDERR "  Type: $root->{'type'}\n" if ($root->{'type'});
    print STDERR "  Text: $root->{'text'}\n" if (defined($root->{'text'}));
    #print STDERR "  Special def_command: $root->{'extra'}->{'def_command'}\n"
    #  if (defined($root->{'extra'}) and $root->{'extra'}->{'def_command'});
  }

  return '' if ($root->{'type'} and $ignored_types{$root->{'type'}});
  my $result = '';
  if (defined($root->{'text'})) {
    return $root->{'text'} if (defined($root->{'type'}) 
                               and $root->{'type'} eq '_converted');
    $result = $self->xml_protect_text($root->{'text'});
    if (! defined($root->{'type'}) or $root->{'type'} ne 'raw') {
      if (!$self->{'document_context'}->[-1]->{'code'}) {
        $result =~ s/``/$ldquo/g;
        $result =~ s/\'\'/$rdquo/g;
        $result =~ s/`/$lsquo/g;
        $result =~ s/\'/$rsquo/g;
        $result =~ s/---/$mdash/g;
        $result =~ s/--/$ndash/g;
      }
    }
    return $result;
  }
  my $close_element;
  if ($root->{'cmdname'}) {
    if (defined($docbook_commands_formatting{$root->{'cmdname'}})) {
      my $command;
      if ($root->{'cmdname'} eq 'click' 
          and $root->{'extra'} 
          and defined($root->{'extra'}->{'clickstyle'})) {
        $command = $root->{'extra'}->{'clickstyle'};
      } else {
        $command = $root->{'cmdname'};
      }
      return $docbook_commands_formatting{$command};
    } elsif ($Texinfo::Common::accent_commands{$root->{'cmdname'}}) {
      return $self->xml_accents($root, undef, \&docbook_accent);#, $self->in_upper_case());
   # } elsif ($root->{'cmdname'} eq 'item' and 
    } elsif ($root->{'cmdname'} eq 'item' or $root->{'cmdname'} eq 'itemx'
             or $root->{'cmdname'} eq 'headitem' or $root->{'cmdname'} eq 'tab') {
      if ($root->{'cmdname'} eq 'item'
          and $root->{'parent'}->{'cmdname'}
          and ($root->{'parent'}->{'cmdname'} eq 'itemize'
               or $root->{'parent'}->{'cmdname'} eq 'enumerate')) {
        $result .= "<listitem>";
        $close_element = 'listitem';
      } elsif (($root->{'cmdname'} eq 'item' or $root->{'cmdname'} eq 'itemx')
               and $root->{'parent'}->{'type'} 
               and $root->{'parent'}->{'type'} eq 'table_term') {
        my $table_command = $root->{'parent'}->{'parent'}->{'parent'};
        my $format_item_command;
        my $arg_tree;
        if ($table_command->{'extra'} 
            and $table_command->{'extra'}->{'command_as_argument'}) {
          $format_item_command 
           = $table_command->{'extra'}->{'command_as_argument'}->{'cmdname'};
          $arg_tree = { 'cmdname' => $format_item_command,
             'contents' => $root->{'args'}->[0]->{'contents'}};
        } else {
          $arg_tree = $root->{'args'}->[0];
        }
        $result .= "<term>";
        # Is it automaticcally entered in docbook?
        #$result .= $self->_index_entry($root);
        # FIXME
        my $in_code;
        $in_code = 1
          if ($format_item_command 
              and defined($default_args_code_style{$format_item_command})
              and defined($default_args_code_style{$format_item_command}->[0]));
        $self->{'document_context'}->[-1]->{'code'}++ if ($in_code);
        $result .= $self->_convert($arg_tree);
        $self->{'document_context'}->[-1]->{'code'}-- if ($in_code);
        chomp ($result);
        $result .= "</term>\n";
      } else {
        unless (($root->{'cmdname'} eq 'item' 
                     or $root->{'cmdname'} eq 'headitem'
                     or $root->{'cmdname'} eq 'tab')
                    and $root->{'parent'}->{'type'}
                    and $root->{'parent'}->{'type'} eq 'row') {
          print STDERR "BUG: multitable cell command not in a row "
            .Texinfo::Parser::_print_current($root);
        }
        
        $result .= "<entry>";
        $close_element = 'entry';
      }
    } elsif ($root->{'type'} and $root->{'type'} eq 'index_entry_command') {
      my $end_line;
      if ($root->{'args'}->[0]) {
        $end_line = $self->_end_line_or_comment($root->{'args'}->[0]->{'contents'});
      } else {
        # May that happen?
        $end_line = '';
      }
      return $self->_index_entry($root).${end_line};
    } elsif (exists($docbook_misc_commands{$root->{'cmdname'}})) {
      my $command;
      if (exists ($docbook_misc_elements_with_arg_map{$root->{'cmdname'}})) {
        $command = $docbook_misc_elements_with_arg_map{$root->{'cmdname'}};
      } else {
        $command = $root->{'cmdname'};
      }
      my $type = $docbook_misc_commands{$root->{'cmdname'}};
      if ($type eq 'text') {
        return '' if ($root->{'cmdname'} eq 'end');
        my $attribute = '';
        if ($misc_command_line_attributes{$root->{'cmdname'}}) {
          if ($root->{'extra'} and defined($root->{'extra'}->{'text_arg'})) {
            $attribute = " $misc_command_line_attributes{$root->{'cmdname'}}=\""
                . $self->xml_protect_text($root->{'extra'}->{'text_arg'}) ."\"";
          }
        }
        my $arg = $self->_convert($root->{'args'}->[0]);
        my $end_line;
        if (chomp ($arg)) {
          $end_line = "\n";
        } else {
          $end_line = "";
        }
        return "<$command${attribute}>$arg</$command>$end_line";
      } elsif ($type eq 'line') {
        if ($root->{'cmdname'} eq 'node') {
          if (!$root->{'extra'} or !$root->{'extra'}->{'associated_section'}) {
            $result .= "<anchor id=\"$root->{'extra'}->{'normalized'}\"/>\n";
          }
        } elsif ($Texinfo::Common::root_commands{$root->{'cmdname'}}) {
          my $attribute;
          if ($root->{'extra'} and $root->{'extra'}->{'associated_node'}) {
            $attribute = " id=\"$root->{'extra'}->{'associated_node'}->{'normalized'}\"";
          }
          $command = $self->_docbook_section_element($root);
          $result .= "<$command${attribute}>\n";
          if ($root->{'args'} and $root->{'args'}->[0]) {
            my ($arg, $end_line)
              = $self->_convert_argument_and_end_line($root->{'args'}->[0]);
            $result .= "<title>$arg</title>$end_line";
          }
        } elsif ($Texinfo::Common::sectioning_commands{$root->{'cmdname'}}) {
          if ($root->{'args'} and $root->{'args'}->[0]) {
            my ($arg, $end_line)
              = $self->_convert_argument_and_end_line($root->{'args'}->[0]);
            return "<bridgehead renderas=\"$docbook_sections{$root->{'cmdname'}}>$arg</bridgehead>$end_line";
          }
          return '';
        } else {
          my $attribute = '';
          my ($arg, $end_line)
            = $self->_convert_argument_and_end_line($root->{'args'}->[0]);
          return "<$command${attribute}>$arg</$command>$end_line";
        }
      } elsif ($type eq 'skipline' or $type eq 'noarg') {
        return "<$command></$command>\n";
      } elsif ($type eq 'special') {
      } elsif ($type eq 'lineraw') {
        if ($root->{'cmdname'} eq 'c' or $root->{'cmdname'} eq 'comment') {
          return $self->xml_default_comment($root->{'args'}->[0]->{'text'})
        } else {
          my $value = '';
          if ($root->{'args'} and $root->{'args'}->[0]
              and defined($root->{'args'}->[0]->{'text'})) {
            $value = $self->xml_protect_text($root->{'args'}->[0]->{'text'});
          }
          return "<${command}>$value</${command}>\n";
        }
      } else {
        print STDERR "BUG: unknown misc_command style $type" if ($type !~ /^\d$/);
        my $args_attributes;
        if ($misc_command_numbered_arguments_attributes{$root->{'cmdname'}}) {
          $args_attributes = $misc_command_numbered_arguments_attributes{$root->{'cmdname'}};
        } else {
          $args_attributes = ['value'];
        }
        my $attribute = '';
        my $arg_index = 0;
        if (defined($root->{'extra'}) 
            and defined($root->{'extra'}->{'misc_args'})) {
          foreach my $arg_attribute (@{$args_attributes}) {
            if (defined ($root->{'extra'}->{'misc_args'}->[$arg_index])) {
              $attribute .= " $arg_attribute=\""
               .$self->xml_protect_text($root->{'extra'}->{'misc_args'}->[$arg_index])."\"";
            }
            $arg_index++;
          }
        }
        return "<$command${attribute}></$command>\n";
      }
    } elsif ($root->{'type'}
             and $root->{'type'} eq 'definfoenclose_command') {
      my $in_code;
      $in_code = 1
        if (defined($default_args_code_style{$root->{'cmdname'}})
            and defined($default_args_code_style{$root->{'cmdname'}}->[0]));
      $self->{'document_context'}->[-1]->{'code'}++ if ($in_code);
      my $arg = $self->_convert($root->{'args'}->[0]);
      $result .= $self->xml_protect_text($root->{'extra'}->{'begin'}).$arg
                .$self->xml_protect_text($root->{'extra'}->{'end'});
      $self->{'document_context'}->[-1]->{'code'}-- if ($in_code);
    } elsif ($root->{'args'}
             and exists($Texinfo::Common::brace_commands{$root->{'cmdname'}})) {
      if ($style_commands_formatting{$root->{'cmdname'}}) {
        if ($Texinfo::Common::context_brace_commands{$root->{'cmdname'}}) {
          push @{$self->{'document_context'}}, {};
        }
        my $formatting = $style_commands_formatting{$root->{'cmdname'}};
        my $in_code;
        $in_code = 1
          if (defined($default_args_code_style{$root->{'cmdname'}})
              and defined($default_args_code_style{$root->{'cmdname'}}->[0]));
        $self->{'document_context'}->[-1]->{'code'}++ if ($in_code);
        my ($style, $attribute_text) = _parse_attribute($formatting->{'attribute'});
        my $result = $self->_convert($root->{'args'}->[0]);
        if ($style ne '') {
          $result = "<$style${attribute_text}>$result</$style>";
        }
        if (defined($formatting->{'quote'})) {
          $result = $self->get_conf('OPEN_QUOTE_SYMBOL') . $result
                   . $self->get_conf('CLOSE_QUOTE_SYMBOL');
        }
        $self->{'document_context'}->[-1]->{'code'}-- if ($in_code);
        if ($Texinfo::Common::context_brace_commands{$root->{'cmdname'}}) {
          pop @{$self->{'document_context'}};
        }
        if ($root->{'cmdname'} eq 'math') {
          $result = "<inlineequation>$result</inlineequation>";
        } elsif ($root->{'cmdname'} eq 'w') {
          $result .= '<!-- /@w -->';
        }
        return $result;
      } elsif ($root->{'cmdname'} eq 'anchor') {
        return "<anchor id=\"$root->{'extra'}->{'normalized'}\"/>";
      } elsif ($Texinfo::Common::ref_commands{$root->{'cmdname'}}) {
        if ($root->{'extra'} and $root->{'extra'}->{'brace_command_contents'}) {
          if ($root->{'cmdname'} eq 'inforef') {
            # FIXME?
            my $filename;
            if (scalar (@{$root->{'extra'}->{'brace_command_contents'}}) == 3
                and defined($root->{'extra'}->{'brace_command_contents'}->[-1])) {
              $filename 
                = $self->xml_protect_text(Texinfo::Convert::Text::convert(
              {'contents' => $root->{'extra'}->{'brace_command_contents'}->[-1]},
                                           {'converter' => $self, 'code' => 1}));
            }
            my $node;
            if (defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
              $self->{'document_context'}->[-1]->{'code'}++;
              $node = $self->_convert({'contents' 
                     => $root->{'extra'}->{'brace_command_contents'}->[0]});
              $self->{'document_context'}->[-1]->{'code'}--;
            }
            my $name;
            if (scalar (@{$root->{'extra'}->{'brace_command_contents'}}) >= 2
                and defined($root->{'extra'}->{'brace_command_contents'}->[1])) {
              $name = $self->_convert({'contents' 
                   => $root->{'extra'}->{'brace_command_contents'}->[0]});
            }
            my $node_file = '';
            if (defined($node)) {
              $node_file .= $node;
            }
            if (defined($filename)) {
              $node_file .= "($filename)";
            }
            if (defined($name)) {
              return "*note $name: $node_file";
            } else {
              return "*note ${node_file}::";
            }
          } else {
            my $book_contents;
            if (scalar (@{$root->{'extra'}->{'brace_command_contents'}}) == 5
                and defined($root->{'extra'}->{'brace_command_contents'}->[-1])) {
              $book_contents = $root->{'extra'}->{'brace_command_contents'}->[-1];
            }
            my $manual_file_contents;
            if (scalar (@{$root->{'extra'}->{'brace_command_contents'}}) >= 4
                and defined($root->{'extra'}->{'brace_command_contents'}->[3])) {
              $manual_file_contents = $root->{'extra'}->{'brace_command_contents'}->[3];
            }
            my $section_name_contents;
            if (defined($root->{'extra'}->{'brace_command_contents'}->[2])) {
              $section_name_contents 
                = $root->{'extra'}->{'brace_command_contents'}->[2];
            } elsif (defined($root->{'extra'}->{'brace_command_contents'}->[1])) {
              $section_name_contents
                = $root->{'extra'}->{'brace_command_contents'}->[1];
            } elsif (defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
              $section_name_contents
                = $root->{'extra'}->{'brace_command_contents'}->[0];
            } else {
              $section_name_contents = [];
            }
            # external ref
            if ($book_contents or $manual_file_contents) {
              return '' if (!$book_contents);
              if ($root->{'cmdname'} eq 'ref') {
                # FIXME drop the asis?
                return $self->_convert(
                  $self->gdt('section `@asis{}`{section_name}\'@asis{}\' in @cite{{book}}',
                    { 'section_name' => {'contents' => $section_name_contents},
                      'book' => $book_contents }));
              } elsif ($root->{'cmdname'} eq 'xref') {
                return $self->_convert(
                  $self->gdt('See section `@asis{}`{section_name}\'@asis{}\' in @cite{{book}}',
                    { 'section_name' => {'contents' => $section_name_contents},
                      'book' => $book_contents }));
              } elsif ($root->{'cmdname'} eq 'pxref') {
                return $self->_convert(
                  $self->gdt('(see section `@asis{}`{section_name}\'@asis{}\' in @cite{{book}})',
                    { 'section_name' => {'contents' => $section_name_contents},
                      'book' => $book_contents }));
              }
            } else {
              my $linkend = '';
              if ($root->{'extra'}->{'node_argument'}
                  and defined($root->{'extra'}->{'node_argument'}->{'normalized'})
                  and !$root->{'extra'}->{'node_argument'}->{'manual_content'}) {
                $linkend = " linkend=\"$root->{'extra'}->{'node_argument'}->{'normalized'}\"";
              }
              my $argument = "<link${linkend}>".$self->_convert({'contents' => 
                        $section_name_contents}) ."</link>";
              if ($root->{'cmdname'} eq 'ref') {
                return $self->_convert(
                        $self->gdt('{title_ref}', {'type' => '_converted',
                              'text' => $argument}));
              } elsif ($root->{'cmdname'} eq 'xref') {
                return $self->_convert(
                        $self->gdt('See {title_ref}', {'type' => '_converted',
                              'text' => $argument}));
              } elsif ($root->{'cmdname'} eq 'pxref') {
                return $self->_convert(
                        $self->gdt('(see {title_ref})', {'type' => '_converted',
                              'text' => $argument}));
              }
            }
          }
        } else {
          return '';
        }
      } elsif ($root->{'cmdname'} eq 'image') {
        if (defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
          my $basefile = Texinfo::Convert::Text::convert(
           {'contents' => $root->{'extra'}->{'brace_command_contents'}->[0]},
           {'code' => 1});
          my $element;
          if ($self->_is_inline($root)) {
            $element = 'inlinemediaobject';
          } else {
            $element = 'mediaobject';
          }
          $result .= "<$element>";
          my @files;
          foreach my $extension (@docbook_image_extensions) {
            if ($self->Texinfo::Common::locate_include_file ($basefile.$extension)) {
              push @files, ["$basefile.$extension", $extension];
            }
          }
          if (!scalar(@files)) {
            push @files, ["$basefile.jpg", 'jpg'];
          }
          foreach my $file (@files) {
            $result .= "<imageobject><imagedata fileref=\"$file->[0]\" format=\"$file->[1]\"</imagedata></imageobject>";
          }
          my $image_text
            = $self->Texinfo::Convert::Plaintext::_image_text($root, $basefile);
          if (defined($image_text)) {
            $result .= "<textobject><literallayout>"
               .$self->xml_protect_text($image_text)
               .'</literallayout></textobject>';
          }
          $result .= "</$element>";
        }
      } elsif ($root->{'cmdname'} eq 'email') {
        if ($root->{'extra'} and $root->{'extra'}->{'brace_command_contents'}) {
          my $name;
          my $email;
          my $email_text;
          if (scalar (@{$root->{'extra'}->{'brace_command_contents'}}) == 2
              and defined($root->{'extra'}->{'brace_command_contents'}->[-1])) {
            $name = $root->{'extra'}->{'brace_command_contents'}->[1];
          }
          if (defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
            $email = $root->{'extra'}->{'brace_command_contents'}->[0];
            $email_text 
              = $self->xml_protect_text(Texinfo::Convert::Text::convert(
                                         {'contents' => $email},
                                         {'converter' => $self, 'code' => 1}));
          }
          if ($name and $email) {
            return "<ulink url=\"mailto:$email_text\">"
              .$self->_convert({'contents' => $name}).'</ulink>';
          } elsif ($email) {
            return "<email>$email_text</email>";
          } elsif ($name) {
            return $self->_convert({'contents' => $name});
          }
        } else {
          return '';
        }
      } elsif ($root->{'cmdname'} eq 'uref' or $root->{'cmdname'} eq 'url') {
        if ($root->{'extra'} and $root->{'extra'}->{'brace_command_contents'}) {
          my ($url_text, $url_content);
          if (defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
            $url_content = $root->{'extra'}->{'brace_command_contents'}->[0];
            $url_text = $self->xml_protect_text(Texinfo::Convert::Text::convert(
                                         {'contents' => $url_content},
                                         {'converter' => $self, 'code' => 1}));
          } else {
            $url_text = '';
          }
          my $replacement;
          if (scalar(@{$root->{'extra'}->{'brace_command_contents'}}) >= 2 
              and defined($root->{'extra'}->{'brace_command_contents'}->[1])) {
            $replacement = $self->_convert({'contents' 
                      => $root->{'extra'}->{'brace_command_contents'}->[1]});
          }
          if (!defined($replacement) or $replacement eq '') {
            if (scalar(@{$root->{'extra'}->{'brace_command_contents'}}) == 3
                and defined($root->{'extra'}->{'brace_command_contents'}->[2])) {
              $replacement = $self->_convert({'contents' 
                      => $root->{'extra'}->{'brace_command_contents'}->[2]});
            }
          }
          if (!defined($replacement) or $replacement eq '') {
            $replacement = $url_text;
          }
          return "<ulink url=\"$url_text\">$replacement</ulink>";
        }
      } elsif ($root->{'cmdname'} eq 'abbr' or $root->{'cmdname'} eq 'acronym') {
        my $argument;
        if (scalar (@{$root->{'extra'}->{'brace_command_contents'}}) >= 1
            and defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
          my $arg = $self->_convert({'contents' 
                      => $root->{'extra'}->{'brace_command_contents'}->[0]});
          if ($arg ne '') {
            my $element;
            if ($root->{'cmdname'} eq 'abbr') {
              $element = 'abbrev';
            } else {
              $element = $root->{'cmdname'};
            }
            $argument = "<$element>$arg</$element>";
          }
        }
        
        if (scalar (@{$root->{'extra'}->{'brace_command_contents'}}) == 2
           and defined($root->{'extra'}->{'brace_command_contents'}->[-1])) {
          if (defined($argument)) {
            my $tree = $self->gdt('{abbr_or_acronym} ({explanation})',
                           {'abbr_or_acronym' => {'type' => '_converted',
                                                  'text' => $argument},
                            'explanation' =>
                             $root->{'extra'}->{'brace_command_contents'}->[-1]});
            return $self->_convert($tree);
          } else {
            return $self->_convert({'contents' 
                    => $root->{'extra'}->{'brace_command_contents'}->[-1]});
          }
        } elsif (defined($argument)) {
          return $argument;
        } else {
          return '';
        }
      } else {
        # ignored command
        return '';
      }
    } elsif (exists($Texinfo::Common::block_commands{$root->{'cmdname'}})) {
      if ($context_block_commands{$root->{'cmdname'}}) {
        push @{$self->{'document_context'}}, {};
      }
      my $attribute = '';
      my $element;
      if ($root->{'cmdname'} eq 'enumerate') {
        $element = 'orderedlist'; 
        my $numeration;
        if ($root->{'extra'}
               and $root->{'extra'}->{'enumerate_specification'}) {
          if ($root->{'extra'}->{'enumerate_specification'} =~ /^[A-Z]/) {
            $numeration = 'upperalpha';
          } elsif ($root->{'extra'}->{'enumerate_specification'} =~ /^[a-z]/) {
            $numeration = 'loweralpha';
          } else {
            $numeration = 'arabic';
          }
        } else {
          $numeration = 'arabic';
        }
        $attribute = " numeration=\"$numeration\"";
      } elsif ($Texinfo::Common::item_line_commands{$root->{'cmdname'}}) {
        $element = 'variablelist';
      } elsif ($root->{'cmdname'} eq 'itemize') {
        $element = 'itemizedlist';
      } elsif ($root->{'cmdname'} eq 'multitable') {
      }
        elsif ($root->{'cmdname'} eq 'float' and $root->{'extra'}) {
        if (defined($root->{'extra'}->{'normalized'})) {
          $attribute .= " name=\"$root->{'extra'}->{'normalized'}\"";
        }
        if ($root->{'extra'}->{'type'} and 
            defined($root->{'extra'}->{'type'}->{'normalized'})) {
          $attribute .= " type=\"$root->{'extra'}->{'type'}->{'normalized'}\"";
        }
      } elsif ($root->{'cmdname'} eq 'verbatim') {
        $attribute = " xml:space=\"preserve\"";
      }
      $result .= "<$root->{'cmdname'}${attribute}>";
      if ($root->{'args'}) {
        if ($commands_args_elements{$root->{'cmdname'}}) {
          my $arg_index = 0;
          foreach my $element (@{$commands_args_elements{$root->{'cmdname'}}}) {
            if (defined($root->{'args'}->[$arg_index])) {
              my $in_code;
               $in_code = 1
                if (defined($default_args_code_style{$root->{'cmdname'}})
                  and defined($default_args_code_style{$root->{'cmdname'}}->[$arg_index]));
              $self->{'document_context'}->[-1]->{'code'}++ if ($in_code);
              my $arg = $self->_convert($root->{'args'}->[$arg_index]);
              chomp($arg);
              if ($arg ne '') {  
                $result .= "<$element>$arg</$element>\n";
              }
              $self->{'document_context'}->[-1]->{'code'}-- if ($in_code);
            } else {
              last;
            }
            $arg_index++;
          }
        } elsif ($root->{'cmdname'} eq 'multitable' and $root->{'extra'}) {
          if ($root->{'extra'}->{'prototypes'}) {
            $result .= "<columnprototypes>";
            foreach my $prototype (@{$root->{'extra'}->{'prototypes'}}) {
              $result .= "<columnprototype>".$self->_convert($prototype)
                         ."</columnprototype>";
            }
            $result .= "</columnprototypes>";
          } elsif ($root->{'extra'}->{'columnfractions'}) {
            $result .= "<columnfractions>";
            foreach my $fraction (@{$root->{'extra'}->{'columnfractions'}}) {
              $result .= "<columnfraction value=\"$fraction\"></columnfraction>";
            }
            $result .= "</columnfractions>";
          }
        }
      }
      #chomp($result);
      #$result .= "\n";
      $close_element = $root->{'cmdname'};
    }
  }
  if ($root->{'type'}) {
    if (defined($type_elements{$root->{'type'}})) {
      $result .= "<$type_elements{$root->{'type'}}>";
    }
    if ($root->{'type'} eq 'def_line') {
      if ($root->{'cmdname'}) {
        $result .= "<$root->{'cmdname'}>";
      }
      $result .= "<definitionterm>";
      $result .= $self->_index_entry($root);
      $self->{'document_context'}->[-1]->{'code'}++;
      if ($root->{'extra'} and $root->{'extra'}->{'def_args'}) {
        my $main_command;
        my $alias;
        if ($Texinfo::Common::def_aliases{$root->{'extra'}->{'def_command'}}) {
          $main_command = $Texinfo::Common::def_aliases{$root->{'extra'}->{'def_command'}};
          $alias = 1;
        } else {
          $main_command = $root->{'extra'}->{'def_command'};
          $alias = 0;
        }
        foreach my $arg (@{$root->{'extra'}->{'def_args'}}) {
          my $type = $arg->[0];
          my $content = $self->_convert($arg->[1]);
          if ($type eq 'spaces') {
            $result .= $content;
          } else {
            my $attribute;
            if ($type eq 'category' and $alias) {
              $attribute = " automatic=\"on\"";
            } else {
              $attribute = "";
            }
            my $element;
            if ($type eq 'name') {
              $element = $defcommand_name_type{$main_command};
            } elsif ($type eq 'arg') {
              $element = 'param';
            } elsif ($type eq 'argtype') {
              $element = 'paramtype';
            } else {
              $element = $type;
            }
            $result .= "<def$element${attribute}>$content</def$element>";
          }
        }
      }
      $self->{'document_context'}->[-1]->{'code'}--;
      $result .= "</definitionterm>";
      if ($root->{'cmdname'}) {
        $result .= "</$root->{'cmdname'}>";
      }
      chomp ($result);
      $result .= "\n";
    }
  }
  if ($root->{'contents'}) {
    my $in_code;
    if ($root->{'cmdname'} 
        and $Texinfo::Common::preformatted_code_commands{$root->{'cmdname'}}) {
      $in_code = 1;
    }
    $self->{'document_context'}->[-1]->{'code'}++ if ($in_code);
    if (ref($root->{'contents'}) ne 'ARRAY') {
      cluck "contents not an array($root->{'contents'}).";
    }
    foreach my $content (@{$root->{'contents'}}) {
      $result .= $self->_convert($content);
    }
    $self->{'document_context'}->[-1]->{'code'}-- if ($in_code);
  }
  if ($root->{'type'}) {
    if (defined($type_elements{$root->{'type'}})) {
      $result .= "</$type_elements{$root->{'type'}}>";
    }
  }
  $result = '{'.$result.'}' 
     if ($root->{'type'} and $root->{'type'} eq 'bracketed'
         and (!$root->{'parent'}->{'type'} or
              ($root->{'parent'}->{'type'} ne 'block_line_arg'
               and $root->{'parent'}->{'type'} ne 'misc_line_arg')));
  if ($close_element) {
    $result .= "</$close_element>";
  }
  if ($root->{'cmdname'} 
      and exists($Texinfo::Common::block_commands{$root->{'cmdname'}})) {
    #$result .= "</$root->{'cmdname'}>\n";
    $result .= "\n";
    if ($context_block_commands{$root->{'cmdname'}}) {
      pop @{$self->{'document_context'}};
    }
  } elsif ($root->{'cmdname'} 
           and $Texinfo::Common::root_commands{$root->{'cmdname'}}
           and $root->{'cmdname'} ne 'node') {
    my $command = $self->_docbook_section_element($root);
    my $command_texi = $self->_level_corrected_section($root);
    if (!($root->{'section_childs'} and scalar(@{$root->{'section_childs'}}))
        or $command_texi eq 'top') {
      $result .= "</$command>\n";
      my $current = $root;
      while ($current->{'section_up'}
             # the most up element is a virtual sectioning root element, this
             # condition avoids getting into it
             and $current->{'section_up'}->{'cmdname'}
             and !$current->{'section_next'}
             and $self->_level_corrected_section($current->{'section_up'}) ne 'top') {
        $current = $current->{'section_up'};
        $result .= '</'.$self->_docbook_section_element($current) .">\n";
      }
    }
  }
  return $result;
}

# figure: mandatory title->use it with shortcaption?. Has a caption. 

1;
