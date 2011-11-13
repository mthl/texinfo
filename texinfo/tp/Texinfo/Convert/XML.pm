# XML.pm: output tree as Texinfo XML.
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

package Texinfo::Convert::XML;

use 5.00405;
use strict;

use Texinfo::Convert::Converter;
use Texinfo::Common;
use Texinfo::Convert::Unicode;
# for debugging
use Texinfo::Convert::Texinfo;
use Data::Dumper;
use Carp qw(cluck);

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter Texinfo::Convert::Converter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration       use Texinfo::Convert::XML ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
  convert
  convert_tree
  output
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';

my %defaults = (
  'ENABLE_ENCODING'      => 0,
  'SHOW_MENU'            => 1,
  'EXTENSION'            => 'xml',
  'perl_encoding'        => 'utf8',
  'encoding_name'        => 'utf-8',
  'OUTFILE'              => undef,
  'SUBDIR'               => undef,
  'output_format'        => 'xml',
  'SPLIT'                => 0,
  'documentlanguage'     => 'en',
);


my %specific_xml_commands_formatting = (
           '*' => '&linebreak;',
           ' ' => '<spacecmd type="spc"/>',
           "\t" => '<spacecmd type="tab"/>',
           "\n" => '<spacecmd type="nl"/>',
           '-' => '&hyphenbreak;',  # hyphenation hint
           '|' => '',  # used in formatting commands @evenfooting and friends
           '/' => '&slashbreak;',
           ':' => '&noeos;',
           '!' => '&eosexcl;',
           '?' => '&eosquest;',
           '.' => '&eosperiod;',
           '@' => '&arobase;',
           '}' => '&lbrace;',
           '{' => '&rbrace;',
           '\\' => '&backslash;',  # should only appear in math

           'TeX' => '&tex;',
           'LaTeX' => '&latex;',
           'bullet' => '&bullet;',
           'copyright'    => '&copyright;',
           'registeredsymbol'   => '&registered;',
           'dots'    => '&dots;',
           'enddots'    => '&enddots;',
           'error'        => '&errorglyph;',
           'expansion'     => '&expansion;',
           'arrow'        => '&rarr;',
           'click' => '<click command="arrow"/>',
           'minus'        => '&minus;',
           'point'        => '&point;',
           'print'        => '&printglyph;',
           'result'       => '&result;',
           'l'            => '&lslash;',
           'L'            => '&Lslash;',
           'today'        => '<today/>',
           'comma'        => '&comma;',
);

my %xml_commands_formatting
  = %{$Texinfo::Convert::Converter::default_xml_commands_formatting{'normal'}};

foreach my $command (keys(%specific_xml_commands_formatting)) {
  $xml_commands_formatting{$command}
    = $specific_xml_commands_formatting{$command}
}

my %xml_accents = (
 '=' => 'macr',
# following are not entities
 'H' => 'doubleacute',
 'u' => 'breve',
 'v' => 'caron',
);

my %xml_accent_types = (%Texinfo::Convert::Converter::xml_accent_entities, %xml_accents);

# no entity
my @other_accents = ('dotaccent', 'tieaccent', 'ubaraccent', 'udotaccent');
foreach my $accent (@other_accents) {
  $xml_accent_types{$accent} = $accent;
}

my %misc_command_line_attributes = (
  'setfilename' => 'file',
  'documentencoding' => 'encoding',
  'verbatiminclude' => 'file',
  'documentlanguage' => 'xml:lang',
);

my %misc_command_numbered_arguments_attributes = (
  'definfoenclose' => [ 'command', 'open', 'close' ],
  'alias' => [ 'new', 'existing' ],
  'syncodeindex' => [ 'from', 'to' ],
  'synindex' => [ 'from', 'to' ],
);

my %xml_misc_commands = %Texinfo::Common::misc_commands;

foreach my $command ('item', 'headitem', 'itemx', 'tab', 
                      keys %Texinfo::Common::def_commands) {
  delete $xml_misc_commands{$command};
}

my %default_args_code_style
  = %Texinfo::Convert::Converter::default_args_code_style;

