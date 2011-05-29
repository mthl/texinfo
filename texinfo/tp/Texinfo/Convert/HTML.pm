# HTML.pm: output tree as HTML.
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

package Texinfo::Convert::HTML;

use 5.00405;
use strict;

use Texinfo::Convert::Converter;
use Texinfo::Common;
use Texinfo::Report;
use Texinfo::Convert::Texinfo;
use Texinfo::Convert::Text;
use Texinfo::Parser qw(gdt);

use Carp qw(cluck);

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter Texinfo::Convert::Converter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration       use Texinfo::Convert::HTML ':all';
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

# misc commands that are of use for formatting.
my %formatting_misc_commands = %Texinfo::Convert::Text::formatting_misc_commands;
my %text_no_brace_commands = %Texinfo::Convert::Text::text_no_brace_commands;
my %no_brace_commands = %Texinfo::Common::no_brace_commands;
my %text_brace_no_arg_commands = %Texinfo::Convert::Text::text_brace_no_arg_commands;
my %accent_commands = %Texinfo::Common::accent_commands;
my %misc_commands = %Texinfo::Common::misc_commands;
my %sectioning_commands = %Texinfo::Common::sectioning_commands;
my %def_commands = %Texinfo::Common::def_commands;
my %ref_commands = %Texinfo::Common::ref_commands;
my %brace_commands = %Texinfo::Common::brace_commands;
my %block_commands = %Texinfo::Common::block_commands;
my %menu_commands = %Texinfo::Common::menu_commands;
my %root_commands = %Texinfo::Common::root_commands;
my %preformatted_commands = %Texinfo::Common::preformatted_commands;
my %explained_commands = %Texinfo::Common::explained_commands;
my %item_container_commands = %Texinfo::Common::item_container_commands;
my %raw_commands = %Texinfo::Common::raw_commands;
my @out_formats = @Texinfo::Common::out_formats;
my %code_style_commands       = %Texinfo::Common::code_style_commands;
my %preformatted_code_commands = %Texinfo::Common::preformatted_code_commands;
my %default_index_commands = %Texinfo::Common::default_index_commands;
my %style_commands = %Texinfo::Common::style_commands;
my %align_commands = %Texinfo::Common::align_commands;
my %region_commands = %Texinfo::Common::region_commands;

foreach my $def_command (keys(%def_commands)) {
  $formatting_misc_commands{$def_command} = 1 if ($misc_commands{$def_command});
}

# FIXME remove raw commands?
my %format_context_commands = (%block_commands, %root_commands);

foreach my $misc_context_command('tab', 'item', 'itemx', 'headitem', 'math') {
  $format_context_commands{$misc_context_command} = 1;
}

# FIXME allow customization?
my %upper_case_commands = ( 'sc' => 1 );

sub in_math($)
{
  my $self = shift;
  return $self->{'context'}->[-1]->{'math'};
}

sub in_preformatted($)
{
  my $self = shift;
  return $self->{'preformatted_context'}->[-1];
}

sub in_upper_case($)
{
  my $self = shift;
  return $self->{'context'}->[-1]->{'upper_case'};
}

sub in_space_protected($)
{
  my $self = shift;
  return $self->{'context'}->[-1]->{'space_protected'};
}

sub in_code($)
{
  my $self = shift;
  return $self->{'context'}->[-1]->{'code'};
}

sub in_string($)
{
  my $self = shift;
  return $self->{'context'}->[-1]->{'string'};
}

sub paragraph_number($)
{
  my $self = shift;
  return $self->{'context'}->[-1]->{'paragraph_number'};
}

sub preformatted_number($)
{
  my $self = shift;
  return $self->{'context'}->[-1]->{'preformatted_number'};
}

sub top_format($)
{
  my $self = shift;
  return $self->{'formats'}->[-1];
}

sub align($)
{  
  my $self = shift;
  return $self->{'context'}->[-1]->{'align'}->[-1];
}

sub _get_target($$)
{
  my $self = shift;
  my $command = shift;
  my $target;
  if ($self->{'targets'}->{$command}) {
    $target = $self->{'targets'}->{$command};
  } elsif ($command->{'cmdname'}
            and $sectioning_commands{$command->{'cmdname'}} 
            and !$root_commands{$command->{'cmdname'}}) {
    $target = $self->_new_sectioning_command_target($command);
    
  }
  return $target;
}

# API for the elements formatting
sub command_id($$)
{
  my $self = shift;
  my $command = shift;
  my $target = $self->_get_target($command);
  if ($target) {
    return $target->{'id'};
  } else {
    return undef;
  }
}

sub command_contents_id($$$)
{
  my $self = shift;
  my $command = shift;
  my $contents_or_shortcontents = shift;
  
  my $target = $self->_get_target($command);
  if ($target) {
    return $target->{$contents_or_shortcontents .'_id'};
  } else {
    return undef;
  }
}

sub command_contents_target($$$)
{
  my $self = shift;
  my $command = shift;
  my $contents_or_shortcontents = shift;

  my $target = $self->_get_target($command);
  if ($target) {
    return $target->{$contents_or_shortcontents .'_target'};
  } else {
    return undef;
  }
}

sub command_target($$)
{
  my $self = shift;
  my $command = shift;

  my $target = $self->_get_target($command);
  if ($target) {
    return $target->{'target'};
  } else {
    return undef;
  }
}

sub command_filename($$)
{
  my $self = shift;
  my $command = shift;

  my $target = $self->_get_target($command);
  if ($target) {
    if (defined($target->{'filename'})) {
      return $target->{'filename'};
    }
    my ($page, $element, $root_command) = $self->_get_page($command);
    #if (defined($command->{'cmdname'}) and $command->{'cmdname'} eq 'footnote') {
    #  print STDERR "footnote $command: page $page\n";
    #}
    if (defined($element)) {
      $target->{'element'} = $element;
    }
    if (defined($root_command)) {
      $target->{'root_command'} = $root_command;
    }
    if (defined($page)) {
      $target->{'page'} = $page;
      $target->{'filename'} = $page->{'filename'};
      return $target->{'filename'};
    }
  }
  return undef;
}

sub command_element($$)
{
  my $self = shift;
  my $command = shift;

  my $target = $self->_get_target($command);
  if ($target) {
    $self->command_filename($command);
    return $target->{'element'};
  }
  return undef;
}

sub command_element_command($$)
{
  my $self = shift;
  my $command = shift;

  my $element = $self->command_element($command);
  if ($element and $element->{'extra'}) {
    return $element->{'extra'}->{'element_command'};
  }
  return undef;
}


sub command_node($$)
{
  my $self = shift;
  my $command = shift;

  my $target = $self->_get_target($command);
  if ($target) {
    $self->command_filename($command);
    my $root_command = $target->{'root_command'};
    if (defined($root_command)) {
      if ($root_command->{'cmdname'} and $root_command->{'cmdname'} eq 'node') {
        return $root_command;
      }
      if ($root_command->{'extra'} and $root_command->{'extra'}->{'associated_node'}) {
        return $root_command->{'extra'}->{'associated_node'};
      }
    }
  }
  return undef;
}

sub command_href($$$)
{
  my $self = shift;
  my $command = shift;
  my $filename = shift;

  $filename = $self->{'current_filename'} if (!defined($filename));

  if ($command->{'manual_content'}) {
    return $self->_external_node_href($command, $filename);
  }

  my $target = $self->command_target($command);
  return '' if (!defined($target));
  my $href = '';

  my $target_filename = $self->command_filename($command);
  if (defined($target_filename) and 
      (!defined($filename) 
       or $filename ne $target_filename)) {
    $href .= $target_filename;
  }
  $href .= '#' . $target if ($target ne '');
  return $href;
}

my %contents_command_element_name = (
  'contents' => 'Contents',
  'shortcontents' => 'Overview',
  'summarycontents' => 'Overview',
);

sub command_contents_href($$$$)
{
  my $self = shift;
  my $command = shift;
  my $contents_or_shortcontents = shift;
  my $filename = shift;

  my $href;
  my $name = $contents_command_element_name{$contents_or_shortcontents};
  
  my $target;
  if ($name eq 'Contents') {
    $target = $self->command_contents_target($command);
  } else {
    $target = $self->command_shortcontents_target($command);
  }

  my $target_element = $self->special_element($name);
  my $target_filename = $self->command_filename($target_element);
  if (defined($target_filename) and
      (!defined($filename)
       or $filename ne $target_filename)) {
    $href .= $target_filename;
  }
  $href .= '#' . $target if ($target ne '');
  return $href;
}

sub command_text($$$)
{
  my $self = shift;
  my $command = shift;
  my $type = shift;

  if (!defined($type)) {
    $type = 'text';
  }
  if (!defined($command)) {
    cluck "in command_text($type) command not defined";
  }

  if ($command->{'manual_content'}) {
    my $node_content = [];
    $node_content = $command->{'node_content'}
      if (defined($command->{'node_content'}));
    my $tree = {'type' => '_code',
          'contents' => [{'text' => '('}, @{$command->{'manual_content'}},
                         {'text' => ')'}, @$node_content]};
    if ($type eq 'tree') {
      return $tree;
    } else {
      return $self->_convert($tree);
    }
  }

  my $target = $self->_get_target($command);
  if ($target) {
    if (defined($target->{$type})) {
      return $target->{$type};
    }
    my $tree;
    if (!$target->{'tree'}) {
      if ($command->{'extra'}
               and $command->{'extra'}->{'special_element'}) {
        my $special_element = $command->{'extra'}->{'special_element'};
        $tree = $self->get_conf('SPECIAL_ELEMENTS_NAME')->{$special_element};
      } elsif ($command->{'cmdname'} and ($command->{'cmdname'} eq 'node' 
                                          or $command->{'cmdname'} eq 'anchor')) {
        $tree = {'type' => '_code',
                 'contents' => $command->{'extra'}->{'node_content'}};
      } else {
        if (!$command->{'extra'}->{'misc_content'}) {
          cluck "No misc_content: "
            .Texinfo::Parser::_print_current($command);
        }
        $tree = {'contents' => [@{$command->{'extra'}->{'misc_content'}}]};
        if ($command->{'number'}) {
          unshift @{$tree->{'contents'}}, {'text' => "$command->{'number'} "};
        }
        $target->{'tree_nonumber'} 
          = {'contents' => $command->{'extra'}->{'misc_content'}};
      }
      $target->{'tree'} = $tree;
    } else {
      $tree = $target->{'tree'};
    }
    return $target->{'tree_nonumber'} if ($type eq 'tree_nonumber' 
                                          and $target->{'tree_nonumber'});
    return $tree if ($type eq 'tree' or $type eq 'tree_nonumber');
    
    push @{$self->{'context'}}, 
            {'cmdname' => $command->{'cmdname'}};
    if ($type eq 'string') {
      $tree = {'type' => '_string',
               'contents' => [$tree]};
    }
    
    print STDERR "DO $target->{'id'}($type)\n" if ($self->get_conf('DEBUG'));
    if ($type =~ /^(.*)_nonumber$/) {
      $tree = $target->{'tree_nonumber'} 
        if (defined($target->{'tree_nonumber'}));
      $target->{$type} = $self->_convert($tree);
    } else {
      $target->{$type} = $self->_convert($tree);
    }

    pop @{$self->{'context'}};
    return $target->{$type};
  }
  return undef;
}

sub label_command($$)
{
  my $self = shift;
  my $label = shift;
  return $self->{'labels'}->{$label};
}

sub special_element($$)
{
  my $self = shift;
  my $type = shift;
  return $self->{'special_elements'}->{$type};
}

# see http://www.w3.org/TR/REC-html40/types.html#type-links
# see http://www.w3.org/TR/REC-html40/types.html#type-links
my %BUTTONS_REL =
(
 'Top',         'start',
 'Contents',    'contents',
 'Overview',    '',
 'Index',       'index',
 'This',        '',
 'Back',        'previous',
 'FastBack',    '',
 'Prev',        'previous',
 'Up',          'up',
 'Next',        'next',
 'NodeUp',      'up',
 'NodeNext',    'next',
 'NodePrev',    'previous',
 'NodeForward', '',
 'NodeBack',    '',
 'Forward',     'next',
 'FastForward', '',
 'About' ,      'help',
 'First',       '',
 'Last',        '',
 'NextFile',    'next',
 'PrevFile',    'previous',
);

my %BUTTONS_ACCESSKEY =
(
 'Top',         '',
 'Contents',    '',
 'Overview',    '',
 'Index',       '',
 'This',        '',
 'Back',        'p',
 'FastBack',    '',
 'Prev',        'p',
 'Up',          'u',
 'Next',        'n',
 'NodeUp',      'u',
 'NodeNext',    'n',
 'NodePrev',    'p',
 'NodeForward', '',
 'NodeBack',    '',
 'Forward',     'n',
 'FastForward', '',
 'About' ,      '',
 'First',       '',
 'Last',        '',
 'NextFile',    '',
 'PrevFile',    '',
);

my %BUTTONS_EXAMPLE =
    (
     'Top',         ' &nbsp; ',
     'Contents',    ' &nbsp; ',
     'Overview',    ' &nbsp; ',
     'Index',       ' &nbsp; ',
     'This',        '1.2.3',
     'Back',        '1.2.2',
     'FastBack',    '1',
     'Prev',        '1.2.2',
     'Up',          '1.2',
     'Next',        '1.2.4',
     'NodeUp',      '1.2',
     'NodeNext',    '1.2.4',
     'NodePrev',    '1.2.2',
     'NodeForward', '1.2.4',
     'NodeBack',    '1.2.2',
     'Forward',     '1.2.4',
     'FastForward', '2',
     'About',       ' &nbsp; ',
     'First',       '1.',
     'Last',        '1.2.4',
     'NextFile',    ' &nbsp; ',
     'PrevFile',    ' &nbsp; ',
    );


my (%BUTTONS_TEXT, %BUTTONS_GOTO, %BUTTONS_NAME, %SPECIAL_ELEMENTS_NAME);

sub _translate_names($)
{
  my $self = shift;


  %BUTTONS_TEXT = (
     'Top',         $self->gdt('Top'),
     'Contents',    $self->gdt('Contents'),
     'Overview',    $self->gdt('Overview'),
     'Index',       $self->gdt('Index'),
     ' ',           ' &nbsp; ',
     'This',        $self->gdt('current'),
     'Back',        ' &lt; ',
     'FastBack',    ' &lt;&lt; ',
     'Prev',        $self->gdt('Prev'),
     'Up',          $self->gdt(' Up '),
     'Next',        $self->gdt('Next'),
     #'NodeUp',      $self->gdt('Node up'),
     'NodeUp',      $self->gdt('Up'),
     #'NodeNext',    $self->gdt('Next node'),
     'NodeNext',    $self->gdt('Next'),
     #'NodePrev',    $self->gdt('Previous node'),
     'NodePrev',    $self->gdt('Previous'),
     'NodeForward', $self->gdt('Forward node'),
     'NodeBack',    $self->gdt('Back node'),
     'Forward',     ' &gt; ',
     'FastForward', ' &gt;&gt; ',
     'About',       ' ? ',
     'First',       ' |&lt; ',
     'Last',        ' &gt;| ',
     'NextFile',    $self->gdt('Next file'),
     'PrevFile',    $self->gdt('Previous file'),
  );

  #%BUTTONS_TEXT = %NAVIGATION_TEXT;

  %BUTTONS_GOTO = (
     'Top',         $self->gdt('Cover (top) of document'),
     'Contents',    $self->gdt('Table of contents'),
     'Overview',    $self->gdt('Short table of contents'),
     'Index',       $self->gdt('Index'),
     'This',        $self->gdt('Current section'),
     'Back',        $self->gdt('Previous section in reading order'),
     'FastBack',    $self->gdt('Beginning of this chapter or previous chapter'),
     'Prev',        $self->gdt('Previous section on same level'),
     'Up',          $self->gdt('Up section'),
     'Next',        $self->gdt('Next section on same level'),
     'NodeUp',      $self->gdt('Up node'),
     'NodeNext',    $self->gdt('Next node'),
     'NodePrev',    $self->gdt('Previous node'),
     'NodeForward', $self->gdt('Next node in node reading order'),
     'NodeBack',    $self->gdt('Previous node in node reading order'),
     'Forward',     $self->gdt('Next section in reading order'),
     'FastForward', $self->gdt('Next chapter'),
     'About' ,      $self->gdt('About (help)'),
     'First',       $self->gdt('First section in reading order'),
     'Last',        $self->gdt('Last section in reading order'),
     'NextFile',    $self->gdt('Forward section in next file'),
     'PrevFile',    $self->gdt('Back section in previous file'),
  );

  %BUTTONS_NAME = (
     'Top',         $self->gdt('Top'),
     'Contents',    $self->gdt('Contents'),
     'Overview',    $self->gdt('Overview'),
     'Index',       $self->gdt('Index'),
     ' ',           ' ',
     'This',        $self->gdt('This'),
     'Back',        $self->gdt('Back'),
     'FastBack',    $self->gdt('FastBack'),
     'Prev',        $self->gdt('Prev'),
     'Up',          $self->gdt('Up'),
     'Next',        $self->gdt('Next'),
     'NodeUp',      $self->gdt('NodeUp'),
     'NodeNext',    $self->gdt('NodeNext'),
     'NodePrev',    $self->gdt('NodePrev'),
     'NodeForward', $self->gdt('NodeForward'),
     'NodeBack',    $self->gdt('NodeBack'),
     'Forward',     $self->gdt('Forward'),
     'FastForward', $self->gdt('FastForward'),
     'About',       $self->gdt('About'),
     'First',       $self->gdt('First'),
     'Last',        $self->gdt('Last'),
     'NextFile',    $self->gdt('NextFile'),
     'PrevFile',    $self->gdt('PrevFile'),
  );

  %SPECIAL_ELEMENTS_NAME = (
    'About'       => $self->gdt('About This Document'),
    'Contents'    => $self->gdt('Table of Contents'),
    'Overview'    => $self->gdt('Short Table of Contents'),
    'Footnotes'   => $self->gdt('Footnotes'),
  );

  # delete the tree and formatted results such that they are redone
  # with the new tree when needed.
  foreach my $special_element (keys (%SPECIAL_ELEMENTS_NAME)) {
    if ($self->{'special_elements'}->{$special_element} and
        $self->{'targets'}->{$self->{'special_elements'}->{$special_element}}) {
      my $target 
        = $self->{'targets'}->{$self->{'special_elements'}->{$special_element}};
      foreach my $key ('text', 'string', 'tree') {
        delete $target->{$key};
      }
    }
  }
  
  foreach my $hash (\%BUTTONS_TEXT, \%BUTTONS_GOTO, \%BUTTONS_NAME) {
    foreach my $button (keys (%$hash)) {
      if (ref($hash->{$button})) {
        # FIXME put it out of document context
        $hash->{$button} = $self->convert_tree($hash->{$button});
      }
    }
  }
}

# insert here name of icon images for buttons
# Icons are used, if ICONS and resp. value are set
my %ACTIVE_ICONS = (
     'Top',         '',
     'Contents',    '',
     'Overview',    '',
     'Index',       '',
     'This',        '',
     'Back',        '',
     'FastBack',    '',
     'Prev',        '',
     'Up',          '',
     'Next',        '',
     'NodeUp',      '',
     'NodeNext',    '',
     'NodePrev',    '',
     'NodeForward', '',
     'NodeBack',    '',
     'Forward',     '',
     'FastForward', '',
     'About' ,      '',
     'First',       '',
     'Last',        '',
     'NextFile',    '',
     'PrevFile',    '',
     ' ',           '',
);

# insert here name of icon images for these, if button is inactive
my %PASSIVE_ICONS = (
     'Top',         '',
     'Contents',    '',
     'Overview',    '',
     'Index',       '',
     'This',        '',
     'Back',        '',
     'FastBack',    '',
     'Prev',        '',
     'Up',          '',
     'Next',        '',
     'NodeUp',      '',
     'NodeNext',    '',
     'NodePrev',    '',
     'NodeForward', '',
     'NodeBack',    '',
     'Forward',     '',
     'FastForward', '',
     'About',       '',
     'First',       '',
     'Last',        '',
     'NextFile',    '',
     'PrevFile',    '',
);


