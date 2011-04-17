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
  return $self->{'context'}->[-1]->{'preformatted'};
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

sub command_id($$)
{
  my $self = shift;
  my $command = shift;
  if ($self->{'targets'}->{$command}) {
    return $self->{'targets'}->{$command}->{'id'};
  } else {
    return undef;
  }
}

sub command_target($$)
{
  my $self = shift;
  my $command = shift;
  if ($self->{'targets'}->{$command}) {
    return $self->{'targets'}->{$command}->{'target'};
  } else {
    return undef;
  }
}

sub command_filename($$)
{
  my $self = shift;
  my $command = shift;

  if ($self->{'targets'}->{$command}) {
    my $target = $self->{'targets'}->{$command};
    if (defined($target->{'filename'})) {
      return $target->{'filename'};
    }
    my ($page, $element, $root_command) = $self->_get_page($command);
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


my %defaults = (
  'ENABLE_ENCODING'      => 1,
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
  'LINKS_BUTTONS'        => ['Top', 'Index', 'Contents', 'About', 
                              'Up', 'NextFile', 'PrevFile'],
  'BUTTONS_REL'          => \%BUTTONS_REL,
  'misc_elements_targets'   => {
                             'Overview' => 'SEC_Overview',
                             'Contents' => 'SEC_Contents',
                             'Footnotes' => 'SEC_Foot',
                             'About' => 'SEC_About'
                            },
  'misc_pages_file_string' => {
                              'Contents' => 'toc',
                              'Overview' => 'ovr',
                              'Footnotes' => 'fot',
                              'About' => 'abt'
                              },
  'misc_elements_order'  => ['Footnotes', 'Contents', 'Overview', 'About'],
  'DOCTYPE'              => '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">',
  'DEFAULT_RULE'         => '<hr>',
  'BODYTEXT'             => undef,
  'documentlanguage'     => 'en',
  'SHOW_TITLE'           => 1,
  'SHOW_MENU'            => 1,
  'MONOLITHIC'           => 1,
# This is the default, mainly for tests; the caller should set them.  These
# values are in fact what should be set -- for now when TEST is true.
  'PROGRAM_AND_VERSION'  => 'texi2html',
  'PROGRAM_HOMEPAGE'     => 'http://www.gnu.org/software/texinfo/',
  'PROGRAM'              => 'texi2html',
  
  
  'DEBUG'                => 0,
  'TEST'                 => 0,
  'output_format'        => 'html',
);

sub _defaults($)
{
  return %defaults;
}

my $NO_BULLET_LIST_STYLE = 'list-style: none';
my $NO_BULLET_LIST_CLASS = 'no-bullet';
my $NO_BULLET_LIST_ATTRIBUTE = ' class="'.$NO_BULLET_LIST_CLASS.'"';

my $MENU_PRE_STYLE = 'font-family: serif';

my %css_map =      (
         "ul.$NO_BULLET_LIST_CLASS" => "$NO_BULLET_LIST_STYLE",
         'pre.menu-comment'       => "$MENU_PRE_STYLE",
         'pre.menu-preformatted'  => "$MENU_PRE_STYLE",
         'a.summary-letter'       => 'text-decoration: none',
         'blockquote.smallquotation' => 'font-size: smaller',
#         'pre.display'            => 'font-family: inherit',
#         'pre.smalldisplay'       => 'font-family: inherit; font-size: smaller',
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

foreach my $indented_format ('example', 'display', 'lisp')
{
  $css_map{"div.$indented_format"} = 'margin-left: 3.2em';
  $css_map{"div.small$indented_format"} = 'margin-left: 3.2em';
}

# default specification of arguments formatting
my %default_commands_args = (
  'email' => [['code'], ['normal']],
  'anchor' => [['string']],
  'uref' => [['codestring'], ['normal'], ['normal']],
  'url' => [['codestring'], ['normal'], ['normal']],
);

# Default for the function references used for the formatting
# of commands.
my %default_commands_conversion;

# Ignored commands

my %kept_misc_commands;
foreach my $command ('footnotestyle', 'documentlanguage', 
      'allowcodebreaks') {
  $kept_misc_commands{$command} = 1;
}

# taken from global
# 'xrefautomaticsectiontitle' (or in Parser?)
# 'documentencoding'
# 'setcontentsaftertitlepage', 'setshortcontentsaftertitlepage'
# 'novalidate'
foreach my $misc_command('verbatiminclude', 'contents', 'shortcontents',
        'summarycontents', 'insertcopying', 'printindex', 'listoffloats',
# not sure for settitle
        'shorttitle', 'shorttitlepage', 'settitle', 'author', 'subtitle',
        'title', keys(%default_index_commands)) {
  $kept_misc_commands{$misc_command} = 1;
}

#my %ignored_misc_commands;
foreach my $misc_command (keys(%misc_commands)) {
#  $ignored_misc_commands{$misc_command} = 1 
  $default_commands_conversion{$misc_command} = undef
    unless ($formatting_misc_commands{$misc_command});
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
              . "$text" . "</$style>";
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

sub default_comment($$) {
  my $self = shift;
  my $text = shift;
  return $self->xml_default_comment($text);
}

my $DEFAULT_RULE = '<hr>';

sub default_heading_text($$$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $text = shift;
  my $level = shift;
  my $command = shift;

  return '' if ($text !~ /\S/);
  # FIXME use a class=*contents?
  my $class = '';
  if ($cmdname !~ /contents$/) {
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
  $result .= $DEFAULT_RULE . "\n" if ($cmdname eq 'part' and defined($DEFAULT_RULE) and $DEFAULT_RULE ne '');
  return $result;
}

sub _convert_heading_command($$$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;
  my $contents = shift;

  # FIXME in texi2html, level is set to 0 if top node, 3 otherwise 
  # and it is printed if $element->{'this'} and !$element->{'with_section'}

  my $do_heading = 1;
  if ($cmdname eq 'node') {
    $do_heading = 0;
  }
  # FIXME TODO
  #if ($self->{'TOC_LINKS'} and defined($element->{'tocid'})) {
  #  $text = &$anchor ('', "$Texi2HTML::THISDOC{'toc_file'}#$element->{'tocid'}", $text);
  #}
  my $result = '';
  my $element_id = $self->command_id($command);
  $result .= "<a name=\"$element_id\"></a>\n" if ($element_id ne '');
  my $heading = $args->[0]->{'normal'};
  if ($heading ne '' and $do_heading) {
    if ($self->in_preformatted()) {
      $result .= '<strong>'.$heading.'</strong>'."\n";
    } else {
      $result .= &{$self->{'heading_text'}}($self, $cmdname, $heading, 
                                            $command->{'level'}, $command);
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

sub _convert_verbatim_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $contents = shift;

  return $self->attribute_class('pre', $cmdname).'>' 
          .$self->xml_protect_text($contents) . '</pre>';
}

$default_commands_conversion{'verbatim'} = \&_convert_verbatim_command;

sub _convert_verbatiminclude_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $verbatim_include_verbatim = $self->expand_verbatiminclude($command);
  return $self->convert_tree($verbatim_include_verbatim);
}

$default_commands_conversion{'verbatiminclude'} 
  = \&_convert_verbatiminclude_command;

my %default_types_conversion;

#my %ignored_types;
foreach my $type ('empty_line_after_command', 'preamble',
            'empty_spaces_after_command', 'spaces_at_end',
            'empty_spaces_before_argument', 'empty_spaces_before_paragraph',
            'empty_spaces_after_close_brace') {
  #$ignored_types{$type} = 1;
  $default_types_conversion{$type} = undef;
}

my %paragraph_style = (
      'center'     => 'center',
      'flushleft'  => 'left',
      'flushright' => 'right',
      );

sub _convert_paragraph_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  if ($self->paragraph_number() == 1) {
    my $in_format = $self->top_format();
    # FIXME also verify that in @item/@tab/@headitem
    return $content 
      if ($in_format and ($in_format eq 'itemize' 
                          or $in_format eq 'enumerate'
                          or $in_format eq 'multitable'));
  }
  my $align = $self->align();
  if ($paragraph_style{$align}) {
    return "<p align=\"$paragraph_style{$align}\">".$content."</p>";
  } else {
    return "<p>".$content."</p>";
  }
}

$default_types_conversion{'paragraph'} = \&_convert_paragraph_type;

sub _convert_empty_line_type($$$) {
  my $self = shift;
  my $type = shift;
  my $command = shift;

  return "\n";
}

$default_types_conversion{'empty_line'} = \&_convert_empty_line_type;
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
    $index_label = "<a href=\"$index_id\"></a>";
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
  # if there is no element, the parent should not be an element
  if (defined($self->get_conf('DEFAULT_RULE'))
      and (!$command->{'parent'}->{'type'}
           or $command->{'parent'}->{'type'} ne 'element')) {
    $result .= $self->get_conf('DEFAULT_RULE') ."\n",
      if $self->get_conf('PROGRAM_NAME_IN_FOOTER');
  }
  return $result;
}

$default_types_conversion{'text_root'} = \&_convert_root_text_type;

sub _convert_element_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  #print STDERR "GGGGGGGG $command->{'parent'} $command->{'parent'}->{'type'}\n";
  my $result = '';
  $result .= $content;
  # FIXME titlepage
  if (!$command->{'element_prev'}) {
    if (!$command->{'element_next'}) {
      return $result.$self->get_conf('DEFAULT_RULE')."\n";
    }
  }
  return $content;
}

$default_types_conversion{'element'} = \&_convert_element_type;

# FIXME associate with element type (replace by _convert_element_type)?
sub _convert_element($$)
{
  my $self = shift;
  my $element = shift;

  my $result = '';

  # This may happen if there are only nodes and sections are used as elements
  #die "BUG: no 'element_command' for $element" 
  #  if (!$element->{'extra'}->{'element_command'});
  die "BUG: no target for $element" 
    if ($element->{'extra'}->{'element_command'} and
        !$self->{'targets'}->{$element->{'extra'}->{'element_command'}});
  print STDERR "NEW ELEMENT $self->{'targets'}->{$element->{'extra'}->{'element_command'}}->{'id'}\n"
    if ($self->get_conf('DEBUG'));

  $result .= $self->_convert($element);

  print STDERR "END ELEMENT\n" if ($self->get_conf('DEBUG'));

  #$result .= $self->_footnotes($element);

  #print STDERR "AFTER FOOTNOTES\n" if ($self->{'DEBUG'});

  return $result;
}

sub _initialize($)
{
  my $self = shift;

  if ($self->get_conf('SHORTEXTN')) {
    $self->set_conf('EXTENSION', 'html');
  }

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
      $self->{'commands_conversion'}->{$command}
         = $default_commands_conversion{$command};
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
     ['heading_text', \&default_heading_text, $Texinfo::Config::heading_text],
     ['comment', \&default_comment, $Texinfo::Config::comment],
     ['css_lines', \&default_css_lines, $Texinfo::Config::css_lines],
     ['begin_file', \&default_begin_file, $Texinfo::Config::begin_file],
     ['end_file', \&default_end_file, $Texinfo::Config::end_file],
     ['program_string', \&default_program_string, $Texinfo::Config::program_string],
  ) {
    if (defined($formatting_references->[2])) {
      $self->{$formatting_references->[0]} = $formatting_references->[2];
    } else {
      $self->{$formatting_references->[0]} = $formatting_references->[1];
    }
  }

  $self->{'context'} = [{'cmdname' => '_toplevel_context', 
                         'align' => ['raggedright']}];
  $self->{'formats'} = [];


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
  $id =~ s/^([0-9_])/g_t$1/;
  return $id;
}

sub default_css_lines ($)
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
  my $root_command = shift;

  my $no_unidecode;
  $no_unidecode = 1 if (defined($self->get_conf('USE_UNIDECODE'))
                        and !$self->get_conf('USE_UNIDECODE'));

  my $target = _normalized_to_id($root_command->{'extra'}->{'normalized'});
  my $id;
  if (!$root_command->{'extra'}->{'manual_content'}) {
    $id = $target;
  }
  # FIXME something special for Top node ?
  if (defined($Texinfo::Config::node_target_name)) {
    ($target, $id) = &$Texinfo::Config::node_target_name($root_command,
                                                         $target, $id);
  }
  my $filename;
  if ($self->get_conf('TRANSLITERATE_FILE_NAMES')) {
    $filename = Texinfo::Convert::NodeNameNormalization::transliterate_texinfo(
     {'contents' => $root_command->{'extra'}->{'node_content'}},
          $no_unidecode);
  } else {
    $filename = $root_command->{'extra'}->{'normalized'};
  }
  return ($filename, $target, $id);
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
      my ($filename, $target, $id) = $self->_node_id_file($root_command);
      $filename .= '.'.$self->get_conf('NODE_FILE_EXTENSION') 
        if (defined($self->get_conf('NODE_FILE_EXTENSION')) 
            and $self->get_conf('NODE_FILE_EXTENSION') ne '');
      if (defined($Texinfo::Config::node_file_name)) {
        $filename = &$Texinfo::Config::node_file_name($self, $root_command,
                                                     $filename);
      }
      if ($self->get_conf('DEBUG')) {
        print STDERR "Register label $target, $filename\n";
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
          my $target_base = _normalized_to_id(
             Texinfo::Convert::NodeNameNormalization::transliterate_texinfo(
                {'contents' => $root_command->{'extra'}->{'misc_content'}},
                $no_unidecode));
          my $nr=0;
          my $target = $target_base;
          while ($self->{'ids'}->{$target}) {
            $target = $target_base.'-'.$nr;
            $nr++;
            # Avoid integer overflow
            die if ($nr == 0);
          }
          my $id = $target;
          if ($root_command->{'associated_node'} 
              and $self->get_conf('USE_NODE_TARGET')) {
            $id = $self->{'targets'}->{$root_command->{'associated_node'}}->{'id'};
          }
          if (defined($Texinfo::Config::sectioning_command_target_name)) {
            ($target, $id) = &$Texinfo::Config::sectioning_command_target_name(
                                                               $self,
                                                               $root_command,
                                                               $target, $id);
          }
          if ($self->get_conf('DEBUG')) {
            print STDERR "Register $root_command->{'cmdname'} $target, $id\n";
          }
          $self->{'targets'}->{$root_command} = {'target' => $target, 
                                                 'id' => $id};
          $self->{'ids'}->{$id} = $root_command;
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

  $page->{'filename'} = $filename;
  $page->{'out_filename'} = $self->{'destination_directory'} . $filename;
}

sub _get_page($$);

# FIXME also find contents/shortcontents/summarycontents page
sub _get_page($$)
{
  my $self = shift;
  my $current = shift;
  my ($element, $root_command);
  while (1) {
    if ($current->{'type'}) {
      if ($current->{'type'} eq 'page') {
        return ($current, $element, $root_command);
      } elsif ($current->{'type'} eq 'element') {
        $element = $current;
      }
    }
    if ($current->{'cmdname'}) {
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
  if ($self->get_conf('USE_NODES')) {
    $elements = Texinfo::Structuring::split_by_node($root);
  } else {
    $elements = Texinfo::Structuring::split_by_section($root);
  }
  $self->_set_root_commands_targets_node_files($elements);
  return $elements;
}

sub _prepare_special_elements($)
{
  my $self = shift;
  my $elements;
  my $pages;

  my %do_special;
  # FIXME do that here or let it to the user?
  if ($self->{'structuring'} and $self->{'structuring'}->{'sectioning_root'}
      and !$self->get_conf('INLINE_CONTENTS')) {
    if ($self->get_conf('contents') 
        and (!$self->get_conf('setcontentsaftertitlepage')
             or !$self->get_conf('USE_TITLEPAGE_FOR_TITLE'))) {
      $do_special{'Contents'} = 1;
    }
    if ($self->get_conf('shortcontents')
        and (!$self->get_conf('setshortcontentsaftertitlepage')
             or !$self->get_conf('USE_TITLEPAGE_FOR_TITLE'))) {
      $do_special{'Overview'} = 1;
    }
  }
  if ($self->{'extra'}->{'footnote'} 
      and $self->get_conf('footnotestyle') eq 'separate') {
    $do_special{'Footnotes'} = 1;
  }
  if ((!defined($self->get_conf('DO_ABOUT')) 
       and $elements and @$elements > 1 
           and ($self->get_conf('SPLIT') or $self->get_conf('HEADERS')))
       or ($self->get_conf('DO_ABOUT'))) {
    $do_special{'About'} = 1;
  }

  my $extension = '';
  $extension = $self->get_conf('EXTENSION') 
    if (defined($self->get_conf('EXTENSION')));

  foreach my $type (@{$self->{'misc_elements_order'}}) {
    next unless ($do_special{$type});

    my $element = {'type' => 'element',
                   'extra' => {'special_element' => $type}};
    $self->{'special_elements'}->{$type} = $element;
    push @$elements, $element;

    my $id = $self->{'misc_elements_targets'}->{$type};
    my $target = $id;
    my $default_filename;
    if ($self->get_conf('SPLIT') or !$self->get_conf('MONOLITHIC')) {
      $default_filename = $self->{'document_name'}.
        $self->{'misc_pages_file_string'}.$extension;
    } else {
      $default_filename = $self->{'OUTFILE'};
    }

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

    if ($self->get_conf('SPLIT') or !$self->get_conf('MONOLITHIC')
        or $filename ne $default_filename) {
      my $page = {'type' => 'page'};
      push @{$page->{'contents'}}, $element;
      $page->{'extra'}->{'element'} = $element;
      $self->{'special_pages'}->{$type} = $page;
      $element->{'parent'} = $page;
      $self->_set_page_file($page, $filename);
      push @$pages, $page;
    }
    # FIXME add element, page... (see command_filename)?
    $self->{'targets'}->{$element} = {'id' => $id,
                                      'target' => $target,
                                      'filename' => $filename,
                                     };
    $self->{'ids'}->{$id} = $element;
  }
  return ($elements, $pages);
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
        my $normalized_index = _normalized_to_id(
          Texinfo::Convert::NodeNameNormalization::transliterate_texinfo(
            {'contents' => $index_entry->{'content'}},
                  $no_unidecode));
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

sub default_external_href($$$)
{
  my $self = shift;
  my $external_node = shift;
  my $target = shift;
  my $target_filebase = shift;

  my $xml_target = _normalized_to_id($target);

  my $default_target_split = $self->get_conf('EXTERNAL_CROSSREF_SPLIT');

  my $extension = '';
  $extension = "." . $self->get_conf('NODE_FILE_EXTENSION')
          if (defined($self->get_conf('NODE_FILE_EXTENSION')) 
              and $self->get_conf('NODE_FILE_EXTENSION') ne '');

  my $target_split;
  my $file;
  if ($external_node->{'extra'}->{'manual_content'}) {
    my $manual_name = Texinfo::Convert::Text::convert(
       {'contents' => $external_node->{'extra'}->{'manual_content'}});
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
);

sub _external_node_reference($$$;$)
{
  my $self = shift;
  my $external_node = shift;
  my $type = shift;
  my $filename = shift;

  my ($target_filebase, $target, $id) = $self->_node_id_file($external_node);
  
  if ($type eq 'href') {
    return &{$self->{'external_node_target'}}($self, $external_node, 
                                              $target, $target_filebase);
  } else {
    return 'TEXT TODO';
  }
}

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

  $filename = $self->{'current_file'} if (!defined($filename));
 
  if (!$valid_types{$type}) {
    print STDERR "Incorrect type $type in _element_direction call\n";
    return undef;
  }

  if ($element->{'extra'} and $element->{'extra'}->{'directions'}
      and $element->{'extra'}->{'directions'}->{$direction}) {
    $element_target 
      = $element->{'extra'}->{'directions'}->{$direction};
    if ($element_target->{'type'} eq 'external_node') {
      return $self->_external_node_reference($element_target, $type, $filename);
    } else {
      $command = $element_target->{'extra'}->{'element_command'};
      $target = $self->{'targets'}->{$command} if ($command);
    }
  } else {
    return undef;
  }

  if ($type eq 'href') {
    my $href = '';
    if (defined($target->{'filename'}) and 
        (!defined($filename) 
         or $filename ne $target->{'filename'})) {
      $href .= $target->{'filename'};
    }
    $href .= '#' . $target->{'target'} 
      if (defined($target->{'target'}));
    return $href;
  } elsif (exists($target->{$type})) {
    return $target->{$type};
  } elsif ($type eq 'id' or $type eq 'target') {
    # FIXME
    return undef;
  } elsif ($command) {
    my $tree;
    if (!$target->{'tree'}) {
      if ($command->{'cmdname'} eq 'node') {
        $tree = {'type' => '_code',
                 'contents' => $command->{'extra'}->{'node_content'}};
      } else {
        # FIXME number
        $tree = {'contents' => $command->{'extra'}->{'misc_content'}};
      }
      $target->{'tree'} = $tree;
      return $target->{'tree'} if ($type eq 'tree');
    } else {
      $tree = $target->{'tree'};
    }

    push @{$self->{'context'}}, 
            {'cmdname' => $command->{'cmdname'}};
    if ($type eq 'string') {
      $tree = {'type' => '_string',
               'contents' => [$tree]};
    }
    print STDERR "DO $target->{'id'}($type)\n" if ($self->get_conf('DEBUG'));
    $target->{$type} = $self->_convert($tree);
    pop @{$self->{'context'}};
    return $target->{$type};
  }
}

sub default_program_string($)
{
  my $self = shift;
  return $self->convert_tree(
    $self->gdt('This document was generated on @emph{@today{}} using @uref{{program_homepage}, @emph{{program}}}.',
         { 'program_homepage' => $self->get_conf('PROGRAM_HOMEPAGE'),
           'program' => $self->get_conf('PROGRAM') }));
}

sub default_end_file($)
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

sub default_begin_file($$$)
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
        $rel = " rel=\"$self->{'BUTTONS_REL'}->{$link}\"" 
           if (defined($self->{'BUTTONS_REL'}->{$link}));
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
$after_body_open";

  return $result;
}

sub convert($$)
{
  my $self = shift;
  my $root = shift;

  my $result = '';

  # This should return undef if called on a tree without node or sections.
  my $elements = $self->_prepare_elements($root);
  $self->_prepare_index_entries();

  if (!defined($elements)) {
    $result = $self->_convert($root);
    #my $footnotes = $self->_footnotes();
    #$result .= $footnotes;
  } else {
    foreach my $element (@$elements) {
      my $element_text = $self->_convert_element($element);
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

  # Do that before the other elements, to be sure that special page ids
  # are registered before elements id are.
  my ($special_elements, $special_pages) = $self->_prepare_special_elements();

  # This should return undef if called on a tree without node or sections.
  my $elements = $self->_prepare_elements($root);

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

  # do element directions.  FIXME do it here or before?  Here it means that
  # PrevFile and NextFile can be set.
  Texinfo::Structuring::element_directions($self, $elements);

  # associate the special elements that have no page to the main page.
  # This may only happen if not split.
  if ($special_elements) {
    foreach my $special_element (@$special_elements) {
      my $previous_element = $pages->[0]->{'contents'}->[-1];
      if (!defined($special_element->{'parent'})) {
        $special_element->{'parent'} = $pages->[0];
        $special_element->{'element_prev'} = $pages->[0]->{'contents'}->[-1];
        $pages->[0]->{'contents'}->[-1]->{'element_next'} = $special_element;
        push @{$pages->[0]->{'contents'}}, $special_element;
      }
    }
  }

  # FIXME Before that, set multiple commands
  # FIXME set language and documentencoding/encoding_name

  # FIXME determine index entries id/targets and set them as 'ids' and 
  # 'targets'. texi2html.pl l. 7807
  $self->_prepare_index_entries();


  # TODO Top, Index, First, Last.

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
      $self->{'simpletitle_tree'} = {'contents' => $command->{'misc_content'}};
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
        my $element_text = $self->_convert_element($element);
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
    
    foreach my $page (@$pages) {
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
        my $element_text = $self->_convert_element($element);
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

sub _contents($$$)
{
  my $self = shift;
  my $section_root = shift;
  my $contents_or_shortcontents = shift;

  my $contents = 1 if ($contents_or_shortcontents eq 'contents');

  #my $section = $section_root->{'section_childs'}->[0];
  my $root_level = $section_root->{'section_childs'}->[0]->{'level'};
  foreach my $top_section(@{$section_root->{'section_childs'}}) {
    $root_level = $top_section->{'level'} 
      if ($top_section->{'level'} < $root_level);
  }

  my $result = '';
  # This is done like that because the tree may not be well formed if
  # there is a @part after a @chapter for example.
  foreach my $top_section (@{$section_root->{'section_childs'}}) {
    my $section = $top_section;
 SECTION:
    while ($section) {
      my $section_title = $self->_convert({'contents'
                => $section->{'extra'}->{'misc_content'},
               'type' => 'frenchspacing'});
      
      my $text = numbered_heading($section, 
                       $section_title, $self->get_conf('NUMBER_SECTIONS'))."\n";
      # FIXME get ref.
      # FIXME do li
      $result .= (' ' x (2*($section->{'level'} - ($root_level+1)))) . $text;
      if ($section->{'section_childs'} 
          and ($contents or $section->{'level'} < $root_level+1)) {
        # FIXME do ul
        $section = $section->{'section_childs'}->[0];
      } elsif ($section->{'section_next'}) {
        last if ($section eq $top_section);
        $section = $section->{'section_next'};
      } else {
        last if ($section eq $top_section);
        while ($section->{'section_up'}) {
          # FIXME close ul
          $section = $section->{'section_up'};
          last SECTION if ($section eq $top_section);
          if ($section->{'section_next'}) {
            $section = $section->{'section_next'};
            last;
          }
        }
      }
    }
  }
  return $result;
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

# no error in plaintext
sub _error_outside_of_any_node($$)
{
  my $self = shift;
  my $root = shift;
}

sub _anchor($$)
{
  my $self = shift;
  my $anchor = shift;

  if (!($self->{'multiple_pass'} or $self->{'in_copying_header'})) {
    $self->_add_location($anchor); 
    $self->_error_outside_of_any_node($anchor);
  }
  return '';
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
      my $lines_count = ($result =~ tr/\n/\n/);
      return ($result, $lines_count);
    }
  }
  return ('', 0);
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

  if (($root->{'type'}
        and exists ($self->{'types_conversion'}->{$root->{'type'}})
        and !defined($self->{'types_conversion'}->{$root->{'type'}}))
       or ($root->{'cmdname'}
            and exists($self->{'commands_conversion'}->{$root->{'cmdname'}})
            and !defined($self->{'commands_conversion'}->{$root->{'cmdname'}}))) {
    print STDERR "IGNORED\n" if ($self->get_conf('DEBUG'));
    return '';
  }

  # process text
  if (defined($root->{'text'})) {
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

  # FIXME here process only real index entries
  if ($root->{'extra'} and $root->{'extra'}->{'index_entry'}) {
      #and !$self->{'multiple_pass'} and !$self->{'in_copying_header'}) {
    # special case for index entry not associated with a node but seen. 
    # this will be an index entry in @copying, in @insertcopying.
#    if (!$root->{'extra'}->{'index_entry'}->{'node'} and $self->{'node'}) {
#      $location->{'node'} = $self->{'node'};
#    }
#    $self->{'index_entries_line_location'}->{$root} = $location;
#    print STDERR "INDEX ENTRY lines_count $location->{'lines'}, index_entry $location->{'index_entry'}\n" 
#       if ($self->get_conf('DEBUG'));
  }


  # TODO special: center, footnote, menu?
  my $cell;
  my $preformatted;
  # commands like @deffnx have both a cmdname and a def_line type.  It is
  # better to consider them as a def_line type, as the whole point of the
  # def_line type is to handle the same the def*x and def* line formatting. 
  if ($root->{'cmdname'} 
      and !($root->{'type'} and $root->{'type'} eq 'def_line')) {
    # FIXME definfoenclose_command 
    # ($root->{'type'} and $root->{'type'} eq 'definfoenclose_command'))
    if (exists($self->{'commands_conversion'}->{$root->{'cmdname'}})) {
      my $result;
      my $content_formatted;
      if (exists($format_context_commands{$root->{'cmdname'}})) {
        push @{$self->{'context'}}, {'cmdname' => $root->{'cmdname'},
                                     'align' => ['raggedright']};
      }
      if (exists($block_commands{$root->{'cmdname'}})) {
        push @{$self->{'formats'}}, $root->{'cmdname'};
      }
      if ($preformatted_commands{$root->{'cmdname'}}) {
        $self->{'context'}->[-1]->{'preformatted'}++;
      }
      if ($code_style_commands{$root->{'cmdname'}} or 
          $preformatted_code_commands{$root->{'cmdname'}}) {
        $self->{'context'}->[-1]->{'code'}++;
      } elsif ($upper_case_commands{$root->{'cmdname'}}) {
        $self->{'context'}->[-1]->{'upper_case'}++;
      } elsif ($root->{'cmdname'} eq 'math') {
        $self->{'context'}->[-1]->{'math'}++;
      } elsif ($root->{'cmdname'} eq 'w') {
        $self->{'context'}->[-1]->{'space_protected'}++;
      } elsif ($align_commands{$root->{'cmdname'}}) {
        push @{$self->{'context'}->[-1]->{'align'}}, $root->{'cmdname'};
      }
      if ($root->{'contents'}) {
        $content_formatted = '';
        # TODO different types of contents
        foreach my $content (@{$root->{'contents'}}) {
          $content_formatted .= $self->_convert($content);
        }
      }
      my $args_formatted;
      if ($brace_commands{$root->{'cmdname'}} 
          or ($misc_commands{$root->{'cmdname'}} 
              and $misc_commands{$root->{'cmdname'}} eq 'line')
          or ($root->{'cmdname'} eq 'quotation' 
              or $root->{'cmdname'} eq 'smallquotation')
              or ($root->{'cmdname'} eq 'float')) {
        $args_formatted = [];
        if ($root->{'args'}) {
          my @args_specification;
          @args_specification = @{$self->{'commands_args'}->{$root->{'cmdname'}}}
            if (defined($self->{'commands_args'}->{$root->{'cmdname'}}));
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
              }
            }
            
            push @$args_formatted, $arg_formatted;
          }
        }
        $result = &{$self->{'commands_conversion'}->{$root->{'cmdname'}}}($self,
                $root->{'cmdname'}, $root, $args_formatted, $content_formatted);
      } else {
        $result = &{$self->{'commands_conversion'}->{$root->{'cmdname'}}}($self,
                $root->{'cmdname'}, $root, $content_formatted);
      }
      if ($preformatted_commands{$root->{'cmdname'}}) {
        $self->{'context'}->[-1]->{'preformatted'}--;
      }
      if ($code_style_commands{$root->{'cmdname'}} or 
          $preformatted_code_commands{$root->{'cmdname'}}) {
        $self->{'context'}->[-1]->{'code'}--;
      } elsif ($upper_case_commands{$root->{'cmdname'}}) {
        $self->{'context'}->[-1]->{'upper_case'}--;
      } elsif ($root->{'cmdname'} eq 'math') {
        $self->{'context'}->[-1]->{'math'}--;
      } elsif ($root->{'cmdname'} eq 'w') {
        $self->{'context'}->[-1]->{'space_protected'}--;
      } elsif ($align_commands{$root->{'cmdname'}}) {
        pop @{$self->{'context'}->[-1]->{'align'}};
      }
      if (exists($block_commands{$root->{'cmdname'}})) {
        pop @{$self->{'formats'}};
      }
      if (exists($format_context_commands{$root->{'cmdname'}})) {
        pop @{$self->{'context'}};
      }
      return $result;
    } else {
      print STDERR "BUG: unknown command `$root->{'cmdname'}'\n";
    }
  } elsif ($root->{'type'}) {
    if ($root->{'type'} eq 'paragraph') {
      $self->{'context'}->[-1]->{'paragraph_number'}++;
    } elsif ($root->{'type'} eq '_code') {
      $self->{'context'}->[-1]->{'code'}++;
    } elsif ($root->{'type'} eq '_string') {
      $self->{'context'}->[-1]->{'string'}++;
    }
    my $content_formatted;
    if ($root->{'contents'}) {
      $content_formatted = '';
      # TODO different types of contents
      foreach my $content (@{$root->{'contents'}}) {
        $content_formatted .= $self->_convert($content);
      }
    }
    my $result;
    if (exists($self->{'types_conversion'}->{$root->{'type'}})) {
      $result = &{$self->{'types_conversion'}->{$root->{'type'}}} ($self,
                                                 $root->{'type'},
                                                 $root,
                                                 $content_formatted);
    } elsif (defined($content_formatted)) {
      $result = $content_formatted;
    }
    if ($root->{'type'} eq '_code') {
      $self->{'context'}->[-1]->{'code'}--;
    } elsif ($root->{'type'} eq '_string') {
      $self->{'context'}->[-1]->{'string'}--;
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
 #   } elsif ($root->{'cmdname'} eq 'verbatiminclude') {
 #     my $expansion = $self->Texinfo::Parser::expand_verbatiminclude($root);
 #     unshift @{$self->{'current_contents'}->[-1]}, $expansion
 #       if ($expansion);
 #     return '';
#    } elsif ($root->{'cmdname'} eq 'insertcopying') {
#      if ($self->{'extra'} and $self->{'extra'}->{'copying'}) {
#        unshift @{$self->{'current_contents'}->[-1]}, 
#           {'contents' => $self->{'extra'}->{'copying'}->{'contents'}};
#      }
#      return '';
#    } elsif ($root->{'cmdname'} eq 'printindex') {
#      $result = $self->_printindex($root);
#      return $result;
#    } elsif ($root->{'cmdname'} eq 'listoffloats') {
#    } elsif ($root->{'cmdname'} eq 'sp') {
#    } elsif ($root->{'cmdname'} eq 'contents') {
#    } elsif ($root->{'cmdname'} eq 'shortcontents' 
#               or $root->{'cmdname'} eq 'summarycontents') {
#    } elsif ($informative_commands{$root->{'cmdname'}}) {
#      $self->_informative_command($root);

# TODO types
#    } elsif ($root->{'type'} eq 'preformatted') {
#    } elsif ($root->{'type'} eq 'def_line') {
#    } elsif ($root->{'type'} eq 'menu_entry') {
#    } elsif ($root->{'type'} eq 'code') {
 # TODO ?
 #   } elsif ($root->{'type'} eq 'bracketed') {

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
