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
my $nbsp = '&#'.hex('00A0').';';

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

my %docbook_special_quotations;
foreach my $special_quotation ('note', 'caution', 'important', 'tip', 'warning') {
  $docbook_special_quotations{$special_quotation} = 1;
}

my %docbook_specific_formatting = (
  'TeX' => '&tex;',
  'LaTeX' => '&latex;',
  "\t" => $nbsp,
  "\n" => $nbsp,
  " " => $nbsp,
# FIXME and '*'?
);
my %docbook_commands_formatting
  = %{$Texinfo::Convert::Converter::default_xml_commands_formatting{'normal'}};

foreach my $command (keys(%Texinfo::Convert::Unicode::unicode_map)) {
  $docbook_commands_formatting{$command}
   = '&#'.hex($Texinfo::Convert::Unicode::unicode_map{$command}).';'
    if ($Texinfo::Convert::Unicode::unicode_map{$command} ne '');
}
$docbook_commands_formatting{'tie'} = $nbsp;

foreach my $command (keys(%docbook_specific_formatting)) {
  $docbook_commands_formatting{$command} 
    = $docbook_specific_formatting{$command};
}

my %quoted_style_commands = (
  'samp' => 1,
);

my @inline_elements = ('emphasis', 'abbrev', 'acronym', 'link', 
  'inlinemediaobject', 'firstterm', 'footnote', 'replaceable', 'wordasword');
my %inline_elements;
foreach my $inline_element (@inline_elements) {
  $inline_elements{$inline_element} = 1;
};

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
      # FIXME wordasword is likely to be wrong. Maybe emph for i and literal
      # for indicateurl.
      'i'           => 'wordasword',
      'indicateurl' => 'wordasword',
      'sansserif'   => '',
      'kbd'         => 'userinput',
      'key'         => 'keycap',
      'option'      => 'option',
      'r'           => 'lineannotation',
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
     'w', 'dmn', 'titlefont') }};
# 'w' is special
my $w_command_mark = '<!-- /@w -->';

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
  'exdent' => 'simpara',
  'center' => '',
);

my %docbook_misc_commands = %Texinfo::Common::misc_commands;

foreach my $command ('item', 'headitem', 'itemx', 'tab', 
                      keys %Texinfo::Common::def_commands) {
  delete $docbook_misc_commands{$command};
}

my %default_args_code_style 
  = %Texinfo::Convert::Converter::default_args_code_style;

my %commands_args_elements = (
);

my %commands_elements;
foreach my $command (keys(%Texinfo::Common::brace_commands)) {
  $commands_elements{$command} = [$command];
  if ($commands_args_elements{$command}) {
    push @{$commands_elements{$command}}, @{$commands_args_elements{$command}};
  }
}

my %defcommand_name_type = (
 'deffn'     => 'function',
 'defvr'     => 'varname',
 'deftypefn' => 'function',
 'deftypeop' => 'methodname',
 'deftypevr' => 'varname',
 'defcv'     => 'property',
 'deftypecv' => 'property',
 'defop'     => 'methodname',
 'deftp'     => 'structname',
);

my %def_argument_types_docbook = (
  'type' => ['returnvalue'],
  'class' => ['ooclass', 'classname'],
  'arg' => ['replaceable'],
  'typearg' => ['type'],
);


my %ignored_types;
foreach my $type ('empty_line_after_command',
            'preamble',
            'preamble_before_setfilename',
            'empty_spaces_after_command', 
            'spaces_at_end',
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
  'docbook' => 1,
);