my %defaults = (
  'ENABLE_ENCODING'      => 0,
  'SHOW_MENU'            => 1,
  'footnotestyle'        => 'end',
  'perl_encoding'        => 'utf8',
  'encoding_name'        => 'utf-8',
  #'encoding_name'        => undef,
  #'perl_encoding'        => undef,
  'OUTFILE'              => undef,
  'SUBDIR'               => undef,
  'documentlanguage'     => undef,
  'NUMBER_FOOTNOTES'     => 1,
  'expanded_formats'     => undef,
  'include_directories'  => undef,
  'NUMBER_SECTIONS'      => 1,
  'USE_NODES'            => 1,
  'INLINE_CONTENTS'      => 1,
  'SPLIT'                => 'node',
# if set style is added in attribute.
  'INLINE_CSS_STYLE'     => 0,
# if set, no css is used.
  'NO_CSS'               => 0,
# if set, use node anchors for sections targets
  'USE_NODE_TARGET'      => 1,
  'OPEN_QUOTE_SYMBOL'    => '&lsquo;',
  'CLOSE_QUOTE_SYMBOL'   => '&rsquo;',
  'USE_ISO'              => 1,
  'allowcodebreaks'      => 'true',
# file name used for Top node when NODE_FILENAMES is true
  'TOP_NODE_FILE'        => 'index',
  'NODE_FILE_EXTENSION'  => 'html',
  'EXTENSION'            => 'html',
  'TOP_NODE_FILE_TARGET' => 'index',
  'TRANSLITERATE_FILE_NAMES' => 1,
  'USE_LINKS'            => 1,
  'DATE_IN_HEADER'       => 0,
  'AVOID_MENU_REDUNDANCY' => 0,
  'HEADERS'              => 1,
  'DO_ABOUT'             => 0,
  'USE_ACCESSKEY'        => 1,
  'USE_REL_REV'          => 1,
  'NODE_NAME_IN_MENU'    => 1,
  'NODE_NAME_IN_INDEX'   => 1,
  'SHORT_REF'            => 1,
  'COMPLEX_FORMAT_IN_TABLE' => 0,
  'WORDS_IN_PAGE'        => 300,
  'SECTION_BUTTONS'      => [[ 'NodeNext', \&_default_node_direction ],
                             [ 'NodePrev', \&_default_node_direction ],
                             [ 'NodeUp', \&_default_node_direction ], ' ',
                             'Contents', 'Index'],
  'LINKS_BUTTONS'        => ['Top', 'Index', 'Contents', 'About', 
                              'Up', 'NextFile', 'PrevFile'],
#  'TOP_BUTTONS'          => ['Back', 'Forward', ' ',
#                             'Contents', 'Index', 'About'],
#
#  'MISC_BUTTONS'         => [ 'Top', 'Contents', 'Index', 'About' ],
#  'CHAPTER_BUTTONS'      => [ 'FastBack', 'FastForward', ' ',
#                              ' ', ' ', ' ', ' ',
#                              'Top', 'Contents', 'Index', 'About', ],
#  'SECTION_FOOTER_BUTTONS' => [ 'FastBack', 'Back', 'Up', 'Forward', 'FastForward' ],
#  'NODE_FOOTER_BUTTONS' => [ 'FastBack', 'Back', 'Up', 'Forward', 'FastForward' ],
  'misc_elements_targets'   => {
                             'Overview' => 'SEC_Overview',
                             'Contents' => 'SEC_Contents',
                             'Footnotes' => 'SEC_Foot',
                             'About' => 'SEC_About',
                             'Top' => 'SEC_Top',
                            },
  'misc_pages_file_string' => {
                              'Contents' => '_toc',
                              'Overview' => '_ovr',
                              'Footnotes' => '_fot',
                              'About' => '_abt'
                              },
  'misc_elements_order'  => ['Footnotes', 'Contents', 'Overview', 'About'],
  'DOCTYPE'              => '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">',
  'DEFAULT_RULE'         => '<hr>',
  'BIG_RULE'             => '<hr>',
  'MENU_SYMBOL'          => '&bull;',
  'MENU_ENTRY_COLON'     => ':',
  'INDEX_ENTRY_COLON'    => ':',
  'BODYTEXT'             => undef,
  'documentlanguage'     => 'en',
  'SHOW_TITLE'           => 1,
  'USE_TITLEPAGE_FOR_TITLE' => 0,
  'MONOLITHIC'           => 1,
# This is the default, mainly for tests; the caller should set them.  These
# values are in fact what should be set -- for now when TEST is true.
  'PROGRAM_AND_VERSION'  => 'texi2html',
  'PROGRAM_HOMEPAGE'     => 'http://www.gnu.org/software/texinfo/',
  'PROGRAM'              => 'texi2html',
  
  'BUTTONS_REL'          => \%BUTTONS_REL,
  'BUTTONS_ACCESSKEY'    => \%BUTTONS_ACCESSKEY,
  'BUTTONS_EXAMPLE'      => \%BUTTONS_EXAMPLE,
  'BUTTONS_GOTO'         => \%BUTTONS_GOTO,
  'BUTTONS_NAME'         => \%BUTTONS_NAME,
  'BUTTONS_TEXT'         => \%BUTTONS_TEXT,
  'ACTIVE_ICONS'         => \%ACTIVE_ICONS,
  'PASSIVE_ICONS'        => \%PASSIVE_ICONS,
  'SPECIAL_ELEMENTS_NAME' => \%SPECIAL_ELEMENTS_NAME,
  
  'DEBUG'                => 0,
  'TEST'                 => 0,
  'output_format'        => 'html',
);

foreach my $buttons ('CHAPTER_BUTTONS', 'SECTION_FOOTER_BUTTONS', 'NODE_FOOTER_BUTTONS',
  'MISC_BUTTONS', 'TOP_BUTTONS') {
  $defaults{$buttons} = [@{$defaults{'SECTION_BUTTONS'}}];
}

sub _defaults($)
{
  return %defaults;
}

my $NO_BULLET_LIST_STYLE = 'list-style: none';
my $NO_BULLET_LIST_CLASS = 'no-bullet';
my $NO_BULLET_LIST_ATTRIBUTE = ' class="'.$NO_BULLET_LIST_CLASS.'"';

my $MENU_PRE_STYLE = 'font-family: serif';

my %css_map = (
     "ul.$NO_BULLET_LIST_CLASS" => "$NO_BULLET_LIST_STYLE",
     'pre.menu-comment'       => "$MENU_PRE_STYLE",
     'pre.menu-preformatted'  => "$MENU_PRE_STYLE",
     'a.summary-letter'       => 'text-decoration: none',
     'blockquote.smallquotation' => 'font-size: smaller',
#     'pre.display'            => 'font-family: inherit',
#     'pre.smalldisplay'       => 'font-family: inherit; font-size: smaller',
     'pre.display'            => 'font-family: serif',
     'pre.smalldisplay'       => 'font-family: serif; font-size: smaller',
     'pre.smallexample'       => 'font-size: smaller',
     'span.sansserif'         => 'font-family:sans-serif; font-weight:normal',
     'span.roman'         => 'font-family:serif; font-weight:normal',
     'span.nocodebreak'   => 'white-space:pre',
     'span.nolinebreak'   => 'white-space:pre'
);

$css_map{'pre.format'} = $css_map{'pre.display'};
$css_map{'pre.smallformat'} = $css_map{'pre.smalldisplay'};
$css_map{'pre.smalllisp'} = $css_map{'pre.smallexample'};

my %preformatted_commands_context = %preformatted_commands;
$preformatted_commands_context{'verbatim'} = 1;

my %pre_class_commands;
my %pre_class_types;
foreach my $preformatted_command (keys(%preformatted_commands_context)) {
  $pre_class_commands{$preformatted_command} = $preformatted_command;
}
$pre_class_commands{'menu'} = 'menu-preformatted';
$pre_class_types{'menu_comment'} = 'menu-comment';

foreach my $indented_format ('example', 'display', 'lisp')
{
  $css_map{"div.$indented_format"} = 'margin-left: 3.2em';
  $css_map{"div.small$indented_format"} = 'margin-left: 3.2em';
}

# default specification of arguments formatting
my %default_commands_args = (
  'email' => [['code'], ['normal']],
  'anchor' => [['codestring']],
  'uref' => [['codestring'], ['normal'], ['normal']],
  'url' => [['codestring'], ['normal'], ['normal']],
  'printindex' => [[]],
  'sp' => [[]],
  'inforef' => [['code'],['normal'],['text']],
  'xref' => [['code'],['normal'],['normal'],['text'],['normal']],
  'pxref' => [['code'],['normal'],['normal'],['text'],['normal']],
  'ref' => [['code'],['normal'],['normal'],['text'],['normal']],
  'image' => [['text'],['text'],['text'],['string'],['text']],
);

# Default for the function references used for the formatting
# of commands.
my %default_commands_conversion;

# Ignored commands

my %kept_misc_commands;

my @informative_global_commands = ('contents', 'shortcontents',
  'summarycontents', 'allowcodebreaks', 'documentlanguage',
  'footnotestyle');
# taken from global
# 'xrefautomaticsectiontitle' (or in Parser?)
# 'documentencoding'
# 'setcontentsaftertitlepage', 'setshortcontentsaftertitlepage'
# 'novalidate'
foreach my $misc_command(@informative_global_commands,
        'verbatiminclude', 'insertcopying', 'printindex', 'listoffloats',
        'shorttitle', 'shorttitlepage', 'author', 'subtitle',
        'title', keys(%default_index_commands), 
        keys(%formatting_misc_commands)) {
  $kept_misc_commands{$misc_command} = 1;
}

sub _global_commands($)
{
  return @informative_global_commands;
}

#my %ignored_misc_commands;
foreach my $misc_command (keys(%misc_commands)) {
#  $ignored_misc_commands{$misc_command} = 1 
  $default_commands_conversion{$misc_command} = undef
    unless ($kept_misc_commands{$misc_command});
}

foreach my $ignored_brace_commands ('caption', 'shortcaption', 
  'hyphenation') {
  #$ignored_commands{$ignored_brace_commands} = 1;
  $default_commands_conversion{$ignored_brace_commands} = undef;
}

# commands that leads to advancing the paragraph number.  This is mostly
#used to determine the first line, in fact.
my %advance_paragraph_count_commands;
foreach my $command (keys(%block_commands)) {
  next if ($menu_commands{$command} 
            or $block_commands{$command} eq 'raw');
  $advance_paragraph_count_commands{$command} = 1;
}

foreach my $ignored_block_commands ('ignore', 'macro', 'rmacro', 'copying',
  'documentdescription', 'titlepage', 'direntry') {
  #$ignored_commands{$ignored_block_commands} = 1;
  $default_commands_conversion{$ignored_block_commands} = undef;
};

# Formatting of commands without args

# The hash holding the defaults for the formatting of
# most commands without args 
my %default_commands_formatting;

foreach my $command (keys(%{$Texinfo::Convert::Converter::default_xml_commands_formatting{'normal'}})) {
  $default_commands_formatting{'normal'}->{$command} = 
    $Texinfo::Convert::Converter::default_xml_commands_formatting{'normal'}->{$command};
}

$default_commands_formatting{'normal'}->{' '} = '&nbsp;';
$default_commands_formatting{'normal'}->{"\t"} = '&nbsp;';
$default_commands_formatting{'normal'}->{"\n"} = '&nbsp;';

foreach my $command (keys(%{$default_commands_formatting{'normal'}})) {
  $default_commands_formatting{'preformatted'}->{$command} = 
     $default_commands_formatting{'normal'}->{$command};
#       unless exists($default_commands_formatting{'preformatted'}->{$command});
  $default_commands_formatting{'string'}->{$command} =
     $default_commands_formatting{'normal'}->{$command};
#       unless exists($default_commands_formatting{'string'}->{$command});
}

$default_commands_formatting{'normal'}->{'enddots'} 
    = '<small class="enddots">...</small>';
$default_commands_formatting{'normal'}->{'*'} = '<br>';


sub _convert_no_arg_command($$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;

  if ($cmdname eq 'click' and $command->{'extra'} 
      and exists($command->{'extra'}->{'clickstyle'})) {
    $cmdname = $command->{'extra'}->{'clickstyle'};
  }

  my $result;
  if ($self->in_preformatted() or $self->in_math()) {
    $result = $self->{'commands_formatting'}->{'preformatted'}->{$cmdname};
  } elsif ($self->in_string()) {
    $result = $self->{'commands_formatting'}->{'string'}->{$cmdname};
  } else {
    $result = $self->{'commands_formatting'}->{'normal'}->{$cmdname};
  }
  return $result;
}

foreach my $command(keys(%{$default_commands_formatting{'normal'}})) {
  $default_commands_conversion{$command} = \&_convert_no_arg_command;
}

sub _convert_today_command($$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;

  my $tree = $self->expand_today();
  return $self->convert_tree($tree);
}

$default_commands_conversion{'today'} = \&_convert_today_command;

# style commands

my %quoted_style_commands;
foreach my $quoted_command ('file', 'option', 'samp') {
  $quoted_style_commands{$quoted_command} = 1;
}

my %style_attribute_commands;
$style_attribute_commands{'normal'} = {
      'b'           => 'b',
      'cite'        => 'cite',
      'code'        => 'code',
      'command'     => 'code',
      'dfn'         => 'em',
      'emph'        => 'em',
      'env'         => 'code',
      'file'        => 'tt',
      'headitemfont' => 'b', # not really that, in fact it is 
                             # in <th> rather than <td>
      'i'           => 'i',
      'slanted'     => 'i',
      'sansserif'   => 'span class="sansserif"',
      'kbd'         => 'kbd',
      'option'      => 'samp',
      'r'           => 'span class="roman"',
      'samp'        => 'samp',
      'sc'          => 'small',
      'strong'      => 'strong',
      't'           => 'tt',
      'var'         => 'var',
      'verb'        => 'tt',
      'math'        => 'em',
};

my %style_commands_formatting;

# this weird construct does like uniq, it avoids duplicates.
# it is required since math is not in the %style_commands as it is 
# context command.
my @all_style_commands = keys %{{ map { $_ => 1 } (keys(%style_commands), 
                                                   keys(%{$style_attribute_commands{'normal'}})) }};

foreach my $command(@all_style_commands) {
  # default is no attribute.
  if ($style_attribute_commands{'normal'}->{$command}) {
    $style_commands_formatting{'normal'}->{$command}->{'attribute'}
     = $style_attribute_commands{'normal'}->{$command};
    $style_commands_formatting{'preformatted'}->{$command}->{'attribute'}
     = $style_attribute_commands{'normal'}->{$command};
  }
  if ($style_attribute_commands{'preformatted'}->{$command}) {
    $style_commands_formatting{'preformatted'}->{$command}->{'attribute'} =
      $style_attribute_commands{'preformatted'}->{$command}; 
  }
  if ($quoted_style_commands{$command}) {
    foreach my $context ('normal', 'string', 'preformatted') {
      $style_commands_formatting{$context}->{$command}->{'quote'} = 1;
    }
  }
  $default_commands_conversion{$command} = \&_convert_style_command;
}

delete $style_commands_formatting{'preformatted'}->{'sc'}->{'attribute'};
delete $style_commands_formatting{'preformatted'}->{'sc'};

#      'key',        {'begin' => '&lt;', 'end' => '&gt;'},
#      'indicateurl', {'begin' => '&lt;<code>', 'end' => '</code>&gt;'},

sub _parse_attribute($)
{
  my $element = shift;
  return ('', '', '') if (!defined($element));
  my ($class, $attributes) = ('', '');
  if ($element =~ /^(\w+)(\s+.*)/)
  {
    $element = $1;
    $attributes = $2;
    if ($attributes =~ s/^\s+class=\"([^\"]+)\"//) {
      $class = $1;
    }
  }
  return ($element, $class, $attributes);
}

sub _convert_style_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $text = $args->[0]->{'normal'};
  if (!defined($text)) {
    # happens with bogus @-commands without argument, like @strong something
    #cluck "text not defined in _convert_style_command";
    #print STDERR Texinfo::Structuring::_print_current($command);
    return '';
  }

  my $attribute_hash = {};
  if ($self->in_preformatted()) {
    $attribute_hash = $self->{'style_commands_formatting'}->{'preformatted'};
  } elsif (!$self->in_string()) {
    $attribute_hash = $self->{'style_commands_formatting'}->{'normal'};
  }
  if (defined($attribute_hash->{$cmdname})) {
    if (defined($attribute_hash->{$cmdname}->{'attribute'})) {
      my ($style, $class, $attribute_text)
        = _parse_attribute ($attribute_hash->{$cmdname}->{'attribute'});
      $text = $self->attribute_class($style, $class) . "$attribute_text>" 
              . $text . "</$style>";
    }
    if (defined($attribute_hash->{$cmdname}->{'quote'})) {
      $text = $self->get_conf('OPEN_QUOTE_SYMBOL') . $text
                . $self->get_conf('CLOSE_QUOTE_SYMBOL');
    }
  }
  return $text;
}

sub _convert_email_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $mail_arg = shift @$args;
  my $text_arg = shift @$args;
  my $mail = '';
  if (defined($mail_arg)) {
    $mail = $mail_arg->{'code'};
  }
  # $mail = main::normalise_space($mail);
  my $text = '';
  if (defined($text_arg)) {
    $text = $text_arg->{'normal'};
    # $text = main::normalise_space($text);
  }
  $text = $mail unless ($text ne '');
  return $text if ($mail eq '');
  return "<a href=\"mailto:$mail\">$text</a>";
}

$default_commands_conversion{'email'} = \&_convert_email_command;

sub _convert_anchor_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $id = $self->command_id ($command);
  if (defined($id)) {
    return "<a name=\"$id\"></a>";
  }
  return '';
}

$default_commands_conversion{'anchor'} = \&_convert_anchor_command;

my $foot_num;
my $foot_lines;
my $NO_NUMBER_FOOTNOTE_SYMBOL = '*';

sub _convert_footnote_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $number_in_doc;
  $foot_num++;
  if ($self->get_conf('NUMBER_FOOTNOTES')) {
    $number_in_doc = $foot_num;
  } else {
    $number_in_doc = $NO_NUMBER_FOOTNOTE_SYMBOL;
  }
  
  #print STDERR "FOOTNOTE $command\n";
  my $docid  = $self->command_id($command);
  my $footid = $self->command_target($command);
  # happens for bogus footnotes
  if (!defined($footid)) {
    die "docid defined but not footid for footnote $foot_num\n"
      if (defined($docid));
    return '';
  }

  my $document_filename = $self->{'current_filename'};
  my $footnote_filename = $self->command_filename($command);
  $footnote_filename = '' if (!defined($footnote_filename));
  $document_filename = '' if (!defined($document_filename));

  if ($document_filename eq $footnote_filename) {
    $document_filename = $footnote_filename = '';
  }
  my $footnote_text;
  if ($args->[0]) {
    $footnote_text = $args->[0]->{'normal'};
  } else {
    $footnote_text = '';
  }
  chomp ($footnote_text);
  $footnote_text .= "\n";

  $foot_lines .= '<h3>' .
   "<a name=\"$footid\" href=\"$document_filename#$docid\">($number_in_doc)</a></h3>\n"
   . $footnote_text;
  

  return "<a name=\"$docid\" href=\"$footnote_filename#$footid\">($number_in_doc)</a>";
}
$default_commands_conversion{'footnote'} = \&_convert_footnote_command;

sub _convert_uref_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $url_arg = shift @$args;
  my $text_arg = shift @$args;
  my $replacement_arg = shift @$args;

  my $url = $url_arg->{'codestring'} if defined($url_arg);
  my $text = $text_arg->{'normal'} if defined($text_arg);
  my $replacement = $replacement_arg->{'normal'} if defined($replacement_arg);

  $text = $replacement if (defined($replacement) and $replacement ne '');
  $text = $url if (!defined($text) or $text eq '');
  return $text if (!defined($url) or $url eq '');
  return "<a href=\"$url\">$text</a>";
}

$default_commands_conversion{'uref'} = \&_convert_uref_command;
$default_commands_conversion{'url'} = \&_convert_uref_command;

my @image_files_extensions = ('.png', '.jpg');
sub _convert_image_command($$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my @extensions = @image_files_extensions;

  if (defined($args->[0]->{'text'})) {
    my $basefile = $args->[0]->{'text'};
    my $extension;
    if (defined($args->[4]) and defined($args->[4]->{'text'})) {
      $extension = $args->[4]->{'text'};
      # FIXME determine with Karl if this is correct.
      unshift @extensions, ".$extension";
      unshift @extensions, "$extension";
    }
    my $image_file;
    foreach my $extension (@extensions) {
      if ($self->Texinfo::Common::locate_include_file ($basefile.$extension)) {
        # use the basename and not the file found.  It is agreed that it is
        # better, since in any case the files are moved.
        $image_file = $basefile.$extension;
        last;
      }
    }
    if (!defined($image_file) or $image_file eq '') {
      if (defined($extension) and $extension ne '') {
        $image_file = "$basefile.$extension";
      } else {
        $image_file = "$basefile.jpg";
      }
      $self->line_warn(sprintf($self->__("\@image file `%s' (for HTML) not found, using `%s'"), $basefile, $image_file), $command->{'line_nr'});
    }
    my $alt;
    if (defined($args->[3]) and defined($args->[3]->{'string'})) {
      $alt = $args->[3]->{'string'};
    }
    $alt = $self->xml_protect_text($basefile) 
       if (!defined($alt) or ($alt eq ''));
    return "[ $alt ]" if ($self->in_preformatted());
    return "<img src=\"".$self->xml_protect_text($image_file)."\" alt=\"$alt\">";
  }
  return '';
}

$default_commands_conversion{'image'} = \&_convert_image_command;

#sub _convert_math_command($$$$)
#{
#  my $self = shift;
#  my $cmdname = shift;
#  my $command = shift;
#  my $args = shift;
#
#  return $args->[0]->{'normal'};
#}

#$default_commands_conversion{'math'} = \&_convert_math_command;

sub _convert_accent_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  return $self->xml_accents($command);
}

foreach my $command (keys(%accent_commands)) {
  $default_commands_conversion{$command} = \&_convert_accent_command;
}

sub _default_comment($$) {
  my $self = shift;
  my $text = shift;
  return $self->xml_default_comment($text);
}

sub _default_heading_text($$$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $text = shift;
  my $level = shift;
  my $command = shift;

  return '' if ($text !~ /\S/);
  # FIXME use a class=*contents?
  my $class = '';
  if ($cmdname and $cmdname !~ /contents$/) {
    $class = $cmdname;
    $class = 'node-heading' if ($cmdname eq 'node');
  }
  my $align = '';
  $align = ' align="center"' if ($cmdname eq 'centerchap' or $cmdname eq 'settitle');
  $level = 1 if ($level == 0);
  my $result = $self->attribute_class ("h$level", $class) ."$align>$text</h$level>";
  # FIXME titlefont appears inline in text, so no end of line is
  # added. The end of line should be added by the user if needed.
  $result .= "\n" unless ($cmdname eq 'titlefont');
  $result .= $self->get_conf('DEFAULT_RULE') . "\n" 
     if ($cmdname eq 'part' 
         and defined($self->get_conf('DEFAULT_RULE')) 
         and $self->get_conf('DEFAULT_RULE') ne '');
  return $result;
}

# Associated to a button
sub _default_node_direction($$)
{
  my $self = shift;
  my $direction = shift;
  
  my $result = undef;
  my $href = $self->_element_direction($self->{'current_element'},
                                           $direction, 'href');
  my $node = $self->_element_direction($self->{'current_element'},
                                           $direction, 'node');
  if ($href and $node) {
    my $anchor_attributes = $self->_direction_href_attributes($direction);
    my $anchor = "<a href=\"$href\"${anchor_attributes}>$node</a>";
    # i18n
    $result = $self->get_conf('BUTTONS_TEXT')->{$direction}.": $anchor";
  }
  return $result;  
}

# how to create IMG tag
# this is only used in html, and only if ICONS is set and the button
# is active.
sub _default_button_icon_img($$$;$)
{
  my $self = shift;
  my $button = shift;
  my $icon = shift;
  my $name = shift;
  return '' if (!defined($icon));
  $button = "" if (!defined ($button));
  $name = '' if (!defined($name));
  my $alt = '';
  if ($name ne '') {
    if ($button ne '') {
      $alt = "$button: $name";
    } else {
      $alt = $name;
    }
  } else {
    $alt = $button;
  }
  return qq{<img src="$icon" border="0" alt="$alt" align="middle">};
}

