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
           'click' => '<click command="arrow">',
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

my %xml_accent_types = (%Texinfo::Convert::xml_accent_entities, %xml_accents);

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

# printindex is special
my %misc_command_numbered_arguments_attributes = (
  'definfoenclose' => [ 'command', 'open', 'close' ],
  'alias' => [ 'new', 'existing' ],
  'syncodeindex' => [ 'from', 'to' ],
  'synindex' => [ 'from', 'to' ],
  'sp' => [ 'lines' ],
);

my %xml_misc_commands = %Texinfo::Common::misc_commands;

foreach my $command ('item', 'headitem', 'itemx', 'tab') {
  delete $xml_misc_commands{$command};
}

my %ignored_types;
foreach my $type ('empty_line_after_command', #'preamble',
            'empty_spaces_after_command', 'spaces_at_end',
            'empty_spaces_before_argument', 'empty_spaces_before_paragraph',
            'empty_spaces_after_close_brace', 
            'empty_space_at_end_def_bracketed') {
  $ignored_types{$type} = 1;
}

sub _code_options($)
{
  my $options = shift;
  my $code_options;
  if (defined($options)) {
    $code_options = { %$options };
  } else {
    $code_options = {};
  }
  $code_options->{'code'} = 1;
  return $code_options;
}

sub output($$)
{
  my $self = shift;
  my $root = shift;
  return $self->convert($root);
}

sub convert($$;$);

sub convert($$;$)
{
  my $self = shift;
  my $root = shift;

  if (0) {
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
      #if (!$options->{'code'}) {
        $result =~ s/``/&textldquo;/g;
        $result =~ s/\'\'/&textrdquo;/g;
        $result =~ s/---/&textmdash;/g;
        $result =~ s/--/&textndash;/g;
      #}
    }
  }
  if ($root->{'cmdname'}) {
    
    my $command = $root->{'cmdname'};
    if (defined($xml_commands_formatting{$root->{'cmdname'}})) {
      if ($root->{'cmdname'} eq 'click' 
          and $root->{'extra'} 
          and defined($root->{'extra'}->{'clickstyle'})) {
        return "<click command=\"$root->{'extra'}->{'clickstyle'}\">";
      }
      return $xml_commands_formatting{$root->{'cmdname'}};
    } elsif ($xml_accent_types{$root->{'cmdname'}}) {
      $result = "<accent type=\"$xml_accent_types{$root->{'cmdname'}}\">";
      $result .= $self->convert($root->{'args'}->[0])
        if ($root->{'args'} and $root->{'args'}->[0]);
      $result .= '</accent>';
      return $result;
    } elsif (exists($xml_misc_commands{$root->{'cmdname'}})) {
      my $command;
      if ($xml_misc_elements_with_arg_map{$root->{'cmdname'}}) {
        $command = $xml_misc_elements_with_arg_map{$root->{'cmdname'}};
      } else {
        $command = $root->{'cmdname'};
      }
      my $type = $xml_misc_commands{$root->{'cmdname'}};
      if ($type eq 'text') {
        my $attribute = '';
        if ($misc_command_line_attributes{$root->{'cmdname'}}) {
          if ($root->{'extra'} and defined($root->{'extra'}->{'text_arg'})) {
            $attribute = " $misc_command_line_attributes{$root->{'cmdname'}}=\""
                . $self->xml_protect_text($root->{'extra'}->{'text_arg'}) ."\"";
          }
        }
        return "<$command${attribute}>".$self->convert($root->{'args'}->[0])
               ."</$command>\n"
      } elsif ($type eq 'line') {
        return '' if ($root->{'cmdname'} eq 'end');
        if ($root->{'cmdname'} eq 'node') {
          # FIXME
          return '';
        } elsif ($Texinfo::Common::root_commands{$root->{'cmdname'}}) {
          # FIXME
          return '';
        }
        my $attribute = '';
        if ($root->{'cmdname'} eq 'listoffloats' and $root->{'extra'} 
            and $root->{'extra'}->{'type'} 
            and defined($root->{'extra'}->{'type'}->{'normalized'})) {
          $attribute = " type=\"$root->{'extra'}->{'type'}->{'normalized'}\n";
        }
        return "<$command${attribute}>".$self->convert($root->{'args'}->[0])
               ."</$command>\n";
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
        print STDERR "BUG: unknown msic_command style $type" if ($type !~ /^\d$/);
        my $args_attributes;
        if ($misc_command_numbered_arguments_attributes{$root->{'cmdname'}}) {
          $args_attributes = $misc_command_numbered_arguments_attributes{$root->{'cmdname'}};
        } else {
          $args_attributes = ['value'];
        }
        my $attribute = '';
        my $arg_index = 0;
        if (defined($root->{'args'})) {
          foreach my $arg_attribute (@{$args_attributes}) {
            if (defined ($root->{'args'}->[$arg_index])) {
              $attribute .= " $arg_attribute=\""
               .$self->xml_protect_text($root->{'args'}->[$arg_index])."\"";
            }
            $arg_index++;
          }
        }
        return "<$command${attribute}></$command>\n";
      }
    } elsif ($root->{'args'} 
             and exists($Texinfo::Common::brace_commands{$root->{'cmdname'}})) {
      return "<$root->{'cmdname'}>".$self->convert($root->{'args'}->[0])
               ."</$root->{'cmdname'}>";
    } elsif (exists($Texinfo::Common::block_commands{$root->{'cmdname'}})) {
      $result .= "<$root->{'cmdname'}>\n";
    }
  }
      #my $url = convert($root->{'args'}->[0], _code_options($options));
      #} elsif ($root->{'cmdname'} eq 'verbatiminclude') {
      #  my $verbatim_include_verbatim
      #    = Texinfo::Common::expand_verbatiminclude($options->{'converter'},
      #                                              $root);
      #  if (defined($verbatim_include_verbatim)) {
      #    $result .= convert($verbatim_include_verbatim, $options);
      #  }
      #  # we always want an end of line even if is was eaten by a 
      #    chomp ($result);
      #    $result .= "\n";
      #  }
      #}
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
    #$result = convert($root->{'args'}->[0], $options) if ($root->{'args'});
  #} elsif ($root->{'type'} and $root->{'type'} eq 'menu_entry') {
  #  foreach my $arg (@{$root->{'args'}}) {
  #    if ($arg->{'type'} eq 'menu_entry_node') {
  #      $result .= convert($arg, _code_options($options));
  #    } else {
  #      $result .= convert($arg, $options);
  #    }
  #  }
  #}
  if ($root->{'contents'}) {
    if ($root->{'cmdname'} 
        and $Texinfo::Common::preformatted_code_commands{$root->{'cmdname'}}) {
      #$options = _code_options($options);
    }
    if (ref($root->{'contents'}) ne 'ARRAY') {
      cluck "contents not an array($root->{'contents'}).";
    }
    foreach my $content (@{$root->{'contents'}}) {
      $result .= $self->convert($content);
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
  }
  return $result;
}


