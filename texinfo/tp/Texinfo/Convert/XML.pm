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

# msg Karl: printindex
#           <xref> -> xref or pxref or ref
#           drop the See
#           @findex -> <findex><indexterm index=\"${index_name}\">${formatted_entry_reference}</indexterm>
#           @abbr do not becomes abbrev
#       menu comment -> menucomment
#       menu entry description -> menudescription
#       preformatted -> pre


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

my %defaults = (
  'ENABLE_ENCODING'      => 1,
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
           ' ' => '<spacecmd type="spc">',
           "\t" => '<spacecmd type="tab">',
           "\n" => '<spacecmd type="nl">',
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
           'dots'    => '&dots',
           'enddots'    => '&enddots',
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


my %xml_misc_elements_with_arg_map = (
  'title'     => 'booktitle',
  'subtitle'  => 'booksubtitle'
);

my %misc_command_line_attributes = (
  'setfilename' => 'file',
  'documentencoding' => 'encoding',
  'verbatiminclude' => 'file',
  'documentlanguage' => 'languge',
);

# FIXME printindex is special?
my %misc_command_numbered_arguments_attributes = (
  'definfoenclose' => [ 'command', 'open', 'close' ],
  'alias' => [ 'new', 'existing' ],
  'syncodeindex' => [ 'from', 'to' ],
  'synindex' => [ 'from', 'to' ],
#  'sp' => [ 'lines' ],
);

my %xml_misc_commands = %Texinfo::Common::misc_commands;

foreach my $command ('item', 'headitem', 'itemx', 'tab') {
  delete $xml_misc_commands{$command};
}

my %commands_args_style = (
  'email' => ['code'],
  'anchor' => ['code'],
  'uref' => ['code'],
  'url' => ['code'],
  'inforef' => ['code',undef,'code'],
  'image' => ['code', 'code', 'code', undef, 'code'],
# and type?
  'float' => ['code'],
);

my %commands_args_elements = (
  'email' => ['emailaddress', 'emailname'],
  'uref' => ['urefurl', 'urefdesc', 'urefreplacement'],
  'url' => ['urefurl', 'urefdesc', 'urefreplacement'],
  'inforef' => ['inforefnodename', 'inforefrefname', 'inforefinfoname'],
  'image' => ['imagefile', 'imagewidth', 'imageheight', 
              'alttext', 'imageextension'],
  'quotation' => ['quotationtype'],
  'float' => ['floatname', 'floattype'],
);

foreach my $ref_cmd ('pxref', 'xref', 'ref') {
  $commands_args_style{$ref_cmd} = ['code', undef, undef, 'code'];
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

my %ignored_types;
foreach my $type ('empty_line_after_command', 'preamble',
            'empty_spaces_after_command', 'spaces_at_end',
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
  'menu_entry' => 'menuentry',
  'menu_entry_node' => 'menunode',
  'menu_comment' => 'menucomment',
  'menu_entry_description' => 'menudescription',
  'menu_entry_name' => 'menutitle',
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

  $self->_set_global_multiple_commands(-1);
  my $header =  '<?xml version="1.0"?>
<!DOCTYPE texinfo PUBLIC "-//GNU//DTD TexinfoML V4.12//EN" "http://www.gnu.org/software/texinfo/dtd/4.12/texinfo.dtd">
<texinfo xml:lang="' . $self->get_conf('documentlanguage') ."\">\n";
  if ($self->get_conf('OUTFILE') ne '') {
    my $output_filename = $self->{'output_filename'};
    $header .= "<filename file=\"".$self->xml_protect_text($output_filename)
                ."\"></filename>\n";
  }

  my $result = '';
  if ($fh) {
    print $fh $header;
  } else {
    $result .= $header;
  }
  foreach my $content (@{$root->{'contents'}}) {
    #print STDERR " --> $content\n";
    my $output = $self->_convert($content);
    if ($fh) {
      print $fh $output;
    } else {
      $result .= $output;
    }
  }
  my $footer = "</texinfo>\n";
  if ($fh) {
    print $fh $footer;
  } else {
    $result .= $footer;
  }
  return $result;
}

sub _level_corrected_section($)
{
  my $root = shift;
  my $heading_level = $root->{'level'};
  my $command;
  if ($heading_level ne $Texinfo::Common::command_structuring_level{$root->{'cmdname'}}) {
    $command
      = $Texinfo::Common::level_to_structuring_command{$root->{'cmdname'}}->[$heading_level];
  } else {
    $command = $root->{'cmdname'};
  }
  return $command;
}

my @node_directions = ('Next', 'Prev', 'Up');

sub convert($$;$)
{
  my $self = shift;
  my $root = shift;

  return $self->_convert($root);
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
    $result = $self->xml_protect_text($root->{'text'});
    if (! defined($root->{'type'}) or $root->{'type'} ne 'raw') {
      if (!$self->{'document_context'}->[-1]->{'code'}) {
        $result =~ s/``/&textldquo;/g;
        $result =~ s/\'\'/&textrdquo;/g;
        $result =~ s/---/&textmdash;/g;
        $result =~ s/--/&textndash;/g;
      }
    }
  }
  if ($root->{'cmdname'}) {
    if (defined($xml_commands_formatting{$root->{'cmdname'}})) {
      if ($root->{'cmdname'} eq 'click' 
          and $root->{'extra'} 
          and defined($root->{'extra'}->{'clickstyle'})) {
        return "<click command=\"$root->{'extra'}->{'clickstyle'}\"/>";
      }
      return $xml_commands_formatting{$root->{'cmdname'}};
    } elsif ($xml_accent_types{$root->{'cmdname'}}) {
      $result = "<accent type=\"$xml_accent_types{$root->{'cmdname'}}\">";
      $result .= $self->_convert($root->{'args'}->[0])
        if ($root->{'args'} and $root->{'args'}->[0]);
      $result .= '</accent>';
      return $result;
    } elsif (exists($xml_misc_commands{$root->{'cmdname'}})) {
      my $command;
      if (exists ($xml_misc_elements_with_arg_map{$root->{'cmdname'}})) {
        $command = $xml_misc_elements_with_arg_map{$root->{'cmdname'}};
      } else {
        $command = $root->{'cmdname'};
      }
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
        return "<$command${attribute}>".$self->_convert($root->{'args'}->[0])
               ."</$command>\n"
      } elsif ($type eq 'line') {
        if ($root->{'cmdname'} eq 'node') {
          $result .= "<node>\n";
          $self->{'document_context'}->[-1]->{'code'}++;
          $result .= "<nodename>".
             $self->_convert({'contents' => $root->{'extra'}->{'node_content'}})
             ."</nodename>\n";
          my $direction_index = 0;
          foreach my $direction(@node_directions) {
            if ($root->{'node_'.lc($direction)}) {
              my $node_direction = $root->{'node_'.lc($direction)};
              my $element = 'node'.lc($direction);
              my $node_name = '';
              my $attribute = '';
              if (! defined($node_direction->{'extra'}->{'nodes_manuals'}->[$direction_index])) {
                $attribute = ' automatic="on"';
              }
              if ($node_direction->{'extra'}->{'manual_content'}) {
                $node_name .= $self->_convert({
                             'contents' => [{'text' => '('},
                             @{$node_direction->{'extra'}->{'manual_content'}},
                                          {'text' => ')'}]});
              }
              if ($node_direction->{'extra'}->{'node_content'}) {
                $node_name .= _normalize_top_node($self->_convert({
                  'contents' => $node_direction->{'extra'}->{'node_content'}}));
              }
              $result .= "<$element${attribute}>$node_name</$element>\n";
              $direction_index++;
            }
          }
          $result .= "</node>\n";
          $self->{'document_context'}->[-1]->{'code'}--;
        } elsif ($Texinfo::Common::root_commands{$root->{'cmdname'}}) {
          my $attribute;
          $command = _level_corrected_section($root);
          if ($command ne $root->{'cmdname'}) {
            $attribute = " originalcommand=\"$root->{'cmdname'}\"";
          } else {
            $attribute = '';
          }
          $result .= "<$command${attribute}>\n";
          $result .= "<title>". $self->_convert($root->{'args'}->[0])."</title>\n"
            if ($root->{'args'} and $root->{'args'}->[0]);
         # FIXME index entry + new index entries that should appear elsewhere
        #} elsif {
          
        } else {
          my $attribute = '';
          if ($root->{'cmdname'} eq 'listoffloats' and $root->{'extra'} 
              and $root->{'extra'}->{'type'} 
              and defined($root->{'extra'}->{'type'}->{'normalized'})) {
            $attribute = " type=\"$root->{'extra'}->{'type'}->{'normalized'}\n";
          }
          return "<$command${attribute}>".$self->_convert($root->{'args'}->[0])
                 ."</$command>\n";
        }
      } elsif ($type eq 'skipline' or $type eq 'noarg') {
        return "<$command></$command>\n";
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
      my $arg_index = 0;
      foreach my $element (@elements) {
        if (defined($root->{'args'}->[$arg_index])) {
          my $in_code;
          $in_code = 1
            if (defined($commands_args_style{$root->{'cmdname'}})
              and defined($commands_args_style{$root->{'cmdname'}}->[$arg_index]));
          $self->{'document_context'}->[-1]->{'code'}++ if ($in_code);
          my $arg = $self->_convert($root->{'args'}->[$arg_index]);
          if ($arg ne '') {
            $result .= "<$element>$arg</$element>";
          }
          $self->{'document_context'}->[-1]->{'code'}-- if ($in_code);
        } else {
          last;
        }
        $arg_index++;
      }
      if (defined($command) and $result ne '') {
        $result = "<$command>$result<$command>";
      }
      if ($Texinfo::Common::context_brace_commands{$root->{'cmdname'}}) {
        pop @{$self->{'document_context'}};
      }
    } elsif (exists($Texinfo::Common::block_commands{$root->{'cmdname'}})) {
      if ($context_block_commands{$root->{'cmdname'}}) {
        push @{$self->{'document_context'}}, {};
      }
      $result .= "<$root->{'cmdname'}>\n";
    }
  }
    #} elsif ($root->{'cmdname'} eq 'item' 
    #        and $root->{'parent'}->{'cmdname'} 
    #        and $root->{'parent'}->{'cmdname'} eq 'enumerate') {
    #  $result .= enumerate_item_representation(
    #     $root->{'parent'}->{'extra'}->{'enumerate_specification'},
    #     $root->{'extra'}->{'item_number'}) . '. ';
    #}
  #}
  #if ($root->{'type'} and $root->{'type'} eq 'def_line') {
    #print STDERR "$root->{'extra'}->{'def_command'}\n";
  #  if ($root->{'extra'} and $root->{'extra'}->{'def_args'}
  #           and @{$root->{'extra'}->{'def_args'}}) {
  #    my $parsed_definition_category
  #      = Texinfo::Common::definition_category ($options->{'converter'}, $root);
  #    my @contents = ($parsed_definition_category, {'text' => ': '});
  #    if ($root->{'extra'}->{'def_parsed_hash'}->{'type'}) {
  #      push @contents, ($root->{'extra'}->{'def_parsed_hash'}->{'type'},
  #                       {'text' => ' '});
  #    }
  #    push @contents, $root->{'extra'}->{'def_parsed_hash'}->{'name'};
#
  #    my $arguments = Texinfo::Common::definition_arguments_content($root);
  #    if ($arguments) {
  #      push @contents, {'text' => ' '};
  #      push @contents, @$arguments;
  #    }
  #    push @contents, {'text' => "\n"};
  #    $result = convert({'contents' => \@contents}, _code_options($options));
  #  }
  if ($root->{'type'}) {
    if (defined($type_elements{$root->{'type'}})) {
      $result .= "<$type_elements{$root->{'type'}}>";
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
  if ($root->{'cmdname'} 
      and exists($Texinfo::Common::block_commands{$root->{'cmdname'}})) {
    $result .= "</$root->{'cmdname'}>\n";
    if ($context_block_commands{$root->{'cmdname'}}) {
      pop @{$self->{'document_context'}};
    }
  } elsif ($root->{'cmdname'} 
           and $Texinfo::Common::root_commands{$root->{'cmdname'}}
           and $root->{'cmdname'} ne 'node') {
    my $command = _level_corrected_section($root);
    if (!($root->{'section_childs'} and scalar(@{$root->{'section_childs'}}))
        or $command eq 'top') {
      $result .= "</$command>\n";
      my $current = $root;
      while ($current->{'section_up'}
             # the most up element is a virtual sectioning root element, this
             # condition avoids getting into it
             and $current->{'section_up'}->{'cmdname'}
             and !$current->{'section_next'}
             and _level_corrected_section($current->{'section_up'}) ne 'top') {
        $current = $current->{'section_up'};
        $result .= '</'._level_corrected_section($current) .">\n";
      }
    }
  }
  return $result;
}


#set_default('NUMBER_SECTIONS', 0);
#node special


#special -> args -> {type 'misc_arg' , text }

# anchor, node and float -> add a name="->normalized" attribute

#_parse_line_command_args (number of args) 
#  'args' => {'type' => 'misc_line_arg',  'contents' => []}
#  'extra' => { 'misc_args' => []}
  
#    my $result = "<float name=\"$label_texi\">\n";
#    my $style = $float->{'style'};
#    $style = '' if (!defined($style));
#    $result .= "<floattype>$style</floattype>\n";
#    $result .= "<floatpos></floatpos>\n";
#    $result .= $text;
#    return $result."</float>\n";

#        return '<verbatim xml:space="preserve">' . &$protect_text($text) . '</verbatim>';

#<columnfraction fraction="0.4"></columnfraction><columnfraction fraction="0.6"></columnfraction>

#If prototypes are used, something along
#<columnprototype fraction="0.7">prototy</columnprototype><columnprototype fraction="0.5">pro</columnprototype>

#<nodenext explicit="on">next node</nodenext>

#<table><tableitem><item>@item<item>
#<item>@itemx</item> </tableitem>
#<tableterm>$text ."</tableterm>\n";
#sub xml_table_line($)
#        return "<item>$text</item>" unless $only_inter_item_commands;
#
#    $result .= $text ."</tableterm>\n";


#sub xml_list_item($$$$$$$$$)
#    return '<item>' . $text . "</item>\n";
#
#sub xml_row($$;$$)
#<thead>@headitem ... </thead>
#<tbody>@item... </tbody>
#    $result .= "<row>$text</row>";

#cell
#    return "<entry>" . $text . '</entry>';
#
#<$format_command>
#itemize
#<itemfunction>$itemfunction</itemfunction>
#enumerate
#<$format_command first=\"$enumerate_style\">

# $complex_format_map{$complex_format}->{'begin'} = "<$complex_format xml:space=\"preserve\">";
#   $complex_format_map{$complex_format}->{'end'} = "</$complex_format>";

#xml_index_entry_label
#    return "<indexterm index=\"${index_name}\">${formatted_entry_reference}</indexterm>";

#   my $tag = 'inlineimage';
#    $tag = 'image' if ($preformatted or !$in_paragraph);
#    return "<$tag width=\"$width\" height=\"$height\" name=\"". &$protect_text($base)."\" extension=\"$extension\"><alttext>$alt</alttext></$tag>";

#quotation
#    return "<$command>\n" . $text . "</$command>\n";

# node:
#        $result .= xml_close_section();
#     $result .= "<node>\n";
#
# section:
#     $result .= xml_close_section();
#        $xml_current_section = $element;

#xml_close_section
#   my $element = $xml_current_section;
#   if (!defined($element))
#    {
#        return '';
#    }
#    my $result = '';

#    $xml_current_section = undef;
#    # there is a special case for a @chapter that is a child of @top
#    # but should not be considered as is, since it is also toplevel.
#    # @part, however may have other toplevel elements as children.
#    return '' if ($element->{'child'} and (!$element->{'child'}->{'toplevel'} or $element->{'tag'} ne 'top'));
#    $result .= '</'.xml_element_tag($element).">\n";
#
#    my $current = $element;
#    # the second condition is such that top is closed only if it has
#    # sub-elements below chapter.
#    # the third condition is such that elements with a next element are
#    # only closed for the last element, except when the next element is 
#    # toplevel and below top, such that @top is closed before the first 
#    # @chapter if there are @section or the like below @top
#    while ($current->{'sectionup'} and !($current->{'sectionup'}->{'tag'} eq 'top' and $current->{'toplevel'}) and (!$current->{'childnext'} or ($current->{'childnext'}->{'toplevel'} and $current->{'sectionup'}->{'tag'} eq 'top')))
#    {
#        $current = $current->{'sectionup'};
#        $result .= '</'.xml_element_tag($current).">\n";
#    }
#    return $result;
#
#
#%def_format_xml = (
#  'deffn' => [ ['category', 'category'], ['function', 'name'] ],
#   'defvr' => [ ['category', 'category'], ['variable', 'name'] ],
#   'deftypefn' => [ ['category', 'category'], ['type', 'type'], ['function', 'name'] ],
#   'deftypeop' => [ ['category', 'category'], ['type', 'type'], ['operation', 'name'] ],
#   'deftypevr' => [ ['category', 'category'], ['type', 'type'], ['variable', 'name'] ],
#   'defcv' => [ ['category' , 'category'], ['class', 'class'], ['classvar', 'name'] ],
#   'deftypecv' => [ ['category', 'category'], ['type', 'type'], ['classvar', 'name'] ],
#   'defop' => [ ['category', 'category'], ['class', 'class'], ['operation', 'name'] ],
#   'deftp' => [ ['category', 'category'], ['datatype', 'name'] ]
#);


1;