sub _direction_href_attributes($$)
{
  my $self = shift;
  my $direction = shift;

  my $href_attributes = '';
  if ($self->get_conf('USE_ACCESSKEY') 
      and $self->get_conf('BUTTONS_ACCESSKEY')) {
    my $accesskey = $self->get_conf('BUTTONS_ACCESSKEY')->{$direction};
    if (defined($accesskey) and ($accesskey ne '')) {
      $href_attributes = " accesskey=\"$accesskey\"";
    }
  }
  if ($self->get_conf('USE_REL_REV') and $self->get_conf('BUTTONS_REL')) {
    my $button_rel = $self->get_conf('BUTTONS_REL')->{$direction};
    if (defined($button_rel) and ($button_rel ne '')) {
      $href_attributes .= " rel=\"$button_rel\"";
    }
  }
  return $href_attributes;
}

sub _default_button_formatting($$)
{
  my $self = shift;
  my $button = shift;

  my ($active, $passive);
  if (ref($button) eq 'CODE') {
    $active = &$button($self);
  } elsif (ref($button) eq 'SCALAR') {
    $active = "$$button" if defined($$button);
  } elsif (ref($button) eq 'ARRAY') {
    my $text = $button->[1];
    my $button_href = $button->[0];
    # verify that $button_href is simple text and text is a reference
    if (defined($button_href) and !ref($button_href)
        and defined($text) and (ref($text) eq 'SCALAR') and defined($$text)) {
      # use given text
      my $href = $self->_element_direction($self->{'current_element'}, 
                                           $button_href, 'href');
      if ($href) {
        my $anchor_attributes = $self->_direction_href_attributes($button_href);
        $active = "<a href=\"$href\"${anchor_attributes}>$$text</a>";
      } else {
        $passive = $$text;
      }
    } elsif (defined($button_href) and !ref($button_href)
             and defined($text) and (ref($text) eq 'CODE')) {
      $active = &$text($self, $button_href);
    }
  } elsif ($button eq ' ') {
    # handle space button
    if ($self->get_conf('ICONS') and $self->get_conf('ACTIVE_ICONS')
        and defined($self->get_conf('ACTIVE_ICONS')->{' '})) {
      $active = &{$self->{'button_icon_img'}}($self, $button, 
                                       $self->get_conf('ACTIVE_ICONS')->{' '});
    } else {
      $active = $self->get_conf('BUTTONS_TEXT')->{' '};
    }
  } else {
    my $href = $self->_element_direction($self->{'current_element'}, 
                                         $button, 'href');
    if ($href) {
      # button is active
      my $btitle = '';
      if ($self->get_conf('BUTTONS_GOTO') 
          and defined($self->get_conf('BUTTONS_GOTO')->{$button})) {
        $btitle = ' title="' . $self->get_conf('BUTTONS_GOTO')->{$button} . '"';
      }
      if ($self->get_conf('USE_ACCESSKEY') and $self->get_conf('BUTTONS_ACCESSKEY')) {
        my $accesskey = $self->get_conf('BUTTONS_ACCESSKEY')->{$button};
        if (defined($accesskey) and $accesskey ne '') {
          $btitle .= " accesskey=\"$accesskey\"";
        }
      }
      if ($self->get_conf('USE_REL_REV') and ($self->get_conf('BUTTONS_REL'))) {
        my $button_rel = $self->get_conf('BUTTONS_REL')->{$button};
        if (defined($button_rel) and $button_rel ne '') {
          $btitle .= " rel=\"$button_rel\"";
        }
      }
      my $use_icon;
      if ($self->get_conf('ICONS') and $self->get_conf('ACTIVE_ICONS')
          and $self->get_conf('BUTTONS_NAME')) {
        my $active_icon = $self->get_conf('ACTIVE_ICONS')->{$button};
        my $button_name = $self->get_conf('BUTTONS_NAME')->{$button};
        if (defined($active_icon) and $active_icon ne '' 
            and defined($button_name)) {
          # use icon
          $active = "<a href=\"$href\"${btitle}>".
             &{$self->{'button_icon_img'}}($self, $button_name, $active_icon,
                      $self->_element_direction($self->{'current_element'},
                                       $button, 'string')) ."</a>";
          $use_icon = 1;
        }
      }
      if (!$use_icon) {
        # use text
        $active = '[' . "<a href=\"$href\"${btitle}>".
          $self->get_conf('BUTTONS_TEXT')->{$button}."</a>" . ']';
      }
    } else {
      # button is passive
      my $use_icon;
      if ($self->get_conf('ICONS') and $self->get_conf('PASSIVE_ICONS')
          and $self->get_conf('BUTTONS_NAME')) {
        my $passive_icon = $self->get_conf('PASSIVE_ICONS')->{$button};
        my $button_name = $self->get_conf('BUTTONS_NAME')->{$button};
        if ($passive_icon and $passive_icon ne '') {
          $passive = &{$self->{'button_icon_img'}}($self, $button_name, 
                                                   $passive_icon,
                      $self->_element_direction($self->{'current_element'},
                                       $button, 'string'));
          $use_icon = 1;
        }
      }
      if (!$use_icon) {
        $passive =  '[' . $self->get_conf('BUTTONS_TEXT')->{$button} . ']';
      }
    }
  }
  return ($active, $passive);
}

my %html_default_node_directions;
foreach my $node_directions ('NodeNext', 'NodePrev', 'NodeUp') {
  $html_default_node_directions{$node_directions} = 1;
}

sub _default_navigation_header_panel($$$$)
{
  my $self = shift;
  my $buttons = shift;
  my $cmdname = shift;
  my $command = shift;

  # if VERTICAL_HEAD_NAVIGATION, the buttons are in a vertical table which
  # is itself in the first column of a table opend in header_navigation
  my $vertical = $self->get_conf('VERTICAL_HEAD_NAVIGATION');

  my $first_button = 1;
  my $result = '';
  if ($self->get_conf('HEADER_IN_TABLE')) {
    $result .= $self->attribute_class('table', 'header')
        .' cellpadding="1" cellspacing="1" border="0">'."\n";
    $result .= "<tr>" unless $vertical;
  } else {
    $result .= $self->attribute_class('div', 'header').">\n<p>\n";
  }
  foreach my $button (@$buttons) {
    if ($self->get_conf('HEADER_IN_TABLE')) {
      $result .= qq{<tr valign="top" align="left">\n} if $vertical;
      $result .=  qq{<td valign="middle" align="left">};
    }
    my $direction;
    if (ref($button) eq 'ARRAY' 
        and defined($button->[0]) and !ref($button->[0])) {
      $direction = $button->[0];
    } elsif (defined($button) and !ref($button)) {
      $direction = $button;
    }

    my ($active, $passive) = &{$self->{'button_formatting'}}($self, $button);
    if ($self->get_conf('HEADER_IN_TABLE')) {
      if (defined($active)) {
        $first_button = 0 if ($first_button);
        $result .= $active;
      } elsif (defined($passive)) {
        $first_button = 0 if ($first_button);
        $result .= $passive;
      }
      $result .= "</td>\n";
      $result .= "</tr>\n" if $vertical;
    }
    elsif (defined($active)) { 
      # only active buttons are print out when not in table
      if (defined($direction) 
          and $html_default_node_directions{$direction} and !$first_button) {
        $active = ', ' .$active;
      }
      $result .= $active;
      $first_button = 0 if ($first_button);
    }
  }
  if ($self->get_conf('HEADER_IN_TABLE')) {
    $result .= "</tr>" unless $vertical;
    $result .= "</table>\n";
  } else {
     $result .= "</p>\n</div>\n";
  }
  return $result;
}

sub _default_navigation_header($$$$)
{
  my $self = shift;
  my $buttons = shift;
  my $cmdname = shift;
  my $command = shift;

  my $result = '';
  if ($self->get_conf('VERTICAL_HEAD_NAVIGATION')) {
    $result .= '<table border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<td align="left">
';
  }
  $result .= &{$self->{'navigation_header_panel'}}($self, $buttons,
                                                   $cmdname, $command);
  if ($self->get_conf('VERTICAL_HEAD_NAVIGATION')) {
    $result .= '</td>
<td align="left">
';
  } elsif ($self->get_conf('SPLIT') eq 'node') {
    $result .= $self->get_conf('DEFAULT_RULE')."\n";
  }
  return $result;
}

# it is considered 'top' only if element corresponds to @top or 
# element is a node
sub _element_is_top($$)
{
  my $self = shift;
  my $element = shift;
  return ($self->{'global_target_elements'}->{'Top'}
    and $self->{'global_target_elements'}->{'Top'} eq $element
    and $element->{'extra'}
    and (($element->{'extra'}->{'section'} 
         and $element->{'extra'}->{'section'}->{'cmdname'} eq 'top')
         or ($element->{'extra'}->{'element_command'}
             and $element->{'extra'}->{'element_command'}->{'cmdname'} eq 'node')));
}

sub _convert_heading_command($$$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;
  my $contents = shift;

  my $content_ref = '';
  if ($self->get_conf('TOC_LINKS')) {
    my $content_href = $self->command_contents_href($command, 'contents',
                                      $self->{'current_filename'});
    if ($content_href) {
      $content_ref = " href=\"$content_href\"";
    }
  }
  my $result = '';
  my $element_id = $self->command_id($command);
  $result .= "<a name=\"$element_id\"${content_ref}></a>\n" 
    if (defined($element_id));

  print STDERR "Process $command "
        .Texinfo::Structuring::_print_root_command_texi($command)."\n"
          if ($self->get_conf('DEBUG'));
  my $element;
  if ($root_commands{$command->{'cmdname'}} and $command->{'parent'}
      and $command->{'parent'}->{'type'} 
      and $command->{'parent'}->{'type'} eq 'element') {
    $element = $command->{'parent'};
    print STDERR "Element $element (@{$element->{'contents'}}) ".
       Texinfo::Structuring::_print_element_command_texi($element) ."\n"
          if ($self->get_conf('DEBUG'));
    #print STDERR "First in element: "
    #    .Texinfo::Parser::_print_current($element->{'contents'}->[0])
    #      if ($self->get_conf('DEBUG'));
    # First command in the element
    if (($element->{'contents'}->[0] eq $command
         or (!$element->{'contents'}->[0]->{'cmdname'} 
              and $element->{'contents'}->[1] eq $command))
        # and there is more than one element
        and ($element->{'element_next'} or $element->{'element_prev'})) {
      my $is_top = $self->_element_is_top($element);
      my $first_in_page = ($element->{'parent'} 
               and $element->{'parent'}->{'contents'}->[0] eq $element);
      my $previous_is_top = 0;
      if ($self->{'global_target_elements'}->{'Top'}) {
       $previous_is_top = (defined($element->{'element_prev'}) 
          and $self->{'global_target_elements'}->{'Top'} eq $element->{'element_prev'});
      }
      print STDERR "Header ($previous_is_top, $is_top, $first_in_page): "
        .Texinfo::Structuring::_print_root_command_texi($command)."\n"
          if ($self->get_conf('DEBUG'));
      if ($is_top) {
        # FIXME clarify this
        # this is here because we want to always print the head navigation for top
        # and use TOP_BUTTONS
        $result .= &{$self->{'navigation_header'}}($self, 
                 $self->get_conf('TOP_BUTTONS'), $cmdname, $command)
         if ($self->get_conf('SPLIT') or $self->get_conf('HEADERS'));
      } else {
        if (($first_in_page or $previous_is_top) 
             and $self->get_conf('HEADERS')) {
          $result .= &{$self->{'navigation_header'}}($self, 
                  $self->get_conf('SECTION_BUTTONS'), $cmdname, $command);
        } else {  
        # FIXME what about chapter?
          # got to do this here, as it isn't done otherwise since 
          # header_navigation is not called
          $result .= &{$self->{'navigation_header_panel'}}($self,
                  $self->get_conf('SECTION_BUTTONS'), $cmdname, $command)
            if ($self->get_conf('HEADERS') or $self->get_conf('SPLIT') eq 'node');
        }
      }
    }
  }

  my $heading_level;
  # FIXME this is done as in texi2html: node is used as heading if there 
  # is nothing else.  Is it right?
  if ($cmdname eq 'node') {
    if (!$element or (!$element->{'extra'}->{'section'}
                      and $element->{'extra'}->{'node'}
                      and $element->{'extra'}->{'node'} eq $command)) {
      if ($command->{'extra'}->{'normalized'} eq 'Top') {
        $heading_level = 0;
      } else {
        $heading_level = 3;
      }
    }
  } else {
    $heading_level = $command->{'level'};
  }

  my $heading = $self->command_text($command, 'text');
  if ($heading ne '' and defined($heading_level)) {
    if ($self->in_preformatted()) {
      $result .= '<strong>'.$heading.'</strong>'."\n";
    } else {
      $result .= &{$self->{'heading_text'}}($self, $cmdname, $heading, 
                                            $heading_level, $command);
    }
  }
  $result .= $contents if (defined($contents));
  return $result;
}

foreach my $command (keys(%sectioning_commands), 'node') {
  $default_commands_conversion{$command} = \&_convert_heading_command;
}

sub _convert_raw_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $contents = shift;

  if ($cmdname eq $self->{'output_format'}) {
    chomp ($contents);
    return $contents;
  # FIXME compatibility with texi2html
  } elsif ($cmdname eq 'tex') {
    return $self->attribute_class('pre', $cmdname).'>' 
          .$self->xml_protect_text($contents) . '</pre>';
  }
  $self->line_warn(sprintf($self->__("Raw format %s is not converted"), $cmdname),
                   $command->{'line_nr'});
  return $self->xml_protect_text($contents);
}

foreach my $command (@out_formats) {
  $default_commands_conversion{$command} = \&_convert_raw_command;
}

my %indented_preformatted_commands;
foreach my $indented_format ('example', 'display', 'lisp') {
  $indented_preformatted_commands{$indented_format} = 1;
  $indented_preformatted_commands{"small$indented_format"} = 1;
}

sub _convert_preformatted_commands($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;

  if ($self->get_conf('COMPLEX_FORMAT_IN_TABLE')) {
    if ($indented_preformatted_commands{$cmdname}) {
      return '<table><tr><td>&nbsp;</td><td>'.$content."</td></tr></table>\n";
    } else {
      return $content."\n";
    }
  } else {
    return $self->attribute_class('div', $cmdname).">\n".$content.'</div>'."\n";
  }
}

foreach my $preformatted_command (keys(%preformatted_commands)) {
  $default_commands_conversion{$preformatted_command} 
  = \&_convert_preformatted_commands;
}

sub _convert_verbatim_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $contents = shift;

  return $self->attribute_class('pre', $cmdname).'>' 
          .$contents . '</pre>';
}

$default_commands_conversion{'verbatim'} = \&_convert_verbatim_command;

sub _convert_verbatiminclude_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $verbatim_include_verbatim = $self->expand_verbatiminclude($command);
  if (defined($verbatim_include_verbatim)) {
    return $self->convert_tree($verbatim_include_verbatim);
  } else {
    return '';
  }
}

$default_commands_conversion{'verbatiminclude'} 
  = \&_convert_verbatiminclude_command;

sub _convert_sp_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  if (defined($command->{'extra'}->{'misc_args'}->[0])) {
    my $sp_nr = $command->{'extra'}->{'misc_args'}->[0];
    if ($self->in_preformatted()) {
      return "\n" x $sp_nr;
    } else {
      return "<br>\n" x $sp_nr;
    }
  }
}

$default_commands_conversion{'sp'} = \&_convert_sp_command;

sub _convert_exdent_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  # FIXME do something better with css and span?
  my $preformatted = $self->in_preformatted();
  
  if ($preformatted) {
    return $self->_convert_preformatted_type($cmdname, $command, $args->[0]->{'normal'} ."\n");
  } else {
    # ignore alignment information
    return "<p>".$args->[0]->{'normal'} ."\n</p>";
  }
}

$default_commands_conversion{'exdent'} = \&_convert_exdent_command;

sub _convert_center_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $preformatted = $self->in_preformatted();
  
  if ($preformatted) {
    return $self->_convert_preformatted_type($cmdname, $command, $args->[0]->{'normal'} ."\n");
  } else {
    return "<p align=\"center\">".$args->[0]->{'normal'} ."\n</p>";
  }
}

$default_commands_conversion{'center'} = \&_convert_center_command;

sub _convert_author_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  return '' if (!$args->[0] or !$command->{'extra'}->{'titlepage'});
  return "<strong>$args->[0]->{'normal'}</strong><br>\n";
}

$default_commands_conversion{'author'} = \&_convert_author_command;

my $html_menu_entry_index;
sub _convert_menu_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $contents = shift;

  return $contents if ($cmdname eq 'detailmenu');

  $html_menu_entry_index = 0;
  if ($contents !~ /\S/) {
    return '';
  }
  my $begin_row = '';
  my $end_row = '';
  if ($self->in_preformatted()) {
    $begin_row = '<tr><td>';
    $end_row = '</td></tr>';
  }
  return $self->attribute_class('table', 'menu')
    ." border=\"0\" cellspacing=\"0\">${begin_row}\n"
      . $contents . "${end_row}</table>\n";
}
$default_commands_conversion{'menu'} = \&_convert_menu_command;
$default_commands_conversion{'detailmenu'} = \&_convert_menu_command;

sub _convert_quotation_command($$$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;
  my $contents = shift;

  my $class = '';
  $class = $cmdname if ($cmdname ne 'quotation');

  my $attribution = '';
  if ($command->{'extra'} and $command->{'extra'}->{'authors'}) {
    foreach my $author (@{$command->{'extra'}->{'authors'}}) {
      my $centered_author = $self->gdt("\@center --- \@emph{{author}}\n",
         {'author' => $author->{'extra'}->{'misc_content'}});
      $centered_author->{'parent'} = $command;
      $attribution .= $self->convert_tree($centered_author);
    }
  }
  return $self->attribute_class('blockquote', $class).">\n" .$contents 
    ."</blockquote>\n" . $attribution;
}
$default_commands_conversion{'quotation'} = \&_convert_quotation_command;
$default_commands_conversion{'smallquotation'} = \&_convert_quotation_command;

sub _convert_itemize_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $contents = shift;

  if ($command->{'extra'}->{'command_as_argument'} 
     and $command->{'extra'}->{'command_as_argument'}->{'cmdname'} eq 'bullet') {
    return "<ul>\n" . $contents. "</ul>\n";
  } else {
    return $self->attribute_class('ul',$NO_BULLET_LIST_CLASS).">\n" 
            . $contents . "</ul>\n";
  }
}

$default_commands_conversion{'itemize'} = \&_convert_itemize_command;

sub _convert_item_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $contents = shift;

  if ($command->{'parent'} 
      and $command->{'parent'}->{'cmdname'} eq 'itemize') {
    my $prepend ;
    my $itemize = $command->{'parent'};
    if ($itemize->{'extra'}->{'command_as_argument'} 
       and $itemize->{'extra'}->{'command_as_argument'}->{'cmdname'} eq 'bullet') {
      $prepend = '';
    } else {
      $prepend = $self->convert_tree(
         {'contents' => $itemize->{'extra'}->{'block_command_line_contents'}->[0]});
    }
    if ($contents =~ /\S/) {
      return '<li>' . $prepend .' '. $contents . '</li>';
    } else {
      return '';
    }
  }
  return 'TODO';
}
$default_commands_conversion{'item'} = \&_convert_item_command;