#set_default('NUMBER_SECTIONS', 0);
#node special


#special -> args -> {type 'misc_arg' , text }

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


#<pagesizes>arg</pagesizes>
#<vskip>vskip line</vskip>
#<clickstyle command="bullet">@bullet</clickstyle>

#<alias new="new" existing="existing"></alias>
#<definfoenclose command="phoo" open="//" close="\\"></definfoenclose>
#<syncodeindex from="from_index" to="to_index></syncodeindex>

#<headings value="off"></headings>

#<filename file="filename.xml"></filename>

#<columnfraction fraction="0.4"></columnfraction><columnfraction fraction="0.6"></columnfraction>

#If prototypes are used, something along
#<columnprototype fraction="0.7">prototy</columnprototype><columnprototype fraction="0.5">pro</columnprototype>

#<accent type="acute">e</accent>
#<dotless>i</dotless>

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

#$format_map{'copying'} = '';
#$format_map{'titlepage'} = 'titlepage';
#$format_map{'documentdescription'} = 'documentdescription';
#$format_map{'group'} = 'group';
#$format_map{'raggedright'} = 'raggedright';

# $complex_format_map{$complex_format}->{'begin'} = "<$complex_format xml:space=\"preserve\">";
#   $complex_format_map{$complex_format}->{'end'} = "</$complex_format>";

#$format_map{'menu'} = 'menu';
#$format_map{'detailmenu'} = 'detailmenu';
#$format_map{'direntry'} = 'direntry';

#    my $result = "<email><emailaddress>$mail</emailaddress>";
#        $result .= "<emailname>".main::normalise_space($text)."</emailname>";
#    return $result . '</email>';

#    my $result = "<uref><urefurl>$url</urefurl>";
#    $result .= "<urefdesc>$text</urefdesc>" if ($text ne '');
#    $result .= "<urefreplacement>$replacement</urefreplacement>" if ($replacement ne '');
#    return $result.'</uref>';

#    return "<titlefont>$args->[0]</titlefont>";
#    return "<math>$text</math>";

#xml_menu_description
#    return "<menucomment>$text</menucomment>\n</menuentry>";

#sub xml_menu_link($$$$$$$$$$)
#    return "<menuentry>\n<menunode>$menunode_normalized</menunode>\n<menutitle>$menutitle</menutitle>\n";

#xml_index_entry_label
#    return "<indexterm index=\"${index_name}\">${formatted_entry_reference}</indexterm>";

#sub xml_acronym_like($$$$$$)
#    $command = 'abbrev' if ($command eq 'abbr');
#    my $opening = "<${command}><${command}word>$acronym_text</${command}word>";
#    if ($with_explanation)
#    {
#        $opening .= "<${command}desc>$explanation_text</${command}desc>";
#    }
#    return $opening . "</${command}>";

#<footnote>'
#
#   my $tag = 'inlineimage';
#    $tag = 'image' if ($preformatted or !$in_paragraph);
#
#    return "<$tag width=\"$width\" height=\"$height\" name=\"". &$protect_text($base)."\" extension=\"$extension\"><alttext>$alt</alttext></$tag>";
#
#   return "<sp lines=\"$number\"></sp>\n";

#quotation
#    return "<$command>\n" . $text . "</$command>\n";


#    my $language = get_conf('documentlanguage');
#set_default('DOCTYPE', '<!DOCTYPE texinfo PUBLIC "-//GNU//DTD TexinfoML V4.12//EN" "http://www.gnu.org/software/texinfo/dtd/4.12/texinfo.dtd">');
#<?xml version="1.0"?>
#$doctype
#<texinfo xml:lang="$language">
#$setfilename

#</texinfo>

#/heading/
#"<${command}>$text</${command}>\n";


#        $result .= xml_close_section();
#     $result .= "<node>\n";
#        $result .= "<nodename>$element->{'text'}</nodename>\n";
#        foreach my $direction('nodenext', 'nodeprev', 'nodeup')
#        {
#            if ($element->{$direction})
#            {
#                $result .= "<${direction}>$element->{$direction}->{'text'}</${direction}>\n";
#            }
#        }
#        $result .= "</node>\n";
#
#      xml_element_tag = $element->{'tag_level'}
#     $result .= xml_close_section();
#        $result .= "<".xml_element_tag($element).">\n<title>$element->{'text'}</title>\n";
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