my %docbook_preformatted_formats = (
# command
   'example' => 'screen',
   'smallexample' => 'screen',
   'display' => 'literallayout',
   'smalldisplay' => 'literallayout',
   'lisp' => 'programlisting',
   'smalllisp' => 'programlisting',
   'format' => 'abstract',
   'smallformat' => 'screen',
# type
   'menu_comment' => 'literallayout',
   'menu_description' => 'literallayout',
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

sub convert($$;$)
{
  my $self = shift;
  my $root = shift;
  my $fh = shift;

  my $elements = $self->_initialize_document($root);
  return $self->_convert_document_sections($root, $fh);
}

sub _normalize_top_node($)
{
  my $node = shift;
  return Texinfo::Common::normalize_top_node($node);
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
  $result .= Texinfo::Convert::Converter::_output_text($header, $fh);
  $result .= $self->convert($root, $fh);
  $result .= Texinfo::Convert::Converter::_output_text("</book>\n", $fh);
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
    # FIXME DocBook 5 role->type
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
    if (defined($root->{'type'}) and $root->{'type'} eq '_converted') {
      return $root->{'text'};
    } elsif ($self->{'document_context'}->[-1]->{'raw'}) {
      return $root->{'text'};
    }
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
  my @close_elements;
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
    } elsif ($root->{'cmdname'} eq 'today') {
      return $self->_convert(Texinfo::Common::expand_today($self));
    } elsif ($Texinfo::Common::accent_commands{$root->{'cmdname'}}) {
      return $self->xml_accents($root, undef, \&docbook_accent);#, $self->in_upper_case());
    } elsif ($root->{'cmdname'} eq 'item' or $root->{'cmdname'} eq 'itemx'
             or $root->{'cmdname'} eq 'headitem' or $root->{'cmdname'} eq 'tab') {
      if ($root->{'cmdname'} eq 'item'
          and $root->{'parent'}->{'cmdname'}
          and ($root->{'parent'}->{'cmdname'} eq 'itemize'
               or $root->{'parent'}->{'cmdname'} eq 'enumerate')) {
        $result .= "<listitem>";
        if ($root->{'parent'}->{'cmdname'} eq 'itemize'
            and $root->{'parent'}->{'extra'}
            and $root->{'parent'}->{'extra'}->{'block_command_line_contents'}
            and $root->{'parent'}->{'extra'}->{'block_command_line_contents'}->[0]) {
       #   $result .= $self->_convert({'contents'
       # => $root->{'parent'}->{'extra'}->{'block_command_line_contents'}->[0]})
       #     ." ";
          $self->{'pending_prepend'} = $self->_convert({'contents'
       => $root->{'parent'}->{'extra'}->{'block_command_line_contents'}->[0]}) ." ";
        }
        push @close_elements, 'listitem';
      } elsif (($root->{'cmdname'} eq 'item' or $root->{'cmdname'} eq 'itemx')
               and $root->{'parent'}->{'type'} 
               and $root->{'parent'}->{'type'} eq 'table_term') {
        my $table_command = $root->{'parent'}->{'parent'}->{'parent'};
        my $format_item_command;
        my $arg_tree;
        my $content_tree;
        #my $content_tree = $root->{'args'}->[0];
        if ($root->{'extra'} and $root->{'extra'}->{'misc_content'}) {
          $content_tree = $root->{'extra'}->{'misc_content'};
        } else {
          $content_tree = [];
        }
        if ($table_command->{'extra'} 
            and $table_command->{'extra'}->{'command_as_argument'}) {
          my $command_as_argument
            = $table_command->{'extra'}->{'command_as_argument'};
          if ($command_as_argument->{'type'} ne 'definfoenclose_command') {
            $arg_tree = {'cmdname' => $command_as_argument->{'cmdname'},
                     'args' => [{'type' => 'brace_command_arg',
                              'contents' => $content_tree}]
            };
          } else {
            $arg_tree = {'cmdname' => $command_as_argument->{'cmdname'},
                          'type' => $command_as_argument->{'type'},
                          'extra' => $command_as_argument->{'extra'},
                     'args' => [{'type' => 'brace_command_arg',
                                'contents' => $content_tree}]
            };
          }
        } else {
          $arg_tree = $root->{'args'}->[0];
        }
        $result .= "<term>";
        # Is it automaticcally entered in docbook?  No.
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
        $result .= "\n";
        $result .= "</term>";
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
        push @close_elements, 'entry';
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
      }
      my $type = $docbook_misc_commands{$root->{'cmdname'}};
      if ($type eq 'text') {
        if ($root->{'cmdname'} eq 'verbatiminclude') {
          my $verbatim_include_verbatim
            = Texinfo::Common::expand_verbatiminclude($self, $root);
          if (defined($verbatim_include_verbatim)) {
            $result .= $self->_convert($verbatim_include_verbatim);
          } else {
            return '';
          }
        } else {
          return '';
        }
      } elsif ($type eq 'line') {
        if ($root->{'cmdname'} eq 'node') {
          if (!$root->{'extra'} or !$root->{'extra'}->{'associated_section'}) {
            $result .= "<anchor id=\"$root->{'extra'}->{'normalized'}\"/>\n";
          }
        } elsif ($Texinfo::Common::root_commands{$root->{'cmdname'}}) {
          my $attribute;
          my $label = '';
          if (defined($root->{'number'})
            and ($self->get_conf('NUMBER_SECTIONS')
                 or !defined($self->get_conf('NUMBER_SECTIONS')))) {
            # Looking at docbook2html output, Appendix is appended in the 
            # section title, so only the letter is used.
            #if ($root->{'cmdname'} eq 'appendix' and $root->{'level'} == 1) {
            #  $label = Texinfo::Convert::Text::convert($self->gdt(
            #      'Appendix {number}', {'number' => 
            #                                 {'text' => $root->{'number'}}}),
            #                            {'converter' => $self});
            #} else {
            #  $label = $root->{'number'};
            #}
            $label = $root->{'number'};
          }
          $attribute = " label=\"$label\"";
          if ($root->{'extra'} and $root->{'extra'}->{'associated_node'}) {
            $attribute .= " id=\"$root->{'extra'}->{'associated_node'}->{'extra'}->{'normalized'}\"";
          }
          $command = $self->_docbook_section_element($root);
          $result .= "<$command${attribute}>\n";
          if ($root->{'args'} and $root->{'args'}->[0]) {
            my ($arg, $end_line)
              = $self->_convert_argument_and_end_line($root->{'args'}->[0]);
            $result .= "<title>$arg</title>$end_line";
            chomp ($result);
            $result .= "\n";
          }
        } elsif ($Texinfo::Common::sectioning_commands{$root->{'cmdname'}}) {
          if ($root->{'args'} and $root->{'args'}->[0]) {
            my ($arg, $end_line)
              = $self->_convert_argument_and_end_line($root->{'args'}->[0]);
            $result .= 
              "<bridgehead renderas=\"$docbook_sections{$root->{'cmdname'}}\">$arg</bridgehead>$end_line";
            chomp ($result);
            $result .= "\n";
            return $result;
          }
          return '';
        } else {
          my $attribute = '';
          if (defined($command)) {
            my ($arg, $end_line)
              = $self->_convert_argument_and_end_line($root->{'args'}->[0]);
            if ($command eq '') {
              $result .= "$arg$end_line";
            } else {
              $result .= "<$command${attribute}>$arg</$command>$end_line";
            }
            chomp ($result);
            $result .= "\n";
            return $result;
          }
          return '';
        }
      } elsif ($type eq 'skipline' or $type eq 'noarg') {
        if ($root->{'cmdname'} eq 'insertcopying') {
          if ($self->{'extra'} and $self->{'extra'}->{'copying'}) {
            return $self->_convert({'contents'
               => $self->{'extra'}->{'copying'}->{'contents'}});
          } else {
            return '';
          }
        } else {
          return '';
        }
      } elsif ($type eq 'special') {
        return '';
      } elsif ($type eq 'lineraw') {
        if ($root->{'cmdname'} eq 'c' or $root->{'cmdname'} eq 'comment') {
          return $self->xml_default_comment($root->{'args'}->[0]->{'text'})
        } else {
          return "";
        }
      } else {
        print STDERR "BUG: unknown misc_command style $type" if ($type !~ /^\d$/);
        if ($root->{'cmdname'} eq 'printindex') {
          if (defined($root->{'extra'})
              and defined($root->{'extra'}->{'misc_args'})) {
            # FIXME DocBook 5
            #return "<index type=\"$root->{'extra'}->{'misc_args'}->[0]\"></index>\n";
            return "<index role=\"$root->{'extra'}->{'misc_args'}->[0]\"></index>\n";
          } else {
            return "<index></index>\n";
          }
        } else {
          return '';
        }
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
        if ($style ne '' and (!$self->{'document_context'}->[-1]->{'inline'}
                               or $inline_elements{$style})) {
          $result = "<$style${attribute_text}>$result</$style>";
          if ($root->{'cmdname'} eq 'math') {
            $result = "<inlineequation>$result</inlineequation>";
          }
        }
        if (defined($formatting->{'quote'})) {
          $result = $self->get_conf('OPEN_QUOTE_SYMBOL') . $result
                   . $self->get_conf('CLOSE_QUOTE_SYMBOL');
        }
        $self->{'document_context'}->[-1]->{'code'}-- if ($in_code);
        if ($Texinfo::Common::context_brace_commands{$root->{'cmdname'}}) {
          pop @{$self->{'document_context'}};
        }
        if ($root->{'cmdname'} eq 'w') {
          $result .= $w_command_mark;
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
                  $self->gdt('see section `@asis{}`{section_name}\'@asis{}\' in @cite{{book}}',
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
                        $self->gdt('{title_ref}', {'title_ref' => 
                             {'type' => '_converted',
                              'text' => $argument}}));
              } elsif ($root->{'cmdname'} eq 'xref') {
                return $self->_convert(
                        $self->gdt('See {title_ref}', {'title_ref' =>
                             {'type' => '_converted',
                              'text' => $argument}}));
              } elsif ($root->{'cmdname'} eq 'pxref') {
                return $self->_convert(
                        $self->gdt('see {title_ref}', {'title_ref' =>
                             {'type' => '_converted',
                              'text' => $argument}}));
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
          my $is_inline = $self->_is_inline($root);
          if ($is_inline) {
            $result .= "<inlinemediaobject>";
          } else {
            $result .= "<informalfigure><mediaobject>";
          }
          my @files;
          foreach my $extension (@docbook_image_extensions) {
            if ($self->Texinfo::Common::locate_include_file ("$basefile.$extension")) {
              push @files, ["$basefile.$extension", uc($extension)];
            }
          }
          if (!scalar(@files)) {
            push @files, ["$basefile.jpg", 'JPG'];
          }
          foreach my $file (@files) {
            $result .= "<imageobject><imagedata fileref=\""
               .$self->xml_protect_text($file->[0])
               ."\" format=\"$file->[1]\"></imagedata></imageobject>";
          }
          my $image_text
            = $self->Texinfo::Convert::Plaintext::_image_text($root, $basefile);
          if (defined($image_text)) {
            $result .= "<textobject><literallayout>"
               .$self->xml_protect_text($image_text)
               .'</literallayout></textobject>';
          }
          if ($is_inline) {
            $result .= "</inlinemediaobject>";
          } else {
            $result .= "</mediaobject></informalfigure>";
          }
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
            # FIXME in_inline
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
          # DocBook 5
          # return "<link xl:href=\"$url_text\">$replacement</link>";
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
    # special case to ensure that @w leads to something even if empty
    } elsif ($root->{'cmdname'} eq 'w') {
      return $w_command_mark;
    } elsif (exists($Texinfo::Common::block_commands{$root->{'cmdname'}})) {
      if ($context_block_commands{$root->{'cmdname'}}) {
        push @{$self->{'document_context'}}, {};
      }
      my @attributes;
      my $appended = '';
      my @elements;
      if (exists($docbook_preformatted_formats{$root->{'cmdname'}})) {
        push @{$self->{'document_context'}->[-1]->{'preformatted_stack'}}, 
           $docbook_preformatted_formats{$root->{'cmdname'}};
      } elsif ($root->{'cmdname'} eq 'enumerate') {
        push @elements, 'orderedlist'; 
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
        push @attributes, " numeration=\"$numeration\"";
      } elsif ($Texinfo::Common::item_line_commands{$root->{'cmdname'}}) {
        push @elements, 'variablelist';
      } elsif ($root->{'cmdname'} eq 'itemize') {
        push @elements, 'itemizedlist';
        #push @attributes, " mark=\"\"";
      } elsif ($root->{'cmdname'} eq 'multitable') {
        push @elements, "informaltable";
        push @attributes, '';
        my $columns_count;
        if ($root->{'extra'} and defined($root->{'extra'}->{'max_columns'})) {
          $columns_count = $root->{'extra'}->{'max_columns'};
        } else {
          $columns_count = 0;
        }
        push @elements, 'tgroup';
        push @attributes, " cols=\"$columns_count\"";
        if ($root->{'extra'}) {
          my @fractions;
          my $multiply;
          if ($root->{'extra'}->{'prototypes'}) {
            $multiply = 1;
            foreach my $prototype (@{$root->{'extra'}->{'prototypes'}}) {
              my $prototype_text
                = Texinfo::Convert::Text::convert($prototype,
                                                  {'converter' => $self});
              push @fractions, 
                Texinfo::Convert::Unicode::string_width($prototype_text);
            }
          } elsif ($root->{'extra'}->{'columnfractions'}) {
            @fractions = @{$root->{'extra'}->{'columnfractions'}};
            $multiply = 100;
          }
          foreach my $fraction (@fractions) {
            $appended .= '<colspec colwidth="'.($fraction*$multiply)
                         .'*"></colspec>';
          }
        }
      } elsif ($root->{'cmdname'} eq 'float') {
        if ($root->{'extra'} and defined($root->{'extra'}->{'normalized'})) {
          $result .= "<anchor id=\"$root->{'extra'}->{'normalized'}\"/>\n";
        }
      } elsif ($root->{'cmdname'} eq 'verbatim') {
        push @elements, 'screen';
      } elsif ($root->{'cmdname'} eq 'quotation' 
               or $root->{'cmdname'} eq 'smallquotation') {
        my $element;
        if ($root->{'extra'}) {
          if ($root->{'extra'}->{'authors'}) {
            foreach my $author (@{$root->{'extra'}->{'authors'}}) {
              if ($author->{'extra'} and $author->{'extra'}->{'misc_content'}) {
                $appended .= '<attribution>'.$self->_convert(
                  {'contents' => $author->{'extra'}->{'misc_content'}})
                           ."</attribution>\n";
              }
            }
          }
          if ($root->{'extra'}->{'block_command_line_contents'}
              and defined($root->{'extra'}->{'block_command_line_contents'}->[0])) {
            my $quotation_arg_text = Texinfo::Convert::Text::convert(
                     {'contents' => $root->{'extra'}->{'block_command_line_contents'}->[0]});
            if ($docbook_special_quotations{lc($quotation_arg_text)}) {
              $element = lc($quotation_arg_text);
            } else {
              $self->{'pending_prepend'} 
                = $self->_convert($self->gdt('@b{{quotation_arg}:} ',
                              {'quotation_arg' =>
                    $root->{'extra'}->{'block_command_line_contents'}->[0]}));
            }
          }
        }
        $element = 'blockquote' if (!defined($element));
        push @elements, $element;
      } elsif ($root->{'cmdname'} eq 'copying') {
        push @elements, ('bookinfo', 'legalnotice');
      } elsif ($Texinfo::Common::block_commands{$root->{'cmdname'}} eq 'raw') {
        return '' if (!$self->{'expanded_formats_hash'}->{$root->{'cmdname'}});
        if ($root->{'cmdname'} eq 'docbook') {
          # the context is here only for the command, so this is forgotten
          # once al the raw internal text has been formatted
          $self->{'document_context'}->[-1]->{'raw'} = 1;
        }
      } elsif ($Texinfo::Common::menu_commands{$root->{'cmdname'}}) {
        return '';
      }
      foreach my $element (@elements) {
        my $attribute = shift @attributes;
        $attribute = '' if (!defined($attribute));
        $result .= "<$element${attribute}>";
        unshift @close_elements, $element;
      }
      $result .= $appended if (defined($appended));
    }
  }
  if ($root->{'type'}) {
    if (exists($docbook_preformatted_formats{$root->{'type'}})) {
      push @{$self->{'document_context'}->[-1]->{'preformatted_stack'}}, 
         $docbook_preformatted_formats{$root->{'type'}};
    }
    if (defined($type_elements{$root->{'type'}})) {
      $result .= "<$type_elements{$root->{'type'}}>";
    } elsif ($root->{'type'} eq 'preformatted') {
      $result .= "<$self->{'document_context'}->[-1]->{'preformatted_stack'}->[-1]>";
    } elsif ($root->{'type'} eq 'def_line') {
      $result .= "<synopsis>";
      push @{$self->{'document_context'}}, {};
      $self->{'document_context'}->[-1]->{'code'}++;
      $self->{'document_context'}->[-1]->{'inline'}++;
      $result .= $self->_index_entry($root);
      if ($root->{'extra'} and $root->{'extra'}->{'def_args'}) {
        my $main_command;
        if ($Texinfo::Common::def_aliases{$root->{'extra'}->{'def_command'}}) {
          $main_command = $Texinfo::Common::def_aliases{$root->{'extra'}->{'def_command'}};
        } else {
          $main_command = $root->{'extra'}->{'def_command'};
        }
        foreach my $arg (@{$root->{'extra'}->{'def_args'}}) {
          my $type = $arg->[0];
          my $content = $self->_convert($arg->[1]);
          if ($type eq 'spaces' or $type eq 'delimiter') {
            $result .= $content;
          } elsif ($type eq 'category') {
            $result .= "<emphasis role=\"bold\">$content</emphasis>:";
          } elsif ($type eq 'name') {
            $result .= "<$defcommand_name_type{$main_command}>$content</$defcommand_name_type{$main_command}>";
          } else {
            if (!defined($def_argument_types_docbook{$type})) {
              print STDERR "BUG: no def_argument_types_docbook for $type\n";
              next;
            }
            foreach my $element (reverse (
                                   @{$def_argument_types_docbook{$type}})) {
              $content = "<$element>$content</$element>";
            }
            $result .= $content;
          }
        }
      }
      pop @{$self->{'document_context'}};
      $result .= "</synopsis>";
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
    if (defined($self->{'pending_prepend'}) and $self->_in_inline($root)) {
      $result .= $self->{'pending_prepend'};
      delete $self->{'pending_prepend'};
    }
    foreach my $content (@{$root->{'contents'}}) {
      $result .= $self->_convert($content);
    }
    $self->{'document_context'}->[-1]->{'code'}-- if ($in_code);
  }
  if ($root->{'type'}) {
    if (defined($type_elements{$root->{'type'}})) {
      $result .= "</$type_elements{$root->{'type'}}>";
    } elsif ($root->{'type'} eq 'preformatted') {
      $result .= "</$self->{'document_context'}->[-1]->{'preformatted_stack'}->[-1]>";
    }
  }
  $result = '{'.$result.'}' 
     if ($root->{'type'} and $root->{'type'} eq 'bracketed'
         and (!$root->{'parent'}->{'type'} or
              ($root->{'parent'}->{'type'} ne 'block_line_arg'
               and $root->{'parent'}->{'type'} ne 'misc_line_arg')));
  foreach my $element (@close_elements) {
    $result .= "</$element>";
  }
  if ($root->{'cmdname'} 
      and exists($Texinfo::Common::block_commands{$root->{'cmdname'}})) {
    # a pending_prepend still there may happen if a quotation is empty.
    delete $self->{'pending_prepend'};
    #$result .= "</$root->{'cmdname'}>\n";
    if ($self->{'document_context'}->[-1]->{'raw'}) {
      chomp ($result);
      chomp ($result);
    } else {
      if (exists($docbook_preformatted_formats{$root->{'cmdname'}})) {
        my $format = pop @{$self->{'document_context'}->[-1]->{'preformatted_stack'}};
        die "BUG $format ne $docbook_preformatted_formats{$root->{'cmdname'}}"
         if ($format ne $docbook_preformatted_formats{$root->{'cmdname'}});
      }
    }
    if ($context_block_commands{$root->{'cmdname'}}) {
      pop @{$self->{'document_context'}};
    }
  } elsif ($root->{'type'} and exists($docbook_preformatted_formats{$root->{'type'}})) {
    my $format = pop @{$self->{'document_context'}->[-1]->{'preformatted_stack'}};
    die "BUG $format ne $docbook_preformatted_formats{$root->{'type'}}"
      if ($format ne $docbook_preformatted_formats{$root->{'type'}});
  # The command is closed either when the corresponding tree element
  # is done, and the command is not associated to an element, or when
  # the element is closed.
  } elsif (($root->{'type'} and $root->{'type'} eq 'element'
            and $root->{'extra'} and $root->{'extra'}->{'element_command'})
           or ($root->{'cmdname'} 
               and $Texinfo::Common::root_commands{$root->{'cmdname'}}
               and $root->{'cmdname'} ne 'node'
               and !($root->{'parent'} and $root->{'parent'}->{'type'}
                     and $root->{'parent'}->{'type'} eq 'element'
                     and $root->{'parent'}->{'extra'} 
                     and $root->{'parent'}->{'extra'}->{'element_command'} eq $root))) {
    if ($root->{'type'} and $root->{'type'} eq 'element') {
      $root = $root->{'extra'}->{'element_command'};
    }
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