sub _convert_xref_commands($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $root = shift;
  my $args = shift;

  my $tree;
  my $name;
  if (defined($args->[2]->{'normal'}) and $args->[2]->{'normal'} ne '') {
    $name = $args->[2]->{'normal'};
  } elsif (defined($args->[1]->{'normal'}) and $args->[1]->{'normal'} ne '') {
    $name = $args->[1]->{'normal'}
  }

  if ($root->{'extra'}->{'node_argument'}
      and $root->{'extra'}->{'node_argument'}->{'normalized'}
      and !$root->{'extra'}->{'node_argument'}->{'manual_content'}
      and $self->{'labels'}
      and $self->{'labels'}->{$root->{'extra'}->{'node_argument'}->{'normalized'}}) {
    my $node 
     = $self->label_command($root->{'extra'}->{'node_argument'}->{'normalized'}); 
    my $command = $self->command_element_command($node);
    $command = $node if (!$node->{'extra'}->{'associated_section'}
                         or $node->{'extra'}->{'associated_section'} ne $command);
    my $href = $self->command_href($command);

    if (!defined($name)) {
      if (!$self->get_conf('SHORT_REF')) {
        $name = $self->command_text($command, 'text_nonumber');
      } elsif (defined($args->[0]->{'code'})) {
        $name = $args->[0]->{'code'};
      } else {
        $name = '';
      }
    }
    my $reference = $name;
    $reference = "<a href=\"$href\">$name</a>" if ($href ne '');

    if ($cmdname eq 'pxref') {
      if ($command->{'cmdname'} ne 'node') {
        $tree = $self->gdt('see section {reference_name}', 
         { 'reference_name' => {'type' => '_converted', 'text' => $reference} });
      } else {
        $tree = $self->gdt('see {reference_name}', 
         { 'reference_name' => {'type' => '_converted', 'text' => $reference} });
      }
    } elsif ($cmdname eq 'xref' or $cmdname eq 'inforef') {
      if ($command->{'cmdname'} ne 'node') {
        $tree = $self->gdt('See section {reference_name}',
         { 'reference_name' => {'type' => '_converted', 'text' => $reference} });
      } else {
        $tree = $self->gdt('See {reference_name}',
         { 'reference_name' => {'type' => '_converted', 'text' => $reference} });
      }
    } elsif ($cmdname eq 'ref') {
      $tree = $self->gdt('{reference_name}',
         { 'reference_name' => {'type' => '_converted', 'text' => $reference} });
    }
  } else {
    if ($cmdname eq 'inforef') {
      $args->[4] = $args->[3];
      $args->[3] = undef;
    }
    my $node_entry = {};
    $node_entry->{'node_content'} = $root->{'extra'}->{'node_argument'}->{'node_content'}
      if ($root->{'extra'}->{'node_argument'}->{'node_content'});

    my $file_arg_tree;
    my $file = '';
    if (defined($args->[3]->{'text'}) and $args->[3]->{'text'} ne '') {
      $file_arg_tree = $args->[3]->{'tree'};
      $file = $args->[3]->{'text'};
    }

    # file argument takes precedence over the file in the node (file)node entry
    if (defined($file_arg_tree)) {
      $node_entry->{'manual_content'} = $file_arg_tree;
    } elsif ($root->{'extra'}->{'node_argument'}->{'manual_content'}) {
      $node_entry->{'manual_content'} 
        = $root->{'extra'}->{'node_argument'}->{'manual_content'};
    }
    my $href = $self->command_href($node_entry);
    my $book = $args->[4]->{'normal'} if (defined($args->[4]->{'normal'})
                                        and $args->[4]->{'normal'} ne '');
    $name = $args->[0]->{'code'} if (!defined($name));
      
    if (!defined($book) and $file ne '') {
      $name = "($file)$name";
    }
    $name = '' if (!defined($name));
    my $reference = $name;
    $reference = "<a href=\"$href\">$name</a>" if ($href ne '');

    if ($cmdname eq 'pxref') {
      if (($book ne '') and ($href ne '')) {
        $tree = $self->gdt('see {reference} in @cite{{book}}', 
            { 'reference' => {'type' => '_converted', 'text' => $reference}, 
              'book' => {'type' => '_converted', 'text' => $book }});
      } elsif (($book ne '') and ($reference ne '')) {
        $tree = $self->gdt('see `{section}\' in @cite{{book}}', 
            { 'section' => {'type' => '_converted', 'text' => $reference}, 
              'book' => {'type' => '_converted', 'text' => $book }});
      } elsif ($book ne '') { # should seldom or even never happen
        $tree = $self->gdt('see @cite{{book}}', 
              {'book' => {'type' => '_converted', 'text' => $book }});
      } elsif ($href ne '') {
        $tree = $self->gdt('see {reference}', 
             { 'reference' => {'type' => '_converted', 'text' => $reference} });
      } elsif ($reference ne '') {
        $tree = $self->gdt('see `{section}\'', {
              'section' => {'type' => '_converted', 'text' => $reference} });
      }
    } elsif ($cmdname eq 'xref' or $cmdname eq 'inforef') {
      if (($book ne '') and ($href ne '')) {
        $tree = $self->gdt('See {reference} in @cite{{book}}', 
            { 'reference' => {'type' => '_converted', 'text' => $reference}, 
              'book' => {'type' => '_converted', 'text' => $book }});
      } elsif (($book ne '') and ($reference ne '')) {
        $tree = $self->gdt('See `{section}\' in @cite{{book}}', 
            { 'section' => {'type' => '_converted', 'text' => $reference}, 
              'book' => {'type' => '_converted', 'text' => $book }});
      } elsif ($book ne '') { # should seldom or even never happen
        $tree = $self->gdt('See @cite{{book}}', 
              {'book' => {'type' => '_converted', 'text' => $book }});
      } elsif ($href ne '') {
        $tree = $self->gdt('See {reference}', 
             { 'reference' => {'type' => '_converted', 'text' => $reference} });
      } elsif ($reference ne '') {
        $tree = $self->gdt('See `{section}\'', {
              'section' => {'type' => '_converted', 'text' => $reference} });
      }
    }
  }
  return $self->convert_tree($tree);
}
foreach my $command(keys(%ref_commands)) {
  $default_commands_conversion{$command} = \&_convert_xref_commands;
}

sub _convert_index_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $index_id = $self->command_id ($command);
  if (defined($index_id)) {
    return "<a name=\"$index_id\"></a>\n";
  }
  return '';
}
$default_commands_conversion{'cindex'} = \&_convert_index_command;

# not needed to initialize it for a document, since it is reset 
# in index_summary

sub _convert_printindex_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $index_name;
  if ($command->{'extra'} and $command->{'extra'}->{'misc_args'}
      and defined($command->{'extra'}->{'misc_args'}->[0])) {
    $index_name = $command->{'extra'}->{'misc_args'}->[0];
  } else {
    return '';
  }
  if (!$self->{'index_entries_by_letter'} 
      or !$self->{'index_entries_by_letter'}->{$index_name}
      or !@{$self->{'index_entries_by_letter'}->{$index_name}}) {
    return '';
  }

  #foreach my $letter_entry (@{$self->{'index_entries_by_letter'}->{$index_name}}) {
  #  print STDERR "IIIIIII $letter_entry->{'letter'}\n";
  #  foreach my $index_entry (@{$letter_entry->{'entries'}}) {
  #    print STDERR "   ".join('|', keys(%$index_entry))."||| $index_entry->{'key'}\n";
  #  }
  #}

  my $result = '';

  # First do the summary letters linking to the letters done below
  my %letter_id;
  my @non_alpha = ();
  my @alpha = ();
  # collect the links
  foreach my $letter_entry (@{$self->{'index_entries_by_letter'}->{$index_name}}) {
    my $symbol_idx = 0;
    my $letter = $letter_entry->{'letter'};
    # FIXME id or target?
    my $index_element_id = $self->_element_direction($self->{'current_element'},
                                                     'This', 'id');
    # FIXME use [[:alpha:]]
    my $is_symbol = $letter !~ /^[A-Za-z]/;
    my $identifier;
    if ($is_symbol) {
      $symbol_idx++;
      $identifier = $index_element_id . "_${index_name}_symbol-$symbol_idx";
    } else {
      $identifier = $index_element_id . "_${index_name}_letter-${letter}";
    }
    $letter_id{$letter} = $identifier;
    
    my $summary_letter_link = $self->attribute_class('a', 'summary-letter') 
       ." href=\"#$identifier\"><b>".$self->xml_protect_text($letter).'</b></a>';
    if ($is_symbol) {
      push @non_alpha, $summary_letter_link;
    } else {
      push @alpha, $summary_letter_link;
    }
  }
  # Format the summary letters
  my $join = '';
  my $non_alpha_text = '';
  my $alpha_text = '';
  $join = " &nbsp; \n<br>\n" if (@non_alpha and @alpha);
  if (@non_alpha) {
    $non_alpha_text = join("\n &nbsp; \n", @non_alpha) . "\n";
  }
  if (@alpha) {
    $alpha_text = join("\n &nbsp; \n", @alpha) . "\n &nbsp; \n";
  }
  # format the summary
  my $summary = "<table><tr><th valign=\"top\">" 
    . $self->_convert($self->gdt('Jump to')) .": &nbsp; </th><td>" .
    $non_alpha_text . $join . $alpha_text . "</td></tr></table>\n";

  $result .= $summary;

  # now format the index entries
  $result .= $self->attribute_class('table', "index-$index_name")
    ." border=\"0\">\n" . "<tr><td></td><th align=\"left\">"
    . $self->convert_tree($self->gdt('Index Entry'))
    . "</th><td>&nbsp;</td><th align=\"left\"> "
    .  $self->convert_tree($self->gdt('Section'))
    ."</th></tr>\n" . "<tr><td colspan=\"4\"> ".$self->get_conf('DEFAULT_RULE')
    ."</td></tr>\n";
  foreach my $letter_entry (@{$self->{'index_entries_by_letter'}->{$index_name}}) {
    my $letter = $letter_entry->{'letter'};
    my $entries_text = '';
    foreach my $index_entry_ref (@{$letter_entry->{'entries'}}) {
      my $in_code 
       = $self->{'index_names'}->{$index_name}->{$index_entry_ref->{'index_name'}};
      my $entry;
      if ($in_code) {
        # FIXME clean state
        $entry = $self->convert_tree({'type' => '_code',
                                      'contents' => $index_entry_ref->{'content'}});
      } else {
        $entry = $self->convert_tree({'contents' => $index_entry_ref->{'content'}});
      }
      next if ($entry !~ /\S/);
      $entry = '<code>' .$entry .'</code>' if ($in_code);
      my $entry_href = $self->command_href ($index_entry_ref->{'command'});
      my $associated_command;
      if ($self->get_conf('NODE_NAME_IN_INDEX')) {
        $associated_command = $index_entry_ref->{'node'};
        if (!defined($associated_command)) {
          $associated_command 
            = $self->command_node($index_entry_ref->{'command'});
        }
      }
      if (!$associated_command) {
        $associated_command 
          = $self->command_element_command($index_entry_ref->{'command'});
      }
      my ($associated_command_href, $associated_command_text);
      if ($associated_command) {
        $associated_command_href = $self->command_href($associated_command);
        $associated_command_text = $self->command_text($associated_command);
      }
      
      $entries_text .= '<tr><td></td><td valign="top">' 
         . "<a href=\"$entry_href\">$entry</a>" . 
          $self->get_conf('INDEX_ENTRY_COLON') .
        '</td><td>&nbsp;</td><td valign="top">';
      $entries_text .= "<a href=\"$associated_command_href\">$associated_command_text</a>" 
         if ($associated_command_href);
       $entries_text .= "</td></tr>\n";
    }
    # a letter and associated indes entries
    $result .= '<tr><th>' . 
    "<a name=\"$letter_id{$letter}\">".$self->xml_protect_text($letter).'</a>'
        .  "</th><td></td><td></td></tr>\n" . $entries_text .
       "<tr><td colspan=\"4\"> ".$self->get_conf('DEFAULT_RULE')."</td></tr>\n";

  }
  $result .= "</table>\n";
  return $result .$summary;
}
$default_commands_conversion{'printindex'} = \&_convert_printindex_command;

sub _convert_informative_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;

  $cmdname = 'shortcontents' if ($cmdname eq 'summarycontents');

  $self->_informative_command($command);
  if ($self->get_conf('INLINE_CONTENTS')) {
    if ($cmdname eq 'contents' or $cmdname eq 'shortcontents') {

      my $content = $self->{'contents'}($self, $cmdname, $command);
      if ($content) {
        my $result = '';
        my $special_element 
          = $self->special_element($contents_command_element_name{$cmdname});
        my $id = $self->command_id($special_element);
        $result .= "<a name=\"$id\"></a>\n";
        my $heading = $self->command_text($special_element, 'text');
        $result .= &{$self->{'heading_text'}}($self, $cmdname, $heading, 0)."\n";
        $result .= $content . "\n";
        return $result;
      }
    }
  }
  return '';
}

sub _informative_command($$)
{
  my $self = shift;
  my $root = shift;

  my $cmdname = $root->{'cmdname'};
  $cmdname = 'shortcontents' if ($cmdname eq 'summarycontents');

  return if ($self->{'set'}->{$cmdname});
    if ($misc_commands{$cmdname} eq 'skipline') {
    $self->set_conf($cmdname, 1);
  } elsif (exists($root->{'extra'}->{'text_arg'})) {
    $self->set_conf($cmdname, $root->{'extra'}->{'text_arg'});
    if ($cmdname eq 'documentencoding'
        and defined($root->{'extra'})
        and defined($root->{'extra'}->{'perl_encoding'})
        and !$self->{'perl_encoding'}) {
      $self->{'encoding_name'} = $root->{'extra'}->{'encoding_name'};
      $self->{'perl_encoding'} = $root->{'extra'}->{'perl_encoding'};
    }
  } elsif ($root->{'extra'} and $root->{'extra'}->{'misc_args'}
           and exists($root->{'extra'}->{'misc_args'}->[0])) {
    $self->set_conf($cmdname, $root->{'extra'}->{'misc_args'}->[0]);
  }
}

foreach my $informative_command (@informative_global_commands) {
  $default_commands_conversion{$informative_command} 
    = \&_convert_informative_command;
}

my %default_types_conversion;

#my %ignored_types;
foreach my $type ('empty_line_after_command', 'preamble',
            'empty_spaces_after_command', 'spaces_at_end',
            'empty_spaces_before_argument', 'empty_spaces_before_paragraph',
            'empty_spaces_after_close_brace', 'preamble_before_setfilename') {
  #$ignored_types{$type} = 1;
  $default_types_conversion{$type} = undef;
}

my %paragraph_style = (
      'center'     => 'center',
      'flushleft'  => 'left',
      'flushright' => 'right',
      );

sub _quotation_arg_to_prepend($$)
{
  my $self = shift;
  my $command = shift;
  if ($command->{'parent'} and $command->{'parent'}->{'cmdname'}
      and ($command->{'parent'}->{'cmdname'} eq 'quotation'
           or $command->{'parent'}->{'cmdname'} eq 'smallquotation')
      and $command->{'parent'}->{'extra'}
      and $command->{'parent'}->{'extra'}->{'block_command_line_contents'}) {
    return $self->convert_tree($self->gdt('@b{{quotation_arg}:} ',
     {'quotation_arg' => 
       $command->{'parent'}->{'extra'}->{'block_command_line_contents'}->[0]}));

  }
  return undef;
}

sub _convert_paragraph_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  if ($self->paragraph_number() == 1) {
    my $in_format = $self->top_format();
    # FIXME also verify that in @item/@tab/@headitem
    if ($in_format) {
      if ($in_format eq 'itemize' 
          or $in_format eq 'enumerate'
          or $in_format eq 'multitable') {
        return $content; 
      } else {
        my $prepended = $self->_quotation_arg_to_prepend($command);
        $content = $prepended.$content if (defined($prepended));
      }
    }
  }

  my $align = $self->align();
  if ($paragraph_style{$align}) {
    return "<p align=\"$paragraph_style{$align}\">".$content."</p>";
  } else {
    return "<p>".$content."</p>";
  }
}

$default_types_conversion{'paragraph'} = \&_convert_paragraph_type;

sub _convert_preformatted_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  my $current = $command;
  my $pre_class;
  if ($self->preformatted_number() == 1) {
    my $prepended = $self->_quotation_arg_to_prepend($command);
    $content = $prepended.$content if (defined($prepended));
  }

  return '' if ($content eq '');

  while ($current->{'parent'}) {
    $current = $current->{'parent'};
    if ($current->{'cmdname'} and $pre_class_commands{$current->{'cmdname'}}) {
      $pre_class = $pre_class_commands{$current->{'cmdname'}};
      last;
    } elsif ($current->{'type'} and $pre_class_types{$current->{'type'}}) {
      $pre_class = $pre_class_types{$current->{'type'}};
      last;
    }
  }
  return $self->attribute_class('pre', $pre_class).">".$content."</pre>";
}

$default_types_conversion{'preformatted'} = \&_convert_preformatted_type;

# FIXME this should be very rare since this is caught by _convert_text.
sub _convert_empty_line_type($$$) {
  my $self = shift;
  my $type = shift;
  my $command = shift;

  return "\n";
}

$default_types_conversion{'empty_line'} = \&_convert_empty_line_type;
# in menu
$default_types_conversion{'after_description_line'} = \&_convert_empty_line_type;

sub _convert_bracketed_type($$$$) {
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;
#print STDERR "$self $type $command $content\n";

  return '{'.$content.'}';
}

$default_types_conversion{'bracketed'} = \&_convert_bracketed_type;

sub _convert_definfoenclose_type($$$$) {
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  return $self->xml_protect_text($command->{'extra'}->{'begin'}) . $content
         .$self->xml_protect_text($command->{'extra'}->{'end'});
}

$default_types_conversion{'definfoenclose_command'} 
  = \&_convert_definfoenclose_type;