my %commands_args_elements = (
  'email' => ['emailaddress', 'emailname'],
  'uref' => ['urefurl', 'urefdesc', 'urefreplacement'],
  'url' => ['urefurl', 'urefdesc', 'urefreplacement'],
  'inforef' => ['inforefnodename', 'inforefrefname', 'inforefinfoname'],
  'image' => ['imagefile', 'imagewidth', 'imageheight', 
              'alttext', 'imageextension'],
  'quotation' => ['quotationtype'],
  'float' => ['floattype', 'floatname'],
  'itemize' => ['itemprepend'],
  'enumerate' => ['enumeratefirst'],
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
            'empty_spaces_after_command', 
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
  'preformatted' => 'pre',
  'menu_entry' => 'menuentry',
  'menu_entry_node' => 'menunode',
  'menu_comment' => 'menucomment',
  'menu_entry_description' => 'menudescription',
  'menu_entry_name' => 'menutitle',
  'preamble' => 'preamble',
  'table_item' => 'tableitem',
  'table_entry' => 'tableentry',
  'table_term' => 'tableterm',
  'row' => 'row',
  'multitable_head' => 'thead',
  'multitable_body' => 'tbody',
  'def_item' => 'definitionitem',
  'before_item' => 'beforefirstitem',
);

my %context_block_commands = (
  'float' => 1,
  'xml' => 1,
);

sub converter_defaults($)
{
  return %defaults;
}

sub converter_initialize($)
{
  my $self = shift;

  $self->{'document_context'} = [{}];
}

sub output($$)
{
  my $self = shift;
  my $root = shift;

  $self->_set_outfile();
  return undef unless $self->_create_destination_directory();

  my $fh;
  if (! $self->{'output_file'} eq '') {
    $fh = $self->Texinfo::Common::open_out ($self->{'output_file'});
    if (!$fh) {
      $self->document_error(sprintf($self->__("Could not open %s for writing: %s"),
                                    $self->{'output_file'}, $!));
      return undef;
    }
  }

  $self->_set_global_multiple_commands(-1);
  my $header =  '<?xml version="1.0"?>
<!DOCTYPE texinfo PUBLIC "-//GNU//DTD TexinfoML V4.12//EN" "http://www.gnu.org/software/texinfo/dtd/4.12/texinfo.dtd">
<texinfo xml:lang="' . $self->get_conf('documentlanguage') ."\">\n";
  if ($self->{'output_file'} ne '') {
    my $output_filename = $self->{'output_filename'};
    $header .= "<filename file=\"".$self->xml_protect_text($output_filename)
                ."\"></filename>\n";
  }

  my $result = '';
  $result .= $self->_output_text($header, $fh);
  $result .= $self->convert_document_sections($root, $fh);
  $result .= $self->_output_text("</texinfo>\n", $fh);
  if ($fh and !close ($fh)) {
    $self->document_error(sprintf($self->__("Error on closing %s: %s"),
                                  $self->{'output_filename'}, $!));
  }

  return $result;
}

sub _index_entry($$)
{
  my $self = shift;
  my $root = shift;
  if ($root->{'extra'} and $root->{'extra'}->{'index_entry'}) {
    my $index_entry = $root->{'extra'}->{'index_entry'};
    my $result = "<indexterm index=\"$index_entry->{'index_name'}\">";
    push @{$self->{'document_context'}}, {};
    $self->{'document_context'}->[-1]->{'code'}++ 
      if ($index_entry->{'in_code'});
    $result .= $self->_convert({'contents' => $index_entry->{'content'}});
    pop @{$self->{'document_context'}};
    $result .= "</indexterm>";
    return $result;
  }
  return '';
}

sub _infoenclose_attribute($$) {
  my $self = shift;
  my $root = shift;
  my $attribute = '';
  return '' if (!$root->{'extra'});
  $attribute .= " begin=\"".
        $self->xml_protect_text($root->{'extra'}->{'begin'})."\""
    if (defined($root->{'extra'}->{'begin'}));
  $attribute .= "  end=\"".
        $self->xml_protect_text($root->{'extra'}->{'end'})."\""
    if (defined($root->{'extra'}->{'end'}));
  return $attribute;
}

