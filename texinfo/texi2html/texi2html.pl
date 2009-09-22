#! @PERL@ --
# perl
'di ';
'ig 00 ';
#+##############################################################################
#
# texi2html: Program to transform Texinfo documents to HTML
#
#    Copyright (C) 1999-2005  Patrice Dumas <dumas@centre-cired.fr>,
#                             Derek Price <derek@ximbiot.com>,
#                             Adrian Aichner <adrian@xemacs.org>,
#                           & others.
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
#    02110-1301  USA
#
#-##############################################################################
# The man page for this program is included at the end of this file and can be
# viewed using the command 'nroff -man texi2html'.

# for POSIX::setlocale and File::Spec
require 5.00405;
# Perl pragma to restrict unsafe constructs
use strict;
# used in case of tests, to revert to "C" locale.
use POSIX qw(setlocale LC_ALL LC_CTYPE);
# used to obtain the name of the current working directory
use Cwd;
# Used to find the parent directory of this script.
use File::Basename;
# used to find a relative path back to the current working directory
use File::Spec;
# to determine the path separator and null file
use Config;

#use encoding::warnings;
# for translations
#use encoding 'utf8';
#use utf8;

#
# According to
# larry.jones@sdrc.com (Larry Jones)
# this pragma is not present in perl5.004_02:
#
# Perl pragma to control optional warnings
# use warnings;

# determine the path separators
my $path_separator = $Config{'path_sep'};
$path_separator = ':' if (!defined($path_separator));
my $quoted_path_separator = quotemeta($path_separator);

#++##########################################################################
#
# NOTE FOR DEBUGGING THIS SCRIPT:
# You can run 'perl texi2html.pl' directly, provided you have the script
# in the same directory with, or the environment variable T2H_HOME set to
# the directory containing, the texi2html.init, T2h_i18n.pm, translations.pl,
# l2h.init, & T2h_l2h.pm files
#
#--##########################################################################
my $T2H_HOME = defined $ENV{T2H_HOME} ? $ENV{T2H_HOME} : dirname $0;
if ($0 =~ /\.pl$/)
{
    # Issue a warning in debugging mode if $T2H_HOME is set but isn't
    # accessible.
    if (!-e $T2H_HOME)
    { warn "T2H_HOME ($T2H_HOME) does not exist."; }
    elsif (!-d $T2H_HOME)
    { warn "T2H_HOME ($T2H_HOME) is not a directory."; }
    elsif (!-x $T2H_HOME)
    { warn "T2H_HOME ($T2H_HOME) is not accessible."; }
}

# CVS version:
# $Id: texi2html.pl,v 1.339 2009-09-22 20:22:24 pertusus Exp $

# Homepage:
my $T2H_HOMEPAGE = "http://www.nongnu.org/texi2html/";

# Authors (appears in comments):
my $T2H_AUTHORS = <<EOT;
texi2html was written by: 
            Lionel Cons <Lionel.Cons\@cern.ch> (original author)
            Karl Berry  <karl\@freefriends.org>
            Olaf Bachmann <obachman\@mathematik.uni-kl.de>
            and many others.
Maintained by: Many creative people.
Send bugs and suggestions to <texi2html-bug\@nongnu.org>
EOT

# Version: set in configure.in
my $THISVERSION = '@PACKAGE_VERSION@';
my $THISPROG = "texi2html $THISVERSION"; # program name and version

#+++########################################################################
#                                                                          #
# Paths and file names                                                     #
#                                                                          #
#---########################################################################

# set by configure, prefix for the sysconfdir and so on
my $prefix = '@prefix@';
my $datarootdir = '@datarootdir@';
my $sysconfdir;
my $pkgdatadir;
my $datadir;

# We need to eval as $prefix has to be expanded. However when we haven't
# run configure @sysconfdir will be expanded as an array, thus we verify
# whether configure was run or not
if ('@sysconfdir@' ne '@' . 'sysconfdir@')
{
    $sysconfdir = eval '"@sysconfdir@"';
}
else
{
    $sysconfdir = "/usr/local/etc";
}

if ('@datadir@' ne '@' . 'datadir@')
{
    $pkgdatadir = eval '"@datadir@/@PACKAGE@"';
    $datadir = eval '"@datadir@"';
}
else
{
    $pkgdatadir = "/usr/local/share/texi2html";
    $datadir = "/usr/local/share";
}

my $i18n_dir = 'i18n'; # name of the directory containing the per language files
my $conf_file_name = 'Config' ;
my $texinfo_htmlxref = 'htmlxref.cnf';

my $target_prefix = "t_h";

# directories for texi2html init files
my @texi2html_config_dirs = ('./');
push @texi2html_config_dirs, "$ENV{'HOME'}/.texi2html/" if (defined($ENV{'HOME'}));
push @texi2html_config_dirs, "$sysconfdir/texi2html/" if (defined($sysconfdir));
push @texi2html_config_dirs, "$pkgdatadir" if (defined($pkgdatadir));

# directories for texinfo configuration files
my @texinfo_config_dirs = ('./.texinfo/');
push @texinfo_config_dirs, "$ENV{'HOME'}/.texinfo/" if (defined($ENV{'HOME'}));
push @texinfo_config_dirs, "$sysconfdir/texinfo/" if (defined($sysconfdir));
push @texinfo_config_dirs, "$datadir/texinfo/" if (defined($datadir));


#+++########################################################################
#                                                                          #
# Constants                                                                #
#                                                                          #
#---########################################################################

my $DEBUG_MENU   =  1;
my $DEBUG_INDEX =  2;
my $DEBUG_TEXI  =  4;
my $DEBUG_MACROS =  8;
my $DEBUG_FORMATS   = 16;
my $DEBUG_ELEMENTS  = 32;
my $DEBUG_USER  = 64;
my $DEBUG_L2H   = 128;

my $VARRE = '[\w\-]+';          # RE for a variable name

my $MAX_LEVEL = 4;
my $MIN_LEVEL = 1;

#+++########################################################################
#                                                                          #
# Command name and default format                                          #
#                                                                          #
#---########################################################################

my $my_command_name = $0;
$my_command_name =~ s/.*\///;
$my_command_name =~ s/\.pl$//;

my $default_output_format;

my %command_format = (
 'texi2html' => 'html',
 'makeinfo' => 'info',
);

if ($command_format{$my_command_name})
{
   $default_output_format = $command_format{$my_command_name};
}

# This can be called from init files, mostly for formats.
sub default_output_format()
{
   return $default_output_format;
}

sub default_command_name()
{
   return $my_command_name;
}

#+++###########################################################################
#                                                                             #
# Initialization                                                              #
# Some declarations, some functions that are GPL and therefore cannot be in   #
# texi2html.init, some functions that are not to be customized.               #
# Pasted content of File $(srcdir)/texi2html.init: Default initializations    #
#                                                                             #
#---###########################################################################
{
package Texi2HTML::Config;

use Config;

# customization options variables

use vars qw(
$DEBUG
$PREFIX
$VERBOSE
$SUBDIR
$IDX_SUMMARY
$SPLIT
$SPLIT_SIZE
$SHORT_REF
@EXPAND
$EXPAND
$TOP
$DOCTYPE 
$FRAMESET_DOCTYPE 
$ERROR_LIMIT
$CHECK 
$TEST 
$DUMP_TEXI
$MACRO_EXPAND
$USE_GLOSSARY 
$INVISIBLE_MARK 
$CAPTION_STYLE
$USE_ISO 
$TOP_FILE 
$TOC_FILE
$FRAMES
$SHOW_MENU
$NUMBER_SECTIONS
$NUMBER_FOOTNOTES
$USE_NODES
$USE_SECTIONS
$USE_NODE_TARGET
$USE_UNICODE
$USE_UNIDECODE
$TRANSLITERATE_FILE_NAMES
$NODE_FILES
$NODE_FILENAMES
$NODE_NAME_IN_MENU
$NODE_NAME_IN_INDEX
$AVOID_MENU_REDUNDANCY
$HEADERS
$NO_WARN
$FORCE
$MONOLITHIC
$SHORTEXTN 
$EXTENSION
$OUT 
$NOVALIDATE
$DEF_TABLE 
$DOCUMENTLANGUAGE 
$CONTENTS
$SHORTCONTENTS
$FOOTNOTESTYLE
$FILLCOLUMN
$SETCONTENTSAFTERTITLEPAGE
$SETSHORTCONTENTSAFTERTITLEPAGE
$KBDINPUTSTYLE
$FRENCHSPACING
$SETFILENAME
$TOC_LINKS
$L2H 
$L2H_L2H 
$L2H_SKIP 
$L2H_TMP 
$L2H_CLEAN 
$L2H_FILE
$L2H_HTML_VERSION
$EXTERNAL_DIR
@INCLUDE_DIRS 
@PREPEND_DIRS 
@CONF_DIRS 
$IGNORE_PREAMBLE_TEXT
@CSS_FILES
@CSS_REFS
$INLINE_CONTENTS
$INLINE_INSERTCOPYING
$PARAGRAPHINDENT
$FIRSTPARAGRAPHINDENT
$ENABLE_ENCODING
$INTERNAL_LINKS
$DEFAULT_OUTPUT_FORMAT
$OUTPUT_FORMAT
$COMMAND_NAME
@COMMANDS
);

# customization variables
# ENCODING is deprecated
use vars qw(
$ENCODING

$ENCODING_NAME
$DOCUMENT_ENCODING
$OUT_ENCODING
$IN_ENCODING
$DEFAULT_ENCODING
$MENU_PRE_STYLE
$MENU_PRE_COMPLEX_FORMAT
$CENTER_IMAGE
$EXAMPLE_INDENT_CELL
$SMALL_EXAMPLE_INDENT_CELL
$SMALL_FONT_SIZE
$SMALL_RULE
$DEFAULT_RULE
$MIDDLE_RULE
$BIG_RULE
$TOP_HEADING
$INDEX_CHAPTER
$SPLIT_INDEX
$HREF_DIR_INSTEAD_FILE
$USE_MENU_DIRECTIONS
$USE_UP_FOR_ADJACENT_NODES
$AFTER_BODY_OPEN
$PRE_BODY_CLOSE
$EXTRA_HEAD
$VERTICAL_HEAD_NAVIGATION
$WORDS_IN_PAGE
$ICONS
$UNNUMBERED_SYMBOL_IN_MENU
$SIMPLE_MENU
$MENU_SYMBOL
$USE_ACCESSKEY
$USE_REL_REV
$USE_LINKS
$OPEN_QUOTE_SYMBOL
$CLOSE_QUOTE_SYMBOL
$NO_NUMBER_FOOTNOTE_SYMBOL
$NO_BULLET_LIST_STYLE
$NO_BULLET_LIST_ATTRIBUTE
$NO_BULLET_LIST_CLASS
$TOP_NODE_FILE
$TOP_NODE_FILE_TARGET
$TOP_NODE_UP
$NODE_FILE_EXTENSION
$STDIN_DOCU_NAME
$STDOUT_DOCU_NAME
$BEFORE_OVERVIEW
$AFTER_OVERVIEW
$BEFORE_TOC_LINES
$AFTER_TOC_LINES
$NEW_CROSSREF_STYLE
$TOP_HEADING_AT_BEGINNING
$USE_NUMERIC_ENTITY
$USE_SETFILENAME
$USE_SETFILENAME_EXTENSION
$SEPARATE_DESCRIPTION
$IGNORE_BEFORE_SETFILENAME
$OVERVIEW_LINK_TO_TOC
$COMPLETE_IMAGE_PATHS
$DATE
%ACTIVE_ICONS
%NAVIGATION_TEXT
%PASSIVE_ICONS
%BUTTONS_NAME
%BUTTONS_GOTO
%BUTTONS_EXAMPLE
%BUTTONS_ACCESSKEY
%BUTTONS_REL
%BUTTONS_TEXT
@T2H_FORMAT_EXPAND
@CHAPTER_BUTTONS
@MISC_BUTTONS
@SECTION_BUTTONS
@SECTION_FOOTER_BUTTONS
@NODE_FOOTER_BUTTONS
@TOP_BUTTONS
@LINKS_BUTTONS
@IMAGE_EXTENSIONS
@INPUT_FILE_SUFFIXES
$ENABLE_ENCODING_USE_ENTITY
$PROGRAM_NAME_IN_FOOTER
$HEADER_IN_TABLE
$USE_TITLEPAGE_FOR_TITLE
);

# customization variables which may be guessed in the script
#our $ADDRESS;
use vars qw(
$BODYTEXT
$CSS_LINES
$DOCUMENT_DESCRIPTION
$EXTERNAL_CROSSREF_SPLIT
);

# I18n
use vars qw(
$I
$LANGUAGES
);

# customizable subroutines references
use vars qw(
$print_section
$one_section
$end_section
$print_Top_header
$print_Top_footer
$print_Top
$print_Toc
$print_Overview
$print_Footnotes
$print_About
$print_misc_header
$print_misc_footer
$print_misc
$print_section_header
$print_section_footer
$print_chapter_header
$print_chapter_footer
$print_element_header
$print_page_head
$print_page_foot
$print_head_navigation
$print_foot_navigation
$print_title
$button_icon_img
$button_formatting
$print_navigation
$about_body
$print_frame
$print_toc_frame
$toc_body
$contents
$internal_links
$shortcontents
$titlepage
$insertcopying
$css_lines
$print_redirection_page
$translate_names
$init_out
$finish_out
$node_file_name
$element_file_name
$node_target_name
$element_target_name
$placed_target_file_name
$inline_contents
$program_string

$preserve_misc_command
$misc_command_line
$misc_command_line_texi
$protect_text
$anchor
$anchor_label
$element_label
$misc_element_label
$def_item
$def
$menu
$menu_command
$menu_link
$menu_description
$menu_comment
$simple_menu_link
$ref_beginning
$info_ref
$book_ref
$external_href
$external_ref
$internal_ref
$table_item
$table_line
$row
$cell
$list_item
$comment
$def_line
$def_line_no_texi
$heading_no_texi
$raw
$raw_no_texi
$heading
$element_heading
$paragraph
$preformatted
$empty_preformatted
$foot_line_and_ref
$foot_section
$address
$image
$image_files
$index_entry_label
$index_entry
$index_entry_command
$index_letter
$print_index
$printindex
$index_summary
$summary_letter
$complex_format
$cartouche
$sp
$definition_category
$definition_index_entry
$table_list
$copying_comment
$documentdescription
$index_summary_file_entry
$index_summary_file_end
$index_summary_file_begin
$style
$line_command
$format
$normal_text
$empty_line
$unknown
$unknown_style
$float
$caption_shortcaption
$caption_shortcaption_command
$listoffloats
$listoffloats_entry
$listoffloats_caption
$listoffloats_float_style
$listoffloats_style
$acronym_like
$quotation
$quotation_prepend_text
$paragraph_style_command
$heading_texi
$index_element_heading_texi
$format_list_item_texi
$begin_format_texi
$begin_style_texi
$begin_paragraph_texi
$tab_item_texi
$footnote_texi
$colon_command
$simple_command
$thing_command
$begin_special_region
$end_special_region

$PRE_ABOUT
$AFTER_ABOUT
);

# hash which entries might be redefined by the user
use vars qw(
$complex_format_map
%accent_map
%def_map
%format_map
%simple_map
%simple_map_pre
%simple_map_texi
%simple_map_math
%simple_map_pre_math
%simple_map_texi_math
%style_map
%style_map_pre
%style_map_texi
%simple_format_simple_map_texi
%simple_format_style_map_texi
%simple_format_texi_map
%line_command_map
%command_type
%paragraph_style
%stop_paragraph_command
%format_code_style
%region_formats_kept
%texi_formats_map
%things_map
%pre_map
%texi_map
%unicode_map
%unicode_diacritical
%transliterate_map 
%transliterate_accent_map
%no_transliterate_map
%ascii_character_map
%default_simple_map
%default_things_map
%default_texi_map
%default_style_map
%default_style_map_pre
%default_style_map_texi
%default_simple_format_style_map_texi
%numeric_entity_map
%perl_charset_to_html
%misc_pages_targets
%iso_symbols
%misc_command
%no_paragraph_commands
%css_map
%format_in_paragraph
%special_list_commands
%accent_letters
%unicode_accents
%special_accents
%inter_item_commands
$def_always_delimiters
$def_in_type_delimiters
$def_argument_separator_delimiters
%colon_command_punctuation_characters
$punctuation_characters
$after_punctuation_characters
@command_handler_init
@command_handler_process
@command_handler_output
@command_handler_finish
%command_handler
%special_style
%null_device_file
%language_codes
%region_codes
%deprecated_commands
%output_format_names
%canonical_texinfo_encodings
);

# subject to change
use vars qw(
%makeinfo_encoding_to_map
%makeinfo_unicode_to_eight_bit
%eight_bit_to_unicode
%t2h_encoding_aliases
);

# FIXME i18n ?
%output_format_names = (
  'info' => 'Info',
  'html' => 'HTML',
  'docbook' => 'Docbook XML',
  'xml' => 'Texinfo XML',
  'plaintext' => 'plain text',
);

sub load($) 
{
    my $file = shift;
    # If required like other init files, the functions would be redefined
    # and the format dependent stuff wouldn't be loaded. Having the 
    # formats loaded could be worked around, for example there could be
    # a variable that, and if the variable is defined a function reference
    # should be called right after the require. There is no real 
    # workaround for having the function redefined, though.
    foreach my $output_format (keys(%output_format_names))
    {
      if ($file =~ /\/$output_format\.init$/)
      {
         t2h_default_load_format($output_format, 1);
         return 1;
      }
    }
    eval { require($file) ;};
    if ($@ ne '')
    {
        print STDERR "error loading $file: $@\n";
        return 0;
    }
    return 1;
}

$DEFAULT_OUTPUT_FORMAT = main::default_output_format();
$OUTPUT_FORMAT = $DEFAULT_OUTPUT_FORMAT;
$COMMAND_NAME = main::default_command_name();

sub set_conf($$;$)
{
    my $name = shift;
    my $value = shift;
    my $not_global = shift;

    unless ($not_global)
    {
       if (defined($value))
       {
          $Texi2HTML::GLOBAL{$name} = $value;
       }
       else
       {
          delete $Texi2HTML::GLOBAL{$name};
       }
       return 1;
    }
    return 0 if (defined($Texi2HTML::GLOBAL{$name}));
    if (defined($value))
    {
       $Texi2HTML::THISDOC{$name} = $value;
    }
    else
    {
       delete $Texi2HTML::THISDOC{$name};
    }
    return 1;
}

my %config_map = (
   'paragraphindent' => \$PARAGRAPHINDENT,
   'firstparagraphindent' => \$FIRSTPARAGRAPHINDENT,
   'footnotestyle' => \$FOOTNOTESTYLE,
   'fillcolumn' => \$FILLCOLUMN,
   'documentlanguage' => \$DOCUMENTLANGUAGE,
   'novalidate' => \$NOVALIDATE,
   'SPLIT' => \$SPLIT,
   'SPLIT_SIZE' => \$SPLIT_SIZE,
   'contents' => \$CONTENTS,
   'shortcontents' => \$SHORTCONTENTS,
   'doctype' => \$DOCTYPE,
   'headers' => \$HEADERS,
   'DOCUMENT_ENCODING' => \$DOCUMENT_ENCODING,
   'IN_ENCODING' => \$IN_ENCODING,
   'setcontentsaftertitlepage' => \$SETCONTENTSAFTERTITLEPAGE,
   'setshortcontentsaftertitlepage'  => \$SETSHORTCONTENTSAFTERTITLEPAGE,
   'kbdinputstyle' => \$KBDINPUTSTYLE,
   'frenchspacing' => \$FRENCHSPACING,
   'setfilename' => \$SETFILENAME,
);

sub get_conf($)
{
    my $name = shift;
    return $Texi2HTML::THISDOC{$name} if (defined($Texi2HTML::THISDOC{$name}));
    return ${$config_map{$name}} if (defined($config_map{$name}));
    # there is no default value for many @-commmands, like headings....
    #print STDERR "Unknown conf string: $name\n";
}

# manage expanded sections
sub set_expansion($$)
{
    my $region = shift;
    my $set = shift;
    $set = 1 if (!defined($set));
    if ($set)
    {
         push (@EXPAND, $region) unless (grep {$_ eq $region} @EXPAND);
    }
    else
    {
         @EXPAND = grep {$_ ne $region} @EXPAND;
         @T2H_FORMAT_EXPAND = grep {$_ ne $region} @T2H_FORMAT_EXPAND;
    }
}

# needed in this namespace for translations
$I = \&Texi2HTML::I18n::get_string;

#
# Function refs covered by the GPL as part of the texi2html.pl original
# code. As such they cannot appear in texi2html.init which is public 
# domain (at least the things coded by me, and, if I'm not wrong also the 
# things coded by Olaf -- Pat).
#

sub HTML_DEFAULT_shortcontents($$)
{
    my $elements_list = shift;
    my $stoc_file = shift;
    return unless (Texi2HTML::Config::get_conf('shortcontents') or $FRAMES);
    my $ul_style = $NUMBER_SECTIONS ? $NO_BULLET_LIST_ATTRIBUTE : ''; 
    my @result = ();
    foreach my $element (@$elements_list)
    {
        next if ($element->{'tag'} eq 'top' or $element->{'toc_level'} != 1);
        my $dest_for_stoc = $element->{'file'};
        my $dest_target_for_stoc = $element->{'target'};
        if ($Texi2HTML::Config::OVERVIEW_LINK_TO_TOC)
        {
            $dest_for_stoc = $Texi2HTML::THISDOC{'toc_file'};
            $dest_target_for_stoc = $element->{'tocid'};
        }
        $dest_for_stoc = '' if ($dest_for_stoc eq $stoc_file);
        my $text = $element->{'text'};
        my $stoc_entry = "<li>" . &$anchor ($element->{'stocid'}, "$dest_for_stoc#$dest_target_for_stoc",$text);
        push(@result, $stoc_entry. "</li>\n");
    }
    if (@result)
    {
        unshift @result, "<ul${ul_style}>\n";
        push @result, "</ul>\n";
        unshift @result, $BEFORE_OVERVIEW;
        push @result, $AFTER_OVERVIEW;
    }
    return \@result;
}


sub HTML_DEFAULT_contents($$)
{
    my $elements_list = shift;
    my $toc_file = shift;

    return unless (Texi2HTML::Config::get_conf('contents'));

    my $current_level = 0;
    my $ul_style = $NUMBER_SECTIONS ? $NO_BULLET_LIST_ATTRIBUTE : '';
    my @result = ();
    foreach my $element (@$elements_list)
    {
        next if ($element->{'tag'} eq 'top');
        my $ind = '  ' x $current_level;
        my $level = $element->{'toc_level'};
        print STDERR "Bug no toc_level for ($element) $element->{'texi'}\n" if (!defined ($level));
        if ($level > $current_level)
        {
            while ($level > $current_level)
            {
                $current_level++;
                my $ln = "\n$ind<ul${ul_style}>\n";
                $ind = '  ' x $current_level;
                push(@result, $ln);
            }
        }
        elsif ($level < $current_level)
        {
            while ($level < $current_level)
            {
                $current_level--;
                $ind = '  ' x $current_level;
                my $line = "</li>\n$ind</ul>";
                $line .=  "</li>" if ($level == $current_level);
                push(@result, "$line\n");
            }
        }
        else
        {
            push(@result, "</li>\n");
        }
        my $dest_for_toc = $element->{'file'};
        my $dest_for_stoc = $element->{'file'};
        my $dest_target_for_stoc = $element->{'target'};
        $dest_for_toc = '' if ($dest_for_toc eq $toc_file);
        my $text = $element->{'text'};
        my $toc_entry = "<li>" . &$anchor ($element->{'tocid'}, "$dest_for_toc#$element->{'target'}",$text);
        push (@result, $ind . $toc_entry);
    }
    while (0 < $current_level)
    {
        $current_level--;
        my $ind = '  ' x $current_level;
        push(@result, "</li>\n$ind</ul>\n");
    }
    if (@result)
    {
        unshift @result, $BEFORE_TOC_LINES;
        push @result, $AFTER_TOC_LINES;
    }
    return \@result;
}

#$toc_body                 = \&T2H_GPL_toc_body;
#$style                    = \&T2H_GPL_style;
#$format                   = \&T2H_GPL_format;
#$printindex               = \&t2h_GPL_default_printindex;
#$summary_letter           = \&t2h_default_summary_letter;


sub T2H_GPL_style($$$$$$$$$$)
{                           # known style
    my $style = shift;
    my $command = shift;
    my $text = shift;
    my $args = shift;
    my $no_close = shift;
    my $no_open = shift;
    my $line_nr = shift;
    my $state = shift;
    my $style_stack = shift;
    my $kept_line_nrs = shift;

    my $do_quotes = 0;
    my $use_attribute = 0;
    my $use_begin_end = 0;
    if (ref($style) eq 'HASH')
    {
        #print STDERR "GPL_STYLE $command ($style)\n";
        #print STDERR " @$args\n";
        if (ref($style->{'args'}) ne 'ARRAY')
        {
            print STDERR "BUG: args not an array for command `$command'\n";
        }
        $do_quotes = $style->{'quote'};
        if ((@{$style->{'args'}} == 1) and defined($style->{'attribute'}))
        {
            $style = $style->{'attribute'};
            $use_attribute = 1;
            $text = $args->[0];
        }
        elsif (defined($style->{'function'}))
        {
            $text = &{$style->{'function'}}($command, $args, $style_stack, $state, $line_nr, $kept_line_nrs);
        }
    }
    else
    {
        if ($style =~ s/^\"//)
        {                       # add quotes
            $do_quotes = 1;
        }
        if ($style =~ s/^\&//)
        {                       # custom
            $style = 'Texi2HTML::Config::' . $style;
            eval "\$text = &$style(\$text, \$command, \$style_stack)";
        }
        elsif ($style ne '')
        {
            $use_attribute = 1;
        }
        else
        {                       # no style
        }
    }
    if ($use_attribute)
    {                       # good style
        my $attribute_text = '';
        if ($style =~ /^(\w+)(\s+.*)/)
        {
            $style = $1;
            $attribute_text = $2;
        }
#        $text = "<${style}$attribute_text>$text</$style>" ;
        $text = "<${style}$attribute_text>" . "$text" if (!$no_open);
        $text .= "</$style>" if (!$no_close);
        if ($do_quotes)
        {
             $text = $OPEN_QUOTE_SYMBOL . "$text" if (!$no_open);
             $text .= $CLOSE_QUOTE_SYMBOL if (!$no_close);
        }
    }
    if (ref($style) eq 'HASH')
    {
        if (defined($style->{'begin'}) and !$no_open)
        {
             $text = $style->{'begin'} . $text;
        }
        if (defined($style->{'end'}) and !$no_close)
        {
            $text = $text . $style->{'end'};
        }
    }
    if ($do_quotes and !$use_attribute)
    {
        $text = $OPEN_QUOTE_SYMBOL . "$text" if (!$no_open);
        $text .= $CLOSE_QUOTE_SYMBOL if (!$no_close);
    }
    return $text;
}

sub T2H_GPL_format($$$)
{
    my $tag = shift;
    my $element = shift;
    my $text = shift;
    return '' if (!defined($element) or ($text !~ /\S/));
    return $text if ($element eq '');
    my $attribute_text = '';
    if ($element =~ /^(\w+)(\s+.*)/)
    {
        $element = $1;
        $attribute_text = $2;
    }
    return "<${element}$attribute_text>\n" . $text. "</$element>\n";
}

# for each index holds the letters split as determined by SPLIT_INDEX.
my %t2h_default_index_letters_array;
# equivalent of doc_nr, but with files (and hence numbers) added when 
# a split index leads to an additional element and a file is created.
my $t2h_default_file_number;
# this is an increasing number to construct the id for each newly
# created index element.
my $t2h_default_index_id_nr;
# this holds the file name associated with an element file, such
# as to follow the splitting coming from the main program, and also use
# the newly generated files.
my %t2h_default_seen_files;
# holds the elements and indices that are split to easily set the
# directions after they are done in the main program.
my $t2h_default_element_split_printindices;

# construct a hash of index names holding the letter grouped how they will
# be split.
sub t2h_default_init_split_indices()
{
    push @command_handler_process, \&t2h_default_index_rearrange_directions;
    %t2h_default_index_letters_array = ();
    %t2h_default_seen_files = ();
    $t2h_default_element_split_printindices = undef;
    $t2h_default_index_id_nr = 0;
    $t2h_default_file_number = 0;

    foreach my $index_name(keys %{$Texi2HTML::THISDOC{'index_letters_array'}})
    {
        my $entries_count = 0;
        my @letters = ();
        foreach my $letter_entry (@{$Texi2HTML::THISDOC{'index_letters_array'}->{$index_name}})
        {
          push @letters, $letter_entry;
          $entries_count += scalar(@{$letter_entry->{'entries'}});
          # Don't split if document is not split
          if (get_conf('SPLIT') and $SPLIT_INDEX and $entries_count >= $SPLIT_INDEX)
          {
            push @{$t2h_default_index_letters_array{$index_name}}, [ @letters ];
            @letters = ();
            $entries_count = 0;
          }
        }
        push @{$t2h_default_index_letters_array{$index_name}}, [ @letters ] if (scalar(@letters));
    }
}

sub t2h_default_associate_index_element($$$$)
{
  my $element = shift;
  my $is_top = shift;
  my $docu_name = shift;
  my $use_node_file = shift;

  my $default_element_file = $element->{'file'};

  # redo the file naming -- the doc_nr part -- in case new elements were 
  # inserted upon index split. But respect the default splitting to keep
  # the elements that are associated with the same file in the same file,
  # or the added file.
  if (!$use_node_file or $t2h_default_seen_files{$default_element_file})
  {
    my $file;
    if ($t2h_default_seen_files{$default_element_file})
    {
      $file = $t2h_default_seen_files{$default_element_file};
    }
    else
    {
      if ($is_top eq 'top')
      { # this is the element_top, so we keep docu_top as associated file.
        # this, in fact, is not necessary since the element_top is never
        # associated with another element, but who knows.
         $t2h_default_seen_files{$default_element_file} = $default_element_file;
      }
      else
      {
        $file = "${docu_name}_$t2h_default_file_number";
        $file .= '.' . $Texi2HTML::THISDOC{'extension'} if
           (defined($Texi2HTML::THISDOC{'extension'}));
        $t2h_default_seen_files{$default_element_file} = $file;
      }
      $t2h_default_file_number++;
    }
    $element->{'file'} = $file if (defined($file));
  }
  
  my $level = $element->{'level'};

  # Even if, without USE_SECTION, output can be split at chapter or 
  # section we don't split indices accordingly. We don't want to add
  # more cases where users want split indices, this was a very difficult
  # to maintain feature from the beginning.
  #$level = $element->{'with_section'}->{'level'} if (!defined($level) and
  #    defined($element->{'with_section'}));

  # if the element is not the level of splitting, then we don't split.
  # also if 'top' is set we don't split since the formatting is different
  # in that case and the result would be quite unpredictable.
  return if ($element->{'top'} or ((get_conf('SPLIT') ne 'node')
      and (!defined($level) or $level > $Texi2HTML::THISDOC{'split_level'})));

  #print STDERR "Doing printindices for $element $element->{'texi'}, file $element->{'file'} (@{$element->{'place'}})\n";


  # iterate over the @places of the element, which includes associated nodes,
  # associated elements, anchors, footnotes, floats, index entries, 
  # printindices (including the element command itself, be it a @node or 
  # a sectionning @-command). 
  # during the iteration, split printindices that needs it, and reassociate
  # other placed elements with files and elements.

  my $current_element = $element;
  my @places = @{$element->{'place'}};
  @{$element->{'place'}} = ();

  foreach my $place (@places)
  {
    my ($printindex, $printindex_to_split, $index_name);

    # determines if the placed thing is a printindex to be split
    if ($place->{'command'} and $place->{'command'} eq 'printindex')
    {
        $printindex = $place;
        $index_name = $printindex->{'name'};
        # ! empty index
        if (exists($t2h_default_index_letters_array{$index_name}) and 
        # split index
         scalar(@{$t2h_default_index_letters_array{$index_name}} > 1)
         # the condition defined($printindex->{'associated_element'} implies 
         # that we don't split printindex before first element, otherwise
         # there will be a need to begin document without a first element 
         # which would be annoying.
         and defined($printindex->{'associated_element'}))
        {
            $printindex_to_split = 1;
        }
    }
        
    # this is a non split printindex or any other placed thing.
    if (!$printindex_to_split)
    {
       push @{$current_element->{'place'}}, $place;
       # don't remodify the original element file, it was set right at the 
       # beginning of the function.
       $place->{'file'} = $current_element->{'file'} if ($place ne $element);
       # the 'element_ref' has to be reset. Otherwise, $place->{'element_ref'}
       # will appear as a new element and trigger closing the file and 
       # opening a new one.
       $place->{'element_ref'} = $current_element if ($place->{'element_ref'} and $current_element ne $element);
       # this resets the element associated with a printindex.
       $place->{'associated_element'} = $current_element if ($place->{'associated_element'} and $current_element ne $element);
       next;
    }

    # now split the index

    my @letter_groups = ();
    my @letters_split = @{$t2h_default_index_letters_array{$index_name}};
    foreach my $letters_split (@letters_split)
    {
        push @letter_groups, {'letters' => [@$letters_split]};
    }

    $letter_groups[0]->{'element'} = $current_element;

    # besides preparing the new elements corresponding with split indices,
    # they are recorded for later directions rearrangements in 
    # t2h_default_index_rearrange_directions.

    # this weird construct is there because the element used as a key is 
    # converted to a string by perl, losing its meaning as a reference, 
    # the reference must be recorded explicitly
    $t2h_default_element_split_printindices->{$element}->{'element'} = $element;
    push @{$t2h_default_element_split_printindices->{$element}->{'printindices'}}, $printindex;
    #print STDERR "Setting $element, $element->{'texi'}, $printindex $printindex->{'name'} as a split element\n";
    foreach my $split_group (@letter_groups)
    {
        my $first_letter = $split_group->{'letters'}->[0]->{'letter'};
        my $last_letter = $split_group->{'letters'}->[-1]->{'letter'};
        if (!$split_group->{'element'})
        { # this is not the first letters group, which is already associated
          # with an element, a new element is done.

          # construct new element name
          my $letters_heading;
          if ($last_letter ne $first_letter)
          {
            $letters_heading = &$normal_text("$first_letter -- $last_letter");
          }
          else
          {
            $letters_heading = &$normal_text("$first_letter");
          }
          my ($name, $simple);
          my $texi = "ADDED ELEMENT $element->{'texi'}: $letters_heading";
          if (!defined($element->{'text'}))
          {
            my $element_heading_texi = &$heading_texi($element->{'tag'}, $element->{'texi'}, $element->{'number'});

            my $heading_texi = &$index_element_heading_texi(
                 $element_heading_texi,
                 $element->{'tag'},
                 $element->{'texi'},
                 $element->{'number'},
                 $first_letter, $last_letter);
            $name = main::substitute_line($heading_texi, "\@$element->{'tag'} index page");
            $simple = main::simple_format(undef,undef,"simple_format \@$element->{'tag'} index page", $heading_texi);
          }
          else
          { # should never happen, at this point 'text' is always undefined.
            $name = "$element->{'text'}: $letters_heading";
            $simple = "$element->{'simple_format'}: $letters_heading";
          }

          #file and id
          my $relative_file = $Texi2HTML::THISDOC{'file_base_name'} . '_' . $t2h_default_file_number;
          $t2h_default_file_number++;
          $relative_file .= '.' . $Texi2HTML::THISDOC{'extension'} if 
             (defined($Texi2HTML::THISDOC{'extension'}));
          my $id = "index_split-$t2h_default_index_id_nr";
          $t2h_default_index_id_nr++;

          my $new_element = { 'file' => $relative_file, 'id' => $id, 'target' => $id, 'text' => $name, 'texi' => $texi, 'seen' => 1, 'simple_format' => $simple };
          # to avoid crashing when in case there is a filename collision.
          main::add_file($new_element->{'file'});

          $split_group->{'element'} = $new_element;
          $current_element = $new_element;
          #print STDERR "Added $new_element->{'file'} for $new_element->{'texi'} ($first_letter:$last_letter)\n";
        }
        else
        { # this is the first index split, it is still associated with the element
          #print STDERR "No file added for ($first_letter:$last_letter)\n";
        }
    }
    $t2h_default_seen_files{$default_element_file} = $current_element->{'file'};
    $printindex->{'split_groups'} = \@letter_groups;
    #print STDERR "$index_name processed for $element, $element->{'texi'} (@{$printindex->{'split_groups'}})\n";
  }
}

# set directions for added elements now that they are done in the
# main program for all the other elements.
sub t2h_default_index_rearrange_directions()
{
  return if (!defined($t2h_default_element_split_printindices));
  foreach my $element_string (keys(%$t2h_default_element_split_printindices))
  {
    my $element = $t2h_default_element_split_printindices->{$element_string}->{'element'};
    my $current_element = $element;
    #print STDERR " E Processing $element_string,$current_element $current_element->{'texi'}\n";
    foreach my $printindex (@{$t2h_default_element_split_printindices->{$element_string}->{'printindices'}})
    {
      #print STDERR "  I Processing $printindex $printindex->{'name'} (@{$printindex->{'split_groups'}})\n";
      foreach my $split_group (@{$printindex->{'split_groups'}})
      {
        my $first_letter = $split_group->{'letters'}->[0]->{'letter'};
        my $last_letter = $split_group->{'letters'}->[-1]->{'letter'};

        my $new_element = $split_group->{'element'};
        next if ($current_element eq $new_element);
        #print STDERR "   G Processing ($first_letter:$last_letter) in $element->{'texi'}, index $printindex->{'name'}: $new_element->{'texi'}\n";
        $new_element->{'This'} = $new_element;
        if ($current_element->{'Forward'})
        {
          $current_element->{'Forward'}->{'Back'} = $new_element;
          $new_element->{'Forward'} = $current_element->{'Forward'};
        }
        $current_element->{'Forward'} = $new_element;
        $new_element->{'Back'} = $current_element;
        if ($current_element->{'Following'})
        {
#print STDERR "F: C($current_element): $current_element->{'texi'}, N($new_element): $new_element->{'texi'} -- C->F: $current_element->{'Following'}->{'texi'}\n";
          $new_element->{'Following'} = $current_element->{'Following'};
          $current_element->{'Following'} = $new_element;
        }
        foreach my $key ('FastForward', 'FastBack', 'Up', 'tag_level', 'tag',
            'level', 'node')
        {
          $new_element->{$key} = $element->{$key} if (defined($element->{$key}));
        }
        $new_element->{'this'} = $new_element;
        $current_element = $new_element;
      }
    }
  }
}

# not needed to initialize it for a document, since it is reset 
# in index_summary
my $t2h_symbol_indices = 0;

# format a letter appearing in a summary for an index. The letter links to
# the place where the index elements beginning with this letter are (called
# a letter entry).
#
# arguments:
# letter
# file where the target letter entry is 
# identifier for the target letter entry

sub html_default_summary_letter($$$$$$$)
{
   my $letter = shift;
   my $file = shift;
   my $default_identifier = shift;
   my $index_element_id = shift;
   my $number = shift;
   my $index_element = shift;
   my $index_name = shift;

   return '' if ($letter =~ /^\s*$/);
   my $is_symbol = $letter !~ /^[A-Za-z]/;
   my $identifier = $default_identifier;

   if ($NEW_CROSSREF_STYLE)
   {
      if ($is_symbol)
      {
         $t2h_symbol_indices++;
         $identifier = $index_element_id . "_${index_name}_symbol-$t2h_symbol_indices";
      }
      else
      {
         $identifier = $index_element_id . "_${index_name}_letter-${letter}";
      }
   }
   my $result = &$anchor('', $file . '#' . $identifier, '<b>' . &$protect_text($letter) . '</b>', 'class="summary-letter"');
   return $result unless ($NEW_CROSSREF_STYLE);
   return ($result, $identifier, $is_symbol);
}

# this replaces do_index_page
# args should be:
# index_name
# printindex
sub t2h_GPL_default_printindex($$)
{
  my $index_name = shift;
  my $printindex = shift;
  # could be cross verified with argument

  my $identifier_index_nr = 0;
#print STDERR "Doing printindex $index_name\n";
  my @split_letters;
  
  if (defined($printindex->{'split_groups'}) and scalar(@{$printindex->{'split_groups'}}))
  {
    @split_letters = @{$printindex->{'split_groups'}};
  }
  elsif (defined($Texi2HTML::THISDOC{'index_letters_array'}->{$index_name}) and scalar(@{$Texi2HTML::THISDOC{'index_letters_array'}->{$index_name}}))
  {
    my $element = $printindex->{'associated_element'};
    # this happens for printindex before the first element.
    if (!defined($element))
    {
       $element =  {'file' => '', 'id' => "$printindex->{'region'}_printindex"} if (!defined($element));
    }
    elsif (defined($element->{'element_ref'}))
    {
        $element = $element->{'element_ref'};
    }
    @split_letters = ({ 'letters' => $Texi2HTML::THISDOC{'index_letters_array'}->{$index_name}, 'element' => $element});
  }
  else
  {
    return '';
  }

  foreach my $split_group (@split_letters)
  {
    #do summmary
    my @non_alpha = ();
    my @alpha = ();
    #print STDERR "$index_name @{$split_group->{'letters'}}\n";
    # letter_id could be done once for all instead of for each split_group
    # and outside of t2h_default_summary_letter (or t2h_default_summary_letter
    # could be simplified and inlined
    my %letter_id;
    foreach my $summary_split_group (@split_letters)
    {
      foreach my $letter_entry (@{$summary_split_group->{'letters'}})
      {
        my $letter = $letter_entry->{'letter'};
        my $dest_file = '';
        $dest_file = $summary_split_group->{'element'}->{'file'}
           if ($summary_split_group ne $split_group);
        my $index_element_id = $summary_split_group->{'element'}->{'id'};
        my $default_identifier = $index_element_id . "_$identifier_index_nr";
        #print STDERR "$split_group $summary_split_group $summary_split_group->{'element'} $summary_split_group->{'element'}->{'id'}  $identifier_index_nr $index_element_id $default_identifier\n";
        $identifier_index_nr++;
        my ($result, $identifier, $is_symbol) =
          &$summary_letter($letter, $dest_file, $default_identifier, $index_element_id, '', '', $index_name);
        $identifier = $default_identifier if (!defined($identifier));
        $letter_id{$letter} = $identifier;
        $is_symbol = $letter !~ /^[A-Za-z]/ if (!defined($is_symbol));

        if ($result ne '')
        {
          if ($is_symbol)
          {
            push @non_alpha, $result;
          }
          else
          {
            push @alpha, $result;
          }
        }
      }
    }
    my $summary = &$index_summary(\@alpha, \@non_alpha);

    # reset symbols numbering
    $t2h_symbol_indices = 0;

    my $letters_text = '';
    foreach my $letter_entry (@{$split_group->{'letters'}})
    {
      my $letter = $letter_entry->{'letter'};
      my $entries_text = '';
      foreach my $index_entry_ref (@{$letter_entry->{'entries'}})
      {
        my ($text_href, $entry_file, $element_file, $entry_target,
          $entry_element_target, $formatted_entry, $element_href, $entry_element_text)
          =  main::get_index_entry_infos($index_entry_ref, $split_group->{'element'});
        $entries_text .= &$index_entry ($text_href, $formatted_entry, $element_href, $entry_element_text, $entry_file, $element_file, $entry_target, $entry_element_target, $index_entry_ref);
      }
      $letters_text .= &$index_letter ($letter, $letter_id{$letter}, $entries_text)
    }
    my $index_text = &$print_index($letters_text, $index_name);
    $split_group->{'text'} = $summary . $index_text . $summary;
#    print STDERR "    ---> $index_name @{$split_group->{'letters'}}
#     * elt:   $split_group->{'element'}->{'id'}, $split_group->{'element'}->{'file'}, $split_group->{'element'}->{'name'}
#     * directions: B: $split_group->{'element'}->{'Back'}->{'name'}, F: $split_group->{'element'}->{'Forward'}->{'name'}, FB: $split_group->{'element'}->{'FastBack'}->{'name'}, FF: $split_group->{'element'}->{'FastForward'}->{'name'}
#     * text
#
#$split_group->{'text'}
#   
#";
  }
  my $current_page = shift @split_letters;
  if (!scalar(@split_letters))
  {
    return $current_page->{'text'};
  }

  while (1)
  {
    # print the index letters
    push @{$Texi2HTML::THIS_SECTION}, $current_page->{'text'};

    $current_page = shift @split_letters;
    last if (!defined($current_page));

    # there is no need to begin first element if not already done, since
    # the index is not split if not already in an element.
    # end the previous element
    main::finish_element ($Texi2HTML::THISDOC{'FH'}, $Texi2HTML::THIS_ELEMENT, $Texi2HTML::THIS_ELEMENT->{'Forward'}, 0);

    # do the new element beginning
    $Texi2HTML::THIS_ELEMENT = $current_page->{'element'};
    main::unref_file($Texi2HTML::THIS_ELEMENT->{'file'});
    main::do_element_directions($Texi2HTML::THIS_ELEMENT);
    my $do_page_head = main::open_out_file($current_page->{'element'}->{'file'});
    if ($do_page_head)
    {
      &$print_page_head($Texi2HTML::THISDOC{'FH'});
      &$print_chapter_header($Texi2HTML::THISDOC{'FH'}, $Texi2HTML::THIS_ELEMENT) if Texi2HTML::Config::get_conf('SPLIT') eq 'chapter';
      &$print_section_header($Texi2HTML::THISDOC{'FH'}, $Texi2HTML::THIS_ELEMENT) if Texi2HTML::Config::get_conf('SPLIT') eq 'section';
    }
    @{$Texi2HTML::THIS_SECTION} = &$element_label($Texi2HTML::THIS_ELEMENT->{'id'}, $Texi2HTML::THIS_ELEMENT, undef, undef);
    push @{$Texi2HTML::THIS_SECTION}, &$print_element_header(1, 0);
    push @{$Texi2HTML::THIS_SECTION}, &$heading($Texi2HTML::THIS_ELEMENT);
  }
  return '';
}

# leave this within comments, and keep the require statement
# This way, you can directly run texi2html.pl, 
# if $T2H_HOME/documentlanguages.pl exists.
#
# @T2H_DOCUMENT_LANGUAGES@

require "$T2H_HOME/documentlanguages.pl"
    if ($0 =~ /\.pl$/ &&
        -e "$T2H_HOME/documentlanguages.pl" && -r "$T2H_HOME/documentlanguages.pl");

# leave this within comments, and keep the require statement
# This way, you can directly run texi2html.pl, if 
# $T2H_HOME/texi2html.init exists.

# @INIT@

require "$T2H_HOME/texi2html.init" 
    if ($0 =~ /\.pl$/ &&
        -e "$T2H_HOME/texi2html.init" && -r "$T2H_HOME/texi2html.init");

# @INIT_HTML@

require "$T2H_HOME/formats/html.init" 
    if ($0 =~ /\.pl$/ &&
        -e "$T2H_HOME/formats/html.init" && -r "$T2H_HOME/formats/html.init");

# @INIT_INFO@

require "$T2H_HOME/formats/info.init" 
    if ($0 =~ /\.pl$/ &&
        -e "$T2H_HOME/formats/info.init" && -r "$T2H_HOME/formats/info.init");

# @INIT_DOCBOOK@

require "$T2H_HOME/formats/docbook.init"
    if ($0 =~ /\.pl$/ &&
        -e "$T2H_HOME/formats/docbook.init" && -r "$T2H_HOME/formats/docbook.init");

# @INIT_XML@

require "$T2H_HOME/formats/xml.init"
    if ($0 =~ /\.pl$/ &&
        -e "$T2H_HOME/formats/xml.init" && -r "$T2H_HOME/formats/xml.init");

# @INIT_PLAINTEXT@

require "$T2H_HOME/formats/plaintext.init"
    if ($0 =~ /\.pl$/ &&
        -e "$T2H_HOME/formats/plaintext.init" && -r "$T2H_HOME/formats/plaintext.init");

my $translation_file = 'translations.pl'; # file containing all the translations
my $T2H_OBSOLETE_STRINGS;

# leave this within comments, and keep the require statement
# This way, you can directly run texi2html.pl, 
# if $T2H_HOME/translations.pl exists.
#
# @T2H_TRANSLATIONS_FILE@

require "$T2H_HOME/$translation_file"
    if ($0 =~ /\.pl$/ &&
        -e "$T2H_HOME/$translation_file" && -r "$T2H_HOME/$translation_file");


# these are unlikely to be used by users, as they are essentially
# used to follow the html external refs specification in texinfo
sub t2h_cross_manual_normal_text($$$$$)
{
    my $text = shift;
    my $in_raw_text = shift;
    my $in_preformatted = shift;
    my $in_code =shift;
    my $in_simple =shift;
    my $style_stack = shift;

    $text = uc($text) if (in_small_caps($style_stack));
    return $text if ($USE_UNICODE);
    return t2h_no_unicode_cross_manual_normal_text($text, 0);
}

sub t2h_cross_manual_normal_text_transliterate($$$$$)
{
    my $text = shift;
    my $in_raw_text = shift;
    my $in_preformatted = shift;
    my $in_code =shift;
    my $in_simple =shift;
    my $style_stack = shift;

    $text = uc($text) if (in_small_caps($style_stack));
    return $text if ($USE_UNICODE);
    return t2h_no_unicode_cross_manual_normal_text($text, 1);
}

sub t2h_no_unicode_cross_manual_normal_text($$)
{
    # if there is no unicode support, we do all the transformations here
    my $text = shift;
    my $transliterate = shift;
    my $result = '';
    
    my $encoding = get_conf('DOCUMENT_ENCODING');
    if (defined($encoding) and exists($t2h_encoding_aliases{$encoding}))
    {
        $encoding = $t2h_encoding_aliases{$encoding};
    }
    
    while ($text ne '')
    {
        if ($text =~ s/^([A-Za-z0-9]+)//o)
        {
             $result .= $1;
        }
        elsif ($text =~ s/^ //o)
        {
             $result .= '-';
        }
        elsif ($text =~ s/^(.)//o)
        {
             if (exists($ascii_character_map{$1}))
             {
                 $result .= '_' . lc($ascii_character_map{$1});
             }
             else
             { 
                  my $character = $1;
                  my $charcode = uc(sprintf("%02x",ord($1)));
                  my $done = 0;
                  if (defined($encoding) and exists($eight_bit_to_unicode{$encoding})
                      and exists($eight_bit_to_unicode{$encoding}->{$charcode}))
                  {
                      $done = 1;
                      my $unicode_point =  $eight_bit_to_unicode{$encoding}->{$charcode};
                      if (!$transliterate)
                      {
                           $result .= '_' . lc($unicode_point);
                      }
                      elsif (exists($transliterate_map{$unicode_point}))
                      {
                           $result .= $transliterate_map{$unicode_point};
                      }
                      elsif (exists($unicode_diacritical{$unicode_point}))
                      {
                           $result .= '';
                      }
                      else
                      {
                          $done = 0;
                      }
                  }

                  if (!$done)
                  { # wild guess that work for latin1, and thus, should fail
                      $result .= '_' . '00' . lc($charcode);
                  }
             }
        }
        else
        {
             line_error("Bug: unknown character in cross ref (likely in infinite loop)");
             print STDERR "Text: !!$text!!\n";
             sleep 1;
        }
    }
   
    return $result;
}

sub t2h_nounicode_cross_manual_accent($$$)
{
    my $accent = shift;
    my $args = shift;
    my $style_stack = shift;
                                                                                
    my $text = $args->[0];

    if ($accent eq 'dotless')
    { 
        if (($text eq 'i') and (!defined($style_stack->[-1]) or (!defined($unicode_accents{$style_stack->[-1]})) or ($style_stack->[-1] eq 'tieaccent')))
        {
             return "_0131";
        }
        #return "\x{}" if ($text eq 'j'); # not found !
        return $text;
    }
    return '_' . lc($unicode_accents{$accent}->{$text})
        if (defined($unicode_accents{$accent}->{$text}));
    return ($text . '_' . lc($unicode_diacritical{$accent})) 
        if (defined($unicode_diacritical{$accent}));
    return ascii_accents($text, $accent);
}

sub t2h_transliterate_cross_manual_accent($$)
{
    my $accent = shift;
    my $args = shift;
                                                                                
    my $text = $args->[0];

    if (exists($unicode_accents{$accent}->{$text}) and
        exists ($transliterate_map{$unicode_accents{$accent}->{$text}}))
    {
         return $transliterate_map{$unicode_accents{$accent}->{$text}};
    }
    return $text;
}


} # end package Texi2HTML::Config

use vars qw(
%value
%alias
);

# variables which might be redefined by the user but aren't likely to be  
# they seem to be in the main namespace
use vars qw(
%index_names
%index_prefix_to_name
%predefined_index
%valid_index
%reference_sec2level
%code_style_map
%forbidden_index_name
);

# Some global variables are set in the script, and used in the subroutines
# they are in the Texi2HTML namespace, thus prefixed with Texi2HTML::.
# see texi2html.init for details.

#+++############################################################################
#                                                                              #
# Pasted content of File $(srcdir)/MySimple.pm: Command-line processing        #
#                                                                              #
#---############################################################################

# leave this within comments, and keep the require statement
# This way, you can directly run texi2html.pl, if $T2H_HOME/MySimple.pm
# exists.

# @MYSIMPLE@

require "$T2H_HOME/MySimple.pm"
    if ($0 =~ /\.pl$/ &&
        -e "$T2H_HOME/MySimple.pm" && -r "$T2H_HOME/MySimple.pm");

#+++########################################################################
#                                                                          #
# Pasted content of File $(srcdir)/T2h_i18n.pm: Internationalisation       #
#                                                                          #
#---########################################################################

# leave this within comments, and keep the require statement
# This way, you can directly run texi2html.pl, if $T2H_HOME/T2h_i18n.pm
# exists.

{
# @T2H_I18N@
require "$T2H_HOME/T2h_i18n.pm"
    if ($0 =~ /\.pl$/ &&
        -e "$T2H_HOME/T2h_i18n.pm" && -r "$T2H_HOME/T2h_i18n.pm");
}

#########################################################################
#
# latex2html code
#
#---######################################################################

{
# leave this within comments, and keep the require statement
# This way, you can directly run texi2html.pl, if $ENV{T2H_HOME}/T2h_l2h.pm
# exists.

# @T2H_L2H@

require "$T2H_HOME/T2h_l2h.pm"
    if ($0 =~ /\.pl$/ &&
        -e "$T2H_HOME/T2h_l2h.pm" && -r "$T2H_HOME/T2h_l2h.pm");

}

{
package Texi2HTML::LaTeX2HTML::Config;

# latex2html variables
# These variables are not used. They are here for information only, and
# an example of config file for latex2html file is included.
my $ADDRESS;
my $ANTI_ALIAS;
my $ANTI_ALIAS_TEXT;
my $ASCII_MODE;
my $AUTO_LINK;
my $AUTO_PREFIX;
my $CHILDLINE;
my $DEBUG;
my $DESTDIR;
my $DVIPS = 'dvips';
my $ERROR;
my $EXTERNAL_FILE;
my $EXTERNAL_IMAGES;
my $EXTERNAL_UP_LINK;
my $EXTERNAL_UP_TITLE;
my $FIGURE_SCALE_FACTOR;
my $HTML_VERSION;
my $IMAGES_ONLY;
my $INFO;
my $LINE_WIDTH;
my $LOCAL_ICONS;
my $LONG_TITLES;
my $MATH_SCALE_FACTOR;
my $MAX_LINK_DEPTH;
my $MAX_SPLIT_DEPTH;
my $NETSCAPE_HTML;
my $NOLATEX;
my $NO_FOOTNODE;
my $NO_IMAGES;
my $NO_NAVIGATION;
my $NO_SIMPLE_MATH;
my $NO_SUBDIR;
my $PAPERSIZE;
my $PREFIX;
my $PS_IMAGES;
my $REUSE;
my $SCALABLE_FONTS;
my $SHORTEXTN;
my $SHORT_INDEX;
my $SHOW_SECTION_NUMBERS;
my $SPLIT;
my $TEXDEFS;
my $TITLE;
my $TITLES_LANGUAGE;
my $TMP;
my $VERBOSE;
my $WORDS_IN_NAVIGATION_PANEL_TITLES;
my $WORDS_IN_PAGE;

# @T2H_L2H_INIT@
}

package main;

#
# flush stdout and stderr after every write
#
select(STDERR);
$| = 1;
select(STDOUT);
$| = 1;

my $I = \&Texi2HTML::I18n::get_string;

########################################################################
#
# Global variable initialization
#
########################################################################
#
# pre-defined indices
#

%index_prefix_to_name = ();

%index_names =
(
 'cp' => { 'prefixes' => {'cp' => 0,'c' => 0}},
 'fn' => { 'prefixes' => {'fn' => 1, 'f' => 1}},
 'vr' => { 'prefixes' => {'vr' => 1, 'v' => 1}},
 'ky' => { 'prefixes' => {'ky' => 1, 'k' => 1}},
 'pg' => { 'prefixes' => {'pg' => 1, 'p' => 1}},
 'tp' => { 'prefixes' => {'tp' => 1, 't' => 1}}
);

foreach my $name(keys(%index_names))
{
    foreach my $prefix (keys %{$index_names{$name}->{'prefixes'}})
    {
        $forbidden_index_name{$prefix} = 1;
        $index_prefix_to_name{$prefix} = $name;
    }
}

foreach my $other_forbidden_index_name ('info','ps','pdf','htm',
   'log','aux','dvi','texi','txi','texinfo','tex','bib')
{
    $forbidden_index_name{$other_forbidden_index_name} = 1;
}

# commands with ---, -- '' and `` preserved
# usefull with the old interface

%code_style_map = (
           'code'    => 1,
           'command' => 1,
           'env'     => 1,
           'file'    => 1,
           'kbd'     => 1,
           'option'  => 1,
           'samp'    => 1,
           'verb'    => 1,
);

my @element_directions = ('Up', 'Forward', 'Back', 'Next', 'Prev', 
'SectionNext', 'SectionPrev', 'SectionUp', 'FastForward', 'FastBack', 
'This', 'NodeUp', 'NodePrev', 'NodeNext', 'Following', 'NextFile', 'PrevFile',
'ToplevelNext', 'ToplevelPrev');
$::simple_map_ref = \%Texi2HTML::Config::simple_map;
$::simple_map_pre_ref = \%Texi2HTML::Config::simple_map_pre;
$::simple_map_texi_ref = \%Texi2HTML::Config::simple_map_texi;
$::style_map_ref = \%Texi2HTML::Config::style_map;
$::style_map_pre_ref = \%Texi2HTML::Config::style_map_pre;
$::style_map_texi_ref = \%Texi2HTML::Config::style_map_texi;
$::things_map_ref = \%Texi2HTML::Config::things_map;
$::pre_map_ref = \%Texi2HTML::Config::pre_map;
$::texi_map_ref = \%Texi2HTML::Config::texi_map;

#print STDERR "MAPS: $::simple_map_ref $::simple_map_pre_ref $::simple_map_texi_ref $::style_map_ref $::style_map_pre_ref $::style_map_texi_ref $::things_map_ref $::pre_map_ref $::texi_map_ref\n";

# delete from hash if we are using the new interface
foreach my $code (keys(%code_style_map))
{
    delete ($code_style_map{$code}) 
       if (ref($::style_map_ref->{$code}) eq 'HASH');
}

# no paragraph in these commands
my %no_paragraph_macro = (
           'xref'         => 1,
           'ref'          => 1,
           'pxref'        => 1,
           'inforef'      => 1,
           'anchor'       => 1,
);


#
# texinfo section names to level
#
my %reference_sec2level = (
	      'top', 0,
	      'chapter', 1,
	      'unnumbered', 1,
	      'chapheading', 1,
	      'appendix', 1,
	      'section', 2,
	      'unnumberedsec', 2,
	      'heading', 2,
	      'appendixsec', 2,
	      'subsection', 3,
	      'unnumberedsubsec', 3,
	      'subheading', 3,
	      'appendixsubsec', 3,
	      'subsubsection', 4,
	      'unnumberedsubsubsec', 4,
	      'subsubheading', 4,
	      'appendixsubsubsec', 4,
         );

# the reverse mapping. There is an entry for each sectionning command.
# The value is a ref on an array containing at each index the corresponding
# sectionning command name.
my %level2sec;
{
    my $sections = [ ];
    my $appendices = [ ];
    my $unnumbered = [ ];
    my $headings = [ ];
    foreach my $command (keys (%reference_sec2level))
    {
        if ($command =~ /^appendix/)
        {
            $level2sec{$command} = $appendices;
        }
        elsif ($command =~ /^unnumbered/ or $command eq 'top')
        {
            $level2sec{$command} = $unnumbered;
        }
        elsif ($command =~ /section$/ or $command eq 'chapter')
        {
            $level2sec{$command} = $sections;
        }
        else
        {
            $level2sec{$command} = $headings;
        }
        $level2sec{$command}->[$reference_sec2level{$command}] = $command;
    }
}

# this are synonyms
$reference_sec2level{'appendixsection'} = 2;
# sec2level{'majorheading'} is also 1 and not 0
$reference_sec2level{'majorheading'} = 1;
$reference_sec2level{'chapheading'} = 1;
$reference_sec2level{'centerchap'} = 1;

sub stop_paragraph_command($)
{
   my $command = shift;
   return 1 if ($Texi2HTML::Config::stop_paragraph_command{$command} or $reference_sec2level{$command});
}

sub set_no_line_macro($$)
{
   my $macro = shift;
   my $value = shift;
   $Texi2HTML::Config::no_paragraph_commands{$macro} = $value 
      unless defined($Texi2HTML::Config::no_paragraph_commands{$macro});
}

# those macros aren't considered as beginning a paragraph
foreach my $no_line_macro ('alias', 'macro', 'unmacro', 'rmacro',
 'titlefont', 'include', 'copying', 'end copying', 'tab', 'item',
 'itemx', '*', 'float', 'end float', 'caption', 'shortcaption', 'cindex',
 'image')
{
    set_no_line_macro($no_line_macro, 1);
}

foreach my $key (keys(%Texi2HTML::Config::misc_command), keys(%reference_sec2level))
{
    set_no_line_macro($key, 1);
}

# a hash associating a format @thing / @end thing with the type of the format
# 'complex_format' 'simple_format' 'deff' 'list' 'menu' 'paragraph_format'
my %format_type = (); 

foreach my $simple_format (keys(%Texi2HTML::Config::format_map))
{
   $format_type{$simple_format} = 'simple_format';
}
foreach my $paragraph_style (keys(%Texi2HTML::Config::paragraph_style))
{
   $format_type{$paragraph_style} = 'paragraph_format';
}
foreach my $complex_format (keys(%$Texi2HTML::Config::complex_format_map))
{
   $format_type{$complex_format} = 'complex_format';
}
foreach my $table (('table', 'ftable', 'vtable'))
{
   $format_type{$table} = 'table';
}
$format_type{'multitable'} = 'multitable';
foreach my $def_format (keys(%Texi2HTML::Config::def_map))
{
   $format_type{$def_format} = 'deff';
}
$format_type{'itemize'} = 'list';
$format_type{'enumerate'} = 'list';

$format_type{'menu'} = 'menu';
$format_type{'detailmenu'} = 'menu';
$format_type{'direntry'} = 'menu';

$format_type{'cartouche'} = 'cartouche';

$format_type{'float'} = 'float';

$format_type{'quotation'} = 'quotation';
$format_type{'smallquotation'} = 'quotation';

$format_type{'group'} = 'group';

my @special_regions = ('titlepage', 'copying', 'documentdescription');
foreach my $region (@special_regions)
{
   $format_type{$region} = 'region';
}

foreach my $key (keys(%format_type))
{
   set_no_line_macro($key, 1);
   set_no_line_macro("end $key", 1);
}

foreach my $macro (keys(%Texi2HTML::Config::format_in_paragraph))
{
   set_no_line_macro($macro, 1);
   set_no_line_macro("end $macro", 1);
}

# fake format at the bottom of the stack
$format_type{'noformat'} = '';

# fake formats are formats used internally within other formats
# we associate them with a real format, for the error messages
my %fake_format = (
     'line' => 'table',
     'term' => 'table',
     'item' => 'list or table',
     'row' => 'multitable row',
     'cell' => 'multitable cell',
     'deff_item' => 'definition command',
     'menu_comment' => 'menu',
     'menu_description' => 'menu',
  );

foreach my $key (keys(%fake_format))
{
    $format_type{$key} = 'fake';
}

# raw formats which are expanded especially
my @raw_regions = ('html', 'tex', 'xml', 'docbook');
foreach my $format (keys(%Texi2HTML::Config::texi_formats_map))
{
    push @raw_regions, $format if ($Texi2HTML::Config::texi_formats_map{$format} eq 'raw');
}

# The css formats are associated with complex format commands, and associated
# with the 'pre_style' key
foreach my $complex_format (keys(%$Texi2HTML::Config::complex_format_map))
{
    next if (defined($Texi2HTML::Config::complex_format_map->{$complex_format}->{'pre_style'}));
    $Texi2HTML::Config::complex_format_map->{$complex_format}->{'pre_style'} = '';
    $Texi2HTML::Config::complex_format_map->{$complex_format}->{'pre_style'} = $Texi2HTML::Config::css_map{"pre.$complex_format"} if (exists($Texi2HTML::Config::css_map{"pre.$complex_format"}));
}

#+++############################################################################
#                                                                              #
# Argument parsing, initialisation                                             #
#                                                                              #
#---############################################################################

# shorthand for Texi2HTML::Config::VERBOSE
my $T2H_VERBOSE;
my $T2H_DEBUG;

sub line_warn($$);
sub document_warn($);
sub file_line_warn($$;$);
sub cmdline_warn ($);

#print STDERR "" . &$I('test i18n: \' , \a \\ %% %{unknown}a %known % %{known}  \\', { 'known' => 'a known string', 'no' => 'nope'}); exit 0;

# file:        file name to locate. It can be a file path.
# all_files:   if true collect all the files with that name, otherwise stop
#              at first match.
# directories: a reference on a array containing a list of directories to
#              search the file in. default is 
#              @Texi2HTML::Config::CONF_DIRS, @texi2html_config_dirs.
sub locate_init_file($;$$)
{
    my $file = shift;
    my $all_files = shift;
    my $directories = shift;

    $directories = [ @Texi2HTML::Config::CONF_DIRS, @texi2html_config_dirs ] if !defined($directories);

    if ($file =~ /^\//)
    {
         return $file if (-e $file and -r $file);
    }
    else
    {
         my @files;
         foreach my $dir (@$directories)
         {
              next unless (-d "$dir");
              if ($all_files)
              {
                  push (@files, "$dir/$file") if (-e "$dir/$file" and -r "$dir/$file");
              }
              else
              {
                  return "$dir/$file" if (-e "$dir/$file" and -r "$dir/$file");
              }
         }
         return @files if ($all_files);
    }
    return undef;
}

# called on -init-file
sub load_init_file
{
    # First argument is option
    shift;
    # second argument is value of options
    my $init_file = shift;
    my $file;
    if ($file = locate_init_file($init_file))
    {
        print STDERR "# reading initialization file from $file\n"
            if ($T2H_VERBOSE);
        # require the file in the Texi2HTML::Config namespace
        return (Texi2HTML::Config::load($file));
    }
    else
    {
        document_error ("Can't read init file $init_file");
        return 0;
    }
}

sub set_date($)
{
    my $language = shift;
    if (!$Texi2HTML::Config::TEST)
    {
        print STDERR "# Setting date in $language\n" if ($T2H_DEBUG);
        $Texi2HTML::THISDOC{'today'} = Texi2HTML::I18n::pretty_date($language);  # like "20 September 1993";
    }
    else
    {
        $Texi2HTML::THISDOC{'today'} = 'a sunny day';
    }
    $Texi2HTML::THISDOC{'today'} = $Texi2HTML::Config::DATE 
        if (defined($Texi2HTML::Config::DATE));
    $::things_map_ref->{'today'} = $Texi2HTML::THISDOC{'today'};
    $::pre_map_ref->{'today'} = $Texi2HTML::THISDOC{'today'};
    $::texi_map_ref->{'today'} = $Texi2HTML::THISDOC{'today'};
}

# Called on --document-language, at the beginning of each pass and
# when a @documentlanguage appears
sub set_document_language ($$;$)
{
    my $lang = shift;
    my $silent = shift;
    my $line_nr = shift;

    my @langs = ($lang);

    my $lang_code = $lang;
    my $region_code;

    my $main_lang;

    if ($lang =~ /^([a-z]+)_([A-Z]+)/)
    {
        $main_lang = $1;
        $region_code = $2;
        $lang_code = $main_lang;
        push @langs, $main_lang;
    }

    if (!$silent)
    {
        if (! $Texi2HTML::Config::language_codes{$lang_code})
        { # i18n
            msg_warn("$lang_code is not a valid language code.", $line_nr);
        }
        if (defined($region_code) and ! $Texi2HTML::Config::region_codes{$region_code})
        { # i18n
            msg_warn("$region_code is not a valid region code.", $line_nr);
        }
    }

    my @files = locate_init_file("$i18n_dir/$lang", 1);
    if (! scalar(@files) and defined($main_lang))
    {
        @files = locate_init_file("$i18n_dir/$main_lang", 1);
    }

    foreach  my $file (@files)
    {
        Texi2HTML::Config::load($file);
    }
    foreach my $language (@langs)
    {
        if (Texi2HTML::I18n::set_language($language))
        {
            print STDERR "# using '$language' as document language\n" if ($T2H_VERBOSE);
            # since it may be different from get_conf('documentlanguage'),
            # we record it.
            # Currently this is not used anywhere, not sure what the value
            # really corresponds with.
            $Texi2HTML::THISDOC{'current_language'} = $language;
            set_date($language);
            return 1;
        }
    }
    
    return 0;
}


# manage footnote style
sub set_footnote_style($$;$)
{
    my $value = shift;
    my $from_command_line = shift;
    my $line_nr = shift;
    my $command = 'footnotestyle';
    if ($value eq 'end' or $value eq 'separate')
    {
         Texi2HTML::Config::set_conf($command, $value, !$from_command_line);
    }
    elsif ($from_command_line)
    {
         warn ("$0: --footnote-style arg must be `separate' or `end', not `$value'.\n");
    }
    else
    {
         line_error ("\@$command arg must be `separate' or `end', not `$value'.", $line_nr);
    }
}


# find the encoding alias.
# with encoding support (USE_UNICODE), may return undef if no alias was found
sub encoding_alias($;$$)
{
    my $encoding = shift;
    my $line_nr = shift;
    my $context_string = shift;
    return undef if (!defined($encoding) or $encoding eq '');
    if ($Texi2HTML::Config::USE_UNICODE)
    {
         my $result_encoding = Encode::resolve_alias($encoding);
         if (! $result_encoding)
         {
              msg_warn("Encoding name unknown: $encoding", $line_nr, $context_string);
              return undef;
         }
         if (defined($Texi2HTML::Config::t2h_encoding_aliases{$result_encoding}))
         {
             $result_encoding = $Texi2HTML::Config::t2h_encoding_aliases{$result_encoding};
         }
         print STDERR "# Using encoding $result_encoding\n" if ($T2H_VERBOSE);
         return $result_encoding; 
    }
    else
    {
         if (exists($Texi2HTML::Config::t2h_encoding_aliases{$encoding}))
         {
             $encoding = $Texi2HTML::Config::t2h_encoding_aliases{$encoding};
             document_warn ("Document encoding is utf8, but there is no unicode support") if ($encoding eq 'utf-8');
             return $encoding;
         }
         msg_warn("Encoding $encoding certainly poorly supported", $line_nr);
         return $encoding;
    }
}


my %nodes;             # nodes hash. The key is the texi node name
my %cross_reference_nodes;  # normalized node names arrays

#
# %value hold texinfo variables, see also -D, -U, @set and @clear.
# we predefine html (the output format) and texi2html (the translator)
# it is initialized with %value_initial at the beginning of the 
# document parsing and filled and emptied as @set and @clear are 
# encountered
my %value_initial = 
      (
          'html' => 1,
          'texi2html' => $THISVERSION,
      );

#
# _foo: internal variables to track @foo
#
foreach my $key ('_author', '_title', '_subtitle', '_shorttitlepage',
	 '_settitle', '_titlefont')
{
    $value_initial{$key} = '';            # prevent -w warnings
}


sub unicode_to_protected($)
{
    my $text = shift;
    my $result = '';
    while ($text ne '')
    {
        if ($text =~ s/^([A-Za-z0-9]+)//o)
        {
             $result .= $1;
        }
        elsif ($text =~ s/^ //o)
        {
             $result .= '-';
        }
        elsif ($text =~ s/^(.)//o)
        {
             my $char = $1;
             if (exists($Texi2HTML::Config::ascii_character_map{$char}))
             {
                 $result .= '_' . lc($Texi2HTML::Config::ascii_character_map{$char});
             }
             else
             {
                 if (ord($char) <= hex(0xFFFF)) 
                 {
                     $result .= '_' . lc(sprintf("%04x",ord($char)));
                 }
                 else
                 {
                     $result .= '__' . lc(sprintf("%06x",ord($char)));
                 }
             }
        }
        else
        {
             print STDERR "Bug: unknown character in a cross ref (likely in infinite loop)\n";
             print STDERR "Text: !!$text!!\n";
             sleep 1;
        }
    }
    return $result;
}

sub unicode_to_transliterate($)
{
    my $text = shift;
    if (chomp($text))
    {
       print STDERR "Strange: end of line to transliterate: $text\n";
    }
    my $result = '';
    while ($text ne '')
    {
        if ($text =~ s/^([A-Za-z0-9 ]+)//o)
        {
             $result .= $1;
        }
        elsif ($text =~ s/^(.)//o)
        {
             my $char = $1;
             if (exists($Texi2HTML::Config::ascii_character_map{$char}))
             {
                 $result .= $char;
             }
             elsif (ord($char) <= hex(0xFFFF) and exists($Texi2HTML::Config::transliterate_map{uc(sprintf("%04x",ord($char)))}))
             {
                 $result .= $Texi2HTML::Config::transliterate_map{uc(sprintf("%04x",ord($char)))};
             }
             elsif (ord($char) <= hex(0xFFFF) and exists($Texi2HTML::Config::unicode_diacritical{uc(sprintf("%04x",ord($char)))}))
             {
                 $result .= '';
             }
             # in this case, we want to avoid calling unidecode, as we are sure
             # that there is no useful transliteration of the unicode character
             # instead we want to keep it as is.
             # This is the case, for example, for @exclamdown, is corresponds
             # with x00a1, but unidecode transliterates it to a !, we want
             # to avoid that and keep x00a1.
             elsif (ord($char) <= hex(0xFFFF) and exists($Texi2HTML::Config::no_transliterate_map{uc(sprintf("%04x",ord($char)))}))
             {
                 $result .= $char;
             }
             else
             {
                 if ($Texi2HTML::Config::USE_UNIDECODE)
                 {
                      $result .= unidecode($char);
                 }
                 else
                 {
                      $result .= $char;
                 }
             }
        }
        else
        {
             print STDERR "Bug: unknown character in cross ref transliteration (likely in infinite loop)\n";
             print STDERR "Text: !!$text!!\n";
             sleep 1;
        }
    }
    return $result;
}

# used both for command line and @-command argument checking
sub set_paragraphindent($$;$$)
{
   my $value = shift;
   my $from_command_line = shift;
   my $line_nr = shift;
   my $pass = shift;
   my $command = 'paragraphindent';

   if ($value =~ /^([0-9]+)$/ or $value eq 'none' or $value eq 'asis')
   {
       Texi2HTML::Config::set_conf($command, $value, !$from_command_line);
   }
   elsif ($from_command_line)
   {
       cmdline_warn ("--paragraph-indent arg must be numeric/`none'/`asis', not `$value'");
   }
   elsif ($pass == 1)
   {
       line_error ("\@$command arg must be numeric/`none'/`asis', not `$value'", $line_nr);
   }
}

# T2H_OPTIONS is a hash whose keys are the (long) names of valid
# command-line options and whose values are a hash with the following keys:
# type    ==> one of !|=i|:i|=s|:s (see Getopt::Long for more info)
# linkage ==> ref to scalar, array, or subroutine (see Getopt::Long for more info)
# verbose ==> short description of option (displayed by -h)
# noHelp  ==> if 1 -> for "not so important options": only print description on -h 1
#                2 -> for obsolete options: only print description on -h 2
my $T2H_OPTIONS;
$T2H_OPTIONS -> {'debug'} =
{
 type => '=i',
 linkage => \$Texi2HTML::Config::DEBUG,
 verbose => 'output HTML with debuging information',
};

$T2H_OPTIONS -> {'doctype'} =
{
 type => '=s',
 linkage => sub {Texi2HTML::Config::set_conf('doctype', $_[1]);},
 verbose => 'document type which is output in header of HTML files',
 noHelp => 1
};

$T2H_OPTIONS -> {'frameset-doctype'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::FRAMESET_DOCTYPE,
 verbose => 'document type for HTML frameset documents',
 noHelp => 1
};

$T2H_OPTIONS -> {'test'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::TEST,
 verbose => 'use predefined information to avoid differences with reference files',
 noHelp => 1
};

$T2H_OPTIONS -> {'dump-texi'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::DUMP_TEXI,
 verbose => 'dump the output of first pass into a file with extension passfirst and exit',
 noHelp => 1
};

$T2H_OPTIONS -> {'macro-expand|E'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::MACRO_EXPAND,
 verbose => 'output macro expanded source in <file>',
};

$T2H_OPTIONS -> {'ifhtml'} =
{
 type => '!',
 linkage => sub { Texi2HTML::Config::set_expansion('html', $_[1]); },
 verbose => "expand ifhtml and html sections",
};

$T2H_OPTIONS -> {'ifinfo'} =
{
 type => '!',
 linkage => sub { Texi2HTML::Config::set_expansion('info', $_[1]); },
 verbose => "expand ifinfo",
};

$T2H_OPTIONS -> {'ifxml'} =
{
 type => '!',
 linkage => sub { Texi2HTML::Config::set_expansion('xml', $_[1]); },
 verbose => "expand ifxml and xml sections",
};

$T2H_OPTIONS -> {'ifdocbook'} =
{
 type => '!',
 linkage => sub { Texi2HTML::Config::set_expansion('docbook', $_[1]); },
 verbose => "expand ifdocbook and docbook sections",
};

$T2H_OPTIONS -> {'iftex'} =
{
 type => '!',
 linkage => sub { Texi2HTML::Config::set_expansion('tex', $_[1]); },
 verbose => "expand iftex and tex sections",
};

$T2H_OPTIONS -> {'ifplaintext'} =
{
 type => '!',
 linkage => sub { Texi2HTML::Config::set_expansion('plaintext', $_[1]); },
 verbose => "expand ifplaintext sections",
};

# actually a noop, since it is not used anywhere
$T2H_OPTIONS -> {'invisible'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::INVISIBLE_MARK,
 verbose => 'use text in invisble anchor',
 noHelp  => 2,
};

$T2H_OPTIONS -> {'iso'} =
{
 type => 'iso',
 linkage => \$Texi2HTML::Config::USE_ISO,
 verbose => 'if set, ISO8859 characters are used for special symbols (like copyright, etc)',
 noHelp => 1,
};

$T2H_OPTIONS -> {'I'} =
{
 type => '=s',
 linkage => \@Texi2HTML::Config::INCLUDE_DIRS,
 verbose => 'append $s to the @include search path',
};

$T2H_OPTIONS -> {'conf-dir'} =
{
 type => '=s',
 linkage => \@Texi2HTML::Config::CONF_DIRS,
 verbose => 'append $s to the init file directories',
};

$T2H_OPTIONS -> {'P'} =
{
 type => '=s',
 linkage => sub {unshift (@Texi2HTML::Config::PREPEND_DIRS, $_[1]);},
 verbose => 'prepend $s to the @include search path',
};

$T2H_OPTIONS -> {'top-file'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::TOP_FILE,
 verbose => 'use $s as top file, instead of <docname>.html',
};

$T2H_OPTIONS -> {'toc-file'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::TOC_FILE,
 verbose => 'use $s as ToC file, instead of <docname>_toc.html',
};

$T2H_OPTIONS -> {'frames'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::FRAMES,
 verbose => 'output files which use HTML 4.0 frames (experimental)',
 noHelp => 1,
};

$T2H_OPTIONS -> {'menu'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::SHOW_MENU,
 verbose => 'output Texinfo menus',
};

$T2H_OPTIONS -> {'number-sections'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::NUMBER_SECTIONS,
 verbose => 'output chapter and sectioning numbers.',
};

$T2H_OPTIONS -> {'number-footnotes'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::NUMBER_FOOTNOTES,
 verbose => 'output footnote numbers.',
};

$T2H_OPTIONS -> {'use-nodes'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::USE_NODES,
 verbose => 'use nodes for sectionning',
};

$T2H_OPTIONS -> {'node-files'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::NODE_FILES,
 verbose => 'produce one file per node for cross references'
};

$T2H_OPTIONS -> {'footnote-style|s'} =
{
 type => '=s',
 linkage => sub {set_footnote_style ($_[1], 1);},
 verbose => 'output footnotes separate|end',
};

$T2H_OPTIONS -> {'toc-links'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::TOC_LINKS,
 verbose => 'create links from headings to toc entries'
};

$T2H_OPTIONS -> {'split'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::SPLIT,
 verbose => 'split document on section|chapter|node else no splitting',
};

$T2H_OPTIONS -> {'no-split'} =
{
 type => '!',
 linkage => sub {$Texi2HTML::Config::SPLIT = ''; $Texi2HTML::Config::SPLIT_SIZE = undef;},
 verbose => 'no splitting of document',
 noHelp => 1,
};

$T2H_OPTIONS -> {'headers'} =
{
 type => '!',
 linkage => sub {
    Texi2HTML::Config::set_conf('headers', $_[1]);
    Texi2HTML::Config::t2h_default_load_format('plaintext', 1)
        if (!$_[1] and defined($Texi2HTML::Config::OUTPUT_FORMAT) and $Texi2HTML::Config::OUTPUT_FORMAT eq 'info');
 },
 verbose => 'output navigation headers for each section',
};

$T2H_OPTIONS -> {'subdir'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::SUBDIR,
 verbose => 'put files in directory $s, not $cwd',
 noHelp => 1,
};

$T2H_OPTIONS -> {'short-ext'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::SHORTEXTN,
 verbose => 'use "htm" extension for output HTML files',
};

$T2H_OPTIONS -> {'prefix'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::PREFIX,
 verbose => 'use as prefix for output files, instead of <docname>',
};

$T2H_OPTIONS -> {'output|out|o'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::OUT,
 verbose => 'output goes to $s (directory if split)',
};

$T2H_OPTIONS -> {'no-validate|no-pointer-validate'} = 
{
 type => '',
 linkage => sub {Texi2HTML::Config::set_conf('novalidate',$_[1])},
 verbose => 'suppress node cross-reference validation',
};

$T2H_OPTIONS -> {'no-warn'} =
{
 type => '',
 linkage => \$Texi2HTML::Config::NO_WARN,
 verbose => 'suppress warnings (but not errors).'
};

$T2H_OPTIONS -> {'short-ref'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::SHORT_REF,
 verbose => 'if set, references are without section numbers',
};

$T2H_OPTIONS -> {'idx-sum'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::IDX_SUMMARY,
 verbose => 'if set, also output index summary',
 noHelp  => 1,
};

$T2H_OPTIONS -> {'def-table'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::DEF_TABLE,
 verbose => 'if set, \@def.. are converted using tables.',
 noHelp  => 1,
};

$T2H_OPTIONS -> {'verbose'} = 0;
$T2H_OPTIONS -> {'verbose|v'} =
{
 type => '!',
 linkage=> \$Texi2HTML::Config::VERBOSE,
 verbose => 'print progress info to stdout',
};

$T2H_OPTIONS -> {'document-language'} =
{
 type => '=s',
 linkage => sub {Texi2HTML::Config::set_conf('documentlanguage', $_[1])},
 verbose => 'use $s as document language',
};

$T2H_OPTIONS -> {'ignore-preamble-text'} =
{
  type => '!',
  linkage => \$Texi2HTML::Config::IGNORE_PREAMBLE_TEXT,
  verbose => 'if set, ignore the text before @node and sectionning commands',
  noHelp => 1,
};

$T2H_OPTIONS -> {'html-xref-prefix'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::EXTERNAL_DIR,
 verbose => '$s is the base dir for external manual references',
 noHelp => 1,
};

$T2H_OPTIONS -> {'l2h'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::L2H,
 verbose => 'if set, uses latex2html for @math and @tex',
};

$T2H_OPTIONS -> {'l2h-l2h'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::L2H_L2H,
 verbose => 'program to use for latex2html translation',
 noHelp => 1,
};

$T2H_OPTIONS -> {'l2h-skip'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::L2H_SKIP,
 verbose => 'if set, tries to reuse previously latex2html output',
 noHelp => 1,
};

$T2H_OPTIONS -> {'l2h-tmp'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::L2H_TMP,
 verbose => 'if set, uses $s as temporary latex2html directory',
 noHelp => 1,
};

$T2H_OPTIONS -> {'l2h-file'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::L2H_FILE,
 verbose => 'if set, uses $s as latex2html init file',
 noHelp => 1,
};


$T2H_OPTIONS -> {'l2h-clean'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::L2H_CLEAN,
 verbose => 'if set, do not keep intermediate latex2html files for later reuse',
 noHelp => 1,
};

$T2H_OPTIONS -> {'D'} =
{
 type => '=s',
 linkage => sub {$value_initial{$_[1]} = 1;},
 verbose => 'equivalent to Texinfo "@set $s 1"',
 noHelp => 1,
};

$T2H_OPTIONS -> {'U'} =
{
 type => '=s',
 linkage => sub {delete $value_initial{$_[1]};},
 verbose => 'equivalent to Texinfo "@clear $s"',
 noHelp => 1,
};

$T2H_OPTIONS -> {'init-file'} =
{
 type => '=s',
 linkage => \&load_init_file,
 verbose => 'load init file $s'
};

$T2H_OPTIONS -> {'css-include'} =
{
 type => '=s',
 linkage => \@Texi2HTML::Config::CSS_FILES,
 verbose => 'use css file $s'
};

$T2H_OPTIONS -> {'css-ref'} =
{
 type => '=s',
 linkage => \@Texi2HTML::Config::CSS_REFS,
 verbose => 'generate reference to the CSS URL $s'
};

$T2H_OPTIONS -> {'transliterate-file-names'} =
{
 type => '!',
 linkage=> \$Texi2HTML::Config::TRANSLITERATE_FILE_NAMES,
 verbose => 'produce file names in ASCII transliteration',
};

$T2H_OPTIONS -> {'error-limit|e'} =
{
 type => '=i',
 linkage => \$Texi2HTML::Config::ERROR_LIMIT,
 verbose => 'quit after NUM errors (default 1000).',
};

$T2H_OPTIONS -> {'split-size'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::SPLIT_SIZE,
 verbose => 'split Info files at size s (default 300000).',
};

$T2H_OPTIONS -> {'paragraph-indent|p'} =
{
 type => '=s',
 linkage => sub {set_paragraph_indent($_[1], 1);},
 'verbose' => "indent Info paragraphs by VAL spaces (default 3).
                              If VAL is `none', do not indent; if VAL is
                                `asis', preserve existing indentation.",
};

$T2H_OPTIONS -> {'fill-column|f'} =
{
 type => '=i',
 linkage => sub {Texi2HTML::Config::set_conf('fillcolumn',$_[1]);},
 'verbose' => "break Info lines at NUM characters (default 72).",
};

$T2H_OPTIONS -> {'enable-encoding'} =
{
 type => '',
 linkage => \$Texi2HTML::Config::ENABLE_ENCODING,
 verbose => 'override --disable-encoding (default in Info).',
};

$T2H_OPTIONS -> {'disable-encoding'} =
{
 type => '',
 linkage => sub {$Texi2HTML::Config::ENABLE_ENCODING = 0},
 verbose => 'do not output accented and special characters
                                in Info output based on @documentencoding.',
};

$T2H_OPTIONS -> {'internal-links'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::INTERNAL_LINKS,
 verbose => 'produce list of internal links in FILE.'
};

$T2H_OPTIONS -> {'force|F'} = 
{ type => '!',
 linkage => \$Texi2HTML::Config::FORCE,
 verbose => 'preserve output even if errors.'
};

$T2H_OPTIONS -> {'monolithic'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::MONOLITHIC,
 verbose => 'output only one file including ToC, About...',
 noHelp => 1
};

$T2H_OPTIONS -> {'commands-in-node-names'} =
{
 type => '!',
 verbose => 'Always set',
 noHelp => 1
};

$T2H_OPTIONS -> {'output-indent'} = 
{
 type => '=i',
 verbose => 'This option used to indent XML, it is ignored'
};

#$T2H_OPTIONS -> {'command'} =
#{
# type => '=s',
# linkage => \@Texi2HTML::Config::COMMANDS,
# verbose => 'insert CMD in copy of input file'
#};


foreach my $output_format (keys(%Texi2HTML::Config::output_format_names))
{
  next if (defined($default_output_format) and $output_format eq $default_output_format);
  my $text_default_output_format = 'raw text';
  $text_default_output_format = $Texi2HTML::Config::output_format_names{$default_output_format} if (defined($default_output_format) and defined($Texi2HTML::Config::output_format_names{$default_output_format}));
  $T2H_OPTIONS -> {$output_format} =
  {
    type => '',
    linkage => sub {Texi2HTML::Config::t2h_default_load_format($_[0], 1);},
    verbose => "output $Texi2HTML::Config::output_format_names{$output_format} rather than $text_default_output_format.",
  }
}

if (defined($default_output_format))
{
  $T2H_OPTIONS -> {$default_output_format} =
  {
    type => '',
    linkage => sub {Texi2HTML::Config::t2h_default_load_format($_[0], 1);},
    verbose => "output default format.",
    noHelp => 2
  }
}

##
## obsolete cmd line options
##
my $T2H_OBSOLETE_OPTIONS;

$T2H_OBSOLETE_OPTIONS -> {'expand'} =
{
 type => '=s',
 linkage => sub {Texi2HTML::Config::set_expansion($_[1], 1);},
 verbose => 'Expand <s> section of texinfo source',
 noHelp => 1,
};

$T2H_OBSOLETE_OPTIONS -> {'no-expand'} =
{
 type => '=s',
 linkage => sub {Texi2HTML::Config::set_expansion ($_[1], 0);},
 verbose => 'Don\'t expand the given section of texinfo source',
};

$T2H_OBSOLETE_OPTIONS -> {'noexpand'} = 
{
 type => '=s',
 linkage => $T2H_OBSOLETE_OPTIONS->{'no-expand'}->{'linkage'},
 verbose => $T2H_OBSOLETE_OPTIONS->{'no-expand'}->{'verbose'},
 noHelp  => 1,
};

$T2H_OBSOLETE_OPTIONS -> {'out-file'} =
{
 type => '=s',
 linkage => sub {$Texi2HTML::Config::OUT = $_[1]; $Texi2HTML::Config::SPLIT = '';},
 verbose => 'if set, all HTML output goes into file $s, obsoleted by "-output" with different semantics',
 noHelp => 2
};

$T2H_OBSOLETE_OPTIONS -> {'lang'} =
{
 type => '=s',
 linkage => sub {Texi2HTML::Config::set_conf('documentlanguage', $_[1])},
 verbose => 'obsolete, use "--document-language" instead',
 noHelp => 2
};

# this should be picked up as a number-sections variant
#$T2H_OBSOLETE_OPTIONS -> {'number'} =
#{
# type => '!',
# linkage => \$Texi2HTML::Config::NUMBER_SECTIONS,
# verbose => 'obsolete, use "--number-sections" instead',
# noHelp => 2
#};


$T2H_OBSOLETE_OPTIONS -> {'separated-footnotes'} =
{
 type => '!',
 linkage => sub {my $style = 'separate'; $style = 'end' if !$_[1]; set_footnote_style ($style, 1);},
 verbose => 'obsolete, use "--footnote-style" instead',
 noHelp => 2
};

$T2H_OBSOLETE_OPTIONS -> {'Verbose'} =
{
 type => '!',
 linkage=> \$Texi2HTML::Config::VERBOSE,
 verbose => 'obsolete, use "--verbose" instead',
 noHelp => 2
};


$T2H_OBSOLETE_OPTIONS -> {init_file} =
{
 type => '=s',
 linkage => \&load_init_file,
 verbose => 'obsolete, use "-init-file" instead',
 noHelp => 2
};

$T2H_OBSOLETE_OPTIONS -> {l2h_clean} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::L2H_CLEAN,
 verbose => 'obsolete, use "-l2h-clean" instead',
 noHelp => 2,
};

$T2H_OBSOLETE_OPTIONS -> {l2h_l2h} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::L2H_L2H,
 verbose => 'obsolete, use "-l2h-l2h" instead',
 noHelp => 2
};

$T2H_OBSOLETE_OPTIONS -> {l2h_skip} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::L2H_SKIP,
 verbose => 'obsolete, use "-l2h-skip" instead',
 noHelp => 2
};

$T2H_OBSOLETE_OPTIONS -> {l2h_tmp} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::L2H_TMP,
 verbose => 'obsolete, use "-l2h-tmp" instead',
 noHelp => 2
};

$T2H_OBSOLETE_OPTIONS -> {out_file} =
{
 type => '=s',
 linkage => sub {$Texi2HTML::Config::OUT = $_[1]; $Texi2HTML::Config::SPLIT = '';},
 verbose => 'obsolete, use "-out-file" instead',
 noHelp => 2
};

$T2H_OBSOLETE_OPTIONS -> {short_ref} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::SHORT_REF,
 verbose => 'obsolete, use "-short-ref" instead',
 noHelp => 2
};

$T2H_OBSOLETE_OPTIONS -> {idx_sum} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::IDX_SUMMARY,
 verbose => 'obsolete, use "-idx-sum" instead',
 noHelp  => 2
};

$T2H_OBSOLETE_OPTIONS -> {def_table} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::DEF_TABLE,
 verbose => 'obsolete, use "-def-table" instead',
 noHelp  => 2
};

$T2H_OBSOLETE_OPTIONS -> {short_ext} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::SHORTEXTN,
 verbose => 'obsolete, use "-short-ext" instead',
 noHelp  => 2
};

$T2H_OBSOLETE_OPTIONS -> {sec_nav} =
{
 type => '!',
 linkage => sub {Texi2HTML::Config::set_conf('headers', $_[1]);},
 verbose => 'obsolete, use "-headers" instead',
 noHelp  => 2
};

$T2H_OBSOLETE_OPTIONS -> {'sec-nav'} =
{
 type => '!',
 linkage => sub {Texi2HTML::Config::set_conf('headers', $_[1]);},
 verbose => 'obsolete, use "--header" instead',
 noHelp  => 2
};

$T2H_OBSOLETE_OPTIONS -> {top_file} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::TOP_FILE,
 verbose => 'obsolete, use "-top-file" instead',
 noHelp  => 2
};

$T2H_OBSOLETE_OPTIONS -> {toc_file} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::TOC_FILE,
 verbose => 'obsolete, use "-toc-file" instead',
 noHelp  => 2
};

$T2H_OBSOLETE_OPTIONS -> {glossary} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::USE_GLOSSARY,
 verbose => "this does nothing",
 noHelp  => 2,
};

$T2H_OBSOLETE_OPTIONS -> {check} =
{
 type => '!',
 linkage => sub {exit 0;},
 verbose => "exit without doing anything",
 noHelp  => 2,
};

$T2H_OBSOLETE_OPTIONS -> {dump_texi} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::DUMP_TEXI,
 verbose => 'obsolete, use "-dump-texi" instead',
 noHelp => 1
};

$T2H_OBSOLETE_OPTIONS -> {frameset_doctype} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::FRAMESET_DOCTYPE,
 verbose => 'obsolete, use "-frameset-doctype" instead',
 noHelp => 2
};

$T2H_OBSOLETE_OPTIONS -> {'no-section_navigation'} =
{
 type => '!',
 linkage => sub {Texi2HTML::Config::set_conf('headers', 0);},
 verbose => 'obsolete, use -nosec_nav',
 noHelp => 2,
};
my $use_acc; # not used
$T2H_OBSOLETE_OPTIONS -> {use_acc} =
{
 type => '!',
 linkage => \$use_acc,
 verbose => 'obsolete, set to true unconditionnaly',
 noHelp => 2
};
$T2H_OBSOLETE_OPTIONS -> {expandinfo} =
{
 type => '!',
 linkage => sub {push @Texi2HTML::Config::EXPAND, 'info';},
 verbose => 'obsolete, use "--ifinfo" instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {expandtex} =
{
 type => '!',
 linkage => sub {push @Texi2HTML::Config::EXPAND, 'tex';},
 verbose => 'obsolete, use "--iftex" instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {split_node} =
{
 type => '!',
 linkage => sub{$Texi2HTML::Config::SPLIT = 'section';},
 verbose => 'obsolete, use "-split section" instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {split_chapter} =
{
 type => '!',
 linkage => sub{$Texi2HTML::Config::SPLIT = 'chapter';},
 verbose => 'obsolete, use "-split chapter" instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {no_verbose} =
{
 type => '!',
 linkage => sub {$Texi2HTML::Config::VERBOSE = 0;},
 verbose => 'obsolete, use -noverbose instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {output_file} =
{
 type => '=s',
 linkage => sub {$Texi2HTML::Config::OUT = $_[1]; $Texi2HTML::Config::SPLIT = '';},
 verbose => 'obsolete, use --out-file instead',
 noHelp => 2
};

$T2H_OBSOLETE_OPTIONS -> {section_navigation} =
{
 type => '!',
 linkage => sub {Texi2HTML::Config::set_conf('headers', $_[1]);},
 verbose => 'obsolete, use --sec-nav instead',
 noHelp => 2,
};

# read initialzation from $sysconfdir/texi2htmlrc or $HOME/.texi2htmlrc
# (this is obsolete)
my @rc_files = ();
push @rc_files, "$sysconfdir/texi2htmlrc" if defined($sysconfdir);
push @rc_files, "$ENV{'HOME'}/.texi2htmlrc" if (defined($ENV{HOME}));
foreach my $i (@rc_files)
{
    if (-e $i and -r $i)
    {
        print STDERR "# reading initialization file from $i\n"
	    if ($T2H_VERBOSE);
        print STDERR "Reading config from $i is obsolete, use texi2html/$conf_file_name instead\n";
        Texi2HTML::Config::load($i);
    }
}

# read initialization files
foreach my $file (locate_init_file($conf_file_name, 1))
{
    print STDERR "# reading initialization file from $file\n" if ($T2H_VERBOSE);
    Texi2HTML::Config::load($file);
}


#+++############################################################################
#                                                                              #
# parse command-line options
#                                                                              #
#---############################################################################

# options known by makeinfo (+version and if*)
my @makeinfo_options = ('error-limit', 'error-limit', 'document-language',
'force', 'help', 'no-validate', 'no-warn', 'verbose', 'docbook', 'html', 
'xml', 'plaintext', 'macro-expand', 'headers', 'no-split', 
'number-sections', 'output', 'disable-encoding', 'enable-encoding', 
'fill-column', 'footnote-style', 'paragraph-indent', 'split-size', 
'css-include', 'css-ref', 'internal-links', 'transliterate-file-names', 
'output-indent', 'number-footnotes', 'D', 'I', 'P', 'U');

my @basic_options = ('dump-texi', 'debug', 'test', 'conf-dir', 'init-file',
'split');

#      --command=CMD           insert CMD in copy of input file
my $makeinfo_help =
"Usage: $my_command_name [OPTION]... TEXINFO-FILE...

".
'Translate Texinfo source documentation to various other formats, by default
Info files suitable for reading online with Emacs or standalone GNU Info.

General options:
      --error-limit=NUM       quit after NUM errors (default 100).
      --document-language=STR locale to use in translating Texinfo keywords
                                for the output document (default C).
      --force                 preserve output even if errors.
      --help                  display this help and exit.
      --no-validate           suppress node cross-reference validation.
      --no-warn               suppress warnings (but not errors).
  -v, --verbose               explain what is being done.
      --version               display version information and exit.

Output format selection (default is to produce Info):
      --docbook               output Docbook XML rather than Info.
      --html                  output HTML rather than Info.
      --xml                   output Texinfo XML rather than Info.
      --plaintext             output plain text rather than Info.

General output options:
  -E, --macro-expand=FILE     output macro-expanded source to FILE,
                                ignoring any @setfilename.
      --no-headers            suppress node separators, Node: lines, and menus
                                from Info output (thus producing plain text)
                                or from HTML (thus producing shorter output);
                                also, write to standard output by default.
      --no-split              suppress the splitting of Info or HTML output,
                                generate only one output file.
      --number-sections       output chapter and sectioning numbers.
  -o, --output=FILE           output to FILE (or directory if split HTML).

Options for Info and plain text:
      --disable-encoding      do not output accented and special characters
                                in Info output based on @documentencoding.
      --enable-encoding       override --disable-encoding (default).
      --fill-column=NUM       break Info lines at NUM characters (default 72).
      --footnote-style=STYLE  output footnotes in Info according to STYLE:
                                `separate\' to put them in their own node;
                                `end\' to put them at the end of the node, in
                                which they are defined (this is the default).
      --paragraph-indent=VAL  indent Info paragraphs by VAL spaces (default 3).
                                If VAL is `none\', do not indent; if VAL is
                                `asis\', preserve existing indentation.
      --split-size=NUM        split Info files at size NUM (default 300000).

Options for HTML:
      --css-include=FILE      include FILE in HTML <style> output;
                                read stdin if FILE is -.
      --css-ref=URL           generate reference to a CSS file.
      --internal-links=FILE   produce list of internal links in FILE.
      --transliterate-file-names
                              produce file names in ASCII transliteration.

Options for XML and Docbook:
      --output-indent=VAL     indent XML elements by VAL spaces (default 2).
                                If VAL is 0, ignorable whitespace is dropped.

Input file options:
      --commands-in-node-names  allow @ commands in node names.
  -D VAR                        define the variable VAR, as with @set.
  -I DIR                        append DIR to the @include search path.
  -P DIR                        prepend DIR to the @include search path.
  -U VAR                        undefine the variable VAR, as with @clear.

Conditional processing in input:
  --ifdocbook       process @ifdocbook and @docbook even if
                      not generating Docbook.
  --ifhtml          process @ifhtml and @html even if not generating HTML.
  --ifinfo          process @ifinfo even if not generating Info.
  --ifplaintext     process @ifplaintext even if not generating plain text.
  --iftex           process @iftex and @tex; implies --no-split.
  --ifxml           process @ifxml and @xml.
  --no-ifdocbook    do not process @ifdocbook and @docbook text.
  --no-ifhtml       do not process @ifhtml and @html text.
  --no-ifinfo       do not process @ifinfo text.
  --no-ifplaintext  do not process @ifplaintext text.
  --no-iftex        do not process @iftex and @tex text.
  --no-ifxml        do not process @ifxml and @xml text.

  Also, for the --no-ifFORMAT options, do process @ifnotFORMAT text.

  The defaults for the @if... conditionals depend on the output format:
  if generating HTML, --ifhtml is on and the others are off;
  if generating Info, --ifinfo is on and the others are off;
  if generating plain text, --ifplaintext is on and the others are off;
  if generating XML, --ifxml is on and the others are off.

Examples:
  makeinfo foo.texi                      write Info to foo\'s @setfilename
  makeinfo --html foo.texi               write HTML to @setfilename
  makeinfo --xml foo.texi                write Texinfo XML to @setfilename
  makeinfo --docbook foo.texi            write DocBook XML to @setfilename
  makeinfo --no-headers foo.texi         write plain text to standard output

  makeinfo --html --no-headers foo.texi  write html without node lines, menus
  makeinfo --number-sections foo.texi    write Info with numbered sections
  makeinfo --no-split foo.texi           write one Info file however big

Email bug reports to bug-texinfo@gnu.org,
general questions and discussion to help-texinfo@gnu.org.
Texinfo home page: http://www.gnu.org/software/texinfo/
';

# parsing like texi2html:


my $T2H_USAGE_TEXT = <<EOT;
Usage: texi2html  [OPTIONS] TEXINFO-FILE
Translates Texinfo source documentation to HTML.
EOT
my $T2H_FAILURE_TEXT = <<EOT;
Try 'texi2html --help' for usage instructions.
EOT

my $options = new Getopt::MySimple;

$T2H_OPTIONS -> {'help'} = 0;
$T2H_OPTIONS -> {'help|h'} = 
{ 
 type => ':i', 
 default => '',
 linkage => sub {$options->helpOptions($_[1]); 
    print "\nSend bugs and suggestions to <texi2html-bug\@nongnu.org>\n";
    exit (0);},
 verbose => "print help and exit"
};

# this avoids getOptions defining twice 'help' and 'version'.
$T2H_OBSOLETE_OPTIONS->{'help'} = 0;
$T2H_OBSOLETE_OPTIONS->{'version'} = 0;
$T2H_OBSOLETE_OPTIONS->{'verbose'} = 0;

# this is more compatible with makeinfo. But it changes how command lines
# are parsed, for example -init file.init dodesn't work anymore.
#Getopt::Long::Configure ("gnu_getopt");

if ($my_command_name eq 'texi2html')
{
  # some older version of GetOpt::Long don't have
  # Getopt::Long::Configure("pass_through")
  eval {Getopt::Long::Configure("pass_through");};
  my $Configure_failed = $@ && <<EOT;
**WARNING: Parsing of obsolete command-line options could have failed.
           Consider to use only documented command-line options (run
           'texi2html --help 2' for a complete list) or upgrade to perl
           version 5.005 or higher.
EOT
  if (! $options->getOptions($T2H_OPTIONS, $T2H_USAGE_TEXT, "$THISVERSION\n"))
  {
     print STDERR "$Configure_failed" if $Configure_failed;
     die $T2H_FAILURE_TEXT;
  }
  if (@ARGV > 1)
  {
     eval {Getopt::Long::Configure("no_pass_through");};
     if (! $options->getOptions($T2H_OBSOLETE_OPTIONS, $T2H_USAGE_TEXT, "$THISVERSION\n"))
     {
        print STDERR "$Configure_failed" if $Configure_failed;
        die $T2H_FAILURE_TEXT;
      }
  }
}
else
{
   Getopt::Long::Configure("gnu_getopt");
   my $opts;
   my @types;
   foreach my $key (keys(%$T2H_OPTIONS))
   {
      next unless ($T2H_OPTIONS->{$key});
      my $primary = $key;
      $primary =~ s/\|.*//;
      next if ($primary eq 'version' or $primary eq 'help');
      next if ($my_command_name eq 'makeinfo' and ! grep {$primary eq $_} (@makeinfo_options, @basic_options) and $primary !~ /^if/);
      #$opts{"$key$T2H_OPTIONS->{$key}->{'type'}"} = $T2H_OPTIONS->{$key}->{'linkage'};
      $opts->{$primary} = $T2H_OPTIONS->{$key}->{'linkage'} if defined($T2H_OPTIONS->{$key}->{'linkage'});
      push @types, "$key$T2H_OPTIONS->{$key}->{'type'}";
   }
   #$opts{'version|V'} = sub {
   $opts->{'version'} = sub {
      print "makeinfo (GNU texinfo) 4.13

Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.";
      exit 0;
   };
   #$opts{'help|h'} = sub {
   $opts->{'help'} = sub {
      print "$makeinfo_help";
      exit 0;
   };
   push @types, ('version|V', 'help|h');
   #foreach my $key (keys(%opts))
   #{
   #   print STDERR "$key, $opts{$key}\n";
   #}
   my $result_options = Getopt::Long::GetOptions ($opts, @types);
}

if (! $Texi2HTML::THISDOC{'format_from_command_line'} and defined($ENV{'TEXINFO_OUTPUT_FORMAT'}) and $ENV{'TEXINFO_OUTPUT_FORMAT'} ne '')
{
  Texi2HTML::Config::t2h_default_load_format($ENV{'TEXINFO_OUTPUT_FORMAT'}, 0); 
}

# $T2H_DEBUG and $T2H_VERBOSE are shorthands
$T2H_DEBUG = $Texi2HTML::Config::DEBUG;
$T2H_VERBOSE = $Texi2HTML::Config::VERBOSE;

#
# read texi2html extensions (if any)
# It is obsolete (obsoleted by -init-file). we keep it for backward
# compatibility.
my $extensions = 'texi2html.ext';  # extensions in working directory
if (-f $extensions)
{
    print STDERR "# reading extensions from $extensions\n" if $T2H_VERBOSE;
    require($extensions);
}
my $progdir;
($progdir = $0) =~ s/[^\/]+$//;
if ($progdir && ($progdir ne './'))
{
    $extensions = "${progdir}texi2html.ext"; # extensions in texi2html directory
    if (-f $extensions)
    {
	print STDERR "# reading extensions from $extensions\n" if $T2H_VERBOSE;
	require($extensions);
    }
}


#+++############################################################################
#                                                                              #
# evaluation of cmd line options
#                                                                              #
#---############################################################################

# set the default 'args' entry to normal for each style hash (and each command
# within)
my $name_index = -1;
my @hash_names = ('style_map', 'style_map_pre', 'style_map_texi', 'simple_format_style_map_texi');
foreach my $hash (\%Texi2HTML::Config::style_map, \%Texi2HTML::Config::style_map_pre, \%Texi2HTML::Config::style_map_texi, \%Texi2HTML::Config::simple_format_style_map_texi)
{
    $name_index++;
    my $name = $hash_names[$name_index]; # name associated with hash ref
    foreach my $style (keys(%{$hash}))
    {
        next unless (ref($hash->{$style}) eq 'HASH');
        $hash->{$style}->{'args'} = ['normal'] if (!exists($hash->{$style}->{'args'}));
        die "Bug: args not defined, but existing, for $style in $name" if (!defined($hash->{$style}->{'args'}));
#print STDERR "DEFAULT($name, $hash) add normal as arg for $style ($hash->{$style}), $hash->{$style}->{'args'}\n";
    }
}

# setup hashes used for html manual cross references in texinfo
my %cross_ref_texi_map = %Texi2HTML::Config::default_texi_map;
my %cross_transliterate_texi_map = %cross_ref_texi_map;

my %cross_ref_simple_map_texi = %Texi2HTML::Config::default_simple_map;
$cross_ref_simple_map_texi{"*"} = ' ';

my %cross_ref_style_map_texi = ();
my %cross_transliterate_style_map_texi = ();
Texi2HTML::Config::t2h_default_copy_style_map(\%Texi2HTML::Config::default_style_map_texi, \%cross_ref_style_map_texi);
Texi2HTML::Config::t2h_default_copy_style_map(\%Texi2HTML::Config::default_style_map_texi, \%cross_transliterate_style_map_texi);



# Fill in the %style_type hash, a hash associating style @-comand with 
# the type, 'accent', real 'style', 'simple_style', or 'special'.
# 'simple_style' styles don't extend accross lines.
my %style_type = (); 
my @simple_styles = ('ctrl', 'w', 'url','uref','indicateurl','email',
    'titlefont');
foreach my $style (keys(%Texi2HTML::Config::style_map))
{
    if (exists $Texi2HTML::Config::command_type{$style})
    {
        $style_type{$style} = $Texi2HTML::Config::command_type{$style};
        next;
    }
    if (ref($Texi2HTML::Config::style_map{$style} eq 'HASH'))
    {
        $style_type{$style} = $Texi2HTML::Config::style_map{$style}->{'type'}
          if (exists($Texi2HTML::Config::style_map{$style}->{'type'}));
    }
    else
    {
        $style_type{$style} = 'simple_style' if (grep {$_ eq $style} @simple_styles);
    }
    $style_type{$style} = 'style' unless (defined($style_type{$style}));
}

foreach my $accent (keys(%Texi2HTML::Config::unicode_accents), 'tieaccent', 'dotless')
{
    if (exists $Texi2HTML::Config::command_type{$accent})
    {
        $style_type{$accent} = $Texi2HTML::Config::command_type{$accent};
        next;
    }
    $style_type{$accent} = 'accent';
}




foreach my $special ('footnote', 'ref', 'xref', 'pxref', 'inforef', 'anchor', 'image', 'hyphenation')
{
    if (exists $Texi2HTML::Config::command_type{$special})
    {
        $style_type{$special} = $Texi2HTML::Config::command_type{$special};
        next;
    }
    $style_type{$special} = 'special';
}

# retro compatibility for $Texi2HTML::Config::EXPAND
push (@Texi2HTML::Config::EXPAND, $Texi2HTML::Config::EXPAND) if ($Texi2HTML::Config::EXPAND);

push (@Texi2HTML::Config::EXPAND, @Texi2HTML::Config::T2H_FORMAT_EXPAND);

# correct %Texi2HTML::Config::texi_formats_map based on command line and init
# variables
$Texi2HTML::Config::texi_formats_map{'menu'} = 'normal' if ($Texi2HTML::Config::SHOW_MENU);

foreach my $expanded (@Texi2HTML::Config::EXPAND)
{
    $Texi2HTML::Config::texi_formats_map{"if$expanded"} = 1 if (exists($Texi2HTML::Config::texi_formats_map{"if$expanded"}));
    next unless (exists($Texi2HTML::Config::texi_formats_map{$expanded}));
    if (grep {$_ eq $expanded} @raw_regions)
    {
         $Texi2HTML::Config::texi_formats_map{$expanded} = 'raw'; 
    }
    else
    {
         $Texi2HTML::Config::texi_formats_map{$expanded} = 'normal'; 
    }
}

# don't set set_no_line_macro for raw EXPAND formats 
foreach my $key (keys(%Texi2HTML::Config::texi_formats_map))
{
    unless ($Texi2HTML::Config::texi_formats_map{$key} eq 'raw')
    {
        set_no_line_macro($key, 1);
        set_no_line_macro("end $key", 1);
    }
}

# the remaining (not in @EXPAND) raw formats are set as 'raw' such that 
# they are propagated to formatting functions, but
# they don't start paragraphs or preformatted.
foreach my $raw (@raw_regions)
{
    if (!defined($Texi2HTML::Config::texi_formats_map{$raw}))
    {
        $Texi2HTML::Config::texi_formats_map{$raw} = 'raw'; 
        $Texi2HTML::Config::format_in_paragraph{$raw} = 1;
        set_no_line_macro($raw, 1);
        set_no_line_macro("end $raw", 1);
    }
}

# handle ifnot regions
foreach my $region (keys (%Texi2HTML::Config::texi_formats_map))
{
    next if ($region =~ /^ifnot/);
    if ($Texi2HTML::Config::texi_formats_map{$region} and $region =~ /^if(\w+)$/)
    {
        $Texi2HTML::Config::texi_formats_map{"ifnot$1"} = 0;
    }
}

if ($T2H_VERBOSE)
{
    print STDERR "# Expanded: ";
    foreach my $text_macro (keys(%Texi2HTML::Config::texi_formats_map))
    {
        print STDERR "$text_macro " if ($Texi2HTML::Config::texi_formats_map{$text_macro});
    }
    print STDERR "\n";
}

# This is kept in that file although it is html formatting as it seems to 
# be rather obsolete
$Texi2HTML::Config::INVISIBLE_MARK = '<img src="invisible.xbm" alt="">' if $Texi2HTML::Config::INVISIBLE_MARK eq 'xbm';

$T2H_DEBUG |= $DEBUG_TEXI if ($Texi2HTML::Config::DUMP_TEXI);

# no user provided USE_UNICODE, use configure provided
if (!defined($Texi2HTML::Config::USE_UNICODE))
{
    $Texi2HTML::Config::USE_UNICODE = '@USE_UNICODE@';
}

# no user provided nor configured, run time test
if ($Texi2HTML::Config::USE_UNICODE eq '@' .'USE_UNICODE@')
{
    eval {
        require Encode;
        require Unicode::Normalize; 
        Encode->import('encode');
    };
    if ($@)
    {
        $Texi2HTML::Config::USE_UNICODE = 0 
    }
    else
    {
        $Texi2HTML::Config::USE_UNICODE = 1;
    }
}

if ($Texi2HTML::Config::USE_UNICODE)
{
    require Encode;
    require Unicode::Normalize;
    Encode->import('encode');
}

# no user provided USE_UNIDECODE, use configure provided
if (!defined($Texi2HTML::Config::USE_UNIDECODE))
{
    $Texi2HTML::Config::USE_UNIDECODE = '@USE_UNIDECODE@';
}

# no user provided nor configured, run time test
if ($Texi2HTML::Config::USE_UNIDECODE eq '@' .'USE_UNIDECODE@')
{
    $Texi2HTML::Config::USE_UNIDECODE = 1;
    eval {
        require Text::Unidecode;
        Text::Unidecode->import('unidecode');
    };
    $Texi2HTML::Config::USE_UNIDECODE = 0 if ($@);
}

if ($Texi2HTML::Config::USE_UNIDECODE)
{
    require Text::Unidecode;
    Text::Unidecode->import('unidecode');
}

print STDERR "# USE_UNICODE $Texi2HTML::Config::USE_UNICODE, USE_UNIDECODE $Texi2HTML::Config::USE_UNIDECODE \n" 
  if ($T2H_VERBOSE);

# Construct hashes used for cross references generation
# Do it now as the user may have changed $USE_UNICODE

foreach my $key (keys(%Texi2HTML::Config::unicode_map))
{
    if ($Texi2HTML::Config::unicode_map{$key} ne '')
    {
        if ($Texi2HTML::Config::USE_UNICODE)
        {
             my $char_nr = hex($Texi2HTML::Config::unicode_map{$key});
             #$cross_ref_texi_map{$key} = chr(hex($Texi2HTML::Config::unicode_map{$key}));
             #$cross_ref_texi_map{$key} = pack("U0U*",hex($Texi2HTML::Config::unicode_map{$key}));
             if ($char_nr > 126 and $char_nr < 255)
             {
                 $cross_ref_texi_map{$key} = Encode::decode("iso-8859-1", chr($char_nr));
             }
             else
             {
                 $cross_ref_texi_map{$key} = chr($char_nr);
             }
             # cross_transliterate_texi_map is only used if 
             # USE_UNIDECODE is unset and TRANSLITERATE_FILE_NAMES is set
             if (exists ($Texi2HTML::Config::transliterate_map{$Texi2HTML::Config::unicode_map{$key}}))
             {
                $cross_transliterate_texi_map{$key} = $Texi2HTML::Config::transliterate_map{$Texi2HTML::Config::unicode_map{$key}};
             }
             else
             {
                 $cross_transliterate_texi_map{$key} = $cross_ref_texi_map{$key};
             }
        }
        else
        {
            $cross_ref_texi_map{$key} = '_' . lc($Texi2HTML::Config::unicode_map{$key});
             # cross_transliterate_texi_map is used if TRANSLITERATE_FILE_NAMES is set
             if (exists ($Texi2HTML::Config::transliterate_map{$Texi2HTML::Config::unicode_map{$key}}))
             {
                 $cross_transliterate_texi_map{$key} = $Texi2HTML::Config::transliterate_map{$Texi2HTML::Config::unicode_map{$key}};
             }
             else
             {
                  $cross_transliterate_texi_map{$key} = '_' . lc($Texi2HTML::Config::unicode_map{$key});
             }
        }
    }
}
#if ($Texi2HTML::Config::USE_UNICODE and $Texi2HTML::Config::TRANSLITERATE_FILE_NAMES
if ($Texi2HTML::Config::TRANSLITERATE_FILE_NAMES and (
    ($Texi2HTML::Config::USE_UNICODE and ! $Texi2HTML::Config::USE_UNIDECODE)
    or !$Texi2HTML::Config::USE_UNICODE))
{
    foreach my $key (keys (%Texi2HTML::Config::transliterate_accent_map))
    {
        $Texi2HTML::Config::transliterate_map{$key} = $Texi2HTML::Config::transliterate_accent_map{$key};
    }
}

foreach my $key (keys(%cross_ref_style_map_texi))
{
    if ($style_type{$key} eq 'accent' 
        and (ref($cross_ref_style_map_texi{$key}) eq 'HASH'))
    {
        if ($Texi2HTML::Config::USE_UNICODE)
        {
             $cross_ref_style_map_texi{$key}->{'function'} = \&Texi2HTML::Config::t2h_utf8_accent;
        }
        else
        {
             $cross_ref_style_map_texi{$key}->{'function'} = \&Texi2HTML::Config::t2h_nounicode_cross_manual_accent;
        }
        # this is only used if TRANSLITERATE_FILE_NAMES is set and USE_UNICODE
        # or USE_UNIDECODE is not set
        $cross_transliterate_style_map_texi{$key}->{'function'} = \&Texi2HTML::Config::t2h_transliterate_cross_manual_accent;
    }
}

if ($Texi2HTML::Config::L2H and defined($Texi2HTML::Config::OUTPUT_FORMAT) and $Texi2HTML::Config::OUTPUT_FORMAT eq 'html')
{
   push @Texi2HTML::Config::command_handler_init, \&Texi2HTML::LaTeX2HTML::init;
   push @Texi2HTML::Config::command_handler_process, \&Texi2HTML::LaTeX2HTML::latex2html;
   push @Texi2HTML::Config::command_handler_finish, \&Texi2HTML::LaTeX2HTML::finish;
   $Texi2HTML::Config::command_handler{'math'} = 
     { 'init' => \&Texi2HTML::LaTeX2HTML::to_latex, 
       'expand' => \&Texi2HTML::LaTeX2HTML::do_tex
     };
   $Texi2HTML::Config::command_handler{'tex'} = 
     { 'init' => \&Texi2HTML::LaTeX2HTML::to_latex, 
       'expand' => \&Texi2HTML::LaTeX2HTML::do_tex
     };
}

if ($Texi2HTML::Config::ENABLE_ENCODING)
{
   if ($Texi2HTML::Config::USE_UNICODE)
   {
      Texi2HTML::Config::t2h_enable_encoding_load();
   }
   else
   { # FIXME: only warn if ENABLE_ENCODING is set on the command line
      #warn "** --enable-encoding requires utf-8 support\n";
   }
}

# for all files
Texi2HTML::Config::set_conf('IN_ENCODING', $Texi2HTML::Config::IN_ENCODING);
Texi2HTML::Config::set_conf('DOCUMENT_ENCODING', $Texi2HTML::Config::DOCUMENT_ENCODING);

# Backward compatibility for deprecated $Texi2HTML::Config::ENCODING
$Texi2HTML::Config::ENCODING_NAME = $Texi2HTML::Config::ENCODING 
  if (!defined($Texi2HTML::Config::ENCODING_NAME) and defined($Texi2HTML::Config::ENCODING));

# APA: There's got to be a better way:
if ($Texi2HTML::Config::TEST)
{
    # to generate files similar to reference ones to be able to check for
    # real changes we use these dummy values if -test is given
    $THISPROG = 'texi2html';
    setlocale( LC_ALL, "C" );
} 

$Texi2HTML::GLOBAL{'debug_l2h'} = 1 if ($T2H_DEBUG & $DEBUG_L2H);

#
# can I use ISO8859 characters? (HTML+)
#
if ($Texi2HTML::Config::USE_ISO)
{
    foreach my $thing (keys(%Texi2HTML::Config::iso_symbols))
    {
         next unless exists ($::things_map_ref->{$thing});
         $::things_map_ref->{$thing} = $Texi2HTML::Config::iso_symbols{$thing};
         $::pre_map_ref->{$thing} = $Texi2HTML::Config::iso_symbols{$thing};
         $Texi2HTML::Config::simple_format_texi_map{$thing} = $Texi2HTML::Config::iso_symbols{$thing};
    }
    # we don't override the user defined quote, but beware that this works
    # only if the hardcoded defaults, '`' and "'" match with the defaults
    # in the default init file
    $Texi2HTML::Config::OPEN_QUOTE_SYMBOL = $Texi2HTML::Config::iso_symbols{'`'} 
        if (exists($Texi2HTML::Config::iso_symbols{'`'}) and ($Texi2HTML::Config::OPEN_QUOTE_SYMBOL eq '`'));
    $Texi2HTML::Config::CLOSE_QUOTE_SYMBOL = $Texi2HTML::Config::iso_symbols{"'"} 
       if (exists($Texi2HTML::Config::iso_symbols{"'"}) and ($Texi2HTML::Config::CLOSE_QUOTE_SYMBOL eq "'"));
}
 
# parse texinfo cnf file for external manual specifications. This was
# discussed on texinfo list but not in makeinfo for now. 
my @texinfo_htmlxref_files = locate_init_file ($texinfo_htmlxref, 1, \@texinfo_config_dirs);
foreach my $file (@texinfo_htmlxref_files)
{
    print STDERR "html refs config file: $file\n" if ($T2H_DEBUG);    
    unless (open (HTMLXREF, $file))
    {
         document_warn("Cannot open html refs config file ${file}: $!");
         next;
    }
    my $line_nr = 0;
    while (my $hline = <HTMLXREF>)
    {
        my $line = $hline;
        $line_nr++;
        $hline =~ s/[#]\s.*//;
        $hline =~ s/^\s*//;
        next if $hline =~ /^\s*$/;
        my @htmlxref = split /\s+/, $hline;
        my $manual = shift @htmlxref;
        my $split_or_mono = shift @htmlxref;
        if (!defined($split_or_mono) or ($split_or_mono ne 'split' and $split_or_mono ne 'mono'))
        {
            file_line_warn("Bad line", $file, $line_nr);
            next;
        }
        my $href = shift @htmlxref;
        next if (exists($Texi2HTML::GLOBAL{'htmlxref'}->{$manual}->{$split_or_mono}) and exists($Texi2HTML::GLOBAL{'htmlxref'}->{$manual}->{$split_or_mono}->{'href'}));
        
        if (defined($href))
        {
            $href =~ s/\/*$// if ($split_or_mono eq 'split');
            $Texi2HTML::GLOBAL{'htmlxref'}->{$manual}->{$split_or_mono}->{'href'} = $href;
        }
        else
        {
            $Texi2HTML::GLOBAL{'htmlxref'}->{$manual}->{$split_or_mono} = {};
        }
    }
    close (HTMLXREF);
}

if ($T2H_DEBUG)
{
    foreach my $manual (keys(%{$Texi2HTML::GLOBAL{'htmlxref'}}))
    {
         foreach my $split ('split', 'mono')
         {
              my $href = 'NO';
              next unless (exists($Texi2HTML::GLOBAL{'htmlxref'}->{$manual}->{$split}));
              $href = $Texi2HTML::GLOBAL{'htmlxref'}->{$manual}->{$split}->{'href'} if
                  exists($Texi2HTML::GLOBAL{'htmlxref'}->{$manual}->{$split}->{'href'});
              print STDERR "$manual: $split, href: $href\n";
         }
    }
}

# resulting files splitting
if ($Texi2HTML::Config::SPLIT =~ /section/i)
{
    $Texi2HTML::Config::SPLIT = 'section';
}
elsif ($Texi2HTML::Config::SPLIT =~ /node/i)
{
    $Texi2HTML::Config::SPLIT = 'node';
}
elsif ($Texi2HTML::Config::SPLIT =~ /chapter/i)
{
    $Texi2HTML::Config::SPLIT = 'chapter';
}
else
{
    $Texi2HTML::Config::SPLIT = '';
}

$Texi2HTML::Config::SPLIT_INDEX = 0 unless $Texi2HTML::Config::SPLIT;
$Texi2HTML::Config::NODE_FILENAMES = 1 if ((!defined($Texi2HTML::Config::NODE_FILENAMES) and $Texi2HTML::Config::SPLIT eq 'node') or $Texi2HTML::Config::NODE_FILES);

# Something like backward compatibility. This would make sense to keep 
# it ad-infinitum since the meaning of --out and --subdir are different.
if ($Texi2HTML::Config::SPLIT and defined($Texi2HTML::Config::SUBDIR)
    and ($Texi2HTML::Config::SUBDIR ne '') and 
   (!defined($Texi2HTML::Config::OUT) or ($Texi2HTML::Config::OUT eq '')))
{
    $Texi2HTML::Config::OUT = $Texi2HTML::Config::SUBDIR;
}

die "output to STDOUT and split or frames incompatible\n" 
    if (($Texi2HTML::Config::SPLIT or $Texi2HTML::Config::FRAMES) and ($Texi2HTML::Config::OUT eq '-'));

if ($Texi2HTML::Config::SPLIT and ($Texi2HTML::Config::OUT eq '.'))
{# This is to avoid trouble with latex2html
    $Texi2HTML::Config::OUT = '';
}

@Texi2HTML::Config::INCLUDE_DIRS = split(/$quoted_path_separator/,join($path_separator,@Texi2HTML::Config::INCLUDE_DIRS));
@Texi2HTML::Config::PREPEND_DIRS = split(/$quoted_path_separator/,join($path_separator,@Texi2HTML::Config::PREPEND_DIRS));

my @include_dirs_orig = @Texi2HTML::Config::INCLUDE_DIRS;

@Texi2HTML::Config::CONF_DIRS = split(/$quoted_path_separator/,join($path_separator,@Texi2HTML::Config::CONF_DIRS));
# extension
$Texi2HTML::GLOBAL{'extension'} = $Texi2HTML::Config::EXTENSION;
if ($Texi2HTML::Config::SHORTEXTN)
{
   $Texi2HTML::GLOBAL{'extension'} = "htm";
}

#
# file name business
#

my @created_directories = ();

my $docu_dir;            # directory of the document
my $docu_name;           # basename of the document
my $docu_rdir;           # directory for the output
my $docu_toc;            # document's table of contents
my $docu_stoc;           # document's short toc
my $docu_foot;           # document's footnotes
my $docu_about;          # about this document
my $docu_top;            # document top
my $docu_doc;            # document (or document top of split)
my $docu_frame;          # main frame file
my $docu_toc_frame;      # toc frame file
my $path_to_working_dir; # relative path leading to the working 
                         # directory from the document directory
my $docu_doc_file; 
my $docu_toc_file;
my $docu_stoc_file;
my $docu_foot_file;
my $docu_about_file;
my $docu_top_file;
my $docu_frame_file;
my $docu_toc_frame_file;

sub set_docu_names($$)
{
   my $docu_base_name = shift;
   my $file_nr = shift;
   if ($docu_base_name =~ /(.*\/)/)
   {
      $docu_dir = $1;
      chop($docu_dir);
      $docu_name = $docu_base_name;
      $docu_name =~ s/.*\///;
   }
   else
   {
      $docu_dir = '.';
      $docu_name = $docu_base_name;
   }

   @Texi2HTML::Config::INCLUDE_DIRS = @include_dirs_orig;
   my @prependended_include_directories = ('.');
   push @prependended_include_directories, $Texi2HTML::THISDOC{'input_directory'} if ($Texi2HTML::THISDOC{'input_directory'} ne '.');
   # as Karl said, adding the destination directory is confusing.
   #push @prependended_include_directories, $docu_dir if ($docu_dir ne '.' and $docu_dir ne $Texi2HTML::THISDOC{'input_directory'});
   unshift(@Texi2HTML::Config::INCLUDE_DIRS, @prependended_include_directories);
   unshift(@Texi2HTML::Config::INCLUDE_DIRS, @Texi2HTML::Config::PREPEND_DIRS);
# AAAA
   if ($Texi2HTML::Config::PREFIX and ($file_nr == 0))
   {
      $docu_name = $Texi2HTML::Config::PREFIX;
   }
   elsif ($docu_name eq '-')
   {
      $docu_name = $Texi2HTML::Config::STDIN_DOCU_NAME;
   }

# subdir
   $docu_rdir = '';
   my $null_output;
   if (defined($Texi2HTML::Config::OUT) and ($file_nr == 0) and $Texi2HTML::Config::null_device_file{$Texi2HTML::Config::OUT})
   { # this overrides the setting for this file.
      $Texi2HTML::THISDOC{'SPLIT'} = '';
      $Texi2HTML::THISDOC{'SPLIT_SIZE'} = undef;
      $null_output = 1;
      $path_to_working_dir = $docu_rdir;
   }
   if (!$null_output)
   {
      if (Texi2HTML::Config::get_conf('SPLIT'))
      {
         if (defined($Texi2HTML::Config::OUT) and ($file_nr == 0))
         {
            $docu_rdir = $Texi2HTML::Config::OUT;
         }
         else
         {
            $docu_rdir = $docu_name;
         }
         if ($docu_rdir ne '')
         {
            $docu_rdir =~ s|/*$||;
            $docu_rdir .= '/'; 
         }
      }
      else
      {
         my $out_file;
# AAAA
      # even if the out file is not set by OUT, in case it is not the first
      # file, the out directory is still used. This is only used to determine
      # the directory, the out file itself is set below
         if (defined($Texi2HTML::Config::OUT) and $Texi2HTML::Config::OUT ne '')
         {
            $out_file = $Texi2HTML::Config::OUT;
         }
         else
         {
            $out_file = $docu_name;
         }

         if ($out_file =~ m|(.*)/|)
         {# there is a leading directories
            $docu_rdir = "$1/";
         }
      }
   
      if ($docu_rdir ne '')
      {
         unless (-d $docu_rdir)
         {
            if ( mkdir($docu_rdir, oct(755)))
            {
               print STDERR "# created directory $docu_rdir\n" if ($T2H_VERBOSE);
               push @created_directories, $docu_rdir;
            }
            else
            {
               document_error ("Can't create directory $docu_rdir", 1);
            }
        }
        print STDERR "# putting result files into directory $docu_rdir\n" if ($T2H_VERBOSE);
      }
      else
      {
         print STDERR "# putting result files into current directory \n" if ($T2H_VERBOSE);
      }
      # We don't use "./" as $docu_rdir when $docu_rdir is the current directory
      # because it is problematic for latex2html. To test writability with -w, 
      # however we need a real directory.
      my $result_rdir = $docu_rdir;
      $result_rdir = "." if ($docu_rdir eq '');
      unless (-w $result_rdir)
      {
         $docu_rdir = 'current directory' if ($docu_rdir eq '');
         document_error ("$docu_rdir not writable", 1);
      }
   
      # relative path leading to the working directory from the document directory
      $path_to_working_dir = $docu_rdir;
      if ($docu_rdir ne '')
      {
         my $cwd = cwd;
         my $docu_path = $docu_rdir;
         $docu_path = $cwd . '/' . $docu_path unless ($docu_path =~ /^\//);
         my @result = ();
         # this code simplify the paths. The cwd is absolute, while in the 
         # document path there may be some .., a .. is removed with the 
         # previous path element, such that something like
         # /cwd/directory/../somewhere/
         # leads to
         # /cwd/somewhere/
         # with directory/.. removed
         foreach my $element (split /\//, File::Spec->canonpath($docu_path))
         {
            if ($element eq '')
            {
               push @result, '';
            }
            elsif ($element eq '..')
            {
               if (@result and ($result[-1] eq ''))
               {
                  print STDERR "Too much .. in absolute file name\n";
               }
               elsif (@result and ($result[-1] ne '..'))
               {
                  pop @result;
               }
               else
               {
                  push @result, $element;
               }
            }
            else
            {
               push @result, $element;
            }
         }
         $path_to_working_dir = File::Spec->abs2rel($cwd, join ('/', @result));
         # this should not be needed given what canonpath does
         $path_to_working_dir =~ s:/*$::;
         $path_to_working_dir .= '/' unless($path_to_working_dir eq '');
      }
   }
   
   my $docu_ext = $Texi2HTML::THISDOC{'extension'};
   # out_dir is undocummented, should never be used, use destination_directory
   $Texi2HTML::THISDOC{'out_dir'} = $docu_rdir;

   $Texi2HTML::THISDOC{'destination_directory'} = $docu_rdir;
   $Texi2HTML::THISDOC{'file_base_name'} = $docu_name;

   $docu_doc = $docu_name . (defined($docu_ext) ? ".$docu_ext" : ""); # document's contents
   if (Texi2HTML::Config::get_conf('SPLIT') and $Texi2HTML::Config::NODE_FILENAMES)
   {
      if (defined($Texi2HTML::Config::TOP_NODE_FILE))
      {
         $docu_doc = $Texi2HTML::Config::TOP_NODE_FILE;
         if (defined($Texi2HTML::Config::NODE_FILE_EXTENSION) and $Texi2HTML::Config::NODE_FILE_EXTENSION ne '')
         {
            $docu_doc .= ".$Texi2HTML::Config::NODE_FILE_EXTENSION";
         }
      }
   }
   if (Texi2HTML::Config::get_conf('SPLIT'))
   {
# AAAA
      if (defined($Texi2HTML::Config::TOP_FILE) and ($Texi2HTML::Config::TOP_FILE ne '') and ($file_nr == 0))
      {
         $docu_top = $Texi2HTML::Config::TOP_FILE;
      }
   }
   else
   {
# AAAA
      if (defined($Texi2HTML::Config::OUT) and ($file_nr == 0))
      {
         my $out_file = $Texi2HTML::Config::OUT;
         if ($out_file eq '-')
         {
            $Texi2HTML::THISDOC{'SPLIT'} = '';
            $Texi2HTML::THISDOC{'SPLIT_SIZE'} = undef;
         }
         $out_file =~ s|.*/|| unless ($null_output);
         $docu_doc = $out_file if ($out_file !~ /^\s*$/);
      }
   }

   if (defined $Texi2HTML::Config::element_file_name)
   {
      my $docu_doc_set = &$Texi2HTML::Config::element_file_name
        (undef, 'doc', $docu_name);
      $docu_doc = $docu_doc_set if (defined($docu_doc_set));
   } 
   $docu_top = $docu_doc if (!defined($docu_top));

   if (Texi2HTML::Config::get_conf('SPLIT') or !$Texi2HTML::Config::MONOLITHIC)
   {
      if (defined $Texi2HTML::Config::element_file_name)
      {
         $docu_toc = &$Texi2HTML::Config::element_file_name
            (undef, 'toc', $docu_name);
         $docu_stoc = &$Texi2HTML::Config::element_file_name
            (undef, 'stoc', $docu_name);
         $docu_foot = &$Texi2HTML::Config::element_file_name
            (undef, 'foot', $docu_name);
         $docu_about = &$Texi2HTML::Config::element_file_name
            (undef, 'about', $docu_name);
	# $docu_top may be overwritten later.
      }
      if (!defined($docu_toc))
      {
         my $default_toc = "${docu_name}_toc";
         $default_toc .= ".$docu_ext" if (defined($docu_ext));
# AAAA
      if (defined($Texi2HTML::Config::TOC_FILE) and ($Texi2HTML::Config::TOC_FILE ne '') and ($file_nr == 0))
         {
            $docu_toc = $Texi2HTML::Config::TOC_FILE;
         }
         else
         {
            $docu_toc = $default_toc;
         }
      }
      if (!defined($docu_stoc))
      {
         $docu_stoc  = "${docu_name}_ovr";
         $docu_stoc .= ".$docu_ext" if (defined($docu_ext));
      }
      if (!defined($docu_foot))
      {
         $docu_foot  = "${docu_name}_fot";
         $docu_foot .= ".$docu_ext" if (defined($docu_ext));
      }
      if (!defined($docu_about))
      {
         $docu_about = "${docu_name}_abt";
         $docu_about .= ".$docu_ext" if (defined($docu_ext));
      }
   }
   else
   {
      $docu_toc = $docu_foot = $docu_stoc = $docu_about = $docu_doc;
   }

   # Note that file extension has already been added here.
   if ($Texi2HTML::Config::FRAMES)
   {
      if (defined $Texi2HTML::Config::element_file_name)
      {
         $docu_frame = &$Texi2HTML::Config::element_file_name
            (undef, 'frame', $docu_name);
         $docu_toc_frame = &$Texi2HTML::Config::element_file_name
           (undef, 'toc_frame', $docu_name);
      }
   }

   if (!defined($docu_frame))
   {
      $docu_frame = "${docu_name}_frame";
      $docu_frame .= ".$docu_ext" if (defined($docu_ext));
   }
   if (!defined($docu_toc_frame))
   {
      $docu_toc_frame  = "${docu_name}_toc_frame";
      $docu_toc_frame .= ".$docu_ext" if (defined($docu_ext));
   }

   if ($T2H_VERBOSE)
   {
      print STDERR "# Files and directories:\n";
      print STDERR "# rdir($docu_rdir) path_to_working_dir($path_to_working_dir)\n";
      print STDERR "# doc($docu_doc) top($docu_top) toc($docu_toc) stoc($docu_stoc)\n";
      print STDERR "# foot($docu_foot) about($docu_about) frame($docu_toc) toc_frame($docu_toc_frame)\n";
   }

   $docu_doc_file = "$docu_rdir$docu_doc";
   $docu_toc_file  = "$docu_rdir$docu_toc";
   $docu_stoc_file = "$docu_rdir$docu_stoc";
   $docu_foot_file = "$docu_rdir$docu_foot";
   $docu_about_file = "$docu_rdir$docu_about";
   $docu_top_file  = "$docu_rdir$docu_top";
   $docu_frame_file = "$docu_rdir$docu_frame";
   $docu_toc_frame_file = "$docu_rdir$docu_toc_frame";

# For use in init files
   $Texi2HTML::THISDOC{'filename'}->{'top'} = $docu_top;
   $Texi2HTML::THISDOC{'filename'}->{'foot'} = $docu_foot;
   $Texi2HTML::THISDOC{'filename'}->{'stoc'} = $docu_stoc;
   $Texi2HTML::THISDOC{'filename'}->{'about'} = $docu_about;
   $Texi2HTML::THISDOC{'filename'}->{'toc'} = $docu_toc;
   $Texi2HTML::THISDOC{'filename'}->{'toc_frame'} = $docu_toc_frame;
   $Texi2HTML::THISDOC{'filename'}->{'frame'} = $docu_frame;
}

sub var_to_str($)
{
    return 'UNDEF' if (!defined($_[0]));
    return $_[0];
}

#
# Common initializations
#

sub texinfo_initialization($)
{
    my $pass = shift;

    # set the translations now. This means at the beginning of each pass.
    # Do it silently, except during the last pass.
    my $lang = Texi2HTML::Config::get_conf('documentlanguage');
    my $silent_lang = 1 if ($pass != 2);
    if (!set_document_language($lang, $silent_lang))
    {
       document_warn ("Translations for '$lang' not found. Using 'en'.") unless ($silent_lang);
       set_document_language('en', $silent_lang);
    }
    # All the initialization used the informations still there at the 
    # end of the previous pass.
    # Now we reset everything, such that things are used when they happen.
    # also reset the @set/@clear values.
    %value = %value_initial;
    foreach my $init_mac ('everyheading', 'everyfooting', 'evenheading', 
        'evenfooting', 'oddheading', 'oddfooting', 'headings', 
        'allowcodebreaks', 'frenchspacing', 'exampleindent', 
        'firstparagraphindent', 'paragraphindent', 'clickstyle', 
        'novalidate', 'documentlanguage')
    {
        Texi2HTML::Config::set_conf($init_mac, undef, 1);
    }
}

#+++###########################################################################
#                                                                             #
# Pass texi: read source, handle variable, ignored text,                      #
#                                                                             #
#---###########################################################################

#my @lines = ();             # whole document
#my @lines_numbers = ();     # line number, originating file associated with 
                            # whole document 
my $macros = undef;         # macros. reference on a hash
my %info_enclose = ();      # macros defined with definfoenclose
my @floats = ();            # floats list
my %floats = ();            # floats by style

sub initialise_state_texi($)
{
    my $state = shift;
    $state->{'texi'} = 1;           # for substitute_text and close_stack: 
                                    # 1 if pass_texi/scan_texi is to be used
    $state->{'macro_inside'} = 0 unless(defined($state->{'macro_inside'}));
    $state->{'ifvalue_inside'} = 0 unless(defined($state->{'ifvalue_inside'}));
    $state->{'arg_expansion'} = 0 unless(defined($state->{'arg_expansion'}));
    $state->{'files_stack'} = [] unless(defined($state->{'files_stack'}));
}


sub pass_texi($)
{
    my $input_file_name = shift;
    #my $texi_line_number = { 'file_name' => '', 'line_nr' => 0, 'macro' => '' };

    my @lines = ();             # whole document
    my @lines_numbers = ();     # line number, originating file associated with 
                                # whole document 
    my @first_lines = ();
    my $first_lines = 1;        # is it the first lines
    my $state = {};
                                # holds the informations about the context
                                # to pass it down to the functions
    my @command_line_lines = @Texi2HTML::Config::COMMANDS;
    initialise_state_texi($state);
    my $texi_line_number;
    ($texi_line_number, $state->{'input_spool'}) = 
          open_file($input_file_name, '', $state->{'files_stack'});
    my @stack;
    my $text;
    my $cline;
 INPUT_LINE: while (1)
    {
        ($cline, $state->{'input_spool'}) = next_line($texi_line_number, $state->{'files_stack'});
        last if (!defined($cline));
        #
        # remove the lines preceding \input or an @-command
        # 
        if ($first_lines)
        {
            if ($cline =~ /^\\input/)
            {
                push @first_lines, $cline;
                $first_lines = 0;
                next;
            }
            if ($cline =~ /^\s*\@/)
            {
                $first_lines = 0;
            }
            else
            {
                push @first_lines, $cline;
                next;
            }
        }
	#print STDERR "PASS_TEXI($texi_line_number->{'line_nr'})$cline";
        my $chomped_line = $cline;
        if (scan_texi ($cline, \$text, \@stack, $state, $texi_line_number) and chomp($chomped_line))
        {
        #print STDERR "==> new page (line_nr $texi_line_number->{'line_nr'},$texi_line_number->{'file_name'},$texi_line_number->{'macro'})\n";
            push (@lines_numbers, { 'file_name' => $texi_line_number->{'file_name'},
                  'line_nr' => $texi_line_number->{'line_nr'},
                  'macro' => $texi_line_number->{'macro'} });
        }
        #dump_stack (\$text, \@stack, $state);
        if ($state->{'bye'})
        {
            #dump_stack(\$text, \@stack, $state);
            # close stack after bye
            #print STDERR "close stack after bye\n";
            close_stack_texi(\$text, \@stack, $state, $texi_line_number);
            #dump_stack(\$text, \@stack, $state);
        }
        next if (@stack);
        $cline = $text;
        $text = '';
        if (!defined($cline))
        {
            msg_debug ("\$cline undefined after scan_texi", $texi_line_number);
            next unless ($state->{'bye'});
        }
        push @lines, split_lines($cline);
        last if ($state->{'bye'});
    }
    # close stack at the end of pass texi
    #print STDERR "close stack at the end of pass texi\n";
    close_stack_texi(\$text, \@stack, $state, $texi_line_number);
    push @lines, split_lines($text);
    print STDERR "# end of pass texi\n" if $T2H_VERBOSE;
    return (\@lines, \@first_lines, \@lines_numbers);
}

#+++###########################################################################
#                                                                             #
# Pass structure: parse document structure                                    #
#                                                                             #
#---###########################################################################

sub initialise_state_structure($)
{
    my $state = shift;
    $state->{'structure'} = 1;      # for substitute_text and close_stack: 
                                    # 1 if pass_structure/scan_structure is 
                                    # to be used
    $state->{'menu'} = 0;           # number of opened menus
    $state->{'detailmenu'} = 0;     # number of opened detailed menus      
    $state->{'direntry'} = 0;     # number of opened direntry  
    $state->{'sectionning_base'} = 0;         # current base sectionning level
    $state->{'table_stack'} = [ "no table" ]; # a stack of opened tables/lists
    # seems to be only debug
    if (exists($state->{'region_lines'}) and !defined($state->{'region_lines'}))
    {
        delete ($state->{'region_lines'});
        print STDERR "Bug: state->{'region_lines'} exists but undef.\n";
    }
}
# This is a virtual element for things appearing before @node and 
# sectionning commands
my $element_before_anything;

#
# initial counters. Global variables for pass_structure.
#
my $document_idx_num;
my $document_sec_num;
my $document_head_num;
my $document_anchor_num;

# section to level hash not taking into account raise and lower sections
my %sec2level;
# initial state for the special regions.
my %region_initial_state;
my %region_lines;
my %region_line_nrs;

# This is a place for index entries, anchors and so on appearing in 
# copying or documentdescription
my $no_element_associated_place;


my @nodes_list;             # nodes in document reading order
                            # each member is a reference on a hash
my @sections_list;          # sections in reading order
                            # each member is a reference on a hash
my @all_elements;           # sectionning elements (nodes and sections)
                            # in reading order. Each member is a reference
                            # on a hash which also appears in %nodes,
                            # @sections_list @nodes_list, @elements_list
my @elements_list;          # all the resulting elements in document order
my %sections;               # sections hash. The key is the section number
my %headings;               # headings hash. The key is the heading number
my $section_top;            # @top section
my $element_top;            # Top element
my $node_top;               # Top node
my $node_first;             # First node
my $element_index;          # element with first index
my $element_chapter_index;  # chapter with first index
my $element_first;          # first element
my $element_last;           # last element
my %special_commands;       # hash for the commands specially handled 
                            # by the user 

# element for content and shortcontent if on a separate page
my %content_element;
my %reference_content_element =
   (
     'contents' => { 'id' => $Texi2HTML::Config::misc_pages_targets{'Contents'},
         'target' => $Texi2HTML::Config::misc_pages_targets{'Contents'},
         'contents' => 1, 'texi' => '_contents' },
     'shortcontents' => { 
        'id' => $Texi2HTML::Config::misc_pages_targets{'Overview'}, 
        'target' => $Texi2HTML::Config::misc_pages_targets{'Overview'}, 
        'shortcontents' => 1, 'texi' => '_shortcontents' },
   );

# holds content elements located with @*contents commands
my %all_content_elements;

# common code for headings and sections
sub new_section_heading($$$$)
{
    my $command = shift;
    my $name = shift;
    my $state = shift;
    my $line_nr = shift;
    
    $name = trim_comment_spaces ($name, "\@$command", $line_nr);
    $name = normalise_texi_space($name);
    $name = '' if (!defined($name));
    # no increase if in @copying and the like. Also no increase if it is top
    # since top has number 0.
    my $docid;
    my $num;

    my $section_ref = { 'texi' => $name,
       'level' => $sec2level{$command},
       'tag' => $command,
    };
    return $section_ref;
}

# returns (
sub scan_line_separators($$$;$)
{
    my $line = shift;
    my $separators = shift;
    my $context = shift;
    my $line_nr = shift;

    my @command_stack;
    my $result = '';
    while (1)
    {
        # macro_regexp
        if ($line =~ s/^([^{}\@$separators]*)\@(["'~\@\}\{,\.!\?\s\*\-\^`=:\|\/\\])// or $line =~ s/^([^{}\@$separators]*)\@([a-zA-Z][\w-]*)//)
        {
            $result .= $1;
            my $command = $2;
            $command = $alias{$command} if (exists($alias{$command}));
            if (defined($Texi2HTML::Config::misc_command{$command}))
            {
               if ($command ne 'c' and $command ne 'comment')
               { # misc commands other than comments are kept as-is, only 
                 # comments are removed.
                   my ($text, $args);
                   ($line, $text, $args) = &$Texi2HTML::Config::preserve_misc_command($line, $command);
                   $result .= "\@$command".$text;
                   next;
               }
               else
               {
                   $line =~ s/.*//;
                   return ($result, $line, undef);
               }
            }
            $result .= "\@$command";
            if ($line =~ s/^{//)
            {
                push @command_stack, $command;
                $result .= '{';
            }
            if ($command eq 'verb')
            {
               if ($line =~ s/^(.)//)
               {
                  my $char = $1;
                  my $verb_char = quotemeta($char);
                  if ($line =~ s/^(.*?${verb_char}\})//)
                  {
                     $result .= $char.$1;
                  }
                  else
                  {
                     $line =~ s/^(.*)//;
                     $result .= $char . $1;
                     return ($result, $line, undef);
                  }
               }
               else
               {
                  return ($result, $line, undef);
               }
               pop @command_stack;
            }
        }
        elsif ($line =~ s/^([^\{\}$separators]*)([{}])//)
        {
            $result .= $1 . $2;
            my $brace = $2;
            if (@command_stack and $brace eq '}')
            {
                pop @command_stack;
            }
        }
        elsif ($separators ne '' and $line =~ s/^([^${separators}]*)([$separators])//)
        {
            $result .= $1;
            my $separator = $2;
            if (@command_stack)
            { 
                $result .= $separator;
            }
            else
            {
                return ($result, $line, $separator);
            }
        }
        else 
        {
            $result .= $line;
            $line = '';
            return ($result, $line, undef);
        }
    }
}

sub trim_comment_spaces($$;$)
{
    my $line = shift;
    my $context = shift;
    my $line_nr = shift;

    if(!defined($line))
    {
        msg_debug("trim_comment_spaces: $context: line undef", $line_nr);
        return undef; 
    }
    my ($arg, $remaining, $separator) = scan_line_separators ($line, '', $context, $line_nr);
    #msg_debug ("trim_comment_spaces: $context: arg undef. $line", $line_nr) if (!defined($arg));
    #msg_debug ("trim_comment_spaces: $context: $arg !!! $line", $line_nr);
    return $arg if (!defined($arg));
    return  trim_around_spaces($arg);
}

# argument may be the number of arguments when the commas in the last 
# argument has no specific meaning. When it is undef it means that
# all the arguments have to be parsed
sub parse_line_arguments($$$;$)
{
    my $line = shift;
    my $arg_total_nr = shift;
    my $context = shift;
    my $line_nr = shift;

    my @args;
    my $arg_nr = 0;
    my $remaining = $line;

    while (!defined($arg_total_nr) or $arg_nr < $arg_total_nr -1)
    {
        my ($arg, $separator);
        ($arg, $remaining, $separator) = scan_line_separators($remaining, ',', $context, $line_nr);
        push @args, trim_around_spaces($arg) if (defined($arg));
        return @args if (!defined($separator) or !defined($remaining) or !defined($arg));
        $arg_nr++;
    }
    if (defined($arg_total_nr))
    {
        my ($last_arg, $separator);
        ($last_arg, $remaining, $separator) = scan_line_separators($remaining, '', $context, $line_nr);
        push @args, trim_around_spaces($last_arg) if (defined($last_arg));
    }
    return @args;
}

sub pass_structure($$)
{
    my $texi_lines = shift;
    my $lines_numbers = shift;

    my @doc_lines;              # whole document
    my @doc_numbers;            # whole document line numbers and file names

    my $state = {};
                                # holds the informations about the context
                                # to pass it down to the functions
    initialise_state_structure($state);
    $state->{'heading_element'} = $element_before_anything;
    $state->{'current_element'} = $element_before_anything;
    $state->{'place'} = $element_before_anything->{'place'};
    my @stack;
    my $text;
    my $line_nr;

    while (@$texi_lines or $state->{'in_deff_line'})
    {
        my $cline = shift @$texi_lines;
        my $chomped_line = $cline;
        if (@$texi_lines and !chomp($chomped_line))
        {
             $texi_lines->[0] = $cline . $texi_lines->[0];
             next;
        }
        # !defined($cline) may happen if $state->{'in_deff_line'} is true 
        # but there is no more line, in case the last end of line is
        # protected
        $line_nr = shift (@$lines_numbers) unless (!defined($cline));

        if ($state->{'in_deff_line'})
        { # line stored in $state->{'in_deff_line'} was protected by @
          # and can be concatenated with the next line
            if (defined($cline))
            {
                $cline = $state->{'in_deff_line'} . $cline;
            }
            else
            {# end of line protected at the very end of the file
             # in that case there is also no line_nr anymore.
                $cline = $state->{'in_deff_line'};
            }
            delete $state->{'in_deff_line'};
        }

        #print STDERR "PASS_STRUCTURE: $cline";
        if (!$state->{'raw'} and !$state->{'verb'})
        {
            my $tag = '';
            if ($cline =~ /^\s*\@(\w+)\b/)
            {
                $tag = $1;
            }

            #
            # analyze the tag
            #
            if ($tag and $tag eq 'node' or (defined($sec2level{$tag}) and ($tag !~ /heading/)) or ($tag eq 'insertcopying' and $Texi2HTML::Config::INLINE_INSERTCOPYING))
            {
                my @added_lines = ($cline);
                my @added_numbers = ($line_nr);
                if ($tag eq 'node' or defined($sec2level{$tag}))
                {# in pass structure node shouldn't appear in formats
                    close_stack_structure(\$text, \@stack, $state, $line_nr);
                    if (exists($state->{'region_lines'}))
                    {
                        push @{$region_lines{$state->{'region_lines'}->{'format'}}}, split_lines($text);
                        push @doc_lines, split_lines($text) if ($Texi2HTML::Config::region_formats_kept{$state->{'region_lines'}->{'format'}});
                        $state->{'region_lines'}->{'number'} = 0;
                        close_region($state); 
                    }
                    else
                    {
                        push @doc_lines, split_lines($text);
                    }
                    $text = '';
                }
                if ($tag eq 'node')
                {
                    my $node_ref;
                    my $auto_directions;
                    my $node_line = $cline;
                    $node_line =~ s/^\@node\s+//;
                    my @node_res = parse_line_arguments($node_line, undef, '@node', $line_nr);
                    @node_res = normalise_node_array (\@node_res);
                    line_error ("Error scanning $cline", $line_nr) if (@node_res < 1);
                    $auto_directions = 1 if (scalar(@node_res) == 1);
                    if (@node_res > 4)
                    {
                        line_warn("Superfluous arguments for node", $line_nr);
                    }
                    my ($node, $node_next, $node_prev, $node_up) = @node_res;
                    if (defined($node) and ($node ne ''))
                    {
                        if (exists($nodes{$node}) and defined($nodes{$node})
                             and $nodes{$node}->{'seen'})
                        {
                            line_error ("Node `$node' previously defined ".format_line_number($nodes{$node}->{'line_nr'}), $line_nr);
                            next;
                        }
                        elsif ($node =~ /^\(.+\)/)
                        {
                            line_error ("Syntax for an external node used for `$node'", $line_nr);
                            next;
                        }
                        else
                        {
                            if (exists($nodes{$node}) and defined($nodes{$node}))
                            { # node appeared in a menu
                                $node_ref = $nodes{$node};
                            }
                            else
                            {
                                $node_ref = {};
                                $nodes{$node} = $node_ref;
                            }
                            $node_ref->{'node'} = 1;
                            $node_ref->{'tag'} = 'node';
                            $node_ref->{'tag_level'} = 'node';
                            $node_ref->{'texi'} = $node;
                            $node_ref->{'seen'} = 1;
                            $node_ref->{'automatic_directions'} = $auto_directions;
                            $node_ref->{'place'} = [];
                            $node_ref->{'current_place'} = [];
                            $node_ref->{'line_nr'} = $line_nr;
                            merge_element_before_anything($node_ref);
                            $node_ref->{'index_names'} = [];
                            $state->{'place'} = $node_ref->{'current_place'};
                            $state->{'heading_element'} = $node_ref;
                            $state->{'current_element'} = $node_ref;
                            $state->{'node_ref'} = $node_ref;
                            # makeinfo treats differently case variants of
                            # top in nodes and anchors and in refs commands and 
                            # refs from nodes. 
                            if ($node =~ /^top$/i)
                            {
                                if (!defined($node_top))
                                {
                                    $node_top = $node_ref;
                                    $node_top->{'texi'} = 'Top';
                                    delete $nodes{$node};
                                    $nodes{$node_top->{'texi'}} = $node_ref;
                                }
                                else
                                { # All the refs are going to point to the first Top
                                    line_warn ("Top node already exists", $line_nr);
                                }
                            }
                            unless (@nodes_list)
                            {
                                $node_first = $node_ref;
                            }
                            push (@nodes_list, $node_ref);
                            push @all_elements, $node_ref;
                        }
                    }
                    else
                    {
                        #line_error ("Node is undefined: $cline (eg. \@node NODE-NAME, NEXT, PREVIOUS, UP)", $line_nr);
                        next;
                    }

                    if (defined($node_next) and ($node_next ne ''))
                    {
                        $node_ref->{'node_next'} = $node_next;
                    }
                    if (defined($node_prev) and ($node_prev ne ''))
                    {
                        $node_ref->{'node_prev'} = $node_prev;
                    }
                    if (defined($node_up) and ($node_up ne ''))
                    { 
                        $node_ref->{'node_up'} = $node_up;
                    }
                }
                elsif (defined($sec2level{$tag}))
                { # section
                    if ($cline =~ /^\@$tag\s*(.*)$/)
                    {
                        my $name = $1;
                        my $section_ref = new_section_heading($tag, $name, $state, $line_nr);
                        $document_sec_num++ if ($tag ne 'top');
                        
                        $section_ref->{'sec_num'} = $document_sec_num;
                        $section_ref->{'id'} = "SEC$document_sec_num";
                        $section_ref->{'seen'} = 1;
                        $section_ref->{'index_names'} = [];
                        $section_ref->{'current_place'} = [];
                        $section_ref->{'place'} = [];
                        $section_ref->{'section'} = 1;
                        $section_ref->{'line_nr'} = $line_nr;

                        if ($tag eq 'top')
                        {
                            $section_ref->{'number'} = '';
                            $section_ref->{'id'} = "SEC_Top";
                            $section_ref->{'sec_num'} = 0;
                            $sections{0} = $section_ref;
                            $section_top = $section_ref;
                        }
                        else
                        {
                            $sections{$section_ref->{'sec_num'}} = $section_ref;
                        }
                        merge_element_before_anything($section_ref);
                        if ($state->{'node_ref'})
                        {
                            $section_ref->{'node_ref'} = $state->{'node_ref'};
                            push @{$state->{'node_ref'}->{'sections'}}, $section_ref;
                        }
                        if ($state->{'node_ref'} and !exists($state->{'node_ref'}->{'with_section'}))
                        {
                            my $node_ref = $state->{'node_ref'};
                            $section_ref->{'with_node'} = $node_ref;
                            $section_ref->{'titlefont'} = $node_ref->{'titlefont'};
                            $node_ref->{'with_section'} = $section_ref;
                        }
                        if (! $name and $section_ref->{'level'})
                        {
                            line_warn ("$tag without name", $line_nr);
                        }
                        push @sections_list, $section_ref;
                        push @all_elements, $section_ref;
                        $state->{'heading_element'} = $section_ref;
                        $state->{'current_element'} = $section_ref;
                        $state->{'place'} = $section_ref->{'current_place'};
                        ################# debug 
                        my $node_ref = "NO NODE";
                        my $node_texi ='';
                        if ($state->{'node_ref'})
                        {
                            $node_ref = $state->{'node_ref'};
                            $node_texi = $state->{'node_ref'}->{'texi'};
                        }
                        print STDERR "# pass_structure node($node_ref)$node_texi, tag \@$tag($section_ref->{'level'}) ref $section_ref, num,id $section_ref->{'sec_num'},$section_ref->{'id'}\n   $name\n"
                           if $T2H_DEBUG & $DEBUG_ELEMENTS;
                        ################# end debug 
                    }
                }
                elsif ($cline =~ /^\@insertcopying\s*/)
                {
                    @added_lines = @{$region_lines{'copying'}};
                    @added_numbers = @{$region_line_nrs{'copying'}};
                    unshift (@$texi_lines, @added_lines);
                    unshift (@$lines_numbers, @added_numbers);
                    next;
                }
                if (exists($state->{'region_lines'}))
                {
                    push @{$region_lines{$state->{'region_lines'}->{'format'}}}, @added_lines;
                    if ($Texi2HTML::Config::region_formats_kept{$state->{'region_lines'}->{'format'}})
                    { # the region is kept in the document in addition with
                      # being put in the appropriate region_lines entry.
                        push @doc_lines, @added_lines;
                        push @doc_numbers, @added_numbers;
                    }
                }
                else
                {
                    push @doc_lines, @added_lines;
                    push @doc_numbers, @added_numbers;
                }
                next;
            }
        }
        if (scan_structure ($cline, \$text, \@stack, $state, $line_nr))
        {
            if (!exists($state->{'region_lines'}) or $Texi2HTML::Config::region_formats_kept{$state->{'region_lines'}->{'format'}})
            {
                 push (@doc_numbers, $line_nr);
            }
            if (exists($state->{'region_lines'}))
            {
                 push @{$region_line_nrs{$state->{'region_lines'}->{'format'}}}, $line_nr unless ($state->{'region_lines'}->{'first_line'});
            }
        }
        next if (scalar(@stack) or $state->{'in_deff_line'});
        $cline = $text;
        $text = '';
        next if (!defined($cline));
        if ($state->{'region_lines'})
        {
            # the first line is like @copying, it is not put in the region
            # lines
            push @{$region_lines{$state->{'region_lines'}->{'format'}}}, split_lines($cline) unless ($state->{'region_lines'}->{'first_line'});
            delete $state->{'region_lines'}->{'first_line'};
            push @doc_lines, split_lines($cline) if ($Texi2HTML::Config::region_formats_kept{$state->{'region_lines'}->{'format'}});
        }
        else
        {
            push @doc_lines, split_lines($cline);
        }
    }
    if (@stack)
    {# close stack at the end of pass structure
        close_stack_structure(\$text, \@stack, $state, $line_nr);
        if ($text)
        {
            if (!exists($state->{'region_lines'}) or $Texi2HTML::Config::region_formats_kept{$state->{'region_lines'}->{'format'}})
            {
                push @doc_lines, split_lines($text);
            }
            if (exists($state->{'region_lines'}))
            {
                push @{$region_lines{$state->{'region_lines'}->{'format'}}}, 
                   split_lines($text);
            }
        }
    }
    line_warn ("Expected $state->{'region_lines'}->{'number'} \@end $state->{'region_lines'}->{'format'}", $line_nr) if (exists($state->{'region_lines'}));
    print STDERR "# end of pass structure\n" if $T2H_VERBOSE;
    # To remove once they are handled
    #print STDERR "No node nor section, texi2html won't be able to place things rightly\n" if ($element_before_anything->{'place'} and @{$element_before_anything->{'place'}});
    return (\@doc_lines, \@doc_numbers);
}

# split line at end of line and put each resulting line in an array
# FIXME there must be a more perlish way to do it... Not a big deal 
# as long as it work
sub split_lines($)
{
   my $line = shift;
   my @result = ();
   return @result if (!defined($line));
   my $i = 0;
   while ($line ne '')
   {
       $result[$i] = '';
       $line =~ s/^(.*)//;
       $result[$i] .= $1;
       $result[$i] .= "\n" if ($line =~ s/^\n//);
       #print STDERR "$i: $result[$i]";
       $i++;
   }
   return @result;
}

# handle @documentlanguage
sub do_documentlanguage($$$$)
{
    my $command = shift;
    my $line = shift;
    my $silent = shift;
    my $line_nr = shift;
    my $language_change_succes = 0;
    if ($line =~ s/\s+(\w+)\s*//)
    {
        my $lang = $1;
        my $prev_lang = Texi2HTML::Config::get_conf('documentlanguage');
        # This won't be done if the documentlanguage was set on the command line
        if (Texi2HTML::Config::set_conf('documentlanguage', $lang, 1))
        {
            $language_change_succes = set_document_language($lang, $silent, $line_nr);
            if (!$language_change_succes)
            { # reset previous documentlanguage
                Texi2HTML::Config::set_conf('documentlanguage', $prev_lang, 1);
                line_error ("Translations for '$lang' not found. Reverting to '$prev_lang'.", $line_nr) unless ($silent);
            }
        }
        # FIXME warn about stuff remaining on the line?
    }
    return $language_change_succes;
}

# actions that should be done in more than one pass. In fact most are not 
# to be done in pass_texi. The $pass argument is the number of the pass, 
# 0 for pass_texi, 1 for pass_structure, 2 for pass_text
sub common_misc_commands($$$$)
{
    my $command = shift;
    my $line = shift;
    my $pass = shift;
    my $line_nr = shift;

    # track variables
    if ($command eq 'set')
    {
        if ($line =~ /^(\s+)($VARRE)(\s+)(.*)$/)
        {
             $value{$2} = $4;
        }
        else
        {
             line_warn ("Missing argument for \@$command", $line_nr) if (!$pass);
        }
    }
    elsif ($command eq 'clear')
    {
        if ($line =~ /^(\s+)($VARRE)/)
        {
            delete $value{$2};
        }
        else
        {
            line_warn ("Missing argument for \@$command", $line_nr) if (!$pass);
        }
    }
    elsif ($command eq 'clickstyle')
    {
        if ($line =~ s/^\s+@([^\s\{\}\@]+)({})?\s*//)
        {
            $Texi2HTML::THISDOC{$command} = $1;
            # FIXME warn about what remains on the line?
        }
        else
        {
            line_error ("\@$command should only accept a \@-command as argument", $line_nr) if ($pass == 1);
        }
    }
    elsif ($command eq 'novalidate')
    {
        Texi2HTML::Config::set_conf($command, 1, 1);
    }
    if ($pass)
    { # these commands are only taken into account here in pass_structure 1 
      # and pass_text 2
        if ($command eq 'setfilename')
        {
            my $filename = trim_comment_spaces($line, "\@$command");
            $filename = substitute_line($filename, "\@$command",{'code_style' => 1, 'remove_texi' => 1});
            if ($filename ne '')
            {
                Texi2HTML::Config::set_conf($command, $filename, 1);
            }
        }
        elsif ($command eq 'paragraphindent')
        {
            if ($line =~ /\s+([\w\-]+)[^\w\-]/)
            {
               set_paragraphindent ($1, 0, $line_nr, $pass);
            }
            else
            {
               set_paragraphindent ($line, 0, $line_nr, $pass);
            }
        }
        elsif ($command eq 'firstparagraphindent')
        {
            if (($line =~ /\s+(none)[^\w\-]/) or ($line =~ /\s+(insert)[^\w\-]/))
            {
                Texi2HTML::Config::set_conf($command, $1, 1);
            }
            else
            {
                line_error ("Bad \@$command", $line_nr) if ($pass == 1);
            }
        }
        elsif ($command eq 'exampleindent')
        {
            if ($line =~ /^\s+([0-9]+)/)
            {
                $Texi2HTML::THISDOC{$command} = $1;
            }
            elsif ($line =~ /^\s+(asis)[^\w\-]/)
            {
                $Texi2HTML::THISDOC{$command} = $1;
            }
            else
            {
                line_error ("Bad \@$command", $line_nr) if ($pass == 1);
            }
        }
        elsif ($command eq 'frenchspacing')
        {
            if (($line =~ /^\s+(on)[^\w\-]/) or ($line =~ /^\s+(off)[^\w\-]/))
            {
                Texi2HTML::Config::set_conf($command, $1, 1);
            }
            else
            {
                line_error ("Bad \@$command", $line_nr) if ($pass == 1);
            }
        }
        elsif ($command eq 'kbdinputstyle')
        {
            if ($line =~ /\s+([a-z]+)/ and ($1 eq 'code' or $1 eq 'example' or $1 eq 'distinct'))
            {
                Texi2HTML::Config::set_conf($command, $1, 1);
            }
            else
            {
                line_error ("Bad \@$command", $line_nr) if ($pass == 1);
            }
        }
        elsif (grep {$command eq $_} ('everyheading', 'everyfooting',
              'evenheading', 'evenfooting', 'oddheading', 'oddfooting'))
        { # FIXME have a _texi and without texi, and without texi, 
          # and expand rightly @this*? And use @| to separate, and give
          # an array for user consumption? This should be done for each new
          # chapter, section, and page. What is a page is not necessarily 
          # well defined in html, however...
          # @thisfile is the @include file. Should be in $line_nr.
            my $arg = $line;
            $arg =~ s/^\s+//;
            $Texi2HTML::THISDOC{$command} = $arg;
        }
        elsif ($command eq 'allowcodebreaks')
        {
            if (($line =~ /^\s+(true)[^\w\-]/) or ($line =~ /^\s+(false)[^\w\-]/))
            {
                $Texi2HTML::THISDOC{$command} = $1;
            }
            else
            {
                line_error ("Bad \@$command", $line_nr) if ($pass == 1);
            }
        }
        elsif ($command eq 'headings')
        {
            my $valid_arg = 0;
            foreach my $possible_arg (('off','on','single','double',
                          'singleafter','doubleafter'))
            {
                if ($line =~ /^\s+($possible_arg)[^\w\-]/)
                {   
                    $valid_arg = 1;
                    $Texi2HTML::THISDOC{$command} = $possible_arg;
                    last;
                }
            }
            unless ($valid_arg)
            {
                line_error ("Bad \@$command", $line_nr) if ($pass == 1);
            }
        }
        elsif ($command eq 'documentlanguage')
        {
            if (do_documentlanguage($command, $line, $pass -1, $line_nr))
            {
                &$Texi2HTML::Config::translate_names();
                set_special_names();
            }
        }
    }
}

sub misc_command_texi($$$$)
{
   my $line = shift;
   my $command = shift;
   my $state = shift;
   my $line_nr = shift;
   my $text;
   my $args;
   my $cline = $line;
    
   if (!$state->{'ignored'} and !$state->{'arg_expansion'})
   {
      if ($command eq 'documentencoding')
      {  # FIXME accept more characters, like @?
         if ($cline =~ s/^(\s+)([\w\-]+)//)
         {
            my $encoding = $2;
            $Texi2HTML::THISDOC{'documentencoding'} = $encoding;
            line_warn("Encoding $encoding is not a canonical texinfo encoding", $line_nr)
                if (!$Texi2HTML::Config::canonical_texinfo_encodings{lc($encoding)});
            if (Texi2HTML::Config::set_conf('DOCUMENT_ENCODING', $Texi2HTML::THISDOC{'documentencoding'}, 1))
            {
               my $from_encoding;
               if (!defined($Texi2HTML::Config::IN_ENCODING))
               {
                  $from_encoding = encoding_alias($encoding, $line_nr);
                  Texi2HTML::Config::set_conf('IN_ENCODING', $from_encoding, 1) 
                     if (defined($from_encoding));
               }
               if (defined($from_encoding) and $Texi2HTML::Config::USE_UNICODE)
               {
                  foreach my $file (@{$state->{'files_stack'}})
                  {
                     binmode($file->{'fh'}, ":encoding($from_encoding)");
                  }
               }
            }
            #FIXME error if garbage remains on the line?
         }
         else
         {
            line_error("Incorrect or missing \@$command argument $line", $line_nr);
         }
      }
      elsif ($command eq 'alias')
      { 
          if ($line =~ /(\s+)([a-zA-Z][\w-]*)(\s*=\s*)([a-zA-Z][\w-]*)(\s*)/)
          {
               $alias{$2} = $4;
          }
          else
          {
               line_error ("bad \@alias line", $line_nr);
          }
      }
      elsif ($command eq 'definfoenclose')
      {
          if ($cline =~ s/^\s+([a-z][\w\-]*)\s*,\s*([^\s]+)\s*,\s*([^\s]+)//)
          {
             $info_enclose{$1} = [ $2, $3 ];
          }
          else
          {
             line_error("Bad \@$command", $line_nr);
          } # FIXME warn about garbage remaining on the line?
      }
      else
      {
          if ($command eq 'setfilename' and $Texi2HTML::Config::USE_SETFILENAME)
          { # a double setfillename is removed before calling misc_command_texi
             my $filename = trim_comment_spaces($line, "\@$command");
             $filename = substitute_line($filename, "\@$command",{'code_style' => 1, 'remove_texi' => 1}, $line_nr);
             if ($filename ne '')
             {
                 Texi2HTML::Config::set_conf($command, $filename, 1);
                 # remove extension
                 $filename =~ s/\.[^\.]*$//;
                 init_with_file_name ($filename) if ($filename ne '');
             }
          }
          # in reality, do only set, clear and clickstyle.
          # though we should never go there for clickstyle... 
          common_misc_commands($command, $line, 0, $line_nr);
      }
   }

   ($line, $text, $args) = &$Texi2HTML::Config::preserve_misc_command($line, $command);
   return ($line, $text);
}

sub new_content_element($)
{
   my $command = shift;
   $command = 'shortcontents' if ($command ne 'contents');
   my $element;
   foreach my $key (keys(%{$reference_content_element{$command}}))
   {
      $element->{$key} = $reference_content_element{$command}->{$key};
   }
   return $element;
}

# handle misc commands and misc command args
sub misc_command_structure($$$$)
{
    my $line = shift;
    my $command = shift;
    my $state = shift;
    my $line_nr = shift;
    my $text;
    my $args;

    if ($command eq 'lowersections')
    {
        my ($sec, $level);
        while (($sec, $level) = each %sec2level)
        {
            $sec2level{$sec} = $level + 1;
        }
        $state->{'sectionning_base'}--;
    }
    elsif ($command eq 'raisesections')
    {
        my ($sec, $level);
        while (($sec, $level) = each %sec2level)
        {
            $sec2level{$sec} = $level - 1;
        }
        $state->{'sectionning_base'}++;
    }
    elsif (($command eq 'contents') or ($command eq 'summarycontents') or ($command eq 'shortcontents'))
    {
        if ($command ne 'contents')
        {
            $command = 'shortcontents';
        }
        Texi2HTML::Config::set_conf($command, 1, 1);
        my $new_content_element = new_content_element($command);
        push @{$state->{'place'}}, $new_content_element;
        push @{$all_content_elements{$command}}, $new_content_element;
    }
    elsif ($command eq 'dircategory')
    {
        my $arg = trim_comment_spaces ($line, "\@$command");
        $Texi2HTML::THISDOC{"${command}_texi"} = $arg;
        $Texi2HTML::THISDOC{$command} = substitute_line($arg, "\@$command");
    }
    elsif (grep {$_ eq $command} ('settitle','shorttitlepage','title'))
    {
        my $arg = trim_comment_spaces($line, "\@$command");
        $Texi2HTML::THISDOC{$command . '_texi'} = $arg;

        # FIXME backward compatibility. Obsoleted in nov 2009.
        $value{"_$command"} = $arg;
        if ($command eq 'title')
        { # FIXME This was obsoleted in jun 2007
            $Texi2HTML::THISDOC{"${command}s_texi"} = [ $arg ];
        }
    }
    elsif (grep {$_ eq $command} ('author','subtitle'))
    {
        my $arg = trim_comment_spaces($line, "\@$command");
        $Texi2HTML::THISDOC{$command . '_texi'} .= $arg . "\n";
        push @{$Texi2HTML::THISDOC{"${command}s_texi"}}, $arg;
        #chomp($arg);

        # FIXME backward compatibility. Obsoleted in nov 2009.
        $value{"_$command"} .= $arg . "\n";
    }
    elsif ($command eq 'synindex' || $command eq 'syncodeindex')
    {
        if ($line =~ /^\s+(\w+)\s+(\w+)/)
        {
            my $index_from = $1;
            my $index_to = $2;
            line_error ("unknown from index name $index_from in \@$command", $line_nr)
                unless $index_names{$index_from};
            line_error ("unknown to index name $index_to in \@$command", $line_nr)
                unless $index_names{$index_to};
            if ($index_names{$index_from} and $index_names{$index_to})
            {
                my $in_code = 0;
                $in_code = 1 if ($command eq 'syncodeindex');
                my $current_to = $index_to;
                while ($current_to ne $index_from and $Texi2HTML::THISDOC{'merged_index'}->{$current_to})
                {
                    $current_to = $Texi2HTML::THISDOC{'merged_index'}->{$current_to};
                }
                if ($current_to ne $index_from)
                {
                    foreach my $prefix (keys(%{$index_names{$index_from}->{'prefixes'}}))
                    {
                        $index_names{$current_to}->{'prefixes'}->{$prefix} = $in_code;
                        $index_prefix_to_name{$prefix} = $current_to;
                    }
                    $Texi2HTML::THISDOC{'merged_index'}->{$index_from} = $current_to;
                }
                push @{$Texi2HTML::THISDOC{$command}}, [$index_from,$index_to]; 
            }
        }
        else
        {
            line_error ("Bad $command line: $line", $line_nr);
        }
    }
    elsif ($command eq 'defindex' || $command eq 'defcodeindex')
    {
        if ($line =~ /^\s+(\w+)\s*$/)
        {
            my $name = $1;
            if ($forbidden_index_name{$name})
            {
                line_error("Reserved index name $name", $line_nr);
            }
            else
            {
                my $in_code = 0;
                $in_code = 1 if ($command eq 'defcodeindex');
                $index_names{$name}->{'prefixes'}->{$name} = $in_code;
                $index_prefix_to_name{$name} = $name;
                push @{$Texi2HTML::THISDOC{$command}}, $name;
            }
        }
        else
        {# makeinfo don't warn and even accepts index with empty name
         # and index with numbers only. I reported it on the mailing list
         # this should be fixed in future makeinfo versions.
            line_error ("Bad $command line: $line", $line_nr);
        }
    }
    elsif (grep {$_ eq $command} ('everyheadingmarks','everyfootingmarks',
        'evenheadingmarks','oddheadingmarks','evenfootingmarks','oddfootingmarks'))
    {
        if (($line =~ /^\s+(top)[^\w\-]/) or ($line =~ /^\s+(bottom)[^\w\-]/))
        {
            $Texi2HTML::THISDOC{$command} = $1;
        }
        else
        {
            line_error ("Bad \@$command", $line_nr);
        }
    }
    elsif ($command eq 'fonttextsize')
    {
        if (($line =~ /^\s+(10)[^\w\-]/) or ($line =~ /^\s+(11)[^\w\-]/))
        {
            $Texi2HTML::THISDOC{$command} = $1;
        }
        else
        {
            line_error ("Bad \@$command", $line_nr);
        }
    }
    elsif ($command eq 'pagesizes')
    {
        if ($line =~ /^\s+(.*)\s*$/)
        {
            $Texi2HTML::THISDOC{$command} = $1;
        }
    }
    elsif ($command eq 'footnotestyle')
    {
        if ($line =~ /^\s+([a-z]+)[^\w\-]/)
        {
            set_footnote_style ($1, 0, $line_nr);
        }
        else
        {
            set_footnote_style ($line, 0, $line_nr);
        }
    }
    elsif ($command eq 'setchapternewpage')
    {
        if (($line =~ /^\s+(on)[^\w\-]/) or ($line =~ /^\s+(off)[^\w\-]/)
                or ($line =~ /^\s+(odd)[^\w\-]/))
        {
            $Texi2HTML::THISDOC{$command} = $1;
        }
        else
        {
            line_error ("Bad \@$command", $line_nr);
        }
    }
    elsif ($command eq 'setcontentsaftertitlepage' or $command eq 'setshortcontentsaftertitlepage')
    {
        Texi2HTML::Config::set_conf($command, 1, 1);
    }
    elsif ($command eq 'need')
    { # only a warning
        unless (($line =~ /^\s+([0-9]+(\.[0-9]*)?)[^\w\-]/) or 
                 ($line =~ /^\s+(\.[0-9]+)[^\w\-]/))
        {
            line_warn ("Bad \@$command", $line_nr);
        }
    }
    else
    {
        common_misc_commands($command, $line, 1, $line_nr);
    }

    ($text, $line, $args) = &$Texi2HTML::Config::preserve_misc_command($line, $command);
    return ($text, $line);
}

sub set_special_names()
{
    $Texi2HTML::NAME{'About'} = &$I('About This Document');
    $Texi2HTML::NAME{'Contents'} = &$I('Table of Contents');
    $Texi2HTML::NAME{'Overview'} = &$I('Short Table of Contents');
    $Texi2HTML::NAME{'Footnotes'} = &$I('Footnotes');
    $Texi2HTML::NO_TEXI{'About'} = &$I('About This Document', {}, {'remove_texi' => 1} );
    $Texi2HTML::NO_TEXI{'Contents'} = &$I('Table of Contents', {}, {'remove_texi' => 1} );
    $Texi2HTML::NO_TEXI{'Overview'} = &$I('Short Table of Contents', {}, {'remove_texi' => 1} );
    $Texi2HTML::NO_TEXI{'Footnotes'} = &$I('Footnotes', {}, {'remove_texi' => 1} );
    $Texi2HTML::SIMPLE_TEXT{'About'} = &$I('About This Document', {}, {'simple_format' => 1});
    $Texi2HTML::SIMPLE_TEXT{'Contents'} = &$I('Table of Contents',{},  {'simple_format' => 1});
    $Texi2HTML::SIMPLE_TEXT{'Overview'} = &$I('Short Table of Contents', {}, {'simple_format' => 1});
    $Texi2HTML::SIMPLE_TEXT{'Footnotes'} = &$I('Footnotes', {},{'simple_format' => 1});
}

# return the line after removing things according to misc_command map.
# if the skipped command has an effect it is done here
# this is used during pass_text
sub misc_command_text($$$$$$)
{
    my $line = shift;
    my $command = shift;
    my $stack = shift;
    my $state = shift;
    my $text = shift;
    my $line_nr = shift;
    my ($skipped, $remaining, $args, $result);

    # The strange condition associated with 'keep_texi' is 
    # there because for an argument appearing on an @itemize 
    # line (we're in 'check_item'), meant to be prepended to an 
    # @item we don't want to keep @c or @comment as otherwise it 
    # eats the @item line. Other commands could do that too but 
    # then the user deserves what he gets.
    if ($state->{'keep_texi'} and 
        (!$state->{'check_item'} or ($command ne 'c' and $command ne 'comment'))) 
    {
        ($remaining, $skipped, $args) = &$Texi2HTML::Config::preserve_misc_command($line, $command);
        add_prev($text, $stack, "\@$command". $skipped);
        return $remaining;
    }

    # if it is true the command args are kept so the user can modify how
    # they are skipped and handle them as unknown @-commands

    ($remaining, $skipped, $args) = &$Texi2HTML::Config::preserve_misc_command($line, $command);

    if ($state->{'remove_texi'})
    {
        ($command, $line, $result) = &$Texi2HTML::Config::misc_command_line_texi($command, $line, $args, $stack, $state);
    }
    else
    {
        ($command, $line, $result) = &$Texi2HTML::Config::misc_command_line($command, $line, $args, $stack, $state);
    }
    my $keep = $Texi2HTML::Config::misc_command{$command}->{'keep'};

    if ($command eq 'sp')
    {
        my $sp_number;
        if ($line =~ /^\s+(\d+)\s/)
        {
            $sp_number = $1;
        }
        elsif ($line =~ /(\s*)$/)
        {
            $sp_number = '';
        }
        else
        {
            line_error ("\@$command needs a numeric arg or no arg", $line_nr);
        }
        $sp_number = 1 if ($sp_number eq '');
        if (!$state->{'remove_texi'})
        {
            add_prev($text, $stack, &$Texi2HTML::Config::sp($sp_number, $state->{'preformatted'}));
        }
    }
    elsif($command eq 'verbatiminclude' and !$keep)
    {
        if ($line =~ /\s+(.+)/)
        {
            my $arg = $1;
            $arg = trim_around_spaces($arg);
            my $file = locate_include_file(substitute_line($arg, "\@$command", {'code_style' => 1}));
            if (defined($file))
            {
                if (!open(VERBINCLUDE, $file))
                {
                    line_warn ("Can't read file $file: $!",$line_nr);
                }
                else
                {
                    my $verb_text = '';
                    while (my $line = <VERBINCLUDE>)
                    {
                        $verb_text .= $line;
                    }
                    
                    if ($state->{'remove_texi'})
                    {
                        add_prev ($text, $stack, &$Texi2HTML::Config::raw_no_texi('verbatiminclude', $verb_text));
                    }
                    else
                    { 
                        add_prev($text, $stack, &$Texi2HTML::Config::raw('verbatiminclude', $verb_text, $line_nr));
                    }
                    close VERBINCLUDE;
                }
            }
            else
            {
                line_error ("Can't find $arg, skipping", $line_nr);
            }
        }
        else
        {
            line_error ("Bad \@$command line: $line", $line_nr);
        }
    }
    elsif ($command eq 'indent' or $command eq 'noindent')
    {
        $state->{'paragraph_indent'} = $command;
    }
    else
    {
        common_misc_commands($command, $line, 2, $line_nr);
    }

    return ($skipped.$remaining, $result) if ($keep);
    return ($remaining, $result);
}

# merge the things appearing before the first @node or sectionning command
# (held by element_before_anything) with the current element 
# do that only once.
sub merge_element_before_anything($)
{
    my $element = shift;
    if (exists($element_before_anything->{'place'}))
    {
        $element->{'current_place'} = $element_before_anything->{'place'};
        delete $element_before_anything->{'place'};
        foreach my $placed_thing (@{$element->{'current_place'}})
        {
            $placed_thing->{'element'} = $element if (exists($placed_thing->{'element'}));
        }
    }
    # this is certainly redundant with the above condition, but cleaner 
    # that way
    if (exists($element_before_anything->{'titlefont'}))
    {
        $element->{'titlefont'} = $element_before_anything->{'titlefont'};
        delete $element_before_anything->{'titlefont'};
    }
}

# find menu_prev, menu_up... for a node in menu
sub menu_entry_texi($$$)
{
    my $node = shift;
    my $state = shift;
    my $line_nr = shift;
    return if ($state->{'direntry'});
    my $node_menu_ref = {};
    if (exists($nodes{$node}))
    {
        $node_menu_ref = $nodes{$node};
    }
    else
    {
        $nodes{$node} = $node_menu_ref;
        $node_menu_ref->{'texi'} = $node;
        $node_menu_ref->{'external_node'} = 1 if ($node =~ /^\(.+\)/);
    }
    return if ($state->{'detailmenu'});
    if ($state->{'node_ref'})
    {
        if ($node_menu_ref->{'menu_up'} and !$node_menu_ref->{'external_node'})
        {
           # This is not an error. This is used a lot in real life manuals
           #line_warn ("Double entry in menu for `$node' (also below `$node_menu_ref->{'menu_up'}->{'texi'}')", $line_nr);
        }
        $node_menu_ref->{'menu_up'} = $state->{'node_ref'};
        $node_menu_ref->{'menu_up_hash'}->{$state->{'node_ref'}->{'texi'}} = 1;
    }
    if ($state->{'prev_menu_node'})
    {
        $node_menu_ref->{'menu_prev'} = $state->{'prev_menu_node'};
        $state->{'prev_menu_node'}->{'menu_next'} = $node_menu_ref;
    }
    elsif ($state->{'node_ref'} and !$state->{'node_ref'}->{'menu_child'})
    {
        $state->{'node_ref'}->{'menu_child'} = $node_menu_ref;
    }
    $state->{'prev_menu_node'} = $node_menu_ref;
}

sub prepare_indices()
{
    #print STDERR "Do splitting of index letters, once.\n";

    foreach my $index_name(keys %{$Texi2HTML::THISDOC{'index_entries_array'}})
    {
        #print STDERR "$Texi2HTML::THISDOC{'index_entries_array'}->{$index_name}) letters\n";
        my %letters_hash;
        foreach my $index_entry (@{$Texi2HTML::THISDOC{'index_entries_array'}->{$index_name}})
        {
          my $key = $index_entry->{'key'};
          my $letter = uc(substr($key, 0, 1));
          push @{$letters_hash{$letter}}, $index_entry;
        }

        # use cmp if only letters or only symbols, otherwise symbols before 
        # letters
        foreach my $letter (sort { 
           ((($a =~ /^[[:alpha:]]/ and $b =~ /^[[:alpha:]]/) or 
            ($a !~ /^[[:alpha:]]/ and $b !~ /^[[:alpha:]]/)) && $a cmp $b)
             || ($a =~ /^[[:alpha:]]/ && 1) || -1 } (keys %letters_hash))
        {
          # FIXME sort without uc?
          # This sorts the entries for a given letter
          my @sorted_letter_entries = (sort {uc($a->{'key'}) cmp uc($b->{'key'})} (@{$letters_hash{$letter}}));

          push @{$Texi2HTML::THISDOC{'index_letters_array'}->{$index_name}}, { 'letter' => $letter, 'entries' => \@sorted_letter_entries };
        }
    }
    Texi2HTML::Config::t2h_default_init_split_indices();
}

my @index_labels;                  # array corresponding with @?index commands
                                   # constructed during pass_structure, used to
                                   # put labels in pass_text

# This function is used to construct link names from node names as
# specified for texinfo
sub cross_manual_links()
{
    print STDERR "# Doing ".scalar(keys(%nodes))." cross manual links ".
      scalar(@index_labels). " index entries\n" 
       if ($T2H_DEBUG);
    $::simple_map_texi_ref = \%cross_ref_simple_map_texi;
    $::style_map_texi_ref = \%cross_ref_style_map_texi;
    $::texi_map_ref = \%cross_ref_texi_map;
    my $normal_text_kept = $Texi2HTML::Config::normal_text;
    $Texi2HTML::Config::normal_text = \&Texi2HTML::Config::t2h_cross_manual_normal_text;
    my $style_kept = $Texi2HTML::Config::style;
    $Texi2HTML::Config::style = \&Texi2HTML::Config::T2H_GPL_style;

    foreach my $key (keys(%nodes))
    {
        my $node = $nodes{$key};
        #print STDERR "CROSS_MANUAL:$key,$node\n";
        if (!defined($node->{'texi'}))
        {
            ###################### debug section 
            foreach my $key (keys(%$node))
            {
                #print STDERR "$key:$node->{$key}!!!\n";
            }
            ###################### end debug section 
        }
        else 
        {
            $node->{'cross_manual_target'} = remove_texi($node->{'texi'});
            if ($Texi2HTML::Config::USE_UNICODE)
            {
                $node->{'cross_manual_target'} = Unicode::Normalize::NFC($node->{'cross_manual_target'});
                if ($Texi2HTML::Config::TRANSLITERATE_FILE_NAMES and $Texi2HTML::Config::USE_UNIDECODE)
                {
                     $node->{'cross_manual_file'} = 
                       unicode_to_protected(unicode_to_transliterate($node->{'cross_manual_target'}));
                }
                $node->{'cross_manual_target'} = 
                    unicode_to_protected($node->{'cross_manual_target'});
            }
#print STDERR "CROSS_MANUAL_TARGET $node->{'cross_manual_target'}\n";
            unless ($node->{'external_node'})
            {
                if (exists($cross_reference_nodes{$node->{'cross_manual_target'}}))
                {
                    my $other_node_array = $cross_reference_nodes{$node->{'cross_manual_target'}};
                    my $node_seen;
                    foreach my $other_node (@{$other_node_array})
                    { # find the first node seen for the error message
                        $node_seen = $other_node;
                        last if ($nodes{$other_node}->{'seen'})
                    }
                    my $other_node_line_nr = $nodes{$node_seen}->{'line_nr'};
                    if (defined($other_node_line_nr))
                    {
                        msg_error ("Node equivalent with `$node->{'texi'}' already used `$node_seen' ".format_line_number($other_node_line_nr), $node->{'line_nr'});
                    }
                    else
                    {
                        msg_error ("Node equivalent with `$node->{'texi'}' already used `$node_seen'", $node->{'line_nr'});
                    }
                    push @{$other_node_array}, $node->{'texi'};
                }
                else 
                {
                    push @{$cross_reference_nodes{$node->{'cross_manual_target'}}}, $node->{'texi'};
                }
            }
        }
    }

    
    if ($Texi2HTML::Config::TRANSLITERATE_FILE_NAMES and 
         (!$Texi2HTML::Config::USE_UNICODE or !$Texi2HTML::Config::USE_UNIDECODE))
    {
        $::style_map_texi_ref = \%cross_transliterate_style_map_texi;
        $::texi_map_ref = \%cross_transliterate_texi_map;
        $Texi2HTML::Config::normal_text = \&Texi2HTML::Config::t2h_cross_manual_normal_text_transliterate if (!$Texi2HTML::Config::USE_UNICODE);

        foreach my $key (keys(%nodes))
        {
            my $node = $nodes{$key};
            #print STDERR "TRANSLITERATE:$key,$node\n";
            if (defined($node->{'texi'}))
            {
                 $node->{'cross_manual_file'} = remove_texi($node->{'texi'});
                 $node->{'cross_manual_file'} = unicode_to_protected(unicode_to_transliterate($node->{'cross_manual_file'})) if ($Texi2HTML::Config::USE_UNICODE);
            }
        }

        foreach my $entry (@index_labels, values(%sections), values(%headings))
        {
            #print STDERR "TRANSLITERATE($entry) $entry->{'texi'}\n";
            $entry->{'cross'} = remove_texi($entry->{'texi'});
            $entry->{'cross'} = unicode_to_protected(unicode_to_transliterate($entry->{'cross'})) if ($Texi2HTML::Config::USE_UNICODE);
        }
    }
    else
    {
        foreach my $entry (@index_labels, values(%sections), values(%headings))
        {
            $entry->{'cross'} = remove_texi($entry->{'texi'});
            if ($Texi2HTML::Config::USE_UNICODE)
            {
                $entry->{'cross'} = Unicode::Normalize::NFC($entry->{'cross'});
                if ($Texi2HTML::Config::TRANSLITERATE_FILE_NAMES and $Texi2HTML::Config::USE_UNIDECODE) # USE_UNIDECODE is redundant
                {
                     $entry->{'cross'} = 
                       unicode_to_protected(unicode_to_transliterate($entry->{'cross'}));
                }
                else
                {
                     $entry->{'cross'} = 
                        unicode_to_protected($entry->{'cross'});
                }
            }
        }
    }

    $Texi2HTML::Config::normal_text = $normal_text_kept;
    $Texi2HTML::Config::style = $style_kept;
    $::simple_map_texi_ref = \%Texi2HTML::Config::simple_map_texi;
    $::style_map_texi_ref = \%Texi2HTML::Config::style_map_texi;
    $::texi_map_ref = \%Texi2HTML::Config::texi_map;
}

# This function is used to construct a link name from a node name as
# specified for texinfo
sub cross_manual_line($;$)
{
    my $text = shift;
    my $transliterate = shift;
#print STDERR "cross_manual_line $text\n";
#print STDERR "remove_texi text ". remove_texi($text)."\n\n\n";
    $::simple_map_texi_ref = \%cross_ref_simple_map_texi;
    $::style_map_texi_ref = \%cross_ref_style_map_texi;
    $::texi_map_ref = \%cross_ref_texi_map;
    my $normal_text_kept = $Texi2HTML::Config::normal_text;
    $Texi2HTML::Config::normal_text = \&Texi2HTML::Config::t2h_cross_manual_normal_text;
    my $style_kept = $Texi2HTML::Config::style;
    $Texi2HTML::Config::style = \&Texi2HTML::Config::T2H_GPL_style;
    
    my ($cross_ref_target, $cross_ref_file);
    if ($Texi2HTML::Config::USE_UNICODE)
    {
         $cross_ref_target = Unicode::Normalize::NFC(remove_texi($text));
         if ($transliterate and $Texi2HTML::Config::USE_UNIDECODE)
         {
             $cross_ref_file = 
                unicode_to_protected(unicode_to_transliterate($cross_ref_target));
         }
         $cross_ref_target = unicode_to_protected($cross_ref_target);
    }
    else
    {
         $cross_ref_target = remove_texi($text);
    }
    
    if ($transliterate and 
         (!$Texi2HTML::Config::USE_UNICODE or !$Texi2HTML::Config::USE_UNIDECODE))
    {
         $::style_map_texi_ref = \%cross_transliterate_style_map_texi;
         $::texi_map_ref = \%cross_transliterate_texi_map;
         $Texi2HTML::Config::normal_text = \&Texi2HTML::Config::t2h_cross_manual_normal_text_transliterate if (!$Texi2HTML::Config::USE_UNICODE);
         $cross_ref_file = remove_texi($text);
         $cross_ref_file = unicode_to_protected(unicode_to_transliterate($cross_ref_file))
               if ($Texi2HTML::Config::USE_UNICODE);
    }

    $Texi2HTML::Config::normal_text = $normal_text_kept;
    $Texi2HTML::Config::style = $style_kept;
    $::simple_map_texi_ref = \%Texi2HTML::Config::simple_map_texi;
    $::style_map_texi_ref = \%Texi2HTML::Config::style_map_texi;
    $::texi_map_ref = \%Texi2HTML::Config::texi_map;
#print STDERR "\n\ncross_ref $cross_ref\n";
    unless ($transliterate)
    {
        return $cross_ref_target;
    }
#    print STDERR "$text|$cross_ref_target|$cross_ref_file\n";
    return ($cross_ref_target, $cross_ref_file);
}

sub equivalent_nodes($)
{
    my $name = shift;
#print STDERR "equivalent_nodes $name\n";
    my $node = normalise_node($name);
    $name = cross_manual_line($node);
#print STDERR "equivalent_nodes `$node' `$name'\n";
    my @equivalent_nodes = ();
    if (exists($cross_reference_nodes{$name}))
    {
        @equivalent_nodes = grep {$_ ne $node} @{$cross_reference_nodes{$name}};
    }
    return @equivalent_nodes;
}

sub do_place_target_file($$$)
{
   my $place = shift;
   my $element = shift;
   my $context = shift;

   $place->{'file'} = $element->{'file'} unless defined($place->{'file'});
   $place->{'target'} = $element->{'target'} unless defined($place->{'target'});
   if (defined($Texi2HTML::Config::placed_target_file_name))
   {
      my ($target, $id, $file) = &$Texi2HTML::Config::placed_target_file_name($place,$element,$place->{'target'}, $place->{'id'}, $place->{'file'},$context);
      $place->{'target'} = $target if (defined($target));
      $place->{'file'} = $file if (defined($file));
      $place->{'id'} = $id if (defined($id));
   }
}

sub do_node_target_file($$)
{
    my $node = shift;
    my $type_of_node = shift;
    my $node_file = &$Texi2HTML::Config::node_file_name($node,$type_of_node);
    $node->{'node_file'} = $node_file if (defined($node_file));
    if (defined($Texi2HTML::Config::node_target_name))
    {
        my ($target,$id) = &$Texi2HTML::Config::node_target_name($node,$node->{'target'},$node->{'id'}, $type_of_node);
        $node->{'target'} = $target if (defined($target));
        $node->{'id'} = $id if (defined($id));
    }
}

sub do_element_targets($;$)
{
   my $element = shift;
   my $use_node_file = shift;
   my $is_top = '';

   $is_top = 'top' if (defined($element_top) and ($element eq $element_top or (defined($element->{'with_node'}) and $element->{'with_node'} eq $element_top)));

   if ($Texi2HTML::Config::SPLIT_INDEX and Texi2HTML::Config::get_conf('SPLIT'))
   {
      Texi2HTML::Config::t2h_default_associate_index_element($element, $is_top, $docu_name, $use_node_file);
   }

   if (defined($Texi2HTML::Config::element_file_name))
   {
      my $previous_file_name = $element->{'file'};
      my $filename = 
          &$Texi2HTML::Config::element_file_name ($element, $is_top, $docu_name);
      if (defined($filename))
      {
         foreach my $place (@{$element->{'place'}})
         {
            $place->{'file'} = $filename if (defined($place->{'file'}) and ($place->{'file'} eq $previous_file_name));
         }
         $element->{'file'} = $filename;
         if ($is_top)
         { # reset these variables, although they aren't used much, they may be
           # used in file name comparisons
            $docu_top = $filename;
            $docu_top_file = "$docu_rdir$docu_top";
         }
      }
   }
   print STDERR "file !defined for element $element->{'texi'}\n" if (!defined($element->{'file'}));
   if (defined($Texi2HTML::Config::element_target_name))
   {
       my ($target,$id) = &$Texi2HTML::Config::element_target_name($element, $element->{'target'}, $element->{'id'});
       $element->{'target'} = $target if (defined($target));
       $element->{'id'} = $id if (defined($id));
   }
   foreach my $place(@{$element->{'place'}})
   {
      do_place_target_file($place, $element, '');
   }
}

sub add_t2h_element($$$)
{
    my $element = shift;
    my $elements_list = shift;
    my $prev_element = shift;

    push @$elements_list, $element;
    $element->{'element_ref'} = $element;
    $element->{'this'} = $element;

    if (defined($prev_element))
    {
        $element->{'back'} = $prev_element;
        $prev_element->{'forward'} = $element;
    }
    push @{$element->{'place'}}, $element;
    push @{$element->{'place'}}, @{$element->{'current_place'}};
    return $element;
}

sub add_t2h_dependent_element ($$)
{
    my $element = shift;
    my $element_ref = shift;
    $element->{'element_ref'} = $element_ref;
    $element_index = $element_ref if ($element_index and ($element_index eq $element));
    push @{$element_ref->{'place'}}, $element;
    push @{$element_ref->{'place'}}, @{$element->{'current_place'}};
}

my %files = ();   # keys are files. This is used to avoid reusing an already
                  # used file name
my @opened_files = (); # all the files opened by the program to remove
                       # them if FORCE is not set and an error occured
my %printed_indices = (); # value is true for an index name not empty and
                          # printed
# This is a virtual element used to have the right hrefs for index entries
# and anchors in footnotes.
my $footnote_element;   

# find next, prev, up, back, forward, fastback, fastforward
# find element id and file
# split index pages
# associate placed items (items which have links to them) with the right 
# file and id
# associate nodes with sections
sub rearrange_elements()
{
    print STDERR "# find sections levels and toplevel\n"
        if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    
    my $toplevel = 4;

    # correct level if raisesections or lowersections overflowed
    # and find toplevel level
    # use %sections and %headings to modify also the headings
    foreach my $section (values(%sections), values(%headings))
    {
        my $level = $section->{'level'};
        if ($level > $MAX_LEVEL)
        {
             $section->{'level'} = $MAX_LEVEL;
        }
        elsif ($level < $MIN_LEVEL and ($section->{'tag'} ne 'top'))
        {
             $section->{'level'} = $MIN_LEVEL;
        }
        else
        {
             $section->{'level'} = $level;
        }
        $section->{'toc_level'} = $section->{'level'};
        # This is for top
        $section->{'toc_level'} = $MIN_LEVEL if ($section->{'level'} < $MIN_LEVEL);
        # find the new tag corresponding with the level of the section
        if ($section->{'tag'} !~ /heading/ and ($level ne $reference_sec2level{$section->{'tag'}}))
        {
             $section->{'tag_level'} = $level2sec{$section->{'tag'}}->[$section->{'level'}];
        }
        else
        {
             $section->{'tag_level'} = $section->{'tag'};
        }
        $toplevel = $section->{'level'} if (($section->{'level'} < $toplevel) and ($section->{'level'} > 0 and ($section->{'tag'} !~ /heading/)));
        print STDERR "# section level $level: $section->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    }
    
    print STDERR "# find sections structure, construct section numbers (toplevel=$toplevel)\n"
        if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    my $in_appendix = 0;
    # these arrays have an element per sectionning level. 
    my @previous_numbers = ();   # holds the number of the previous sections
                                 # at the same and upper levels
    my @previous_sections = ();  # holds the ref of the previous sections
    my $previous_toplevel;
    
    foreach my $section (@sections_list)
    {
        ########################### debug
        print STDERR "BUG: node or section_ref defined for section $section->{'texi'}\n"
            if (exists($section->{'node'}) or exists($section->{'section_ref'}));
        print STDERR "Bug level undef for ($section) $section->{'texi'}\n" if (!defined($section->{'level'}));
        ########################### end debug

        # associate with first node if it is a section appearing before
        # the first node
        $section->{'node_ref'} = $nodes_list[0] if ($nodes_list[0] and !$section->{'node_ref'});
        # we track the toplevel next and previous because there is no
        # strict child parent relationship between chapters and top. Indeed
        # a chapter may appear before @top, it may be better to consider them
        # on the same toplevel.
        if ($section->{'level'} <= $toplevel)
        {
            $section->{'toplevel'} = 1;
            if (defined($previous_toplevel))
            {
                $previous_toplevel->{'toplevelnext'} = $section;
                $section->{'toplevelprev'} = $previous_toplevel; 
            }
            $previous_toplevel = $section;
            if (defined($section_top) and $section ne $section_top)
            {
                $section->{'sectionup'} = $section_top;
            }
        }
        # undef things under that section level
        my $section_level = $section->{'level'};
        for (my $level = $section_level + 1; $level < $MAX_LEVEL + 1 ; $level++)
        {
            $previous_numbers[$level] = undef unless ($section->{'tag'} =~ /unnumbered/ or $section->{'tag'} eq 'centerchap');
            $previous_sections[$level] = undef;
        }
        my $number_set;
        # find number at the current level
        if ($section->{'tag'} =~ /appendix/ and !$in_appendix)
        {
            $previous_numbers[$toplevel] = 'A';
            $in_appendix = 1;
            $number_set = 1 if ($section->{'level'} <= $toplevel);
        }
        if (!defined($previous_numbers[$section->{'level'}]) and !$number_set)
        {
            if ($section->{'tag'} =~ /unnumbered/ or $section->{'tag'} eq 'centerchap')
            {
                 $previous_numbers[$section->{'level'}] = undef;
            }
            else
            {
                $previous_numbers[$section->{'level'}] = 1;
            }
        }
        elsif ($section->{'tag'} !~ /unnumbered/ and $section->{'tag'} ne 'centerchap' and !$number_set)
        {
            $previous_numbers[$section->{'level'}]++;
        }
        # construct the section number
        $section->{'number'} = '';

        unless ($section->{'tag'} =~ /unnumbered/ or $section->{'tag'} eq 'centerchap' or $section->{'tag'} eq 'top')
        { 
            my $level = $section->{'level'};
            while ($level > $toplevel)
            {
                my $number = $previous_numbers[$level];
                $number = 0 if (!defined($number));
                if ($section->{'number'})
                {
                    $section->{'number'} = "$number.$section->{'number'}";
                }
                else
                {
                    $section->{'number'} = $number;
                }    
                $level--;
            }
            my $toplevel_number = $previous_numbers[$toplevel];
            $toplevel_number = 0 if (!defined($toplevel_number));
            
            if ($section->{'number'})
            { # not toplevel
                $section->{'number'} = "$toplevel_number.$section->{'number'}";
            }
            else
            { # toplevel
                $section->{'number'} = $toplevel_number;
                if ($section->{'tag'} =~ /appendix/)
                {# i18n
                    $section->{'plain_number'} = $section->{'number'};
                    $section->{'number'} = "Appendix $section->{'number'}";
                }
            }
        }
        $section->{'plain_number'} = $section->{'number'} if (!defined($section->{'plain_number'}));
        # find the previous section
        if (defined($previous_sections[$section->{'level'}]))
        {
            my $prev_section = $previous_sections[$section->{'level'}];
            $section->{'sectionprev'} = $prev_section;
            $prev_section->{'sectionnext'} = $section;
        }
        # find the up section
        my $level = $section->{'level'} - 1;
        while (!defined($previous_sections[$level]) and ($level >= 0))
        {
            $level--;
        }
        if (defined($previous_sections[$level]))
        {
            $section->{'sectionup'} = $previous_sections[$level];
            # 'child' is the first child. 
            # the condition or $section->{'sectionup'}->{'child'} is for 
            # the @top since it may already one child
            # and no sectionprev 
            $section->{'sectionup'}->{'child'} = $section unless ($section->{'sectionprev'} or $section->{'sectionup'}->{'child'});
            push @{$section->{'sectionup'}->{'section_childs'}}, $section;
        }
        $previous_sections[$section->{'level'}] = $section;
        # This is what is used in the .init file. 
        $section->{'up'} = $section->{'sectionup'};
        # Not used but documented. 
        $section->{'next'} = $section->{'sectionnext'};
        $section->{'prev'} = $section->{'sectionprev'};

        ############################# debug
        my $up = "NO_UP";
        $up = $section->{'sectionup'} if (defined($section->{'sectionup'}));
        print STDERR "# numbering section ($section->{'level'}): $section->{'number'}: (up: $up) $section->{'texi'}\n"
            if ($T2H_DEBUG & $DEBUG_ELEMENTS);
        ############################# end debug
    }

    # at that point there are still some node structures that are not 
    # in %nodes, (the external nodes, and unknown nodes in case 
    # novalidate is true) so we cannot find the id. The consequence is that
    # some node equivalent with another node may not be catched during
    # that pass. We mark the nodes that have directions for unreferenced 
    # nodes and make a second pass for these nodes afterwards.
    my @nodes_with_unknown_directions = ();

    my %node_directions = (
         'node_prev' => 'nodeprev',
         'node_next' => 'nodenext',
         'node_up' => 'nodeup');
    # handle nodes 
    # the node_prev... are texinfo strings, find the associated node references
    print STDERR "# Resolve nodes directions\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    foreach my $node (@nodes_list)
    {
        foreach my $direction (keys(%node_directions))
        {
            if (defined($node->{$direction}))
            {
                if ($nodes{$node->{$direction}} and $nodes{$node->{$direction}}->{'seen'})
                {
                     $node->{$node_directions{$direction}} = $nodes{$node->{$direction}};
                }
                elsif (($node->{$direction} =~ /^\(.*\)/) or Texi2HTML::Config::get_conf('novalidate'))
                { # ref to an external node
                    if (exists($nodes{$node->{$direction}}))
                    {
                        $node->{$node_directions{$direction}} = $nodes{$node->{$direction}};
                    }
                    else
                    {
                        my $node_ref = { 'texi' => $node->{$direction} };
                        $node_ref->{'external_node'} = 1 if ($node->{$direction} =~ /^\(.*\)/);
                        $nodes{$node->{$direction}} = $node_ref;
                        $node->{$node_directions{$direction}} = $node_ref;
                    }
                }
                else
                {
                     push @nodes_with_unknown_directions, $node;
                }
            }
        }
    }

    # Find cross manual links as explained on the texinfo mailing list
    # The  specification is such that cross manual links formatting should 
    # be insensitive to the manual split
    cross_manual_links();    

    my %direction_texts = (
      'node_prev' => 'Prev',,
      'node_next' => 'Next',
      'node_up' => 'Up'
    );
    # Now it is possible to find the unknown directions that are equivalent
    # (have same node id) than an existing node
    foreach my $node (@nodes_with_unknown_directions)
    {
        foreach my $direction (keys(%node_directions))
        { 
            if (defined($node->{$direction}) and !$node->{$node_directions{$direction}})
            {
                line_warn ("$direction_texts{$direction} reference to nonexistent `$node->{$direction}'", $node->{'line_nr'}); # for `$node->{'texi'}'"
                my @equivalent_nodes = equivalent_nodes($node->{$direction});
                my $node_seen;
                foreach my $equivalent_node (@equivalent_nodes)
                {
                    if ($nodes{$equivalent_node}->{'seen'})
                    {
                        $node_seen = $equivalent_node;
                        last;
                    }
                }
                if (defined($node_seen))
                {
                    document_warn ("---> but equivalent node `$node_seen' found");
                    $node->{$node_directions{$direction}} = $nodes{$node_seen};
                }
            }
        }
    }

    # nodes are attached to the section preceding them if not already 
    # associated with a section
    my $current_section = $sections_list[0];
    foreach my $element (@all_elements)
    {
        if ($element->{'node'})
        {
            if ($element->{'with_section'})
            { # the node is associated with a section
                $element->{'section_ref'} = $element->{'with_section'};
            }
            elsif (defined($current_section))
            {# node appearing after a section, but not before another section,
             # or appearing before any section
                $element->{'section_ref'} = $current_section;
                push @{$current_section->{'node_childs'}}, $element;
            }
        }
        else
        {
            $current_section = $element;
        }
    }

    print STDERR "# Complete nodes next prev and up based on menus and sections\n"
        if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    # set the default id based on the node number 
    my $node_nr = 1;
    # find the node* directions
    # find the directions corresponding with sections
    # and set 'up' for the node
    foreach my $node (@nodes_list)
    {
        # first a warning if the node and the equivalent nodes don't 
        # appear in menus.
        # Don't warn for the top node, and the first node if there is no
        # top node.
        if ((($node_top and $node ne $node_top) or (!$node_top and $node ne $node_first)) and !$node->{'menu_up'} and $Texi2HTML::Config::SHOW_MENU)
        {
            my @equivalent_nodes = equivalent_nodes($node->{'texi'});
            my $found = 0;
            foreach my $equivalent_node (@equivalent_nodes)
            {
                if (($nodes{$equivalent_node} eq $node_first) or $nodes{$equivalent_node}->{'menu_up'})
                {
                   $found = 1;
                   last;
                }
            }
            unless ($found)
            {
                line_warn ("unreferenced node `$node->{'texi'}'", $node->{'line_nr'});
            }
        }

        # use values deduced from menus to complete missing up, next, prev
        # or from sectionning commands if automatic sectionning
        if (!$node->{'nodeup'})
        {
            if (defined($node_top) and ($node eq $node_top) and $node->{'automatic_directions'})
            { # Top node has a special up, which is (dir) by default
                my $top_nodeup = $Texi2HTML::Config::TOP_NODE_UP;
                if (exists($nodes{$top_nodeup}))
                {
                    $node->{'nodeup'} = $nodes{$top_nodeup};
                }
                else
                {
                    my $node_ref = { 'texi' => $top_nodeup };
                    $node_ref->{'external_node'} = 1;
                    $nodes{$top_nodeup} = $node_ref;
                    $node->{'nodeup'} = $node_ref;
                }
            }
            elsif ($node->{'automatic_directions'}) 
            {
                if ($node->{'with_section'})
                {
                    if (defined($node->{'with_section'}->{'sectionup'}))
                    {
                        $node->{'nodeup'} = get_node($node->{'with_section'}->{'sectionup'});
                    }
                    elsif ($node->{'with_section'}->{'toplevel'} and defined($section_top) and ($node->{'with_section'} ne $section_top))
                    {
                        $node->{'nodeup'} = get_node($section_top);
                    }
                    print STDERR "# Deducing from section node_up $node->{'nodeup'}->{'texi'} for $node->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS and defined($node->{'nodeup'}));
                }
                elsif ($node->{'menu_up'})
                {
                    $node->{'nodeup'} = $node->{'menu_up'};
                    print STDERR "# Deducing from menu node_up $node->{'menu_up'}->{'texi'} for $node->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                }
            }
        }

        if ($node->{'nodeup'} and !$node->{'nodeup'}->{'external_node'})
        {
            # We detect when the up node has no menu entry for that node, as
            # there may be infinite loops when finding following node (see below)
            unless (defined($node->{'menu_up_hash'}) and ($node->{'menu_up_hash'}->{$node->{'nodeup'}->{'texi'}}))
            {
                line_warn("Node `$node->{'nodeup'}->{'texi'}' lacks menu item for `$node->{'texi'}' despite being its Up target.", $node->{'nodeup'}->{'line_nr'}) if ($Texi2HTML::Config::SHOW_MENU);
                push @{$node->{'up_not_in_menu'}}, $node->{'nodeup'}->{'texi'};
            }
        }
        # check that the up is in one of the menus
        if ($Texi2HTML::Config::SHOW_MENU and $node->{'nodeup'} and $node->{'menu_up'})
        {
            my @equivalent_nodes = equivalent_nodes($node->{'nodeup'}->{'texi'});
            my $found = 0;
            foreach my $equivalent_node ($node->{'nodeup'}->{'texi'}, @equivalent_nodes)
            {
                if ($node->{'menu_up_hash'}->{$equivalent_node})
                {
                   $found = 1;
                   last;
                }
            }
            unless ($found)
            {
                line_warn ("For `$node->{'texi'}', up in menu `$node->{'menu_up'}->{'texi'}' and up `$node->{'nodeup'}->{'texi'}' don't match", $node->{'line_nr'});
            }

        }

        # Find next node if not already found
        if ($node->{'nodenext'}) 
        {
            # doing the following would be wrong:
            #$node->{'nodenext'}->{'nodeprev'} = $node if (!defined($node->{'nodenext'}->{'nodeprev'}));
        }
        elsif ($node->{'texi'} eq 'Top' and $node->{'automatic_directions'})
        { # special case as said in the texinfo manual
            if ($node->{'menu_child'})
            {
                $node->{'nodenext'} = $node->{'menu_child'};
                $node->{'menu_child'}->{'nodeprev'} = $node;
            }
        }
        elsif ($node->{'automatic_directions'})
        { 
            if (defined($node->{'with_section'}))
            {
                my $next;
                my $section = $node->{'with_section'};
                if (defined($section->{'sectionnext'}))
                {
                    $next = get_node($section->{'sectionnext'});
                    if (defined($next) and $Texi2HTML::Config::SHOW_MENU)
                    {
                        line_warn ("No node following `$node->{'texi'}' in menu, but `$next->{'texi'}' follows in sectionning", $node->{'line_nr'}) if (!defined($node->{'menu_next'}));
                        line_warn ("Node following `$node->{'texi'}' in menu `$node->{'menu_next'}->{'texi'}' and in sectionning `$next->{'texi'}' differ", $node->{'line_nr'}) 
                           if (defined($node->{'menu_next'}) and $next ne $node->{'menu_next'});
                    }
                }
                elsif ($Texi2HTML::Config::USE_UP_FOR_ADJACENT_NODES) 
                { # makeinfo don't do that
                    while (defined($section->{'sectionup'}) and !defined($section->{'sectionnext'}))
                    {
                        $section = $section->{'sectionup'};
                    }
                    if (defined($section->{'sectionnext'}))
                    {
                        $next = get_node($section->{'sectionnext'});
                    }
                }
                $node->{'nodenext'} = $next;
            }
            elsif ($node->{'menu_next'})
            {
                $node->{'nodenext'} = $node->{'menu_next'};
            }
        }

        # Find prev node
        if ($node->{'nodeprev'})
        {
            # doing the following would be wrong:
            #$node->{'nodeprev'}->{'nodenext'} = $node if (!defined($node->{'nodeprev'}->{'nodenext'}));
        }
        elsif ($node->{'automatic_directions'})
        {
            if (defined($node->{'with_section'}))
            {
                my $section = $node->{'with_section'};
                if (defined($section->{'sectionprev'}))
                {
                    $node->{'nodeprev'} = get_node($section->{'sectionprev'});
                }
                elsif ($Texi2HTML::Config::USE_UP_FOR_ADJACENT_NODES and defined($section->{'sectionup'}))
                { # makeinfo don't do that
                    $node->{'nodeprev'} = get_node($section->{'sectionup'});
                }
            }
            elsif ($node->{'menu_prev'}) 
            {
                $node->{'nodeprev'} = $node->{'menu_prev'};
            }
            # the prev node is the parent node
            elsif ($node->{'menu_up'} and ($node->{'menu_up'}->{'menu_child'} eq $node) and $Texi2HTML::Config::USE_UP_FOR_ADJACENT_NODES)
            {
                $node->{'nodeprev'} = $node->{'menu_up'};
            }
        }
    
        # the following node is the node following in node reading order
        # it is thus first the child, else the next, else the next following
        # the up
        if ($node->{'menu_child'})
        {
            $node->{'following'} = $node->{'menu_child'};
        }
        elsif ($node->{'automatic_directions'} and defined($node->{'with_section'}) and defined($node->{'with_section'}->{'child'}))
        {
            $node->{'following'} = get_node($node->{'with_section'}->{'child'});
        }
        elsif (defined($node->{'nodenext'}))
        {
            $node->{'following'} = $node->{'nodenext'};
        }
	else
        {
            my $up = $node->{'nodeup'};
            # in order to avoid infinite recursion in case the up node is the 
            # node itself we use the up node as following when there isn't 
            # a correct menu structure, here and also below.
            $node->{'following'} = $up if (defined($up) and grep {$_ eq $up->{'texi'}} @{$node->{'up_not_in_menu'}});
            while ((!defined($node->{'following'})) and (defined($up)))
            {
                if (($node_top) and ($up eq $node_top))
                { # if we are at Top, Top is following 
                    $node->{'following'} = $node_top;
                    $up = undef;
                }
                if (defined($up->{'nodenext'}))
                {
                    $node->{'following'} = $up->{'nodenext'};
                }
                elsif (defined($up->{'nodeup'}))
                {
                    if (! grep { $_ eq $up->{'nodeup'}->{'texi'} } @{$node->{'up_not_in_menu'}}) 
                    { 
                        $up = $up->{'nodeup'};
                    }
                    else
                    { # in that case we can go into a infinite loop
                        $node->{'following'} = $up->{'nodeup'};
                    }
                }
                else
                {
                    $up = undef;
                }
            }
        }
        # copy the direction of the associated section.
        if (defined($node->{'with_section'}))
        {
            my $section = $node->{'with_section'};
            foreach my $direction ('sectionnext', 'sectionprev', 'sectionup')
            {
                $node->{$direction} = $section->{$direction}
                  if (defined($section->{$direction}));
            }
        }
        # 'up' is used in .init files. It is almost sectionup, but not
        # exactly, it allows to have something relevant whether elements
        # are nodes or sections -- just like Back and Forward. So it
        # should certainly be kept.
        if (defined($node->{'sectionup'}))
        {
            $node->{'up'} = $node->{'sectionup'};
        }
        elsif (defined($node->{'nodeup'}) and 
             (!$node_top or ($node ne $node_top)))
        {
            $node->{'up'} = $node->{'nodeup'};
        }
        # 'next' not used but documented. 
        if (defined($node->{'sectionnext'}))
        {
            $node->{'next'} = $node->{'sectionnext'};
        }
        if (defined($node->{'sectionprev'}))
        {
            $node->{'prev'} = $node->{'sectionprev'};
        }

        # default id for nodes. Should be overriden later.
        $node->{'id'} = 'NOD' . $node_nr;
        $node_nr++;
    }
    
    # do node directions for sections.
    foreach my $section (@sections_list)
    {
        # If the element is not a node, then all the node directions are copied
        # if there is an associated node
        if (defined($section->{'with_node'}))
        {
            $section->{'nodenext'} = $section->{'with_node'}->{'nodenext'};
            $section->{'nodeprev'} = $section->{'with_node'}->{'nodeprev'};
            $section->{'menu_next'} = $section->{'with_node'}->{'menu_next'};
            $section->{'menu_prev'} = $section->{'with_node'}->{'menu_prev'};
            $section->{'menu_child'} = $section->{'with_node'}->{'menu_child'};
            $section->{'menu_up'} = $section->{'with_node'}->{'menu_up'};
            $section->{'nodeup'} = $section->{'with_node'}->{'nodeup'};
            $section->{'following'} = $section->{'with_node'}->{'following'};
        }
    }

    my $only_nodes = 0;
    my $only_sections = 0;

    # for legibility
    my $use_nodes = $Texi2HTML::Config::USE_NODES;
    my $use_sections = $Texi2HTML::Config::USE_SECTIONS;

    $only_nodes = 1 if (
         (!scalar(@sections_list) and 
            ($use_nodes or (!$use_sections and !defined($use_nodes))))
      or ($use_nodes and !$use_sections)
    );
    $only_sections = 1 if (!$only_nodes and !$use_nodes and ($use_sections or !defined($use_sections)));
    #print STDERR "USE_NODES $use_nodes, USE_SECTIONS $use_sections. only_nodes: $only_nodes, only_sections $only_sections\n";

    my $prev_element;
    print STDERR "# Build the elements list only_nodes: $only_nodes, only_sections $only_sections\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    foreach my $element (@all_elements)
    {
        if ($element->{'node'})
        {
            if ($element->{'section_ref'} and ($only_sections or (!$only_nodes and $element->{'with_section'})))
            {
                add_t2h_dependent_element ($element, $element->{'section_ref'});
                #$element->{'toc_level'} = $element->{'section_ref'}->{'toc_level'};
            }
            elsif (!$only_sections)
            {
                $prev_element = add_t2h_element($element, \@elements_list, $prev_element);
            }
            else # $only_section and !$section_ref. This should only
                 # happen when there are no sections
            {
                #print STDERR "node $element->{'texi'} not associated with an element\n";
            }
        }
        else
        {
            if ($element->{'node_ref'} and $only_nodes)
            {
                add_t2h_dependent_element ($element, $element->{'node_ref'});
            }
            elsif (!$only_nodes)
            {
                $prev_element = add_t2h_element($element, \@elements_list, $prev_element);
            }
            else
            { # no node, and $only_nodes
                #print STDERR "$element->{'tag'} $element->{'texi'} not associated with an element\n";
            }
        }
    }

    # find texi2html specific directions and elements that are not texinfo
    # language features.
    #
    # Maybe Config hooks should be used at that point (up to index 
    # preparation)
    #
    # find first, last and top elements 
    if (@elements_list)
    {
        $element_first = $elements_list[0];
        print STDERR "# element first: $element_first->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS); 
        # It is the last element before indices split, which may add new 
        # elements
        $element_last = $elements_list[-1];
    }
    else
    {
        print STDERR "# \@elements_list is empty\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS); 
    }
    print STDERR "# top node: $node_top->{'texi'}\n" if (defined($node_top) and
        ($T2H_DEBUG & $DEBUG_ELEMENTS));

    # Remark: there are many subtle distinctions among the elements that
    # have a flavor of being at top. First there are the texinfo top
    # elements (if present), namely $section_top for the @top element
    # and $node_top for the @node Top element (and both may be associated).

    # Then there is $element_top, set up just below. In addition to 
    # $section_top and $node_top, the section associated with $node_top
    # and the first element may be used. $element_top is used to determine
    # file splitting and file names, since it is always associated with 
    # $docu_top file.

    # The $element_top may have 'top' set, in case it is a node or @top.
    # In that case, special formatting is done, like using print_Top and
    # similar.

    # Similarly with element_top, some other nodes than $node_top may 
    # get associated with the top node filename without being considered
    # as top otherwise (this is done below).

    if (defined($section_top) and $section_top->{'this'})
    {
    # element top is the element with @top.
        $element_top = $section_top;
    }
    elsif (defined($node_top) and $node_top->{'this'})
    {
    # otherwise top node may be the element_top
        $element_top = $node_top;
    }
    elsif (defined($node_top) and defined($node_top->{'with_section'}) and $node_top->{'with_section'}->{'this'})
    {
        # next, the element associated with the @node Top may be
        # the $element_top. In that case $element_top->{'top'} won't be set
        $element_top = $node_top->{'with_section'};
    }
    elsif (defined($element_first))
    {
    # If there is no @top section no top node associated with an element,
    # first element is used
         $element_top = $element_first;
    }

    # Rather arbitrarily, 'top' is set for nodes as top elements 
    # and @top. This triggers specific formatting, like calling
    # print_Top and similar things.
    if (defined($element_top))
    {
        $element_top->{'top'} = 1 if ($element_top->{'node'} or $element_top->{'tag'} eq 'top');
        print STDERR "# element top: $element_top->{'texi'}\n" if ($element_top and
           ($T2H_DEBUG & $DEBUG_ELEMENTS));
    }
    
    print STDERR "# find fastback and fastforward\n" 
       if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    foreach my $element (@elements_list)
    { # nodes are ignored here, although their associated sectionning
      # command may be taken into account.
        my $up = get_top($element);
        next unless (defined($up));
        # take the opportunity to set the first chapter with index 
        $element_chapter_index = $up if ($element_index and ($element_index eq $element));
        # fastforward is the next element on same level than the upper parent
        # element.
        if (exists ($up->{'toplevelnext'}))
        {
            $element->{'fastforward'} = $up->{'toplevelnext'}
        }
        # if the element isn't at the highest level, fastback is the 
        # highest parent element
        if ($up and ($up ne $element))
        {
            $element->{'fastback'} = $up;
        }
        elsif ($element->{'toplevel'})
        {
             # the element is a top level element, we adjust the next
            # toplevel element fastback
            $element->{'fastforward'}->{'fastback'} = $element if ($element->{'fastforward'});
        }
    }

    # set 'reference_element' which is used each time there is a cross ref
    # to that node (xref and menu entry), to do the href, and also the 
    # element heading text.
    # It is the section associated with the node if there are only sections.
    # Since in the default case the target is the node target, even for 
    # sections, this, in fact shouldn't lead to a different target, unless 
    # the node and the section don't have the same file associated, which could 
    # only happen with indices split. The heading text will be different, though.
    # The node name should also always be passed to the formatting functions 
    # such that it is always possible for the formatting to chose the node
    # heading over the element heading selected using 'reference_element'.
    if ($only_sections)
    {
        foreach my $node(@nodes_list)
        {
            if ($node->{'with_section'})
            {
                $node->{'reference_element'} = $node->{'with_section'};
            }
        }
    }
    # the symmetric is not done for sections, since there is no crossref
    # to sections in texinfo (only to anchors and nodes), so that when
    # there is a link to an element (in Toc, for instance),
    # there is no reason to want to have the node (though, once again,
    # the href is almost surely the same than what would be with the node,
    # the heading would be different).

    # end texi2html added directions

    # do human readable id
    print STDERR "# find float id\n" 
       if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    foreach my $float (@floats)
    {
        $float->{'style_id'} = cross_manual_line($float->{'style_texi'});
        my $float_style = { };
        if (exists($floats{$float->{'style_id'}}))
        {
            $float_style = $floats{$float->{'style_id'}};
        }
        else
        {
            $floats{$float->{'style_id'}} = $float_style;
        }
        push @{$float_style->{'floats'}}, $float;
        $float->{'absolute_nr'} = scalar(@{$float_style->{'floats'}});
        my $up = get_top($float->{'element'});
        if (defined($up) and (!defined($float_style->{'current_chapter'}) or ($up->{'texi'} ne $float_style->{'current_chapter'})))
        {
            $float_style->{'current_chapter'} = $up->{'texi'};
            $float_style->{'nr_in_chapter'} = 1;
        }
        else
        {
            $float_style->{'nr_in_chapter'}++;
        }
        if (defined($up) and $up->{'toplevel'} and $up->{'number'} ne '')
        {
            $float->{'chapter_nr'} = $up->{'plain_number'};
            $float->{'nr'} = $float->{'chapter_nr'} . "." . $float_style->{'nr_in_chapter'};
        }
        else
        {
            $float->{'nr'} = $float->{'absolute_nr'};
        }
    }

    print STDERR "# do human-readable index entries id\n" 
       if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    if ($Texi2HTML::Config::NEW_CROSSREF_STYLE)
    {
        foreach my $index_entry (@index_labels)
        {
            my $index_id = "index-" . $index_entry->{'cross'};
            my $index = 1;
            # $index > 0 should prevent integer overflow, hopefully
            while (exists($cross_reference_nodes{$index_id}) and $index > 0)
            {
                $index_id = "index-" . $index_entry->{'cross'} . "-" .$index;
                $index++;
            }
            $index_entry->{'id'} = $index_id;
            $index_entry->{'target'} = $index_id;
            my $texi_entry = "index-".$index_entry->{'texi'};
            $texi_entry .= "-".$index if ($index > 1);
            push @{$cross_reference_nodes{$index_id}}, $texi_entry;
        }
    }


    if ($Texi2HTML::Config::NEW_CROSSREF_STYLE)
    { 
        foreach my $key (keys(%nodes))
        {
            my $node = $nodes{$key};
            next if ($node->{'external_node'});
            $node->{'id'} = node_to_id($node->{'cross_manual_target'});
            # FIXME if NEW_CROSSREF_STYLE false is it done for anchors?
            $node->{'target'} = $node->{'id'};
        }
    }

    # use %sections and %headings to modify also the headings
    foreach my $section (values(%sections), values(%headings))
    {
        if ($Texi2HTML::Config::NEW_CROSSREF_STYLE and ($section->{'cross'} =~ /\S/))
        {
            my $section_cross = $section->{'cross'};
            if (defined($section->{'region'}))
            { # for headings appearing in special regions like @copying...
                $section_cross = "${target_prefix}-$section->{'region'}_$section_cross";
            }
            $section->{'cross_manual_target'} = $section_cross;

            my $index = 1;
            # $index > 0 should prevent integer overflow, hopefully
            while (exists($cross_reference_nodes{$section->{'cross_manual_target'}}) and $index > 0)
            {
                $section->{'cross_manual_target'} = $section_cross . "-" .$index;
                $index++;
            }
            my $texi_entry = $section->{'texi'};
            $texi_entry .= "-".$index if ($index > 1);
            push @{$cross_reference_nodes{$section->{'cross_manual_target'}}}, $texi_entry;
            $section->{'id'} = node_to_id($section->{'cross_manual_target'});
        }
        if ($Texi2HTML::Config::USE_NODE_TARGET and $section->{'with_node'})
        {
            $section->{'target'} = $section->{'with_node'}->{'target'};
        }
        else
        {
            $section->{'target'} = $section->{'id'};
        }
    }

    # construct human readable tocid
    foreach my $section (values(%sections))
    {
        if ($Texi2HTML::Config::NEW_CROSSREF_STYLE and ($section->{'cross'} =~ /\S/))
        {
            foreach my $toc_id (['tocid','toc'], ['stocid', 'stoc'])
            {
                my $id_string = $toc_id->[0];
                my $prefix_string = $toc_id->[1];
                my $cross_string = '-' . $section->{'cross_manual_target'};
                $section->{$id_string} = $prefix_string . $cross_string;
                my $index = 1;
                # $index > 0 should prevent integer overflow, hopefully
                while (exists($cross_reference_nodes{$section->{$id_string}}) and $index > 0)
                {
                    $section->{$id_string} = $prefix_string . "-" .$index .$cross_string;
                    $index++;
                }
                my $texi_entry = $prefix_string.'-'.$section->{'texi'};
                $texi_entry = $prefix_string .'-'.$index.'-'.$section->{'texi'}  if ($index > 1);
                push @{$cross_reference_nodes{$section->{$id_string}}}, $texi_entry;
            }
        }
    }
    if (!$Texi2HTML::Config::NEW_CROSSREF_STYLE)
    {
        my $tocnr = 1;
        foreach my $element (@elements_list)
        {
            $element->{'tocid'} = 'TOC' . $tocnr;
            $tocnr++;
        }
    }

    # Set file names
    # Find node file names and file names for nodes considered as elements
    my $node_as_top;
    if ($node_top)
    {
        $node_as_top = $node_top;
    }
    # following possibilities lead to some node being considered
    # as top for the purpose of setting the file node, but not as node_top
    elsif ($element_top->{'with_node'})
    { 
        $node_as_top = $element_top->{'with_node'};
    }
    else
    {
        $node_as_top = $node_first;
    }
    if ($node_as_top)
    {
        do_node_target_file($node_as_top, 'top');
    }
    foreach my $key (keys(%nodes))
    {
        my $node = $nodes{$key};
        next if (defined($node_as_top) and ($node eq $node_as_top));
        do_node_target_file($node,'');
    }
    
    print STDERR "# split(".Texi2HTML::Config::get_conf('SPLIT').") and set files\n" 
       if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    # find document nr and document file for sections and nodes. 
    # Split according to Texi2HTML::Config::SPLIT.
    # find file and id for placed elements (anchors, index entries, headings)
    if (Texi2HTML::Config::get_conf('SPLIT'))
    {
        $Texi2HTML::THISDOC{'split_level'} = $toplevel;
        my $doc_nr = -1;
        if (Texi2HTML::Config::get_conf('SPLIT') eq 'section')
        {
            $Texi2HTML::THISDOC{'split_level'} = 2 if ($toplevel <= 2);
        }
        my $previous_file;
        my $previous_is_top = 0;
        foreach my $element (@elements_list)
        { 
            print STDERR "# Splitting (".Texi2HTML::Config::get_conf('SPLIT').":$Texi2HTML::THISDOC{'split_level'}) $element->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
            my $new_file = 0;
            if (
               (!defined($previous_file)) or 
               (Texi2HTML::Config::get_conf('SPLIT') eq 'node') or
               (
                 defined($element->{'level'}) and ($element->{'level'} <= $Texi2HTML::THISDOC{'split_level'})
               ) or
               (
                 !defined($element->{'level'}) and defined($element->{'with_section'}) and ($element->{'with_section'}->{'level'} <= $Texi2HTML::THISDOC{'split_level'})
               ) or
               ( # top file after another file
                 (defined($previous_file) and ($element eq $element_top)
                  and ($previous_file ne $docu_top))
               ) # element following top element is always considered to be
                 # in a different file.
               or ($previous_is_top)
              )
            {
                $new_file = 1;
                $doc_nr++;
            }
            $previous_is_top = 0 if ($previous_is_top);

            $element->{'doc_nr'} = $doc_nr;
            $element->{'file'} = "${docu_name}_$doc_nr"
                . (defined($Texi2HTML::THISDOC{'extension'}) ? ".$Texi2HTML::THISDOC{'extension'}" : '');
            my $use_node_file = 0;
            if ($element eq $element_top)
            { # the top element
                $element->{'file'} = $docu_top;
                $previous_is_top = 1;
            }
            elsif ($Texi2HTML::Config::NODE_FILENAMES)
            {
                $use_node_file = 1;
                if ($new_file)
                {
                    my $node = get_node($element);
                    if ($node and defined($node->{'node_file'}))
                    {
                        $element->{'file'} = $node->{'node_file'};
                    }
                    elsif ($element->{'cross'} =~ /\S/)
                    { # use the canonicalized/transliterated section file name.
                        $element->{'file'} = $element->{'cross'} 
                         . (defined($Texi2HTML::THISDOC{'extension'}) ? ".$Texi2HTML::THISDOC{'extension'}" : '');
                    }
                    # The remaining case is for sectionning elements with empty
                    # headings and no node associated. They will have a name
                    # with numbers, like "${docu_name}_$doc_nr", they may 
                    # collide with split indices names
                }
                else
                {
                    $element->{'file'} = $previous_file;
                }
            }
            $previous_file = $element->{'file'};
            do_element_targets($element, $use_node_file);
            print STDERR "# [$doc_nr] add_file($use_node_file,$new_file,".var_to_str($previous_file).") $element->{'file'} for $element->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
            add_file($element->{'file'});
        }
    }
    else
    { # not split
        add_file($docu_doc);
        foreach my $element(@elements_list)
        {
            $element->{'file'} = $docu_doc;
            $element->{'doc_nr'} = 0;
            do_element_targets($element);
        }
    }
    # 'pathological' cases. No texinfo sectionning element at all or no 
    # texi2html sectionning elements
    if (!@elements_list)
    {
        if (@all_elements)
        {
            # in fact this happens only if there is no top element, but still
            # sections, so only if USE_SECTIONS = 0 and there is no node.
            #document_warn ("No elements available for splitting") if (Texi2HTML::Config::get_conf('SPLIT'));
            foreach my $element (@all_elements)
            {
                #print STDERR "# no \@elements_list. Processing $element->{'texi'}\n";
                $element->{'file'} = $docu_doc;
                $element->{'doc_nr'} = 0;
                push @{$element->{'place'}}, @{$element->{'current_place'}};
                do_element_targets($element,$Texi2HTML::Config::NODE_FILENAMES);
                print STDERR "# no \@elements_list, setting $element->{'file'} for $element->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
            }
            add_file($docu_doc);
        }
        else
        {
            #document_warn ("No elements at all") if (Texi2HTML::Config::get_conf('SPLIT'));
            $element_before_anything->{'file'} = $docu_doc;
            $element_before_anything->{'doc_nr'} = 0;
            do_element_targets($element_before_anything,$Texi2HTML::Config::NODE_FILENAMES);
            print STDERR "# no element at all, setting $element_before_anything->{'file'} for $element_before_anything->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
        }
    }

    # correct the id and file for the things placed in footnotes
    foreach my $place(@{$footnote_element->{'place'}})
    {
        do_place_target_file ($place, $footnote_element, 'footnotes');
    }
    # if setcontentsaftertitlepage is set, the contents should be associated
    # with the titlepage. That's what is done there.
    push @$no_element_associated_place, $content_element{'contents'} 
      if (Texi2HTML::Config::get_conf('contents') and $Texi2HTML::THISDOC{'setcontentsaftertitlepage'});
    push @$no_element_associated_place, $content_element{'shortcontents'} 
      if (Texi2HTML::Config::get_conf('shortcontents') and $Texi2HTML::THISDOC{'setshortcontentsaftertitlepage'});
    # correct the id and file for the things placed in regions (copying...)
    foreach my $place(@$no_element_associated_place)
    {
#print STDERR "entry $place->{'entry'} texi $place->{'texi'}\n";
        $place->{'element'} = $element_top if (exists($place->{'element'}));
        do_place_target_file ($place, $element_top, 'no_associated_element');
    }
    
    # determine contents element and files
    foreach my $content_type(keys(%content_element))
    {
        # with set*aftertitlepage, there will always be a href to Contents
        # or Overview pointing to the top element, even if there is no 
        # titlepage outputed.
        if (!scalar(@{$all_content_elements{$content_type}}))
        {
            if  ($Texi2HTML::Config::INLINE_CONTENTS)
            {
                print STDERR "# No content $content_type\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                $content_element{$content_type} = undef;
            }
        }
        elsif ($Texi2HTML::Config::INLINE_CONTENTS and !Texi2HTML::Config::get_conf('set' . $content_type .'aftertitlepage'))
        { # use the last element for references in case there is more than one
            $content_element{$content_type} = $all_content_elements{$content_type}->[-1];
        }
    }
    my ($toc_file, $stoc_file);
    $toc_file = $docu_toc;
    $stoc_file = $docu_stoc;
    if ($Texi2HTML::Config::INLINE_CONTENTS)
    {
        $toc_file = $content_element{'contents'}->{'file'} if (defined($content_element{'contents'}));
        $stoc_file = $content_element{'shortcontents'}->{'file'} if (defined($content_element{'shortcontents'}));
    }
    $Texi2HTML::THISDOC{'toc_file'} = $toc_file; 
    $Texi2HTML::THISDOC{'stoc_file'} = $stoc_file; 
    
    print STDERR "# find NextFile and PrevFile\n" 
       if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    foreach my $element (@elements_list)
    {
        my $current_element = $element;
        my $file = $current_element->{'file'};
        my $previous_file;
        while ($current_element->{'back'})
        {
#print STDERR "Back $current_element->{'texi'}\n";
            $current_element = $current_element->{'back'};
            if ($current_element->{'file'} ne $file)
            {
                $previous_file = $current_element->{'file'};
                last;
            }
        }
        if (defined($previous_file))
        {
            while ($current_element->{'back'})
            {
                if ($current_element->{'back'}->{'file'} ne $previous_file)
                {
                    last;
                }
                $current_element = $current_element->{'back'};
            }
            $element->{'prevfile'} = $current_element;
        }

        $current_element = $element;
        while ($current_element->{'forward'})
        {
#print STDERR "Fwd $current_element->{'texi'}\n";
            $current_element = $current_element->{'forward'};
            if ($current_element->{'file'} ne $file)
            {
                 $element->{'nextfile'} = $current_element;
            }
        }
    }
    # convert directions in direction with first letter in all caps, to be
    # consistent with the convention used in the .init file.
    foreach my $element (@elements_list)
    {
        foreach my $direction (@element_directions)
        {
            my $direction_no_caps = $direction;
            $direction_no_caps =~ tr/A-Z/a-z/;
            $element->{$direction} = $element->{$direction_no_caps};
        }
    }

    ########################### debug prints
    foreach my $file (keys(%files))
    {
        last unless ($T2H_DEBUG & $DEBUG_ELEMENTS);
        print STDERR "$file: counter $files{$file}->{'counter'}\n";
    }
    my $output_elements = \@elements_list;
    if (!scalar(@elements_list) and ($T2H_DEBUG & $DEBUG_ELEMENTS))
    {
        print STDERR "No elements_list, no texi2html elements\n";
        $output_elements = \@all_elements;
    }
    foreach my $element ((@$output_elements, $footnote_element))
    {
        last unless ($T2H_DEBUG & $DEBUG_ELEMENTS);
        my $is_toplevel = 'not toplevel';
        $is_toplevel = 'toplevel' if ($element->{'toplevel'});
        print STDERR "$element ";
        if ($element->{'node'})
        {
            print STDERR "node($element->{'id'}, $is_toplevel, doc_nr $element->{'doc_nr'}($element->{'file'})) $element->{'texi'}:\n";
            print STDERR "  section_ref: $element->{'section_ref'}->{'texi'}\n" if (defined($element->{'section_ref'}));
            print STDERR "  with_section: $element->{'with_section'}->{'texi'}\n" if (defined($element->{'with_section'}));
        }
        elsif ($element->{'footnote'})
        {
            print STDERR "footnotes($element->{'id'}, file $element->{'file'})\n";
        }
        else 
        {
            my $number = "UNNUMBERED";
            $number = $element->{'number'} if ($element->{'number'});
            print STDERR "$number ($element->{'id'}, $is_toplevel, level $element->{'level'}-$element->{'toc_level'}, doc_nr $element->{'doc_nr'}($element->{'file'})) $element->{'texi'}:\n";
            print STDERR "  with_node: $element->{'with_node'}->{'texi'}\n" if (defined($element->{'with_node'}));
            print STDERR "  node_ref: $element->{'node_ref'}->{'texi'}\n" if (defined($element->{'node_ref'}));
        }

        if (!$element->{'footnote'})
        {
            if (!defined($files{$element->{'file'}}))
            {
               die "Bug: files{\$element->{'file'}} undef element $element->{'texi'}, file $element->{'file'}.";
            }
            print STDERR "  file: $element->{'file'} $files{$element->{'file'}}, counter $files{$element->{'file'}}->{'counter'}\n";
        }
        print STDERR "  level: $element->{'level'}\n" if (defined($element->{'level'}));
        print STDERR "  TOP($toplevel) " if ($element->{'top'});
        print STDERR "  u: $element->{'up'}->{'texi'}\n" if (defined($element->{'up'}));
        print STDERR "  ch: $element->{'child'}->{'texi'}\n" if (defined($element->{'child'}));
        print STDERR "  fb: $element->{'fastback'}->{'texi'}\n" if (defined($element->{'fastback'}));
        print STDERR "  b: $element->{'back'}->{'texi'}\n" if (defined($element->{'back'}));
        print STDERR "  p: $element->{'prev'}->{'texi'}\n" if (defined($element->{'prev'}));
        print STDERR "  u: $element->{'sectionup'}->{'texi'}\n" if (defined($element->{'sectionup'}));
        print STDERR "  n: $element->{'sectionnext'}->{'texi'}\n" if (defined($element->{'sectionnext'}));
	print STDERR "  t_n: $element->{'toplevelnext'}->{'texi'}\n" if (defined($element->{'toplevelnext'}));
	print STDERR "  t_p: $element->{'toplevelprev'}->{'texi'}\n" if (defined($element->{'toplevelprev'}));
        print STDERR "  n_u: $element->{'nodeup'}->{'texi'}\n" if (defined($element->{'nodeup'}));
        print STDERR "  f: $element->{'forward'}->{'texi'}\n" if (defined($element->{'forward'}));
        print STDERR "  follow: $element->{'following'}->{'texi'}\n" if (defined($element->{'following'}));
	print STDERR "  m_p: $element->{'menu_prev'}->{'texi'}\n" if (defined($element->{'menu_prev'}));
	print STDERR "  m_n: $element->{'menu_next'}->{'texi'}\n" if (defined($element->{'menu_next'}));
	print STDERR "  m_u: $element->{'menu_up'}->{'texi'}\n" if (defined($element->{'menu_up'}));
	print STDERR "  m_ch: $element->{'menu_child'}->{'texi'}\n" if (defined($element->{'menu_child'}));
        print STDERR "  ff: $element->{'fastforward'}->{'texi'}\n" if (defined($element->{'fastforward'}));
        print STDERR "  n_f: $element->{'nextfile'}->{'texi'}\n" if (defined($element->{'nextfile'}));
        print STDERR "  p_f: $element->{'prevfile'}->{'texi'}\n" if (defined($element->{'prevfile'}));
        my $section_childs = '';
        if (defined($element->{'section_childs'}))
        {
            foreach my $child (@{$element->{'section_childs'}})
            {
                $section_childs .= "$child->{'texi'}|";
            }
        }
        print STDERR "  s_chs: $section_childs\n" if ($section_childs ne '');
        my $node_childs = '';
        if (defined($element->{'node_childs'}))
        {
            foreach my $child (@{$element->{'node_childs'}})
            {
                $node_childs .= "$child->{'texi'}|";
            }
        }
        print STDERR "  n_chs: $node_childs\n" if ($node_childs ne '');

        if (defined($element->{'menu_up_hash'}))
        {
            print STDERR "  parent nodes:\n";
            foreach my $menu_up (keys%{$element->{'menu_up_hash'}})
            {
                print STDERR "   $menu_up ($element->{'menu_up_hash'}->{$menu_up})\n";
            }
        }
        print STDERR "  places: $element->{'place'}\n";
        foreach my $place(@{$element->{'place'}})
        {
            if (!$place->{'entry'} and !$place->{'float'} and !$place->{'texi'} and !$place->{'contents'} and !$place->{'shortcontents'} and (!defined($place->{'command'} or $place->{'command'} ne 'printindex')))
            {
                 print STDERR "BUG: unknown placed stuff ========\n";
                 foreach my $key (keys(%$place))
                 {
                      print STDERR "$key: $place->{$key}\n";
                 }
                 print STDERR "==================================\n";
            }
            elsif ($place->{'entry'})
            {
                print STDERR "    index($place): $place->{'entry'} ($place->{'id'}, $place->{'file'})\n";
            }
            elsif ($place->{'anchor'})
            {
                print STDERR "    anchor: $place->{'texi'} ($place->{'id'}, $place->{'file'})\n";
            }
            elsif ($place->{'float'})
            {
                if (defined($place->{'texi'}))
                {
                    print STDERR "    float($place): $place->{'texi'} ($place->{'id'}, $place->{'file'})\n";
                }
                else
                {
                    print STDERR "    float($place): NO LABEL ($place->{'id'}, $place->{'file'})\n";
                }
            }
            elsif ($place->{'contents'})
            {
                print STDERR "    contents\n";
            }
            elsif ($place->{'shortcontents'})
            {
                print STDERR "    shortcontents\n";
            }
            elsif (defined($place->{'command'}) and $place->{'command'} eq 'printindex')
            {
                print STDERR "    printindex $place->{'name'}\n";
            }
            else
            {
                print STDERR "    heading: $place->{'texi'} ($place->{'id'}, $place->{'file'})\n";
            }
        }
    }
    ########################### end debug prints
}

sub add_file($)
{
    my  $file = shift;
    if ($files{$file})
    {
         $files{$file}->{'counter'}++;
    }
    else
    {
         $files{$file} = { 
           'counter' => 1,
           'relative_foot_num' => 0,
           'foot_lines' => []
         };
    }
}

# find parent element which is a toplevel element
sub get_top($)
{
   my $element = shift;
   if ($element->{'node'})
   {
      if (defined($element->{'section_ref'}))
      {
         $element = $element->{'section_ref'};
      }
      else
      {
         return undef;
      }
   }
   return undef if ($element eq $element_before_anything);
   my $up = $element;
   while (!$up->{'toplevel'} and $up->{'tag'} ne 'top')
   {
       if (!defined($up->{'sectionup'}))
       {
           # If there is no section, it is normal not to have toplevel element,
           # and it is also the case if there is a low level element before
           # a top level element
           return undef;
       }
       $up = $up->{'sectionup'};
   }
   return $up;
}

sub get_node($)
{
    my $element = shift;
    return undef if (!defined($element));
    return $element if ($element->{'node'});
    return $element->{'with_node'} if ($element->{'with_node'});
}

sub do_section_names($$)
{
    my $number = shift;
    my $section = shift;
    #$section->{'name'} = substitute_line($section->{'texi'});
    my $texi = &$Texi2HTML::Config::heading_texi($section->{'tag'}, $section->{'texi'}, $section->{'number'});
    $section->{'text'} = substitute_line($texi, "\@$section->{'tag'}", undef, $section->{'line_nr'});
    $section->{'text_nonumber'} = substitute_line($section->{'texi'}, "\@$section->{'tag'}");
    # backward compatibility
    $section->{'name'} = $section->{'text_nonumber'};
    $section->{'no_texi'} = remove_texi($texi);
    $section->{'simple_format'} = simple_format(undef,undef,"simple_format \@$section->{'tag'}", $texi);
    $section->{'heading_texi'} = $texi;
}

# get the html names from the texi for all elements
sub do_names()
{
    print STDERR "# Doing ". scalar(keys(%nodes)) . " nodes, ".
        scalar(keys(%sections)) . " sections, " .
        scalar(keys(%headings)) . " headings in ". $#elements_list . 
        " elements\n" if ($T2H_DEBUG);
    # for nodes and anchors we haven't any state defined
    # This seems right, however, as we don't want @refs or @footnotes
    # or @anchors within nodes, section commands or anchors.
    foreach my $node (keys(%nodes))
    {
        my $texi = &$Texi2HTML::Config::heading_texi($nodes{$node}->{'tag'}, 
           $nodes{$node}->{'texi'}, undef);
        $nodes{$node}->{'text'} = substitute_line ($texi, "\@node", {'code_style' => 1}, $nodes{$node}->{'line_nr'});
        $nodes{$node}->{'text_nonumber'} = $nodes{$node}->{'text'};
        # backward compatibility -> maybe used to have the name without code_style ?
        $nodes{$node}->{'name'} = substitute_line($texi, "\@node");
        # FIXME: prefer?
        #$nodes{$node}->{'name'} = $nodes{$node}->{'text'};
        $nodes{$node}->{'no_texi'} = remove_texi($texi);
        $nodes{$node}->{'simple_format'} = simple_format(undef, undef, "simple_format \@node", $texi);
        $nodes{$node}->{'heading_texi'} = $texi;
        
        ################# debug
        # if $nodes{$node}->{'external_node'} and $nodes{$node}->{'seen'}
        # this is a bug, there should be a check that the node hasn't an
        # external node syntax.
        msg_debug ("$nodes{$node}->{'texi'} is external and was seen",  $nodes{$node}->{'line_nr'}) if ($nodes{$node}->{'seen'} and $nodes{$node}->{'external_node'});
        ################# end debug
    }
    foreach my $number (keys(%sections))
    {
        do_section_names($number, $sections{$number});
    }
    foreach my $number (keys(%headings))
    {
        do_section_names($number, $headings{$number});
    }
    print STDERR "# Names done\n" if ($T2H_DEBUG);
}


#+++############################################################################
#                                                                              #
# Stuff related to Index generation                                            #
#                                                                              #
#---############################################################################

# called during pass_structure
sub enter_index_entry($$$$$)
{
    my $prefix = shift;
    my $line_nr = shift;
    my $entry = shift;
    my $command = shift;
    my $state = shift;

    my $heading_element = $state->{'heading_element'};
    my $current_element = $state->{'current_element'};
    my $place = $state->{'place'};
    my $region = $state->{'region'};

    my $index_name = $index_prefix_to_name{$prefix};
    if (!defined($index_name))
    {
        line_error ("Undefined index command: ${prefix}index", $line_nr);
        $entry = '';
        $index_name = $prefix;
    }
    #if (!exists($current_element->{'tag'}) and !$current_element->{'footnote'})
    if ($current_element eq $element_before_anything)
    {
        #line_warn ("Index entry before document: \@${prefix}index $entry", $line_nr); 
        line_error ("Entry for index `$index_name' outside of any node.", $line_nr);
    }
    $entry = trim_comment_spaces ($entry, "index entry in \@$command", $line_nr);
    # The $key is mostly usefull for alphabetical sorting.
    # beware that the texinfo could be non empty, but the key is. So the
    # key should be used to determine whether the entry is empty or not.
    # This could be done later while sorting, but it doesn't really matter
    # since there are no error messages anyway.
    my $key = remove_texi($entry);
    my $id;

    my $index_entry_hidden = 1;
    if (!$region and $place eq $no_element_associated_place)
    {
        $region = 'no_place';
    }
    elsif (!defined($region))
    {
        $region = 'document';
        $index_entry_hidden = 0;
    }
    # don't add a specific index target if after a section or the index
    # entry is in @copying or the like
    unless ($index_entry_hidden)
    {
        $id = 'IDX' . ++$document_idx_num;
    }
    my $target = $id;
    # entry will later be in @code for code-like index entry. texi stays
    # the same.
    my $index_entry = {
           'entry'    => $entry,
           'key'      => $key,
           'texi'     => $entry,
           'element'  => $heading_element,
           'real_element'  => $current_element,
           'prefix'   => $prefix,
           'id'       => $id,
           'target'   => $target,
           'command'  => $command,
           'hidden'   => $index_entry_hidden,
           'region'   => $region,
           'line_nr'  => $line_nr,
           'index_name' => $index_name
    };
    
    my $region_text = $region;
    $region_text = 'main' if (!defined($region)); 
    my $id_text = $id;
    $id_text = 'NO ID' if (!defined($id));
    print STDERR "# in $region_text enter \@$command ${prefix}index($key) [$entry] with id $id_text ($index_entry)\n"
        if ($T2H_DEBUG & $DEBUG_INDEX);

    $index_entry->{'entry'} = '@code{'.$index_entry->{'entry'}.'}'
       if (defined($index_names{$index_name}) and 
        defined($index_names{$index_name}->{'prefixes'}) and 
        $index_names{$index_name}->{'prefixes'}->{$prefix} 
        and $key =~ /\S/);

    push @$place, $index_entry;

    #print STDERR "enter_index_entry: region $region, index_entry $index_entry, \@$command, texi `$entry'\n";
    # don't add the index entry to the list of index entries used for index
    # entry formatting, if the index entry appears in a region like copying 
    push @index_labels, $index_entry unless ($index_entry_hidden);
    push @{$Texi2HTML::THISDOC{'index_entries_array'}->{$index_name}}, $index_entry;
    push @{$Texi2HTML::THISDOC{'index_entries'}->{$region}->{$entry}->{'entries'}}, $index_entry;
}

# sort according to cmp if both $a and $b are alphabetical or non alphabetical, 
# otherwise the alphabetical is ranked first
sub by_alpha
{
    if ($a =~ /^[A-Za-z]/)
    {
        if ($b =~ /^[A-Za-z]/)
        {
            return lc($a) cmp lc($b);
        }
        else
        {
            return 1;
        }
    }
    elsif ($b =~ /^[A-Za-z]/)
    {
        return -1;
    }
    else
    {
        return lc($a) cmp lc($b);
    }
}

# these variables are global, so great care should be taken with
# state->{'multiple_state'}, ->{'region'}, ->{'region_pass'} and
# {'outside_document'}.
my $global_head_num = 0;       # heading index. it is global for the main doc, 
                               # and taken from the state if in multiple_pass.
my $global_foot_num = 0;
my $global_relative_foot_num = 0;
my @foot_lines = ();           # footnotes
my $copying_comment = '';      # comment constructed from text between
                               # @copying and @end copying with licence
my %acronyms_like = ();        # acronyms or similar commands associated texts
                               # the key are the commands, the values are
                               # hash references associating shorthands to
                               # texts.

# detailmenu    number of opened detailed menus
sub fill_state($)
{
    my $state = shift;
    foreach my $key ('preformatted', 'code_style', 'math_style', 'keep_texi',
      'keep_nr',  'detailmenu', 'direntry', 'sec_num', 'menu', 'multiple_pass')
    {
        $state->{$key} = 0 unless exists($state->{$key});
    }
       
    $state->{'paragraph_style'} = [ '' ] unless exists($state->{'paragraph_style'}); 
    $state->{'preformatted_stack'} = [ '' ] unless exists($state->{'preformatted_stack'}); 
    $state->{'command_stack'} = [] unless exists($state->{'command_stack'});
    $state->{'quotation_stack'} = [] unless exists($state->{'quotation_stack'});
    # if there is no $state->{'element'} the first element is used
    if ((!$state->{'element'} or $state->{'element'}->{'before_anything'}) and (@elements_list))
    {
        $state->{'element'} = $elements_list[0];
    }
    # this is consistent with what is done in rearrange_elements
    $state->{'element'} = {'file' => $docu_doc, 'texi' => 'VIRTUAL ELEMENT'} if (!$state->{'element'});
        #$state->{'element'} = $elements_list[0] unless ((!@elements_list) or (exists($state->{'element'}) and !$state->{'element'}->{'before_anything'}));
}

sub do_element_directions ($)
{
   my $this_element = shift;
   #print STDERR "Doing hrefs for $this_element->{'texi'} First ";
   $Texi2HTML::HREF{'First'} = href($element_first, $this_element->{'file'});
   #print STDERR "Last ";
   $Texi2HTML::HREF{'Last'} = href($element_last, $this_element->{'file'});
   #print STDERR "Index ";
   $Texi2HTML::HREF{'Index'} = href($element_chapter_index, $this_element->{'file'}) if (defined($element_chapter_index));
   #print STDERR "Top ";
   $Texi2HTML::HREF{'Top'} = href($element_top, $this_element->{'file'});
   if ($Texi2HTML::Config::INLINE_CONTENTS)
   {
      $Texi2HTML::HREF{'Contents'} = href($content_element{'contents'}, $this_element->{'file'});
      $Texi2HTML::HREF{'Overview'} = href($content_element{'shortcontents'}, $this_element->{'file'});
   }
   else 
   {
      $Texi2HTML::HREF{'Contents'} = file_target_href($Texi2HTML::THISDOC{'toc_file'}, $this_element->{'file'}, $content_element{'contents'}->{'target'}) if (@{$Texi2HTML::TOC_LINES} and defined($content_element{'contents'}));
      $Texi2HTML::HREF{'Overview'} = file_target_href($Texi2HTML::THISDOC{'stoc_file'}, $this_element->{'file'}, $content_element{'shortcontents'}->{'target'}) if (@{$Texi2HTML::OVERVIEW} and defined($content_element{'shortcontents'}));
   }
   if ($Texi2HTML::THISDOC{'do_about'})
   {
      $Texi2HTML::HREF{'About'} = file_target_href($docu_about, $this_element->{'file'}, $Texi2HTML::Config::misc_pages_targets{'About'});
   }
   $Texi2HTML::HREF{'Footnotes'} = file_target_href($docu_foot, $this_element->{'file'}, $Texi2HTML::Config::misc_pages_targets{'Footnotes'});
   foreach my $direction (@element_directions)
   {
      my $elem = $this_element->{$direction};
      $Texi2HTML::NODE{$direction} = undef;
      $Texi2HTML::HREF{$direction} = undef;
      $Texi2HTML::NAME{$direction} = undef;
      #print STDERR "$direction \n";
      next unless (defined($elem));
      if ($elem->{'node'} or $elem->{'external_node'} or !$elem->{'seen'})
      {
         $Texi2HTML::NODE{$direction} = $elem->{'text'};
      }
      elsif ($elem->{'with_node'})
      {
         $Texi2HTML::NODE{$direction} = $elem->{'with_node'}->{'text'};
      }
      if (!$elem->{'seen'})
      {
         $Texi2HTML::HREF{$direction} = do_external_href($elem->{'texi'});
      }
      else
      {
         $Texi2HTML::HREF{$direction} = href($elem, $this_element->{'file'});
      }
      $Texi2HTML::NAME{$direction} = $elem->{'text'};
      $Texi2HTML::NO_TEXI{$direction} = $elem->{'no_texi'};
      $Texi2HTML::SIMPLE_TEXT{$direction} = $elem->{'simple_format'};
      #print STDERR "$direction ($this_element->{'texi'}): \n  NO_TEXI: $Texi2HTML::NO_TEXI{$direction}\n  NAME $Texi2HTML::NAME{$direction}\n  NODE $Texi2HTML::NODE{$direction}\n  HREF $Texi2HTML::HREF{$direction}\n\n";
   }
   #print STDERR "\nDone hrefs for $this_element->{'texi'}\n";
}

sub open_out_file($)
{
  my $new_file = shift;
  my $do_page_head = 0;
  if ($files{$new_file}->{'filehandle'})
  {
    $Texi2HTML::THISDOC{'FH'} = $files{$new_file}->{'filehandle'};
  }
  else
  {
    $Texi2HTML::THISDOC{'FH'} = open_out("$docu_rdir$new_file");
#print STDERR "OPEN $docu_rdir$file, $Texi2HTML::THISDOC{'FH'}". scalar($Texi2HTML::THISDOC{'FH'})."\n";
    $files{$new_file}->{'filehandle'} = $Texi2HTML::THISDOC{'FH'};
    $do_page_head = 1;
  }
  return $do_page_head;
}

sub set_line_nr_in_stack($$$)
{
   my $state = shift;
   my $stack = shift;
   my $line_nr = shift;

   if ($state->{'keep_texi'} and defined($line_nr))
   {
        my $stack_index = $#$stack;
        while ($stack_index >= 0 and defined($stack->[$stack_index]->{'keep_line_nr'}))
        {
            push @{$stack->[$stack_index]->{'keep_line_nr'}}, $line_nr;
            $stack_index --;
        }
    }
}

sub unref_file($)
{
    my $file = shift;
    $files{$file}->{'counter'}--;
    print STDERR "# Unref file $file, remaining counter $files{$file}->{'counter'}\n"
                 if ($T2H_DEBUG & $DEBUG_ELEMENTS);

}

sub pass_text($$)
{
    my $doc_lines = shift;
    my $doc_numbers = shift;
    my %state;
    fill_state(\%state);
    my @stack;
    my $text = '';
    my $doc_nr;
    my $in_doc = 0;
    my @text =();
    my $one_section = 1 if (@elements_list <= 1);

    push_state(\%state);

    set_special_names();
    $footnote_element->{'text'} = $Texi2HTML::NAME{'Footnotes'};
    # We set titlefont only if the titlefont appeared in the top element
    if (defined($element_top->{'titlefont'}))
    {
         $Texi2HTML::THISDOC{'titlefont_texi'} = $element_top->{'titlefont'};
         # backward compatibility nov 2009
         $value{'_titlefont'} = $element_top->{'titlefont'};
    }
    
    # prepare %Texi2HTML::THISDOC
    $Texi2HTML::THISDOC{'command_stack'} = $state{'command_stack'};

    #foreach my $texi_cmd (('shorttitlepage', 'settitle', 'author', 'title',
    #       'subtitle'))
    #{
    #    $Texi2HTML::THISDOC{$texi_cmd . '_texi'} = $value{'_' . $texi_cmd};
    #}
    $Texi2HTML::THISDOC{'top_texi'} = $section_top->{'texi'} if (defined($section_top));

    $Texi2HTML::THISDOC{'fulltitle_texi'} = '';
    foreach my $possible_fulltitle('settitle', 'title', 'shorttitlepage', 'top', 'titlefont')
    {
        if (defined($Texi2HTML::THISDOC{$possible_fulltitle . '_texi'}) and $Texi2HTML::THISDOC{$possible_fulltitle . '_texi'} =~ /\S/)
        {
            $Texi2HTML::THISDOC{'fulltitle_texi'} = $Texi2HTML::THISDOC{$possible_fulltitle . '_texi'};
            last;
        }
    }
    $Texi2HTML::THISDOC{'simpletitle_texi'} = '';
    foreach my $possible_simpletitle('settitle', 'shorttitlepage')
    {
        if (defined($Texi2HTML::THISDOC{$possible_simpletitle . '_texi'}) and $Texi2HTML::THISDOC{$possible_simpletitle . '_texi'} =~ /\S/)
        {
            $Texi2HTML::THISDOC{'simpletitle_texi'} = $Texi2HTML::THISDOC{$possible_simpletitle . '_texi'};
            last;
        }
    }

    foreach my $doc_thing (('shorttitlepage', 'settitle', 'author',
           'titlefont', 'subtitle', 'title', 'fulltitle', 'simpletitle'))
    {
        my $thing_texi = $Texi2HTML::THISDOC{$doc_thing . '_texi'};
        $Texi2HTML::THISDOC{$doc_thing} = substitute_line($thing_texi, "\@$doc_thing");
        $Texi2HTML::THISDOC{$doc_thing . '_no_texi'} =
           remove_texi($thing_texi);
        $Texi2HTML::THISDOC{$doc_thing . '_simple_format'} =
           simple_format(undef, undef, "simple_format \@$doc_thing", $thing_texi);
    }


    # find the triplet (Top name, Top with texi removed, Top simply formatted)
    # the corresponding href is used a lot but these are only used because
    # they are used in LINKS_BUTTONS...

    my $element_top_Top = [undef,undef,undef];
    my $node_top_Top = [undef,undef,undef];
    # Preferred Top name is the element_top name if it is not the @node Top
    # the @node Top may also be used, but before fulltitle is tried
    if (defined($element_top))
    {
        if ($element_top->{'node'} and $element_top->{'texi'} =~ /^Top$/i)
        {
           $node_top_Top = [ $element_top->{'text'}, $element_top->{'no_texi'}, $element_top->{'simple_format'} ];
        }
        else
        {
           $element_top_Top = [ $element_top->{'text'}, $element_top->{'no_texi'}, $element_top->{'simple_format'} ];
        }
    }
    # FIXME remove fulltitle?
    foreach my $possible_top (
       [substitute_line($Texi2HTML::Config::TOP_HEADING, '$TOP_HEADING'), 
        remove_texi($Texi2HTML::Config::TOP_HEADING), 
        simple_format(undef, undef, 'simple_format $TOP_HEADING', $Texi2HTML::Config::TOP_HEADING)],
       $element_top_Top,
       [$Texi2HTML::THISDOC{'fulltitle'}, 
        $Texi2HTML::THISDOC{'fulltitle_no_texi'}, 
        $Texi2HTML::THISDOC{'fulltitle_simple_format'}],
       $node_top_Top
      )
    {
        if (defined($possible_top->[0]) and $possible_top->[0] =~ /\S/)
        {
           ($Texi2HTML::NAME{'Top'}, $Texi2HTML::NO_TEXI{'Top'}, $Texi2HTML::SIMPLE_TEXT{'Top'}) = @$possible_top;
           #($top_name, $top_no_texi, $top_simple_format) = @$possible_top;
           last;
        }
    }
     
    $Texi2HTML::THISDOC{'program'} = $THISPROG;
    $Texi2HTML::THISDOC{'program_homepage'} = $T2H_HOMEPAGE;
    $Texi2HTML::THISDOC{'program_authors'} = $T2H_AUTHORS;
    foreach my $command (('authors', 'subtitles', 'titles'))
    {
        $Texi2HTML::THISDOC{$command} = [];
        my $i;
        for ($i = 0; $i < $#{$Texi2HTML::THISDOC{$command .'_texi'}} + 1; $i++) 
        {
            my $texi_line = $Texi2HTML::THISDOC{$command .'_texi'}->[$i];
            chomp ($texi_line);
            $Texi2HTML::THISDOC{$command}->[$i] = substitute_line($texi_line, "\@$command");
            #print STDERR "$command:$i: $Texi2HTML::THISDOC{$command}->[$i]\n";
        }
    }

    $Texi2HTML::THISDOC{'do_about'} = 1 unless (defined($Texi2HTML::THISDOC{'do_about'}) or $one_section or (not Texi2HTML::Config::get_conf('SPLIT') and not Texi2HTML::Config::get_conf('headers')));
    
    $Texi2HTML::NAME{'First'} = $element_first->{'text'};
    $Texi2HTML::NAME{'Last'} = $element_last->{'text'};
    $Texi2HTML::NAME{'Index'} = $element_chapter_index->{'text'} if (defined($element_chapter_index));
    $Texi2HTML::NAME{'Index'} = $Texi2HTML::Config::INDEX_CHAPTER if ($Texi2HTML::Config::INDEX_CHAPTER ne '');

    $Texi2HTML::NO_TEXI{'First'} = $element_first->{'no_texi'};
    $Texi2HTML::NO_TEXI{'Last'} = $element_last->{'no_texi'};
    $Texi2HTML::NO_TEXI{'Index'} = $element_chapter_index->{'no_texi'} if (defined($element_chapter_index));
    $Texi2HTML::SIMPLE_TEXT{'First'} = $element_first->{'simple_format'};
    $Texi2HTML::SIMPLE_TEXT{'Last'} = $element_last->{'simple_format'};
    $Texi2HTML::SIMPLE_TEXT{'Index'} = $element_chapter_index->{'simple_format'} if (defined($element_chapter_index));

    # FIXME we do the regions formatting here, even if they never appear.
    # so we should be very carefull to take into accout 'outside_document' to
    # avoid messing with information that has to be set in the main document.
    # also the error messages will appear even though the corresponding 
    # texinfo is never used.
    my ($region_text, $region_no_texi, $region_simple_format);
    ($region_text, $region_no_texi, $region_simple_format) = do_special_region_lines('documentdescription');
    &$Texi2HTML::Config::documentdescription($region_lines{'documentdescription'},$region_text, $region_no_texi, $region_simple_format);
    
    # do copyright notice inserted in comment at the beginning of the files
    ($region_text, $region_no_texi, $region_simple_format) = do_special_region_lines('copying');
    $copying_comment = &$Texi2HTML::Config::copying_comment($region_lines{'copying'}, $region_text, $region_no_texi, $region_simple_format);

    $Texi2HTML::THISDOC{'copying_comment'} = $copying_comment;
    # must be after toc_body, but before titlepage
    foreach my $command ('contents', 'shortcontents')
    {
        next if (!defined($content_element{$command}));
        my $toc_lines = &$Texi2HTML::Config::inline_contents(undef, $command, $content_element{$command}, \@sections_list);
        @{$Texi2HTML::THISDOC{'inline_contents'}->{$command}} = @$toc_lines if (defined($toc_lines));
    }
    
    ($region_text, $region_no_texi, $region_simple_format) = do_special_region_lines('titlepage');

    &$Texi2HTML::Config::titlepage($region_lines{'titlepage'}, $region_text, $region_no_texi, $region_simple_format);

    &$Texi2HTML::Config::init_out();

    # FIXME It is not clear whether it should be here or before 
    # command_handler_output calls. After, it means that 
    # command_handler_output may modify the initializations. Before
    # it allows to look at the values from the preceding pass.
    texinfo_initialization(2);

    foreach my $handler(@Texi2HTML::Config::command_handler_output)
    {
        &$handler;
    }

    ############################################################################
    # print frame and frame toc file
    #
    if ( $Texi2HTML::Config::FRAMES )
    {
        my $FH = open_out($docu_frame_file);
        print STDERR "# Creating frame in $docu_frame_file ...\n" if $T2H_VERBOSE;
        &$Texi2HTML::Config::print_frame($FH, $docu_toc_frame_file, $docu_top_file);
        close_out($FH, $docu_frame_file);

        $FH = open_out($docu_toc_frame_file);
        print STDERR "# Creating toc frame in $docu_frame_file ...\n" if $T2H_VERBOSE;
        &$Texi2HTML::Config::print_toc_frame($FH, $Texi2HTML::OVERVIEW);
        close_out($FH, $docu_toc_frame_file);
    }



    ############################################################################
    # Start processing the document
    #

    #my $FH;
    my $line_nr;
    my $current_file;
    my $first_section = 0; # 1 if it is the first section of a page
    my $previous_is_top = 0; # 1 if it is the element following the top element

    my $cline;
    # this is true for the state that goes through the document
    $state{'inside_document'} = 1;
    while (@$doc_lines)
    {
        $cline = shift @$doc_lines;
        my $chomped_line = $cline;
        if (!chomp($chomped_line) and @$doc_lines)
        { # if the line has no end of line it is concatenated with the next
          # this shouldn't happen anymore. And will certainly mess up
          # line counting. Let it be a bug.
          msg_debug ("no end of line line passed in doc_line",$line_nr);
             $doc_lines->[0] = $cline . $doc_lines->[0];
             next;
        }
        $line_nr = shift (@$doc_numbers);
        $Texi2HTML::THISDOC{'line_nr'} = $line_nr;
        print STDERR "BUG: line_nr not defined in pass_text. cline: $cline" if (!defined($cline));
	#dump_stack(\$text, \@stack, \%state);

        # make sure the current state from here is $Texi2HTML::THIS_ELEMENT
        # in case it was set by the user.
        $state{'element'} = $Texi2HTML::THIS_ELEMENT if (defined($Texi2HTML::THIS_ELEMENT));
        if (!$state{'raw'} and !$state{'verb'})
        {
            my $tag = '';
            $tag = $1 if ($cline =~ /^\@(\w+)/);
            if ($tag eq 'setfilename' and $Texi2HTML::Config::IGNORE_BEFORE_SETFILENAME)
            { # FIXME this should be done only if @setfilename is before any
              # element
                if (defined($Texi2HTML::THIS_ELEMENT))
                {
                    line_warn ("\@$tag after the first element", $line_nr);
                }
                else
                {
                    @{$Texi2HTML::THIS_SECTION} = ();
                }
            }

            if (($tag eq 'node') or (defined($sec2level{$tag}) and ($tag !~ /heading/)))
            {
                # in pass text node and section shouldn't appear in formats
			#print STDERR "close_stack before \@$tag\n";
			#print STDERR "text!$text%" if (! @stack);
                close_stack(\$text, \@stack, \%state, $line_nr);
                msg_debug ("text undef", $line_nr) if (!defined($text));
                push @{$Texi2HTML::THIS_SECTION}, $text if ($text ne '');
                $text = '';

                $state{'sec_num'}++ if ($sec2level{$tag} and ($tag ne 'top'));
                my $new_element;
                my $current_element;

                # handle node and structuring elements
                $current_element = shift (@all_elements);
                ########################## begin debug section
                if ($current_element->{'node'})
                {
                    print STDERR 'NODE ' . "$current_element->{'texi'}($current_element->{'file'})" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                    print STDERR "($current_element->{'section_ref'}->{'texi'})" if ($current_element->{'section_ref'} and ($T2H_DEBUG & $DEBUG_ELEMENTS));
                }
                else
                {
                    print STDERR 'SECTION ' . $current_element->{'texi'} if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                }
                print STDERR ": $cline" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                ########################## end debug section

                # The element begins a new section if there is no previous
                # or the reference element is not the same
                if (defined($current_element->{'element_ref'}) and (!$Texi2HTML::THIS_ELEMENT or ($current_element->{'element_ref'} ne $Texi2HTML::THIS_ELEMENT)))
                {
                    $new_element = $current_element->{'element_ref'};

                    ########################### debug
                    my $old = 'NO_OLD';
                    $old = $Texi2HTML::THIS_ELEMENT->{'texi'} if (defined($Texi2HTML::THIS_ELEMENT));
                    print STDERR "NEW: $new_element->{'texi'}, OLD: $old\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                    ########################### end debug
                    # print the element that just finished
                    if ($Texi2HTML::THIS_ELEMENT)
                    {
                        finish_element($Texi2HTML::THISDOC{'FH'}, $Texi2HTML::THIS_ELEMENT, $new_element, $first_section);
                        $first_section = 0;
                        $previous_is_top = 0 if (!$Texi2HTML::THIS_ELEMENT->{'top'});
                        @{$Texi2HTML::THIS_SECTION} = ();
                    }
                    else
                    {
                        print STDERR "# Writing elements:" if ($T2H_VERBOSE);
                        if ($Texi2HTML::Config::IGNORE_PREAMBLE_TEXT)
                        {
                             @{$Texi2HTML::THIS_SECTION} = ();
                        }
                        # remove empty for the first document lines
                        shift @{$Texi2HTML::THIS_SECTION} while (@{$Texi2HTML::THIS_SECTION} and ($Texi2HTML::THIS_SECTION->[0] =~ /^\s*$/));
                        my $title = &$Texi2HTML::Config::print_title();
                        unshift @{$Texi2HTML::THIS_SECTION}, $title if (defined($title) and $title ne '');
                    }
                    # begin new element
                    $Texi2HTML::THIS_ELEMENT = $new_element;
                    $state{'element'} = $Texi2HTML::THIS_ELEMENT;

                    do_element_directions($Texi2HTML::THIS_ELEMENT);
                    unref_file ($Texi2HTML::THIS_ELEMENT->{'file'});
                    #if (!defined($previous_file) or ($Texi2HTML::THIS_ELEMENT->{'file'} ne $previous_file))
                    if (!defined($current_file) or ($Texi2HTML::THIS_ELEMENT->{'file'} ne $current_file))
                    {
                        $current_file = $Texi2HTML::THIS_ELEMENT->{'file'};
                        print STDERR "\n" if ($T2H_VERBOSE and !$T2H_DEBUG);
                        print STDERR "# Writing to $docu_rdir$current_file " if $T2H_VERBOSE;
                        my $do_page_head = open_out_file($current_file);
                        if ($Texi2HTML::THIS_ELEMENT->{'top'})
                        {
                             &$Texi2HTML::Config::print_Top_header($Texi2HTML::THISDOC{'FH'}, $do_page_head);
                             $previous_is_top = 1;
                        }
                        else
                        {
                             &$Texi2HTML::Config::print_page_head($Texi2HTML::THISDOC{'FH'}) if ($do_page_head);
                             &$Texi2HTML::Config::print_chapter_header($Texi2HTML::THISDOC{'FH'}, $Texi2HTML::THIS_ELEMENT) if Texi2HTML::Config::get_conf('SPLIT') eq 'chapter';
                             &$Texi2HTML::Config::print_section_header($Texi2HTML::THISDOC{'FH'}, $Texi2HTML::THIS_ELEMENT) if Texi2HTML::Config::get_conf('SPLIT') eq 'section';
                        }
                        $first_section = 1;
                    }
                    print STDERR "." if ($T2H_VERBOSE);
                    print STDERR "\n" if ($T2H_DEBUG);
                }
                
                my $cmd_line = $cline;
                $cmd_line =~ s/\@$tag\s*//;
                my $heading_formatted = &$Texi2HTML::Config::element_heading($current_element, $tag, $cmd_line, substitute_line($cmd_line, "\@$tag"), undef, $one_section, $current_element->{'this'}, $first_section, $current_element->{'top'}, $previous_is_top, $cline, $current_element->{'id'}, $new_element);
                push @{$Texi2HTML::THIS_SECTION}, $heading_formatted if (defined($heading_formatted) and ($heading_formatted ne ''));
                next;
            }
        }

        set_line_nr_in_stack(\%state, \@stack, $line_nr);
        scan_line($cline, \$text, \@stack, \%state, $line_nr);

	#print STDERR "after scan_line: $cline";
	#dump_stack(\$text, \@stack, \%state);
        next if (@stack);
        if ($text ne '')
        { 
            push @{$Texi2HTML::THIS_SECTION}, $text;
            $text = '';
        }
    }
    # close stack at the end of pass text
    close_stack(\$text, \@stack, \%state, $line_nr);
    if (defined($text))
    {
        push @{$Texi2HTML::THIS_SECTION}, $text;
    }
    print STDERR "\n" if ($T2H_VERBOSE);
 
    # if no sections, then simply print document as is
    if ($one_section)
    {
        # may happen if there are 0 sections
        if (! defined($Texi2HTML::THISDOC{'FH'}))
        {
          open_out_file($docu_doc);
          &$Texi2HTML::Config::print_page_head($Texi2HTML::THISDOC{'FH'});
          shift @{$Texi2HTML::THIS_SECTION} while (@{$Texi2HTML::THIS_SECTION} and ($Texi2HTML::THIS_SECTION->[0] =~ /^\s*$/));
          my $title = &$Texi2HTML::Config::print_title();
          unshift @{$Texi2HTML::THIS_SECTION}, $title if (defined($title) and $title ne '');
        }
        if (@foot_lines)
        {
            &$Texi2HTML::Config::foot_section (\@foot_lines);
            push @{$Texi2HTML::THIS_SECTION}, @foot_lines;
        }
        print STDERR "# Write the section $Texi2HTML::THIS_ELEMENT->{'texi'}\n" if ($T2H_VERBOSE);
        &$Texi2HTML::Config::one_section($Texi2HTML::THISDOC{'FH'}, $Texi2HTML::THIS_ELEMENT);
        close_out($Texi2HTML::THISDOC{'FH'}, $docu_doc_file);
        # no misc element is done
        return;
    }

    finish_element ($Texi2HTML::THISDOC{'FH'}, $Texi2HTML::THIS_ELEMENT, undef, $first_section);

    ############################################################################
    # Print ToC, Overview, Footnotes
    #
    foreach my $direction (@element_directions)
    {
        $Texi2HTML::HREF{$direction} = undef;
        delete $Texi2HTML::HREF{$direction};
        # it is better to undef in case the references to these hash entries
        # are used, as if deleted, the
        # references are still refering to the old, undeleted element
        # (we could do both)
        $Texi2HTML::NAME{$direction} = undef;
        $Texi2HTML::NO_TEXI{$direction} = undef;
        $Texi2HTML::SIMPLE_TEXT{$direction} = undef;
        $Texi2HTML::NODE{$direction} = undef;

        $Texi2HTML::THIS_ELEMENT = undef;
    }
    my $about_body;
    $about_body = &$Texi2HTML::Config::about_body() if (defined($Texi2HTML::Config::about_body));
    # @foot_lines is emptied in finish_element if footnotestyle separate
    my %misc_page_infos = (
       'Footnotes' => { 'file' => $docu_foot_file, 
          'relative_file' => $docu_foot, 
          'process' => $Texi2HTML::Config::print_Footnotes,
          'section' => \@foot_lines },
       'Contents' => { 'file' => $docu_toc_file,
           'relative_file' => $docu_toc, 
           'process' => $Texi2HTML::Config::print_Toc,
           'section' => $Texi2HTML::TOC_LINES },
       'Overview' => { 'file' => $docu_stoc_file,
           'relative_file' => $docu_stoc, 
           'process' => $Texi2HTML::Config::print_Overview,
           'section' => $Texi2HTML::OVERVIEW },
       'About' => { 'file' => $docu_about_file,
           'relative_file' => $docu_about, 
            'process' => $Texi2HTML::Config::print_About,
            'section' => [$about_body] }
    );
    $misc_page_infos{'Footnotes'}->{'do'} = 1 if (@foot_lines);
    $misc_page_infos{'Contents'}->{'do'} = 1 if 
       (@{$Texi2HTML::TOC_LINES} and !$Texi2HTML::Config::INLINE_CONTENTS and (!Texi2HTML::Config::get_conf('setcontentsaftertitlepage') or !$Texi2HTML::Config::USE_TITLEPAGE_FOR_TITLE));
    $misc_page_infos{'Overview'}->{'do'} = 1 if
       (@{$Texi2HTML::OVERVIEW} and !$Texi2HTML::Config::INLINE_CONTENTS and (!Texi2HTML::Config::get_conf('setshortcontentsaftertitlepage') or !$Texi2HTML::Config::USE_TITLEPAGE_FOR_TITLE));
    $misc_page_infos{'About'}->{'do'} = 1 if ($about_body and $Texi2HTML::THISDOC{'do_about'});
         
    foreach my $misc_page('Footnotes', 'Contents', 'Overview', 'About')
    {
        next unless ($misc_page_infos{$misc_page}->{'do'});
        my $file = $misc_page_infos{$misc_page}->{'file'};
        my $relative_file = $misc_page_infos{$misc_page}->{'relative_file'};
        print STDERR "# writing $misc_page in $file\n" if $T2H_VERBOSE;
        my $saved_FH;
        my $open_new = 0;
        if ($relative_file ne $docu_doc)
        {
            $saved_FH = $Texi2HTML::THISDOC{'FH'};
            # FIXME the file may have the same name than another file. Use
            # open_out_file?
            $Texi2HTML::THISDOC{'FH'} = open_out ($file);
            print STDERR "# Opening $file for $misc_page\n" if $T2H_VERBOSE;
            $open_new = 1;
        }
        else
        {
            print STDERR "# writing $misc_page in current file\n" if $T2H_VERBOSE;
        }
        foreach my $href_page (keys(%misc_page_infos))
        {
            $Texi2HTML::HREF{$href_page} = file_target_href(
               $misc_page_infos{$href_page}->{'relative_file'}, $relative_file,
               $Texi2HTML::Config::misc_pages_targets{$href_page})
                 if ($misc_page_infos{$href_page}->{'do'});
        }
        #print STDERR "Doing hrefs for $misc_page First ";
        $Texi2HTML::HREF{'First'} = href($element_first, $relative_file);
        #print STDERR "Last ";
        $Texi2HTML::HREF{'Last'} = href($element_last, $relative_file);
        #print STDERR "Index ";
        $Texi2HTML::HREF{'Index'} = href($element_chapter_index, $relative_file) if (defined($element_chapter_index));
        #print STDERR "Top ";
        $Texi2HTML::HREF{'Top'} = href($element_top, $relative_file);
        if ($Texi2HTML::Config::INLINE_CONTENTS)
        {
            $Texi2HTML::HREF{'Contents'} = href($content_element{'contents'}, $relative_file);
            $Texi2HTML::HREF{'Overview'} = href($content_element{'shortcontents'}, $relative_file);
        }
        $Texi2HTML::HREF{$misc_page} = '#' . $Texi2HTML::Config::misc_pages_targets{$misc_page};
        $Texi2HTML::HREF{'This'} = $Texi2HTML::HREF{$misc_page};
        $Texi2HTML::NAME{'This'} = $Texi2HTML::NAME{$misc_page};
        $Texi2HTML::NO_TEXI{'This'} = $Texi2HTML::NO_TEXI{$misc_page};
        $Texi2HTML::SIMPLE_TEXT{'This'} = $Texi2HTML::SIMPLE_TEXT{$misc_page};
        $Texi2HTML::THIS_SECTION = $misc_page_infos{$misc_page}->{'section'}
            if defined($misc_page_infos{$misc_page}->{'section'});
        &{$misc_page_infos{$misc_page}->{'process'}}($Texi2HTML::THISDOC{'FH'}, $open_new, $misc_page);
        
        if ($open_new)
        {
            close_out($Texi2HTML::THISDOC{'FH'}, $file);
            $Texi2HTML::THISDOC{'FH'} = $saved_FH;
        }
    }
        
    unless (Texi2HTML::Config::get_conf('SPLIT'))
    {
        &$Texi2HTML::Config::print_page_foot($Texi2HTML::THISDOC{'FH'});
        # this leaves the possibility for external code to close the file
        # without erroring out
        close_out ($Texi2HTML::THISDOC{'FH'}, $docu_doc_file) if (fileno($Texi2HTML::THISDOC{'FH'}));
    }
    pop_state();
}

# print section, close file if needed.
sub finish_element($$$$)
{
    my $FH = shift;
    my $element = shift;
    my $new_element = shift;
    my $first_section = shift;
#print STDERR "FINISH_ELEMENT($FH)($element->{'texi'})[$element->{'file'}] counter $files{$element->{'file'}}->{'counter'}\n";

    # handle foot notes
    if (Texi2HTML::Config::get_conf('SPLIT') and scalar(@foot_lines) 
        and (Texi2HTML::Config::get_conf('footnotestyle') eq 'end')
        and  (! $new_element or
        ($element and ($new_element->{'file'} ne $element->{'file'})))
       )
    {
        if ($files{$element->{'file'}}->{'counter'})
        {# there are other elements in that page we are not on its foot
            $files{$element->{'file'}}->{'relative_foot_num'} 
               = $global_relative_foot_num;
            push @{$files{$element->{'file'}}->{'foot_lines'}},
                @foot_lines;
        }
        else
        {# we output the footnotes as we are at the file end
             unshift @foot_lines, @{$files{$element->{'file'}}->{'foot_lines'}};
             &$Texi2HTML::Config::foot_section (\@foot_lines);
             push @{$Texi2HTML::THIS_SECTION}, @foot_lines;
        }
        if ($new_element)
        {
            $global_relative_foot_num = 
               $files{$new_element->{'file'}}->{'relative_foot_num'};
        }
        @foot_lines = ();
    }

    if ($element->{'top'})
    {
        ############### debug
        #print STDERR "TOP $element->{'texi'}, @{$Texi2HTML::THIS_SECTION}\n";
        die "element->{'top'} $element ne element_top $element_top" if ($element ne $element_top);
        print STDERR "# Doing element top\n"
           if ($T2H_DEBUG & $DEBUG_ELEMENTS);
        print STDERR "[Top]" if ($T2H_VERBOSE);
        ############### end debug

        &$Texi2HTML::Config::print_Top($FH, $element->{'titlefont'}, $element);
        my $end_page = 0;
        if (Texi2HTML::Config::get_conf('SPLIT'))
        {
            if ($files{$element->{'file'}}->{'counter'} == 0)
            {
                $end_page = 1;
            }
        }
        &$Texi2HTML::Config::print_Top_footer($FH, $end_page, $element);
        close_out($FH, $docu_top_file) if ($end_page);
    }
    else
    {
        print STDERR "# do element $element->{'texi'}\n"
           if ($T2H_DEBUG & $DEBUG_ELEMENTS);
        &$Texi2HTML::Config::print_section($FH, $first_section, 0, $element);
        ################# debug
        my $new_elem_file = 'NO ELEM => no file';
        $new_elem_file = $new_element->{'file'} if (defined($new_element));
        print STDERR "# FILES new: $new_elem_file old(".fileno($FH)."): $element->{'file'}\n"
           if ($T2H_DEBUG & $DEBUG_ELEMENTS);
        ################# end debug
        if (defined($new_element) and ($new_element->{'file'} ne $element->{'file'}))
        {
            print STDERR "# End of section with change in file(".fileno($FH).") $element->{'file'} -> $new_element->{'file'}\n"
                 if ($T2H_DEBUG & $DEBUG_ELEMENTS);
             if (!$files{$element->{'file'}}->{'counter'})
             {
                 &$Texi2HTML::Config::print_chapter_footer($FH, $element) if (Texi2HTML::Config::get_conf('SPLIT') eq 'chapter');
                 &$Texi2HTML::Config::print_section_footer($FH, $element) if (Texi2HTML::Config::get_conf('SPLIT') eq 'section');
                 print STDERR "# Close file(".fileno($FH).") after $element->{'texi'}\n" 
                     if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                 &$Texi2HTML::Config::print_page_foot($FH);
                 close_out($FH, "$docu_rdir$element->{'file'}");
             }
             else
             {
                 print STDERR "# Counter $files{$element->{'file'}}->{'counter'} ne 0, file(".fileno($FH).") $element->{'file'}\n"
                     if ($T2H_DEBUG & $DEBUG_ELEMENTS);
             }
        }
        elsif (!defined($new_element))
        {
            print STDERR "# End of last section, file(".fileno($FH).") $element->{'file'}, counter $files{$element->{'file'}}->{'counter'}\n"
                 if ($T2H_DEBUG & $DEBUG_ELEMENTS);
            if (Texi2HTML::Config::get_conf('SPLIT'))
            { # end of last splitted section
                &$Texi2HTML::Config::print_chapter_footer($FH, $element) if (Texi2HTML::Config::get_conf('SPLIT') eq 'chapter');
                &$Texi2HTML::Config::print_section_footer($FH, $element) if (Texi2HTML::Config::get_conf('SPLIT') eq 'section');
                &$Texi2HTML::Config::print_page_foot($FH);
                close_out($FH, "$docu_rdir$element->{'file'}");
            }
            else
            { # end of last unsplit section
                &$Texi2HTML::Config::end_section($FH, 1, $element);
            }
        }
        elsif ($new_element->{'top'})
        {
            print STDERR "# Section followed by Top, file(".fileno($FH).") counter $files{$element->{'file'}}->{'counter'}\n"
                     if ($T2H_DEBUG & $DEBUG_ELEMENTS);
            &$Texi2HTML::Config::end_section($FH, 1, $element);
        }
        else
        { # end of section followed by another one
            print STDERR "# Section followed by another one, file(".fileno($FH).") counter $files{$element->{'file'}}->{'counter'}\n"
                     if ($T2H_DEBUG & $DEBUG_ELEMENTS);
            &$Texi2HTML::Config::end_section($FH, 0, $element);
        }
    }
}

# write to files with name the node name for cross manual references.
sub do_node_files()
{
    foreach my $key (keys(%nodes))
    {
        my $node = $nodes{$key};
        next unless ($node->{'node_file'});
        my $redirection_file = $docu_doc;
        $redirection_file = $node->{'file'} if (Texi2HTML::Config::get_conf('SPLIT'));
        if (!$redirection_file)
        {
             print STDERR "Bug: file for redirection for `$node->{'texi'}' don't exist\n" unless (Texi2HTML::Config::get_conf('novalidate') or !$node->{'seen'});
             next;
        }
        next if ($redirection_file eq $node->{'node_file'});
        my $file = "${docu_rdir}$node->{'node_file'}";
        $Texi2HTML::NODE{'This'} = $node->{'text'};
        $Texi2HTML::NO_TEXI{'This'} = $node->{'no_texi'};
        $Texi2HTML::SIMPLE_TEXT{'This'} = $node->{'simple_format'};
        $Texi2HTML::NAME{'This'} = $node->{'text'};
        my $href_file = $node->{'file'};
        if (!defined($href_file))
        {
           if (Texi2HTML::Config::get_conf('novalidate'))
           {
               $href_file = '';
           }
           else
           {
               msg_debug ("Undefined file for `$node->{'texi'}' in do_node_files");
           }
        }
        $Texi2HTML::HREF{'This'} = "$href_file#$node->{'id'}";
        my $redirect = &$Texi2HTML::Config::print_redirection_page ();
        if (defined($redirect))
        {
           my $NODEFILE = open_out ($file);
           print $NODEFILE "$redirect";
           close $NODEFILE || document_error ("Can't close $file: $!", 1);
        }
    }
}

#+++############################################################################
#                                                                              #
# Low level functions                                                          #
#                                                                              #
#---############################################################################

sub locate_include_file($)
{
    my $file = shift;

    # APA: Don't implicitely search ., to conform with the docs!
    
    # if file begins with /, ./ or ../ don't search in -I (Karl)
    if ($file =~ m,^(/|\./|\.\./),)
    {
        return "$file" if (-e "$file" && -r "$file");
        return undef;
    }
    foreach my $dir (@Texi2HTML::Config::INCLUDE_DIRS)
    {
        return "$dir/$file" if (-e "$dir/$file" && -r "$dir/$file");
    }
    return undef;
}

sub open_file($$$)
{
    my $name = shift;
#    my $line_number = shift;
    my $macro = shift;
    my $files_stack = shift;

    my $line_number;
    my $input_spool;
    
    local *FH;
    if (open(*FH, "<$name"))
    {
        my $in_encoding = Texi2HTML::Config::get_conf('IN_ENCODING');
        if (defined($in_encoding) and $Texi2HTML::Config::USE_UNICODE)
        {
            binmode(*FH, ":encoding($in_encoding)");
        }
        my $file = { 'fh' => *FH, 
           'input_spool' => { 'spool' => [], 
                              'macro' => '' },
           'name' => $name, 
           'line_nr' => 0 };
        unshift(@$files_stack, $file);
        $input_spool = $file->{'input_spool'};
        $line_number->{'file_name'} = $name;
        $line_number->{'line_nr'} = 1;
        $line_number->{'macro'} = $macro;
    }
    else
    {
        document_error ("Can't read file $name: $!", 1);
    }
    return ($line_number, $input_spool);
}

my %filehandles = ();

sub open_out($)
{
    my $file = shift;
    local *FILE;
#print STDERR "open_out $file $Texi2HTML::THISDOC{'OUT_ENCODING'}\n";
    if ($file eq '-')
    {
        binmode(STDOUT, ":encoding($Texi2HTML::THISDOC{'OUT_ENCODING'})") if (defined($Texi2HTML::THISDOC{'OUT_ENCODING'}) and $Texi2HTML::Config::USE_UNICODE);
        return \*STDOUT;
    }

    unless (open(FILE, '>', $file))
    {
        document_error ("Can't open $file for writing: $!", 1);
    }
    push @opened_files, $file;
    if (defined($Texi2HTML::THISDOC{'OUT_ENCODING'}) and $Texi2HTML::Config::USE_UNICODE)
    {
        if ($Texi2HTML::THISDOC{'OUT_ENCODING'} eq 'utf8' or $Texi2HTML::THISDOC{'OUT_ENCODING'} eq 'utf-8-strict')
        {
            binmode(FILE, ':utf8');
        }
	else
        {
            binmode(FILE, ':bytes');
            #binmode(FILE, ":encoding($Texi2HTML::THISDOC{'OUT_ENCODING'})");
        }
        # FIXME is it useful when in utf8?
        binmode(FILE, ":encoding($Texi2HTML::THISDOC{'OUT_ENCODING'})");
    }
    $file =~ s/^(\.[\/]+)*//;
    $filehandles{fileno(*FILE)} = $file;
    return *FILE;
}

# FIXME not used for main out files only for special files
sub close_out($$)
{
    my $FH = shift;
    my $file = shift;
    return if (defined($file) and $file eq '-');
    $file =~ s/^(\.[\/]+)*//;
    my $fileno = fileno($FH);
#print STDERR "close_out $file $fileno\n";
    if (!defined($fileno))
    {
       msg_debug("fileno not defined for $file") 
    }
    elsif (defined($filehandles{$fileno}) and $filehandles{$fileno} ne $file)
    {
       #msg_debug("filehandles{$fileno} $filehandles{$fileno} and file $file different")
    }
    close ($FH) || document_error ("Error when closing $file: $!");
}

sub next_line($$)
{
    my $line_number = shift;
    my $files_stack = shift;
    my $input_spool;
    while (@$files_stack)
    {
        my $file = $files_stack->[0];
        $line_number->{'file_name'} = $file->{'name'};
        $input_spool = $file->{'input_spool'};
        if (@{$input_spool->{'spool'}})
        {
             $line_number->{'macro'} = $file->{'input_spool'}->{'macro'};
             $line_number->{'line_nr'} = $file->{'line_nr'};
             my $line = shift(@{$input_spool->{'spool'}});
             print STDERR "# unspooling $line" if ($T2H_DEBUG & $DEBUG_MACROS);
             return($line, $input_spool);
        }
        else
        {
             $file->{'input_spool'}->{'macro'} = '';
             $line_number->{'macro'} = '';
        }
        my $fh = $file->{'fh'};
        no strict "refs";
        my $line = <$fh>;
        use strict "refs";
        my $chomped_line = $line;
        $file->{'line_nr'}++ if (defined($line) and chomp($chomped_line));
        $line_number->{'line_nr'} = $file->{'line_nr'};
        # do that right now, before any other treatement
        $line =~ s/\x{7F}.*\s*// if (defined($line));
        return($line, $input_spool) if (defined($line));
        no strict "refs";
        close($fh);
        use strict "refs";
        shift(@$files_stack);
    }
    return(undef, $input_spool);
}

sub check_die(;$)
{
   my $always_die = shift;

   if (!$Texi2HTML::Config::FORCE)
   {
       my $name = $0;
       $name =~ s/^.*\///;
       if (@opened_files == 1)
       {
           warn "$name: Removing output file `$opened_files[0]' due to errors; use --force to preserve.\n";
       }
       elsif (@opened_files > 1)
       {
           warn "$name: Removing output files due to errors; use --force to preserve.\n";
       }
       foreach my $file (@opened_files)
       {
          unlink ($file);
       }
       foreach my $dir (@created_directories)
       {
          rmdir ($dir);
       }
   }
   if ($always_die or !$Texi2HTML::Config::FORCE)
   {
       exit (1);
   }
}

sub file_line_warn($$;$)
{
   return if ($Texi2HTML::Config::NO_WARN);
   my $text = shift;
   chomp($text);
   my $file = shift;
   my $line_nr = shift;

   if (!defined($line_nr))
   {
      warn "$file: $text\n";
   }
   else
   {
      warn "$file:$line_nr: $text\n";
   }
}

sub document_warn ($)
{
   return if ($Texi2HTML::Config::NO_WARN);
   my $text = shift;
   chomp ($text);
   warn "warning: $text\n";
}

my $error_nrs = 0;
sub check_errors()
{
   $error_nrs ++;
    die "Max error number exceeded\n" if ($error_nrs >= $Texi2HTML::Config::ERROR_LIMIT);
}

sub msg_debug($;$)
{
   my $text = shift;
   chomp ($text);
   my $line_number = shift;
   if (defined($line_number))
   {
       warn "!! $text " . format_line_number($line_number) . "\n";
   }
   else
   {
       warn "!! $text\n";
   }
}

sub cmdline_warn ($)
{
   my $text = shift;
   chomp ($text);
   warn "$0: $text\n";
}

sub document_error($;$)
{
   my $text = shift;
   chomp ($text);
   my $die = shift;
   warn ("$text\n");
   check_die ($die);
   check_errors();
}

# echo an error
sub msg_error($;$)
{
    my $text = shift;
    my $line_number = shift;
    if (defined($line_number))
    {
         line_error ($text, $line_number);
    }
    else
    {
        document_error ($text);
    }
}

# echo a warning
sub msg_warn($;$$)
{
    my $text = shift;
    my $line_number = shift;
    my $context_string = shift;

    if (defined($line_number))
    {
         line_warn ($text, $line_number);
    }
    elsif (defined($context_string))
    {
        document_warn ("$text (in $context_string)");
    }
    else
    {
        document_warn ($text);
    }
}

# echo a warning associated with a line in the document
sub line_warn($$)
{
    return if ($Texi2HTML::Config::NO_WARN);
    my $text = shift;
    chomp ($text);
    my $line_number = shift;
    return if (!defined($line_number));
    my $file = $line_number->{'file_name'};
    # otherwise out of source build fail since the file names are different
    $file =~ s/^.*\/// if ($Texi2HTML::Config::TEST);
    my $macro_text = '';
    $macro_text = " (via \@$line_number->{'macro'})" if ($line_number->{'macro'} ne '');
    warn "$file:$line_number->{'line_nr'}: warning: $text$macro_text\n";
}

sub line_error($$)
{
    my $text = shift;
    chomp ($text);
    my $line_number = shift;
    if (defined($line_number))
    {
       my $file = $line_number->{'file_name'};
       $file =~ s/^.*\/// if ($Texi2HTML::Config::TEST);
       my $macro_text = '';
       $macro_text = " (via \@$line_number->{'macro'})" if ($line_number->{'macro'} ne '');
       warn "$file:$line_number->{'line_nr'}: $text$macro_text\n";
       check_die();
    }
    check_errors();
}

sub format_line_number(;$)
{
    my $line_number = shift;
    $line_number = $Texi2HTML::THISDOC{'line_nr'} if (!defined($line_number));
    my $macro_text = '';
    #$line_number = undef;
    return '' unless (defined($line_number));
    $macro_text = " in \@$line_number->{'macro'}" if ($line_number->{'macro'} ne '');
    my $file_text = '(';
    $file_text = "(in $line_number->{'file_name'} " if ($line_number->{'file_name'} ne $Texi2HTML::THISDOC{'input_file_name'});
    return "${file_text}l. $line_number->{'line_nr'}" . $macro_text . ')';
}

# to debug, dump the result of pass_texi and pass_structure in a file
sub dump_texi($$;$$)
{
    my $lines = shift;
    my $pass = shift;
    my $numbers = shift;
    my $file = shift;
    $file = "$docu_rdir$docu_name" . ".pass$pass" if (!defined($file));
    my $FH = open_out($file);
    print STDERR "# Dump texi\n" if ($T2H_VERBOSE);
    my $index = 0;
    foreach my $line (@$lines)
    {
        my $number_information = '';
        my $chomped_line = $line;
        # if defined, it means that an output of the file is asked for
        if (defined($numbers))
        {
           my $basefile = $numbers->[$index]->{'file_name'};
           $basefile = 'no file' if (!defined($basefile));
           $basefile =~ s|.*/||;
           my $macro_name = $numbers->[$index]->{'macro'};
           $macro_name = '' if (!defined($macro_name));
           my $line_number = $numbers->[$index]->{'line_nr'};
           $line_number = '' if (!defined($line_number));
           $number_information = "${basefile}($macro_name,$line_number) ";
        }
        print $FH "${number_information}$line";
        $index++ if (chomp($chomped_line));
    }
    close_out ($FH, $file);
}


# return next tag on the line
sub next_tag($)
{
    my $line = shift;
    # macro_regexp
    if ($line =~ /^\s*\@(["'~\@\}\{,\.!\?\s\*\-\^`=:\|\/\\])/o or $line =~ /^\s*\@([a-zA-Z][\w-]*)/)
    {
        return ($1);
    }
    return '';
}

sub next_end_tag($)
{
    my $line = shift;
    if ($line =~ /^\s*\@end\s+([a-zA-Z][\w-]*)/)
    {
        return $1;
    }
    return '';
}

sub next_tag_or_end_tag($)
{
    my $line = shift;
    my $next_tag = next_tag($line);
    return $next_tag if (defined($next_tag) and $next_tag ne '');
    return next_end_tag($line);
}

sub top_stack($;$)
{
    my $stack = shift;
    my $ignore_para = shift;

    my $index = scalar (@$stack);
    return undef unless ($index);

    return $stack->[-1] unless ($ignore_para);
    if ($ignore_para == 1)
    {
       if (exists($stack->[-1]->{'format'}) and ($stack->[-1]->{'format'} eq 'paragraph' or $stack->[-1]->{'format'} eq 'preformatted'))
       {
          if (exists($stack->[-2]))
          {
              return $stack->[-2];
          }
          else 
          {
              return undef;
          }
       }
       else
       {
          return $stack->[-1];
       }
    }
    else
    {
        while ($index and 
          (
           (exists($stack->[$index-1]->{'format'})
            and ($stack->[$index-1]->{'format'} eq 'paragraph' or $stack->[$index-1]->{'format'} eq 'preformatted'))
           or (exists($stack->[$index-1]->{'style'}))
          ))
       {
           $index--;
       }
    }
    return undef unless ($index);
    return $stack->[$index-1];
}

# return the next element with balanced {}
sub next_bracketed($$;$)
{
    my $line = shift;
    my $line_nr = shift;
    my $report = shift;
    my $opened_braces = 0;
    my $result = '';
    my $spaces;
#print STDERR "next_bracketed  $line";
    if ($line =~ /^(\s*)$/)
    {
        return ('','',$1);
    }
    while ($line !~ /^\s*$/)
    {
#print STDERR "next_bracketed($opened_braces): $result !!! $line";
        if (!$opened_braces)
        { # beginning of item
            $line =~ s/^(\s*)//;
            $spaces = $1;
            #if ($line =~ s/^([^\{\}\s]+)//)
            if ($line =~ s/^([^\{\}]+?)(\s+)/$2/ or $line =~ s/^([^\{\}]+?)$//)
            {
                $result = $1;
                $result = trim_around_spaces($result);
                return ($result, $line, $spaces);
            }
            elsif ($line =~ s/^([^\{\}]+?)([\{\}])/$2/)
            {
                $result = $1;
            }
        }
        elsif($line =~ s/^([^\{\}]+)//)
        {
            $result .= $1;
        }
        if ($line =~ s/^([\{\}])//)
        {
            my $brace = $1;
            $opened_braces++ if ($brace eq '{');
            $opened_braces-- if ($brace eq '}');
    
            if ($opened_braces < 0)
            {
                line_error("too much '}' in specification", $line_nr) if ($report);
                $opened_braces = 0;
                #next;
            }
            $result .= $brace;
            return ($result, $line, $spaces) if ($opened_braces == 0);
        }
    }
    if ($opened_braces)
    {
        line_error("'{' not closed in specification", $line_nr) if ($report);
        return ($result, '', $spaces);
        #return ($result . ( '}' x $opened_braces), '', $spaces);
    }
    print STDERR "BUG: at the end of next_bracketed\n";
    return undef;
}

# def prams are also split at @-commands if not in brackets
sub next_def_param($$;$)
{
    my $line = shift;
    my $line_nr = shift;
    my $report = shift;
    my ($item, $spaces);
    ($item, $line, $spaces) = next_bracketed($line, $line_nr, $report);
    return ($item, $line, $spaces) if (!defined($item));
    if ($item =~ /^\{/)
    {
        $item =~ s/^\{(.*)\}$/$1/;
    }
    else
    { 
        my $delimeter_quoted = quotemeta($Texi2HTML::Config::def_argument_separator_delimiters);
        if ($item =~ s/^([^\@$delimeter_quoted]+)//)
        {
            $line = $item . $line;
            $item = $1;
        }
        elsif ($item =~ s/^([$delimeter_quoted])//)
        {
            $line = $item . $line;
            $item = $1;
        }
        elsif ($item =~ s/^(\@[^\@\{]+)(\@)/$2/)
        {
            $line = $item . $line;
            $item = $1;
        }
    }
    return ($item, $line, $spaces);
}

# do a href using file and id and taking care of ommitting file if it is 
# the same
# element: structuring element to point to
# file: current file
sub href($$;$)
{
    my $element = shift;
    my $file = shift;
    my $line_nr = shift;
    return '' unless defined($element);
    my $href = '';
    line_error("Bug: $element->{'texi'}, target undef", $line_nr) if (!defined($element->{'target'}));
    line_error("Bug: $element->{'texi'}, file undef", $line_nr) if (!defined($element->{'file'}));
    line_error("Bug: file undef in href", $line_nr) if (!defined($file));
#foreach my $key (keys(%{$element}))
#{
#   my $value = 'UNDEF'; $value =  $element->{$key} if defined($element->{$key});
#   print STDERR "$key: $value\n";
#}print STDERR "\n";
    $href .= $element->{'file'} if (defined($element->{'file'}) and $file ne $element->{'file'});
    $href .= "#$element->{'target'}" if (defined($element->{'target'}));
    return $href;
}

sub file_target_href($$$)
{
    my $dest_file = shift;
    my $orig_file = shift;
    my $target = shift;
    my $href = '';
    $href .= $dest_file if (defined($dest_file) and ($dest_file ne $orig_file));
    $href .= "#$target" if (defined($target));
    return $href;
}

sub trim_around_spaces($)
{
   my $text = shift;
   $text =~ s/^\s*//;
   $text =~ s/(\s)\s*$/$1/;
   if ($text =~ /(\@+)\s$/)
   {
      my $arobases = $1;
      if ((length($arobases) % 2) == 0)
      {
          $text =~ s/\s$//;
      }
   }
   else
   {
      $text =~ s/\s$//;
   }
   return $text;
}

sub normalise_space($)
{
   return undef unless (defined ($_[0]));
   my $text = shift;
   $text =~ s/\s+/ /go;
   $text =~ s/ $//;
   $text =~ s/^ //;
   return $text;
}


sub normalise_texi_space($)
{
   return undef unless (defined ($_[0]));
   my $text = shift;
   $text = trim_around_spaces($text);
   $text =~ s/\s+/ /go;
   return $text;
}

sub normalise_node($)
{
    return undef unless (defined ($_[0]));
    my $text = shift;
    $text = normalise_texi_space($text);
    $text =~ s/^top$/Top/i;
    return $text;
}

sub normalise_node_array($)
{
    my $array = shift;
    my @result;
    foreach my $node (@$array)
    {
       push @result, normalise_node($node);
    }
    return @result;
}

sub do_anchor_label($$$$)
{
    my $command = shift;
    #my $anchor = shift;
    my $args = shift;
    my $anchor = $args->[0];
    my $style_stack = shift;
    my $state = shift;
    my $line_nr = shift;

    #print STDERR "do_anchor_label $state->{'region'} m_p $state->{'multiple_pass'} remove $state->{'remove_texi'} `$anchor'\n";
    # FIXME anchor may appear twice when outside document and first time
    # it appears in the document
    return '' if (($state->{'region'} and $state->{'multiple_pass'} > 0) or $state->{'remove_texi'});
    $anchor = normalise_node($anchor);
    if (!exists($nodes{$anchor}) or !defined($nodes{$anchor}->{'id'}))
    {
        print STDERR "Bug: unknown anchor `$anchor'\n";
    }
    return &$Texi2HTML::Config::anchor_label($nodes{$anchor}->{'id'}, $anchor, $nodes{$anchor}, $state->{'region'});
}

sub get_format_command($)
{
    my $format = shift;
    my $command = '';
    my $format_name = '';
    my $term = 0;
    my $item_nr;
    my $paragraph_number;
    my $enumerate_type;
    my $number;
    
    $command = $format->{'command'} if (defined($format->{'command'}));
    $format_name =  $format->{'format'} if (defined($format->{'format'}));

    return ($format_name,$command,\$format->{'paragraph_number'},$term,
        $format->{'item_nr'}, $format->{'spec'}, $format->{'number'},
        $format->{'stack_at_beginning'});
}

sub do_paragraph($$;$)
{
    my $text = shift;
    my $state = shift;
    my $stack = shift;

    if (!defined ($state->{'paragraph_context'}))
    {
        msg_debug ("paragraph_context undef", $Texi2HTML::THISDOC{'line_nr'});
        dump_stack (undef, $stack, $state);
    }

    my ($format, $paragraph_command, $paragraph_number, $term, $item_nr, 
        $enumerate_type, $number, $stack_at_beginning) 
         = get_format_command ($state->{'paragraph_context'});
    delete $state->{'paragraph_context'};

    my $indent_style = '';
    if (exists($state->{'paragraph_indent'}))
    {
        $indent_style = $state->{'paragraph_indent'};
        $state->{'paragraph_indent'} = undef;
        delete $state->{'paragraph_indent'};
    }
    my $paragraph_command_formatted;
    $state->{'paragraph_nr'}--;
    (print STDERR "Bug text undef in do_paragraph", return '') unless defined($text);
    my $align = '';
    $align = $state->{'paragraph_style'}->[-1] if ($state->{'paragraph_style'}->[-1]);
    
    if ($paragraph_command and !exists($Texi2HTML::Config::special_list_commands{$format}->{$paragraph_command}))
    {
        $paragraph_command_formatted = substitute_line("\@$paragraph_command\{\}", "paragraph \@$format \@$paragraph_command", duplicate_formatting_state($state));
    }
    return &$Texi2HTML::Config::paragraph($text, $align, $indent_style, $paragraph_command, $paragraph_command_formatted, $paragraph_number, $format, $item_nr, $enumerate_type, $number,$state->{'command_stack'},$stack_at_beginning);
}

sub do_preformatted($$;$)
{
    my $text = shift;
    my $state = shift;
    my $stack = shift;

    if (!defined ($state->{'preformatted_context'}))
    {
        msg_debug ("preformatted_context undef", $Texi2HTML::THISDOC{'line_nr'});
        dump_stack (undef, $stack, $state);
    }

    my ($format, $leading_command, $preformatted_number, $term, $item_nr, 
        $enumerate_type, $number,$stack_at_beginning) 
        = get_format_command($state->{'preformatted_context'});
    delete ($state->{'preformatted_context'});
    my $leading_command_formatted;
    my $pre_style = '';
    my $class = '';
    $pre_style = $state->{'preformatted_stack'}->[-1]->{'pre_style'} if ($state->{'preformatted_stack'}->[-1]->{'pre_style'});
    $class = $state->{'preformatted_stack'}->[-1]->{'class'};
    print STDERR "BUG: !state->{'preformatted_stack'}->[-1]->{'class'}\n" unless ($class);
    if (defined($leading_command) and $leading_command ne '' and !exists($Texi2HTML::Config::special_list_commands{$format}->{$leading_command}))
    {
        $leading_command_formatted = substitute_line("\@$leading_command\{\}", "preformatted \@$format \@$leading_command", duplicate_formatting_state($state));
    }
    return &$Texi2HTML::Config::preformatted($text, $pre_style, $class, $leading_command, $leading_command_formatted, $preformatted_number, $format, $item_nr, $enumerate_type, $number,$state->{'command_stack'},$stack_at_beginning);
}

sub do_external_href($)
{
    # node_id is a unique node identifier with only letters, digits, - and _
    # node_xhtml_id is almost the same, but xhtml id can only begin with
    # letters, so a prefix has to be appended  
    my $texi_node = shift;
    my $file = '';
    my $node_file = '';
    my $node_id = '';
    my $node_xhtml_id = '';

#print STDERR "do_external_href $texi_node\n";

    if ($texi_node =~ s/^\((.+?)\)//)
    {
         $file = $1;
    }
    $texi_node = normalise_node($texi_node);
    if ($texi_node ne '')
    {
         if (exists($nodes{$texi_node}) and ($nodes{$texi_node}->{'cross_manual_target'})) 
         {
               $node_id = $nodes{$texi_node}->{'cross_manual_target'};
               if ($Texi2HTML::Config::TRANSLITERATE_FILE_NAMES)
               {
                   $node_file = $nodes{$texi_node}->{'cross_manual_file'};
               }
         }
         else 
         {
              if ($Texi2HTML::Config::TRANSLITERATE_FILE_NAMES)
              {
                  ($node_id, $node_file) = cross_manual_line($texi_node,1);
              }
              else
              {
                  $node_id = cross_manual_line($texi_node);
              }
         }
         $node_xhtml_id = node_to_id($node_id);
         $node_file = $node_id unless ($Texi2HTML::Config::TRANSLITERATE_FILE_NAMES);
    }
    return &$Texi2HTML::Config::external_href($texi_node, $node_file, 
        $node_xhtml_id, $file);
}

# transform node for cross ref name to id suitable for xhtml: an xhtml id
# must begin with a letter.
sub node_to_id($)
{
    my $cross_ref_node_name = shift;
    $cross_ref_node_name =~ s/^([0-9_])/g_t$1/;
    return $cross_ref_node_name;
}

# return an empty string if the command is not a index command, the prefix
# if it is one
sub index_command_prefix($)
{
   my $command = shift;
   return $1 if ($command =~ /^(\w+?)index/ and ($1 ne 'print') and ($1 ne 'syncode') and ($1 ne 'syn') and ($1 ne 'def') and ($1 ne 'defcode'));
   return '';
}

# return 1 if the following tag shouldn't begin a line
sub no_line($)
{
    my $line = shift;
    my $next_tag = next_tag($line);
    return 1 if (($line =~ /^\s*$/) or $Texi2HTML::Config::no_paragraph_commands{$next_tag} or 
       ($Texi2HTML::Config::no_paragraph_commands{'cindex'} and (index_command_prefix($next_tag) ne '')) or 
       (($line =~ /^\@end\s+(\w+)/) and  $Texi2HTML::Config::no_paragraph_commands{"end $1"}));
    return 0;
}

sub no_paragraph($$)
{
    my $state = shift;
    my $line = shift;
    return ($state->{'paragraph_context'} or $state->{'preformatted'} or $state->{'remove_texi'} or no_line($line) or $state->{'no_paragraph'});
}

# We restart the preformatted format which was stopped 
# by the format if in preformatted, and start a paragraph
# for the text following the end of the format, if needed
sub begin_paragraph_after_command($$$$)
{
    my $state = shift;
    my $stack = shift;
    my $command = shift;
    my $text_following = shift;
    
    #if (($state->{'preformatted'} 
    #       and !$Texi2HTML::Config::format_in_paragraph{$command})
    if ($state->{'preformatted'} 
        or (!no_paragraph($state,$text_following)))  
    {
        begin_paragraph($stack, $state); 
    }
}

# handle raw formatting, ignored regions...
# called from scan_texi, so only in first pass.
sub do_text_macro($$$$$)
{
    my $type = shift;
    my $line = shift;
    my $state = shift;
    my $stack = shift;
    my $line_nr = shift;
    my $value;
    #print STDERR "do_text_macro $type\n";

    if ($Texi2HTML::Config::texi_formats_map{$type} eq 'raw')
    {
        $state->{'raw'} = $type;
        #print STDERR "RAW\n";
        if ($state->{'raw'})
        {
             push @$stack, { 'style' => $type, 'text' => '' };
        }
    }
    elsif ($Texi2HTML::Config::texi_formats_map{$type} eq 'value')
    {
        if (($line =~ s/(\s+)($VARRE)$//) or ($line =~ s/(\s+)($VARRE)(\s)//))
        {
            $value = $1 . $2;
            $value .= $3 if defined($3);
            if ($state->{'ignored'})
            {
                if ($type eq $state->{'ignored'})
                {
                    $state->{'ifvalue_inside'}++;
                }
                # if 'ignored' we don't care about the command as long as
                # the nesting is correct
                return ($line,'');
            }
            my $open_ignored_ifvalue = 0;
            if ($type eq 'ifclear')
            {
                if (defined($value{$2}))
                {
                    $open_ignored_ifvalue = 1;
                }
                else
                {
                    push @{$state->{'text_macro_stack'}}, $type;
                }
            }
            elsif ($type eq 'ifset')
            {
                unless (defined($value{$2}))
                {
                    $open_ignored_ifvalue = 1;
                }
                else
                {
                    push @{$state->{'text_macro_stack'}}, $type;
                }
            }
            if ($open_ignored_ifvalue)
            {
                $state->{'ignored'} = $type;
                $state->{'ifvalue'} = $type;
                $state->{'ifvalue_inside'} = 1;
                # We add at the top of the stack to be able to close all
                # opened comands when closing the ifset/ifclear (and ignore
                # everything that is in those commands)
                push @$stack, { 'style' => 'ifvalue', 'text' => '' };
            }
        }
        else
        { # we accept a lone @ifset or @ifclear if it is inside an 
            if ($type eq $state->{'ifvalue'})
            {
                $state->{'ifvalue_inside'}++;
                return ($line,'');
            }
            line_error ("Bad $type line: $line", $line_nr) unless ($state->{'ignored'});
        }
    }
    elsif (not $Texi2HTML::Config::texi_formats_map{$type})
    { # ignored text
        $state->{'ignored'} = $type;
        #print STDERR "IGNORED\n";
    }
    else
    {
        push @{$state->{'text_macro_stack'}}, $type unless($state->{'ignored'}) ;
    }
    my $text = "\@$type";
    $text .= $value if defined($value); 
    return ($line, $text);
}

# do regions handled specially, currently only tex, going through latex2html
sub init_special($$)
{
    my $style = shift;
    my $text = shift;
    if (defined($Texi2HTML::Config::command_handler{$style}) and
       defined($Texi2HTML::Config::command_handler{$style}->{'init'}))
    {
        $special_commands{$style}->{'count'} = 0 if (!defined($special_commands{$style}));
        if ($Texi2HTML::Config::command_handler{$style}->{'init'}($style,$text,
               $special_commands{$style}->{'count'} +1))
        {
            $special_commands{$style}->{'count'}++;  
            return "\@special_${style}_".$special_commands{$style}->{'count'}."{}";
        }
        return '';
    }
}

sub reset_index_entries($)
{
    my $region = shift;
    if (defined($Texi2HTML::THISDOC{'index_entries'}->{$region}))
    {
       foreach my $entry (values(%{$Texi2HTML::THISDOC{'index_entries'}->{$region}}))
       {
          if (scalar(@{$entry->{'entries'}}) > 1)
          {
              $entry->{'index'} = 0;
          }
       }
    }
    if (defined($Texi2HTML::THISDOC{'indices_numbers'}->{$region}))
    {
       foreach my $index_name (keys(%{$Texi2HTML::THISDOC{'indices_numbers'}->{$region}}))
       {
          $Texi2HTML::THISDOC{'indices_numbers'}->{$region}->{$index_name} = undef;
       }
    }
}

# FIXME we cannot go through the commands too 'often'. The error messages
# are duplicated and global stuff is changed.
# -> identify what is global
# -> use local state
sub do_special_region_lines($;$$)
{
    my $region = shift;
    my $state = shift;
    my $line_nr = shift;

    # this case covers something like
    # @copying
    # @insertcopying
    # @end copying
    if (defined($state) and exists($state->{'region'}) and ($region eq $state->{'region'}))
    {
         line_error("Recursively expanding region $region in $state->{'region'}", $line_nr);
         return ('','', '');
         
    }

    print STDERR "# do_special_region_lines for region $region ['multiple_pass','region_pass']: ($region_initial_state{$region}->{'multiple_pass'}, $region_initial_state{$region}->{'region_pass'})" if ($T2H_DEBUG);
    if (!defined($state))
    {
        fill_state($state);
        $state->{'outside_document'} = 1;
        print STDERR " outside document\n" if ($T2H_DEBUG);
    }
    elsif (!$state->{'outside_document'})
    {
        $region_initial_state{$region}->{'multiple_pass'}++;
        print STDERR " multiple pass $region_initial_state{$region}->{'multiple_pass'}\n" if ($T2H_DEBUG);
    }
    else
    {
        print STDERR " in $state->{'region'}, outside document\n" if ($T2H_DEBUG);
    }

    return ('','','') unless @{$region_lines{$region}};
    my $new_state = duplicate_formatting_state($state);
    reset_index_entries($region);
    foreach my $key (keys(%{$region_initial_state{$region}}))
    {
        $new_state->{$key} = $region_initial_state{$region}->{$key};
    }
    &$Texi2HTML::Config::begin_special_region($region,$new_state,$region_lines{$region})
      if (defined($Texi2HTML::Config::begin_special_region));
    my $text = substitute_text($new_state, [ @{$region_line_nrs{$region}} ], 
       "$region ($region_initial_state{$region}->{'multiple_pass'}, $region_initial_state{$region}->{'region_pass'})", 
       @{$region_lines{$region}});
    $text = &$Texi2HTML::Config::end_special_region($region,$new_state,$text)
      if (defined($Texi2HTML::Config::end_special_region));

    $region_initial_state{$region}->{'region_pass'}++;

    my $remove_texi_state = duplicate_formatting_state($state);
    reset_index_entries($region);
    $remove_texi_state->{'remove_texi'} = 1;
    foreach my $key (keys(%{$region_initial_state{$region}}))
    {
        $remove_texi_state->{$key} = $region_initial_state{$region}->{$key};
    }
    &$Texi2HTML::Config::begin_special_region($region,$remove_texi_state,$region_lines{$region})
      if (defined($Texi2HTML::Config::begin_special_region));
    print STDERR "# remove texi\n" if ($T2H_DEBUG);
    my $removed_texi = substitute_text($remove_texi_state, undef, 
       "remove_texi $region ($region_initial_state{$region}->{'multiple_pass'}, $region_initial_state{$region}->{'region_pass'})", 
       @{$region_lines{$region}});
    $removed_texi = &$Texi2HTML::Config::end_special_region($region,$remove_texi_state, $removed_texi)
      if (defined($Texi2HTML::Config::end_special_region));
    $region_initial_state{$region}->{'region_pass'}++;

    my $simple_format_state = duplicate_formatting_state($state);
    reset_index_entries($region);
    foreach my $key (keys(%{$region_initial_state{$region}}))
    {
        $simple_format_state->{$key} = $region_initial_state{$region}->{$key};
    }
    
    &$Texi2HTML::Config::begin_special_region($region,$simple_format_state,$region_lines{$region})
      if (defined($Texi2HTML::Config::begin_special_region));
    print STDERR "# simple format\n" if ($T2H_DEBUG);
    my $simple_format = simple_format($simple_format_state, undef, 
       "simple_format $region ($region_initial_state{$region}->{'multiple_pass'}, $region_initial_state{$region}->{'region_pass'})", 
       @{$region_lines{$region}});
    $simple_format = &$Texi2HTML::Config::end_special_region($region,$simple_format_state, $simple_format)
      if (defined($Texi2HTML::Config::end_special_region));
    $region_initial_state{$region}->{'region_pass'}++;

    return ($text, $removed_texi, $simple_format);
}

sub do_insertcopying($$)
{
    my $state = shift;
    my $line_nr = shift;
    my ($text, $comment, $simple_formatted) = do_special_region_lines('copying', $state, $line_nr);
    return &$Texi2HTML::Config::insertcopying($text, $comment, $simple_formatted);
}

sub get_deff_index($$$$)
{
    my $tag = shift;
    my $line = shift;
    my $line_nr = shift;
    my $warn = shift;
   
    $tag =~ s/x$//;
    my ($command, $style, $category, $name, $type, $class, $arguments, $args_array, $args_type_array);
    ($command, $style, $category, $name, $type, $class, $arguments, $args_array, $args_type_array) = parse_def($tag, $line, $line_nr, $warn); 
    $name = &$Texi2HTML::Config::definition_index_entry($name, $class, $style, $command);
    return ($style, '') if (!defined($name) or ($name =~ /^\s*$/));
    return ($style, $name, $arguments);
}

sub parse_def($$$;$)
{
    my $command = shift;
    my $line = shift;
    my $line_nr = shift;
    my $report = shift;

    my $format = $command;

    if (!ref ($Texi2HTML::Config::def_map{$command}))
    {
        # substitute shortcuts for definition commands
        my $substituted = $Texi2HTML::Config::def_map{$command};
        $substituted =~ s/(\w+)//;
        $format = $1;
        $line = $substituted . $line;
    }
#print STDERR "PARSE_DEF($command,$format) $line";
    my ($category, $name, $type, $class, $arguments);
    my @arguments = ();
    my @args = @{$Texi2HTML::Config::def_map{$format}};
    my $style = shift @args;
    my @arg_types = ();
    while (@args and $args[0] ne 'arg' and $args[0] ne 'argtype')
    {
        my $arg = shift @args;
        # backward compatibility, it was possible to have a { in front.
        $arg =~  s/^\{//;
        my ($item, $spaces);
        ($item, $line, $spaces) = next_def_param($line, $line_nr, $report);
        last if (!defined($item));
        #$item =~ s/^\{(.*)\}$/$1/ if ($item =~ /^\{/);
        if ($arg eq 'category')
        {
            $category = $item;
        }
        elsif ($arg eq 'name')
        {
            $name = $item;
        }
        elsif ($arg eq 'type')
        {
            $type = $item;
        }
        elsif ($arg eq 'class')
        {
            $class = $item;
        }
        push @arg_types, $arg;
        push @arguments, $item;
    }
    my $line_remaining = $line;
    $line = '';
    my $arg_and_type = 1;
    foreach my $arg (@args)
    {
        if ($arg eq 'arg')
        {
            $arg_and_type = 0;
            last;
        }
        elsif ($arg eq 'argtype')
        {
            last;
        }
    }

    my $always_delimiter_quoted = quotemeta($Texi2HTML::Config::def_always_delimiters);
    my $in_type_delimiter_quoted = quotemeta($Texi2HTML::Config::def_in_type_delimiters);
    my $after_type = 0;
    while ($line_remaining !~ /^\s*$/)
    {
        my ($item, $spaces);
        ($item, $line_remaining,$spaces) = next_def_param($line_remaining, $line_nr);
        if ($item =~ /^([$always_delimiter_quoted])/ or (!$arg_and_type and  $item =~ /^([$in_type_delimiter_quoted].*)/))
        {
           $item = $1;
           push @arg_types, 'delimiter';
           $after_type = 0;
        }
        elsif (!$arg_and_type or $item =~ /^\@/ or $after_type)
        {
           push @arg_types, 'param';
           $after_type = 0;
        }
        elsif ($item =~ /^([$in_type_delimiter_quoted])/)
        {
           push @arg_types, 'delimiter';
        }
        else
        {
           push @arg_types, 'paramtype';
           $after_type = 1;
        }
        $spaces = ' ' if ($spaces);
        #$item =~ s/^\{(.*)\}$/$1/ if ($item =~ /^\{/);
        $line .= $spaces . $item;
        push @arguments, $spaces .$item;
        #push @arguments, $item;
    }
#print STDERR "PARSE_DEF (style $style, category $category, name $name, type $type, class $class, line $line)\n";
    return ($format, $style, $category, $name, $type, $class, $line, \@arguments, \@arg_types);
}

sub begin_paragraph($$)
{
    my $stack = shift;
    my $state = shift;

    my $command = { };
    my $top_format = top_format($stack);
    if (defined($top_format))
    {
        $command = $top_format;
    }
    $command->{'stack_at_beginning'} = [ @{$state->{'command_stack'}} ];
    my $paragraph_or_preformatted = 'paragraph';
    if ($state->{'preformatted'})
    {
        $paragraph_or_preformatted = 'preformatted';
        $state->{'preformatted_context'} = $command;
    }
    else
    {
       $state->{'paragraph_context'} = $command;
       $state->{'paragraph_nr'}++;
    }
    push @$stack, {'format' => $paragraph_or_preformatted, 'text' => '' };
    # FIXME give line, and modify line?
    &$Texi2HTML::Config::begin_paragraph_texi($paragraph_or_preformatted,
      $state->{'paragraph_macros'}, $command, $state, $stack)
        if (defined($Texi2HTML::Config::begin_paragraph_texi));
    # if there are macros which weren't closed when the previous 
    # paragraph was closed we reopen them here
    push @$stack, @{$state->{'paragraph_macros'}} if $state->{'paragraph_macros'};
    delete $state->{'paragraph_macros'};
}

sub parse_format_command($$)
{
    my $line = shift;
    my $tag = shift;
    my $command = '';

    my $orig_line = $line;
    # macro_regexp
    if ($line =~ s/^\s*\@([A-Za-z][\w-]*)(\{\})?\s*$//)
    {
         $command = $1;
         $command = $alias{$command} if (exists($alias{$command}));
    }
    return ('', $command) if ($line =~ /^\s*$/);
    chomp $line;
    $line = substitute_text ({'keep_nr' => 1, 'keep_texi' => 1, 'check_item' => $tag}, undef, "parse_format_command", $line);
    return ($line, $command);
}

sub parse_enumerate($)
{
    my $line = shift;
    my $spec;
    if ($line =~ /^\s*(\w)\b/ and ($1 ne '_'))
    {
        $spec = $1;
        $line =~ s/^\s*(\w)\s*//;
    }
    return ($line, $spec);
}

sub parse_multitable($$)
{
    my $line = shift;
    my $line_nr = shift;
    # first find the table width
    my $table_width = 0;
    my $fractions;
    my $elements;
    if ($line =~ s/^\s+\@columnfractions\s+//)
    {
        @$fractions = split /\s+/, $line;
        $table_width = scalar(@$fractions);
        foreach my $fraction (@$fractions)
        {
            unless ($fraction =~ /^(\d*\.\d+)|(\d+)\.?$/)
            { 
                line_error ("column fraction not a number: $fraction", $line_nr);
            }
        }
    }
    else
    {
        my $element;
        my $line_orig = $line;
        while ($line !~ /^\s*$/)
        {
            my $spaces;
            ($element, $line, $spaces) = next_bracketed($line, $line_nr, 1);
            if ($element =~ /^\{/)
            {
                $table_width++;
                $element =~ s/^\{//;
                $element =~ s/\}\s*$//;
                push @$elements, $element;
            }
            else
            {
                line_warn ("garbage in multitable specification: $element", $line_nr);
            }
        }
    }
    return ($table_width, $fractions, $elements);
}

sub end_format($$$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $format = shift;
    my $line_nr = shift;
    #msg_debug ("END FORMAT $format", $line_nr);
    #dump_stack($text, $stack, $state);
    #sleep 1;
    if ($format_type{$format} eq 'menu')
    {
        $state->{$format}--;
        if ($state->{$format} < 0)
        { # FIXME currently happens, see invalid/not_closed_in_menu.texi
             line_error("Too many $format closed", $line_nr);
             #print STDERR "Bug, $format counter negative: $state->{$format}\n";
             #dump_stack($text, $stack, $state);
             #exit 1;
             $state->{$format} = 0;
        }
        close_menu_comment($text, $stack, $state, "\@end $format", $line_nr); 
    }

    if ($format_type{$format} eq 'list')
    { # those functions return if they detect an inapropriate context
        add_item($text, $stack, $state, $line_nr); # handle lists
    }
    elsif ($format eq 'multitable')
    {
        add_row($text, $stack, $state, $line_nr); # handle multitable
    }
    elsif ($format_type{$format} eq 'table')
    {
        add_term($text, $stack, $state, $line_nr); # handle table
        add_line($text, $stack, $state, $line_nr); # handle table
    }

    #print STDERR "END_FORMAT\n";
    #dump_stack($text, $stack, $state);

    # set to 1 if there is a mismatch between the closed format and format
    # opened before
    my $format_mismatch = 0;
    # set to 1 in normal menu context after an end menu or detailmenu
    my $begin_menu_comment_after_end_format = 0;
	
    my $format_ref = pop @$stack;
    
    ######################### debug
    if (!defined($format_ref->{'text'}))
    {
        push @$stack, $format_ref;
        print STDERR "Bug: text undef in end_format $format\n";
        dump_stack($text, $stack, $state);
        pop @$stack;
    }
    ######################### end debug
    
    if ($region_lines{$format})
    {
        ######################### debug
        if ($format ne $state->{'region_lines'}->{'format'})
        {
            msg_debug ("Bug: mismatched region `$format' ne `$state->{'region_lines'}->{'format'}'");
        }
        ######################### end debug
        $state->{'region_lines'}->{'number'}--;
        if ($state->{'region_lines'}->{'number'} == 0)
        { 
            close_region($state);
        }
    }

    if ($format_type{$format} eq 'table' or $format_type{$format} eq 'list' or $format eq 'multitable')
    {
        if ($format_ref->{'format'} ne $format)
        { # for example vtable closing a table. Cannot be known 
          # before if in a cell
             $format_mismatch = 1;
             line_warn ("Waiting for \@end $format_ref->{'format'}, found \@end $format  ", $line_nr);
        }
        if (!$format_ref->{'empty_first'} and $format_ref->{'item_nr'} == 0)
        {
             line_warn ("\@$format_ref->{'format'} has text but no \@item", $line_nr);
        }
    }

    if (defined($Texi2HTML::Config::def_map{$format}))
    {
        close_stack($text, $stack, $state, $line_nr, 'deff_item')
           unless ($format_ref->{'format'} eq 'deff_item');
        add_prev($text, $stack, &$Texi2HTML::Config::def_item($format_ref->{'text'}, $format_ref->{'only_inter_commands'}, $format_ref->{'orig_command'}));
        $format_ref = pop @$stack; # pop deff
        ######################################### debug
        if (!defined($format_ref->{'format'}) or !defined($Texi2HTML::Config::def_map{$format_ref->{'format'}}))
        {
             print STDERR "Bug: not a def* under deff_item\n";
             push (@$stack, $format_ref);
             dump_stack($text, $stack, $state);
             pop @$stack;  
        }
        ######################################### end debug
        elsif ($format_ref->{'format'} ne $format)
        {
             $format_mismatch = 1;
             line_warn ("Waiting for \@end $format_ref->{'format'}, found \@end $format", $line_nr);
        }
        add_prev($text, $stack, &$Texi2HTML::Config::def($format_ref->{'text'}, $format_ref->{'orig_format'}));
    }
    elsif ($format eq 'float')
    {
        unless (defined($state->{'float'}))
        {
            print STDERR "Bug: state->{'float'} not defined in float\n";
            next;
        }
        my ($caption_lines, $shortcaption_lines) = &$Texi2HTML::Config::caption_shortcaption($state->{'float'});
        my ($caption_text, $shortcaption_text);
        my $caption_state = duplicate_formatting_state($state);
        push @{$caption_state->{'command_stack'}}, 'caption';
        $caption_text = substitute_text($caption_state, undef, '@caption in @end float',  @$caption_lines) if (defined($caption_lines));

        my $shortcaption_state = duplicate_formatting_state($state);
        push @{$shortcaption_state->{'command_stack'}}, 'shortcaption';
        $shortcaption_text = substitute_text($shortcaption_state, undef, '@shortcaption in @end float', @$shortcaption_lines) if (defined($shortcaption_lines));
        add_prev($text, $stack, &$Texi2HTML::Config::float($format_ref->{'text'}, $state->{'float'}, $caption_text, $shortcaption_text));
        delete $state->{'float'};
    }
    elsif (exists ($Texi2HTML::Config::complex_format_map->{$format}) and 
        ($format_type{$format} ne 'menu' or $Texi2HTML::Config::SIMPLE_MENU))
    {
        $state->{'preformatted'}--;
        pop @{$state->{'preformatted_stack'}};
        # debug
        if (!defined($Texi2HTML::Config::complex_format_map->{$format_ref->{'format'}}->{'begin'}))
        {
            print STDERR "Bug undef $format_ref->{'format'}" . "->{'begin'} (for $format...)\n";
            dump_stack ($text, $stack, $state);
        }
        if ($fake_format{$format_ref->{'format'}} and $format_ref->{'text'} =~ /^\s*$/)
        {
           # discard empty fake formats
        }
        #print STDERR "before $format\n";
        #dump_stack ($text, $stack, $state);
        else
        {
            add_prev($text, $stack, &$Texi2HTML::Config::complex_format($format_ref->{'format'}, $format_ref->{'text'}));
        }
        #print STDERR "after $format\n";
        #dump_stack ($text, $stack, $state);
    }
    elsif ($format_type{$format} eq 'table' or $format_type{$format} eq 'list' or $format eq 'multitable')
    {
        if (exists ($Texi2HTML::Config::format_map{$format}))
        { # table or list has a simple format
            add_prev($text, $stack, end_simple_format($format_ref->{'format'}, $format_ref->{'text'}, $state));
        }
        else
        { # table or list handler defined by the user
            add_prev($text, $stack, &$Texi2HTML::Config::table_list($format_ref->{'format'}, $format_ref->{'text'}, $format_ref->{'command'}, $format_ref->{'formatted_command'}, $format_ref->{'item_nr'}, $format_ref->{'spec'}, $format_ref->{'prepended'}, $format_ref->{'prepended_formatted'}, $format_ref->{'columnfractions'}, $format_ref->{'prototype_row'}, $format_ref->{'prototype_lengths'}, $format_ref->{'max_columns'}));
        }
    } 
    elsif ($format_type{$format} eq 'quotation')
    {
        my $quotation_args = pop @{$state->{'quotation_stack'}};
        add_prev($text, $stack, &$Texi2HTML::Config::quotation($format, $format_ref->{'text'}, $quotation_args->{'text'}, $quotation_args->{'text_texi'}));
    }
    elsif ($Texi2HTML::Config::paragraph_style{$format})
    {
        if ($state->{'paragraph_style'}->[-1] eq $format)
        {
            pop @{$state->{'paragraph_style'}};
        }
        if ($fake_format{$format_ref->{'format'}} and $format_ref->{'text'} =~ /^\s*$/)
        {
           # discard empty fake formats
        }
        else
        {
            add_prev($text, $stack, &$Texi2HTML::Config::paragraph_style_command($format_ref->{'format'},$format_ref->{'text'}));
        }
    }
    elsif (exists($Texi2HTML::Config::format_map{$format}))
    {
        if ($fake_format{$format_ref->{'format'}} and $format_ref->{'text'} =~ /^\s*$/)
        {
           # discard empty fake formats
        }
        else
        {
            add_prev($text, $stack, end_simple_format($format_ref->{'format'}, $format_ref->{'text'}, $state));
        }
    }
    elsif ($format_type{$format} eq 'cartouche')
    {
        add_prev($text, $stack, &$Texi2HTML::Config::cartouche($format_ref->{'text'},$state->{'command_stack'}));
    }
    elsif ($format_type{$format} eq 'menu')
    {
    # it should be short-circuited if $Texi2HTML::Config::SIMPLE_MENU
        if ($state->{'preformatted'})
        {
            # remove the fake complex style
            $state->{'preformatted'}--;
            pop @{$state->{'preformatted_stack'}};
        }
 
        # backward compatibility with 1.78 jun 2007   
        if (defined($Texi2HTML::Config::menu))
        {
           if ($format eq 'menu')
           {
               add_prev($text, $stack, &$Texi2HTML::Config::menu($format_ref->{'text'}));
           }
           elsif ($format eq 'detailmenu') # detailmenu
           {
               add_prev($text, $stack, $format_ref->{'text'});
           }
           else # direntry
           {
           }
        }
        else
        {
           add_prev($text, $stack, &$Texi2HTML::Config::menu_command($format, $format_ref->{'text'}, $state->{'preformatted'}));
        }
        $begin_menu_comment_after_end_format = 1;
    }
    else
    {
        line_warn("Unknown format $format", $line_nr);
    }
    
    # fake formats are not on the command_stack
    return 1 if ($fake_format{$format_ref->{'format'}});
    # special case for center as it is at the bottom of the stack
    my $removed_from_stack;
    if ($format eq 'center')
    {
        $removed_from_stack = shift @{$state->{'command_stack'}};
    }
    else
    {
        $removed_from_stack = pop @{$state->{'command_stack'}};
    }
    if ($removed_from_stack ne $format and !$format_mismatch)
    {
        #line_error ("Bug: removed_from_stack $removed_from_stack ne format $format", $line_nr);
        # it may not be a bug. Consider, for example a @code{in code
        # @end cartouche
        # The @code is closed when the paragraph is closed by 
        # @end cartouche but not really closed since it might have been 
        # a multiple paragraph @code. So it is not removed from 
        # command_stack but still have disapeared from the stack!
        line_error("Closing format $format, got $removed_from_stack", $line_nr);
    }
    if ($begin_menu_comment_after_end_format and $state->{'menu'})
    {
        begin_format($text, $stack, $state, 'menu_comment', '', $line_nr);
        return 0;
    }
    return 1;
}

sub push_complex_format_style($$$)
{
    my $command = shift;
    my $complex_format = shift;
    my $state = shift;
    my $class = $command;
    $class = $complex_format->{'class'} if (defined($complex_format->{'class'}));
    my $format_style = {'pre_style' =>$complex_format->{'pre_style'}, 'class' => $class, 'command' => $command };
    if (defined($complex_format->{'style'}))
    {
        $format_style->{'style'} = $complex_format->{'style'};
    }
    else
    {
        if ($state->{'preformatted'} and defined($state->{'preformatted_stack'}->[-1]->{'style'}))
        {
            $format_style->{'style'} = $state->{'preformatted_stack'}->[-1]->{'style'};
        }
        my $index = scalar(@{$state->{'preformatted_stack'}}) -1;
        # since preformatted styles are not nested, the preformatted format
        # of the first format with style has to be used
        if ($index > 0)
        {
            while ($index)
            {
                if ($state->{'preformatted_stack'}->[$index]->{'style'})
                {
                    $format_style->{'class'} = $state->{'preformatted_stack'}->[$index]->{'class'} if (defined($state->{'preformatted_stack'}->[$index]->{'class'}));
                    last;
                }
                $index--;
            }
        }
    }
    $state->{'preformatted'}++;
    push @{$state->{'preformatted_stack'}}, $format_style;
}

sub prepare_state_multiple_pass($$)
{
    my $command = shift;
    my $state = shift;
    my $return_state = { 
         'multiple_pass' => 1, 
          'region_pass' => 1, 
          'element' => $state->{'element'},
         };
    if (defined($command))
    {
        $return_state->{'region'} = $command;
        $return_state->{'command_stack'} = ["$command"];
    }
    return $return_state;
}

sub begin_format($$$$$$);

sub begin_format($$$$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $macro = shift;
    my $line = shift;
    my $line_nr = shift;
    #msg_debug ("BEGIN FORMAT $macro",$line_nr);

    my $in_term;
    my $top_format = top_stack($stack, 2);
    $in_term = 1 if (defined($top_format->{'format'}) and $top_format->{'format'} eq 'term');

    if ($format_type{$macro} eq 'menu')
    {
        if ($state->{'menu'})
        {
            # there should not be any paragraph/preformatted to close
            # if the comment or the description were closed since they 
            # close it
            if (! close_menu_comment($text, $stack, $state, "begin \@$macro", $line_nr)
               and !close_menu_description($text, $stack, $state, "begin \@$macro", $line_nr))
            {
               close_paragraph($text, $stack, $state, "begin \@$macro", $line_nr);
            }
        }
        else
        {
            close_paragraph($text, $stack, $state, "begin \@$macro", $line_nr);
        }
        $state->{$macro}++;
    }
    elsif (!$in_term)
    {
        close_paragraph($text, $stack, $state, "begin \@$macro", $line_nr);
    }

    # close def_item if this is a matching @def*x command
    if (defined($Texi2HTML::Config::def_map{$macro}))
    {
        my $top_format = top_format($stack);
        if (defined($top_format) and ("$top_format->{'format'}x" eq $macro))
        {
          # this is a matching @DEFx command.
             my $deff_item = pop @$stack;
             add_prev($text, $stack, 
                &$Texi2HTML::Config::def_item($deff_item->{'text'}, $deff_item->{'only_inter_commands'}, $deff_item->{'orig_command'}));
             #print STDERR "DEFx $macro\n";
        }
        elsif ($macro =~ /x$/)
        {
            my $base_def_command = $macro;
            $base_def_command =~ s/x$//;
            line_error("Must be in \@$base_def_command environment to use \@$macro", $line_nr);
        }
    }

    $line = &$Texi2HTML::Config::begin_format_texi($macro, $line, $state)
        unless($fake_format{$macro});

    push (@{$state->{'command_stack'}}, $macro) unless ($fake_format{$macro});
    if ($region_lines{$macro})
    {
        open_region($macro,$state);
    }
    # A deff like macro
    if (defined($Texi2HTML::Config::def_map{$macro}))
    {
        my $top_format = top_format($stack);
        my $orig_command = $macro;
        if (defined($top_format) and ("$top_format->{'format'}x" eq $macro))
        {
          # this is a matching @DEFx command.
          # the @DEFx macro has been put at the top of the 
          # command_stack, although there is no real format opening
             pop @{$state->{'command_stack'}};
             $macro =~ s/x$//o;
             #print STDERR "DEFx $macro\n";
        }
        else
        {
             # a new @def.
             $macro =~ s/x$//o;
             # we remove what is on the stack and put it back,
             # to make sure that it is the form without x.
             pop @{$state->{'command_stack'}};
             push @{$state->{'command_stack'}}, $macro;
             #print STDERR "DEF begin $macro\n";
             $top_format = { 'format' => $macro, 'text' => '', 'orig_format' =>$orig_command};
             push @$stack, $top_format;
        }
        #print STDERR "BEGIN_DEFF $macro\n";
        #dump_stack ($text, $stack, $state);
 
        my ($command, $style, $category, $name, $type, $class, $args_array, $args_type_array);
        ($command, $style, $category, $name, $type, $class, $line, $args_array, $args_type_array) = parse_def($macro, $line, $line_nr); 
        my $class_name_texi = &$Texi2HTML::Config::definition_index_entry($name, $class, $style, $command);

        #print STDERR "AFTER parse_def $line";
        my @formatted_args = ();
        my $arguments = '';
        my %formatted_arguments = ();
        my @types = @$args_type_array;
        my $arg_nr = 0;
        my $previous_type;
        foreach my $arg (@$args_array)
        {
            $arg_nr++;
            my $type = shift @types;
            my $substitution_state = duplicate_formatting_state($state);
            # all @def* arguments are in code_style
            $substitution_state->{'code_style'}++;
            push @formatted_args, substitute_line($arg, "\@$macro (arg $arg_nr)", $substitution_state, $line_nr);
            if (grep {$_ eq $type} ('param', 'paramtype', 'delimiter'))
            {
                $arguments .= $formatted_args[-1];
            }
            else
            {
                $formatted_arguments{$type} = $formatted_args[-1];
            }

            $previous_type = $type;
        }
        $name = $formatted_arguments{'name'};
        $category = $formatted_arguments{'category'};
        $type = $formatted_arguments{'type'};
        $class = $formatted_arguments{'class'};

        $name = '' if (!defined($name));
        $category = '' if (!defined($category));
        
        my $class_category = &$Texi2HTML::Config::definition_category($category, $class, $style, $command);
        my $class_name = &$Texi2HTML::Config::definition_index_entry($name, $class, $style, $command);
        my ($index_entry, $formatted_index_entry, $index_label) = do_index_entry_label($macro, $state, $line_nr, $class_name_texi, $line);
        add_prev($text, $stack, &$Texi2HTML::Config::def_line($class_category, $name, $type, $arguments, $index_label, \@formatted_args, $args_type_array, $args_array, $command, $class_name, $category, $class, $style, $orig_command));
        $line = '';
        push @$stack, { 'format' => 'deff_item', 'text' => '', 'only_inter_commands' => 1, 'format_ref' => $top_format, 'orig_command' => $orig_command};
        begin_paragraph_after_command($state, $stack, $macro, $line);
    }
    elsif (exists ($Texi2HTML::Config::complex_format_map->{$macro}) and
        ($format_type{$macro} ne 'menu' or $Texi2HTML::Config::SIMPLE_MENU))
    { # handle menu if SIMPLE_MENU. see texi2html.init
        my $complex_format =  $Texi2HTML::Config::complex_format_map->{$macro};
        my $format = { 'format' => $macro, 'text' => '', 'pre_style' => $complex_format->{'pre_style'} };
        push_complex_format_style($macro, $complex_format, $state);
        push @$stack, $format;

        begin_paragraph($stack, $state);
    }
    elsif ($Texi2HTML::Config::paragraph_style{$macro})
    {
        
        push (@$stack, { 'format' => $macro, 'text' => '' });
        begin_paragraph_after_command($state,$stack,$macro,$line) unless ($in_term);
        push @{$state->{'paragraph_style'}}, $macro;
        if ($macro eq 'center')
        {
            # @center may be in a weird state with regard with
            # nesting, so we put it on the bottom of the stack
            pop @{$state->{'command_stack'}};
            unshift @{$state->{'command_stack'}}, $macro;
            # for similar reasons, we may have a bad stack nesting
            # which results in } after a closing. 
            # The following isn't really true anymore, I think: for example
            # @center @samp{something @center end of samp}
            # resulted to samp being kept in the 'command_stack'

        }
    }
    elsif ($format_type{$macro} eq 'list' or $format_type{$macro} eq 'table' or $macro eq 'multitable')
    {
        my $format;
        #print STDERR "LIST_TABLE $macro\n";
        #dump_stack($text, $stack, $state);
        if ($macro eq 'itemize' or $format_type{$macro} eq 'table')
        {
            my $command;
            my $prepended;
            ($prepended, $command) = parse_format_command($line,$macro);
            if (($command eq '') and ($macro ne 'itemize'))
            {
                $command = 'asis';
                line_warn("table requires an argument: the formatter for \@item.", $line_nr);
            }
            my $prepended_formatted;
            $prepended_formatted = substitute_line($prepended, "prepended for \@$macro", prepare_state_multiple_pass('item', $state)) if (defined($prepended));
            $format = { 'format' => $macro, 'text' => '', 'command' => $command, 'prepended' => $prepended, 'prepended_formatted' => $prepended_formatted };
            $line = '';
        }
        elsif ($macro eq 'enumerate')
        {
            my $spec;
            ($line, $spec) = parse_enumerate ($line);
            $spec = 1 if (!defined($spec)); 
            $format = { 'format' => $macro, 'text' => '', 'spec' => $spec };
        }
        elsif ($macro eq 'multitable')
        {
            my ($max_columns, $fractions, $prototype_row) = parse_multitable ($line, $line_nr);
            if (!$max_columns)
            {
                line_warn ("empty multitable", $line_nr);
                $max_columns = 0;
            }
            my @prototype_lengths = ();
            if (defined($prototype_row))
            {
                my $prototype_nr = 0;
                foreach my $prototype (@$prototype_row)
                { 
                   $prototype_nr++;
                   push @prototype_lengths, 2+length(substitute_line($prototype, "\@coumnfraction (arg $prototype_nr)", prepare_state_multiple_pass('columnfractions', $state))); 
                }
            }
            $format = { 'format' => $macro, 'text' => '', 'max_columns' => $max_columns, 'columnfractions' => $fractions, 'prototype_row' => $prototype_row, 'prototype_lengths' => \@prototype_lengths, 'cell' => 1 };
        }
        $format->{'first'} = 1;
        $format->{'item_nr'} = 0;
        $format->{'paragraph_number'} = 0;
        push @$stack, $format;
        if ($format_type{$macro} eq 'table')
        {
            push @$stack, { 'format' => 'line', 'text' => '', 'format_ref' => $format, 'only_inter_commands' => 1};
        }
        elsif ($macro eq 'multitable')
        {
            push @$stack, { 'format' => 'row', 'text' => '', 'format_ref' => $format, 'item_cmd' => $macro };
            push @$stack, { 'format' => 'cell', 'text' => '', 'format_ref' => $format, 'only_inter_commands' => 1};
        }
        if ($format_type{$macro} eq 'list')
        {
            push @$stack, { 'format' => 'item', 'text' => '', 'format_ref' => $format, 'only_inter_commands' => 1};
        }
        begin_paragraph_after_command($state,$stack,$macro,$line)
           if ($macro ne 'multitable');
        return '' unless ($macro eq 'enumerate');
    }
    elsif ($macro eq 'float' or $format_type{$macro} eq 'quotation')
    {
        push @$stack, {'format' => $macro, 'text' => '' };
        if ($macro eq 'float')
        {
              
             my @args = parse_line_arguments($line, 2, "\@$macro");
             do_float_line ($macro, \@args, $state->{'style_stack'}, $state, $line_nr);
        }
        elsif ($format_type{$macro} eq 'quotation')
        {
             my @args = parse_line_arguments($line, 1, "\@$macro", $line_nr);
             do_quotation_line ($macro, \@args, $state->{'style_stack'}, $state, $line_nr);
             
        }

        $line = '';
        if ($state->{'preformatted'})
        { # inconditionally begin a preformatted section if needed
            begin_paragraph($stack, $state);
        }
        #dump_stack($text, $stack, $state);
    }
    # keep this one at the end as there are some other formats
    # which are also in format_map
    elsif (defined($Texi2HTML::Config::format_map{$macro}) or ($format_type{$macro} eq 'cartouche'))
    {
        push @$stack, { 'format' => $macro, 'text' => '' };
        $state->{'code_style'}++ if ($Texi2HTML::Config::format_code_style{$macro});
        begin_paragraph_after_command($state,$stack,$macro,$line);
    }
    elsif ($format_type{$macro} eq 'menu')
    {
        # if $Texi2HTML::Config::SIMPLE_MENU we won't get there
        # as the menu is a complex format in that case, so it 
        # is handled above
        push @$stack, { 'format' => $macro, 'text' => '' };
        if ($state->{'preformatted'})
        {
        # add a fake complex style in order to have a given pre style
            push_complex_format_style('menu', 
              $Texi2HTML::Config::MENU_PRE_COMPLEX_FORMAT, $state);
            begin_paragraph_after_command($state,$stack,$macro,$line);
        }
        else
        {
            begin_format($text, $stack, $state, 'menu_comment', $line, $line_nr);
        }
    }
    # this is useful for @©enter, and also if there was something on the 
    # line after a format that isn't there anymore, like
    # @format   @c
    $line =~ s/^\s*// unless ($macro eq 'center' and $line =~ /^\s*$/);
    return $line;
}

sub do_text($;$)
{
    my $text = shift;
    my $state = shift;
    return $text if ($state->{'keep_texi'});
    my $remove_texi = 1 if ($state->{'remove_texi'} and !$state->{'simple_format'});
    my $preformatted_style = 0;
    if ($state->{'preformatted'})
    {
        $preformatted_style = $state->{'preformatted_stack'}->[-1]->{'style'};
    }
    return (&$Texi2HTML::Config::normal_text($text, $remove_texi, $preformatted_style, $state->{'code_style'},$state->{'simple_format'},$state->{'command_stack'}, $state));
}

sub end_simple_format($$$)
{
    my $command = shift;
    my $text = shift;
    my $state = shift;

    my $element = $Texi2HTML::Config::format_map{$command};

    my $result = &$Texi2HTML::Config::format($command, $element, $text);
    $state->{'code_style'}-- if ($Texi2HTML::Config::format_code_style{$command});
    return $result;
}

# only get there if not in SIMPLE_MENU and not in preformatted and 
# right in @menu
sub close_menu_comment($$$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $reason = shift;
    my $line_nr = shift;
  
    my $top_format = top_stack($stack,2);
    if (defined($top_format->{'format'}) and $top_format->{'format'} eq 'menu_comment')
    { # this is needed to avoid empty menu-comments <tr>...<pre></pre>
        abort_empty_preformatted($stack, $state);

        close_paragraph($text, $stack, $state, $reason, $line_nr);
        end_format($text, $stack, $state, 'menu_comment', $line_nr);
        return 1;
    }
}

# never get there if in $SIMPLE_MENU
# the last arg is used only if in description and an empty line may 
# stop it and begin a menu_comment
sub close_menu_description($$$$$;$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $reason = shift;
    my $line_nr = shift;
    my $line = shift;

    my $top_format = top_stack($stack,1);
    if (!$state->{'preformatted'})
    {
       $top_format = top_stack($stack);
    }

    if (defined($top_format->{'format'}) and $top_format->{'format'} eq 'menu_description' and (!defined($line) or $line =~ /^\s*$/) )
    {
        close_paragraph($text, $stack, $state, $reason, $line_nr) if ($state->{'preformatted'});
        my $descr = pop(@$stack);
        add_prev($text, $stack, do_menu_description($descr, $state));
        print STDERR "# close_menu: close description\n" if ($T2H_DEBUG & $DEBUG_MENU);
        $state->{'code_style'}-- if ($Texi2HTML::Config::format_code_style{'menu_description'});
        return 1;
    }
}

# Format menu link
# FIXME also pass node and name?
sub do_menu_link($$$)
{
    my $state = shift;
    my $line_nr = shift;
    my $menu_entry = shift;

    my $file = $state->{'element'}->{'file'};
    my $node_name = normalise_node($menu_entry->{'node'});
    # normalise_node is used in fact to determine if name is empty. 
    # It is not passed down to the function reference.
    my $name = normalise_node($menu_entry->{'name'});

    # there is one substitution with spaces kept, and one with spaces
    # normalized. In every cases nodes are in code_style
    my $node_substitution_state = duplicate_formatting_state($state);
    my $name_substitution_state = duplicate_formatting_state($state);
    my $node_normalized_substitution_state = duplicate_formatting_state($state);
    $node_substitution_state->{'code_style'} = 1;
    $node_normalized_substitution_state->{'code_style'} = 1;
    $name_substitution_state->{'code_style'} = 1 if ($Texi2HTML::Config::format_code_style{'menu_name'});
    my $node_formatted = substitute_line($menu_entry->{'node'}, "node name in menu", $node_substitution_state, $line_nr);
    my $node_normalized_formatted = substitute_line($node_name, "normalized node name in menu", $node_normalized_substitution_state);

    my $name_formatted;
    my $has_name = 0;
    if (defined($name) and $name ne '')
    {
        $name_formatted = substitute_line($menu_entry->{'name'}, "menu entry name", $name_substitution_state, $line_nr);
        $has_name = 1;
    }
    else
    {
        my $node_as_name = $menu_entry->{'node'};
        $node_as_name =~ s/^\s*//;
        $name_formatted = substitute_line($node_as_name, "node name in menu", $name_substitution_state);
    }

    my $entry = '';
    my $href;

    my $element;
    if ($state->{'direntry'})
    {
        $href = do_external_href($node_name);
    }
    else
    {
        $element = $nodes{$node_name};
    }

    # menu points to an unknown node
    if (defined($element) and !$element->{'seen'})
    {
        if ($menu_entry->{'node'} =~ /^\s*\(.*\)/o or Texi2HTML::Config::get_conf('novalidate'))
        {
            # menu entry points to another info manual or invalid nodes
            # and novalidate is set
            #$href = $nodes{$node_name}->{'file'};
            $href = do_external_href($node_name);
        }
        else
        {
            line_error ("Menu reference to nonexistent node `$node_name'", $line_nr);
            # try to find an equivalent node
            my @equivalent_nodes = equivalent_nodes($node_name);
            my $node_seen;
            foreach my $equivalent_node (@equivalent_nodes)
            {
                if ($nodes{$equivalent_node}->{'seen'})
                {
                    $node_seen = $equivalent_node;
                    last;
                }
            }
            if (defined($node_seen))
            {
                document_warn("---> but equivalent node `$node_seen' found");
                $element = $nodes{$node_seen};
            }
        }
    }

    # the original node or an equivalent node was seen
    if (defined($element) and $element->{'seen'})
    {
        if ($element->{'reference_element'})
        {
            $element = $element->{'reference_element'};
        }
    
        #print STDERR "SUBHREF in menu for `$element->{'texi'}'\n";
        $href = href($element, $file, $line_nr);
        if (! $element->{'node'})
        {
            $entry = $element->{'text'}; # this is the section/node name
            $entry = "$Texi2HTML::Config::MENU_SYMBOL $entry" if (($entry ne '') and (!defined($element->{'number'}) or ($element->{'number'} =~ /^\s*$/)) and $Texi2HTML::Config::UNNUMBERED_SYMBOL_IN_MENU);
        }
    }
    # save the element used for the href for the description
    $menu_entry->{'menu_reference_element'} = $element;

    return &$Texi2HTML::Config::menu_link($entry, $state, $href, $node_formatted, $name_formatted, $menu_entry->{'ending'}, $has_name, $state->{'command_stack'}, $state->{'preformatted'}, $node_normalized_formatted);
}

sub do_menu_description($$)
{
    my $descr = shift;
    my $state = shift;
    my $text = $descr->{'text'};
    my $menu_entry = $descr->{'menu_entry'};

    my $element = $menu_entry->{'menu_reference_element'};
    
    ############# debug
    # this is not a bug if element is not defined in direntry
    print STDERR "Bug: !defined(element) in do_menu_description\n" if (!defined($element) and ($state->{'menu'} or $state->{'detailmenu'}));
    ############# end debug
    my $element_text = '';
    $element_text = $element->{'text_nonumber'} if (defined($element));

    return &$Texi2HTML::Config::menu_description($text, duplicate_formatting_state($state),$element_text, $state->{'command_stack'}, $state->{'preformatted'});
}

sub do_xref($$$$)
{
    my $macro = shift;
    my $args = shift;
    my $style_stack = shift;
    my $state = shift;
    my $line_nr = shift;

    my $result = '';
    my @args = @$args;

    my $j;
    for ($j = 0; $j <= $#$args; $j++)
    {
        $args[$j] = normalise_texi_space($args[$j]);
    #     print STDERR " ($j)$args[$j]\n";
    }
    #print STDERR "DO_XREF: $macro\n";
    if ($macro eq 'inforef')
    {
        if ((@args < 1) or $args[0] eq '')
        {
            line_error ("First argument to \@$macro may not be empty", $line_nr);
            return '';
        }
    }
    
    #print STDERR "XREF: (@args)\n";
    my $i;
    my $new_state = duplicate_formatting_state($state);
    $new_state->{'keep_texi'} = 0;
    $new_state->{'keep_nr'} = 0;

    my $remove_texi = $new_state->{'remove_texi'};

    my @formatted_args;
    for ($i = 0; $i < 5; $i++)
    {
        $args[$i] = '' if (!defined($args[$i]));
        my $in_file_style;
        $in_file_style = 1 if ($i == 2 and $macro eq 'inforef' or $i == 3 and $macro ne 'inforef');
        $new_state->{'code_style'}++ if ($in_file_style or $i == 0);
        $new_state->{'remove_texi'} = 1 if ($in_file_style);
        $formatted_args[$i] = substitute_line($args[$i], "\@$macro (arg $i)", $new_state, $line_nr);
        $new_state->{'code_style'}-- if ($in_file_style or $i == 0);
        $new_state->{'remove_texi'} = $remove_texi if ($in_file_style);
    }

    my $node_texi = $args[0];
    $node_texi = normalise_node($node_texi);

    my ($file_texi, $file);
    if ($macro eq 'inforef')
    {
       $file_texi = $args[2];
       $file = $formatted_args[2];
    }
    else
    {
       $file_texi = $args[3];
       $file = $formatted_args[3];
    }
    
    # can be an argument or extracted from the node name
    my $file_arg_or_node_texi = $file_texi;
    my $file_arg_or_node = $file;

    my $node_name;
    # the file in parenthesis is removed from node_without_file_texi if needed
    my $node_without_file_texi = $node_texi;
    # node with file, like (file)node
    my $node_and_file_texi;
    # the file in parenthesis present with the node
    my ($file_of_node_texi, $file_of_node);
    if ($node_without_file_texi =~ s/^\(([^\)]+)\)\s*//)
    {
       $file_of_node_texi = $1;
       $file_of_node = substitute_line($file_of_node_texi, "\@$macro node file", $new_state);
       $node_name = substitute_line($node_without_file_texi, "\@$macro node name", $new_state);
       $file_arg_or_node_texi = $file_of_node_texi if ($file_arg_or_node_texi eq '');
       $file_arg_or_node = $file_of_node if ($file_arg_or_node eq '');
       # the file argument takes precedence
       $node_and_file_texi = "($file_arg_or_node_texi)$node_without_file_texi";
    }
    else
    {
        $node_name = $formatted_args[0];
        if (defined ($file_texi) and $file_texi ne '')
        {
            $node_and_file_texi = "($file_texi)$node_texi";
        }
    }

    my $node_and_file;
    if (defined($node_and_file_texi))
    {
       $node_and_file = substitute_line($node_and_file_texi, "\@$macro node with file name", $new_state);
    }
    else
    {
       $node_and_file_texi = $node_texi;
       $node_and_file = $node_name;
    }

    my $cross_ref_texi = $args[1];
    my $cross_ref = $formatted_args[1];
    
    my ($manual_texi, $section_texi, $manual, $section);
    if ($macro ne 'inforef')
    {
        $manual_texi = $args[4];
        $section_texi = $args[2];
        $manual = $formatted_args[4];
        $section = $formatted_args[2];
    }
    else
    {
        $manual = $section = '';
    }
    
    #print STDERR "XREF: (@args)\n";
    
    if (($macro eq 'inforef') or ($file_arg_or_node_texi ne '') or ($manual_texi ne ''))
    {# external ref
        my $href = '';
        if ($file_arg_or_node_texi ne '')
        {
            $href = do_external_href($node_and_file_texi);
        }
        else
        {
            $node_and_file = '';
        }
        my $section_or_node = '';
        if ($manual ne '')
        {
            $section_or_node = $node_name;
            if ($section ne '')
            {
                $section_or_node = $section;
            }
        }
        $result = &$Texi2HTML::Config::external_ref($macro, $section_or_node, $manual, $node_and_file, $href, $cross_ref, \@args, \@formatted_args);
    }
    else
    {
        my $element = $nodes{$node_without_file_texi};
        if ($element and $element->{'seen'})
        {
            if ($element->{'reference_element'})
            {
                $element = $element->{'reference_element'};
            }
            my $file = '';
            if (defined($state->{'element'}))
            {
                $file = $state->{'element'}->{'file'};
            }
            else
            {
                line_warn ("\@$macro not in text (in anchor, node, section...)", $line_nr);
                # if Texi2HTML::Config::SPLIT the file is '' which ensures 
                # a href with the file name. if ! Texi2HTML::Config::SPLIT 
                # the 2 file will be the same thus there won't be the file name
                $file = $element->{'file'} unless (Texi2HTML::Config::get_conf('SPLIT'));
            }
	    #print STDERR "SUBHREF in ref to node `$node_texi'";
            my $href = href($element, $file, $line_nr);
            my $section_or_cross_ref = $section;
            $section_or_cross_ref = $cross_ref if ($section eq '');
            if ($element->{'float'} and $section_or_cross_ref eq '')
            {
                my $style = substitute_line(&$Texi2HTML::Config::listoffloats_float_style($element->{'style_texi'}, $element), "\@listoffloats \@float type");
                $section_or_cross_ref = $style if (defined($style));
            }
            my $name = $section_or_cross_ref;
            my $short_name = $section_or_cross_ref;
            if ($section_or_cross_ref eq '')
            {
                # FIXME maybe one should use 'text' instead of 'text_nonumber'
                # However the real fix would be to have an internal_ref call
                # with more informations 
                $name = $element->{'text_nonumber'};
                $short_name = $node_name;
            }
            $result = &$Texi2HTML::Config::internal_ref ($macro, $href, $short_name, $name, $element->{'section'}, \@args, \@formatted_args, $element);
        }
        else
        {
           if (($node_texi eq '') or (! Texi2HTML::Config::get_conf('novalidate')))
           {
               line_error ("Cross reference to nonexistent node `$node_texi' in \@$macro", $line_nr);
               my $text = '';
               for (my $i = 0; $i < @$args -1; $i++)
               {
                    $text .= $args->[$i] .',';
               }
               $text .= $args->[-1];
               $result = "\@$macro"."{${text}}";
           }
           else
           {
               $result = &$Texi2HTML::Config::external_ref($macro, '', '', $node_name, do_external_href($node_texi), $cross_ref, \@args, \@formatted_args);
           }
        }
    }
    return $result;
}

sub do_acronym_like($$$$$)
{
    my $command = shift;
    my $args = shift;
    my $acronym_texi = shift @$args;
    my $explanation = shift @$args;
    my $style_stack = shift;
    my $state = shift;
    my $line_nr = shift;

    my $explanation_lines;
    my $explanation_text;
    my $explanation_simple_format;

    if (defined($explanation))
    {
        $explanation = trim_around_spaces($explanation);
        $explanation = undef if ($explanation eq '');
    }
    $acronym_texi = trim_around_spaces($acronym_texi);
    
    return '' if ($acronym_texi eq '');
    
    my $with_explanation = 0;
    my $normalized_text =  cross_manual_line(normalise_node($acronym_texi));
    if (defined($explanation))
    {
        $with_explanation = 1;
        $acronyms_like{$command}->{$normalized_text} = $explanation;
    }
    elsif (exists($acronyms_like{$command}->{$normalized_text}))
    {
        $explanation = $acronyms_like{$command}->{$normalized_text};
    }

    if (defined($explanation))
    {
         @$explanation_lines = map {$_ = $_."\n"} split (/\n/, $explanation);
         my $text = '';
         foreach my $line(@$explanation_lines)
         {
              $line .= ' ' if (chomp ($line));
              $text .= $line
         }
         $text =~ s/ $//;
         $explanation_simple_format = simple_format($state, [ $line_nr ], "simple_format \@$command explanation", $text);
         $explanation_text = substitute_line($text, "\@$command explanation", duplicate_formatting_state($state), $line_nr);
    }
    return &$Texi2HTML::Config::acronym_like($command, $acronym_texi, substitute_line($acronym_texi, "\@$command", duplicate_formatting_state($state), $line_nr), 
       $with_explanation, $explanation_lines, $explanation_text, $explanation_simple_format);
}

sub do_caption_shortcaption($$$$$$)
{
    my $command = shift;
    my $args = shift;
    my $text_texi = $args->[0];
    my $style_stack = shift;
    my $state = shift;
    my $line_nr = shift;
    my $kept_line_nrs = shift;

    if (!exists($state->{'float'}))
    {
#dump_stack(\"", [], $state);
         line_error("\@$command outside of float", $line_nr);
         return '';
    }
    my $float = $state->{'float'};
    my @texi_lines = map {$_ = $_."\n"} split (/\n/, $text_texi);
    $float->{"${command}_texi"} = \@texi_lines;
    if (defined($kept_line_nrs))
    {
       $float->{"${command}_keep_line_nr"} = [ @$kept_line_nrs ];
       msg_debug ("Empty $kept_line_nrs", $line_nr) unless (@{$kept_line_nrs});
    }
    else
    {
        $float->{"${command}_keep_line_nr"} = [ $line_nr ];
        msg_debug("do_caption_shortcaption $command, $float, kept_line_nrs not defined", $line_nr);
    }
    #print STDERR "GGGGGGG @$kept_line_nrs\n";
    return  &$Texi2HTML::Config::caption_shortcaption_command($command, 
       substitute_text(prepare_state_multiple_pass($command, $state), $kept_line_nrs, "\@$command in do_caption_shortcaption", @texi_lines), \@texi_lines, $float);
}

# function called when a @float is encountered. Don't do any output
# but prepare $state->{'float'}
sub do_float_line($$$$$)
{
    my $command = shift;
    my $args = shift;
    my $style_stack = shift;
    my $state = shift;
    my $line_nr = shift;

    my @args = @$args;
    my $style_texi = shift @args;
    my $label_texi = shift @args;

    $style_texi = undef if (defined($style_texi) and $style_texi=~/^\s*$/);
    $label_texi = undef if (defined($label_texi) and $label_texi=~/^\s*$/);

    $style_texi = normalise_texi_space($style_texi) if (defined($style_texi));

    if (defined($label_texi))
    { # the float is considered as a node as it may be a target for refs.
      # it was entered as a node in the pass_structure and the float
      # line was parsed at that time
         $state->{'float'} = $nodes{normalise_node($label_texi)};
         #msg_debug("float: $state->{'float'}, $state->{'float'}->{'texi'}", $line_nr);  
    }
    else 
    { # a float without label. It can't be the target for refs.
         $state->{'float'} = { 'float' => 1 };
         if (defined($style_texi))
         {
              $state->{'float'}->{'style_texi'} = $style_texi;
              $state->{'float'}->{'style_id'} = 
                  cross_manual_line($state->{'float'}->{'style_texi'});
         }
         #print STDERR "float: (no label) $state->{'float'}\n";
    }
    $state->{'float'}->{'style'} = substitute_line($state->{'float'}->{'style_texi'}, "\@$command style", undef, $line_nr);
    return '';
}

sub do_quotation_line($$$$$)
{
    my $command = shift;
    my $args = shift;
    my @args = @$args;
    my $text_texi = shift @args;
    my $style_stack = shift;
    my $state = shift;
    my $line_nr = shift;
    my $text;

    $text_texi = undef if (defined($text_texi) and $text_texi=~ /^\s*$/);
    if (defined($text_texi))
    {
         $text_texi = trim_around_spaces($text_texi);
         $text = substitute_line($text_texi, "\@$command line", duplicate_formatting_state($state), $line_nr);
         #$text =~ s/\s*$//;
    }
    my $quotation_args = { 'text' => $text, 'text_texi' => $text_texi };
    push @{$state->{'quotation_stack'}}, $quotation_args;
    $state->{'prepend_text'} = &$Texi2HTML::Config::quotation_prepend_text($command, $text_texi);
    return '';
}

sub do_footnote($$$$$$)
{
    my $command = shift;
    my $args = shift;
    my $text = $args->[0];
    my $style_stack = shift;
    my $doc_state = shift;
    my $line_nr = shift;
    my $kept_line_nrs = shift;

    $text .= "\n";
    $text = &$Texi2HTML::Config::footnote_texi($text, $doc_state, $style_stack)
        if (defined($Texi2HTML::Config::footnote_texi));

    #if (!defined($text))
    #{
    #    msg_debug("footnote text not defined($global_foot_num, ".var_to_str($doc_state->{'outside_document'})." or $doc_state->{'multiple_pass'}). Original argument $args->[0]", $line_nr);
    #}
    #else
    #{
    #    msg_debug("FOOTNOTE($global_foot_num, ".var_to_str($doc_state->{'outside_document'})." or $doc_state->{'multiple_pass'}) $text", $line_nr);
    #}
    my $foot_state = duplicate_state($doc_state);
    fill_state($foot_state);
    push @{$foot_state->{'command_stack'}}, 'footnote';

    push_state($foot_state);

    my ($foot_num, $relative_foot_num);
    if (!$foot_state->{'region'})
    {
        $foot_num = \$global_foot_num;
        $relative_foot_num = \$global_relative_foot_num;
    }
    else
    {
        $foot_num = \$doc_state->{'foot_num'};
        $relative_foot_num = \$doc_state->{'relative_foot_num'};
    }
    $$foot_num++;
    $$relative_foot_num++;   
 
    my $docid  = "DOCF$$foot_num";
    my $footid = "FOOT$$foot_num";
    if ($doc_state->{'region'})
    {
        $docid = $target_prefix . $doc_state->{'region'} . "_$docid";
        $footid = $target_prefix . $doc_state->{'region'} . "_$footid";
    }
    my $from_file = $docu_doc;
    if ($doc_state->{'element'})
    { 
        $from_file = $doc_state->{'element'}->{'file'};
    }
    
    if (Texi2HTML::Config::get_conf('footnotestyle') eq 'separate')
    {
        $foot_state->{'element'} = $footnote_element;
    }
    
    $foot_state->{'footnote_number_in_doc'} = $$foot_num;
    $foot_state->{'footnote_number_in_page'} = $$relative_foot_num;
    $foot_state->{'footnote_footnote_id'} = $footid;
    $foot_state->{'footnote_place_id'} = $docid;
    $foot_state->{'footnote_document_file'} = $from_file;
    $foot_state->{'footnote_footnote_file'} = $foot_state->{'element'}->{'file'};
    $foot_state->{'footnote_document_state'} = $doc_state;
    
    # FIXME use split_lines ? It seems to work like it is now ?
    msg_debug ("No line nnumbers in footnote", $line_nr) if (!defined($kept_line_nrs) or !@$kept_line_nrs);
    my @lines;
    if (defined($text))
    {
        @lines = substitute_text($foot_state, $kept_line_nrs, '@footnote', map {$_ = $_."\n"} split (/\n/, $text));
    }
    my ($foot_lines, $foot_label) = &$Texi2HTML::Config::foot_line_and_ref($$foot_num,
         $$relative_foot_num, $footid, $docid, $from_file, $foot_state->{'element'}->{'file'}, \@lines, $doc_state);
    if ($doc_state->{'outside_document'} or ($doc_state->{'region'} and $doc_state->{'multiple_pass'} > 0))
    {
#print STDERR "multiple_pass $doc_state->{'multiple_pass'}, 'outside_document' $doc_state->{'outside_document'}\n";
#print STDERR "REGION FOOTNOTE($$foot_num): $doc_state->{'region'} ($doc_state->{'region_pass'})\n";
        $region_initial_state{$doc_state->{'region'}}->{'footnotes'}->{$$foot_num}->{$doc_state->{'region_pass'}} = $foot_lines;
    }
    else
    {
#print STDERR "GLOBAL FOOTNOTE($$foot_num)\n";
         push(@foot_lines, @{$foot_lines});
    }
    pop_state();
    return $foot_label;
}

sub do_image($$$$$)
{
    # replace images
    my $command = shift;
    my $args = shift;
    my $style_stack = shift;
    my $state = shift;
    my $line_nr = shift;
    my @args;
    foreach my $arg (@$args)
    {
       $arg = trim_around_spaces($arg) if (defined($arg));
       push @args, $arg;
    }
    my $base = substitute_line($args[0], "\@$command base name",{'code_style' => 1, 'remove_texi' => 1});
    my $base_simple = substitute_line($args[0], "\@$command base name", {'simple_format' => 1, 'code_style' => 1});
    if ($base eq '')
    {
         line_error ("no file argument for \@image", $line_nr);
         return '';
    }
    $args[4] = '' if (!defined($args[4]));
    $args[3] = '' if (!defined($args[3]));
    my $image;
    #my $extension = substitute_line($args[4], {'code_style' => 1});
    my $extension = substitute_line($args[4], "\@$command extension", {'code_style' => 1, 'remove_texi' => 1});
    my $extension_simple = substitute_line($args[4], "\@$command extension", {'simple_format' => 1, 'code_style' => 1});
    my ($file_name, $image_name, $simple_file_name);
    my @file_locations;
    my @file_names = &$Texi2HTML::Config::image_files($base,$extension,$args[0],$args[4]);
#    $image = locate_include_file("$base.$args[4]") if ($args[4] ne '');
    foreach my $file (@file_names)
    {
        my $simple_file = substitute_line($file->[1], "\@$command file name", {'simple_format' => 1, 'code_style' => 1});
        if ($image = locate_include_file($file->[0]))
        {
            if (!defined($file_name))
            {
                $file_name = $file->[0];
                $image_name = $image;
                $simple_file_name = $simple_file;
            }
            push @file_locations, [$file, $image, $simple_file];
        }
        else
        {
            push @file_locations, [$file, undef, $simple_file];
        }
    }
    $image_name = '' if (!defined($image_name));
    $simple_file_name = '' if (!defined($simple_file_name));
    
    my $alt; 
    if ($args[3] =~ /\S/)
    {
        $alt = substitute_line($args[3], "\@$command alt text", {'simple_format' => 1}, $line_nr);
    }
    return &$Texi2HTML::Config::image($path_to_working_dir . $image_name, 
        $base, 
        $state->{'preformatted'}, $file_name, $alt, $args[1], $args[2], 
        $args[3], $extension, $path_to_working_dir, $image_name, 
        $state->{'paragraph_context'}, \@file_locations, $base_simple,
        $extension_simple, $simple_file_name, $line_nr);
}

# usefull if we want to duplicate only the global state, nothing related with
# formatting
sub duplicate_state($)
{
    my $state = shift;
    my $new_state = { 'element' => $state->{'element'},
         'multiple_pass' => $state->{'multiple_pass'},
         'region_pass' => $state->{'region_pass'},
         'region' => $state->{'region'},
         'sec_num' => $state->{'sec_num'},
         'outside_document' => $state->{'outside_document'},
         'inside_document' => $state->{'inside_document'},
         'duplicated' => 1
    };
    return $new_state;
}

# duplicate global and formatting state.
sub duplicate_formatting_state($)
{
    my $state = shift;
    my $new_state = duplicate_state($state);

    # Things passed here should be things that are not emptied/set to 0 by
    # any command. Also they shouldn't need anything to be on the 
    # stack. This rules out paragraphs, for example.
    foreach my $format_key ('preformatted', 'code_style', 'keep_texi',
          'keep_nr', 'preformatted_stack')
    {
        $new_state->{$format_key} = $state->{$format_key}; 
    }
# this is needed for preformatted
    my $command_stack = $state->{'command_stack'};
    $command_stack = [] if (!defined($command_stack));
    $new_state->{'command_stack'} = [ @$command_stack ];
    $new_state->{'preformatted_context'} = {'stack_at_beginning' => [ @$command_stack ]};
    $new_state->{'code_style'} = 0 if (!defined($new_state->{'code_style'}));
    return $new_state;
}

sub expand_macro($$$$$)
{
    my $name = shift;
    my $args = shift;
    my $end_line = shift;
    my $line_nr = shift;
    my $state = shift;

    # we dont expand macros when in ignored environment.
    return if ($state->{'ignored'});

    die "Bug end_line not defined" if (!defined($end_line));
    
    my $index = 0;
    foreach my $arg (@$args)
    { # expand @macros in arguments. It is complicated because we must be
      # carefull not to expand macros in @ignore section or the like, and 
      # still keep every single piece of text (including the @ignore macros).
        $args->[$index] = substitute_text({'texi' => 1, 'arg_expansion' => 1}, undef, "expand_macro in $name", split_lines($arg));
        $index++;
    }
    # retrieve the macro definition
    my $macrobody = $macros->{$name}->{'body'};
    my $formal_args = $macros->{$name}->{'args'};
    my $args_index =  $macros->{$name}->{'args_index'};

    my $i;    
    for ($i=0; $i<=$#$formal_args; $i++)
    {
        $args->[$i] = "" unless (defined($args->[$i]));
        print STDERR "# arg($i): $args->[$i]\n" if ($T2H_DEBUG & $DEBUG_MACROS);
    }
    line_error ("too much arguments for macro $name", $line_nr) if (defined($args->[$i + 1]));
    my $result = '';
    while ($macrobody ne '')
    {
        if ($macrobody =~ s/^([^\\]*)\\//o)
        {
            $result .= $1 if defined($1);
            if ($macrobody =~ s/^\\//)
            {
                $result .= '\\';
            }
            elsif ($macrobody =~ s/^(\@end\sr?macro)$// or $macrobody =~ s/^(\@end\sr?macro\s)// or $macrobody =~ s/^(\@r?macro\s+\w+\s*.*)//)
            { # \ protect @end macro
                $result .= $1;
            }
            elsif ($macrobody =~ s/^([^\\]*)\\//)
            {
               my $arg = $1;
               if (defined($args_index->{$arg}))
               {
                   $result .= $args->[$args_index->{$arg}];
               }
               else
               {
                   line_error ("\\ not followed by \\ or an arg but by $arg in macro", $macros->{$name}->{'line_nr'});
                   $result .= '\\' . $arg;
               }
            }
            next;
        }
        $result .= $macrobody;
        last;
    }
    my @result = split(/^/m, $result);
    # for a completly empty macro, $result = '', and the split leads
    # to an empty array, so add back an empty string
    @result = ('') if (!scalar(@result));
    # Add the result of the macro expansion back to the input_spool.
    # Set the macro name if in the outer macro
    if ($state->{'arg_expansion'})
    { # in that case we are in substitute_text for an arg
        unshift @{$state->{'spool'}}, (@result, $end_line);
    }
    else
    {
        #$result[-1].=$end_line;
#foreach my $res (@result)
#{
#   print STDERR "RESULT:$res";
#}
#print STDERR "#########end->$end_line";
        my $last_line = $result[-1];
        if (chomp($last_line))
        {
            push @result, $end_line;
        }
        else
        {
            $result[-1] .= $end_line;
        }
        unshift @{$state->{'input_spool'}->{'spool'}}, (@result); #, $end_line);
        $state->{'input_spool'}->{'macro'} = $name if ($state->{'input_spool'}->{'macro'} eq '');
    }
    if ($T2H_DEBUG & $DEBUG_MACROS)
    {
        print STDERR "# macro expansion result:\n";
        #print STDERR "$first_line";
        foreach my $line (@result)
        {
            print STDERR "$line";
        }
        print STDERR "# macro expansion result end\n";
    }
}

sub do_index_summary_file($$)
{
    my $name = shift;
    my $docu_name = shift;
    &$Texi2HTML::Config::index_summary_file_begin ($name, $printed_indices{$name}, $docu_name);
    print STDERR "# writing $name index summary for $docu_name\n" if $T2H_VERBOSE;

    foreach my $letter_entries (@{$Texi2HTML::THISDOC{'index_letters_array'}->{$name}})
    {
      foreach my $entry (@{$letter_entries->{'entries'}})
      {
        #my $entry = $entries->{$key};
        my $indexed_element = $entry->{'element'};
        my $entry_element = $indexed_element;
        $entry_element = $entry_element->{'element_ref'} if (defined($entry_element->{'element_ref'}));
        my $origin_href = $entry->{'file'};
   #print STDERR "$entry $entry->{'entry'}, real elem $indexed_element->{'texi'}, section $entry_element->{'texi'}, real $indexed_element->{'file'}, entry file $entry->{'file'}\n";
        if ($entry->{'target'})
        { 
             $origin_href .= '#' . $entry->{'target'};
        }
        else
        {
            $origin_href .= '#' . $indexed_element->{'target'};
        }
        &$Texi2HTML::Config::index_summary_file_entry ($name,
          $entry->{'key'}, $origin_href, 
          substitute_line($entry->{'entry'}, "\@$entry->{'command'}"), $entry->{'entry'},
          href($entry_element, ''),
          $entry_element->{'text'},
          $printed_indices{$name},
          $docu_name);
       }
    }
    &$Texi2HTML::Config::index_summary_file_end ($name, $printed_indices{$name}, $docu_name);
}

sub get_index_entry_infos($$;$)
{
    my $entry = shift;
    my $element = shift;
    my $line_nr = shift;
    my $index_heading_element = $entry->{'element'};
    my $entry_heading_element = $index_heading_element;
    my $real_index_element = $entry->{'real_element'};

    if (!defined($entry->{'real_element'}))
    {
        print STDERR "BUG: entry->{'real_element'} not defined\n";
    }
    # we always use the associated element_ref, instead of the original
    # element
    $entry_heading_element = $entry_heading_element->{'element_ref'} 
        if (defined($entry_heading_element->{'element_ref'}));
    if ($entry->{'real_element'} eq $element_before_anything)
    {
       $real_index_element = $element_top;
    }
    else
    {
       $real_index_element = $entry->{'real_element'}->{'element_ref'};
       if (!defined($real_index_element))
       { # happens when $USE_NODES = 0 and there are only sections, 
         # and vice-versa
          $real_index_element = $entry->{'real_element'};
       }
    }

    my $origin_href = '';
    print STDERR "BUG: entry->{'file'} not defined for `$entry->{'entry'}'\n"
       if (!defined($entry->{'file'}));
    print STDERR "BUG: element->{'file'} not defined for `$entry->{'entry'}', `$element->{'texi'}'\n"
       if (!defined($element->{'file'}));
    $origin_href = $entry->{'file'} if ($entry->{'file'} ne $element->{'file'});
#print STDERR "$entry $entry->{'entry'}, real heading elem $index_heading_element->{'texi'}, section $entry_element->{'texi'}, real $index_heading_element->{'file'}, entry file $entry->{'file'}\n";
    if (defined($entry->{'target'}))
    { 
         $origin_href .= '#' . $entry->{'target'};
    }
    else
    { # this means that the index entry is in a special region like @copying...
         $origin_href .= '#' . $index_heading_element->{'target'};
    }
   #print STDERR "SUBHREF in index entry `$entry->{'entry'}' for `$entry_element->{'texi'}'\n";
    return ($origin_href, 
            $entry->{'file'},
            $element->{'file'},
            $entry->{'target'},
            $index_heading_element->{'target'},
            substitute_line($entry->{'entry'}, "\@$entry->{'command'} index infos"),
            href($entry_heading_element, $element->{'file'}, $line_nr),
            $entry_heading_element->{'text'});
}

# remove texi commands, replacing with what seems adequate. see simple_map_texi
# and texi_map.
# Doesn't protect html
sub remove_texi(@)
{
    return substitute_text ({ 'remove_texi' => 1}, undef, undef, @_);
}

# Same as remove texi but protect text and use special maps for @-commands
sub simple_format($$$@)
{
    my $state = shift;
    my $line_nrs = shift;
    my $context = shift;
    if (!defined($state))
    {
        $state = {};
    }
    else
    {
        $state = duplicate_formatting_state($state);
    }
    $state->{'remove_texi'} = 1;
    $state->{'simple_format'} = 1;
    $::simple_map_texi_ref = \%Texi2HTML::Config::simple_format_simple_map_texi;
    $::style_map_texi_ref = \%Texi2HTML::Config::simple_format_style_map_texi;
    $::texi_map_ref = \%Texi2HTML::Config::simple_format_texi_map;
    my $text = substitute_text($state, $line_nrs, $context, @_);
    $::simple_map_texi_ref = \%Texi2HTML::Config::simple_map_texi;
    $::style_map_texi_ref = \%Texi2HTML::Config::style_map_texi;
    $::texi_map_ref = \%Texi2HTML::Config::texi_map;
    return $text;
}

sub index_entry_command_prefix($$$)
{
    my $command = shift;
    my $line = shift;
    my $line_nr = shift;
    if ($command =~ /^(v|f)table$/)
    {
       return $1;
    }
    elsif (defined($Texi2HTML::Config::def_map{$command}))
    {
       my ($prefix, $entry, $argument) = get_deff_index($command, $line, undef, 0);
       return $prefix;
    }
    my $prefix = index_command_prefix($command);
    line_error("No prefix found for \@$command $line",$line_nr) if ($prefix eq '');
    return $prefix;
}

sub enter_table_index_entry($$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    if ($state->{'item'})
    {
         my $item_command = $state->{'item'};
         delete $state->{'item'};
         my $item = pop @$stack;
         if ($state->{'table_stack'}->[-1] =~ /^(v|f)table$/)
         {
             my $index = $1;
             enter_index_entry($index, $line_nr, 
               $item->{'text'}, $state->{'table_stack'}->[-1], $state);
         }
         add_prev($text, $stack, "\@$item_command" . $item->{'text'});
    }
}

sub end_macro($$$)
{
    my $state = shift;
    my $end_string = shift;
    my $remaining_on_the_line = shift;

    $state->{'macro_inside'}--;
    return (0, undef) if ($state->{'ignored'});
    if ($state->{'macro_inside'})
    {
        $state->{'macro'}->{'body'} .= $end_string;
        return (0, undef);
    }
    my $macro_text = $state->{'macro'}->{'header'} . $state->{'macro'}->{'body'}.$end_string;
    chomp $state->{'macro'}->{'body'};
    print STDERR "# end macro def. Body:\n$state->{'macro'}->{'body'}"
      if ($T2H_DEBUG & $DEBUG_MACROS);
    $macros->{$state->{'macro'}->{'name'}} = $state->{'macro'} unless ($state->{'arg_expansion'});
    delete $state->{'macro'};
    return (1, $macro_text.$remaining_on_the_line) if ($remaining_on_the_line =~ /^\s*$/);
    return (0, $macro_text);
}

sub close_macro_arg($$$)
{
   my $state = shift;
   my $current_line = shift;
   my $line_nr = shift;

   # balanced } ends the macro call, otherwise it is in the arg
   $state->{'macro_depth'}--;
   if ($state->{'macro_depth'} == 0)
   {
#print STDERR "BEFORE: $current_line";
      print STDERR "# expanding macro $state->{'macro_name'}\n" if ($T2H_DEBUG & $DEBUG_MACROS);
      #$current_line = 
      expand_macro($state->{'macro_name'}, $state->{'macro_args'}, $current_line, $line_nr, $state);
      delete $state->{'macro_name'};
      delete $state->{'macro_depth'};
      delete $state->{'macro_args'};
#print STDERR "AFTER: $current_line";
      #return $current_line;
      return 1;
   }
   else
   {
       print STDERR "# macro call: closing }\n" if ($T2H_DEBUG & $DEBUG_MACROS);
       add_text('}', \$state->{'macro_args'}->[-1]);
       return undef;
   }
}

sub close_style_texi($$$$;$)
{
    my $style = shift;
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $no_close = shift;

    $no_close = 0 if (!defined($no_close));

    my $result;
    if (!defined($style->{'style'}))
    {
        msg_debug("'style' not defined in close_style_texi ($no_close)");
        foreach my $key (keys(%$style))
        {
            print STDERR "  --> $key: ".var_to_str($style->{$key})."\n";
        }
    }

    if (($style->{'style'} ne '') and exists($info_enclose{$style->{'style'}}) and !$state->{'arg_expansion'})
    {
        $result = $info_enclose{$style->{'style'}}->[0] . $style->{'text'} . $info_enclose{$style->{'style'}}->[1];
    }
    elsif ($style->{'style'} ne '')
    {
        $result = '@' . $style->{'style'} . '{' . $style->{'text'};
        $result .= '}' unless ($no_close);
    }
    else
    {
        $result = '{' . $style->{'text'};
        # don't close { if we are closing stack as we are not
        # sure this is a { ... } construct. i.e. we are
        # not sure that the user properly closed the matching
        # brace, so we don't close it ourselves
        $result .= '}' unless ($no_close or $state->{'arg_expansion'});
    }
    if ($state->{'ignored'})
    {# ARG_EXPANSION
        print STDERR "# Popped `$style->{'style'}' in ifset/ifclear\n" if ($T2H_DEBUG);
    }
    else
    {
        add_prev ($text, $stack, $result);
    }
}

sub close_ignored ($$)
{
    my $state = shift;
    my $stack = shift;
    if (($state->{'ifvalue_inside'}) and $state->{'ignored'} eq $state->{'ifvalue'})
    {
        if ($state->{'ifvalue_inside'} == 1)
        {# closing still opened @-commands with braces
            pop (@$stack) while (@$stack and $stack->[-1]->{'style'} ne 'ifvalue')
        }
        pop (@$stack);
        $state->{'ifvalue_inside'}--;
    }
    $state->{'ignored'} = undef;
    delete $state->{'ignored'};
    # We are stil in the ignored ifset or ifclear section
    $state->{'ignored'} = $state->{'ifvalue'} if ($state->{'ifvalue_inside'});
    #dump_stack($text, $stack, $state);
}


# Called in 2 contexts: 
# * in main document
# * from substitute_text, called in turn from arg_expansion. In that case
#   'texi' is true, and so is 'arg_expansion'. In that case constructs are
#   expanded but no action is performed. Therefore $line_nr is not of use.
sub scan_texi($$$$;$)
{
    my $scanned_line = shift;
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    
    die "stack not an array ref"  unless (ref($stack) eq "ARRAY");
    my $cline = $scanned_line;

    while(1)
    {
        # scan_texi
        #print STDERR "WHILE(t):$cline";
        #print STDERR "ARG_EXPANSION: $state->{'arg_expansion'}\n" if ($state->{'arg_expansion'});
        #dump_stack($text, $stack, $state);
        #print STDERR "ifvalue_inside $state->{'ifvalue_inside'}\n";


        # first we handle special cases:
        # macro definition: $state->{'macro_inside'}
        # macro arguments:  $state->{'macro_name'}
        # raw format:       $state->{'raw'}
        # @verb:            $state->{'verb'}
        # ignored:          $state->{'ignored'}
        # and then the remaining text/macros.

        # in macro definition
        if ($state->{'macro_inside'})
        {
            if ($cline =~ s/^([^\\\@]*\\)//)
            {# protected character or @end macro
                 $state->{'macro'}->{'body'} .= $1 unless ($state->{'ignored'});
                 if ($cline =~ s/^\\//)
                 {
                      $state->{'macro'}->{'body'} .= '\\' unless ($state->{'ignored'});
                      next;
                 }
                 # I believe it is correct, although makeinfo don't do that.
                 elsif ($cline =~ s/^(\@end\sr?macro)$//o or $cline =~ s/^(\@end\sr?macro\s)//o
                      or $cline =~ s/^(\@r?macro\s+\w+\s*.*)//o) 
                 {
                      $state->{'macro'}->{'body'} .= $1 unless ($state->{'ignored'});
                      next;
                 }
            }
            #if ($cline =~ s/^(.*?)\@end\sr?macro$//o or $cline =~ s/^(.*?)\@end\sr?macro\s+//o)
            if ($cline =~ s/^(\@end\sr?macro)$//o or $cline =~ s/^(\@end\sr?macro\s+)//o)
            {
                 my ($no_remaining, $result) = end_macro($state, $1, $cline);
                 add_prev ($text, $stack, $result) if (defined($result));
                 return 1 if ($no_remaining);
                 next;
            }

            elsif($cline =~ /^(\@r?macro\s+\w+\s*.*)/)
            {
                 $state->{'macro'}->{'body'} .= $cline unless ($state->{'ignored'});
                 $state->{'macro_inside'}++;
                 #return;
                 return 1;
            }
            elsif ($cline =~ s/^\@(.)//)
            {
                 $state->{'macro'}->{'body'} .= '@' . $1 unless ($state->{'ignored'});
                 next;
            }
            elsif ($cline =~ s/^\@//)
            {
                 $state->{'macro'}->{'body'} .= '@' unless ($state->{'ignored'});
                 next;
            }
            else
            {
                 $cline =~ s/([^\@\\]*)//;
                 if ($state->{'ignored'})
                 {
                     return if ($cline =~ /^$/);
                     next;
                 }
                 $state->{'macro'}->{'body'} .= $1 if (defined($1));
                 if ($cline =~ /^$/)
                 {
                      $state->{'macro'}->{'body'} .= $cline;
                      #return;
                      return 1;
                 }
                 next;
            }
        }
        # in macro arguments parsing/expansion. Here \ { } and , if this is a
        # multi args macro have a signification, the remaining is passed 
        # unmodified
        if (defined($state->{'macro_name'}))
        {
            my $special_chars = quotemeta ('\{}');
            my $multi_args = 0;
            my $formal_args = $macros->{$state->{'macro_name'}}->{'args'};
            $multi_args = 1 if ($#$formal_args >= 1);
            $special_chars .= quotemeta(',') if ($multi_args);
            if ($state->{'macro_args'}->[-1] eq '')
            {# remove space at the very beginning
                $cline =~ s/^\s*//o;
            }
            if ($cline =~ s/^([^$special_chars]*)([$special_chars])//)
            {
                $state->{'macro_args'}->[-1] .= $1 if defined($1);
                # \ protects any character in macro arguments
                if ($2 eq '\\')
                {
                    print STDERR "# macro call: protected char\n" if ($T2H_DEBUG & $DEBUG_MACROS);
                    if ($cline =~ s/^(.)//)
                    {
                        $state->{'macro_args'}->[-1] .= $1;
                    }
                    else
                    {
                        $state->{'macro_args'}->[-1] .= '\\';
                    }
                }
                elsif ($2 eq ',')
                { # in texinfo 4.8.90 a comma in braces is protected
                    if ($state->{'macro_depth'} > 1)
                    {
                        $state->{'macro_args'}->[-1] .= ',';
                    }
                    else
                    { # separate args
                        print STDERR "# macro call: new arg\n" if ($T2H_DEBUG & $DEBUG_MACROS);
                        $cline =~ s/^\s*//o;
                        push @{$state->{'macro_args'}}, '';
                    }
                }
                elsif ($2 eq '}')
                { 
                    #my $macro_result_line = close_macro_arg($state, $cline);
                    return if (close_macro_arg($state, $cline, $line_nr));
                    #if (defined($macro_result_line))
                    #{
                    #    $cline = $macro_result_line;
                    #    return;
                    #}
                }
                elsif ($2 eq '{')
                {
                    print STDERR "# macro call: opening {\n" if ($T2H_DEBUG & $DEBUG_MACROS);
                    $state->{'macro_depth'}++;
                    add_text('{', \$state->{'macro_args'}->[-1]);
                }
                next;
            }
            print STDERR "# macro call: end of line\n" if ($T2H_DEBUG & $DEBUG_MACROS);
            $state->{'macro_args'}->[-1] .= $cline;
            return;
        }
        # in a raw format, verbatim, tex or html
        if ($state->{'raw'}) 
        {
            my $tag = $state->{'raw'};

            # debugging
            if (! @$stack or ($stack->[-1]->{'style'} ne $tag))
            {
                print STDERR "Bug: raw or special: $tag but not on top of stack\n";
                print STDERR "line: $cline";
                dump_stack($text, $stack, $state);
                exit 1;
            }
	    
            # macro_regexp
            if ($cline =~ /^(.*?)\@end\s([a-zA-Z][\w-]*)/o and ($2 eq $tag))
            {
                $cline =~ s/^(.*?)(\@end\s$tag)//;
            # we add it even if 'ignored', it'll be discarded just below
            # with the @end
                add_prev ($text, $stack, $1);
                my $end = $2;
                my $style = pop @$stack;
                # if 'arg_expansion' and 'ignored' are both true text 
                # is ignored.
                add_prev ($text, $stack, $style->{'text'} . $end) unless ($state->{'ignored'});
                delete $state->{'raw'};
                next;
            }
            else
            {# we add it even if 'ignored', it'll be discarded when there is 
             # the @end
                 add_prev ($text, $stack, $cline);
                 last;
            }
        }

        # in a @verb{ .. } macro
        if (defined($state->{'verb'}))
        {
            #dump_stack($text, $stack, $state);
            my $char = quotemeta($state->{'verb'});
            #print STDERR "VERB $char\n";
            if ($cline =~ s/^(.*?)$char\}/\}/)
            {# we add it even if 'ignored', it'll be discarded when closing
                 add_prev($text, $stack, $1 . $state->{'verb'});
                 $stack->[-1]->{'text'} = $state->{'verb'} . $stack->[-1]->{'text'};
                 delete $state->{'verb'};
                 next;
            }
            else
            {# we add it even if 'ignored', it'll be discarded when closing
                 add_prev($text, $stack, $cline);
                 last;
            }
        }
        # In ignored region
        if ($state->{'ignored'})
        {
            #print STDERR "IGNORED(ifvalue($state->{'ifvalue_inside'})): $state->{'ignored'}\n";
            if ($cline =~ /^.*?\@end(\s+)([a-zA-Z]\w+)/)
            {
                if ($2 eq $state->{'ignored'})
                {
                    $cline =~ s/^(.*?\@end)(\s+)([a-zA-Z]\w+)//; 
                    my $end_ignore = $1.$2.$3;
                    close_ignored($state, $stack);
                    #dump_stack($text, $stack, $state);
                    # MACRO_ARG => keep ignored text
                    if ($state->{'arg_expansion'})
                    {# this may not be very usefull as it'll be remove later
                        add_prev ($text, $stack, $end_ignore);
                        next;
                    }
                    return if ($cline =~ /^\s*$/o);
                    next;
                }
            }
            add_prev ($text, $stack, $cline) if ($state->{'arg_expansion'});
            # we could theoretically continue for ignored commands other
            # than ifset or ifclear, however it isn't usefull.
            return unless ($state->{'ifvalue_inside'} and ($state->{'ignored'} eq $state->{'ifvalue'}));
        }

	
        # an @end tag
        # macro_regexp
        if ($cline =~ s/^([^{}@]*)\@end(\s+)([a-zA-Z][\w-]*)//)
        {
            my $leading_text = $1;
            my $space = $2;
            my $end_tag = $3;
            # when 'ignored' we don't open environments that aren't associated
            # with ignored regions, so we don't need to close them.
            next if ($state->{'ignored'});# ARG_EXPANSION
            add_prev($text, $stack, $leading_text);
            if (defined($state->{'text_macro_stack'})
               and @{$state->{'text_macro_stack'}}
               and ($end_tag eq $state->{'text_macro_stack'}->[-1]))
            {
                pop @{$state->{'text_macro_stack'}};
                # we keep menu and titlepage for the following pass
                if (($Texi2HTML::Config::texi_formats_map{$end_tag} eq 'normal') or ($region_lines{$end_tag}) or $state->{'arg_expansion'})
                {
                     add_prev($text, $stack, "\@end${space}$end_tag");
                }
                else
                {
                    #print STDERR "End $end_tag\n";
                    #dump_stack($text, $stack, $state);
                    return if ($cline =~ /^\s*$/);
                }
            }
            elsif ($Texi2HTML::Config::texi_formats_map{$end_tag})
            {
                line_error ("\@end $end_tag without corresponding element", $line_nr);
            }
            else # a format that is not handled during the first pass
            {# ARG_EXPANSION
                add_prev($text, $stack, "\@end${space}$end_tag");
            }
            next;
        }
        # macro_regexp
        elsif ($cline =~ s/^([^{}@]*)\@(["'~\@\}\{,\.!\?\s\*\-\^`=:\|\/\\])//o or $cline =~ s/^([^{}@]*)\@([a-zA-Z][\w-]*)//o)
        {# ARG_EXPANSION
            add_prev($text, $stack, $1) unless $state->{'ignored'};
            my $command = $2;
            # FIXME: if it is an alias, it is substituted below, in the
            # diverse add_prev and output of \@$command. Maybe it could be
            # kept and only substituted in the last passes?
            $command = $alias{$command} if (exists($alias{$command}));
	    #print STDERR "MACRO $command\n";
            # handle skipped @-commands
            $state->{'bye'} = 1 if ($command eq 'bye' and !$state->{'ignored'} and !$state->{'arg_expansion'});
            # 'ignored' and 'arg_expansion' are handled in misc_command_texi
            # these are the commands in which the @value and @macro
            # and @-commands in general should not be expanded
            if (defined($Texi2HTML::Config::misc_command{$command}) and
                 ($command eq 'c' or $command eq 'comment' or $command eq 'set' 
                   or $command eq 'clear' or $command eq 'bye' or $command eq 'alias'))
            {
                my $cmd_arg;
                ($cline, $cmd_arg) = misc_command_texi($cline, $command, $state,
                       $line_nr);
                add_prev ($text, $stack, "\@$command" . $cmd_arg) unless $state->{'ignored'};
            }
            elsif ($command eq 'setfilename' or $command eq 'documentencoding'
                      or $command eq 'definfoenclose' or $command eq 'include')
            { # special commands whose arguments will have @macro and
              # @value expanded, and that are processed in this pass
                if ($state->{'ignored'} or ($line_nr->{'file_name'} ne $Texi2HTML::THISDOC{'input_file_name'} and $command eq 'setfilename'))
                { # @setfilename is ignored in @include file as said in the manual
                    $cline = '';
                }
                elsif ($state->{'arg_expansion'})
                {
                    add_prev($text, $stack, "\@$command" . $cline);
                    return;
                }
                else
                {
                    $cline =~ s/^(\s+)//;
                    my $space = $1;
                    # not sure if it happpens at end of line, or with 
                    # special char following the @-command or only at end of file
                    $space = '' if (!defined($space));
                    if (!$state->{'line_command'})
                    { 
                        #print STDERR "LINE_COMMAND Start line_command $command, cline $cline";
                        $state->{'line_command'} = $command;
                        push @$stack, { 'line_command' => $command, 'text' => $space };
                    }
                    else
                    {
                        line_error ("\@$command already on a \@$state->{'line_command'} line", $line_nr);
                        #add_prev($text, $stack, "\@$command" . $space);
                        add_prev($text, $stack, $space);
                    }
                }
            }
            # pertusus: it seems that value substitution are performed after
            # macro argument expansions: if we have 
            # @set comma ,
            # and a call to a macro @macro {arg1 @value{comma} arg2}
            # the macro arg is arg1 , arg2 and the comma don't separate
            # args. Likewise it seems that the @value are not expanded
            # in macro definitions

            elsif ($command =~ /^r?macro$/)
            { # in 'arg_expansion' (ie within another macro call arguments)
              # the macro is parsed as usual, but isn't registered in 
              # end_macro.
                if ($cline =~ /^\s+(\w[\w-]*)\s*(.*)/)
                {
                    my $name = $1;
                    my $args_def = $2;
                    unless ($state->{'ignored'} or $state->{'arg_expansion'})
                    {
                         if (exists($macros->{$name}))
                         {
                             #line_warn ("macro `$name' already defined " . 
                             #    format_line_number($macros->{$name}->{'line_nr'}) . " redefined", $line_nr);
                             line_warn ("macro `$name' previously defined.", $line_nr);
                             line_warn ("here is the previous definition of `$name'", $macros->{$name}->{'line_nr'});
                         }
                    }
                    $state->{'macro_inside'} = 1;

                    next if ($state->{'ignored'});
                    my @args = ();
                    if ($args_def =~ /^\s*{\s*(.*?)\s*}\s*/)
                    {
                        @args = split(/\s*,\s*/ , $1)
                    }
                    # keep the context information of the definition
                    my $macro = { 'name' => $name };
                    $macro->{'line_nr'} = { 'file_name' => $line_nr->{'file_name'}, 
                         'line_nr' => $line_nr->{'line_nr'}, 'macro' => $line_nr->{'macro'} } if (defined($line_nr));
                    $macro->{'args'} = \@args;
                    $macro->{'header'} = "\@$command" .$cline;
                    my $arg_index = 0;
                    my $debug_msg = '';
                    foreach my $arg (@args)
                    { # when expanding macros, the argument index is retrieved
                      # with args_index
                        $macro->{'args_index'}->{$arg} = $arg_index;
                        $debug_msg .= "$arg($arg_index) ";
                        $arg_index++;
                    }
                    $macro->{'body'} = '';
                    $state->{'macro'} = $macro;
                    print STDERR "# macro def $name: $debug_msg\n"
                         if ($T2H_DEBUG & $DEBUG_MACROS);
                }
                else
                {# it means we have a macro without a name
                    line_error ("Macro definition without macro name $cline", $line_nr)
                        unless ($state->{'ignored'});
                }
                return 1;
            }
            elsif (defined($Texi2HTML::Config::texi_formats_map{$command}))
            {
                my $tag;
                ($cline, $tag) = do_text_macro($command, $cline, $state, $stack, $line_nr); 
                # if it is a raw formatting command or a menu command
                # we must keep it for later, unless we are in an 'ignored'.
                # if in 'arg_expansion' we keep everything.
                my $command_kept;
                if ((($state->{'raw'} or ($Texi2HTML::Config::texi_formats_map{$command} eq 'normal') or (exists($region_lines{$command}))) and !$state->{'ignored'}) or $state->{'arg_expansion'})
                {
                    add_prev($text, $stack, $tag);
                    $command_kept = 1;
                }
                #dump_stack ($text, $stack, $state);
                next if $command_kept;
                return if ($cline =~ /^\s*$/);
            }
            elsif ($command eq 'value')
            {
                if ($cline =~ s/^{($VARRE)}//)
                {
                    my $value = $1;
                    if ($state->{'arg_expansion'})
                    {
                        add_prev($text, $stack, "\@$command" .'{'. $value .'}');
                        next;
                    }
                    next if ($state->{'ignored'});
                    my $expansion = "No value for $value";
                    $expansion = $value{$value} if (defined($value{$value}));
                    $cline = $expansion . $cline;
                }
                else
                {
                    if ($state->{'arg_expansion'})
                    {
                        add_prev($text, $stack, "\@$command");
                        next;
                    }
                    next if ($state->{'ignored'});
                    line_error ("bad \@value macro", $line_nr);
                }
            }
            elsif ($command eq 'unmacro')
            { #FIXME with 'arg_expansion' should it be passed unmodified ?
                if ($state->{'ignored'})
                {
                    $cline =~ s/^\s+(\w+)//;
                }
                else
                {
                    delete $macros->{$1} if ($cline =~ s/^\s+(\w+)//);
                }
                return if ($cline =~ /^\s*$/);
                $cline =~ s/^\s*//;
            }
            elsif (exists($macros->{$command}))
            {# it must be before the handling of {, otherwise it is considered
             # to be regular texinfo @-command. Maybe it could be placed higher
             # if we want user defined macros to override texinfo @-commands

             # in 'ignored' we parse macro defined args anyway as it removes 
             # some text, but we don't expand the macro

                my $ref = $macros->{$command}->{'args'};
                my $args_number = $#$ref +1;
                # we remove any space/new line before the argument
                if ($cline =~ s/^\s*{\s*//)
                { # the macro has args
                    $state->{'macro_args'} = [ "" ];
                    $state->{'macro_name'} = $command;
                    $state->{'macro_depth'} = 1;
                }
                elsif (($args_number >= 2) or ($args_number <1))
                { # no brace -> no arg
                    #$cline = 
                    line_warn("\@$command defined with $args_number arguments should be invoked with {}", $line_nr);
                    expand_macro ($command, [], $cline, $line_nr, $state);
                    return;
                }
                else
                { # macro with one arg on the line
                    chomp $cline;
                    #$cline = 
                    expand_macro ($command, [$cline], "\n", $line_nr, $state);
                    return;
                }
            }
            elsif ($cline =~ s/^{//)
            {# we add nested commands in a stack. verb is also on the stack
             # but handled specifically.
             # we add it the comands even in 'ignored' as their result is 
             # discarded when the closing brace appear, or the ifset or 
             # iclear is closed.
                if ($command eq 'verb')
                {
                    if ($cline =~ /^$/)
                    {
                        line_error ("\@$command without associated character", $line_nr);
                    }
                    else
                    {
                        $cline =~ s/^(.)//;
                        $state->{'verb'} = $1;
                    }
                }
                if ($state->{'line_command'} and $command eq 'verb')
                { # have to close it now to catch if it is not 
                  # closed at te end of the line. In subsequent passes this
                  # is done in scan_line_separator.
                    my $result;
                    if (defined($state->{'verb'}))
                    {   
                        $result = '@verb{'.$state->{'verb'};
                        my $verb_char = quotemeta($state->{'verb'});
                        if ($cline =~ s/^(.*?${verb_char}\})//)
                        {
                            $result .= $1;
                        }
                        else
                        {
                            $cline =~ s/^(.*)//;
                            $result .= $1;
                        }
                        delete $state->{'verb'};
                    }
                    else
                    {
                        $result = '@verb{'
                    }
                    add_prev($text, $stack, $result) unless($state->{'ignored'});
                }
                else
                {
                    push (@$stack, { 'style' => $command, 'text' => '' });
                }
            }
            else
            {
                $cline = do_unknown(0, $command, $cline, $text, $stack, $state, $line_nr);
            }
            next;
        }
        #elsif(s/^([^{}@]*)\@(.)//o)
        elsif($cline =~ s/^([^{}@]*)\@([^\s\}\{\@]*)//o)
        {# ARG_EXPANSION
            # No need to warn here for @ followed by a character that
            # is not in any @-command and it is done later
            add_prev($text, $stack, $1) unless($state->{'ignored'});
            $cline = do_unknown(0, $2, $cline, $text, $stack, $state, $line_nr);
            next;
        }
        elsif ($cline =~ s/^([^{}]*)([{}])//o)
        {
         # in ignored section we cannot be sure that there is an @-command
         # already opened so we must discard the text.
         # ARG_EXPANSION
            add_prev($text, $stack, $1) unless($state->{'ignored'});
            if ($2 eq '{')
            {
              # this empty style is for a lone brace.
              # we add it even in 'ignored' as it is discarded when the closing
              # brace appear, or the ifset or iclear is closed.
                push @$stack, { 'style' => '', 'text' => '' };
            }
            else
            {
                if (@$stack)
                {
                    my $style = pop @$stack;
                    close_style_texi($style, $text, $stack, $state);
                    #print STDERR "MACRO end $style->{'style'} remaining: $cline";
                    next;
                }
                else
                {# ARG_EXPANSION
                    # we warn in the last pass that there is a } without open
                    add_prev ($text, $stack, '}') unless($state->{'ignored'});
                }
            }
        }
        else
        {# ARG_EXPANSION
            #print STDERR "END_LINE $cline";
            add_prev($text, $stack, $cline) unless($state->{'ignored'});
            if ($state->{'line_command'})
            {
               if (!scalar(@$stack))
               {
                   print STDERR "BUG: empty state for $state->{'line_command'}\n";
                   return;
                   delete $state->{'line_command'};
               }
               while (!defined($stack->[-1]->{'line_command'}))
               {
                  my $top = pop @$stack;
                  # defer this to later?
                  #line_error ("unclosed command in \@$state->{'line_command'}: $top->{'style'}");
                  add_prev($text, $stack, "\@$top->{'style'}".'{'.$top->{'text'}.'}');
               }
               my $command = pop @$stack;
               ###################### debug
               if (!defined($command) or !defined($command->{'text'}) or 
                 !defined($command->{'line_command'}) or ($command->{'line_command'} ne $state->{'line_command'}))
               {
                   msg_debug ("BUG: messed $state->{'line_command'} stack", $line_nr);
                   delete $state->{'line_command'};
                   return;
               }
               ###################### end debug
               else
               {
                   delete $state->{'line_command'};
                   my $macro = $command->{'line_command'};
                   # include are not kept
                   if ($macro eq 'include')
                   {
                    #if (s/^\s+([\/\w.+-]+)//o)
                       if ($command->{'text'} =~ s/^(\s+)(.+)//o)
                       {
                           my $file_name = $2;
                           # FIXME scan_line_separators
                           $file_name = trim_around_spaces($file_name);
                           $file_name = substitute_line($file_name, "\@$macro", {'code_style' => 1, 'remove_texi' => 1});
                           my $file = locate_include_file($file_name);
                           if (defined($file))
                           {
                               my ($line_nr_file, $input_spool_file) = open_file($file, $line_nr->{'macro'}, $state->{'files_stack'});
                               ($line_nr, $state->{'input_spool'}) = ($line_nr_file, $input_spool_file) if (defined($line_nr_file));
                               print STDERR "# including $file\n" if $T2H_VERBOSE;
                           }
                           else
                           {
                              line_error ("Can't find $file_name, skipping", $line_nr);
                           }
                       }
                       else
                       {
                           line_error ("Bad include line: $command->{'text'}", $line_nr);
                       }
                       return;
                   }
                   else
                   { # these are kept (setfilename, documentencoding, definfoenclose)
                       if ($macro eq 'setfilename' and $Texi2HTML::Config::USE_SETFILENAME)
                       {
                           if (defined(Texi2HTML::Config::get_conf ('setfilename')))
                           {
                               line_error ("\@$macro already set", $line_nr);
                               # the line is removed, because we don't want to reset 
                               # get_conf('setfilename') between passes, and we don't want
                               # the last one to be picked up
                               $cline = "\n";
                               next;
                           }
                       }
                       my $cmd_arg;
                       ($cline, $cmd_arg) = misc_command_texi($command->{'text'}, 
                         $macro, $state, $line_nr);
                       add_prev ($text, $stack, "\@$macro" . $cmd_arg);
                       next;
                   }
               }
            }
            last;
        }
    }
    return undef if ($state->{'ignored'});
    return 1;
} # end scan_texi

sub close_structure_command($$$$)
{
    my $cmd_ref = shift;
    my $state = shift;
    my $unclosed_commands = shift;
    my $line_nr = shift;
    my $result;
    
    if ($cmd_ref->{'style'} eq 'anchor')
    {
        my $anchor = $cmd_ref->{'text'};
        $anchor = normalise_node($anchor);
        if ($nodes{$anchor})
        {
            line_error ("Anchor `$anchor' previously defined ".format_line_number($nodes{$anchor}->{'line_nr'}), $line_nr);
            return '';
        }
        elsif ($anchor =~ /^\(.+\)/)
        {
            line_error ("Syntax for an external node used for `$anchor'", $line_nr);
            return '';
        }
        $document_anchor_num++;
        $nodes{$anchor} = { 'anchor' => 1, 'seen' => 1, 'texi' => $anchor, 'id' => 'ANC' . $document_anchor_num, 'line_nr' => $line_nr};
        push @{$state->{'place'}}, $nodes{$anchor};
    }
    elsif ($cmd_ref->{'style'} eq 'footnote')
    {
        if (Texi2HTML::Config::get_conf('footnotestyle') eq 'separate')
        {
            $state->{'heading_element'} = $state->{'footnote_heading_element'};
            $state->{'place'} = $state->{'footnote_place'};
        }
    }
    elsif ($cmd_ref->{'style'} eq 'caption' or $cmd_ref->{'style'}
       eq 'shortcaption' and $state->{'float'})
    {
        my @texi_lines = map {$_ = $_."\n"} split (/\n/, $cmd_ref->{'text'});
        $state->{'float'}->{$cmd_ref->{'style'} . "_texi"} = \@texi_lines;
    }
    if (($cmd_ref->{'style'} eq 'titlefont') and ($cmd_ref->{'text'} =~ /\S/))
    {
        $state->{'heading_element'}->{'titlefont'} = $cmd_ref->{'text'} unless ((exists($state->{'region'}) and ($state->{'region'} eq 'titlepage')) or defined($state->{'heading_element'}->{'titlefont'})) ;
    }
    if (defined($Texi2HTML::Config::command_handler{$cmd_ref->{'style'}}))
    {
        $result = init_special($cmd_ref->{'style'},$cmd_ref->{'text'});
        if ($unclosed_commands)
        {
            $result .= "\n"; # the end of line is eaten by init_special
            line_error("Closing specially handled \@-command $cmd_ref->{'style'}",$line_nr);
        }
    }
    elsif ($cmd_ref->{'style'})
    {
        $result = '@' . $cmd_ref->{'style'} . '{' . $cmd_ref->{'text'};
        $result .= '}' unless ($unclosed_commands);
    }
    else
    {
        $result = '{' . $cmd_ref->{'text'};
        # don't close { if we are closing stack as we are not
        # sure this is a licit { ... } construct.
        $result .= '}' unless ($unclosed_commands);
    }
    return $result;
}

sub end_format_structure($$$$$$)
{
    my $end_tag = shift;
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    my $remaining_on_line = shift;

    if (defined($state->{'text_macro_stack'})
       and @{$state->{'text_macro_stack'}}
       and ($end_tag eq $state->{'text_macro_stack'}->[-1]))
    {
        pop @{$state->{'text_macro_stack'}};
        if (exists($region_lines{$end_tag}))
        { # end a region_line macro, like documentdescription, copying
             print STDERR "Bug: end_tag $end_tag ne $state->{'region_lines'}->{'format'}\n"
                if ($end_tag ne $state->{'region_lines'}->{'format'});
             print STDERR "Bug: end_tag $end_tag ne $state->{'region'}\n"
                if ($end_tag ne $state->{'region'});
             $state->{'region_lines'}->{'number'}--;
             if ($state->{'region_lines'}->{'number'} == 0)
             {
                 close_region($state);
             }
             #dump_stack($text, $stack, $state);
        }
        if (($Texi2HTML::Config::texi_formats_map{$end_tag} eq 'normal') or $Texi2HTML::Config::region_formats_kept{$end_tag})
        {
             $state->{$end_tag}-- if ($Texi2HTML::Config::texi_formats_map{$end_tag} eq 'normal');
             add_prev($text, $stack, "\@end $end_tag");
        }
        else
        {
             #print STDERR "End $end_tag\n";
             #dump_stack($text, $stack, $state);
             return 1 if ($remaining_on_line =~ /^\s*$/);
        }
    }
    elsif ($Texi2HTML::Config::texi_formats_map{$end_tag})
    {
        line_error ("\@end $end_tag without corresponding element", $line_nr);
        #dump_stack($text, $stack, $state);
    }
    elsif ($end_tag eq 'detailmenu' or $end_tag eq 'direntry')
    {
        $state->{$end_tag}-- if $state->{$end_tag};
        add_prev($text, $stack, "\@end $end_tag");
    }
    else
    {
        if ($end_tag eq 'float' and $state->{'float'})
        {
            delete $state->{'float'};
        }
        elsif ($end_tag eq $state->{'table_stack'}->[-1])
        {
            enter_table_index_entry($text, $stack, $state, $line_nr);
            pop @{$state->{'table_stack'}};
        }
        #add end tag
        add_prev($text, $stack, "\@end $end_tag");
    }
    return 0;
}

sub parse_menu_entry($)
{
   my $menu_line = shift;
   my ($node, $name, $ending, $remaining);

   return ($node, $name, $ending, $remaining) unless $menu_line =~ s/^\*//;

   my ($before_colon, $separator);
   ($before_colon, $remaining, $separator) = scan_line_separators($menu_line, ':', 'menu entry');
   if (defined($before_colon) and defined($separator))
   {
      if ($remaining =~ s/^://)
      {
          $node = $before_colon;
          $ending = '::';
      }
      elsif ($remaining =~ /\S/)
      {
          my $after_colon;
          $ending = "";
          ($after_colon, $remaining, $separator) = scan_line_separators($remaining, '\t,\.', 'menu entry node');
          # this certainly corresponds with an error in the node.
          # this is considered not to be a menu entry.
          return (undef, $name, $ending, $remaining) if (!defined($after_colon));
          $node = $after_colon;

          while (1)
          {
              if (!defined($separator) or (defined($separator) and $separator ne '.') or (defined($separator) and (!defined($remaining) or $remaining =~ /^\s/)))
              {
                  last;
              }
              $node .= $separator;
              my $after_dot;
              ($after_dot, $remaining, $separator) = scan_line_separators($remaining, '\t,\.', 'menu entry node');
              $after_dot = '' if (!defined($after_dot));
              $node .= $after_dot;
          }
          $name = $before_colon;
          $ending = $separator if (defined($separator));
          # only spaces after the :, this is not a menu entry:
          $node = undef if ($node !~ /\S/);
      }
   }
   # remaining may be defined even if $node isn't.
   #print STDERR "\nLLLL $menu_line";
   #print STDERR " -->  node:$node, name:$name, ending:$ending -> $remaining";
   return ($node, $name, $ending, $remaining);
}

sub scan_structure($$$$;$)
{
    my $line = shift;
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;

    die "stack not an array ref"  unless (ref($stack) eq "ARRAY");
    my $cline = $line;
    #print STDERR "SCAN_STRUCTURE: $line";
    #dump_stack ($text, $stack, $state); 
    if (!$state->{'raw'} and (!exists($state->{'region_lines'})))
    { 
        #if (!$state->{'verb'} and $state->{'menu'} and $cline =~ /^\*\s+/o)
        if (!$state->{'verb'} and $state->{'menu'})
        {
        # new menu entry
            my ($node, $name, $ending, $remaining) = parse_menu_entry($cline);
            if (defined($node))
            {
                menu_entry_texi(normalise_node($node), $state, $line_nr);
            }
        }
    }

    while(1)
    {
        # scan structure
	#dump_stack($text, $stack, $state);
	#print STDERR "WHILE(s):$cline";

        # as texinfo 4.5
        # verbatim might begin at another position than beginning
        # of line, and end verbatim might too. To end a verbatim section
        # @end verbatim must have exactly one space between end and verbatim
        # things following end verbatim are not ignored.
        #
        # html might begin at another position than beginning
        # of line, but @end html must begin the line, and have
        # exactly one space. Things following end html are ignored.
        # tex and ignore works like html
        #
        # ifnothtml might begin at another position than beginning
        # of line, and @end  ifnothtml might too, there might be more
        # than one space between @end and ifnothtml but nothing more on 
        # the line.
        # @end itemize, @end ftable works like @end ifnothtml.
        # except that @item on the same line than @end vtable doesn't work
        # 
        # text right after the itemize before an item is displayed.
        # @item might be somewhere in a line. 
        # strangely @item on the same line than @end vtable doesn't work
        # there should be nothing else than a command following @itemize...
        #
        # see more examples in formatting directory

        if ($state->{'raw'}) 
        {
            my $tag = $state->{'raw'};
            ################# debug 
            if (! @$stack or ($stack->[-1]->{'style'} ne $tag))
            {
                print STDERR "Bug: raw or special: $tag but not on top of stack\n";
                print STDERR "line: $cline";
                dump_stack($text, $stack, $state);
                exit 1;
            }
            ################# end debug 
            if ($tag eq 'macro')
            {
                if ($cline =~ /^\s*\@macro\s+(\w[\w-]*)\s*(.*)/)
                {
                    $state->{$tag}++;
                }
            }
            # macro_regexp
            if ($cline =~ /^(.*?)\@end\s([a-zA-Z][\w-]*)/o and ($2 eq $tag))
            {
                $cline =~ s/^(.*?)(\@end\s$tag)//;
                add_prev ($text, $stack, $1);
                my $end_text = $2;
                if ($tag eq 'macro')
                {
                    $state->{$tag}--;
                    if ($state->{$tag})
                    {
                        add_prev ($text, $stack, $end_text);
                        next;
                    }
                }
                delete $state->{'raw'};
                my $style = pop @$stack;
                if (defined($Texi2HTML::Config::command_handler{$tag})) 
                { # replace the special region by what init_special give
                    if ($style->{'text'} !~ /^\s*$/)
                    {
                        add_prev ($text, $stack, init_special($style->{'style'}, $style->{'text'}));
                    }
                }
                else
                {
                    add_prev ($text, $stack, $style->{'text'} . "\@end $tag");
                }
                next;
            }
            else
            {
                add_prev ($text, $stack, $cline);
                return if (defined($Texi2HTML::Config::command_handler{$tag})); 
                last;
            }
        }
	
        if (defined($state->{'verb'}))
        {
            my $char = quotemeta($state->{'verb'});
            if ($cline =~ s/^(.*?)$char\}/\}/)
            {
                add_prev($text, $stack, $1 . $state->{'verb'});
                $stack->[-1]->{'text'} = $state->{'verb'} . $stack->[-1]->{'text'};
                delete $state->{'verb'};
                next;
            }
            else
            {
                add_prev($text, $stack, $cline);
                last;
            }
        }
	
        # macro_regexp
        if ($cline =~ s/^([^{}@]*)\@end\s+([a-zA-Z][\w-]*)//)
        {
            add_prev($text, $stack, $1);
            my $end_tag = $2;
            #print STDERR "END STRUCTURE $end_tag\n";
            return if (end_format_structure($end_tag, $text, $stack, $state, $line_nr, $cline));
            next;
        }
        # macro_regexp
        elsif ($cline =~ s/^([^{}@]*)\@(["'~\@\}\{,\.!\?\s\*\-\^`=:\|\/\\])//o or $cline =~ s/^([^{}@]*)\@([a-zA-Z][\w-]*)//o)
        {
            add_prev($text, $stack, $1);
            my $macro = $2;
            #print STDERR "MACRO $macro\n";
            $macro = $alias{$macro} if (exists($alias{$macro}));
            if (defined($Texi2HTML::Config::deprecated_commands{$macro}))
            {
                if ($Texi2HTML::Config::deprecated_commands{$macro} eq '')
                {
                   line_warn("\@$macro is obsolete.", $line_nr);
                }
                else
                {
                   line_warn("\@$macro is obsolete; $Texi2HTML::Config::deprecated_commands{$macro}", $line_nr);
                }
            }
            if (defined($Texi2HTML::Config::misc_command{$macro}))
            {
                my $line;
                ($cline, $line) = misc_command_structure($cline, $macro, $state, 
                      $line_nr);
                add_prev ($text, $stack, "\@$macro".$line); 
                next;
            }
            elsif ($macro eq 'printindex' and ($cline =~ /^\s+(\w+)/))
            {
                my $index_name = $1;
                if (!exists($index_names{$index_name}))
                {
                   line_warn ("Unknown index `$index_name' in \@printindex.", $line_nr);
                }
                my $associated_element;
                if ($state->{'current_element'} eq $element_before_anything)
                {
                   line_warn ("Printindex before document beginning: \@printindex $index_name", $line_nr);
                }
                else
                {
                # $element_index is the first element with index
                  $element_index = $state->{'current_element'} unless (defined($element_index));
                  $associated_element = $state->{'current_element'};
                }
                my $region = $state->{'region'};
                $region = 'document' if (!defined($region));
                # 'associated_element' is almost not used, the @printindex
                # is associated through a walk on the elements
                my $printindex = { 'associated_element' => $associated_element, 'name' => $index_name, 'region' => $region, 'command' => 'printindex' };
                # prepare association of the index to the element by 
                # putting it in the current place
                push @{$state->{'place'}}, $printindex;
                push @{$Texi2HTML::THISDOC{'indices'}->{$region}->{$index_name}}, $printindex;
                #print STDERR "PRINTINDEX add($printindex) region $region name $index_name, nr ".scalar(@{$Texi2HTML::THISDOC{'indices'}->{$region}->{$index_name}})."\n";
                add_prev ($text, $stack, "\@$macro" .  $cline);
                last;
            }
            elsif ($sec2level{$macro})
            {
                if ($cline =~ /^\s*(.*)$/)
                {
                    my $name = $1;
                    my $heading_ref = new_section_heading($macro, $name, $state, $line_nr);
                    #if ($state->{'place'} eq $no_element_associated_place)
                    if (exists($state->{'region_lines'}) and $state->{'region_lines'}->{'format'})
                    {
                        my $region = $state->{'region_lines'}->{'format'};
                        $state->{'region_lines'}->{'head_num'}++;
                        my $num = $state->{'region_lines'}->{'head_num'};
                        $heading_ref->{'id'} = "${target_prefix}${region}_HEAD$num";
                        $heading_ref->{'sec_num'} = "${region}_$num";
                        $heading_ref->{'region'} = $region;
                        $heading_ref->{'region_head_num'} = $num;
                    }
                    else
                    {
                        $document_head_num++;
                        $heading_ref->{'id'} = "HEAD$document_head_num";
                        $heading_ref->{'sec_num'} = $document_head_num;
                    }
                    # this is only used when there is a index entry after the 
                    # heading
                    $heading_ref->{'target'} = $heading_ref->{'id'};
                    $heading_ref->{'heading'} = 1;
                    $heading_ref->{'tag_level'} = $macro;
                    $heading_ref->{'number'} = '';

                    $state->{'heading_element'} = $heading_ref;
                    push @{$state->{'place'}}, $heading_ref;
                    $headings{$heading_ref->{'sec_num'}} = $heading_ref;
                }
                add_prev ($text, $stack, "\@$macro" .  $cline);
                last;
            }
            elsif (index_command_prefix($macro) ne '')
            { # if we are already in a (v|f)table the construct is quite 
              # wrong
              # FIXME should it be discarded?
                if ($state->{'item'})
                {
                   line_error("ignored \@$macro already in an \@$state->{'item'} entry", $line_nr);
                   next;
                }
                my $index_prefix = index_command_prefix($macro);
                enter_index_entry($index_prefix, $line_nr, $cline, $macro, $state);
                add_prev ($text, $stack, "\@$macro" .  $cline);
                last;
            }
            elsif (defined($Texi2HTML::Config::texi_formats_map{$macro}))
            {
                my $macro_kept; 
                #print STDERR "TEXT_MACRO: $macro\n";
                if ($Texi2HTML::Config::texi_formats_map{$macro} eq 'raw')
                {
                    $state->{'raw'} = $macro;
                    $state->{$macro}++ if ($macro eq 'macro');
                    #print STDERR "RAW\n";
                }
                elsif ($Texi2HTML::Config::texi_formats_map{$macro} eq 'normal')
                {
                    if ($macro eq 'menu')
                    {
                       delete ($state->{'prev_menu_node'});
                       if (!$state->{'node_ref'})
                       {
                          # FIXME make it line_error
                          line_warn ("\@menu seen before first \@node", $line_nr);
                          line_warn ("perhaps your \@top node should be wrapped in \@ifnottex rather than \@ifinfo?", $line_nr);
                       }
                    }
                    $state->{$macro}++;
                    push @{$state->{'text_macro_stack'}}, $macro;
                    #print STDERR "MENU (text_macro_stack: @{$state->{'text_macro_stack'}})\n";
                }
                elsif (exists($region_lines{$macro}))
                {
                    if (exists($state->{'region_lines'}) and ($state->{'region_lines'}->{'format'} ne $macro))
                    {
                        line_error("\@$macro not allowed within $state->{'region_lines'}->{'format'}", $line_nr);
                        next;
                    }
                    open_region ($macro, $state);
                    if ($Texi2HTML::Config::region_formats_kept{$macro})
                    {
                        add_prev($text, $stack, "\@$macro");
                        $macro_kept = 1;
                        $state->{'region_lines'}->{'first_line'} = 1;
                    }
                    push @{$state->{'text_macro_stack'}}, $macro;
                }
                # if it is a raw formatting command or a menu command
                # we must keep it for later
                if (($state->{'raw'} and (!defined($Texi2HTML::Config::command_handler{$macro}))) or ($Texi2HTML::Config::texi_formats_map{$macro} eq 'normal'))
                {
                    add_prev($text, $stack, "\@$macro");
                    $macro_kept = 1;
                }
                if ($state->{'raw'})
                {
                    push @$stack, { 'style' => $macro, 'text' => '' };
                }
                next if $macro_kept;
                #dump_stack ($text, $stack, $state);
                return if ($cline =~ /^\s*$/);
            }
            elsif ($macro eq 'detailmenu' or $macro eq 'direntry')
            {
                add_prev ($text, $stack, "\@$macro" .  $cline);
                $state->{$macro}++;
                last;
            }
            elsif ($macro eq 'float')
            { 
                my ($style_texi, $label_texi) = parse_line_arguments($cline, 2, "\@$macro", $line_nr);
                $style_texi = normalise_texi_space($style_texi);
                $label_texi = undef if (defined($label_texi) and ($label_texi =~ /^\s*$/));
                if (defined($label_texi))
                { # The float may be a target for refs if it has a label
                    my $error_with_label = 1;
                    $label_texi = normalise_node($label_texi);
                    if (exists($nodes{$label_texi}) and defined($nodes{$label_texi})
                         and $nodes{$label_texi}->{'seen'})
                    {
                        line_error ("Float label `$label_texi' previously defined ".format_line_number($nodes{$label_texi}->{'line_nr'}), $line_nr);
                    }
                    elsif ($label_texi =~ /^\(.+\)/)
                    {
                        line_error ("Syntax for an external node used for `$label_texi'", $line_nr);
                    }
                    else
                    {
                        $error_with_label = 0;
                        my $float = { };
                        if (exists($nodes{$label_texi}) and defined($nodes{$label_texi}))
                        { # float appeared in a menu
                            $float = $nodes{$label_texi};
                        }
                        else
                        {
                            $nodes{$label_texi} = $float;
                        }
                        $float->{'float'} = 1;
                        $float->{'tag'} = 'float';
                        $float->{'texi'} = $label_texi;
                        $float->{'seen'} = 1;
                        $float->{'id'} = $label_texi;
                        $float->{'target'} = $label_texi;
#print STDERR "FLOAT: $float $float->{'texi'}, place $state->{'place'}\n";
                        push @{$state->{'place'}}, $float;
                        $float->{'element'} = $state->{'current_element'};
                        $state->{'float'} = $float;
                        $float->{'style_texi'} = $style_texi;
                        $float->{'line_nr'} = $line_nr;
                        push @floats, $float;
                    }

                    if ($error_with_label)
                    {
                        while ($cline =~ /,/)
                        {
                            $cline =~ s/,.*$//;
                        }
                    }
                }
                add_prev($text, $stack, "\@$macro" . $cline);
                last;
            }
            elsif (defined($Texi2HTML::Config::def_map{$macro}))
            {
                # @ may protect end of line in @def. We reconstruct lines here.
                # in the texinfo manual is said that spaces after @ collapse 
                if ($cline =~ /(\@+)\s*$/)
                {
                    my $at_at_end_of_line = $1;
                    if ((length($at_at_end_of_line) % 2) == 1)
                    {
                        #print STDERR "Line continue $cline";
                        my $def_line = $cline;
                        $def_line =~ s/\@\s*$//;
                        chomp($def_line);
                        $state->{'in_deff_line'} = "\@$macro" .$def_line;
                        return;
                    }
                }
                #We must enter the index entries
                my ($prefix, $entry, $argument) = get_deff_index($macro, $cline, $line_nr,1);
                # use deffn instead of deffnx for @-command record 
                # associated with index entry
                my $idx_macro = $macro;
                $idx_macro =~ s/x$//;
                enter_index_entry($prefix, $line_nr, $entry, $idx_macro, $state) 
                      if ($prefix);
                $cline =~ s/(.*)//;
                add_prev($text, $stack, "\@$macro" . $1);
            }
            elsif ($macro =~ /^itemx?$/)
            {
                enter_table_index_entry($text, $stack, $state, $line_nr);
                if ($state->{'table_stack'}->[-1] =~ /^(v|f)?table$/)
                {
                    $state->{'item'} = $macro;
                    push @$stack, { 'format' => 'index_item', 'text' => '', 'command' => $macro };
                }
                else
                {
                   add_prev($text, $stack, "\@$macro");
                }
            }
            elsif ($format_type{$macro} and ($format_type{$macro} eq 'table' or $format_type{$macro} eq 'list' or $macro eq 'multitable'))
            { # We must enter the index entries of (v|f)table thus we track
              # in which table we are
                push @{$state->{'table_stack'}}, $macro;
                add_prev($text, $stack, "\@$macro");
            }
            elsif ($cline =~ s/^{//)
            {
                if ($macro eq 'verb')
                {
                    if ($cline =~ /^$/)
                    {
                        # We already warned in pass texi
                    }
                    else
                    {
                        $cline =~ s/^(.)//;
                        $state->{'verb'} = $1;
                    }
                }
                elsif ($macro eq 'footnote' and (Texi2HTML::Config::get_conf('footnotestyle') eq 'separate'))
                {
                    $state->{'footnote_heading_element'} = $state->{'heading_element'};
                    $state->{'footnote_place'} = $state->{'place'};
                    $state->{'heading_element'} = $footnote_element;
                    $state->{'place'} = $footnote_element->{'place'};
                }
                push (@$stack, { 'style' => $macro, 'text' => '' });
            }
            else
            {
                $cline = do_unknown (1, $macro, $cline, $text, $stack, $state, $line_nr);
            }
            next;
        }
        #elsif($cline =~ s/^([^{}@]*)\@(.)//o)
        elsif($cline =~ s/^([^{}@]*)\@([^\s\}\{\@]*)//o)
        {
            add_prev($text, $stack, $1);
            $cline = do_unknown (1, $2, $cline, $text, $stack, $state, $line_nr);
            next;
        }
        elsif ($cline =~ s/^([^{}]*)([{}])//o)
        {
            add_prev($text, $stack, $1);
            if ($2 eq '{')
            {
                push @$stack, { 'style' => '', 'text' => '' };
            }
            else
            {
                if (@$stack)
                {
                    my $style = pop @$stack;
                    my $result;
                    add_prev ($text, $stack, 
                        close_structure_command($style, $state, 0, $line_nr));
                    next;
                }
                else
                {
                    # We warn in the last pass
                    add_prev ($text, $stack, '}');
                }
            }
        }
        else
        {
            add_prev($text, $stack, $cline);
            # in case of user mistake, with an @-command not closed on an @item line
            close_stack_structure($text, $stack, $state, $line_nr, 1) if ($state->{'item'});
            enter_table_index_entry($text, $stack, $state, $line_nr);
            #print STDERR "END_LINE(s) $cline";
            #dump_stack($text, $stack, $state);
            last;
        }
    }
    return 1;
} # end scan_structure

sub check_bad_end_argument ($$$)
{
  my $command = shift;
  my $line = shift;
  my $line_nr = shift;

  if ($line =~ /^(\S+)/)
  {
    my $symbols = $1;
    line_error ("Bad argument `${command}${symbols}' to `\@end', using `${command}'.", $line_nr);
  }
}

sub close_style_command($$$$$;$)
{
  my $text = shift;
  my $stack = shift;
  my $state = shift;
  my $line_nr = shift;
  my $line = shift;
  # not the end of the style, but the paragraph the style is in is closed
  my $no_close = shift;

  my $style = pop @$stack;
  my $command = $style->{'style'};
  my $result;
  if (!defined($command))
  {
     print STDERR "Bug: empty style in pass_text\n";
     return ($result, $command);
  }
  if (ref($::style_map_ref->{$command}) eq 'HASH')
  {
    push (@{$style->{'args'}}, $style->{'text'});
    $style->{'fulltext'} .= $style->{'text'};
    if (!defined($style->{'arg_nr'}))
    {
       line_warn("Bug: undefined 'arg_nr' for $command", $line_nr);
    }
    #print STDERR "DEBUG $command ($style->{'arg_nr'})\n";
    #my $number = 0;
    #foreach my $arg(@{$style->{'args'}})
    #{
    #  print STDERR "  $number: $arg\n";
    #     $number++;
    #}
    #print STDERR "END DEBUG\n";
    $style->{'text'} = $style->{'fulltext'};
    $state->{'keep_texi'} = 0 if (
     ($::style_map_ref->{$command}->{'args'}->[$style->{'arg_nr'}] eq 'keep')
    and ($state->{'keep_nr'} == 1));
  }
  if ($no_paragraph_macro{$command})
  {
     $state->{'no_paragraph'}--;
     pop @{$state->{'no_paragraph_stack'}};
  }
  if ($::style_map_ref->{$command} and (defined($style_type{$command})) and ((!$no_close and ($style_type{$command} eq 'style')) or ($style_type{$command} eq 'accent')))
  {
    my $style_command = pop @{$state->{'command_stack'}};
    if ($style_command ne $command)
    {
      #line_warn ("Bug: $style_command on 'command_stack', not $command", $line_nr);
      # This can be a bug in case of bad nesting, see bad_style_nesting.texi
      line_warn("Bad nesting of \@$style_command and \@$command", $line_nr);
      push @{$state->{'command_stack'}}, $style_command;
    ############################ debug
      if ($T2H_DEBUG)
      {
        push @$stack, $style;
        print STDERR "Stacks before pop top:\n";
        dump_stack($text, $stack, $state);
        pop @$stack;
    ############################ end debug
      }
    }
  }
  if ($state->{'keep_texi'})
  { # don't expand @-commands in anchor, refs...
    close_arg ($command, $style->{'arg_nr'}, $state);
    $result = '@' . $command . '{' . $style->{'text'} . '}';
  }
  elsif ($::things_map_ref->{$command})
  {
    $result = do_thing_command ($command, $style->{'text'}, $state, $line_nr);
  }
  else
  {
    $result = do_style_command($command, $style->{'text'}, $state, $style->{'args'}, $line_nr, $style->{'no_open'}, $no_close, $style->{'keep_line_nr'});
    if ($state->{'code_style'} < 0)
    {
      line_error ("Bug: negative code_style: $state->{'code_style'}, line:$line", $line_nr);
    }
    if ($state->{'math_style'} < 0)
    {
      line_error ("Bug: negative math_style: $state->{'math_style'}, line:$line", $line_nr);
    }
  }
  return ($result, $command);
}

sub top_stack_is_menu($)
{
   my $stack = shift;
   my $top_stack = top_stack($stack, 1);
   return 0 if (!$format_type{$top_stack->{'format'}} or $format_type{$top_stack->{'format'}} ne 'menu');
   return 1;
}

sub scan_line($$$$;$)
{
    my $original_line = shift;
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;

    die "stack not an array ref"  unless (ref($stack) eq "ARRAY");
    my $cline = $original_line;
    #msg_debug("SCAN_LINE (@{$state->{'command_stack'}}): $original_line", $line_nr);
    #dump_stack($text, $stack,  $state );
    my $new_menu_entry; # true if there is a new menu entry
#    my $menu_description_in_format; # true if we are in a menu description 
#                                # but in another format section (@table....)

    # this can happen currently with quotations
    if (defined($state->{'prepend_text'}))
    {
        $cline = $state->{'prepend_text'} . $cline;
        $state->{'prepend_text'} = undef;
        delete $state->{'prepend_text'};
    }

    if (!$state->{'raw'} and !$state->{'verb'} and ($state->{'menu'} or $state->{'direntry'}))
    { # new menu entry
        my ($node, $name, $ending, $remaining) = parse_menu_entry($cline);
        if (defined($node))
        {
            $cline = $remaining;
            print STDERR "# Potential menu entry: $node\n" if ($T2H_DEBUG & $DEBUG_MENU);
            $new_menu_entry = 1;
            my $menu_entry = { 'name' => $name, 'node' => $node, 'ending' => $ending };
            # in SIMPLE_MENU case we don't begin a description, description is 
            # just some normal (preformatted) text
            if ($Texi2HTML::Config::SIMPLE_MENU)
            {
                add_prev ($text, $stack, do_menu_link($state, $line_nr, $menu_entry));
                #dump_stack($text, $stack, $state);
            }
            else
            {
                # close description and comment, if they are opened.
                if (!close_menu_comment($text, $stack, $state, "new menu entry", $line_nr) 
                  and !close_menu_description($text, $stack, $state, "new menu entry", $line_nr)
                  and $state->{'preformatted'})
                {
                    close_paragraph($text, $stack, $state, "new menu entry", $line_nr);
                }
                print STDERR "# New menu entry: $node\n" if ($T2H_DEBUG & $DEBUG_MENU);
                my $fusionned_description = 0;
                # fusionned looks better in preformatted. But some formats
                # want to always distinguish link and description 
                if ($Texi2HTML::Config::SEPARATE_DESCRIPTION or !$state->{'preformatted'})
                {
                    add_prev ($text, $stack, do_menu_link($state, $line_nr, $menu_entry));
                }
                else
                {
                    $fusionned_description = 1;
                }
                push @$stack, {'format' => 'menu_description', 'text' => '', 'menu_entry' => $menu_entry, 'fusionned_description' => $fusionned_description};
                $state->{'code_style'}++ if ($Texi2HTML::Config::format_code_style{'menu_description'});
                if ($fusionned_description)
                {
                    begin_paragraph($stack, $state) if $state->{'preformatted'};
                    add_prev ($text, $stack, do_menu_link($state, $line_nr, $menu_entry));
                }
             }
        }
        # we may be in a menu entry description, we close it 
        # if there is an empty line, so the last arg is $cline
         if (!$new_menu_entry and close_menu_description($text, $stack, $state, "end menu description", $line_nr, $cline))
         {
            if ($state->{'preformatted'})
            {
                begin_paragraph($stack, $state);
            }
            else
            {
               # only start a menu_comment if right in menu and not in 
               # an en format below a menu because if not right
               # in a menu we have no way to distinguish a menu_comment
               # and some normal text in the format.
               # also it is not started in preformatted environment
               begin_format($text, $stack, $state, 'menu_comment', $cline, $line_nr) if ($stack->[-1]->{'format'} and $format_type{$stack->[-1]->{'format'}} and $format_type{$stack->[-1]->{'format'}} eq 'menu');
            }
        }
    }

    unless ($state->{'raw'} or $state->{'verb'} or $state->{'keep_texi'})
    {
    # first the line commands are taken into account
        my $next_command = next_tag($cline);
        if (defined($next_command) and defined($Texi2HTML::Config::line_command_map{$next_command}))
        {
            close_paragraph($text, $stack, $state, "\@$next_command", $line_nr, 1) if (stop_paragraph_command($next_command));
            my $arg_texi = $cline;
            $arg_texi =~ s/^\s*\@$next_command\s*//;
            $arg_texi = trim_comment_spaces ($arg_texi, "\@$next_command", $line_nr);
            my $arg_line = substitute_line($arg_texi, "\@$next_command", duplicate_formatting_state($state));
            add_prev ($text, $stack, &$Texi2HTML::Config::line_command($next_command, $arg_line, $arg_texi, $state));
            return '';
        }
        elsif (defined($next_command) and ($next_command eq 'contents') or ($next_command eq 'summarycontents') or ($next_command eq 'shortcontents'))
        {
            my $element_tag = $next_command;
            $element_tag = 'shortcontents' if ($element_tag ne 'contents');
            # at that point the content_element is defined for sure since
            # we already saw the tag
            if ($Texi2HTML::Config::INLINE_CONTENTS and !Texi2HTML::Config::get_conf('set' . $element_tag . 'aftertitlepage'))
            {
                my $content_element = shift (@{$all_content_elements{$element_tag}});
                my $toc_lines = &$Texi2HTML::Config::inline_contents($Texi2HTML::THISDOC{'FH'}, $element_tag, $content_element, \@sections_list);
                add_prev ($text, $stack, join('',@$toc_lines)) if (defined($toc_lines));
            }
            return '' unless (exists($Texi2HTML::Config::misc_command{$next_command}) and $Texi2HTML::Config::misc_command{$next_command}->{'keep'});
        }

    # The commands to ignore are ignored now in case after ignoring them
    # there is an empty line, to be able to stop the paragraph
        #my $leading_spaces = '';
        
        while (1)
        {
            my $next_tag = next_tag($cline);
            close_paragraph($text, $stack, $state, "\@$next_tag", $line_nr, 1) if (stop_paragraph_command($next_tag));
            if (defined($next_tag) and defined($Texi2HTML::Config::misc_command{$next_tag}) and !$Texi2HTML::Config::misc_command{$next_tag}->{'keep'})
            {
                $cline =~ s/^(\s*)\@$next_tag//;
                #$leading_spaces .= $1;
                add_prev ($text, $stack, do_text($1, $state));
                my $result;
                ($cline, $result) = misc_command_text($cline, $next_tag, $stack, $state, $text, $line_nr);
                add_prev($text, $stack, $result) if (defined($result));
            }
            else
            {
                last;
            }
        }
        #add_prev ($text, $stack, $leading_spaces);
        return '' if (!defined($cline) or $cline eq '');
    }
    my $top_stack = top_stack($stack);
    if (($top_stack->{'format'} and $top_stack->{'format'} eq 'menu_description') or $state->{'raw'} or $state->{'preformatted'}  or $state->{'no_paragraph'} or $state->{'keep_texi'} or $state->{'remove_texi'})
    { # empty lines are left unmodified in these contexts.
      # it is also possible to be in preformatted within a menu_description
        if ($cline =~ /^\s*$/)
        {
            if ($state->{'raw'})
            {
                print STDERR "#within raw $state->{'raw'}(empty line):$cline" if ($T2H_DEBUG & $DEBUG_FORMATS);
                add_prev($text, $stack, $cline);
            }
            else
            {
                add_prev($text, $stack, do_text($cline,$state));
            }
            return;
        }
    }
    else
    {
        if ($cline =~ /^\s*$/)
        {
            if ($state->{'paragraph_context'})
            { # An empty line ends a paragraph
                close_paragraph($text, $stack, $state, "paragraph end", $line_nr);
            }
            add_prev($text, $stack, &$Texi2HTML::Config::empty_line($cline,$state));
            return 1;
        }
        else
        {
            if (!no_paragraph($state,$cline))
            { # open a paragraph, unless the line begins with a macro that
              # shouldn't trigger a paragraph opening
                begin_paragraph($stack, $state);
            }
        }
    }
    # we flag specially deff_item and table line that contain only 
    # inter_item_command, which typically is be @c, @comment, @*index, such
    # that the formatter can treat those specifically.
    my $top_format = top_stack($stack,2);
    if ($top_format->{'only_inter_commands'} and !$state->{'keep_texi'})
    {
        my $real_format = $top_format->{'format_ref'}->{'format'};
        my $next_tag = next_tag($cline);
        $next_tag = '' if (!defined($next_tag));
        my $next_end_tag = next_end_tag($cline);
        $next_end_tag = '' if (!defined($next_end_tag));
        #msg_debug("$top_format->{'format'} $next_tag, end $next_end_tag :::$cline");
        delete $top_format->{'only_inter_commands'} unless
         (
          $Texi2HTML::Config::inter_item_commands{$next_tag} or 
          (index_command_prefix($next_tag) ne '' and $Texi2HTML::Config::inter_item_commands{'cindex'}) or
          ($top_format->{'format'} eq 'deff_item' and "${real_format}x" eq $next_tag) or
          ($top_format->{'format'} ne 'deff_item' and $next_tag =~ /^itemx?$/) or
          ( $next_end_tag eq $real_format )
         );
          #print STDERR "STILL $top_format->{'only_inter_commands'}\n" if ($top_format->{'only_inter_commands'});
    }

    while(1)
    {
        # scan_line
        #line_warn("Dump stack in scan_line", $line_nr);
        #dump_stack($text, $stack, $state);
        #print STDERR "WHILE(l): $cline|";
        # we're in a raw format (html, tex if !L2H, verbatim)
        if (defined($state->{'raw'})) 
        {
            (dump_stack($text, $stack, $state), die "Bug for raw ($state->{'raw'})") if (! @$stack or ! ($stack->[-1]->{'style'} eq $state->{'raw'}));
            if ($state->{'raw'} eq 'macro')
            {
                if ($cline =~ /^\s*\@macro\s+(\w[\w-]*)\s*(.*)/)
                {
                    $state->{$state->{'raw'}}++;
                }
            }
            # macro_regexp
            if ($cline =~ /^(.*?)\@end\s([a-zA-Z][\w-]*)/o and ($2 eq $state->{'raw'}))
            # don't protect html, it is done by Texi2HTML::Config::raw if needed
            {
                $cline =~ s/^(.*?)(\@end\s$state->{'raw'})//;
                my $remaining = $1;
                my $end_text = $2;
                if ($state->{'raw'} eq 'macro')
                {
                    $state->{$state->{'raw'}}--;
                    if ($state->{$state->{'raw'}})
                    {
                        add_prev ($text, $stack, $remaining.$end_text);
                        last;
                    }
                }
                check_bad_end_argument ($state->{'raw'}, $cline, $line_nr);
                add_prev ($text, $stack, $remaining);
                my $style = pop @$stack;
                if ($style->{'text'} !~ /^\s*$/)
                {
                    if ($state->{'keep_texi'})
                    {
                        add_prev ($text, $stack, $style->{'text'} . "\@end $state->{'raw'}");
                    }
                    elsif ($state->{'remove_texi'})
                    {
                        add_prev ($text, $stack, &$Texi2HTML::Config::raw_no_texi($style->{'style'}, $style->{'text'}));
                    }
                    else
                    { 
                        add_prev($text, $stack, &$Texi2HTML::Config::raw($style->{'style'}, $style->{'text'}, $line_nr));
                    }
                }
                if (!$state->{'keep_texi'} and !$state->{'remove_texi'})
                {
                    # reopen preformatted if it was interrupted by the raw format
                    # if raw format is html the preformatted wasn't interrupted
                    begin_paragraph($stack, $state) if ($state->{'preformatted'} and (!$Texi2HTML::Config::format_in_paragraph{$state->{'raw'}})); 
                    delete $state->{'raw'};
                    return if ($cline =~ /^\s*$/);
                }
                delete $state->{'raw'};
                return if (($cline =~ /^\s*$/) and $state->{'remove_texi'});
                next;
            }
            else
            {
                print STDERR "#within raw $state->{'raw'}:$cline" if ($T2H_DEBUG & $DEBUG_FORMATS);
                add_prev ($text, $stack, $cline);
                last;
            }
        }

        # we are within a @verb
        if (defined($state->{'verb'}))
        {
            my $char = quotemeta($state->{'verb'});
            if ($cline =~ s/^(.*?)$char\}/\}/)
            {
                 if ($state->{'keep_texi'})
                 {
                     add_prev($text, $stack, $1 . $state->{'verb'});
                     $stack->[-1]->{'text'} = $state->{'verb'} . $stack->[-1]->{'text'};
                 }
                 else
                 {
                     add_prev($text, $stack, do_text($1, $state));
                 }
                 delete $state->{'verb'};
                 next;
            }
            else
            {
                 add_prev($text, $stack, $cline);
                 last;
            }
        }

        # We handle now the end tags 
        # macro_regexp
        if ($cline =~ s/^([^{}@]*)\@end\s+([a-zA-Z][\w-]*)//)
        {
            my $end_tag = $2;
            my $prev_text = $1;
            if ($state->{'keep_texi'})
            {
                add_prev($text, $stack, $prev_text . "\@end $end_tag");
                next;
            }
            elsif ($state->{'remove_texi'})
            {
                add_prev($text, $stack, $prev_text);
                next;
            }

            add_prev($text, $stack, do_text($prev_text, $state));
	    #print STDERR "END_MACRO $end_tag\n";
	    #dump_stack ($text, $stack, $state);

            # First we test if the stack is not empty.
            # Then we test if the end tag is a format tag.
            # We then close paragraphs and preformatted at top of the stack.
            # We handle the end tag (even when it was not the tag which appears
            # on the top of the stack; in that case we close anything 
            # until that element)
            my $top_stack = top_stack($stack);
            if (!$top_stack)
            {
                line_error ("\@end $end_tag without corresponding opening", $line_nr);
                add_prev($text, $stack, "\@end $end_tag");
                next;
            }

            if (!$format_type{$end_tag})
            {
                line_warn ("Unknown \@end $end_tag", $line_nr);
                add_prev($text, $stack, "\@end $end_tag");
                next;
            }
            check_bad_end_argument ($end_tag, $cline, $line_nr);
            if (!close_menu_description($text, $stack, $state, "\@end $end_tag", $line_nr))
            {
               close_paragraph($text, $stack, $state, "\@end $end_tag", $line_nr); 
            }

            $top_stack = top_stack($stack);
            if (!$top_stack or (!defined($top_stack->{'format'})))
            {
                line_error ("\@end $end_tag without corresponding opening element", $line_nr);
                add_prev($text, $stack, "\@end $end_tag");
                dump_stack ($text, $stack, $state) if ($T2H_DEBUG);
                next;
            }
            # Warn if the format on top of stack is not compatible with the 
            # end tag, and find the end tag.
            unless (
                ($top_stack->{'format'} eq $end_tag)
                or
                (
                 $format_type{$end_tag} eq 'menu' and
                  $top_stack->{'format'} eq 'menu_comment'
                ) or
                (
                 $end_tag eq 'multitable' and $top_stack->{'format'} eq 'cell'
                ) or
                (
                 $format_type{$end_tag} eq 'list' and $top_stack->{'format'} eq 'item'
                ) or
                (
                  $format_type{$end_tag} eq 'table'
                  and
                  ($top_stack->{'format'} eq 'term' or $top_stack->{'format'} eq 'line')
                ) or
                (
                 defined($Texi2HTML::Config::def_map{$end_tag}) and
                 $top_stack->{'format'} eq 'deff_item'
                )
               )
            {
                # this is not the right format. We try to close other
                # formats to find the format we are searching for.
                # First we close paragraphs, as with a wrong $end_format
                # they may not be closed properly.

                #print STDERR "  MISMATCH got $top_stack->{'format'} waited \@end $end_tag($top_stack->{'format'})\n";
                #dump_stack ($text, $stack, $state);
                close_paragraph($text, $stack, $state, "\@end $end_tag", $line_nr);
                $top_stack = top_stack($stack);
                if (!$top_stack or (!defined($top_stack->{'format'})))
                {
                    line_error ("\@end $end_tag without corresponding opening element", $line_nr);
                    add_prev($text, $stack, "\@end $end_tag");
                    # at that point the dump_stack is not very useful, since
                    # close_paragraph above may hide interesting info
                    dump_stack ($text, $stack, $state) if ($T2H_DEBUG);
                    next;
                }
                my $waited_format = $top_stack->{'format'};
                $waited_format = $fake_format{$top_stack->{'format'}} if ($format_type{$top_stack->{'format'}} eq 'fake');
                line_error ("`\@end'  expected `$waited_format', but saw `$end_tag'", $line_nr);
                #dump_stack ($text, $stack, $state);
                close_stack($text, $stack, $state, $line_nr, $end_tag);
                # FIXME this is too complex
                # an empty preformatted may appear when closing things as
                # when closed, formats reopen the preformatted environment
                # in case there is some text following, but we know it isn't 
                # the case here, thus we can close paragraphs.
                close_paragraph($text, $stack, $state, "\@end $end_tag");
                my $new_top_stack = top_stack($stack);
                next unless ($new_top_stack and defined($new_top_stack->{'format'}) and (($new_top_stack->{'format'} eq $end_tag) 
                   or (($format_type{$new_top_stack->{'format'}} eq 'fake') and ($fake_format{$new_top_stack->{'format'}} eq $format_type{$end_tag}))));
            }
            # We should now be able to handle the format
            if (defined($format_type{$end_tag}))
            {# remove the space or new line following the @end command
                $cline =~ s/\s//;
                if (end_format($text, $stack, $state, $end_tag, $line_nr))
                { # if end_format is false, paragraph is already begun
                    begin_paragraph_after_command($state,$stack,$end_tag,$cline);
                }
            }
            next;
        }
        # This is a macro
	#elsif (s/^([^{}@]*)\@([a-zA-Z]\w*|["'~\@\}\{,\.!\?\s\*\-\^`=:\/])//o)
        # macro_regexp
        elsif ($cline =~ s/^([^{},@]*)\@(["'~\@\}\{,\.!\?\s\*\-\^`=:\|\/\\])//o or $cline =~ s/^([^{}@,]*)\@([a-zA-Z][\w-]*)//o)
        {
            my $before_macro = $1;
            my $macro = $2;
            $macro = $alias{$macro} if (exists($alias{$macro}));
            my $punct;
            if (!$state->{'keep_texi'} and $macro eq ':' and $before_macro =~ /(.)$/ and $Texi2HTML::Config::colon_command_punctuation_characters{$1})
            {
                $before_macro =~ s/(.)$//;
                $punct = $1;
            }
            add_prev($text, $stack, do_text($before_macro, $state));
            add_prev($text, $stack, &$Texi2HTML::Config::colon_command($punct)) if (defined($punct));
	    #print STDERR "MACRO $macro\n";
	    #print STDERR "LINE $cline";
	    #dump_stack ($text, $stack, $state);

            close_paragraph($text, $stack, $state, "\@$macro", $line_nr, 1) if (stop_paragraph_command($macro) and !$state->{'keep_texi'});

            if ($macro eq 'listoffloats' or $macro eq 'printindex')
            {
                if ($state->{'keep_texi'})
                {
                    if ($cline =~ s/(.*)//o)
                    {
                        add_prev($text, $stack, "\@$macro" . $1);
                    }
                    next;
                }
                close_paragraph($text, $stack, $state, "\@$macro", $line_nr);
                return undef if ($state->{'remove_texi'});
                if ($macro eq 'listoffloats')
                { 
                    # remove possible comments 
                    my $arg = normalise_texi_space(trim_comment_spaces ($cline, "\@$macro", $line_nr));

                    my $style_id = cross_manual_line($arg);
                    my $style = substitute_line (&$Texi2HTML::Config::listoffloats_style($arg), "\@listoffloats type", undef, $line_nr);
                    my $style_no_texi = remove_texi (&$Texi2HTML::Config::listoffloats_style($arg));
                    if (exists ($floats{$style_id}))
                    {
                         my @listoffloats_entries = ();
                         foreach my $float (@{$floats{$style_id}->{'floats'}})
                         {
                              my $float_style = substitute_line(&$Texi2HTML::Config::listoffloats_float_style($arg, $float), "\@listoffloats \@float type");
                              my ($caption_lines, $caption_or_shortcaption) = &$Texi2HTML::Config::listoffloats_caption($float);
                              # we set 'multiple_pass', 'region' and 
                              # 'region_pass'such that index entries
                              # and anchors are not handled one more time;
                              # the caption has already been formatted, 
                              # and these have been handled at the right place
                              # FIXME footnotes?
                              my $caption = '';
                              $caption = substitute_text(prepare_state_multiple_pass($macro, $state), undef, "\@$caption_or_shortcaption in listoffloats", @$caption_lines) if (defined($caption_or_shortcaption));
                              push @listoffloats_entries, &$Texi2HTML::Config::listoffloats_entry($arg, $float, $float_style, $caption, href($float, $state->{'element'}->{'file'}, $line_nr));
                         }
                         add_prev($text, $stack, &$Texi2HTML::Config::listoffloats($arg, $style, \@listoffloats_entries));
                    }
                    else
                    {
                         line_warn ("Requested float type `$arg' not previously used", $line_nr); 
                    }
                }
                elsif ($macro eq 'printindex' and $cline =~ s/\s+(\w+)\s*//)
                {
                    my $index_name = $1;
                    my $region = $state->{'region'};
                    $region = 'document' if (!defined($region));

                    if (!defined($Texi2HTML::THISDOC{'indices'}->{$region}))
                    {
                      msg_debug ("\@printindex $index_name THISDOC{'indices'}->{$region} not defined", $line_nr);
                    }
                    elsif (!defined($Texi2HTML::THISDOC{'indices'}->{$region}->{$index_name}))
                    {
                      msg_debug ("\@printindex $index_name THISDOC{'indices'}->{$region}->{$index_name} not defined", $line_nr);
                    }

                    if (!defined($Texi2HTML::THISDOC{'indices_numbers'}->{$region}->{$index_name}))
                    {
                      $Texi2HTML::THISDOC{'indices_numbers'}->{$region}->{$index_name} = -1;
                    }
                    $Texi2HTML::THISDOC{'indices_numbers'}->{$region}->{$index_name}++;
                    my $printindex = $Texi2HTML::THISDOC{'indices'}->{$region}->{$index_name}->[$Texi2HTML::THISDOC{'indices_numbers'}->{$region}->{$index_name}];
                    if (!defined($printindex))
                    {
                      # this printindex hasn't been seen in the previous pass.
                      #print STDERR "Index $index_name not in sync, number $Texi2HTML::THISDOC{'indices_numbers'}->{$index_name} not defined\n";
                      line_warn("\@printindex $index_name expanded more than once may lead to wrong references", $line_nr);
                      $printindex = $Texi2HTML::THISDOC{'indices'}->{$region}->{$index_name}->[-1];
                    }
                    elsif ($printindex->{'name'} ne $index_name)
                    {
                      print STDERR "BUG: THISDOC{'indices'} $printindex->{'name'} ne $index_name\n";
                    }
                    #print STDERR "PRINTINDEX use($printindex) region $region, name $index_name number $Texi2HTML::THISDOC{'indices_numbers'}->{$region}->{$index_name}\n";
                    add_prev($text, $stack, &$Texi2HTML::Config::printindex($index_name, $printindex));
                }
                else
                {
                    line_error ("Bad \@$macro line: $cline", $line_nr);
                }
                begin_paragraph ($stack, $state) if ($state->{'preformatted'});
                return undef;
            }
            if (defined($Texi2HTML::Config::misc_command{$macro}))
            {
                # Handle the misc command
                my $result;
                ($cline, $result) = misc_command_text($cline, $macro, $stack, $state, $text, $line_nr);
                add_prev($text, $stack, $result) if (defined($result));
                return unless (defined($cline));
                unless ($Texi2HTML::Config::misc_command{$macro}->{'keep'})
                {
                     begin_paragraph($stack, $state) if 
                       (!no_paragraph($state,$cline));
                     next;
                }
            }
            # This is a @macroname{...} construct. We add it on top of stack
            # It will be handled when we encounter the '}'
            # There is a special case for def macros as @deffn{def} is licit
            if (!$Texi2HTML::Config::def_map{$macro} and $cline =~ s/^{//) #}
            {
                if ($macro eq 'verb')
                {
                    if ($cline =~ /^$/)
                    {
                        # Allready warned 
                    }
                    else
                    {
                        $cline =~ s/^(.)//;
                        $state->{'verb'} = $1;
                    }
                } 
                # currently if remove_texi and anchor/ref/footnote
                # the text within the command is ignored
                # see t2h_remove_command in texi2html.init
                my $new_command_ref = { 'style' => $macro, 'text' => '', 'arg_nr' => 0, 'line_nr' => $line_nr };
                push (@$stack, $new_command_ref);
                if ($no_paragraph_macro{$macro})
                {
                   $state->{'no_paragraph'}++;
                   push @{$state->{'no_paragraph_stack'}}, "\@$macro";
                }
                open_arg($macro, 0, $state);
                if ($state->{'keep_texi'})
                {
                   $new_command_ref->{'keep_line_nr'} = [ $line_nr ];
                } 
                my $real_style_command = 0;
                if (defined($style_type{$macro}) and (($style_type{$macro} eq 'style') or ($style_type{$macro} eq 'accent')))
                {
                     push (@{$state->{'command_stack'}}, $macro);
                     $real_style_command = 1;
                     #print STDERR "# Stacked $macro (@{$state->{'command_stack'}})\n" if ($T2H_DEBUG); 
                }
                # FIXME give line, and modify line?
                &$Texi2HTML::Config::begin_style_texi($macro, $state, $stack, $real_style_command, $state->{'remove_texi'})
                  if (defined($Texi2HTML::Config::begin_style_texi) 
                      and !($state->{'keep_texi'}));
                next;
            }

            # special case if we are checking itemize line. In that case
            # we want to make sure that there is no @item on the @itemize
            # line, otherwise it will be added on the front of another @item,
            # leading to an infinite loop...

            if ($state->{'check_item'} and ($macro =~ /^itemx?$/ or $macro eq 'headitem'))
            {
                line_error("\@$macro on \@$state->{'check_item'} line", $line_nr);
                next;
            }

            # if we're keeping texi unmodified we can do it now
            if ($state->{'keep_texi'})
            {
                # We treat specially formats accepting {} on command line
                if ($macro eq 'multitable' or defined($Texi2HTML::Config::def_map{$macro}) or defined($sec2level{$macro}) or $macro eq 'macro')
                {
                    add_prev($text, $stack, "\@$macro" . $cline);
                    $cline = '';
                    next;
                }

                add_prev($text, $stack, "\@$macro");
                if ($Texi2HTML::Config::texi_formats_map{$macro} and $Texi2HTML::Config::texi_formats_map{$macro} eq 'raw')
                {
                    $state->{'raw'} = $macro;
                    $state->{$macro}++ if ($macro eq 'macro');
                    push (@$stack, {'style' => $macro, 'text' => ''});
                }
                next;
            }

            # If we are removing texi, the following macros are not removed 
            # as is but modified. So they are collected first, as if we were
            # in normal text

            # a raw macro beginning
            if ($Texi2HTML::Config::texi_formats_map{$macro} and $Texi2HTML::Config::texi_formats_map{$macro} eq 'raw')
            {
                if (!$Texi2HTML::Config::format_in_paragraph{$macro})
                { # close paragraph before verbatim (and tex if !L2H)
                    close_paragraph($text, $stack, $state, "begin \@$macro", $line_nr);
                }
                $state->{'raw'} = $macro;
                push (@$stack, {'style' => $macro, 'text' => ''});
                $state->{$macro}++ if ($macro eq 'macro');
                return if ($cline =~ /^\s*$/ or ($macro eq 'macro'));
                next;
            }
            my $simple_macro = 1;
            # An accent macro
            if (exists($Texi2HTML::Config::accent_map{$macro}))
            {
                # the command itself is not in the command stack, since with
                # braces, it is already popped when do_simple is called
                #push (@{$state->{'command_stack'}}, $macro);
                $cline =~ s/^\s*// if ($macro =~ /^[a-zA-Z]/);
                if ($cline =~ s/^(\S)//o)
                {
                    add_prev($text, $stack, do_style_command($macro, $1, $state, [ $1 ], $line_nr, undef, undef, undef));
                }
                else
                { # The accent is at end of line
                    add_prev($text, $stack, do_text($macro, $state));
                }
                #pop @{$state->{'command_stack'}};
            }
            # an @-command which should be like @command{}. We handle it...
            elsif ($::things_map_ref->{$macro})
            {
                line_warn ("$macro requires {}", $line_nr);
                add_prev($text, $stack, do_thing_command($macro, '', $state, $line_nr));
            }
            # an @-command like @command
            elsif (defined($::simple_map_ref->{$macro}))
            {
                add_prev($text, $stack, do_simple_command($macro, $state, $line_nr));
            }
            else
            {
                $simple_macro = 0;
            }
            if ($simple_macro)
            {# if the macro didn't triggered a paragraph start it might now
                begin_paragraph($stack, $state) if 
                   ($Texi2HTML::Config::no_paragraph_commands{$macro} and !no_paragraph($state,$cline));
                next;
            }
            # the following macros are modified or ignored if we are 
            # removing texi, and they are not handled like macros in normal text
            if ($state->{'remove_texi'})
            {
                 # handle specially some macros
                 if ((index_command_prefix($macro) ne '') or 
                      ($macro eq 'itemize') or 
                      ($format_type{$macro} and ($format_type{$macro} eq 'table' or $format_type{$macro} eq 'quotation'))
                      or ($macro eq 'multitable'))
                 {
                      return;
                 }
                 elsif ($macro eq 'enumerate')
                 {
                      my $spec;
                      ($cline, $spec) = parse_enumerate ($cline);
                      return if ($cline =~ /^\s*$/);
                      next;
                 }
                 elsif (defined($Texi2HTML::Config::def_map{$macro}))
                 {
                     my ($command, $style, $category, $name, $type, $class, $arguments, $args_array);
                     ($command, $style, $category, $name, $type, $class, $arguments, $args_array) = parse_def($macro, $cline, $line_nr); 
                     # FIXME -- --- ''... lead to simple text in texi2html
                     # while they are kept as is in html coments by makeinfo
                     $category = remove_texi($category) if (defined($category));
                     $name = remove_texi($name) if (defined($name));
                     $type = remove_texi($type) if (defined($type));
                     $class = remove_texi($class) if (defined($class));
                     $arguments = remove_texi($arguments) if (defined($arguments));
                     chomp($arguments);
                     add_prev($text, $stack, &$Texi2HTML::Config::def_line_no_texi($category, $name, $type, $arguments));
                     return;
                }
                elsif (defined($sec2level{$macro}))
                { #FIXME  there is certainly more intelligent stuff to do
                    my $num;
                    if ($state->{'region'})
                    {
                        $state->{'head_num'}++;
                        $num = "$state->{'region'}_$state->{'head_num'}";
                    }
                    else
                    {
#                        $global_head_num++;
                        $num = $global_head_num;
                    }
                    my $heading_element = $headings{$num};
                    $cline = trim_comment_spaces ($cline, "\@$macro");
                    add_prev($text, $stack, &$Texi2HTML::Config::heading_no_texi($heading_element, $macro, $cline));
                    return;
                }

                # ignore other macros
                next;
            }

            # handle the other macros, we are in the context of normal text
            if (defined($sec2level{$macro}))
            {
                 #dump_stack($text, $stack, $state);
                 my $num;
                 if ($state->{'region'})
                 {
                     $state->{'head_num'}++;
                     $num = "$state->{'region'}_$state->{'head_num'}";
                     #$num = $state->{'head_num'};
                 }
                 else
                 {
                     $global_head_num++;
                     $num = $global_head_num;
                 }
                 my $heading_element = $headings{$num};
                 add_prev($text, $stack, &$Texi2HTML::Config::element_label($heading_element->{'id'}, $heading_element, $macro, $cline));
                 add_prev($text, $stack, &$Texi2HTML::Config::heading($heading_element, $macro, $cline, substitute_line($cline, "\@$macro"), $state->{'preformatted'}));
                 return;
            }

            if (index_command_prefix($macro) ne '')
            {
                my $index_name = index_command_prefix($macro);
                my $entry_texi = trim_comment_spaces($cline, "\@$macro", $line_nr);
                chomp($entry_texi);
                # FIXME multiple_pass?
                my $entry_text = substitute_line($entry_texi, "\@$macro", prepare_state_multiple_pass($macro, $state));
                my ($index_entry, $formatted_index_entry, $index_label) = do_index_entry_label($macro,$state,$line_nr, $entry_texi);

                if (defined($index_entry))
                {
                   line_warn ("(bug?) Index out of sync `$index_entry->{'texi'}' ne `$entry_texi'", $line_nr) if ($index_entry->{'texi'} ne $entry_texi);
                }
                add_prev($text, $stack, &$Texi2HTML::Config::index_entry_command($macro, $index_name, $index_label, $entry_texi, $entry_text, $index_entry));
                # it eats the end of line and therefore don't start
                # table entries nor close @center. These should be stopped
                # on the next line, though.
                return;
            }
            if ($macro eq 'insertcopying')
            {
                #close_paragraph($text, $stack, $state, $line_nr);
                add_prev($text, $stack, do_insertcopying($state, $line_nr));
                # reopen a preformatted format if it was interrupted by the macro
                begin_paragraph ($stack, $state) if ($state->{'preformatted'});
                return;
            }
            if ($macro =~ /^itemx?$/o or ($macro eq 'headitem'))
            {
		    #print STDERR "ITEM: $cline";
		    #dump_stack($text, $stack, $state);
                abort_empty_preformatted($stack, $state);
                # FIXME let the user be able not to close the paragraph
                close_paragraph($text, $stack, $state, "\@$macro", $line_nr);

		    #print STDERR "ITEM after close para: $cline";
		    #dump_stack($text, $stack, $state);
                # these functions return the format if in the right context
                my $in_list_enumerate;
                my $format;
                if ($format = add_item($text, $stack, $state, $line_nr))
                { # handle lists
                    $in_list_enumerate = 1;
                }
                elsif ($format = add_term($text, $stack, $state, $line_nr))
                {
                    #$state->{'no_paragraph'}++;
                }
                elsif ($format = add_line($text, $stack, $state, $line_nr)) 
                {
                    #$state->{'no_paragraph'}++;
                }
                if ($format)
                {
                    if (defined($Texi2HTML::Config::tab_item_texi))
                    {
                        my $resline = &$Texi2HTML::Config::tab_item_texi($macro, $state->{'command_stack'}, $stack, $state, $cline, $line_nr);
                        $cline = $resline if (defined($resline));
                    }
                    if ($in_list_enumerate)
                    {
#print STDERR "BEGIN ITEM $format->{'format'}\n";
#dump_stack($text, $stack, $state);
                        push (@$stack, { 'format' => 'item', 'text' => '', 'format_ref' => $format });
                        begin_paragraph($stack, $state) if ($state->{'preformatted'} or !no_line($cline));
                    }
                    else
                    {# handle table @item term and restart another one
                     # or after table text restart a term
                        push (@$stack, { 'format' => 'term', 'text' => '', 'format_ref' => $format });
                    }
                    $format->{'texi_line'} = $cline;
                    my ($line, $open_command) = &$Texi2HTML::Config::format_list_item_texi($format->{'format'}, $cline, $format->{'prepended'}, $format->{'command'}, $format->{'number'});
                    $cline = $line if (defined($line));
                    #if ($open_command)
                    #{ 
                    #     open_arg($format->{'command'},0, $state);
                    #     $format->{'command_opened'} = 1;
                    #}
                    $format->{'item_cmd'} = $macro;
                    $format->{'texi_line_texi_formatted'} = $cline;
                    next;
                }
                $format = add_row ($text, $stack, $state, $line_nr); # handle multitable
                if (!$format)
                {
                    line_warn ("\@$macro outside of table or list", $line_nr);
                }
                else
                {
                    push @$stack, {'format' => 'row', 'text' => '', 'item_cmd' => $macro, 'format_ref' => $format };
                    push @$stack, {'format' => 'cell', 'text' => '', 'format_ref' => $format};
                    $format->{'cell'} = 1;
                    if ($format->{'max_columns'})
                    {
                        if (defined($Texi2HTML::Config::tab_item_texi))
                        {
                            my $resline = &$Texi2HTML::Config::tab_item_texi($macro, $state->{'command_stack'}, $stack, $state, $cline, $line_nr);
                            $cline = $resline if (defined($resline));
                        }
                        begin_paragraph_after_command($state,$stack,$macro,$cline);
                    }
                    else
                    {
                        line_warn ("\@$macro in empty multitable", $line_nr);
                    }
                }
                next;
            }

            if ($macro eq 'tab')
            {
                abort_empty_preformatted($stack, $state);
                # FIXME let the user be able not to close the paragraph?
                close_paragraph($text, $stack, $state, "\@$macro", $line_nr);

                my $format = add_cell ($text, $stack, $state, $line_nr);
                if (!$format)
                {
                    line_warn ("\@$macro outside of multitable", $line_nr);
                }
                else
                {
                    push @$stack, {'format' => 'cell', 'text' => '', 'format_ref' => $format};
                    if (!$format->{'max_columns'})
                    {
                       line_warn ("\@$macro in empty multitable", $line_nr);
                    }
                    elsif ($format->{'cell'} > $format->{'max_columns'})
                    {
                       line_warn ("too much \@$macro (multitable has only $format->{'max_columns'} column(s))", $line_nr);
                    }
                    else
                    {
                       if (defined($Texi2HTML::Config::tab_item_texi))
                       {
                          my $resline = &$Texi2HTML::Config::tab_item_texi($macro, $state->{'command_stack'}, $stack, $state, $cline, $line_nr);
                          $cline = $resline if (defined($resline));
                       }
                    }
                }
                begin_paragraph_after_command($state,$stack,$macro,$cline);
                next;
            }
            # Macro opening a format (table, list, deff, example...)
            if ($format_type{$macro} and ($format_type{$macro} ne 'fake'))
            {
                my $ignore_center = 0;
                # @center is forbidden in @-command with braces, @*table
                # @item line, @multitable, or another @center
                if ($macro eq 'center' and @$stack)
                {
                   my $top_stack = top_stack($stack, 1);
                   if (exists($top_stack->{'style'}) or (defined($top_stack->{'format'}) and ($top_stack->{'format'} eq 'term' or $top_stack->{'format'} eq 'cell')) or $state->{'preformatted'} or $state->{'paragraph_style'}->[-1] eq 'center')
                   {
                       $ignore_center = 1;
                   }
                   #dump_stack ($text, $stack, $state);
                }
                if ($ignore_center)
                {
                    line_error("\@$macro should not appear in another format", $line_nr);
                }
                else
                {
                    $cline = begin_format($text, $stack, $state, $macro, $cline, $line_nr);
                }
                # we keep the end of line for @center, and for formats
                # that have cmd_line opened and need to see the end of line
                next if (($macro eq 'center') or 
                   (defined($Texi2HTML::Config::def_map{$macro}))
                   or ($macro eq 'float') or ($format_type{$macro} eq 'quotation'));
                return if ($cline =~ /^\s*$/);
                next;
            }
            $cline = do_unknown (2, $macro, $cline, $text, $stack, $state, $line_nr);
            next;
        }
        elsif($cline =~ s/^([^{}@,]*)\@([^\s\}\{\@]*)//o)
        { # A macro with a character which shouldn't appear in macro name
            add_prev($text, $stack, do_text($1, $state));
            $cline = do_unknown (2, $2, $cline, $text, $stack, $state, $line_nr);
            next;
        }
        # a brace
        elsif ($cline =~ s/^([^{},]*)([{}])//o)
        {
            my $leading_text = $1;
            my $brace = $2;
            add_prev($text, $stack, do_text($leading_text, $state));
            if (defined($brace) and ($brace eq '{')) #'}'
            {
                add_prev($text, $stack, do_text('{',$state)); #}
                if ($state->{'math_style'})
                {
                    $state->{'math_brace'}++;
                }
                else 
                {
                    unless ($state->{'keep_texi'} or $state->{'remove_texi'})
                    {
                        line_error ("Misplaced {.", $line_nr);
                    }
                }
            }
            elsif (defined($brace) and ($brace eq '}') and 
                    (!@$stack or (!defined($stack->[-1]->{'style'}))
            # braces are allowed in math
                    or $state->{'math_brace'}))
            {
                if ($state->{'keep_texi'})
                {
                    add_prev($text, $stack, '}');
                }
                elsif($state->{'math_style'} and $state->{'math_brace'})
                {
                    add_prev($text, $stack, do_text('}',$state));
                    $state->{'math_brace'}--;
                }
                else
                {
                    line_error("Misplaced {.", $line_nr);
                    #dump_stack($text, $stack, $state);
                }
            }
            else
            { # A @-command{ ...} is closed
                my ($result, $command) = close_style_command($text, $stack, $state, $line_nr, $cline);
                add_prev($text, $stack, $result);
                if ($Texi2HTML::Config::no_paragraph_commands{$command} 
                  and !$state->{'keep_texi'} and !no_paragraph($state,$cline))
                {
                   begin_paragraph($stack, $state);
                }
            }
        }
        elsif ($cline =~ s/^([^,]*)[,]//o)
        {
             add_prev($text, $stack, do_text($1, $state));
             if (@$stack and defined($stack->[-1]->{'style'})
                  and (ref($::style_map_ref->{$stack->[-1]->{'style'}}) eq 'HASH'))
             {
                  my $macro = $stack->[-1]->{'style'};
                  my $style_args = $::style_map_ref->{$macro}->{'args'};
                  if (defined($style_args->[$stack->[-1]->{'arg_nr'} + 1]))
                  {
                       push (@{$stack->[-1]->{'args'}}, $stack->[-1]->{'text'});
                       $stack->[-1]->{'fulltext'} .= $stack->[-1]->{'text'} . do_text(',', $state);
                       $stack->[-1]->{'text'} = '';
                       close_arg ($macro, $stack->[-1]->{'arg_nr'}, $state);
                       $stack->[-1]->{'arg_nr'}++;
                       open_arg ($macro, $stack->[-1]->{'arg_nr'}, $state);
                       next;
                  }
             }
             add_prev($text, $stack, do_text(',', $state));
        }
        else
        { # no macro nor '}', but normal text
            add_prev($text, $stack, do_text($cline, $state));
            # @center/line term is closed at the end of line. When a 
            # @-command which 
            # keeps the texi as is happens on the @center line, the @center
            # is closed at the end of line appearing after the @-command
            # closing (for example @ref, @footnote).
            last if ($state->{'keep_texi'});
            #print STDERR "END_LINE(l):$cline!!!\n";
            #dump_stack($text, $stack, $state);
            my $maybe_format_to_close = 1;
            my $in_table;
            while ($maybe_format_to_close)
            {
               $maybe_format_to_close = 0;
               #my $top_format = top_stack($stack, 1);
               my $top_format = top_stack($stack, 2);
               # the stack cannot easily be used, because there may be 
               # opened commands in paragraphs if the center is in a 
               # style command, like
               # @b{
               # bold
               #
               # @center centered bold
               # 
               # }
               #
               # Therefore $state->{'paragraph_style'}->[-1] is used.
               #
               # The close_stack until 'center' is needed because
               # of constructs like 
               #
               # @center something @table
               #
               # In that case what would be removed from the stack after
               # paragraph closing wold not be the @center. Such construct
               # is certainly incorrect, though.
               #
               # when 'closing_center' is true we don't retry to close 
               # the @center line.
               if ($state->{'paragraph_style'}->[-1] eq 'center' 
                   and !$state->{'closing_center'} and !$state->{'keep_texi'})
               {
                   $state->{'closing_center'} = 1;
                   close_paragraph($text, $stack, $state, "\@center", $line_nr); 
                   close_stack($text, $stack, $state, $line_nr, 'center');
                   delete $state->{'closing_center'};
                   my $center = pop @$stack;
                   add_prev($text, $stack, &$Texi2HTML::Config::paragraph_style_command('center',$center->{'text'}));
                   my $top_paragraph_style = pop @{$state->{'paragraph_style'}};
                   
                   # center is at the bottom of the comand_stack because it 
                   # may be nested in many way
                   my $bottom_command_stack = shift @{$state->{'command_stack'}};
                   print STDERR "Bug: closing center, top_paragraph_style: $top_paragraph_style, bottom_command_stack: $bottom_command_stack.\n"
                      if ($bottom_command_stack ne 'center' or $top_paragraph_style ne 'center');
                   $maybe_format_to_close = 1;
                   next;
               }
               
               # @item line is closed by end of line. In general there should
               # not be a paragraph in a term. However it may currently
               # happen in construct like
               #
               # @table @asis
               # @item @cindex index entry
               # some text still in term, and in paragraph
               # Not in term anymore
               # ....
               #
               if (defined($top_format->{'format'}) and $top_format->{'format'} eq 'term')
               {
                   #close_paragraph($text, $stack, $state, $line_nr)
                   #    if ($state->{'paragraph_context'});
                   close_stack($text, $stack, $state, $line_nr, 'term');
                   $in_table = add_term($text, $stack, $state, $line_nr);
                   if ($in_table)
                   {
                      $maybe_format_to_close = 1;
                      next;
                   }
               }
            }
            if ($in_table)
            {
               push (@$stack, { 'format' => 'line', 'text' => '', 'only_inter_commands' => 1, 'format_ref' => $in_table });
               begin_paragraph($stack, $state) if ($state->{'preformatted'});
            }
            last;
        }
    }
    return 1;
} # end scan_line

sub open_arg($$$)
{
    my $macro = shift;
    my $arg_nr = shift;
    my $state = shift;
    if (ref($::style_map_ref->{$macro}) eq 'HASH')
    {
         my $arg = $::style_map_ref->{$macro}->{'args'}->[$arg_nr];
         if ($arg eq 'keep')
         {
             $state->{'keep_nr'}++;
             $state->{'keep_texi'} = 1;
         }
         elsif (!$state->{'keep_texi'})
         {
             if ($arg eq 'code')
             {
                 $state->{'code_style'}++;
             }
             elsif ($arg eq 'math')
             {
                 $state->{'math_style'}++;
                 if ($state->{'math_style'} == 1)
                 {
                     $state->{'math_brace'} = 0;
                     # FIXME quick hack to define @\ in @math 
                     $::simple_map_ref->{'\\'} = $Texi2HTML::Config::simple_map_math{'\\'};
                     $::simple_map_pre_ref->{'\\'} = $Texi2HTML::Config::simple_map_pre_math{'\\'};
                     $::simple_map_texi_ref->{'\\'} = $Texi2HTML::Config::simple_map_texi_math{'\\'};
                 }
             }
         }
    }
    elsif ($code_style_map{$macro} and !$state->{'keep_texi'})
    {
         $state->{'code_style'}++;
    }
}

sub close_arg($$$)
{
    my $macro = shift;
    my $arg_nr = shift;
    my $state = shift;
    if (ref($::style_map_ref->{$macro}) eq 'HASH')
    {
         my $arg = $::style_map_ref->{$macro}->{'args'}->[$arg_nr];
         if ($arg eq 'keep')
         {
             $state->{'keep_nr'}--;
             $state->{'keep_texi'} = 0 if ($state->{'keep_nr'} == 0);
         }
         elsif (!$state->{'keep_texi'})
         {
             if ($arg eq 'code')
             {
                 $state->{'code_style'}--;
             }
             elsif ($arg eq 'math')
             {
                 $state->{'math_style'}--;
                 if ($state->{'math_style'} == 0)
                 {
                     delete $::simple_map_ref->{'\\'};
                     delete $::simple_map_pre_ref->{'\\'};
                     delete $::simple_map_texi_ref->{'\\'};
                 }
             }
         }
#print STDERR "c $arg_nr $macro $arg $state->{'code_style'}\n";
    }
    elsif ($code_style_map{$macro} and !$state->{'keep_texi'})
    {
         $state->{'code_style'}--;
    }
}

# add a special style on the top of the stack. This is used for commands
# that extend until the end of the line. Also add an entry in the @-command
# hashes for this fakes style.
#sub open_cmd_line($$$$$)
#{
#    my $command = shift;
#    my $stack = shift;
#    my $state = shift;
#    my $args = shift;
#    my $function = shift;
#    push @$stack, {'style' => 'cmd_line', 'text' => '', 'arg_nr' => 0};
#    foreach my $hash (\%Texi2HTML::Config::style_map, \%Texi2HTML::Config::style_map_pre, \%Texi2HTML::Config::style_map_texi, \%Texi2HTML::Config::simple_format_style_map_texi)
#    {
#         $hash->{'cmd_line'}->{'args'} = $args;
#         $hash->{'cmd_line'}->{'function'} = $function;
#    }
#    $state->{'no_paragraph'}++;
#    push @{$state->{'no_paragraph_stack'}}, "\@$command line";
##    $state->{'cmd_line'} = 1;
#    open_arg ('cmd_line', 0, $state);
#}

# finish @item line in @*table
sub add_term($$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;

    my $top_format = top_stack($stack,2);

    return unless (defined($top_format->{'format'}) and $top_format->{'format'} eq 'term');
    #print STDERR "ADD_TERM\n";

    my $term = pop @$stack;
    my $format = $stack->[-1];
    $format->{'paragraph_number'} = 0;
    chomp ($term->{'text'});

    my ($index_label, $formatted_index_entry);
    if ($format->{'format'} =~ /^(f|v)/o)
    {
        my $index_entry;
        ($index_entry, $formatted_index_entry, $index_label) = do_index_entry_label($format->{'format'}, $state,$line_nr, $format->{'texi_line'});
        print STDERR "Bug: no index entry for $term->{'text'}\n" unless defined($index_label);
    }

    my $item_result = &$Texi2HTML::Config::table_item($term->{'text'}, $index_label,$format->{'format'},$format->{'command'}, $state->{'command_stack'}, $format->{'item_cmd'}, $formatted_index_entry);
    add_prev($text, $stack, $item_result);
    return $format;
}

sub add_row($$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    
    my $top_format = top_stack($stack);
    # @center a @item
    # will lead to row not being closed since a close paragraph doesn't
    # end the center.
    return unless (defined($top_format->{'format'}) and $top_format->{'format'} eq 'cell');
    my $cell = $top_format;
    my $format = $stack->[-3];
    print STDERR "Bug under row cell row not a multitable\n" if (!defined($format->{'format'}) or $format->{'format'} ne 'multitable'); 
    #print STDERR "ADD_ROW $format->{'item_nr'} first: $format->{'first'}\n";
    # dump_stack($text, $stack, $state);

    $format->{'item_nr'}++ unless ($format->{'first'});
    my $empty_first;
    if ($format->{'first'} and $format->{'cell'} == 1 and $stack->[-1]->{'text'} =~ /^\s*$/)
    {
       $empty_first = 1;
       $format->{'empty_first'} = 1;
    }
    if ($format->{'cell'} > $format->{'max_columns'} or $empty_first)
    {
       my $cell = pop @$stack;
       print STDERR "Bug: not a cell ($cell->{'format'}) in multitable\n" if ($cell->{'format'} ne 'cell');
    }
    else
    {
       add_cell($text, $stack, $state);
    }
    my $row = pop @$stack;
    print STDERR "Bug: not a row ($row->{'format'}) in multitable\n" if ($row->{'format'} ne 'row');
    if ($format->{'max_columns'} and !$empty_first)
    {
       # FIXME have the cell count in row and not in table. table could have
       # the whole structure, but cell count doesn't make much sense 
       add_prev($text, $stack, &$Texi2HTML::Config::row($row->{'text'}, $row->{'item_cmd'}, $format->{'columnfractions'}, $format->{'prototype_row'}, $format->{'prototype_lengths'}, $format->{'max_columns'}, $cell->{'only_inter_commands'}, $format->{'first'}));
    }

    $format->{'first'} = 0 if ($format->{'first'});

    return $format;
}

# FIXME remove and merge, too much double checks and code
sub add_cell($$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    my $top_format = top_stack($stack);

    #print STDERR "ADD_CELL\n";
    return unless (defined($top_format) and $top_format->{'format'} eq 'cell');
   # print STDERR "ADD_CELL, really\n";

    my $cell = pop @$stack;
    my $row = top_stack($stack);
    print STDERR "Bug: top_stack of cell not a row\n" if (!defined($row->{'format'}) or ($row->{'format'} ne 'row'));
    my $format = $stack->[-2];
    print STDERR "Bug under cell row not a multitable\n" if (!defined($format->{'format'}) or $format->{'format'} ne 'multitable'); 

    if ($format->{'first'} and $format->{'cell'} == 1)
    {
        line_warn( "\@tab before \@item", $line_nr);
    }

    if ($format->{'cell'} <= $format->{'max_columns'})
    {
        #print STDERR "ADD_CELL, really, really\n";
        add_prev($text, $stack, &$Texi2HTML::Config::cell($cell->{'text'}, $row->{'item_cmd'}, $format->{'columnfractions'}, $format->{'prototype_row'}, $format->{'prototype_lengths'}, $format->{'max_columns'}, $cell->{'only_inter_commands'}, $format->{'first'}));
    }
    $format->{'cell'}++;
    $format->{'first'} = 0 if ($format->{'first'});
    return $format;
}

sub add_line($$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    my $top_stack = top_stack($stack);

    # if there is something like
    # @center centered @item new item
    # the item isn't opened since it is in @center, and center isn't closed 
    # by an @item appearing here (unlike a paragraph).
    # the error message is '@item outside of table or list'.
    # texi2dvi also has issue, but makeinfo is happy, however it 
    # produces bad nesting.
    return unless(defined($top_stack->{'format'}) and $top_stack->{'format'} eq 'line');
    #print STDERR "ADD_LINE\n";
    #dump_stack($text, $stack, $state);

    my $line = pop @$stack;
    my $format = $stack->[-1];
    $format->{'paragraph_number'} = 0;
    if ($format->{'first'})
    {
        $format->{'first'} = 0;
        # we must have <dd> or <dt> following <dl> thus we do a 
        # &$Texi2HTML::Config::table_line here too, although it could have
        # been a normal paragraph.
        if ($line->{'text'} =~ /\S/o)
        {
           add_prev($text, $stack, &$Texi2HTML::Config::table_line($line->{'text'}, $line->{'only_inter_commands'}, 1));
           $format->{'empty_first'} = 1 if ($line->{'only_inter_commands'});
        }
        else
        {
           $format->{'empty_first'} = 1;
        }
    }
    else
    {
        $format->{'item_nr'}++;
        add_prev($text, $stack, &$Texi2HTML::Config::table_line($line->{'text'}, $line->{'only_inter_commands'}, 0));
    }
    return $format;
}

# finish @enumerate or @itemize @item
sub add_item($$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;

    my $top_stack = top_stack($stack);

    return unless (defined($top_stack->{'format'}) and $top_stack->{'format'} eq 'item');
    #print STDERR "ADD_ITEM: \n";
    #dump_stack($text, $stack, $state);
    # as in pre the end of line are kept, we must explicitely abort empty
    # preformatted, close_stack doesn't do that.
    my $item = pop @$stack;
    my $format = $stack->[-1];
    my $item_command = $item->{'format'};
    # first has no associated item, it is more like a 'title'
    $item_command = '' if ($format->{'first'});
    
    $format->{'paragraph_number'} = 0;
    
    #dump_stack ($text, $stack, $state);
    # the element following ol or ul must be li. Thus even though there
    # is no @item we put a normal item.
    # don't do an item if it is the first and it is empty
    if (!$format->{'first'} or ($item->{'text'} =~ /\S/o))
    {
        my $formatted_command;
        if (defined($format->{'command'}) and $format->{'command'} ne '')# and exists($::things_map_ref->{$format->{'command'}}))
        {
            $formatted_command = substitute_line("\@$format->{'command'}\{\}", "\@item \@$format->{'command'}", duplicate_formatting_state($state));
            $format->{'formatted_command'} = $formatted_command;
        }
	#chomp($item->{'text'});
        add_prev($text, $stack, &$Texi2HTML::Config::list_item($item->{'text'},$format->{'format'},$format->{'command'}, $formatted_command, $format->{'item_nr'}, $format->{'spec'}, $format->{'number'}, $format->{'prepended'}, $format->{'prepended_formatted'}, $item->{'only_inter_commands'}, $format->{'first'},$item_command));
    } 
    else
    {
        $format->{'empty_first'} = 1;
    }
    if ($format->{'first'})
    {
        $format->{'first'} = 0;
    }
    else
    {
        $format->{'item_nr'}++;
    }

    if ($format->{'format'} eq 'enumerate')
    {
        $format->{'number'} = '';
        my $spec = $format->{'spec'};
        if ($spec =~ /^[0-9]$/)
        {
            $format->{'number'} = $spec + $format->{'item_nr'};
        }
        else
        {
            my $base_letter = ord('a');
            $base_letter = ord('A') if (ucfirst($spec) eq $spec);

            my @letter_ords = decompose(ord($spec) - $base_letter + $format->{'item_nr'}, 26);
            foreach my $ord (@letter_ords)
            {# FIXME we go directly to 'ba' after 'z', and not 'aa'
             #because 'ba' is 1,0 and 'aa' is 0,0.
                $format->{'number'} = chr($base_letter + $ord) . $format->{'number'};
            }
        }
    }

    return $format;
}

# format ``simple'' macros, that is macros without arg or style macros
sub do_simple_command($$$)
{
    my $macro = shift;
    my $state = shift;
    my $line_nr = shift;
    
#msg_debug ("DO_SIMPLE $macro $args $arg_nr (@$args)", $line_nr) if (defined($args));
    if ($state->{'remove_texi'})
    {
#print STDERR "DO_SIMPLE remove_texi $macro\n";
        return  $::simple_map_texi_ref->{$macro};
    }
    else
    {
        return &$Texi2HTML::Config::simple_command($macro, $state->{'preformatted'}, $line_nr, $state);
    }
}

sub do_thing_command($$$$)
{
    my $macro = shift;
    my $text = shift;
    my $state = shift;
    my $line_nr = shift;

    if ($state->{'remove_texi'})
    {
       return  $::texi_map_ref->{$macro}.$text;
#print STDERR "DO_SIMPLE remove_texi texi_map $macro\n";
    }
    else
    {
        return &$Texi2HTML::Config::thing_command($macro, $text, $state->{'preformatted'}, $line_nr, $state);
    }
}

sub do_style_command($$$$$$$$)
{
    my $macro = shift;
    my $text = shift;
    my $state = shift;
    my $args = shift;
    my $line_nr = shift;
    my $no_open = shift;
    my $no_close = shift;
    my $kept_line_nrs = shift;

    my $arg_nr = 0;
    $arg_nr = @$args - 1 if (defined($args));
    
    if (defined($::style_map_ref->{$macro}))
    {
        my $style;
        my $result;
        if ($state->{'remove_texi'})
        {
#print STDERR "REMOVE $macro, $style_map_texi_ref->{$macro}, fun $style_map_texi_ref->{$macro}->{'function'} remove cmd " . \&Texi2HTML::Config::t2h_remove_command . " ascii acc " . \&t2h_default_accent;
            $style = $::style_map_texi_ref->{$macro};
        }
        elsif ($state->{'preformatted'})
        {
            if ($macro eq 'kbd' and (Texi2HTML::Config::get_conf('kbdinputstyle') ne 'distinct'))
            {
                $style = $::style_map_pre_ref->{'code'};
            }
            else
            {
                $style = $::style_map_pre_ref->{$macro};
            }
        }
        else
        {
            # kbd is in code_style, so it is 'code_style' > 1
            if ($macro eq 'kbd' and ((Texi2HTML::Config::get_conf('kbdinputstyle') eq 'code') or ($state->{'code_style'} > 1 and Texi2HTML::Config::get_conf('kbdinputstyle') eq 'example')))
            {
                $style = $::style_map_ref->{'code'};
            }
            else
            {
                $style = $::style_map_ref->{$macro};
            }
        }
        if (defined($style))
        {                           # known style
            $result = &$Texi2HTML::Config::style($style, $macro, $text, $args, $no_close, $no_open, $line_nr, $state, $state->{'command_stack'}, $kept_line_nrs);
        }
        if (!$no_close)
        { 
            close_arg($macro,$arg_nr, $state);
        }
        return $result;
    }
    elsif ($macro =~ /^special_(\w+)_(\d+)$/o)
    {
        my $style = $1;
        my $count = $2;
        print STDERR "Bug? text in \@$macro not empty.\n" if ($text ne '');  
        if (defined($Texi2HTML::Config::command_handler{$style}) and
          defined($Texi2HTML::Config::command_handler{$style}->{'expand'}))
        {
            my $struct_count = 1+ $special_commands{$style}->{'max'} - $special_commands{$style}->{'count'};
            if (($count != $struct_count) and $T2H_DEBUG)
            {
                print STDERR "count $count in \@special $style and structure $struct_count differ\n";
            }
            $special_commands{$style}->{'count'}--;  
        }
        my $result = $Texi2HTML::Config::command_handler{$style}->{'expand'}
              ($style,$count,$state,$text);
        $result = '' if (!defined($result));
        return $result;
    }
    # Unknown macro
    my $result = '';
    my ($done, $result_text, $message) = &$Texi2HTML::Config::unknown_style($macro, $text,$state,$no_close, $no_open);
    if ($done)
    {
        line_warn($message, $line_nr) if (defined($message));
        if (defined($result_text))
        {
            $result = $result_text;
        }
    }
    else 
    { 
        unless ($no_open)
        { # we warn only if no_open is true, i.e. it is the first time we 
          # close the macro for a multiline macro
            line_warn ("Unknown command with braces `\@$macro'", $line_nr);
            $result = do_text("\@$macro") . "{";
        }
        $result .= $text;
        $result .= '}' unless ($no_close);
    }
    return $result;
}

sub do_unknown($$$$$$$)
{
    my $pass = shift;
    my $macro = shift;
    my $line = shift;
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    #print STDERR "do_unknown[$pass]($macro) ::: $line"; 

    my ($result_line, $result, $result_text, $message) = &$Texi2HTML::Config::unknown($macro, $line, $pass, $stack,$state);
    if ($result)
    {
         add_prev ($text, $stack, $result_text) if (defined($result_text));
         line_warn($message, $line_nr) if (defined($message));
         # if $state->{'preformatted'}, assume that the preformatted is 
         # already opened. Otherwise we may end up opening one each time
         # there is an unknown command.
         begin_paragraph_after_command($state, $stack, $macro, $result_line)
              if (!$state->{'preformatted'});
         return $result_line;
    }
    elsif ($pass == 2)
    {
         line_warn ("Unknown command `\@$macro'", $line_nr);
         add_prev ($text, $stack, do_text("\@$macro"));
         return $line;
    }
    elsif ($pass == 1)
    {
         add_prev ($text, $stack, "\@$macro");
         return $line;
    }
    elsif ($pass == 0)
    {
         add_prev ($text, $stack, "\@$macro") unless($state->{'ignored'});
         return $line;
    }
}

# used only during @macro processing
sub add_text($@)
{
    my $string = shift;

    return if (!defined($string));
    foreach my $scalar_ref (@_)
    {
        next unless defined($scalar_ref);
        if (!defined($$scalar_ref))
        {
            $$scalar_ref = $string;
        }
        else
        {
            $$scalar_ref .= $string;
        }
        return;
    }
}

sub add_prev ($$$)
{
    my $text = shift;
    my $stack = shift;
    my $string = shift;

    unless (defined($text) and ref($text) eq "SCALAR")
    {
       die "text not a SCALAR ref: " . ref($text) . "";
    }
    
    return if (!defined($string));
    if (@$stack)
    {
        $stack->[-1]->{'text'} .= $string;
        return;
    }

    if (!defined($$text))
    {
         $$text = $string;
    }
    else
    {
         $$text .= $string;
    }
}

sub close_stack_texi($$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;

    
    return undef unless (@$stack or $state->{'raw'} or $state->{'macro'} or $state->{'macro_name'} or $state->{'ignored'});

    if ($state->{'ignored'})
    {
        line_error ("No matching `\@end $state->{'ignored'}'", $line_nr); 
        close_ignored($state, $stack);
    }

    if ($state->{'macro'})
    {
       my ($no_remaining, $result) = end_macro($state, '@end macro', "\n");
       add_prev ($text, $stack, $result) if (defined($result));
       line_error ("No matching `\@end macro'", $line_nr); 
    }
    elsif ($state->{'macro_name'})
    {
       line_warn ("closing $state->{'macro_name'} ($state->{'macro_depth'} braces missing)", $line_nr); 
       while ($state->{'macro_name'})
       {
           close_macro_arg($state, '', $line_nr);
       }
    }
    elsif ($state->{'verb'})
    {
        # warning in next pass
        #line_warn ("closing \@verb", $line_nr);
        $stack->[-1]->{'text'} = $state->{'verb'} . $stack->[-1]->{'text'};
        delete $state->{'verb'};
    }
    elsif ($state->{'raw'})
    {
        line_warn ("closing \@$state->{'raw'} raw format", $line_nr);
        my $style = pop @$stack;
        add_prev ($text, $stack, $style->{'text'} . "\@end $state->{'raw'}");
        delete $state->{'raw'};
    }

    my $stack_level = $#$stack + 1;
    
    while ($stack_level--)
    {
        my $style = pop(@$stack);
        # would be better in close_stack_structure
        #line_warn ("closing \@-command $style->{'style'}", $line_nr) if ($style->{'style'} ne '');
        close_style_texi($style, $text, $stack, $state, 1);
    }
    #$stack = [ ];
}


sub close_stack_structure($$$$;$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    my $close_only_item = shift;
    $close_only_item = 0 if (!defined($close_only_item));

    return undef unless (@$stack or $state->{'raw'});

    #print STDERR "close_stack_structure ($close_only_item)\n";
    #dump_stack ($text, $stack, $state);
    my $stack_level = $#$stack + 1;
    my $string = '';
    
    if ($state->{'verb'})
    {
        $stack->[-1]->{'text'} = $state->{'verb'} . $stack->[-1]->{'text'};
        #$string .= $state->{'verb'};
    }

    while ($stack_level--)
    {
        last if ($close_only_item and defined($stack->[-1]->{'format'}));
        my $top_stack = pop @$stack;
        if ($top_stack->{'format'})
        {
            my $format = $top_stack->{'format'};
            if ($format eq 'index_item')
            {
                enter_table_index_entry($text, $stack, $state, $line_nr);
            }
            elsif (!defined($format_type{$format}) or ($format_type{$format} ne 'fake'))
            {
                end_format_structure($format_type{$format}, $text, $stack, $state, $line_nr, "\n");
            }
        }
        elsif (defined($top_stack->{'style'}))
        {
            add_prev($text, $stack, 
              close_structure_command($top_stack, $state, 1, $line_nr));
        }
    }
    #$stack = [ ];
}

sub open_region($$)
{
    my $command = shift;
    my $state = shift;
    if (!exists($state->{'region_lines'}))
    {
        $state->{'region_lines'}->{'format'} = $command;
        $state->{'region_lines'}->{'number'} = 1;
        $state->{'region_lines'}->{'kept_place'} = $state->{'place'};
        $state->{'place'} = $no_element_associated_place;
        $state->{'region'} = $command;
        $state->{'multiple_pass'}++;
        $state->{'region_pass'} = 1;
    }
    else
    {
        $state->{'region_lines'}->{'number'}++;
    }
}

# close region like @insertcopying, titlepage...
# restore $state and delete the structure
sub close_region($)
{
    my $state = shift;
    $state->{'place'} = $state->{'region_lines'}->{'kept_place'};
    $state->{'multiple_pass'}--;
    delete $state->{'region_lines'}->{'number'};
    delete $state->{'region_lines'}->{'format'};
    delete $state->{'region_lines'}->{'kept_place'};
    delete $state->{'region_lines'};
    delete $state->{'region'};
    delete $state->{'region_pass'};
}

# close the stack, closing @-commands and formats left open.
# if a $format is given if $format is encountered the closing stops
sub close_stack($$$$;$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    my $format = shift;
    
    #print STDERR "sub_close_stack\n";
    if (@$stack)
    {
      my $stack_level = $#$stack + 1;
    
      #debugging
      #my $print_format = 'NO FORMAT';
      #$print_format = $format if ($format);
      #msg_debug ("Close_stack:  format $print_format", $line_nr);
    
      while ($stack_level--)
      {
        if ($stack->[$stack_level]->{'format'})
        {
            my $stack_format = $stack->[$stack_level]->{'format'};
            last if (defined($format) and $stack_format eq $format);
            # We silently close paragraphs, preformatted sections and fake formats
            if ($stack_format eq 'paragraph')
            {
                my $paragraph = pop @$stack;
                add_prev ($text, $stack, do_paragraph($paragraph->{'text'}, $state, $stack));
            }
            elsif ($stack_format eq 'preformatted')
            {
                my $paragraph = pop @$stack;
                add_prev ($text, $stack, do_preformatted($paragraph->{'text'}, $state, $stack));
            }
            else
            {
                if ($fake_format{$stack_format})
                {
                    warn "# Closing a fake format `$stack_format'\n" if ($T2H_VERBOSE);
                }
                elsif ($stack_format ne 'center')
                { # we don't warn for center
                    line_error ("No matching `\@end $stack_format'", $line_nr); 
                    #dump_stack ($text, $stack, $state);
                }
                if ($state->{'keep_texi'})
                {
                   add_prev($text, $stack, "\@end $stack_format");
                }
                elsif (!$state->{'remove_texi'})
                {
                   end_format($text, $stack, $state, $stack_format, $line_nr)
                        unless ($format_type{$stack_format} eq 'fake');
                }
            }
        }
        else
        {
            my $style =  $stack->[$stack_level]->{'style'};
            ########################## debug
            if (!defined($style))
            {
                print STDERR "Bug: style not defined, on stack\n";
                dump_stack ($text, $stack, $state); # bug
            }
            ########################## end debug
            my $error_msg = "\@$style missing close brace";
            $error_msg .= " ". format_line_number($stack->[$stack_level]->{'line_nr'}) if (defined($stack->[$stack_level]->{'line_nr'}));
            line_error ($error_msg, $line_nr) if ($style); 
            my ($result, $command) = close_style_command($text, $stack, $state, $line_nr, '');

            add_prev($text, $stack, $result) if (defined($result));
        }
      }
    }

    # This tries to avoid cases where the command_stack is not empty 
    # for a good reason, for example when doing a @def formatting the 
    # outside command_stack is preserved
    return if ($format or $state->{'multiple_pass'} or $state->{'no_paragraph'}); 

    # go through the command_stack and warn for each opened style format
    # and remove it. Those should be there because there is an opened style
    # that was stopped by a paragraph
    my @command_stack = @{$state->{'command_stack'}};
    @{$state->{'command_stack'}} = ();
    while (@command_stack)
    {
       my $latest_command = pop @command_stack;
       if (defined($style_type{$latest_command}) and $style_type{$latest_command} ne 'special')
       {
          line_error ("\@$latest_command missing close brace.", $line_nr);
       }
       else
       {
          unshift @{$state->{'command_stack'}}, $latest_command;
       }
    }
}

# given a stack and a list of formats, return true if the stack contains 
# these formats, first on top
sub stack_order($@)
{
    my $stack = shift;
    my $stack_level = $#$stack + 1;
    while (@_)
    {
        my $format = shift;
        while ($stack_level--)
        {
            if ($stack->[$stack_level]->{'format'})
            {
                if ($stack->[$stack_level]->{'format'} eq $format)
                {
                    $format = undef;
                    last;
                }
                else
                {
                    return 0;
                }
            }
        }
        return 0 if ($format);
    }
    return 1;
}	

sub top_format($)
{
    my $stack = shift;
    my $stack_level = $#$stack + 1;
    while ($stack_level--)
    {
        if ($stack->[$stack_level]->{'format'} and !$fake_format{$stack->[$stack_level]->{'format'}})
        {
             return $stack->[$stack_level];
        }
    }
    return undef;
}

sub close_paragraph($$$$;$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $reason = shift;
    my $line_nr = shift;
    my $no_preformatted_closing = shift;
    #print STDERR "CLOSE_PARAGRAPH\n";
    #dump_stack($text, $stack, $state);

    #  close until the first format, 
    #  duplicate stack of styles not closed
    my $new_stack;
    my $stack_level = $#$stack + 1;

    # In general close_paragraph is called because of a end of line, or 
    # a format is opened or closed, or there is a @tab or @item and other 
    # similar cases. In most cases there is a paragraph to be closed or 
    # there are no style opened since most @-commands cause paragraph 
    # opening and those that don't should not lead to a style opening.
    #
    # But in term or in @index (and maybe @node, @section, @ref), if 
    # there is a command opened it won't be closed, since it is in 
    # 'no_paragraph'. But @-commands that trigger close_paragraph should not 
    # be called when in those no_paragraph settings.

    if ($state->{'no_paragraph'})
    {
        line_warn("$reason should not appear in $state->{'no_paragraph_stack'}->[-1]", $line_nr);
    }

    while ($stack_level--)
    {
        last if ($stack->[$stack_level]->{'format'});
        my $style =  $stack->[$stack_level]->{'style'};
        # FIXME images, footnotes, xrefs, anchors?
        # seems that it is not possible, as 
        # close_paragraph shouldn't be called with keep_texi
        # and when the arguments are expanded, there is a 
        # substitute_line or similar with a new stack.

        # the !exists($style_type{$style}) condition catches the unknown 
        # @-commands: by default they are considered as style commands
        if (!$state->{'no_paragraph'})
        {
            if (!exists($style_type{$style}) or $style_type{$style} eq 'style')
            {
                unshift @$new_stack, { 'style' => $style, 'text' => '', 'no_open' => 1, 'arg_nr' => 0 };
            }
            elsif (($style_type{$style} eq 'simple_style') or ($style_type{$style} eq 'accent'))
            {
            }
            else
            {
                print STDERR "BUG: special $style while closing paragraph\n";
            }
        }
        # if not in a paragraph, the command is simply closed, and not recorded
        # in new_stack.
        my ($result, $command) = close_style_command($text, $stack, $state, $line_nr, '', (!$state->{'no_paragraph'}));
        add_prev($text, $stack, $result) if (defined($result));
    }

    if (!$state->{'paragraph_context'} and !$state->{'preformatted'} and defined($new_stack) and scalar(@$new_stack))
    { # in that case the $new_stack isn't recorded in $state->{'paragraph_macros'}
      # and therefore, it is lost
       msg_debug ("closing paragraph, but not in paragraph/preformatted, and new_stack not empty", $line_nr);
       dump_stack($text, $stack, $state);
    }
    my $top_stack = top_stack($stack);
    if ($top_stack and !defined($top_stack->{'format'}))
    { #debug
         msg_debug("Bug: no format on top stack", $line_nr);
         dump_stack($text, $stack, $state);
    }
    if ($top_stack and ($top_stack->{'format'} eq 'paragraph'))
    {
        my $paragraph = pop @$stack;
        add_prev($text, $stack, do_paragraph($paragraph->{'text'}, $state, $stack));
        $state->{'paragraph_macros'} = $new_stack;
        return 1;
    }
    elsif ($top_stack and ($top_stack->{'format'} eq 'preformatted') and !$no_preformatted_closing)
    {
        my $paragraph = pop @$stack;
        add_prev($text, $stack, do_preformatted($paragraph->{'text'}, $state, $stack));
        $state->{'paragraph_macros'} = $new_stack;
        return 1;
    }
    return;
}

sub abort_empty_preformatted($$)
{
    my $stack = shift;
    my $state = shift;
    if (@$stack and $stack->[-1]->{'format'} 
       and ($stack->[-1]->{'format'} eq 'preformatted')
       and ($stack->[-1]->{'text'} !~ /\S/))
    {
        if (defined($Texi2HTML::Config::empty_preformatted))
        {
           return if (&$Texi2HTML::Config::empty_preformatted($stack->[-1]->{'text'}));
        }
        pop @$stack;
    }
}

# for debugging
sub dump_stack($$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;

    if (defined($$text))
    {
        print STDERR "text: $$text\n";
    }
    else
    {
        print STDERR "text: UNDEF\n";
    }
    my $in_remove = 0;
    my $in_simple_format = 0;
    my $in_keep = 0;
    $in_keep = 1 if ($state->{'keep_texi'});
    if (!$in_keep)
    {
        $in_simple_format = 1 if ($state->{'simple_format'});
        $in_remove = 1 if ($state->{'remove_texi'}  and !$in_simple_format);
    }
    print STDERR "state(k${in_keep}s${in_simple_format}r${in_remove}): ";
    foreach my $key (keys(%$state))
    {
        my $value = 'UNDEF';
        $value = $state->{$key} if (defined($state->{$key}));
        print STDERR "$key: $value " if (!ref($value));
    }
    print STDERR "\n";
    my $stack_level = $#$stack + 1;
    while ($stack_level--)
    {
        print STDERR " $stack_level-> ";
        foreach my $key (keys(%{$stack->[$stack_level]}))
        {
            my $value = 'UNDEF';
            $value = $stack->[$stack_level]->{$key} if 
                (defined($stack->[$stack_level]->{$key}));
            print STDERR "$key: $value ";
        }
        print STDERR "\n";
    }
    if (defined($state->{'command_stack'})) 
    {
        print STDERR "command_stack: ";
        foreach my $style (@{$state->{'command_stack'}})
        {
            print STDERR "($style) ";
        }
        print STDERR "\n";
    }
    if (defined($state->{'region_lines'}))
    {
        print STDERR "region_lines($state->{'region_lines'}->{'number'}): $state->{'region_lines'}->{'format'}\n";
    }
    if (defined($state->{'paragraph_macros'}))
    {
        print STDERR "paragraph_macros: ";
        foreach my $style (@{$state->{'paragraph_macros'}})
        {
            print STDERR "($style->{'style'})";
        }
        print STDERR "\n";
    }
    if (defined($state->{'preformatted_stack'}))
    {
        print STDERR "preformatted_stack: ";
        foreach my $preformatted_style (@{$state->{'preformatted_stack'}})
        {
            if ($preformatted_style eq '')
            {
               print STDERR ".";
               next;
            }
            my $pre_style = '';
            $pre_style = $preformatted_style->{'pre_style'} if (exists $preformatted_style->{'pre_style'});
            my $class = '';
            $class = $preformatted_style->{'class'} if (exists $preformatted_style->{'class'});
            my $style = '';
            $style = $preformatted_style->{'style'} if (exists $preformatted_style->{'style'});
            print STDERR "($pre_style, $class,$style)";
        }
        print STDERR "\n";
    }
    if (defined($state->{'text_macro_stack'}) and @{$state->{'text_macro_stack'}})
    {
        print STDERR "text_macro_stack: (@{$state->{'text_macro_stack'}})\n";
    }
}

# for debugging 
sub print_elements($)
{
    my $elements = shift;
    foreach my $elem(@$elements)
    {
        if ($elem->{'node'})
        {
            print STDERR "node-> $elem ";
        }
        else
        {
            print STDERR "chap=> $elem ";
        }
        foreach my $key (keys(%$elem))
        {
            my $value = "UNDEF";
            $value = $elem->{$key} if (defined($elem->{$key}));
            print STDERR "$key: $value ";
        }
        print STDERR "\n";
    }
}

my @states_stack = ();

sub push_state($)
{
   my $new_state = shift;
   push @states_stack, $new_state;
   $Texi2HTML::THISDOC{'state'} = $new_state;
}

sub pop_state()
{
   pop @states_stack;
   if (@states_stack)
   {
       $Texi2HTML::THISDOC{'state'} = $states_stack[-1];
   }
   else
   {
       $Texi2HTML::THISDOC{'state'} = undef;
   }
}

sub substitute_line($$;$$)
{
    my $line = shift;
    my $context_string = shift;
    my $state = shift;
    my $line_nr = shift;
    $state = {} if (!defined($state));
    $state->{'no_paragraph'} = 1;
    print STDERR "BUG: substitute line with main state\n" if (($state->{'inside_document'} or $state->{'outside_document'}) and !$state->{'duplicated'});
    push @{$state->{'no_paragraph_stack'}}, $context_string;
    # this is usefull when called from &$I, and also for image files 
    return simple_format($state, [ $line_nr ], $context_string, $line) if ($state->{'simple_format'});
    return substitute_text($state, [ $line_nr ], $context_string, $line);
}

sub substitute_text($$$@)
{
    my $state = shift;
    my $line_nrs = shift;
    my $context = shift;
    my @stack = ();
    my $text = '';
    my $result = '';
    my $line_nr;
    if ($state->{'structure'})
    {
        initialise_state_structure($state);
    }
    elsif ($state->{'texi'})
    { # only in arg_expansion
        initialise_state_texi($state);
        msg_bug("substitute_text, 'texi' true but not 'arg_expansion'") if (!$state->{'arg_expansion'});
    }
    else
    {
#print STDERR "FILL_STATE substitute_text ($state->{'preformatted'}): @_\n";
        fill_state($state);
    }
    $state->{'spool'} = [];
    #print STDERR "SUBST_TEXT ".var_to_str($context)."\n";
    push_state($state);
    
    while (@_ or @{$state->{'spool'}} or $state->{'in_deff_line'})
    {
        my $line;
        if ($line_nrs)
        {
             $line_nr = shift @{$line_nrs};
        }
        if (@{$state->{'spool'}})
        {
             $line = shift @{$state->{'spool'}};
        }
        else
        {
            $line = shift @_;
        }
        # msg_debug ("SUBSTITUTE_TEXT $line", $line_nr) if (defined($line_nr));
        if ($state->{'in_deff_line'})
        {
            if (defined($line))
            {
                $line = $state->{'in_deff_line'} . $line;
            }
            else
            {
                $line = $state->{'in_deff_line'};
            }
            delete $state->{'in_deff_line'};
        }
        else
        {
            next unless (defined($line));
        }
        #{ my $p_line = $line; chomp($p_line); print STDERR "SUBST_TEXT $p_line\n"; }
        if ($state->{'structure'})
        {
            scan_structure ($line, \$text, \@stack, $state);
        }
        elsif ($state->{'texi'})
        {
            scan_texi ($line, \$text, \@stack, $state);
        }
        else
        {
            set_line_nr_in_stack($state, \@stack, $line_nr);
            scan_line($line, \$text, \@stack, $state, $line_nr);
        }
        next if (@stack);
        $result .= $text;
        $text = '';
    }
    if ($line_nrs and @{$line_nrs})
    {
        $line_nr = shift @{$line_nrs};
    }
    # close stack in substitute_text
    if ($state->{'texi'})
    {
        close_stack_texi(\$text, \@stack, $state, $line_nr);
    }
    elsif ($state->{'structure'})
    {
        close_stack_structure(\$text, \@stack, $state, $line_nr);
    }
    else
    {
        close_stack(\$text, \@stack, $state, $line_nr);
    }
    #print STDERR "SUBST_TEXT end\n";
    pop_state();
    return $result . $text;
}

sub print_lines($;$)
{
    my ($fh, $lines) = @_;
    $lines = $Texi2HTML::THIS_SECTION unless $lines;
    my @cnt;
    my $cnt;
    for my $line (@$lines)
    {
        print $fh $line;
	if (defined($Texi2HTML::Config::WORDS_IN_PAGE) and (Texi2HTML::Config::get_conf('SPLIT') eq 'node'))
        {
            @cnt = split(/\W*\s+\W*/, $line);
            $cnt += scalar(@cnt);
        }
    }
    return $cnt;
}

sub do_index_entry_label($$$$;$)
{
    my $command = shift;
    my $state = shift;
    my $line_nr = shift;
    my $entry_texi = shift;
    # this is only needed for definitions since the whole line is parsed to
    # reuse get_deff_index.
    my $line = shift;

    msg_debug("do_index_entry_label($command): Undefined entry_texi", $line_nr)
       if (!defined($entry_texi));
    # FIXME 
    #$entry_texi = trim_around_spaces($entry_texi);
    $entry_texi = trim_comment_spaces($entry_texi, "index label in \@$command", $line_nr);

    # index entries are not entered in special regions
    my $region = 'document';
    $region = $state->{'region'} if ($state->{'region'});

    my $entry;
    # Can be within a listoffloat.
    if ($region eq 'document' or defined($region_lines{$region}))
    {
       # index entry on a line that is not searched for index entries, like
       # a @def* line
       if (!defined($Texi2HTML::THISDOC{'index_entries'}->{$region}) or !defined( $Texi2HTML::THISDOC{'index_entries'}->{$region}->{$entry_texi}))
       {
          line_warn("Index entry not caught: `$entry_texi' in $region", $line_nr);
       }
       else
       {
          my $entry_ref = $Texi2HTML::THISDOC{'index_entries'}->{$region}->{$entry_texi};
          # ============================ debug
          if (!defined($entry_ref->{'entries'}))
          {
              line_warn("BUG, not defined: {'index_entries'}->{$region}->{$entry_texi}->{'entries'}", $line_nr);
          }
          # ============================  end debug
          if (scalar(@{$entry_ref->{'entries'}}) > 1)
          {
              if (!defined($entry_ref->{'index'}))
              {
                  $entry_ref->{'index'} = 0;
              }
              $entry = $entry_ref->{'entries'}->[$entry_ref->{'index'}];
              $entry_ref->{'index'}++;
          }
          else
          {
              $entry = $entry_ref->{'entries'}->[0];
          }
          ############################################# debug
          # verify that the old way of getting index entries (in an array) is
          # synchronized with the document
          if (!$state->{'region'})
          {
             my $entry_from_array = shift @index_labels;
             if ($entry_from_array ne $entry)
             {
                line_warn ("entry `$entry->{'texi'}' ne entry_from_array `$entry_from_array->{'texi'}'", $line_nr);
             }
             if (!defined($entry_from_array))
             {
                line_warn ("Not enough index entries !", $line_nr);
             }
          }
          ############################################# end debug
       }
    }
    if (!defined($entry))
    {
        #print STDERR "Index entry in output not gathered in usual places ($region)\n";
        # this can happen for listoffloats and caption without being a user 
        # error. Well, in fact, it could be argued that it is indeed a user
        # error, putting an index entry in a snippet that can be expanded
        # more than once and is not strictly associated with a node/section.

        my $prefix = index_entry_command_prefix($command, $line, $line_nr);
        my $index_name = undef;
        $index_name = $index_prefix_to_name{$prefix} if ($prefix ne '');
        # FIXME 'entry' could be @code{$entry_texi}
        $entry = {
          'command' => $command,
          'texi' => $entry_texi,
          'entry' => $entry_texi,
          'prefix' => $prefix,
          'index_name' => $index_name,
        };
        $entry->{'key'} = remove_texi($entry_texi);
    }
#    return '' if ($state->{'multiple_pass'} or $state->{'outside_document'});
    if ($command ne $entry->{'command'})
    {
        # happened with bad texinfo with a line like
        # @deffn func aaaa args  @defvr c--ategory d--efvr_name
        # now this case is caught above by "Index entry not caught:
        line_warn ("($region) Waiting for index cmd \@$entry->{'command'} got \@$command", $line_nr);
    }
    if ($entry->{'texi'} ne $entry_texi)
    {
        line_warn ("Waiting for index `$entry->{'texi'}', got `$entry_texi'", $line_nr);
    }
    
    my $index_name = $index_prefix_to_name{$entry->{'prefix'}};
    # =========== debug
    my $id = 'no id';
    $id = $entry->{'id'} if (defined($entry->{'id'}));
    print STDERR "(index($index_name) $command) [$entry->{'entry'}] $entry->{'id'}\n"
        if ($T2H_DEBUG & $DEBUG_INDEX);
    # =========== end debug
    #return (undef,'','') if ($state->{'region'});
    if ($entry->{'key'} =~ /^\s*$/)
    {
        line_warn("Empty index entry for \@$command",$entry->{'line_nr'});
    }
    my $formatted_entry = substitute_line($entry->{'entry'}, "\@$command", prepare_state_multiple_pass("${command}_index", $state),$entry->{'line_nr'});
    my $formatted_entry_reference = substitute_line($entry->{'texi'}, "\@$command", prepare_state_multiple_pass("${command}_index", $state));
    return ($entry, $formatted_entry, &$Texi2HTML::Config::index_entry_label ($entry->{'id'}, $state->{'preformatted'}, $formatted_entry, 
      $index_name,
       $command, $entry->{'texi'}, $formatted_entry_reference, $entry)); 
}

# decompose a decimal number on a given base. The algorithm looks like
# the division with growing powers (division suivant les puissances
# croissantes) ?
sub decompose($$)
{  
    my $number = shift;
    my $base = shift;
    my @result = ();

    return (0) if ($number == 0);
    my $power = 1;
    my $remaining = $number;

    while ($remaining)
    {
         my $factor = $remaining % ($base ** $power);
         $remaining -= $factor;
         push (@result, $factor / ($base ** ($power - 1)));
         $power++;
    }
    return @result;
}

# process a css file
sub process_css_file ($$)
{
    my $fh =shift;
    my $file = shift;
    my $in_rules = 0;
    my $in_comment = 0;
    my $in_import = 0;
    my $in_string = 0;
    my $rules = [];
    my $imports = [];
    while (my $line = <$fh>)
    {
	    #print STDERR "Line: $line";
        if ($in_rules)
        {
            push @$rules, $line;
            next;
        }
        my $text = '';
        while (1)
        { 
		#sleep 1;
		#print STDERR "${text}!in_comment $in_comment in_rules $in_rules in_import $in_import in_string $in_string: $line";
             if ($in_comment)
             {
                 if ($line =~ s/^(.*?\*\/)//)
                 {
                     $text .= $1;
                     $in_comment = 0;
                 }
                 else
                 {
                     push @$imports, $text . $line;
                     last;
                 }
             }
             elsif (!$in_string and $line =~ s/^\///)
             { # what do '\' do here ?
                 if ($line =~ s/^\*//)
                 {
                     $text .= '/*';
                     $in_comment = 1;
                 }
                 else
                 {
                     push (@$imports, $text. "\n") if ($text ne '');
                     push (@$rules, '/' . $line);
                     $in_rules = 1;
                     last;
                 }
             }
             elsif (!$in_string and $in_import and $line =~ s/^([\"\'])//)
             { # strings outside of import start rules
                 $text .= "$1";
                 $in_string = quotemeta("$1");
             }
             elsif ($in_string and $line =~ s/^(\\$in_string)//)
             {
                 $text .= $1;
             }
             elsif ($in_string and $line =~ s/^($in_string)//)
             {
                 $text .= $1;
                 $in_string = 0;
             }
             elsif ((! $in_string and !$in_import) and ($line =~ s/^([\\]?\@import)$// or $line =~ s/^([\\]?\@import\s+)//))
             {
                 $text .= $1;
                 $in_import = 1;
             }
             elsif (!$in_string and $in_import and $line =~ s/^\;//)
             {
                 $text .= ';';
                 $in_import = 0;
             }
             elsif (($in_import or $in_string) and $line =~ s/^(.)//)
             {
                  $text .= $1;
             }
             elsif (!$in_import and $line =~ s/^([^\s])//)
             { 
                  push (@$imports, $text. "\n") if ($text ne '');
                  push (@$rules, $1 . $line);
                  $in_rules = 1;
                  last;
             }
             elsif ($line =~ s/^(\s)//)
             {
                  $text .= $1;
             }
             elsif ($line eq '')
             {
                  push (@$imports, $text);
                  last;
             }
        } 
    }
    file_line_warn ("string not closed in css file", $file) if ($in_string);
    file_line_warn ("comment not closed in css file", $file) if ($in_comment);
    file_line_warn ("\@import not finished in css file", $file)  if ($in_import and !$in_comment and !$in_string);
    return ($imports, $rules);
}

sub collect_all_css_files()
{
   my @css_import_lines;
   my @css_rule_lines;

  # process css files
   foreach my $file (@Texi2HTML::Config::CSS_FILES)
   {
      my $css_file_fh;
      my $css_file;
      if ($file eq '-')
      {
         $css_file_fh = \*STDIN;
         $css_file = '-';
      }
      else
      {
         $css_file = locate_include_file ($file);
         unless (defined($css_file))
         {
            document_warn ("css file $file not found");
            next;
         }
         unless (open (CSSFILE, "$css_file"))
         {
            document_warn ("Cannot open ${css_file}: $!");
            next;
         }
         $css_file_fh = \*CSSFILE;
      }
      my ($import_lines, $rules_lines);
      ($import_lines, $rules_lines) = process_css_file ($css_file_fh, $css_file);
      push @css_import_lines, @$import_lines;
      push @css_rule_lines, @$rules_lines;
   }


   if ($T2H_DEBUG & $DEBUG_USER)
   {
      if (@css_import_lines)
      {
         print STDERR "# css import lines\n";
         foreach my $line (@css_import_lines)
         {
            print STDERR "$line";
         }
      }
      if (@css_rule_lines)
      {
         print STDERR "# css rule lines\n";
         foreach my $line (@css_rule_lines)
         {
            print STDERR "$line";
         }
      }
   }
   return (\@css_import_lines, \@css_rule_lines);
}

sub init_with_file_name($)
{
   my $base_file = shift;
   set_docu_names($base_file, $Texi2HTML::THISDOC{'input_file_number'});

   foreach my $handler(@Texi2HTML::Config::command_handler_init)
   {
      &$handler;
   }
}


#######################################################################
#
# Main processing, process all the files given on the command line
#
#######################################################################

my @input_files = @ARGV;
# use STDIN if not a tty, like makeinfo does
@input_files = ('-') if (!scalar(@input_files) and !-t STDIN);
die "$0: missing file argument.\n$T2H_FAILURE_TEXT" unless (scalar(@input_files) >= 1);

my $file_number = 0;
# main processing
while(@input_files)
{
   my $input_file_arg = shift(@input_files);

   %Texi2HTML::THISDOC = ();
   $Texi2HTML::THIS_ELEMENT = undef;

   # Otherwise Texi2HTML::THISDOC wouldn't be set in case there was no call
   # to set_conf.
   foreach my $global_conf_vars('SPLIT', 'SPLIT_SIZE')
   {
      $Texi2HTML::THISDOC{$global_conf_vars} = Texi2HTML::Config::get_conf($global_conf_vars);
   }

   foreach my $global_key (keys(%Texi2HTML::GLOBAL))
   {
      $Texi2HTML::THISDOC{$global_key} = $Texi2HTML::GLOBAL{$global_key};
   }

   my $input_file_name;
   # try to concatenate with different suffixes. The last suffix is ''
   # such that the plain file name is checked.
   foreach my $suffix (@Texi2HTML::Config::INPUT_FILE_SUFFIXES)
   {
      $input_file_name = $input_file_arg.$suffix if (-e $input_file_arg.$suffix);
   }
   # in case no file was found, still set the file name
   $input_file_name = $input_file_arg if (!defined($input_file_name));

   $Texi2HTML::THISDOC{'input_file_name'} = $input_file_name;
   $Texi2HTML::THISDOC{'input_file_number'} = $file_number;
   $Texi2HTML::THISDOC{'input_directory'} = '.';
   if ($input_file_name =~ /(.*\/)/)
   {
      $Texi2HTML::THISDOC{'input_directory'} = $1;
   }

   my $input_file_base = $input_file_name;
   $input_file_base =~ s/\.te?x(i|info)?$//;

   @{$Texi2HTML::TOC_LINES} = ();            # table of contents
   @{$Texi2HTML::OVERVIEW} = ();           # short table of contents
   # this could be done here, but perl warns that 
   # `"Texi2HTML::TITLEPAGE" used only once' and it is reset in 
   # &$Texi2HTML::Config::titlepage anyway
   # $Texi2HTML::TITLEPAGE = undef;        
   @{$Texi2HTML::THIS_SECTION} = ();

   # the reference to these hashes may be used before this point (for example
   # see makeinfo.init), so they should be kept as is and the values undef
   # but the key should not be deleted because the ref is on the key.
   foreach my $hash (\%Texi2HTML::HREF, \%Texi2HTML::NAME, \%Texi2HTML::NODE,
        \%Texi2HTML::NO_TEXI, \%Texi2HTML::SIMPLE_TEXT)
   {
       foreach my $key (keys(%$hash))
       {
           $hash->{$key} = undef;
       }
   }
   @created_directories = ();

   $docu_dir = undef;    # directory of the document
   $docu_name = undef;   # basename of the document
   $docu_rdir = undef;   # directory for the output
   $docu_toc = undef;    # document's table of contents
   $docu_stoc = undef;   # document's short toc
   $docu_foot = undef;   # document's footnotes
   $docu_about = undef;  # about this document
   $docu_top = undef;    # document top
   $docu_doc = undef;    # document (or document top of split)
   $docu_frame = undef;  # main frame file
   $docu_toc_frame = undef;       # toc frame file
   $path_to_working_dir = undef;  # relative path leading to the working 
                                  # directory from the document directory
   $docu_doc_file = undef;
   $docu_toc_file = undef;
   $docu_stoc_file = undef;
   $docu_foot_file = undef;
   $docu_about_file = undef;
   $docu_top_file = undef;
   $docu_frame_file = undef;
   $docu_toc_frame_file = undef;

   if (!$Texi2HTML::Config::USE_SETFILENAME)
   {
      init_with_file_name ($input_file_base);
   }

   # FIXME when to do that?
   ($Texi2HTML::THISDOC{'css_import_lines'}, $Texi2HTML::THISDOC{'css_lines'}) 
      = collect_all_css_files();

   %region_lines = ();
   %region_line_nrs = ();
   foreach my $region (@special_regions)
   {
      $region_lines{$region} = [];
      $region_line_nrs{$region} = [];
   }

   texinfo_initialization(0);

   print STDERR "# reading from $input_file_name\n" if $T2H_VERBOSE;

   $macros = undef;         # macros. reference on a hash
   %info_enclose = ();      # macros defined with definfoenclose
   @floats = ();            # floats list
   %floats = ();            # floats by style
   %nodes = ();             # nodes hash. The key is the texi node name
   %cross_reference_nodes = ();  # normalized node names arrays


   my ($texi_lines, $first_texi_lines, $lines_numbers) 
        = pass_texi($input_file_name);

   if ($Texi2HTML::Config::USE_SETFILENAME and !defined($docu_name))
   {
      init_with_file_name ($input_file_base);
   }

   Texi2HTML::Config::t2h_default_set_out_encoding();
   dump_texi($texi_lines, 'texi', $lines_numbers) if ($T2H_DEBUG & $DEBUG_TEXI);
   if (defined($Texi2HTML::Config::MACRO_EXPAND))
   {
       my @texi_lines = (@$first_texi_lines, @$texi_lines);
       dump_texi(\@texi_lines, '', undef, $Texi2HTML::Config::MACRO_EXPAND);
   }

   %content_element = ();
   foreach my $command('contents', 'shortcontents')
   {
       $all_content_elements{$command} = [];
       foreach my $key (keys(%{$reference_content_element{$command}}))
       {
           $content_element{$command}->{$key} = $reference_content_element{$command}->{$key};
       }
   }

   %sec2level = %reference_sec2level;

   $element_before_anything =
   { 
      'before_anything' => 1,
      'place' => [],
      'texi' => 'VIRTUAL ELEMENT BEFORE ANYTHING',
   };


   $footnote_element = 
   { 
      'id' => $Texi2HTML::Config::misc_pages_targets{'Footnotes'},
      'target' => $Texi2HTML::Config::misc_pages_targets{'Footnotes'},
      'file' => $docu_foot,
      'footnote' => 1,
      'place' => [],
   };

   %region_initial_state = ();
   foreach my $region (@special_regions)
   {
      $region_initial_state{$region} = { };
   }

# to determine if a command has to be processed the following are interesting 
# (and can be faked):
# 'region': the name of the special region we are processing
# 'region_pass': the number of passes in that specific region (both outside
#                of the main document, and in the main document)
# 'multiple_pass': the number of pass in the formatting of the region in the
#                  main document
# 'outside_document': set to 1 if outside of the main document formatting
   foreach my $key (keys(%region_initial_state))
   {
      $region_initial_state{$key}->{'multiple_pass'} = -1;
      $region_initial_state{$key}->{'region_pass'} = 0;
      $region_initial_state{$key}->{'num_head'} = 0;
      $region_initial_state{$key}->{'foot_num'} = 0;
      $region_initial_state{$key}->{'relative_foot_num'} = 0;
      $region_initial_state{$key}->{'region'} = $key;
   }

   @opened_files = (); # all the files opened by the program to remove
                       # them if FORCE is not set and an error occured

   texinfo_initialization(1);

    
   $no_element_associated_place = [];

   $document_idx_num = 0;
   $document_sec_num = 0;
   $document_head_num = 0;
   $document_anchor_num = 0;

   @nodes_list = ();        # nodes in document reading order
                            # each member is a reference on a hash
   @sections_list = ();     # sections in reading order
                            # each member is a reference on a hash
   @all_elements = ();      # sectionning elements (nodes and sections)
                            # in reading order. Each member is a reference
                            # on a hash which also appears in %nodes,
                            # @sections_list @nodes_list, @elements_list
   @elements_list = ();     # all the resulting elements in document order
   %sections = ();          # sections hash. The key is the section number
   %headings = ();          # headings hash. The key is the heading number
   $section_top = undef;    # @top section
   $element_top = undef;    # Top element
   $node_top = undef;       # Top node
   $node_first = undef;     # First node
   $element_index = undef;  # element with first index
   $element_chapter_index = undef;  # chapter with first index
   $element_first = undef;  # first element
   $element_last = undef;   # last element
   %special_commands = ();  # hash for the commands specially handled 
                            # by the user

   @index_labels = ();             # array corresponding with @?index commands
                                   # constructed during pass_texi, used to
                                   # put labels in pass_text
                                   # right now it is only used for debugging
                                   # purposes.
   %{$Texi2HTML::THISDOC{'index_entries_array'}} = (); # holds the index 
                              # entries in order of appearance in the document
                              # for each index name.
   %{$Texi2HTML::THISDOC{'index_letters_array'}} = (); # holds the sorted
                            # index letters for each index name. The sorted
                            # letters hold the sorted index entries

   my ($doc_lines, $doc_numbers) = pass_structure($texi_lines, $lines_numbers);
   if ($T2H_DEBUG & $DEBUG_TEXI)
   {
      dump_texi($doc_lines, 'first', $doc_numbers);
      if (defined($Texi2HTML::Config::MACRO_EXPAND and $Texi2HTML::Config::DUMP_TEXI))
      {
          my @all_doc_lines = (@$first_texi_lines, @$doc_lines);
          #push (@$doc_lines, "\@bye\n");
          dump_texi(\@all_doc_lines, '', undef, $Texi2HTML::Config::MACRO_EXPAND . ".first");
      }
   }
   # makeinfo also expands the format normally
   next if ($Texi2HTML::Config::DUMP_TEXI);# or defined($Texi2HTML::Config::MACRO_EXPAND));

   foreach my $style (keys(%special_commands))
   {
      $special_commands{$style}->{'max'} = $special_commands{$style}->{'count'};
   }

   %files = ();   # keys are files. This is used to avoid reusing an already
                  # used file name
   %printed_indices = (); # value is true for an index name not empty and
                          # printed
   prepare_indices();
   rearrange_elements();
   do_names();

#Texi2HTML::LaTeX2HTML::latex2html();
   foreach my $handler(@Texi2HTML::Config::command_handler_process)
   {
       &$handler;
   }

# maybe do that later to have more elements ready?
   &$Texi2HTML::Config::toc_body(\@sections_list);

   &$Texi2HTML::Config::css_lines($Texi2HTML::THISDOC{'css_import_lines'}, 
        $Texi2HTML::THISDOC{'css_lines'});


   $global_head_num = 0;       # heading index. it is global for the main doc, 
                               # and taken from the state if in multiple_pass.
   $global_foot_num = 0;
   $global_relative_foot_num = 0;
   @foot_lines = ();           # footnotes
   $copying_comment = '';      # comment constructed from text between
                               # @copying and @end copying with licence
   %acronyms_like = ();        # acronyms or similar commands associated texts
                               # the key are the commands, the values are
                               # hash references associating shorthands to
                               # texts.
   @states_stack = ();

   pass_text($doc_lines, $doc_numbers);
   print STDERR "BUG: " . scalar(@index_labels) . " index entries pending\n" 
      if (scalar(@index_labels));
   foreach my $special (keys(%special_commands))
   {
      my $count = $special_commands{$special}->{'count'};
      if (($count != 0) and $T2H_VERBOSE)
      {
         document_warn ("$count special \@$special were not processed.\n");
      }
   }
   if ($Texi2HTML::Config::IDX_SUMMARY)
   {
      foreach my $entry (keys(%index_names))
      {
         do_index_summary_file($entry, $docu_name);
      }
   }
   if (defined($Texi2HTML::Config::INTERNAL_LINKS))
   {
      my $FH = open_out($Texi2HTML::Config::INTERNAL_LINKS);
      &$Texi2HTML::Config::internal_links($FH, \@elements_list, $Texi2HTML::THISDOC{'index_letters_array'});
      close ($FH);
   }
   do_node_files() if ($Texi2HTML::Config::NODE_FILES);
#l2h_FinishFromHtml() if ($Texi2HTML::Config::L2H);
#l2h_Finish() if($Texi2HTML::Config::L2H);
#Texi2HTML::LaTeX2HTML::finish();
   foreach my $handler(@Texi2HTML::Config::command_handler_finish)
   {
       &$handler;
   }
   &$Texi2HTML::Config::finish_out();

   print STDERR "# File ($file_number) $input_file_name processed\n" if $T2H_VERBOSE;
   $file_number++;
}
print STDERR "# that's all folks\n" if $T2H_VERBOSE;
exit(0);


##############################################################################

# These next few lines are legal in both Perl and nroff.

.00 ;                           # finish .ig

'di			\" finish diversion--previous line must be blank
.nr nl 0-1		\" fake up transition to first page again
.nr % 0			\" start at page 1
'; __END__ ############# From here on it's a standard manual page ############
    .so @mandir@/man1/texi2html.1