sub _convert_text($$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $text = shift;

  $text = uc($text) if ($self->in_upper_case());
  $text = $self->xml_protect_text($text);
  if ($self->get_conf('ENABLE_ENCODING') and 
      !$self->get_conf('ENABLE_ENCODING_USE_ENTITY')
      and $self->{'encoding_name'} and $self->{'encoding_name'} eq 'utf-8') {
    my $context = {'code' => $self->in_code(), 
                   'preformatted' => $self->in_preformatted()};
    $text = Texinfo::Convert::Unicode::unicode_text($self, $text, $command,
                                                         $context);
  } elsif (!$self->in_code() and !$self->in_preformatted()) {
    if ($self->get_conf('USE_ISO')) {
      $text =~ s/---/\&mdash\;/g;
      $text =~ s/--/\&ndash\;/g;
      $text =~ s/``/\&ldquo\;/g;
      $text =~ s/''/\&rdquo\;/g;
      $text =~ s/'/\&rsquo\;/g;
      $text =~ s/`/\&lsquo\;/g;
    } else {
      $text =~ s/``/&quot;/g;
      $text =~ s/''/&quot;/g;
      $text =~ s/---/\x{1F}/g;
      $text =~ s/--/-/g;
      $text =~ s/\x{1F}/--/g;
    }
  }
  $text = $self->protect_space_codebreak($text);
  return $text;
}

$default_types_conversion{'text'} = \&_convert_text;

sub _simplify_text_for_comparison($)
{
  my $text = shift;
  $text =~ s/[^\w]//g;
  return $text;
}

sub _convert_menu_entry_type($$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  
  my $href;
  my $node;
  my $section;
  my $node_entry = $command->{'extra'}->{'menu_entry_node'};
  if ($node_entry->{'manual_content'}) {
    $href = $self->command_href($node_entry); 
  } else {
    $node = $self->label_command($node_entry->{'normalized'});
    if ($node->{'extra'}->{'associated_section'} 
      and !$self->get_conf('NODE_NAME_IN_MENU')) {
      $section = $node->{'extra'}->{'associated_section'};
      $href = $self->command_href($section);
    } else {
      $href = $self->command_href($node);
    }
  }

  $html_menu_entry_index++;
  my $accesskey = '';
  $accesskey = " accesskey=\"$html_menu_entry_index\"" 
    if ($self->get_conf('USE_ACCESSKEY') and ($html_menu_entry_index < 10));

  my $MENU_SYMBOL = $self->get_conf('MENU_SYMBOL');
  my $MENU_ENTRY_COLON = $self->get_conf('MENU_ENTRY_COLON');

  if ($self->in_preformatted()) {
    my $result = '';
    foreach my $arg (@{$command->{'args'}}) {
      if ($arg->{'type'} and $arg->{'type'} eq 'menu_entry_node') {
        my $name = $self->convert_tree(
           {'type' => '_code', 'contents' => $arg->{'contents'}});
        if ($href ne '') {
          $result .= "<a href=\"$href\"$accesskey>".$name."</a>";
        } else {
          $result .= $name;
        }
      } elsif ($arg->{'type'} and $arg->{'type'} eq 'menu_entry_leading_text') {
        my $text = $arg->{'text'};
         
        $text =~ s/\*/$MENU_SYMBOL/;
        $result .= $text;
      } else {
        $result .= $self->convert_tree($arg);
      }
    }
    return $result;
  }

  my $name;
  my $name_no_number;
  if ($section) {
    $name = $self->command_text($section, 'text');
    $name_no_number = $self->convert_tree
        ({'contents' => $section->{'extra'}->{'misc_content'}});
    if ($href ne '') {
      $name = "<a href=\"$href\"$accesskey>".$name."</a>";
    }
  }
  if (!defined($name) or $name eq '') {
    if ($command->{'extra'}->{'menu_entry_name'}) {
      $name = $self->convert_tree($command->{'extra'}->{'menu_entry_name'});
    }
    if (!defined($name) or $name eq '') {
      foreach my $arg (@{$command->{'args'}}) {
        if ($arg->{'type'} and $arg->{'type'} eq 'menu_entry_node') {
          $name = $self->convert_tree(
            {'type' => '_code', 
             'contents' => $command->{'extra'}->{'menu_entry_node'}->{'node_content'}});
        }
      }
    }
    $name =~ s/^\s*//;
    $name_no_number = $name;
    if ($href ne '') {
      $name = "<a href=\"$href\"$accesskey>".$name."</a>";
    }
    $name = "$MENU_SYMBOL ".$name;
  }
  my $description = '';
  if ($command->{'extra'}->{'menu_entry_description'}) {
    $description = $self->convert_tree ($command->{'extra'}->{'menu_entry_description'});
    if ($self->get_conf('AVOID_MENU_REDUNDANCY')) {
      $description = '' if (_simplify_text_for_comparison($name_no_number) 
                           eq _simplify_text_for_comparison($description));
    }
    if ($description ne '') {
      # FIXME remove that.  This is a compatibility with texi2html, space 
      # from preceding menu_entry_separator is used for description, but
      # it is not really useful since space is not taken into account anyway
      # in formatting
      my $previous_arg;
      foreach my $arg (@{$command->{'args'}}) {
        if ($arg->{'type'} and $arg->{'type'} eq 'menu_entry_description') {
          if ($previous_arg->{'type'} eq 'menu_entry_separator'
               and $previous_arg->{'text'} =~ /(\s+)$/) {
            $description = $1 . $description;
          }
          last;
        }
        $previous_arg = $arg;
      }
    }
  }
  return "<tr><td align=\"left\" valign=\"top\">$name$MENU_ENTRY_COLON</td><td>&nbsp;&nbsp;</td><td align=\"left\" valign=\"top\">$description</td></tr>\n";
}

$default_types_conversion{'menu_entry'} = \&_convert_menu_entry_type;

sub _convert_menu_comment_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  return "<tr><th colspan=\"3\" align=\"left\" valign=\"top\">".$content
       ."</th></tr>";
}

$default_types_conversion{'menu_comment'} = \&_convert_menu_comment_type;


# FIXME not sure that there is contents.  Not sure that it matters either.
sub _convert_def_line_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  my $category_prepared = '';
  if ($command->{'extra'} and $command->{'extra'}->{'def_args'}
      and @{$command->{'extra'}->{'def_args'}}) {
    my $parsed_definition_category = $self->definition_category ($command, 
            $command->{'extra'}->{'def_parsed_hash'}->{'category'},
            $command->{'extra'}->{'def_parsed_hash'}->{'class'});
    if ($parsed_definition_category) {
      $category_prepared = $self->convert_tree({'type' => '_code',
                   'contents' => [$parsed_definition_category]});
    }
  }
  
  my $arguments_content = $self->definition_arguments_content($command);
  my $arguments = '';
  if ($arguments_content) {
    $arguments = $self->convert_tree({'type' => '_code',
                   'contents' => $arguments_content});
    $arguments = '<em> ' . $arguments . '</em>' if ($arguments =~ /\S/);
  }

  my $def_type = '';
  my $type_name = '';
  if ($command->{'extra'}->{'def_parsed_hash'}->{'type'}) {
    $def_type = $self->convert_tree({'type' => '_code',
        'contents' => [$command->{'extra'}->{'def_parsed_hash'}->{'type'}]});
  }
  $type_name = " <em>$def_type</em>" if ($def_type ne '');
  my $name = '';
  if ($command->{'extra'}->{'def_parsed_hash'}->{'name'}) {
    $name = $self->convert_tree({'type' => '_code',
        'contents' => [$command->{'extra'}->{'def_parsed_hash'}->{'name'}]});
  }
  $type_name .= ' <strong>' . $name . '</strong>' if ($name ne '');

  my $index_label = '';
  my $index_id = $self->command_id ($command);
  if (defined($index_id)) {
    $index_label = "<a name=\"$index_id\"></a>";
  }
  if (!$self->get_conf('DEF_TABLE')) {
    return '<dt>'.$index_label.$category_prepared . ':' . $type_name . "</dt>\n";
  } else {
    return "<tr><td align=\"left\">" . $type_name .
       "</td><td align=\"right\">" . $category_prepared . 
       $index_label . "</td></tr>\n";
  }
}

$default_types_conversion{'def_line'} = \&_convert_def_line_type;

sub _convert_def_item_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  if ($content =~ /\S/) {
    if (! $self->get_conf('DEF_TABLE')) {
      return '<dd>' . $content . '</dd>';
    } else {
      return '<tr><td colspan="2">' . $content . '</td></tr>';
    }
  }
}

$default_types_conversion{'def_item'} = \&_convert_def_item_type;

sub _convert_def_command($$$$) {
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;

  #print STDERR "IIII $self $cmdname command $command args $args content $content\n";
  if (!$self->get_conf('DEF_TABLE')) {
    return "<dl>\n". $content ."</dl>\n";
  } else {
    return "<table width=\"100%\">\n" . $content . "</table>\n";
  }
}

foreach my $command (keys(%def_commands)) {
  $default_commands_conversion{$command} = \&_convert_def_command;
}

# This type is the only one present if there are no elements.  It is 
# therefore used to do the formatting of the element in case there are no 
# element.
sub _convert_root_text_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  my $result = $content;
  #$result =~ s/^\s*//;
  # if there is no element, the parent should not be an element
  if (defined($self->get_conf('DEFAULT_RULE'))
      and (!$command->{'parent'} 
           or !$command->{'parent'}->{'type'}
           or $command->{'parent'}->{'type'} ne 'element')) {
    $result .= $self->get_conf('DEFAULT_RULE') ."\n",
      if $self->get_conf('PROGRAM_NAME_IN_FOOTER');
  }
  return $result;
}

$default_types_conversion{'text_root'} = \&_convert_root_text_type;

# Convert @titlepage.  Falls back to simpletitle.
sub _default_titlepage($)
{
  my $self = shift;

  my $titlepage_text;
  if ($self->{'extra'}->{'titlepage'}) {
    $titlepage_text = $self->convert_tree({'contents' 
               => $self->{'extra'}->{'titlepage'}->{'contents'}});
  } elsif ($self->{'simpletitle_tree'}) {
    my $title_text = $self->convert_tree($self->{'simpletitle_tree'});
    $titlepage_text = &{$self->{'heading_text'}}($self, 'settitle', $title_text, 
                                            0, {'cmdname' => 'settitle',
                     'contents' => $self->{'simpletitle_tree'}->{'contents'}});
  }
  my $result = '';
  $result .= $titlepage_text.$self->get_conf('DEFAULT_RULE')."\n"
    if (defined($titlepage_text));
  if ($self->{'structuring'} and $self->{'structuring'}->{'sectioning_root'}) {
    if ($self->get_conf('setcontentsaftertitlepage')) {
      # FIXME put formatted contents
      # @{$Texi2HTML::THISDOC{'inline_contents'}->{'contents'}}
      $result .= $self->get_conf('DEFAULT_RULE')."\n";
    }
    if ($self->get_conf('setshortcontentsaftertitlepage')) {
      # FIXME put formatted shortcontents
      # @{$Texi2HTML::THISDOC{'inline_contents'}->{'shortcontents'}}
      $result .= $self->get_conf('DEFAULT_RULE')."\n";
    }
  }
  return $result;
}

sub _convert_element_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $element = shift;
  my $content = shift;

  #print STDERR "GGGGGGGG $element $element->{'parent'} $element->{'parent'}->{'type'}\n";
  #print STDERR "$element->{'extra'}->{'special_element'}\n"
  #   if ($element->{'extra'}->{'special_element'});

  my $result = '';
  my $special_element;

  if ($element->{'extra'}->{'special_element'}) {
    $special_element = $element->{'extra'}->{'special_element'};
    my $id = $self->command_id($element);
    $result .= "<a name=\"$id\"></a>\n";
    if ($self->get_conf('HEADERS') 
        # first in page
        or $element->{'parent'}->{'contents'}->[0] eq $element) {
      $result .= &{$self->{'navigation_header'}}($self, 
                 $self->get_conf('MISC_BUTTONS'), undef, $element);
      
    }
    my $heading = $self->command_text($element, 'text');
    $result .= &{$self->{'heading_text'}}($self, '', $heading, 0)."\n";

    $result .= &{$self->{'special_element_body'}}($self, 
                                                 $special_element, $element);
  } elsif (!$element->{'element_prev'}) {
    if ($self->get_conf('SHOW_TITLE')) {
      if ($self->get_conf('USE_TITLEPAGE_FOR_TITLE')) {
        $result .= &{$self->{'titlepage'}}($self);
      } elsif ($self->{'simpletitle_tree'}) {
        my $title_text = $self->convert_tree($self->{'simpletitle_tree'});
        $result .= &{$self->{'heading_text'}}($self, 'settitle', $title_text, 
                                            0, {'cmdname' => 'settitle',
                     'contents' => $self->{'simpletitle_tree'}->{'contents'}});
      }
    }
    if (!$element->{'element_next'}) {
      # only one element
      return $result.$content.$self->get_conf('DEFAULT_RULE')."\n";
    }
  }
  $result .= $content unless ($special_element);
  # FIXME footnotes

  my $is_top = $self->_element_is_top($element);
  my $next_is_top = ($self->{'global_target_elements'}->{'Top'}
    and defined($element->{'element_next'})
    and $self->{'global_target_elements'}->{'Top'} eq $element->{'element_next'});
  my $next_is_special = (defined($element->{'element_next'})
    and $element->{'element_next'}->{'extra'}->{'special_element'});
  my $end_page = (!$element->{'element_next'} 
       or $element->{'parent'} ne $element->{'element_next'}->{'parent'});
  my $is_special = $element->{'extra'}->{'special_element'};

  if (($end_page or $next_is_top or $next_is_special)
       and $self->get_conf('VERTICAL_HEAD_NAVIGATION')) {
   $result .= "</td>
</tr>
</table>"."\n";
  }

  my $rule = '';
  my $buttons;
  my $maybe_in_page;
  if (($is_top or $is_special)
      and $self->get_conf('SPLIT')
      and ($end_page 
         and ($self->get_conf('HEADERS') 
              or ($self->get_conf('SPLIT') and $self->get_conf('SPLIT') ne 'node')))) {
    if ($is_top) {
      $buttons = $self->get_conf('TOP_BUTTONS');
    } else {
      $buttons = $self->get_conf('MISC_BUTTONS');
    }
    #$rule = $self->get_conf('DEFAULT_RULE');
  } elsif ($end_page and $self->get_conf('SPLIT') eq 'section') {
    $buttons = $self->get_conf('SECTION_FOOTER_BUTTONS');
    #$rule = $self->get_conf('DEFAULT_RULE');
  } elsif ($end_page and $self->get_conf('SPLIT') eq 'chapter') {
    $buttons = $self->get_conf('CHAPTER_BUTTONS');
    #$rule = $self->get_conf('DEFAULT_RULE');
  } elsif ($self->get_conf('SPLIT') eq 'node' and $self->get_conf('HEADERS')) {
    #$rule = $self->get_conf('DEFAULT_RULE');
    my $no_footer_word_count;
    if ($self->get_conf('WORDS_IN_PAGE')) {
      my @cnt = split(/\W*\s+\W*/, $content);
      if (scalar(@cnt) < $self->get_conf('WORDS_IN_PAGE')) {
        $no_footer_word_count = 1;
      }
    }
    $buttons = $self->get_conf('NODE_FOOTER_BUTTONS')
       unless ($no_footer_word_count);
  } else {
    $maybe_in_page = 1;
  }

  if ($maybe_in_page or $is_top or $is_special
     or ($end_page and ($self->get_conf('SPLIT') eq 'chapter'
                       or $self->get_conf('SPLIT') eq 'section'))
     or $self->get_conf('SPLIT') eq 'node' and $self->get_conf('HEADERS')) {
    $rule = $self->get_conf('DEFAULT_RULE');
  }
      
  if (!$end_page and ($is_top or $next_is_top or ($next_is_special 
                                                 and !$is_special))) {
    $rule = $self->get_conf('BIG_RULE');
  }
  if (!$self->get_conf('PROGRAM_NAME_IN_FOOTER') 
      and !$buttons and !$maybe_in_page) {
    # no rule in that case
  } else {
    $result .= "$rule\n" if ($rule);
  }
  if ($buttons) {
    $result .= &{$self->{'navigation_header_panel'}}($self, $buttons,
                                                     undef, $element);
  }
  
  return $result;
}

$default_types_conversion{'element'} = \&_convert_element_type;

sub _initialize($)
{
  my $self = shift;

  if ($self->get_conf('SHORTEXTN')) {
    $self->set_conf('EXTENSION', 'html');
  }
  $foot_num = 0;
  $foot_lines = '';

  %{$self->{'css_map'}} = %css_map;

  foreach my $format (@out_formats) {
    $default_commands_conversion{$format} = undef
       unless ($self->{'expanded_formats_hash'}->{$format});
  }

  foreach my $context (keys(%default_commands_formatting)) {
    foreach my $command (keys(%{$default_commands_formatting{$context}})) {
      if (exists ($Texinfo::Config::commands_formatting{$context}->{$command})) {
        $self->{'commands_formatting'}->{$context}->{$command} 
           = $Texinfo::Config::commands_formatting{$context}->{$command};
      } else {
        $self->{'commands_formatting'}->{$context}->{$command} 
           = $default_commands_formatting{$context}->{$command};
      }
    }
  }

  foreach my $context (keys(%style_commands_formatting)) {
    foreach my $command (keys(%{$style_commands_formatting{$context}})) {
      if (exists ($Texinfo::Config::style_commands_formatting{$context}->{$command})) {
        $self->{'style_commands_formatting'}->{$context}->{$command} 
           = $Texinfo::Config::style_commands_formatting{$context}->{$command};
      } elsif (exists($style_commands_formatting{$context}->{$command})) {
        $self->{'style_commands_formatting'}->{$context}->{$command} 
           = $style_commands_formatting{$context}->{$command};
      }
    }
  }

  foreach my $command (keys(%misc_commands), keys(%brace_commands),
     keys (%block_commands), keys(%no_brace_commands)) {
    if (exists($Texinfo::Config::commands_conversion{$command})) {
      $self->{'commands_conversion'}->{$command} 
          = $Texinfo::Config::commands_conversion{$command};
    } else {
      if (!$self->get_conf('SHOW_MENU') 
           and $command eq 'menu' or $command eq 'detailmenu') {
        $self->{'commands_conversion'}->{$command} = undef;
      } elsif (exists($default_commands_conversion{$command})) {
        $self->{'commands_conversion'}->{$command}
           = $default_commands_conversion{$command};
      }
    }
  }

  foreach my $type (keys(%default_types_conversion)) {
    if (exists($Texinfo::Config::types_conversion{$type})) {
      $self->{'types_conversion'}->{$type}
          = $Texinfo::Config::types_conversion{$type};
    } else {
      $self->{'types_conversion'}->{$type} 
          = $default_types_conversion{$type};
    }
  }
  foreach my $command (keys %{$self->{'commands_conversion'}}) {
    if (exists($Texinfo::Config::commands_args{$command})) {
      $self->{'commands_args'}->{$command} 
         = $Texinfo::Config::commands_conversion{$command};
    } elsif (exists($default_commands_args{$command})) {
      $self->{'commands_args'}->{$command} = $default_commands_args{$command};
    }
  }

  foreach my $formatting_references (
     ['heading_text', \&_default_heading_text, $Texinfo::Config::heading_text],
     ['comment', \&_default_comment, $Texinfo::Config::comment],
     ['css_lines', \&_default_css_lines, $Texinfo::Config::css_lines],
     ['begin_file', \&_default_begin_file, $Texinfo::Config::begin_file],
     ['end_file', \&_default_end_file, $Texinfo::Config::end_file],
     ['special_element_body', \&_default_special_element_body, $Texinfo::Config::special_element_body],
     ['program_string', \&_default_program_string, $Texinfo::Config::program_string],
     ['titlepage', \&_default_titlepage, $Texinfo::Config::titlepage],
     ['navigation_header', \&_default_navigation_header, $Texinfo::Config::navigation_header],
     ['navigation_header_panel', \&_default_navigation_header_panel, 
      $Texinfo::Config::navigation_header_panel],
     ['button_formatting', \&_default_button_formatting, $Texinfo::Config::button_formatting],
     ['button_icon_img', \&_default_button_icon_img, $Texinfo::Config::button_icon_img],
     ['external_href', \&_default_external_href, $Texinfo::Config::external_href],
     ['contents', \&_default_contents, $Texinfo::Config::contents],
  ) {
    if (defined($formatting_references->[2])) {
      $self->{$formatting_references->[0]} = $formatting_references->[2];
    } else {
      $self->{$formatting_references->[0]} = $formatting_references->[1];
    }
  }

  $self->{'context'} = [{'cmdname' => '_toplevel_context', 
                         'align' => ['raggedright']}];
  $self->{'preformatted_context'} = [0];
  $self->{'formats'} = [];

  $self->_translate_names();

  return $self;
}

# the entry point for _convert
sub convert_tree($$)
{
  my $self = shift;
  my $element = shift;

  return $self->_convert($element);
}

sub _normalized_to_id($)
{
  my $id = shift;
  if (!defined($id)) {
    cluck "_normalized_to_id id not defined";
    return '';
  }
  $id =~ s/^([0-9_])/g_t$1/;
  return $id;
}

sub _default_css_lines ($)
{
  my $self = shift;

  my $css_refs = $self->get_conf('CSS_REFS');

  return if (!@{$self->{'css_import_lines'}} and !@{$self->{'css_rule_lines'}}
             and !keys(%{$self->{'css_map'}}) and !@$css_refs);

  my $css_text = "<style type=\"text/css\">\n<!--\n";
  $css_text .= join('',@{$self->{'css_import_lines'}}) . "\n" 
    if (@{$self->{'css_import_lines'}});
  foreach my $css_rule (sort(keys(%{$self->{'css_map'}}))) {
    next unless ($self->{'css_map'}->{$css_rule});
    $css_text .= "$css_rule {$self->{'css_map'}->{$css_rule}}\n";
  }
  $css_text .= join('',@{$self->{'css_rule_lines'}}) . "\n" 
    if (@{$self->{'css_rule_lines'}});
  $css_text .= "-->\n</style>\n";
  foreach my $ref (@$css_refs) {
    $css_text .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"$ref\">\n";
  }
  $self->set_conf('CSS_LINES', $css_text);
}

sub _process_css_file ($$$)
{
  my $self = shift;
  my $fh =shift;
  my $file = shift;
  my $in_rules = 0;
  my $in_comment = 0;
  my $in_import = 0;
  my $in_string = 0;
  my $rules = [];
  my $imports = [];
  my $line_nr = 0;
  while (my $line = <$fh>) {
    $line_nr++;
    #print STDERR "Line: $line";
    if ($in_rules) {
      push @$rules, $line;
      next;
    }
    my $text = '';
    while (1) {
      #sleep 1;
      #print STDERR "${text}!in_comment $in_comment in_rules $in_rules in_import $in_import in_string $in_string: $line";
      if ($in_comment) {
        if ($line =~ s/^(.*?\*\/)//) {
          $text .= $1;
          $in_comment = 0;
        } else {
          push @$imports, $text . $line;
          last;
        }
      } elsif (!$in_string and $line =~ s/^\///) { # what do '\' do here ?
        if ($line =~ s/^\*//) {
          $text .= '/*';
          $in_comment = 1;
        } else {
          push (@$imports, $text. "\n") if ($text ne '');
          push (@$rules, '/' . $line);
          $in_rules = 1;
          last;
        }
      } elsif (!$in_string and $in_import and $line =~ s/^([\"\'])//) { 
        # strings outside of import start rules
        $text .= "$1";
        $in_string = quotemeta("$1");
      } elsif ($in_string and $line =~ s/^(\\$in_string)//) {
        $text .= $1;
      } elsif ($in_string and $line =~ s/^($in_string)//) {
        $text .= $1;
        $in_string = 0;
      } elsif ((! $in_string and !$in_import) 
              and ($line =~ s/^([\\]?\@import)$// 
                   or $line =~ s/^([\\]?\@import\s+)//)) {
        $text .= $1;
        $in_import = 1;
      } elsif (!$in_string and $in_import and $line =~ s/^\;//) {
        $text .= ';';
        $in_import = 0;
      } elsif (($in_import or $in_string) and $line =~ s/^(.)//) {
        $text .= $1;
      } elsif (!$in_import and $line =~ s/^([^\s])//) {
        push (@$imports, $text. "\n") if ($text ne '');
        push (@$rules, $1 . $line);
        $in_rules = 1;
        last;
      } elsif ($line =~ s/^(\s)//) {
        $text .= $1;
      } elsif ($line eq '') {
        push (@$imports, $text);
        last;
      }
    }
  }
  #file_line_warn (__("string not closed in css file"), $file) if ($in_string);
  #file_line_warn (__("--css-file ended in comment"), $file) if ($in_comment);
  #file_line_warn (__("\@import not finished in css file"), $file)  if ($in_import and !$in_comment and !$in_string);
  warn (sprintf($self->__("%s:%d: string not closed in css file"), 
                $file, $line_nr)) if ($in_string);
  warn (sprintf($self->__("%s:%d: --css-file ended in comment"), 
                $file, $line_nr)) if ($in_comment);
  warn (sprintf($self->__("%s:%d \@import not finished in css file"), 
        $file, $line_nr)) 
    if ($in_import and !$in_comment and !$in_string);
  return ($imports, $rules);
}

sub _prepare_css($)
{
  my $self = shift;
  
  return if ($self->get_conf('NO_CSS'));

  my @css_import_lines;
  my @css_rule_lines;

  my $css_files = $self->get_conf('CSS_FILES');
  foreach my $file (@$css_files) {
    my $css_file_fh;
    my $css_file;
    if ($file eq '-') {
      $css_file_fh = \*STDIN;
      $css_file = '-';
    } else {
      $css_file = locate_include_file ($file);
      unless (defined($css_file)) {
        $self->document_warn (sprintf(
               $self->__("css file %s not found"), $file));
        next;
      }
      unless (open (CSSFILE, "$css_file")) {
        $self->document_warn (sprintf($self->__(
             "could not open --css-file %s: %s"), 
              $css_file, $!));
        next;
      }
      $css_file_fh = \*CSSFILE;
    }
    my ($import_lines, $rules_lines);
    ($import_lines, $rules_lines) 
      = $self->_process_css_file ($css_file_fh, $css_file);
    push @css_import_lines, @$import_lines;
    push @css_rule_lines, @$rules_lines;

  }
  if ($self->get_conf('DEBUG')) {
    if (@css_import_lines) {
      print STDERR "# css import lines\n";
      foreach my $line (@css_import_lines) {
        print STDERR "$line";
      }
    }
    if (@css_rule_lines) {
      print STDERR "# css rule lines\n";
      foreach my $line (@css_rule_lines) {
        print STDERR "$line";
      }
    }
  }
  $self->{'css_import_lines'} = \@css_import_lines;
  $self->{'css_rule_lines'} = \@css_rule_lines;

  &{$self->{'css_lines'}}($self);
}

sub _node_id_file($$)
{
  my $self = shift;
  my $node_info = shift;

  my $no_unidecode;
  $no_unidecode = 1 if (defined($self->get_conf('USE_UNIDECODE'))
                        and !$self->get_conf('USE_UNIDECODE'));

  my ($target, $id);
  if (defined($node_info->{'normalized'})) {
    $target = _normalized_to_id($node_info->{'normalized'});
  } else {
    # FIXME Top or configuration variable?
    $target = '';
  }
  if (!$node_info->{'manual_content'}) {
    $id = $target;
  }
  # FIXME something special for Top node ?
  if (defined($Texinfo::Config::node_target_name)) {
    ($target, $id) = &$Texinfo::Config::node_target_name($node_info,
                                                         $target, $id);
  }
  my $filename;
  if (defined($node_info->{'normalized'})) { 
    if ($self->get_conf('TRANSLITERATE_FILE_NAMES')) {
      $filename = Texinfo::Convert::NodeNameNormalization::transliterate_texinfo(
       {'contents' => $node_info->{'node_content'}},
            $no_unidecode);
    } else {
      $filename = $node_info->{'normalized'};
    }
  } else {
    $filename = '';
  }
  return ($filename, $target, $id);
}

sub _new_sectioning_command_target($$)
{
  my $self = shift;
  my $command = shift;
  my $no_unidecode;

  $no_unidecode = 1 if (defined($self->get_conf('USE_UNIDECODE')) 
                        and !$self->get_conf('USE_UNIDECODE'));

  my $target_base = _normalized_to_id(
     Texinfo::Convert::NodeNameNormalization::transliterate_texinfo(
       {'contents' => $command->{'extra'}->{'misc_content'}},
                $no_unidecode));
  if ($target_base !~ /\S/ and $command->{'cmdname'} eq 'top' 
      and defined($self->{'misc_elements_targets'}->{'Top'})) {
    $target_base = $self->{'misc_elements_targets'}->{'Top'};
  }
  my $nr=1;
  my $target = $target_base;
  while ($self->{'ids'}->{$target}) {
    $target = $target_base.'-'.$nr;
    $nr++;
    # Avoid integer overflow
    die if ($nr == 0);
  }
  my $id = $target;

  if ($command->{'extra'}->{'associated_node'} 
      and $self->get_conf('USE_NODE_TARGET')) {
    $target 
     = $self->{'targets'}->{$command->{'extra'}->{'associated_node'}}->{'id'};
  }
    
  my $target_contents;
  my $id_contents;
  my $target_shortcontents;
  my $id_shortcontents;
  if ($Texinfo::Common::root_commands{$command->{'cmdname'}}) {
    # FIXME choose one (in comments, use target, other use id)
    #my $target_contents = 'toc-'.$target;
    #my $target_base_contents;
    #if ($command->{'extra'}->{'associated_node'} 
    #    and $self->get_conf('USE_NODE_TARGET') {
    #  $target_base_contents = $target;
    #} else {
    # $target_base_contents = $target_base;
    #}
    $target_contents = 'toc-'.$id;
    my $target_base_contents = $target_base;
    my $toc_nr = $nr -1;
    while ($self->{'ids'}->{$target_contents}) {
      $target_contents = 'toc-'.$target_base_contents.'-'.$toc_nr;
      $toc_nr++;
      # Avoid integer overflow
      die if ($toc_nr == 0);
    }
    $id_contents = $target_contents;

    # FIXME choose one (in comments, use target, other use id)
    #my $target_shortcontents = 'stoc-'.$target;
    #my $target_base_shortcontents;
    #if ($command->{'extra'}->{'associated_node'} 
    #    and $self->get_conf('USE_NODE_TARGET') {
    #  $target_base_shortcontents = $target;
    #} else {
    #  $target_base_shortcontents = $target_base;
    #}
    $target_shortcontents = 'stoc-'.$id;
    my $target_base_shortcontents = $target_base;
    my $stoc_nr = $nr -1;
    while ($self->{'ids'}->{$target_shortcontents}) {
      $target_shortcontents = 'stoc-'.$target_base_shortcontents
                                 .'-'.$stoc_nr;
      $stoc_nr++;
      # Avoid integer overflow
      die if ($stoc_nr == 0);
    }
    $id_shortcontents = $target_shortcontents;
  }

  if (defined($Texinfo::Config::sectioning_command_target_name)) {
    ($target, $id, $target_contents, $id_contents,
     $target_shortcontents, $id_shortcontents) 
        = &$Texinfo::Config::sectioning_command_target_name($self, 
                                     $command, $target, $id,
                                     $target_contents, $id_contents,
                                     $target_shortcontents, $id_shortcontents);
  }
  if ($self->get_conf('DEBUG')) {
    print STDERR "Register $command->{'cmdname'} $target, $id\n";
  }
  $self->{'targets'}->{$command} = {
                           'target' => $target, 
                           'id' => $id,
                          };
  # FIXME this should really be use carefully, since the mapping
  # is not what one expects
  $self->{'ids'}->{$id} = $command;
  if (defined($id_contents)) {
    $self->{'targets'}->{$command}->{'contents_id'} = $id_contents;
    $self->{'ids'}->{$id_contents} = $command;
  }
  if (defined($target_contents)) {
    $self->{'targets'}->{$command}->{'contents_target'} = $target_contents;
  }
  if (defined($id_shortcontents)) {
    $self->{'targets'}->{$command}->{'shortcontents_id'} = $id_shortcontents;
    $self->{'ids'}->{$id_shortcontents} = $command;
  }
  if (defined($target_shortcontents)) {
    $self->{'targets'}->{$command}->{'shortcontents_target'} 
       = $target_shortcontents;
  }
  return $self->{'targets'}->{$command};
}

# FIXME also convert to html, to use name in cross-refs or do it on demand?
# This set 2 unrelated things.  
#  * The targets and id of sectioning elements
#  * the target, id and normalized filename of 'labels', ie everything that 
#    may be the target of a ref, like @node, @float, @anchor...
sub _set_root_commands_targets_node_files($$)
{
  my $self = shift;
  my $elements = shift;

  my $no_unidecode;
  $no_unidecode = 1 if (defined($self->get_conf('USE_UNIDECODE')) 
                        and !$self->get_conf('USE_UNIDECODE'));

  if ($self->{'labels'}) {
    foreach my $root_command (values(%{$self->{'labels'}})) {
      my ($filename, $target, $id) = $self->_node_id_file($root_command->{'extra'});
      $filename .= '.'.$self->get_conf('NODE_FILE_EXTENSION') 
        if (defined($self->get_conf('NODE_FILE_EXTENSION')) 
            and $self->get_conf('NODE_FILE_EXTENSION') ne '');
      if (defined($Texinfo::Config::node_file_name)) {
        $filename = &$Texinfo::Config::node_file_name($self, $root_command,
                                                     $filename);
      }
      if ($self->get_conf('DEBUG')) {
        print STDERR "Register label($root_command) $target, $filename\n";
      }
      $self->{'targets'}->{$root_command} = {'target' => $target, 
                                             'id' => $id,
                                             'node_filename' => $filename};
      $self->{'ids'}->{$id} = $root_command;
    }
  }

  if ($elements) {
    foreach my $element (@$elements) {
      foreach my $root_command(@{$element->{'contents'}}) {
        # FIXME this happens for type 'text_root' which precedes the 
        # root commands.  The target may also already be set for top node.
        next if (!defined($root_command->{'cmdname'}) 
                 or $self->{'targets'}->{$root_command});
        if ($Texinfo::Common::root_commands{$root_command->{'cmdname'}}) {
          $self->_new_sectioning_command_target($root_command);
        }
      }
    }
  }
}

sub _set_page_file($$$)
{
  my $self = shift;
  my $page = shift;
  my $filename = shift;

# FIXME directory should be the file name!
  $page->{'filename'} = $filename;
  if (defined($self->{'destination_directory'})) {
    $page->{'out_filename'} = $self->{'destination_directory'} . $filename;
  } else {
    $page->{'out_filename'} = $filename;
  }
}

sub _get_page($$);

# FIXME also find contents/shortcontents/summarycontents page
sub _get_page($$)
{
  my $self = shift;
  my $current = shift;
  my ($element, $root_command);
  #print STDERR " --> GGGGGGG _get_page\n";
  while (1) {
    if ($current->{'type'}) {
      #print STDERR "GGGGGGG Now in $current->{'type'}\n";
      if ($current->{'type'} eq 'page') {
        return ($current, $element, $root_command);
      } elsif ($current->{'type'} eq 'element') {
        $element = $current;
      }
    }
    if ($current->{'cmdname'}) {
      #print STDERR "GGGGGGG Now in $current->{'cmdname'}\n";
      if ($root_commands{$current->{'cmdname'}}) {
        $root_command = $current;
      } elsif ($region_commands{$current->{'cmdname'}}) {
        if ($current->{'cmdname'} eq 'copying' 
            and $self->{'extra'} and $self->{'extra'}->{'insertcopying'}) {
          foreach my $insertcopying(@{$self->{'extra'}->{'insertcopying'}}) {
            my ($page, $element, $root_command) 
              = $self->_get_page($insertcopying);
            return ($page, $element, $root_command)
              if (defined($page) or defined($root_command));
          }
        } elsif ($current->{'cmdname'} eq 'titlepage'
                 and $self->get_conf('USE_TITLEPAGE_FOR_TITLE')
                 and $self->get_conf('SHOW_TITLE')
                 and $self->{'pages'}->[0]) {
        # FIXME element and root_command?
          return ($self->{'pages'}->[0]);
        }
        die "Problem $element, $root_command" if (defined($element) 
                                                  or defined($root_command));
        return (undef, undef, undef);
      } elsif ($current->{'cmdname'} eq 'footnote' 
           and $self->get_conf('footnotestyle') eq 'separate') {
        # FIXME element and root_command?
        return ($self->{'special_pages'}->{'Footnotes'});
      }
      # } elsif (($current->{'cmdname'} eq 'contents' 
      #           or $current->{'cmdname'} eq 'shortcontents'
      #           or $current->{'cmdname'} eq 'summarycontents')
      #          and !$self->get_conf('INLINE_CONTENTS')) {
      #   setcontentsaftertitlepage
      # }
    }
    if ($current->{'parent'}) {
      $current = $current->{'parent'};
    } else {
      return (undef, $element, $root_command);
    }
  }
}

sub _set_page_files($$)
{
  my $self = shift;
  my $pages = shift;
  my $special_pages = shift;

  # Ensure that the document has pages
  return undef if (!defined($pages) or !@$pages);

  my $extension = '';
  $extension = '.'.$self->get_conf('EXTENSION') 
            if (defined($self->get_conf('EXTENSION')) 
                and $self->get_conf('EXTENSION') ne '');

  if (!$self->get_conf('SPLIT')) {
    my $page = $pages->[0];
    $page->{'filename'} = $self->{'document_name'}.$extension;
    $page->{'out_filename'} = $self->get_conf('OUTFILE');
  } else {
    my $node_top;
    #my $section_top;
    $node_top = $self->{'labels'}->{'Top'} if ($self->{'labels'});
    #$section_top = $self->{'extra'}->{'top'} if ($self->{'extra'});
  
    # first determine the top node file name.
    if ($self->get_conf('NODE_FILENAMES') and $node_top) {
      if (defined($self->get_conf('TOP_NODE_FILE'))) {
        my ($node_top_page) = $self->_get_page($node_top);
        die "BUG: No page for top node" if (!defined($node_top));
        my $filename = $self->get_conf('TOP_NODE_FILE');
        $filename .= '.'.$self->get_conf('NODE_FILE_EXTENSION') 
          if (defined($self->get_conf('NODE_FILE_EXTENSION')) 
              and $self->get_conf('NODE_FILE_EXTENSION') ne '');
        $self->_set_page_file($node_top_page, $filename);
      }
    }
    # FIXME add a number for each page?
    my $file_nr = 0;
    my $previous_page;
    if ($self->get_conf('NODE_FILENAMES')) {
     PAGE:
      foreach my $page(@$pages) {
        if (defined($previous_page)) {
          $page->{'page_prev'} = $previous_page;
          $previous_page->{'page_next'} = $page;
        }
        $previous_page = $page;
        # For Top node.
        next if (defined($page->{'filename'}));
        foreach my $element (@{$page->{'contents'}}) {
          foreach my $root_comand (@{$element->{'contents'}}) {
            if ($root_comand->{'cmdname'} 
                and $root_comand->{'cmdname'} eq 'node') {
              $self->_set_page_file($page, 
                        $self->{'targets'}->{$root_comand}->{'node_filename'});
              next PAGE;
            }
          }
        }
        my $filename = $self->{'document_name'} . "_$file_nr";
        $filename .= $extension;
        $self->_set_page_file($page, $filename);
        $file_nr++;
      }
    } else {
      my $previous_page;
      foreach my $page(@$pages) {
        if (defined($previous_page)) {
          $page->{'page_prev'} = $previous_page;
          $previous_page->{'page_next'} = $page;
        }
        $previous_page = $page;
        my $filename = $self->{'document_name'} . "_$file_nr";
        $filename .= '.'.$self->get_conf('EXTENSION') 
            if (defined($self->get_conf('EXTENSION')) 
                and $self->get_conf('EXTENSION') ne '');
        $self->_set_page_file($page, $filename);
        $file_nr++;
      }
    }
  }
  # FIXME there add the special element pages
  # also set next_page/prev_page for the special element pages
  foreach my $page (@$pages) {
    if (defined($Texinfo::Config::page_file_name)) {
      # FIXME pass the information that it is associated with @top or @node Top?
      my $filename = &$Texinfo::Config::page_file_name($self, $page, 
                                                       $page->{'filename'});
      $self->_set_page_file($page, $filename) if (defined($filename));
    }
    $self->{'file_counters'}->{$page->{'filename'}}++;
    print STDERR "Page $page: $page->{'filename'}($self->{'file_counters'}->{$page->{'filename'}})\n"
      if ($self->get_conf('DEBUG'));
  }
  if ($special_pages) {
    my $previous_page = $pages->[-1];
    foreach my $page (@$special_pages) {
      my $filename 
       = $self->{'targets'}->{$page->{'extra'}->{'element'}}->{'misc_filename'};
      $self->_set_page_file($page, $filename) if (defined($filename));
      $self->{'file_counters'}->{$page->{'filename'}}++;
      $page->{'prev_page'} = $previous_page;
      $previous_page->{'next_page'} = $page;
      $previous_page = $page;
      print STDERR "Special page $page: $page->{'filename'}($self->{'file_counters'}->{$page->{'filename'}})\n"
        if ($self->get_conf('DEBUG'));
    }
  }
}

sub _prepare_elements($$)
{
  my $self = shift;
  my $root = shift;

  my $elements;

  # do that now to have it available for formatting
  # FIXME set language and documentencoding/encoding_name? If not done already.
  $self->_set_global_multiple_commands(-1);

  if ($self->get_conf('USE_NODES')) {
    $elements = Texinfo::Structuring::split_by_node($root);
  } else {
    $elements = Texinfo::Structuring::split_by_section($root);
  }

  # Do that before the other elements, to be sure that special page ids
  # are registered before elements id are.
  my ($special_elements, $special_pages) 
    = $self->_prepare_special_elements($elements);

  #if ($elements) {
  #  foreach my $element(@{$elements}) {
  #    print STDERR "ELEMENT $element->{'type'}: $element\n";
  #  }
  #}
  $self->_set_root_commands_targets_node_files($elements);
  return ($elements, $special_elements, $special_pages);
}

sub _prepare_special_elements($$)
{
  my $self = shift;
  my $elements = shift;
  my $pages;

  my %do_special;
  # FIXME do that here or let it to the user?
  if ($self->{'structuring'} and $self->{'structuring'}->{'sectioning_root'}) {
    if ($self->get_conf('contents')) {
      if ($self->get_conf('INLINE_CONTENTS')) {
      } elsif ($self->get_conf('setcontentsaftertitlepage')
               and $self->get_conf('USE_TITLEPAGE_FOR_TITLE')) {
      } else {
        $do_special{'Contents'} = 1;
      }
    }
    if ($self->get_conf('shortcontents')) {
      if ($self->get_conf('INLINE_CONTENTS')) {
      } elsif ($self->get_conf('setshortcontentsaftertitlepage')
               and $self->get_conf('USE_TITLEPAGE_FOR_TITLE')) {
      } else {
        $do_special{'Overview'} = 1;
      }
    }
  }
  if ($self->{'extra'}->{'footnote'} 
      and $self->get_conf('footnotestyle') eq 'separate') {
    $do_special{'Footnotes'} = 1;
  }

  if ((!defined($self->get_conf('DO_ABOUT')) 
       and $elements and scalar(@$elements) > 1 
           and ($self->get_conf('SPLIT') or $self->get_conf('HEADERS')))
       or ($self->get_conf('DO_ABOUT'))) {
    $do_special{'About'} = 1;
  }

  my $extension = '';
  $extension = $self->get_conf('EXTENSION') 
    if (defined($self->get_conf('EXTENSION')));

  my $special_elements = [];
  foreach my $type (@{$self->{'misc_elements_order'}}) {
    next unless ($do_special{$type});

    my $element = {'type' => 'element',
                   'extra' => {'special_element' => $type}};
    $self->{'special_elements'}->{$type} = $element;
    push @$special_elements, $element;

    my $id = $self->{'misc_elements_targets'}->{$type};
    my $target = $id;
    my $default_filename;
    if ($self->get_conf('SPLIT') or !$self->get_conf('MONOLITHIC')) {
      $default_filename = $self->{'document_name'}.
        $self->{'misc_pages_file_string'}->{$type};
    } else {
      $default_filename = $self->{'document_name'};
    }
    $default_filename .= '.'.$extension if (defined($extension));

    my $filename;
    if (defined($Texinfo::Config::special_element_target_file_name)) {
      ($target, $id, $filename) 
                 = &$Texinfo::Config::special_element_target_file_name(
                                                            $self,
                                                            $element,
                                                            $target, $id,
                                                            $default_filename);
    }
    $filename = $default_filename if (!defined($filename));

    print STDERR "Add special $element $type: target $target, id $id,\n".
      "    filename $filename\n" if ($self->get_conf('DEBUG'));
    if ($self->get_conf('SPLIT') or !$self->get_conf('MONOLITHIC')
        or $filename ne $default_filename) {
      my $page = {'type' => 'page'};
      push @{$page->{'contents'}}, $element;
      $page->{'extra'}->{'element'} = $element;
      $self->{'special_pages'}->{$type} = $page;
      $element->{'parent'} = $page;
      $self->_set_page_file($page, $filename);
      print STDERR "NEW page for $type\n" if ($self->get_conf('DEBUG'));
      push @$pages, $page;
    }
    # FIXME add element, page... (see command_filename)?
    $self->{'targets'}->{$element} = {'id' => $id,
                                      'target' => $target,
                                      'misc_filename' => $filename,
                                     };
    $self->{'ids'}->{$id} = $element;
  }
  return ($special_elements, $pages);

}

sub _prepare_contents_elements($)
{
  my $self = shift;

  if ($self->{'structuring'} and $self->{'structuring'}->{'sectioning_root'}) {
    foreach my $cmdname('contents', 'shortcontents') {
      my $type = $contents_command_element_name{$cmdname};
      if ($self->get_conf($cmdname)) {
        my $default_filename;
        if ($self->get_conf('INLINE_CONTENTS')) {
          if ($self->{'extra'} and $self->{'extra'}->{$cmdname}) {
            foreach my $command(@{$self->{'extra'}->{$cmdname}}) {
              my ($page, $element, $root_command) 
                = $self->_get_page($command);
              if (defined($page)) {
                $default_filename = $page->{'filename'};
                last;
              }
            }
          }
        } elsif ($self->get_conf('set'.$cmdname.'aftertitlepage')
                 and $self->get_conf('USE_TITLEPAGE_FOR_TITLE')) {
          $default_filename = $self->{'pages'}->[0]->{'filename'};
        }
        if (defined($default_filename)) {
          my $element = {'type' => 'element',
                         'extra' => {'special_element' => $type}};
          $self->{'special_elements'}->{$type} = $element;
          my $id = $self->{'misc_elements_targets'}->{$type};
          my $target = $id;
          my $filename;
          if (defined($Texinfo::Config::special_element_target_file_name)) {
            ($target, $id, $filename)
                 = &$Texinfo::Config::special_element_target_file_name(
                                                            $self,
                                                            $element,
                                                            $target, $id,
                                                            $default_filename);
          }
          $filename = $default_filename if (!defined($filename));
          print STDERR "Add content $element $type: target $target, id $id,\n".
             "    filename $filename\n" if ($self->get_conf('DEBUG'));
          $self->{'targets'}->{$element} = {'id' => $id,
                                            'target' => $target,
                                            'misc_filename' => $filename,
                                            'filename' => $filename,
                                            };
        }
      }
    }
  }
}

# Associate elements with the global targets, First, Last, Top, Index.
sub _prepare_global_targets($$)
{
  my $self = shift;
  my $elements = shift;

  $self->{'global_target_elements'}->{'First'} = $elements->[0];
  $self->{'global_target_elements'}->{'Last'} = $elements->[-1];
  if ($self->{'extra'} and $self->{'extra'}->{'printindex'}) {
    my ($page, $element, $root_command) 
     = $self->_get_page($self->{'extra'}->{'printindex'}->[0]);
    $self->{'global_target_elements'}->{'Index'} = $element
      if (defined($element));
  }

  my $node_top;
  $node_top = $self->{'labels'}->{'Top'} if ($self->{'labels'});
  my $section_top = $self->{'extra'}->{'top'} if ($self->{'extra'});
  if ($section_top) {
    $self->{'global_target_elements'}->{'Top'} = $section_top->{'parent'};
  } elsif ($node_top) {
    my $element_top = $node_top->{'parent'};
    if (!$element_top) {
      die "No parent for node_top: ".Texinfo::Parser::_print_current($node_top);
    }
    $self->{'global_target_elements'}->{'Top'} = $element_top;
  } else {
    $self->{'global_target_elements'}->{'Top'} = $elements->[0];
  }
  
  if ($self->get_conf('DEBUG')) {
    print STDERR "GLOBAL DIRECTIONS:\n";
    foreach my $global_direction ('First', 'Last', 'Index', 'Top') {
      if (defined($self->{'global_target_elements'}->{$global_direction})) {
        print STDERR "$global_direction($self->{'global_target_elements'}->{$global_direction}): ".
          Texinfo::Structuring::_print_element_command_texi(
             $self->{'global_target_elements'}->{$global_direction})."\n";
      }
    }
  }
}

sub _prepare_index_entries($)
{
  my $self = shift;

  if ($self->{'parser'}) {
    my $no_unidecode;
    $no_unidecode = 1 if (defined($self->get_conf('USE_UNIDECODE'))
                          and !$self->get_conf('USE_UNIDECODE'));

    my ($index_names, $merged_indices, $index_entries)
       = $self->{'parser'}->indices_information();
    $self->{'index_names'} = $index_names;
    #print STDERR "IIII ($index_names, $merged_indices, $index_entries)\n";
    $self->{'index_entries_by_letter'}
      = $self->Texinfo::Structuring::sort_indices_by_letter(
          Texinfo::Structuring::merge_indices($index_names, $merged_indices,
                                              $index_entries));

    foreach my $index_name (keys(%$index_entries)) {
      foreach my $index_entry (@{$index_entries->{$index_name}}) {
        my $region = '';
        $region = "$index_entry->{'region'}-" 
          if (defined($index_entry->{'region'}) and $index_entry->{'region'} ne '');
        my $normalized_index =
          Texinfo::Convert::NodeNameNormalization::transliterate_texinfo(
            {'contents' => $index_entry->{'content'}},
                  $no_unidecode);
        my $target_base = "index-" . $region .$normalized_index;
        my $nr=1;
        my $target = $target_base;
        while ($self->{'ids'}->{$target}) {
          $target = $target_base.'-'.$nr;
          $nr++;
          # Avoid integer overflow
          die if ($nr == 0);
        }
        my $id = $target;
        $self->{'ids'}->{$target} = $index_entry->{'command'};
        $self->{'targets'}->{$index_entry->{'command'}} = { 'id' => $id,
                                                          'target' => $target,
                                                        };
        #print STDERR "Enter $index_entry $index_entry->{'command'}: $id\n";
      }
    }
  }
}

my $footid_base = 'FOOT';
my $docid_base = 'DOCF';

sub _prepare_footnotes($)
{
  my $self = shift;

  if ($self->{'extra'}->{'footnote'}) {
    my $nr = 0;
    foreach my $footnote (@{$self->{'extra'}->{'footnote'}}) {
      $nr++;
      my $footid = $footid_base.$nr;
      my $docid = $docid_base.$nr;
      while ($self->{'ids'}->{$docid} or $self->{'ids'}->{$footid}) {
        $nr++;
        $footid = $footid_base.$nr;
        $docid = $docid_base.$nr;
        # Avoid integer overflow
        die if ($nr == 0);
      }
      $self->{'ids'}->{$footid} = $footnote;
      $self->{'ids'}->{$docid} = $footnote;
      $self->{'targets'}->{$footnote} = { 'id' => $docid,
                                          'target' => $footid,
                                        };
      print STDERR "Enter footnote $footnote: id $docid, target $footid\n"
       .Texinfo::Convert::Texinfo::convert($footnote)."\n"
        if ($self->get_conf('DEBUG'));
    }
  }
}

sub htmlxref($$)
{
  my $self = shift;
  my $file = shift;

  return undef;
}

my %htmlxref_entries = (
 'node' => [ 'node', 'section', 'chapter', 'mono' ],
 'section' => [ 'section', 'chapter','node', 'mono' ],
 'chapter' => [ 'chapter', 'section', 'node', 'mono' ],
 'mono' => [ 'mono', 'chapter', 'section', 'node' ],
);

sub _external_node_href($$;$)
{
  my $self = shift;
  my $external_node = shift;
  my $filename = shift;
  
  #print STDERR "external_node: ".join('|', keys(%$external_node))."\n";
  my ($target_filebase, $target, $id) = $self->_node_id_file($external_node);

  my $xml_target = _normalized_to_id($target);

  my $default_target_split = $self->get_conf('EXTERNAL_CROSSREF_SPLIT');

  my $extension = '';
  $extension = "." . $self->get_conf('NODE_FILE_EXTENSION')
          if (defined($self->get_conf('NODE_FILE_EXTENSION')) 
              and $self->get_conf('NODE_FILE_EXTENSION') ne '');

  my $target_split;
  my $file;
  if ($external_node->{'manual_content'}) {
    my $manual_name = Texinfo::Convert::Text::convert(
       {'contents' => $external_node->{'manual_content'}});
    my $manual_base = $manual_name;
    $manual_base =~ s/\.[^\.]*$//;
    $manual_base =~ s/^.*\///;
    my $document_split = $self->get_conf('SPLIT');
    $document_split = 'mono' if (!$document_split);
    my $split_found;
    my $href;
    my $htmlxref_info = $self->htmlxref($manual_base);
    if ($htmlxref_info) {
      foreach my $split_ordered (@{$htmlxref_entries{$document_split}}) {
        if (defined($htmlxref_info->{$split_ordered})) {
          $split_found = $split_ordered;
          $href = $htmlxref_info->{$split_ordered};
          last;
        }
      }
    }
    if (defined($split_found)) {
      $target_split = 1 unless ($split_found eq 'mono');
    } else { # nothing specified for that manual, use default
      $target_split = $default_target_split;
    }

    if ($target_split) {
      if (defined($href)) {
        $file = $href;
      } elsif (defined($self->get_conf('EXTERNAL_DIR'))) {
        $file = $self->get_conf('EXTERNAL_DIR')."/$manual_base";
      } elsif ($self->get_conf('SPLIT')) {
        $file = "../$manual_base";
      }
      $file .= "/";
    } else {# target not split
      if (defined($href)) {
        $file = $href;
      } else {
        if (defined($self->get_conf('EXTERNAL_DIR'))) {
          $file = $self->get_conf('EXTERNAL_DIR')."/$manual_base";
        } elsif ($self->get_conf('SPLIT')) {
          $file = "../$manual_base";
        } else {
          $file = $manual_base;
        }
        $file .= $extension;
      }
    }
  } else {
    $target_split = $default_target_split;
  }

  # FIXME use $external_node->{'extra'}->{'node_content'}?
  if ($target eq '') {
    if ($target_split) {
      if (defined($self->get_conf('TOP_NODE_FILE_TARGET'))) {
        return $file . $self->get_conf('TOP_NODE_FILE_TARGET') 
           . $extension . '#Top';
      } else {
        return $file . '#Top';
      }
    } else {
      return $file . '#Top';
    }
  }

  if (! $target_split) {
    return $file . '#' . $xml_target;
  } else {
    my $file_basename;
    if ($target eq 'Top' and defined($self->get_conf('TOP_NODE_FILE_TARGET'))) {
      $file_basename = $self->get_conf('TOP_NODE_FILE_TARGET');
    } else {
      $file_basename = $target_filebase;
    }
    return $file . $file_basename . $extension . '#' . $xml_target;
  }
}

my %valid_types = (
  'href' => 1,
  'string' => 1,
  'text' => 1,
  'tree' => 1,
  'target' => 1,
  'id' => 1,
  'node' => 1,
);

# FIXME global targets
sub _element_direction($$$$;$)
{
  my $self = shift;
  my $element = shift;
  my $direction = shift;
  my $type = shift;
  my $filename = shift;

  my $element_target;
  my $command;
  my $target;

  $filename = $self->{'current_filename'} if (!defined($filename));
 
  if (!$valid_types{$type}) {
    print STDERR "Incorrect type $type in _element_direction call\n";
    return undef;
  }
  if ($self->{'global_target_elements'}->{$direction}) {
    $element_target = $self->{'global_target_elements'}->{$direction};
  } elsif ($element->{'extra'} and $element->{'extra'}->{'directions'}
      and $element->{'extra'}->{'directions'}->{$direction}) {
    $element_target
      = $element->{'extra'}->{'directions'}->{$direction};
  }

  if ($element_target) {
    ######## debug
    if (!$element_target->{'type'}) {
      die "No type for element_target $direction $element_target: "
        . Texinfo::Parser::_print_current_keys($element_target)
        . "directions :". Texinfo::Structuring::_print_directions($element);
    }
    ########
    if ($element_target->{'type'} eq 'external_node') {
      my $external_node = $element_target->{'extra'};
      if ($type eq 'href') {
        return $self->command_href($external_node, $filename);
      } elsif ($type eq 'text' or $type eq 'node') {
        return $self->command_text($external_node);
      }
    } elsif ($type eq 'node') {
      $command = $element_target->{'extra'}->{'node'};
      $target = $self->{'targets'}->{$command} if ($command);
      $type = 'text';
    } else {
      # FIXME be able to chose node over sectioning or the other way around?
      $command = $element_target->{'extra'}->{'element_command'};
      if ($type eq 'href') {
        if (defined($command)) {
          return $self->command_href($command, $filename);
        } else {
          return '';
        }
      }
      $target = $self->{'targets'}->{$command} if ($command);
    }
  } elsif ($self->special_element($direction)) {
    $element_target = $self->special_element($direction);
    $command = $element_target;
    if ($type eq 'href') {
      return $self->command_href($element_target, $filename);
    }
    $target = $self->{'targets'}->{$element_target};
  } else {
    return undef;
  }

  if (exists($target->{$type})) {
    return $target->{$type};
  } elsif ($type eq 'id' or $type eq 'target') {
    # FIXME
    return undef;
  } elsif ($command) {
    return $self->command_text($command, $type);
  }
}

sub _default_contents($$;$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $filename = shift;
  $filename = $self->{'current_filename'} if (!defined($filename));

  return '' 
   if (!$self->{'structuring'} or !$self->{'structuring'}->{'sectioning_root'});

  my $section_root = $self->{'structuring'}->{'sectioning_root'};
  my $contents = 1 if ($cmdname eq 'contents');

  my $root_level = $section_root->{'section_childs'}->[0]->{'level'};
  foreach my $top_section(@{$section_root->{'section_childs'}}) {
    $root_level = $top_section->{'level'}
      if ($top_section->{'level'} < $root_level);
  }
  my $ul_class = '';
  $ul_class = $NO_BULLET_LIST_CLASS if ($self->get_conf('NUMBER_SECTIONS'));

  my $result = '';
  $result .= $self->attribute_class('div', $cmdname).">\n";

  foreach my $top_section (@{$section_root->{'section_childs'}}) {
    my $section = $top_section;
 SECTION:
    while ($section) {# and $section ne $section_root) {
      if ($section->{'cmdname'} ne 'top') {
        my $text = $self->command_text($section);
        # FIXME OVERVIEW_LINK_TO_TOC?
        my $href;
        if (!$contents and $self->get_conf('OVERVIEW_LINK_TO_TOC')) {
          $href = $self->command_contents_href($section, 'contents', $filename);
        } else {
          $href = $self->command_href($section, $filename);
        }
        my $toc_id = $self->command_contents_id($section, $cmdname);
        if ($text ne '') {
          # no indenting for shortcontents
          $result .= (' ' x (2*($section->{'level'} - $root_level))) 
            if ($contents);
          $result .= "<li><a name=\"$toc_id\" href=\"$href\">$text</a>";
        }
      }
      # for shortcontents don't do child if child is not toplevel
      if ($section->{'section_childs'}
          and ($contents or $section->{'level'} < $root_level+1)) {
        # no indenting for shortcontents
        $result .= "\n". ' ' x (2*($section->{'level'} - $root_level))
          if ($contents);
        $result .= $self->attribute_class('ul', $ul_class) .">\n";
        $section = $section->{'section_childs'}->[0];
      } elsif ($section->{'section_next'}) {
        $result .= "</li>\n";
        last if ($section eq $top_section);
        $section = $section->{'section_next'};
      } else {
        last if ($section eq $top_section);
        while ($section->{'section_up'}) {
          $section = $section->{'section_up'};
          $result .= "</li>\n". ' ' x (2*($section->{'level'} - $root_level))
            . "</ul>";
          last SECTION if ($section eq $top_section);
          if ($section->{'section_next'}) {
            $result .= "</li>\n";
            $section = $section->{'section_next'};
            last;
          }
        }
      }
    }
    $result .= "\n</div>\n";
  }
  return $result;
}

sub _default_program_string($)
{
  my $self = shift;
  return $self->convert_tree(
    $self->gdt('This document was generated on @emph{@today{}} using @uref{{program_homepage}, @emph{{program}}}.',
         { 'program_homepage' => $self->get_conf('PROGRAM_HOMEPAGE'),
           'program' => $self->get_conf('PROGRAM') }));
}

sub _default_end_file($)
{
  my $self = shift;
  my $program_text = '';
  if ($self->get_conf('PROGRAM_NAME_IN_FOOTER')) {
    my $program_string = &{$self->{'program_string'}}($self);
    $program_text = " <font size=\"-1\">
  $program_string
 </font>
 <br>";
  }
  my $pre_body_close = $self->get_conf('PRE_BODY_CLOSE');
  $pre_body_close = '' if (!defined($pre_body_close));
  return "<p>
$program_text
$pre_body_close
</p>
</body>
</html>
";
}

sub _default_begin_file($$$)
{
  my $self = shift;
  my $filename = shift;
  my $page = shift;

  
  my $title;
  if ($page and $page->{'extra'} and $page->{'extra'}->{'element'}) {
    my $element_string = $self->_element_direction($page->{'extra'}->{'element'},
                              'This', 'string');
    if (defined($element_string) 
        and $element_string ne $self->{'title_string'}) {
      print STDERR "DO <title>\n"
        if ($self->get_conf('DEBUG'));
      my $title_tree = $self->gdt('{title}: {element_text}', 
                                 { 'title' => $self->{'title_tree'}, 
                   'element_text' => 
                     $self->_element_direction($page->{'extra'}->{'element'},
                                              'This', 'tree')});
      $title = $self->_convert({'type' => '_string',
                                'contents' => [$title_tree]});
    }
  }
  $title = $self->{'title_string'} if (!defined($title));

  my $description;
  if ($self->{'documentdescription_string'}) {
    $description = $self->{'documentdescription_string'};
  } else {
    $description = $title;
  }
  $description = "<meta name=\"description\" content=\"$description\">" 
    if ($description ne '');
  my $encoding = '';
  $encoding 
     = "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=".
       $self->{'encoding_name'}."\">" 
    if (defined($self->{'encoding_name'}) 
        and ($self->{'encoding_name'} ne ''));

  my $date = '';
  if ($self->get_conf('DATE_IN_HEADER')) {
    # FIXME new context?
    $self->{'context'}->[-1]->{'string'} = 1;
    my $today = $self->convert_tree({'cmdname' => 'today'});
    delete $self->{'context'}->[-1]->{'string'};
    $date = "\n<meta name=\"date\" content=\"$today\">";
  }

  my $links = '';
  if ($self->get_conf('USE_LINKS')) {
    my $link_buttons = $self->get_conf('LINKS_BUTTONS');
    foreach my $link (@$link_buttons) {
      my $link_href = $self->_element_direction($page->{'extra'}->{'element'},
                                          $link, 'href', $page->{'filename'});
      #print STDERR "$title: $link -> $link_href \n";
      if ($link_href and $link_href ne '') {
        my $link_string = $self->_element_direction($page->{'extra'}->{'element'},
                                          $link, 'string');
        my $title = '';
        $title = " title=\"$link_string\"" if (defined($link_string));
        my $rel = '';
        $rel = " rel=\"".$self->get_conf('BUTTONS_REL')->{$link}.'"' 
           if (defined($self->get_conf('BUTTONS_REL')->{$link}));
        $links .= "<link href=\"$link_href\"${rel}${title}>\n";
      }
    }
  }
  my $css_lines;
  if (defined($self->get_conf('CSS_LINES'))) {
    $css_lines = $self->get_conf('CSS_LINES');
  } else {
    $css_lines = '';
  }
  my $doctype = $self->get_conf('DOCTYPE');
  my $bodytext = $self->get_conf('BODYTEXT');
  my $copying_comment = '';
  $copying_comment = $self->{'copying_comment'} 
    if (defined($self->{'copying_comment'}));
  my $after_body_open = '';
  $after_body_open = $self->get_conf('AFTER_BODY_OPEN')
    if (defined($self->get_conf('AFTER_BODY_OPEN')));
  my $extra_head = '';
  $extra_head = $self->get_conf('EXTRA_HEAD')
    if (defined($self->get_conf('EXTRA_HEAD')));
  my $program_and_version = $self->get_conf('PROGRAM_AND_VERSION');
  my $program_homepage = $self->get_conf('PROGRAM_HOMEPAGE');
  my $program = $self->get_conf('PROGRAM');

  # FIXME there is one empty line less than in texi2html.  Seems that in 
  # texi2html the following empty lines are stripped.  Not exactly sure
  # how, but it seems that some blank lines are removed before first element.
  # Maybe misc commands are also stripped before.
  my $result = "$doctype
<html>
$copying_comment<!-- Created by $program_and_version, $program_homepage -->
<head>
<title>$title</title>

$description
<meta name=\"keywords\" content=\"$title\">
<meta name=\"resource-type\" content=\"document\">
<meta name=\"distribution\" content=\"global\">
<meta name=\"Generator\" content=\"$program\">$date
$encoding
${links}$css_lines
$extra_head
</head>

<body $bodytext>
$after_body_open
";

  return $result;
}

sub convert_translation($$$)
{
  my $self = shift;
  my $text = shift;
  return $self->convert_tree($self->gdt($text));
}

sub _default_special_element_body($$$)
{
  my $self = shift;
  my $special_type = shift;
  my $element = shift;

  if ($special_type eq 'About') {
    my $about = "<p>\n";
    my $PRE_ABOUT = $self->get_conf('PRE_ABOUT');
    if (defined($PRE_ABOUT)) {
      if (ref($PRE_ABOUT) eq 'CODE') {
        $about .= &$PRE_ABOUT($self, $element);
      } else {
        $about .= $PRE_ABOUT;
      }
    } else {
      $about .= '  '.&{$self->{'program_string'}}($self) ."\n";
    }
    $about .= <<EOT;
</p>
<p>
EOT
    $about .= $self->convert_tree($self->gdt('  The buttons in the navigation panels have the following meaning:')) . "\n";
    $about .= <<EOT;
</p>
<table border="1">
  <tr>
EOT
    $about .= '    <th> ' . $self->convert_tree($self->gdt('Button')) . " </th>\n" .
     '    <th> ' . $self->convert_tree($self->gdt('Name')) . " </th>\n" .
     '    <th> ' . $self->convert_tree($self->gdt('Go to')) . " </th>\n" .
     '    <th> ' . $self->convert_tree($self->gdt('From 1.2.3 go to')) . "</th>\n" . "  </tr>\n";

    foreach my $button (@{$self->get_conf('SECTION_BUTTONS')}) {
      next if ($button eq ' ' or ref($button) eq 'CODE' or ref($button) eq 'SCALAR' 
                or ref($button) eq 'ARRAY');
      $about .= "  <tr>\n    <td align=\"center\">";
      $about .=
            ($self->get_conf('ICONS') && $self->get_conf('ACTIVE_ICONS')->{$button} ?
             &{$self->{'button_icon_img'}}($self, $button, 
                                       $self->get_conf('ACTIVE_ICONS')->{$button}) :
             ' [' . $self->get_conf('BUTTONS_TEXT')->{$button} . '] ');
      $about .= "</td>\n";
      $about .= 
"    <td align=\"center\">".$self->get_conf('BUTTONS_NAME')->{$button}."</td>
    <td>".$self->get_conf('BUTTONS_GOTO')->{$button}."</td>
    <td>".$self->get_conf('BUTTONS_EXAMPLE')->{$button}."</td>
  </tr>
";
    }

    $about .= <<EOT;
</table>

<p>
EOT
    $about .= $self->convert_tree($self->gdt('  where the @strong{ Example } assumes that the current position is at @strong{ Subsubsection One-Two-Three } of a document of the following structure:')) . "\n";

#  where the <strong> Example </strong> assumes that the current position
#  is at <strong> Subsubsection One-Two-Three </strong> of a document of
#  the following structure:
    $about .= <<EOT;
</p>

<ul>
EOT
    $about .= '  <li> 1. ' . $self->convert_tree($self->gdt('Section One')) . "\n" .
"    <ul>\n" .
'      <li>1.1 ' . $self->convert_tree($self->gdt('Subsection One-One')) . "\n";
    $about .= <<EOT;
        <ul>
          <li>...</li>
        </ul>
      </li>
EOT
    $about .= '      <li>1.2 ' . $self->convert_tree($self->gdt('Subsection One-Two')) . "\n" .
"        <ul>\n" .
'          <li>1.2.1 ' . $self->convert_tree($self->gdt('Subsubsection One-Two-One')) . "</li>\n" .
'          <li>1.2.2 ' . $self->convert_tree($self->gdt('Subsubsection One-Two-Two')) . "</li>\n" .
'          <li>1.2.3 ' . $self->convert_tree($self->gdt('Subsubsection One-Two-Three')) . " &nbsp; &nbsp;\n"
.
'            <strong>&lt;== ' . $self->convert_tree($self->gdt('Current Position')) . " </strong></li>\n" .
'          <li>1.2.4 ' . $self->convert_tree($self->gdt('Subsubsection One-Two-Four')) . "</li>\n" .
"        </ul>\n" .
"      </li>\n" .
'      <li>1.3 ' . $self->convert_tree($self->gdt('Subsection One-Three')) . "\n";
    $about .= <<EOT;
        <ul>
          <li>...</li>
        </ul>
      </li>
EOT
    $about .= '      <li>1.4 ' . $self->convert_tree($self->gdt('Subsection One-Four')) . "</li>\n";

    my $AFTER_ABOUT = '';
    if (defined($self->get_conf('AFTER_ABOUT'))) {
      $AFTER_ABOUT = $self->get_conf('AFTER_ABOUT');
    }
    $about .= <<EOT;
    </ul>
  </li>
</ul>
$AFTER_ABOUT
EOT
    return $about;
  } elsif ($special_type eq 'Contents') {
    return $self->{'contents'}($self, 'contents', undef);
  } elsif ($special_type eq 'Overview') {
    return $self->{'contents'}($self, 'shortcontents', undef);
  } elsif ($special_type eq 'Footnotes') {
    return $foot_lines;
  }
}

sub convert($$)
{
  my $self = shift;
  my $root = shift;

  my $result = '';

  # This should return undef if called on a tree without node or sections.
  my ($elements, $special_elements, $special_pages) 
    = $self->_prepare_elements($root);
  $self->_prepare_index_entries();
  $self->_prepare_footnotes();

  if (!defined($elements)) {
    $result = $self->_convert($root);
    #my $footnotes = $self->_footnotes();
    #$result .= $footnotes;
  } else {
    foreach my $element (@$elements) {
      my $element_text = $self->_convert($element);
      $result .= $element_text;
    }
  }

  return $result;
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

  # no splitting when writing to the null device or to stdout or returning
  # a string
  if (defined($self->get_conf('OUTFILE'))
      and ($Texinfo::Common::null_device_file{$self->get_conf('OUTFILE')}
           or $self->get_conf('OUTFILE') eq '-'
           or $self->get_conf('OUTFILE') eq '')) {
    $self->force_conf('SPLIT', 0);
    $self->force_conf('MONOLITHIC', 1);
  }
  if ($self->{'SPLIT'}) {
    $self->set_conf('NODE_FILES', 1);
  }
  if ($self->get_conf('NODE_FILES') or $self->get_conf('SPLIT') eq 'node') {
    $self->set_conf('NODE_FILENAMES', 1);
  }
  $self->set_conf('EXTERNAL_CROSSREF_SPLIT', $self->get_conf('SPLIT'));
                                                   
  $self->_prepare_css();

  # this sets OUTFILE, to be used if not split, but also
  # 'destination_directory' and 'output_filename' that are useful when split.
  $self->_set_outfile();
  return undef unless $self->_create_destination_directory();

  # This should return undef if called on a tree without node or sections.
  my ($elements, $special_elements, $special_pages) 
    = $self->_prepare_elements($root);

  $self->_prepare_global_targets($elements);

  # undef if no elements
  my $pages;
  if ($self->get_conf('OUTFILE') ne '') {
    $pages = Texinfo::Structuring::split_pages($elements, 
                                                $self->get_conf('SPLIT'));
  }

  $self->{'pages'} = $pages;
  
  # determine file names associated with the different pages, and setup
  # the counters for special element pages.
  $self->_set_page_files($pages, $special_pages);

  $self->_prepare_contents_elements();

  # do element directions. 
  Texinfo::Structuring::elements_directions($self, $elements);

  # do element directions related to files.
  # FIXME do it here or before?  Here it means that
  # PrevFile and NextFile can be set.
  Texinfo::Structuring::elements_file_directions($self, $elements);

  # associate the special elements that have no page to the main page.
  # This may only happen if not split.
  if ($special_elements) {
    foreach my $special_element (@$special_elements) {
      if (!defined($special_element->{'parent'})) {
        $special_element->{'parent'} = $pages->[0];
        $special_element->{'element_prev'} = $pages->[0]->{'contents'}->[-1];
        $pages->[0]->{'contents'}->[-1]->{'element_next'} = $special_element;
        push @{$pages->[0]->{'contents'}}, $special_element;
      }
    }
  }

  $self->_prepare_index_entries();
  $self->_prepare_footnotes();

  $self->set_conf('BODYTEXT', 'lang="' . $self->get_conf('documentlanguage') 
   . '" bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000"');

  # prepare title
  my $fulltitle;
  foreach my $fulltitle_command('settitle', 'title', 
     'shorttitlepage', 'top') {
    if ($self->{'extra'}->{$fulltitle_command}) {
      my $command = $self->{'extra'}->{$fulltitle_command};
      next if (!$command->{'extra'}
               or (!$command->{'extra'}->{'misc_content'}
                   or $command->{'extra'}->{'missing_argument'}));
      print STDERR "Using $fulltitle_command as title\n"
        if ($self->get_conf('DEBUG'));
      # FIXME remove the virtual _fulltitle type?
      $fulltitle = {'contents' => $command->{'extra'}->{'misc_content'},
                    'type' => '_fulltitle'};
      last;
    }
  }
  if (!$fulltitle and $self->{'extra'}->{'titlefont'}
      and $self->{'extra'}->{'titlefont'}->[0]->{'extra'}
      and $self->{'extra'}->{'titlefont'}->[0]->{'extra'}->{'brace_command_contents'}
      and defined($self->{'extra'}->{'titlefont'}->[0]->{'extra'}->{'brace_command_contents'}->[0])) {
    $fulltitle = $self->{'extra'}->{'titlefont'}->[0];
  }
  # prepare simpletitle
  foreach my $simpletitle_command('settitle', 'shorttitlepage') {
    if ($self->{'extra'}->{$simpletitle_command}) {
      my $command = $self->{'extra'}->{$simpletitle_command};
      next if ($command->{'extra'} 
               and $command->{'extra'}->{'missing_argument'});
      $self->{'simpletitle_tree'} = 
         {'contents' => $command->{'extra'}->{'misc_content'}};
      last;
    }
  }

  my $html_title_string;
  if ($fulltitle) {
    $self->{'title_tree'} = $fulltitle;
    print STDERR "DO fulltitle_string\n" if ($self->get_conf('DEBUG'));
    $html_title_string = $self->_convert({'type' => '_string',
                                         'contents' => [$self->{'title_tree'}]});
  }
  if (!defined($html_title_string) or $html_title_string !~ /\S/) {
    my $default_title = $self->gdt('Untitled Document');
    $self->{'title_tree'} = $default_title;
    $self->{'title_string'} = $self->_convert({'type' => '_string',
                                         'contents' => [$self->{'title_tree'}]});
    $self->document_warn($self->__(
                         "Must specify a title with a title command or \@top"));
  } else {
    $self->{'title_string'} = $html_title_string;
  }

  # copying comment
  if ($self->{'extra'}->{'copying'}) {
    my $options;
    if ($self->get_conf('ENABLE_ENCODING') 
        and $self->{'encoding_name'}) {
      $options->{'enabled_encoding'} = $self->{'encoding_name'};
    }
    print STDERR "DO copying_comment\n" if ($self->get_conf('DEBUG'));
    my $copying_comment = Texinfo::Convert::Text::convert(
     {'contents' => $self->{'extra'}->{'copying'}->{'contents'}}, $options);
    if ($copying_comment ne '') {
      $self->{'copying_comment'} = &{$self->{'comment'}}($self, $copying_comment);
    }
  }

  # documentdescription
  if ($self->{'extra'}->{'documentdescription'}) {
    print STDERR "DO documentdescription\n" if ($self->get_conf('DEBUG'));
    $self->{'documentdescription_string'} = $self->_convert(
      {'type' => '_string',
       'contents' => $self->{'extra'}->{'documentdescription'}->{'contents'}});
  }

  # Now do the output
  my $fh;
  my $output = '';
  if (!$pages) {
    # no page
    if ($self->get_conf('OUTFILE') ne '') {
      $fh = $self->Texinfo::Common::open_out ($self->get_conf('OUTFILE'),
                                            $self->{'perl_encoding'});
       if (!$fh) {
         $self->document_error(sprintf($self->__("Could not open %s for writing: %s"),
                                    $self->get_conf('OUTFILE'), $!));
        return undef;
      }
      #$self->{'fh'} = $fh;
    }
    $self->{'current_filename'} = $self->{'output_filename'};
    my $header = &{$self->{'begin_file'}}($self, $self->{'output_filename'}, undef);
    $output .= _output_text($header, $fh);
    if ($elements and @$elements) {
      foreach my $element (@$elements) {
        my $element_text = $self->_convert($element);
        $output .= _output_text($element_text, $fh);
      }
    } else {
      $output .= _output_text($self->_convert($root), $fh);
    }
    $output .= _output_text(&{$self->{'end_file'}}($self), $fh);
  } else {
    # output with pages
    my %files;
    # TODO set page file names $page->{'filename'} (relative) and 
    # $page->{'out_filename'} (absolute)
    
    $special_pages = [] if (!defined($special_pages));
    foreach my $page (@$pages, @$special_pages) {
      my $file_fh;
      if (!$files{$page->{'filename'}}->{'fh'}) {
        $file_fh = $self->Texinfo::Common::open_out ($page->{'out_filename'},
                                                      $self->{'perl_encoding'});
        if (!$file_fh) {
         $self->document_error(sprintf($self->__("Could not open %s for writing: %s"),
                                    $page->{'out_filename'}, $!));
          # FIXME close/remove files already created
          return undef;
        }
        $self->{'current_filename'} = $page->{'filename'};
        print $file_fh "".&{$self->{'begin_file'}}($self, $page->{'filename'}, $page);
        $files{$page->{'filename'}}->{'fh'} = $file_fh;
      } else {
        $file_fh = $files{$page->{'filename'}}->{'fh'};
      }
      foreach my $element (@{$page->{'contents'}}) {
        my $element_text = $self->_convert($element);
        print $file_fh $element_text;
      }
      $self->{'file_counters'}->{$page->{'filename'}}--;
      if ($self->{'file_counters'}->{$page->{'filename'}} == 0) {
        # end file
        print $file_fh "". &{$self->{'end_file'}}($self);
      }
    }
  }
}

sub attribute_class($$$)
{
  my $self = shift;
  my $element = shift;
  my $class = shift;

  return "<$element" if (!defined($class) or $class eq '' 
                         or $self->get_conf('NO_CSS'));

  my $style = '';

  if ($self->get_conf('INLINE_CSS_STYLE') 
      and defined($self->{'css_map'}->{"$element.$class"})) {
    $style = ' style="'.$self->{'css_map'}->{"$element.$class"}.'"';
  }
  return "<$element class=\"$class\"$style";
}

sub protect_space_codebreak($$)
{
  my $self = shift;
  my $text = shift;

  return $text if ($self->in_preformatted());

  my $in_w = 1 if ($self->in_space_protected());

  if ($in_w or $self->in_code() 
      and $self->get_conf('allowcodebreaks') eq 'false') {
    my $class = 'nolinebreak';
    $class = 'nocodebreak' if ($self->in_code() 
                           and $self->get_conf('allowcodebreaks') eq 'false');
    my $open = $self->attribute_class('span', $class).'>';
    # protect spaces in the html leading attribute in case we are in 'w'
    $open =~ s/ /\x{1F}/g if ($in_w);
    # special span to avoid breaking at _-
    $text =~ s/(\S*[_-]\S*)/${open}$1<\/span>/g;
  }
  if ($in_w) {
    $text .= '&nbsp;' if (chomp($text));
    # protect spaces within text
    $text =~ s/ /&nbsp;/g;
    # revert protected spaces in leading html attribute
    $text =~ s/\x{1F}/ /g;
  }
  return $text;
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
  #  if ($self->get_conf('DEBUG'));
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

  if ($self->get_conf('DEBUG')) {
    print STDERR "ROOT:$root (".join('|',@{$self->{'context'}})."), ->";
    print STDERR " cmd: $root->{'cmdname'}," if ($root->{'cmdname'});
    print STDERR " type: $root->{'type'}" if ($root->{'type'});
    my $text = $root->{'text'}; 
    if (defined($text)) {
      $text =~ s/\n/\\n/;
      print STDERR " text: $text";
    }
    print STDERR "\n";
   
    #print STDERR "  Special def_command: $root->{'extra'}->{'def_command'}\n"
    #  if (defined($root->{'extra'}) and $root->{'extra'}->{'def_command'});
  }

  if (ref($root) ne 'HASH') {
    cluck "_convert: root not a HASH\n";
    return '';
  }

  if (($root->{'type'}
        and exists ($self->{'types_conversion'}->{$root->{'type'}})
        and !defined($self->{'types_conversion'}->{$root->{'type'}}))
       or ($root->{'cmdname'}
            and exists($self->{'commands_conversion'}->{$root->{'cmdname'}})
            and !defined($self->{'commands_conversion'}->{$root->{'cmdname'}}))) {
    if ($self->get_conf('DEBUG')) {
      my $string = 'IGNORED';
      $string .= " \@$root->{'cmdname'}" if ($root->{'cmdname'});
      $string .= " $root->{'type'}" if ($root->{'type'});
      print STDERR "$string\n";
    }
    return '';
  }

  # process text
  if (defined($root->{'text'})) {
    # already converted to html, keep it as is
    if ($root->{'type'} and $root->{'type'} eq '_converted') {
      return $root->{'text'};
    }
    my $result = &{$self->{'types_conversion'}->{'text'}} ($self, 
                                                      $root->{'type'},
                                                      $root,
                                                      $root->{'text'});
    print STDERR "DO TEXT => `$result'\n" if ($self->get_conf('DEBUG'));
    return $result;
  }

  if ($root->{'extra'}) {
    if ($root->{'extra'}->{'invalid_nesting'}) {
      print STDERR "INVALID_NESTING\n" if ($self->get_conf('DEBUG'));
      return '';
    } elsif ($root->{'extra'}->{'missing_argument'} 
             and (!$root->{'contents'} or !@{$root->{'contents'}})) {
      print STDERR "MISSING_ARGUMENT\n" if ($self->get_conf('DEBUG'));
      return '';
    }
  }

      #and !$self->{'multiple_pass'} and !$self->{'in_copying_header'}) {
    # special case for index entry not associated with a node but seen. 
    # this will be an index entry in @copying, in @insertcopying.
#    if (!$root->{'extra'}->{'index_entry'}->{'node'} and $self->{'node'}) {
#      $location->{'node'} = $self->{'node'};
#    }
#    $self->{'index_entries_line_location'}->{$root} = $location;
#    print STDERR "INDEX ENTRY lines_count $location->{'lines'}, index_entry $location->{'index_entry'}\n" 
#       if ($self->get_conf('DEBUG'));

  # TODO special: center, footnote

  # commands like @deffnx have both a cmdname and a def_line type.  It is
  # better to consider them as a def_line type, as the whole point of the
  # def_line type is to handle the same the def*x and def* line formatting. 
  if ($root->{'cmdname'} 
      and !($root->{'type'} and $root->{'type'} eq 'def_line'
            or $root->{'type'} and $root->{'type'} eq 'definfoenclose_command')) {
    my $command_name = $root->{'cmdname'};
    # use the same command name for all the index entry commands
    if ($root->{'extra'} and $root->{'extra'}->{'index_entry'}
      and $root->{'cmdname'} and $root->{'cmdname'} =~ /index$/) {
      $command_name = 'cindex';
    }
    if ($root_commands{$command_name}) {
      $self->{'current_root_command'} = $root;
    }
    if (exists($self->{'commands_conversion'}->{$command_name})) {
      my $result;
      my $content_formatted;
      if (exists($format_context_commands{$command_name})) {
        push @{$self->{'context'}}, {'cmdname' => $command_name,
                                     'align' => ['raggedright']};
      }
      if (exists($block_commands{$command_name})) {
        push @{$self->{'formats'}}, $command_name;
      }
      if ($preformatted_commands_context{$command_name}) {
        push @{$self->{'preformatted_context'}}, $command_name;
      }
      if ($code_style_commands{$command_name} or 
          $preformatted_code_commands{$command_name}) {
        $self->{'context'}->[-1]->{'code'}++;
      } elsif ($upper_case_commands{$command_name}) {
        $self->{'context'}->[-1]->{'upper_case'}++;
      } elsif ($command_name eq 'math') {
        $self->{'context'}->[-1]->{'math'}++;
      } elsif ($command_name eq 'w') {
        $self->{'context'}->[-1]->{'space_protected'}++;
      } elsif ($align_commands{$root->{'cmdname'}}) {
        push @{$self->{'context'}->[-1]->{'align'}}, $command_name;
      }
      if ($root->{'contents'}) {
        $content_formatted = '';
        # TODO different types of contents
        my $content_idx = 0;
        foreach my $content (@{$root->{'contents'}}) {
          my $new_content = $self->_convert($content);
          if (!defined($new_content)) {
            print STDERR "content $content_idx not defined for ".Texinfo::Parser::_print_current ($root);
            print STDERR "content is: ".Texinfo::Parser::_print_current ($content);
          } else {
            $content_formatted .= $new_content;
          }
          $content_idx++;
        }
      }
      my $args_formatted;
      if ($brace_commands{$command_name} 
          or ($misc_commands{$command_name} 
              and $misc_commands{$command_name} eq 'line')
          or ($command_name eq 'quotation' 
              or $command_name eq 'smallquotation')
              or ($command_name eq 'float')) {
        $args_formatted = [];
        if ($root->{'args'}) {
          my @args_specification;
          @args_specification = @{$self->{'commands_args'}->{$command_name}}
            if (defined($self->{'commands_args'}->{$command_name}));
          foreach my $arg (@{$root->{'args'}}) {
            my $arg_spec = shift @args_specification;
            $arg_spec = ['normal'] if (!defined($arg_spec));
            my $arg_formatted = {'tree' => $arg};
            foreach my $arg_type (@$arg_spec) {
              if ($arg_type eq 'normal') {
                $arg_formatted->{'normal'} = $self->_convert($arg);
              } elsif ($arg_type eq 'code') {
                $self->{'context'}->[-1]->{'code'}++;
                $arg_formatted->{$arg_type} = $self->_convert($arg);
                $self->{'context'}->[-1]->{'code'}--;
              } elsif ($arg_type eq 'string') {
                $self->{'context'}->[-1]->{$arg_type}++;
                $arg_formatted->{$arg_type} = $self->_convert($arg);
                $self->{'context'}->[-1]->{$arg_type}--;
              } elsif ($arg_type eq 'codestring') {
                $self->{'context'}->[-1]->{'code'}++;
                $self->{'context'}->[-1]->{'string'}++;
                $arg_formatted->{$arg_type} = $self->_convert($arg);
                $self->{'context'}->[-1]->{'string'}--;
                $self->{'context'}->[-1]->{'code'}--;
              } elsif ($arg_type eq 'text') {
                $arg_formatted->{$arg_type} 
                  = Texinfo::Convert::Text::convert($arg);
              }
            }
            
            push @$args_formatted, $arg_formatted;
          }
        }
        if (!defined($self->{'commands_conversion'}->{$command_name})) {
          print STDERR "No command_conversion for $command_name\n";
          return '';
        }
        $result = &{$self->{'commands_conversion'}->{$command_name}}($self,
                $command_name, $root, $args_formatted, $content_formatted);
      } else {
        $result = &{$self->{'commands_conversion'}->{$command_name}}($self,
                $command_name, $root, $content_formatted);
      }
      if ($preformatted_commands_context{$command_name}) {
        pop @{$self->{'preformatted_context'}};
      }
      if ($code_style_commands{$command_name} or 
          $preformatted_code_commands{$command_name}) {
        $self->{'context'}->[-1]->{'code'}--;
      } elsif ($upper_case_commands{$command_name}) {
        $self->{'context'}->[-1]->{'upper_case'}--;
      } elsif ($command_name eq 'math') {
        $self->{'context'}->[-1]->{'math'}--;
      } elsif ($command_name eq 'w') {
        $self->{'context'}->[-1]->{'space_protected'}--;
      } elsif ($align_commands{$command_name}) {
        pop @{$self->{'context'}->[-1]->{'align'}};
      }
      if (exists($block_commands{$command_name})) {
        pop @{$self->{'formats'}};
      }
      if (exists($format_context_commands{$command_name})) {
        pop @{$self->{'context'}};
      }
      return $result;
    } else {
      print STDERR "BUG: unknown command `$command_name'\n";
      return '';
    }
    if ($root_commands{$command_name}) {
      delete $self->{'current_root_command'};
    }
  } elsif ($root->{'type'}) {
    if ($root->{'type'} eq 'paragraph') {
      $self->{'context'}->[-1]->{'paragraph_number'}++;
    } elsif ($root->{'type'} eq 'preformatted') {
      $self->{'context'}->[-1]->{'preformatted_number'}++;
    } elsif ($root->{'type'} eq '_code') {
      $self->{'context'}->[-1]->{'code'}++;
    } elsif ($root->{'type'} eq '_string') {
      $self->{'context'}->[-1]->{'string'}++;
    } elsif ($root->{'type'} eq 'page') {
      $self->{'current_page'} = $root;
      $self->{'current_filename'} = $root->{'filename'};
    } elsif ($root->{'type'} eq 'element') { 
      $self->{'current_element'} = $root;
    }
    my $content_formatted;
    if ($root->{'type'} eq 'definfoenclose_command') {
      if ($root->{'args'}) {
        $content_formatted = $self->_convert($root->{'args'}->[0]);
      }
    } elsif ($root->{'contents'}) {
      $content_formatted = '';
      # TODO different types of contents
      if (ref($root->{'contents'}) ne 'ARRAY') {
        cluck "for $root contents not an array: $root->{'contents'}";
        print STDERR Texinfo::Parser::_print_current($root);
      }

      # FIXME as texi2html, ignore space only contents at the beginning.
      # Is it right?
      my $only_spaces;
      if ($root->{'type'} eq 'text_root') {
        $only_spaces = 1;
      }
      foreach my $content (@{$root->{'contents'}}) {
        my $new_content = $self->_convert($content);
        if ($only_spaces) {
          if ($new_content =~ /\S/) {
            $only_spaces = 0;
          }
        }
        $content_formatted .= $new_content unless ($only_spaces);
      }
    }
    my $result = '';
    if (exists($self->{'types_conversion'}->{$root->{'type'}})) {
      $result = &{$self->{'types_conversion'}->{$root->{'type'}}} ($self,
                                                 $root->{'type'},
                                                 $root,
                                                 $content_formatted);
      #print STDERR "Converting type $root->{'type'} -> $result\n";
    } elsif (defined($content_formatted)) {
      $result = $content_formatted;
    }
    if ($root->{'type'} eq '_code') {
      $self->{'context'}->[-1]->{'code'}--;
    } elsif ($root->{'type'} eq '_string') {
      $self->{'context'}->[-1]->{'string'}--;
    } elsif ($root->{'type'} eq 'page') {
      delete $self->{'current_page'};
      delete $self->{'current_filename'};
    } elsif ($root->{'type'} eq 'element') { 
      delete $self->{'current_element'};
    }
    print STDERR "DO type ($root->{'type'}) => `$result'\n"
      if ($self->get_conf('DEBUG'));
    return $result;
    # no type, no cmdname, but contents.
  } elsif ($root->{'contents'}) {
    # FIXME document situations where that happens? Use virtual types?
    my $content_formatted = '';
    foreach my $content (@{$root->{'contents'}}) {
      $content_formatted .= $self->_convert($content);
    }
    print STDERR "UNNAMED HOLDER => `$content_formatted'\n"
      if ($self->get_conf('DEBUG'));
    return $content_formatted;
  } else {
    print STDERR "UNNAMED empty\n" if ($self->get_conf('DEBUG'));
    if ($self->{'types_conversion'}->{''}) {
      return &{$self->{'types_conversion'}->{''}} ($self, $root);
    } else {
      return '';
    }
  }
    #} elsif ($command eq 'value') {
    #  my $expansion = $self->gdt('@{No value for `{value}\'@}', 
    #                                {'value' => $root->{'type'}});
    #  if ($formatter->{'_top_formatter'}) {
    #    $expansion = {'type' => 'paragraph',
    #                  'contents' => [$expansion]};
    #  }
    #  $result .= $self->_convert($expansion);
      #  unshift @{$self->{'current_contents'}->[-1]}, $expansion;
   #   #return '';
   #   return $result;
#    } elsif ($root->{'cmdname'} eq 'center') {
#      #my ($counts, $new_locations);
#    } elsif ($root->{'cmdname'} eq 'insertcopying') {
#      if ($self->{'extra'} and $self->{'extra'}->{'copying'}) {
#        unshift @{$self->{'current_contents'}->[-1]}, 
#           {'contents' => $self->{'extra'}->{'copying'}->{'contents'}};
#      }
#      return '';
#    } elsif ($root->{'cmdname'} eq 'listoffloats') {
# TODO types
#    } elsif ($root->{'type'} eq 'preformatted') {
 # TODO ?
 #   } elsif ($root->{'cmdname'} eq 'quotation' and $root->{'extra'} 
 #            and $root->{'extra'}->{'authors'}) {
 #     foreach my $author (@{$root->{'extra'}->{'authors'}}) {
 #       $result .= $self->_convert(
 #                $self->gdt("\@center --- \@emph{{author}}\n",
 #                   {'author' => $author->{'extra'}->{'misc_content'}}));
 #     }
 #   }
  print STDERR "DEBUG: HERE!($root)\n";
  #return $result;
}

1;