sub _texinfo_xml_accent($$;$)
{
  my $text = shift;
  my $root = shift;
  my $in_upper_case = shift;

  my $result = "<accent type=\"$xml_accent_types{$root->{'cmdname'}}\">";
  $result .= $text;
  $result .= '</accent>';
  return $result;
}

sub convert($$;$)
{
  my $self = shift;
  my $root = shift;
  my $fh = shift;
  
  return $self->convert_document_sections($root, $fh);
}

sub convert_tree($$)
{
  my $self = shift;
  my $root = shift;

  return $self->_convert($root);
}

my @node_directions = ('Next', 'Prev', 'Up');

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
    if ($self->{'document_context'}->[-1]->{'raw'}) {
      # ignore the newline at the end of the @xml line, and the last in xml
      if ($root->{'type'} and ($root->{'type'} eq 'empty_line_after_command'
                               or $root->{'type'} eq 'last_raw_newline')) {
        return '';
      } else {
        return $root->{'text'};
      }
    } elsif ($root->{'type'} 
             and $root->{'type'} eq 'empty_line_after_command') {
      my $command = $root->{'extra'}->{'command'};
      if ($self->{'expanded_formats_hash'}->{$command->{'cmdname'}}
          and $command->{'cmdname'} eq 'xml') {
        return '';
      }
    }
    $result = $self->xml_protect_text($root->{'text'});
    if (! defined($root->{'type'}) or $root->{'type'} ne 'raw') {
      if (!$self->{'document_context'}->[-1]->{'code'}) {
        $result =~ s/``/&textldquo;/g;
        $result =~ s/\'\'/&textrdquo;/g;
        $result =~ s/---/&textmdash;/g;
        $result =~ s/--/&textndash;/g;
      }
    }
    return $result;
  }
  my @close_elements;
  if ($root->{'cmdname'}) {
    if (defined($xml_commands_formatting{$root->{'cmdname'}})) {
      if ($root->{'cmdname'} eq 'click' 
          and $root->{'extra'} 
          and defined($root->{'extra'}->{'clickstyle'})) {
        return "<click command=\"$root->{'extra'}->{'clickstyle'}\"/>";
      }
      return $xml_commands_formatting{$root->{'cmdname'}};
    } elsif ($xml_accent_types{$root->{'cmdname'}}) {
      if ($self->get_conf('ENABLE_ENCODING')) {
        return $self->convert_accents($root, \&_texinfo_xml_accent);
      } else {
        if (!$root->{'args'}) {
          $result = '';
        } else {
          $result = $self->_convert($root->{'args'}->[0]);
        }
        return _texinfo_xml_accent($result, $root);
      }
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
          $result .= "<prepend>"
            .$self->_convert({'contents' 
        => $root->{'parent'}->{'extra'}->{'block_command_line_contents'}->[0]})
            ."</prepend>";
        }
        unshift @close_elements, 'listitem';
      } elsif (($root->{'cmdname'} eq 'item' or $root->{'cmdname'} eq 'itemx')
               and $root->{'parent'}->{'type'} 
               and $root->{'parent'}->{'type'} eq 'table_term') {
        my $table_command = $root->{'parent'}->{'parent'}->{'parent'};
        my $format_item_command;
        my $attribute;
        if ($table_command->{'extra'} 
            and $table_command->{'extra'}->{'command_as_argument'}) {
          $format_item_command 
            = $table_command->{'extra'}->{'command_as_argument'}->{'cmdname'};
          $attribute 
           = $self->_infoenclose_attribute($table_command->{'extra'}->{'command_as_argument'});
        }
        $result .= "<$root->{'cmdname'}>";
        if ($format_item_command) {
          $result .= "<itemformat command=\"$format_item_command\"${attribute}>";
        }
        $result .= $self->_index_entry($root);
        my $in_code;
        $in_code = 1
          if ($format_item_command 
              and defined($default_args_code_style{$format_item_command})
              and defined($default_args_code_style{$format_item_command}->[0]));
        $self->{'document_context'}->[-1]->{'code'}++ if ($in_code);
        $result .= $self->_convert($root->{'args'}->[0]);
        $self->{'document_context'}->[-1]->{'code'}-- if ($in_code);
        chomp ($result);
        if ($format_item_command) {
          $result .= "</itemformat>";
        }
        $result .= "</$root->{'cmdname'}>\n";
      } else {
        unless (($root->{'cmdname'} eq 'item' 
                     or $root->{'cmdname'} eq 'headitem'
                     or $root->{'cmdname'} eq 'tab')
                    and $root->{'parent'}->{'type'}
                    and $root->{'parent'}->{'type'} eq 'row') {
          print STDERR "BUG: multitable cell command not in a row "
            .Texinfo::Parser::_print_current($root);
        }
        
        $result .= "<entry command=\"$root->{'cmdname'}\">";
        unshift @close_elements, 'entry';
      }
    } elsif ($root->{'type'} and $root->{'type'} eq 'index_entry_command') {
      my $element;
      my $attribute;
      if (exists $Texinfo::Common::misc_commands{$root->{'cmdname'}}) {
        $element = $root->{'cmdname'};
        $attribute = '';
      } else {
        $element = "indexcommand";
        $attribute = " command=\"$root->{'cmdname'}\"";
      }
      $attribute .= " index=\"$root->{'extra'}->{'index_entry'}->{'index_name'}\"";
      my $end_line;
      if ($root->{'args'}->[0]) {
        $end_line = $self->_end_line_or_comment($root->{'args'}->[0]->{'contents'});
      } else {
        # May that happen?
        $end_line = '';
      }
      return "<$element${attribute}>".$self->_index_entry($root)."</$element>${end_line}";
    } elsif (exists($xml_misc_commands{$root->{'cmdname'}})) {
      my $command = $root->{'cmdname'};
      my $type = $xml_misc_commands{$root->{'cmdname'}};
      if ($type eq 'text') {
        return '' if ($root->{'cmdname'} eq 'end');
        my $attribute = '';
        if ($misc_command_line_attributes{$root->{'cmdname'}}) {
          if ($root->{'extra'} and defined($root->{'extra'}->{'text_arg'})) {
            $attribute = " $misc_command_line_attributes{$root->{'cmdname'}}=\""
                . $self->xml_protect_text($root->{'extra'}->{'text_arg'}) ."\"";
          }
        }
        my ($arg, $end_line)
            = $self->_convert_argument_and_end_line($root->{'args'}->[0]);
        return "<$command${attribute}>$arg</$command>$end_line";
      } elsif ($type eq 'line') {
        if ($root->{'cmdname'} eq 'node') {
          $result .= "<node name=\"$root->{'extra'}->{'normalized'}\">";
          $self->{'document_context'}->[-1]->{'code'}++;
          $result .= "<nodename>".
             $self->_convert({'contents' => $root->{'extra'}->{'node_content'}})
             ."</nodename>";
          # first arg is the node name.
          my $direction_index = 1;
          foreach my $direction(@node_directions) {
            if ($root->{'node_'.lc($direction)}) {
              my $node_direction = $root->{'node_'.lc($direction)};
              my $element = 'node'.lc($direction);
              my $node_name = '';
              my $attribute = '';
              if (! defined($root->{'extra'}->{'nodes_manuals'}->[$direction_index])) {
                $attribute = ' automatic="on"';
              }
              if ($node_direction->{'extra'}->{'manual_content'}) {
                $node_name .= $self->_convert({
                             'contents' => [{'text' => '('},
                             @{$node_direction->{'extra'}->{'manual_content'}},
                                          {'text' => ')'}]});
              }
              if ($node_direction->{'extra'}->{'node_content'}) {
                $node_name .= Texinfo::Common::normalize_top_node_name($self->_convert({
                  'contents' => $node_direction->{'extra'}->{'node_content'}}));
              }
              $result .= "<$element${attribute}>$node_name</$element>";
            }
            $direction_index++;
          }
          my $end_line;
          if ($root->{'args'}->[0]) {
            $end_line 
              = $self->_end_line_or_comment($root->{'args'}->[-1]->{'contents'});
          } else {
            $end_line = "\n";
          }
          $result .= "</node>${end_line}";
          $self->{'document_context'}->[-1]->{'code'}--;
        } elsif ($Texinfo::Common::root_commands{$root->{'cmdname'}}) {
          my $attribute;
          $command = $self->_level_corrected_section($root);
          if ($command ne $root->{'cmdname'}) {
            $attribute = " originalcommand=\"$root->{'cmdname'}\"";
          } else {
            $attribute = '';
          }
          $result .= "<$command${attribute}>";
          if ($root->{'args'} and $root->{'args'}->[0]) {
            my ($arg, $end_line)
              = $self->_convert_argument_and_end_line($root->{'args'}->[0]);
            $result .= "<sectiontitle>$arg</sectiontitle>$end_line"
          }
        } else {
          my $attribute = '';
          if ($root->{'cmdname'} eq 'listoffloats' and $root->{'extra'} 
              and $root->{'extra'}->{'type'} 
              and defined($root->{'extra'}->{'type'}->{'normalized'})) {
            $attribute = " type=\"$root->{'extra'}->{'type'}->{'normalized'}\"";
          }
          my ($arg, $end_line)
            = $self->_convert_argument_and_end_line($root->{'args'}->[0]);
          return "<$command${attribute}>$arg</$command>$end_line";
        }
      } elsif ($type eq 'skipline') {
        # the command associated with an element is closed at the end of the
        # element. @bye is withing the element, but we want it to appear after
        # the comand closing.  So we delay the output of @bye, and store it.
        if ($root->{'cmdname'} eq 'bye' and $root->{'parent'}
            and $root->{'parent'}->{'type'}
            and $root->{'parent'}->{'type'} eq 'element') {
          $self->{'pending_bye'} = "<$command></$command>\n";
          return '';
        }
        return "<$command></$command>\n";
      } elsif ($type eq 'noarg' or $type eq 'skipspace') {
        return "<$command></$command>";
      } elsif ($type eq 'special') {
        if ($root->{'cmdname'} eq 'clear' or $root->{'cmdname'} eq 'set') {
          my $attribute = '';
          if ($root->{'args'} and $root->{'args'}->[0]
              and defined($root->{'args'}->[0]->{'text'})) {
            $attribute = " name=\""
              .$self->xml_protect_text($root->{'args'}->[0]->{'text'})."\"";
          }
          my $value = '';
          if ($root->{'cmdname'} eq 'set' and $root->{'args'} and $root->{'args'}->[1]
              and defined($root->{'args'}->[1]->{'text'})) {
            $value = $self->xml_protect_text($root->{'args'}->[1]->{'text'});
          }
          return "<${command}value${attribute}>$value</${command}value>\n";
        } elsif ($root->{'cmdname'} eq 'clickstyle') {
          my $attribute = '';
          my $value = '';
          if ($root->{'args'} and $root->{'args'}->[0]
              and defined($root->{'args'}->[0]->{'text'})) {
            my $click_command = $root->{'args'}->[0]->{'text'};
            $click_command =~ s/^\@//;
            $attribute = " command=\"".$self->xml_protect_text($click_command)."\"";
            $value = $self->xml_protect_text($root->{'args'}->[0]->{'text'});
          };
          return "<${command}${attribute}>$value</${command}>\n";
        }
      } elsif ($type eq 'lineraw') {
        if ($root->{'cmdname'} eq 'c' or $root->{'cmdname'} eq 'comment') {
          return $self->xml_comment($root->{'args'}->[0]->{'text'})
        } else {
          my $value = '';
          if ($root->{'args'} and $root->{'args'}->[0]
              and defined($root->{'args'}->[0]->{'text'})) {
            $value = $self->xml_protect_text($root->{'args'}->[0]->{'text'});
          }
          return "<${command}>$value</${command}>\n";
        }
      } else {
        print STDERR "BUG: unknown misc_command style $type\n" if ($type !~ /^\d$/);
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
        my $end_line;
        if ($root->{'args'}->[0]) {
          $end_line = $self->_end_line_or_comment($root->{'args'}->[0]->{'contents'})
        } else {
          $end_line = "\n";
        }
        return "<$command${attribute}></$command>$end_line";
      }
    } elsif ($root->{'type'}
             and $root->{'type'} eq 'definfoenclose_command') {
      my $in_code;
      $in_code = 1
        if (defined($default_args_code_style{$root->{'cmdname'}})
            and defined($default_args_code_style{$root->{'cmdname'}}->[0]));
      $self->{'document_context'}->[-1]->{'code'}++ if ($in_code);
      my $arg = $self->_convert($root->{'args'}->[0]);
      $result .= "<infoenclose command=\"$root->{'cmdname'}\""
         . $self->_infoenclose_attribute($root)
        .">$arg</infoenclose>";
      $self->{'document_context'}->[-1]->{'code'}-- if ($in_code);
    } elsif ($root->{'args'}
             and exists($Texinfo::Common::brace_commands{$root->{'cmdname'}})) {
      if ($Texinfo::Common::context_brace_commands{$root->{'cmdname'}}) {
        push @{$self->{'document_context'}}, {};
      }
      my @elements = @{$commands_elements{$root->{'cmdname'}}};
      my $command;
      if (scalar(@elements) > 1) {
        $command = shift @elements;
      }
      my $attribute = '';
      if ($root->{'cmdname'} eq 'verb') {
        $attribute = " delimiter=\"".$self->xml_protect_text($root->{'type'})
                       ."\"";
      } elsif ($root->{'cmdname'} eq 'anchor') {
        $attribute = " name=\"$root->{'extra'}->{'normalized'}\"";
      };
      my $arg_index = 0;
      foreach my $element (@elements) {
        if (defined($root->{'args'}->[$arg_index])) {
          my $in_code;
          $in_code = 1
            if (defined($default_args_code_style{$root->{'cmdname'}})
              and defined($default_args_code_style{$root->{'cmdname'}}->[$arg_index]));
          $self->{'document_context'}->[-1]->{'code'}++ if ($in_code);
          my $arg = $self->_convert($root->{'args'}->[$arg_index]);
          if (!defined($command) or $arg ne '') {
            # ${attribute} is only set for @verb
            $result .= "<$element${attribute}>$arg</$element>";
          }
          $self->{'document_context'}->[-1]->{'code'}-- if ($in_code);
        } else {
          last;
        }
        $arg_index++;
      }
      $attribute = '';
      if ($root->{'cmdname'} eq 'image') {
        if ($self->_is_inline($root)) {
          $attribute = " where=\"inline\"";
        }
      }
      if (defined($command)) {
        $result = "<$command${attribute}>$result</$command>";
      }
      if ($Texinfo::Common::context_brace_commands{$root->{'cmdname'}}) {
        pop @{$self->{'document_context'}};
      }
    } elsif (exists($Texinfo::Common::block_commands{$root->{'cmdname'}})) {
      if ($context_block_commands{$root->{'cmdname'}}) {
        push @{$self->{'document_context'}}, {};
      }
      my $prepended_elements = '';
      my $attribute = '';
      if ($root->{'extra'} and $root->{'extra'}->{'command_as_argument'}) {
        my $command_as_arg = $root->{'extra'}->{'command_as_argument'};
        $attribute 
         .= " commandarg=\"$command_as_arg->{'cmdname'}\""
             .$self->_infoenclose_attribute($command_as_arg);
      } elsif ($root->{'extra'}
               and $root->{'extra'}->{'enumerate_specification'}) {
        $attribute .= " first=\""
          .$self->xml_protect_text($root->{'extra'}->{'enumerate_specification'})
          ."\"";
      } elsif ($root->{'cmdname'} eq 'float' and $root->{'extra'}) {
        if (defined($root->{'extra'}->{'normalized'})) {
          $attribute .= " name=\"$root->{'extra'}->{'normalized'}\"";
        }
        if ($root->{'extra'}->{'type'} and 
            defined($root->{'extra'}->{'type'}->{'normalized'})) {
          $attribute .= " type=\"$root->{'extra'}->{'type'}->{'normalized'}\"";
        }
      } elsif ($root->{'cmdname'} eq 'verbatim') {
        $attribute = " xml:space=\"preserve\"";
      } elsif ($root->{'cmdname'} eq 'macro' 
               or $root->{'cmdname'} eq 'rmacro') {
        if (defined($root->{'args'})) {
          my @args = @{$root->{'args'}};
          my $name_arg = shift @args;
          if (defined($name_arg) and defined($name_arg->{'text'})) {
            $attribute .= " name=\"$name_arg->{'text'}\"";
          }
          
          while (@args) {
            my $formal_arg = shift @args;
            $prepended_elements .= "<formalarg>".
                $self->xml_protect_text($formal_arg->{'text'})."</formalarg>";
          }
          if ($root->{'extra'} and defined($root->{'extra'}->{'arg_line'})) {
            my $line = $root->{'extra'}->{'arg_line'};
            chomp($line);
            $attribute .= " line=\"".$self->xml_protect_text($line)."\"";
          }
        }
      }
      if ($self->{'expanded_formats_hash'}->{$root->{'cmdname'}}
          and $root->{'cmdname'} eq 'xml') {
        $self->{'document_context'}->[-1]->{'raw'} = 1;
      } else {
        $result .= "<$root->{'cmdname'}${attribute}>${prepended_elements}";
        my $end_line = '';
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
                my $arg;
                if ($arg_index+1 eq scalar(@{$root->{'args'}})) {
                  # last argument
                  ($arg, $end_line) 
                    = $self->_convert_argument_and_end_line($root->{'args'}->[$arg_index]);
                } else {
                  $arg = $self->_convert($root->{'args'}->[$arg_index]);
                }
                if ($arg ne '') {
                  $result .= "<$element>$arg</$element>";
                }
                $self->{'document_context'}->[-1]->{'code'}-- if ($in_code);
              } else {
                last;
              }
              $arg_index++;
            }
          } else {
            my $contents_possible_comment;
            if ($root->{'cmdname'} eq 'multitable' and $root->{'extra'}) {
              if ($root->{'extra'}->{'prototypes'}) {
                $result .= "<columnprototypes>";
                foreach my $prototype (@{$root->{'extra'}->{'prototypes'}}) {
                  $result .= "<columnprototype>".$self->_convert($prototype)
                             ."</columnprototype>";
                }
                $result .= "</columnprototypes>";
                $contents_possible_comment 
                  = $root->{'args'}->[-1]->{'contents'};
              } elsif ($root->{'extra'}->{'columnfractions'}) {
                $result .= "<columnfractions>";
                foreach my $fraction (@{$root->{'extra'}->{'columnfractions'}}) {
                  $result .= "<columnfraction value=\"$fraction\"></columnfraction>";
                }
                $result .= "</columnfractions>";
                $contents_possible_comment 
                  = $root->{'args'}->[-1]->{'contents'}->[-1]->{'args'}->[-1]->{'contents'}
                    if ($root->{'args'}->[-1]->{'contents'}
                        and $root->{'args'}->[-1]->{'contents'}->[-1]->{'args'}
                        and $root->{'args'}->[-1]->{'contents'}->[-1]->{'args'}->[-1]->{'contents'});
              }
            } else {
              $contents_possible_comment = $root->{'args'}->[-1]->{'contents'}
                if ($root->{'args'}->[-1]->{'contents'});
            }
            
            $end_line = $self->_end_line_or_comment($contents_possible_comment);
          }
        }
        $result .= $end_line;
        #chomp($result);
        #$result .= "\n";
        unshift @close_elements, $root->{'cmdname'};
      }
    }
  }
  if ($root->{'type'}) {
    if (defined($type_elements{$root->{'type'}})) {
      my $attribute;
      if ($root->{'type'} eq 'preformatted') {
        $attribute = ' xml:space="preserve"';
      } else {
        $attribute = '';
      }
      $result .= "<$type_elements{$root->{'type'}}${attribute}>";
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
            } elsif ($type eq 'typearg') {
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
  if ($root->{'type'} and $root->{'type'} eq 'menu_entry') {
    foreach my $arg (@{$root->{'args'}}) {
      my $in_code;
      if ($arg->{'type'} eq 'menu_entry_node') {
        $in_code = 1;
      }
      $self->{'document_context'}->[-1]->{'code'}++ if ($in_code);
      $result .= $self->_convert($arg);
      $self->{'document_context'}->[-1]->{'code'}-- if ($in_code);
    }
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
  foreach my $element (@close_elements) {
    $result .= "</$element>";
  }
  if ($root->{'cmdname'} 
      and exists($Texinfo::Common::block_commands{$root->{'cmdname'}})) {
    my $end_command = $root->{'extra'}->{'end_command'}; 
    if ($self->{'expanded_formats_hash'}->{$root->{'cmdname'}}
        and $root->{'cmdname'} eq 'xml') {
    } else {
      my $end_line;
      if ($end_command) {
        $end_line 
         = $self->_end_line_or_comment($end_command->{'args'}->[0]->{'contents'})
           if ($end_command->{'args'}->[0]
               and $end_command->{'args'}->[0]->{'contents'});
      } else {
        $end_line = "\n";
      }
      $result .= $end_line;
    }
    if ($context_block_commands{$root->{'cmdname'}}) {
      pop @{$self->{'document_context'}};
    }
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
    my $command = $self->_level_corrected_section($root);
    if (!($root->{'section_childs'} and scalar(@{$root->{'section_childs'}}))
        or $command eq 'top') {
      $result .= "</$command>\n";
      my $current = $root;
      while ($current->{'section_up'}
             # the most up element is a virtual sectioning root element, this
             # condition avoids getting into it
             and $current->{'section_up'}->{'cmdname'}
             and !$current->{'section_next'}
             and $self->_level_corrected_section($current->{'section_up'}) ne 'top') {
        $current = $current->{'section_up'};
        $result .= '</'.$self->_level_corrected_section($current) .">\n";
      }
    }
    if ($self->{'pending_bye'}) {
      $result .= $self->{'pending_bye'};
      delete $self->{'pending_bye'};
    }
  }
  return $result;
}

1;

__END__
# Automatically generated from maintain/template.pod

=head1 NAME

Texinfo::Convert::XML - Convert Texinfo tree to XML

=head1 SYNOPSIS

  my $converter 
    = Texinfo::Convert::XML->converter({'parser' => $parser});

  $converter->output($tree);

=head1 DESCRIPTION

Texinfo::Convert::XML converts a Texinfo tree to XML.

=head1 METHODS

=over

=item $converter = Texinfo::Convert::XML->converter($options)

Initialize an XML converter.  

The I<$options> hash reference holds options for the converter.  In
this option hash reference a parser object may be associated with the 
I<parser> key.  The other options should be configuration options
described in the Texinfo manual.  Those options, when appropriate,
override the document content.

See L<Texinfo::Convert::Converter> for more informations.

=item $converter->output($tree)

Convert a Texinfo tree I<$tree> and output the result in files as
described in the Texinfo manual.

=item $result = $converter->convert($tree)

Convert a Texinfo tree I<$tree> or tree portion and return 
the resulting output.

=item $result = $converter->convert_tree($tree)

Convert a Texinfo tree portion I<$tree> and return the resulting 
output.  This function do not try to output a full document but only
portions of document.  For a full document use C<convert>.

=item $result = $converter->output_internal_links()

Returns text representing the links in the document.  At present the format 
should follow the C<--internal-links> option of texi2any/makeinfo specification
and this is only relevant for HTML.

=back

=head1 AUTHOR

Patrice Dumas, E<lt>pertusus@free.frE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 Free Software Foundation, Inc.

This library is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or (at 
your option) any later version.

=cut
