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
# used to find a relative path back to the current working directory
use File::Spec;

#
# According to
# larry.jones@sdrc.com (Larry Jones)
# this pragma is not present in perl5.004_02:
#
# Perl pragma to control optional warnings
# use warnings;

#++##########################################################################
#
# NOTE FOR DEBUGGING THIS SCRIPT:
# You can run 'perl texi2html.pl' directly, provided you have
# the environment variable T2H_HOME set to the directory containing
# the texi2html.init, T2h_i18n.pm, translations.pl, l2h.init, 
# T2h_l2h.pm files
#
#--##########################################################################

# CVS version:
# $Id: texi2html.pl,v 1.193 2007-10-04 11:47:56 pertusus Exp $

# Homepage:
my $T2H_HOMEPAGE = "http://www.nongnu.org/texi2html/";

# Authors (appears in comments):
my $T2H_AUTHORS = <<EOT;
Written by: Lionel Cons <Lionel.Cons\@cern.ch> (original author)
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

my $ERROR = "***";                 # prefix for errors
my $WARN  = "**";                  # prefix for warnings

my $VARRE = '[\w\-]+';          # RE for a variable name
my $NODERE = '[^:]+';             # RE for node names

my $MAX_LEVEL = 4;
my $MIN_LEVEL = 1;

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


sub load($) 
{
    my $file = shift;
    eval { require($file) ;};
    if ($@ ne '')
    {
        print STDERR "error loading $file: $@\n";
        return 0;
    }
    return 1;
}

# customization options variables

use vars qw(
$DEBUG
$PREFIX
$VERBOSE
$SUBDIR
$IDX_SUMMARY
$SPLIT
$SHORT_REF
@EXPAND
$EXPAND
$TOP
$DOCTYPE 
$FRAMESET_DOCTYPE 
$CHECK 
$TEST 
$DUMP_TEXI
$MACRO_EXPAND
$USE_GLOSSARY 
$INVISIBLE_MARK 
$USE_ISO 
$TOP_FILE 
$TOC_FILE
$FRAMES
$SHOW_MENU
$NUMBER_SECTIONS
$USE_NODES
$USE_UNICODE
$USE_UNIDECODE
$TRANSLITERATE_NODE
$NODE_FILES
$NODE_NAME_IN_MENU
$AVOID_MENU_REDUNDANCY
$SECTION_NAVIGATION
$SHORTEXTN 
$EXTENSION
$OUT 
$NOVALIDATE
$DEF_TABLE 
$LANG 
$DO_CONTENTS
$DO_SCONTENTS
$SEPARATED_FOOTNOTES
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
$AFTER_BODY_OPEN
$PRE_BODY_CLOSE
$EXTRA_HEAD
$VERTICAL_HEAD_NAVIGATION
$WORDS_IN_PAGE
$ICONS
$UNNUMBERED_SYMBOL_IN_MENU
$SIMPLE_MENU
$MENU_SYMBOL
$OPEN_QUOTE_SYMBOL
$CLOSE_QUOTE_SYMBOL
$TOC_LIST_STYLE
$TOC_LIST_ATTRIBUTE
$TOP_NODE_FILE
$TOP_NODE_UP
$NODE_FILE_EXTENSION
$BEFORE_OVERVIEW
$AFTER_OVERVIEW
$BEFORE_TOC_LINES
$AFTER_TOC_LINES
$NEW_CROSSREF_STYLE
$USER
$USE_NUMERIC_ENTITY
$DATE
%ACTIVE_ICONS
%NAVIGATION_TEXT
%PASSIVE_ICONS
%BUTTONS_NAME
%BUTTONS_GOTO
%BUTTONS_EXAMPLE
@CHAPTER_BUTTONS
@MISC_BUTTONS
@SECTION_BUTTONS
@SECTION_FOOTER_BUTTONS
@NODE_FOOTER_BUTTONS
@IMAGE_EXTENSIONS
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
$button_icon_img
$print_navigation
$about_body
$print_frame
$print_toc_frame
$toc_body
$titlepage
$css_lines
$print_redirection_page
$translate_names
$init_out
$finish_out
$node_file_name
$element_file_name
$inline_contents

$protect_text
$anchor
$def_item
$def
$menu
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
$paragraph
$preformatted
$foot_line_and_ref
$foot_section
$address
$image
$image_files
$index_entry_label
$index_entry
$index_letter
$print_index
$index_summary
$summary_letter
$complex_format
$cartouche
$sp
$definition_category
$table_list
$copying_comment
$index_summary_file_entry
$index_summary_file_end
$index_summary_file_begin
$style
$format
$normal_text
$empty_line
$unknown
$unknown_style
$float
$caption_shortcaption
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
%command_type
%paragraph_style
%things_map
%pre_map
%texi_map
%unicode_map
%unicode_diacritical
%transliterate_map 
%transliterate_accent_map
%no_transliterate_map
%ascii_character_map
%ascii_simple_map
%ascii_things_map
%numeric_entity_map
%perl_charset_to_html
%iso_symbols
%misc_command
%css_map
%format_in_paragraph
%special_list_commands
%accent_letters
%unicode_accents
%special_accents
@command_handler_init
@command_handler_process
@command_handler_finish
%command_handler
);

# needed in this namespace for translations
$I = \&Texi2HTML::I18n::get_string;

#
# Function refs covered by the GPL as part of the texi2html.pl original
# code. As such they cannot appear in texi2html.init which is public 
# domain (at least the things coded by me, and, if I'm not wrong also the 
# things coded by Olaf -- Pat).
#

$toc_body                 = \&T2H_GPL_toc_body;
$style                    = \&T2H_GPL_style;
$format                   = \&T2H_GPL_format;

sub T2H_GPL_toc_body($)
{
    my $elements_list = shift;
    return unless ($DO_CONTENTS or $DO_SCONTENTS or $FRAMES);
    my $current_level = 0;
    my $ul_style = $NUMBER_SECTIONS ? $TOC_LIST_ATTRIBUTE : ''; 
    foreach my $element (@$elements_list)
    {
        next if ($element->{'top'} or $element->{'index_page'});
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
                push(@{$Texi2HTML::TOC_LINES}, $ln);
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
                push(@{$Texi2HTML::TOC_LINES}, "$line\n");
                
            }
        }
        else
        {
            push(@{$Texi2HTML::TOC_LINES}, "</li>\n");
        }
        my $file = '';
        $file = $element->{'file'} if ($SPLIT);
        my $text = $element->{'text'};
        #$text = $element->{'name'} unless ($NUMBER_SECTIONS);
        my $entry = "<li>" . &$anchor ($element->{'tocid'}, "$file#$element->{'id'}",$text);
        push (@{$Texi2HTML::TOC_LINES}, $ind . $entry);
        push(@{$Texi2HTML::OVERVIEW}, $entry. "</li>\n") if ($level == 1);
    }
    while (0 < $current_level)
    {
        $current_level--;
        my $ind = '  ' x $current_level;
        push(@{$Texi2HTML::TOC_LINES}, "</li>\n$ind</ul>\n");
    }
    @{$Texi2HTML::TOC_LINES} = () unless ($DO_CONTENTS);
    if (@{$Texi2HTML::TOC_LINES})
    {
        unshift @{$Texi2HTML::TOC_LINES}, $BEFORE_TOC_LINES;
        push @{$Texi2HTML::TOC_LINES}, $AFTER_TOC_LINES;
    }
    @{$Texi2HTML::OVERVIEW} = () unless ($DO_SCONTENTS or $FRAMES);
    if (@{$Texi2HTML::OVERVIEW})
    {
        unshift @{$Texi2HTML::OVERVIEW}, "<ul${ul_style}>\n";
        push @{$Texi2HTML::OVERVIEW}, "</ul>\n";
        unshift @{$Texi2HTML::OVERVIEW}, $BEFORE_OVERVIEW;
        push @{$Texi2HTML::OVERVIEW}, $AFTER_OVERVIEW;
    }
}

sub T2H_GPL_style($$$$$$$$$)
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

    my $do_quotes = 0;
    my $use_attribute = 0;
    my $use_begin_end = 0;
    if (ref($style) eq 'HASH')
    {
        #print STDERR "GPL_STYLE $command ($style)\n";
        #print STDERR " @$args\n";
        $do_quotes = $style->{'quote'};
        if ((@{$style->{'args'}} == 1) and defined($style->{'attribute'}))
        {
            $style = $style->{'attribute'};
            $use_attribute = 1;
            $text = $args->[0];
        }
        elsif (defined($style->{'function'}))
        {
            $text = &{$style->{'function'}}($command, $args, $style_stack, $state, $line_nr);
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

# leave this within comments, and keep the require statement
# This way, you can directly run texi2html.pl, if 
# $ENV{T2H_HOME}/texi2html.init exists.

# @INIT@

require "$ENV{T2H_HOME}/texi2html.init" 
    if ($0 =~ /\.pl$/ &&
        -e "$ENV{T2H_HOME}/texi2html.init" && -r "$ENV{T2H_HOME}/texi2html.init");

my $translation_file = 'translations.pl'; # file containing all the translations
my $T2H_OBSOLETE_STRINGS;

# leave this within comments, and keep the require statement
# This way, you can directly run texi2html.pl, 
# if $ENV{T2H_HOME}/translations.pl exists.
#
# @T2H_TRANSLATIONS_FILE@

require "$ENV{T2H_HOME}/$translation_file"
    if ($0 =~ /\.pl$/ &&
        -e "$ENV{T2H_HOME}/$translation_file" && -r "$ENV{T2H_HOME}/$translation_file");

#
# Some functions used to override normal formatting functions in specific 
# cases. The user shouldn't want to change them, but can use them.
#

# used to utf8 encode the result
sub t2h_utf8_accent($$$)
{
    my $accent = shift;
    my $args = shift;
    my $style_stack = shift;
  
    my $text = $args->[0];
    #print STDERR "$accent\[".scalar(@$style_stack) ."\] (@$style_stack)\n"; 

    # special handling of @dotless{i}
    if ($accent eq 'dotless')
    { 
        if (($text eq 'i') and (!defined($style_stack->[-1]) or (!defined($unicode_accents{$style_stack->[-1]})) or ($style_stack->[-1] eq 'tieaccent')))
        {
             return "\x{0131}";
        }
        #return "\x{}" if ($text eq 'j'); # not found !
        return $text;
    }
        
    # FIXME \x{0131}\x{0308} for @dotless{i} @" doesn't lead to NFC 00ef.
    return Unicode::Normalize::NFC($text . chr(hex($unicode_diacritical{$accent}))) 
        if (defined($unicode_diacritical{$accent}));
    return ascii_accents($text, $accent);
}

sub t2h_utf8_normal_text($$$$$)
{
    my $text = shift;
    my $in_raw_text = shift;
    my $in_preformatted = shift;
    my $in_code = shift;
    my $in_simple = shift;
    my $style_stack = shift;

    $text = &$protect_text($text) unless($in_raw_text);
    $text = uc($text) if (in_small_caps($style_stack));

    if (!$in_code and !$in_preformatted)
    {
        $text =~ s/---/\x{2014}/g;
        $text =~ s/--/\x{2013}/g;
        $text =~ s/``/\x{201C}/g;
        $text =~ s/''/\x{201D}/g;
    }
    return Unicode::Normalize::NFC($text);
}

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

    # if there is no unicode support, we do all the transformations here
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
             if (exists($ascii_character_map{$1}))
             {
                 $result .= '_' . lc($ascii_character_map{$1});
             }
             else
             { # wild guess that should work for latin1
                  $result .= '_' . '00' . lc(sprintf("%02x",ord($1)));
             }
        }
        else
        {
             print STDERR "Bug: unknown character in cross ref (likely in infinite loop)\n";
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
%predefined_index
%valid_index
%sec2level
%code_style_map
%region_lines
%forbidden_index_name
);

# Some global variables are set in the script, and used in the subroutines
# they are in the Texi2HTML namespace, thus prefixed with Texi2HTML::.
# see texi2html.init for details.

#+++############################################################################
#                                                                              #
# Initialization                                                               #
# Pasted content of File $(srcdir)/MySimple.pm: Command-line processing        #
#                                                                              #
#---############################################################################

# leave this within comments, and keep the require statement
# This way, you can directly run texi2html.pl, if $ENV{T2H_HOME}/texi2html.init
# exists.

# @MYSIMPLE@

require "$ENV{T2H_HOME}/MySimple.pm"
    if ($0 =~ /\.pl$/ &&
        -e "$ENV{T2H_HOME}/MySimple.pm" && -r "$ENV{T2H_HOME}/MySimple.pm");

#+++########################################################################
#                                                                          #
# Initialization                                                           #
# Pasted content of File $(srcdir)/T2h_i18n.pm: Internationalisation       #
#                                                                          #
#---########################################################################

# leave this within comments, and keep the require statement
# This way, you can directly run texi2html.pl, if $ENV{T2H_HOME}/T2h_i18n.pm
# exists.

# @T2H_I18N@
require "$ENV{T2H_HOME}/T2h_i18n.pm"
    if ($0 =~ /\.pl$/ &&
        -e "$ENV{T2H_HOME}/T2h_i18n.pm" && -r "$ENV{T2H_HOME}/T2h_i18n.pm");


#########################################################################
#
# latex2html stuff
#
#---######################################################################

{
# leave this within comments, and keep the require statement
# This way, you can directly run texi2html.pl, if $ENV{T2H_HOME}/T2h_l2h.pm
# exists.

# @T2H_L2H@


require "$ENV{T2H_HOME}/T2h_l2h.pm"
    if ($0 =~ /\.pl$/ &&
        -e "$ENV{T2H_HOME}/T2h_l2h.pm" && -r "$ENV{T2H_HOME}/T2h_l2h.pm");

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
# pre-defined indices
#

my %index_prefix_to_name = ();

%index_names =
(
 'cp' => { 'prefix' => ['cp','c']},
 'fn' => { 'prefix' => ['fn', 'f'], code => 1},
 'vr' => { 'prefix' => ['vr', 'v'], code => 1},
 'ky' => { 'prefix' => ['ky', 'k'], code => 1},
 'pg' => { 'prefix' => ['pg', 'p'], code => 1},
 'tp' => { 'prefix' => ['tp', 't'], code => 1}
);

foreach my $name(keys(%index_names))
{
    foreach my $prefix (@{$index_names{$name}->{'prefix'}})
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
'This', 'NodeUp', 'NodePrev', 'NodeNext', 'Following' );
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
%sec2level = (
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
    foreach my $command (keys (%sec2level))
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
        $level2sec{$command}->[$sec2level{$command}] = $command;
    }
}

# this are synonyms
$sec2level{'appendixsection'} = 2;
# sec2level{'majorheading'} is also 1 and not 0
$sec2level{'majorheading'} = 1;
$sec2level{'chapheading'} = 1;
$sec2level{'centerchap'} = 1;

# sction to level hash not taking into account raise and lower sections
my %reference_sec2level = %sec2level;

# regions treated especially. The text for these regions is collected in the
# corresponding array 
%region_lines = (
          'titlepage'            => [ ],
          'documentdescription'  => [ ],
          'copying'              => [ ],
);

# those macros aren't considered as beginning a paragraph
my %no_line_macros = (
    'alias' => 1,
    'macro' => 1,
    'unmacro' => 1,
    'rmacro' => 1,
    'titlefont' => 1,
    'include' => 1,
    'copying' => 1,
    'end copying' => 1,
    'tab' => 1,
    'item' => 1,
    'itemx' => 1,
    '*' => 1,
    'float' => 1,
    'end float' => 1,
    'caption' => 1,
    'shortcaption' => 1,
);

foreach my $key (keys(%Texi2HTML::Config::misc_command), keys(%sec2level))
{
    $no_line_macros{$key} = 1;
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
foreach my $table (('table', 'ftable', 'vtable', 'multitable'))
{
   $format_type{$table} = 'table';
}
foreach my $def_format (keys(%Texi2HTML::Config::def_map))
{
   $format_type{$def_format} = 'deff';
}
$format_type{'itemize'} = 'list';
$format_type{'enumerate'} = 'list';

$format_type{'menu'} = 'menu';

$format_type{'cartouche'} = 'cartouche';

$format_type{'float'} = 'float';

$format_type{'quotation'} = 'quotation';

$format_type{'group'} = 'group';

foreach my $key (keys(%format_type))
{
   $no_line_macros{$key} = 1;
   $no_line_macros{"end $key"} = 1;
}

foreach my $macro (keys(%Texi2HTML::Config::format_in_paragraph))
{
   $no_line_macros{$macro} = 1;
   $no_line_macros{"end $macro"} = 1;
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
     'menu_preformatted' => 'menu',
  );

foreach my $key (keys(%fake_format))
{
    $format_type{$key} = 'fake';
}

# raw formats which are expanded especially
my @raw_regions = ('html', 'verbatim', 'tex', 'xml', 'docbook');

# regions expanded or not depending on the value of this hash
my %text_macros = (
     'iftex' => 0, 
     'ignore' => 0, 
     'menu' => 0, 
     'ifplaintext' => 0, 
     'ifinfo' => 0,
     'ifxml' => 0,
     'ifhtml' => 0, 
     'ifdocbook' => 0, 
     'html' => 0, 
     'tex' => 0, 
     'xml' => 0,
     'titlepage' => 1, 
     'documentdescription' => 1, 
     'copying' => 1, 
     'ifnothtml' => 1, 
     'ifnottex' => 1, 
     'ifnotplaintext' => 1, 
     'ifnotinfo' => 1,
     'ifnotxml' => 1,
     'ifnotdocbook' => 1, 
     'direntry' => 0,
     'verbatim' => 'raw', 
     'ifclear' => 'value', 
     'ifset' => 'value' ,
     );
    
foreach my $key (keys(%text_macros))
{
    unless ($text_macros{$key} eq 'raw')
    {
        $no_line_macros{$key} = 1;
        $no_line_macros{"end $key"} = 1;
    }
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

#
# flush stdout and stderr after every write
#
select(STDERR);
$| = 1;
select(STDOUT);
$| = 1;

my $I = \&Texi2HTML::I18n::get_string;

my $T2H_USER; # user running the script
my $documentdescription; # text in @documentdescription 

# shorthand for Texi2HTML::Config::VERBOSE
my $T2H_VERBOSE;
my $T2H_DEBUG;

sub echo_warn($;$);
#print STDERR "" . &$I('test i18n: \' , \a \\ %% %{unknown}a %known % %{known}  \\', { 'known' => 'a known string', 'no' => 'nope'}); exit 0;

# file:        file name to locate. It can be a file path.
# all_files:   if true collect all the files with that name, otherwise stop
#              at first match.
# directories: a reference on a array containing a list of directories to
#              search the file in. default is \@texi2html_config_dirs.
sub locate_init_file($;$$)
{
    my $file = shift;
    my $all_files = shift;
    my $directories = shift;

    $directories = \@texi2html_config_dirs if !defined($directories);

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
        return (Texi2HTML::Config::load($file));
    }
    else
    {
        print STDERR "$ERROR Error: can't read init file $init_file\n";
        return 0;
    }
}

my $cmd_line_lang = 0; # 1 if lang was succesfully set by the command line 
                       # in that case @documentlanguage is ignored.
my $lang_set = 0; # 1 if lang was set

#
# called on -lang, and when a @documentlanguage appears
sub set_document_language ($;$$$)
{
    my $lang = shift;
    my $from_command_line = shift;
    my $silent = shift;
    my $line_nr = shift;

    my @langs = ($lang);

    my $main_lang;
    if ($lang =~ /^([a-z]+)_([A-Z]+)/)
    {
        $main_lang = $1;
        push @langs, $main_lang;
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
            $Texi2HTML::THISDOC{'current_lang'} = $language;
            $lang_set = 1;
            $cmd_line_lang = 1 if ($from_command_line);
            if (!$Texi2HTML::Config::TEST)
            {
                print STDERR "# Setting date in $Texi2HTML::THISDOC{'current_lang'}\n" if ($T2H_DEBUG);
                $Texi2HTML::THISDOC{'today'} = Texi2HTML::I18n::pretty_date($Texi2HTML::THISDOC{'current_lang'});  # like "20 September 1993";
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
            return 1;
        }
    }
    
    echo_error ("Language specs for '$lang' do not exists. Reverting to '$Texi2HTML::THISDOC{'current_lang'}'", $line_nr) unless ($silent);
    return 0;
}

# used to manage expanded sections from the command line
sub set_expansion($$)
{
    my $region = shift;
    my $set = shift;
    $set = 1 if (!defined($set));
    if ($set)
    {
         push (@Texi2HTML::Config::EXPAND, $region) unless (grep {$_ eq $region} @Texi2HTML::Config::EXPAND);
    }
    else
    {
         @Texi2HTML::Config::EXPAND = grep {$_ ne $region} @Texi2HTML::Config::EXPAND;
    }
}


# find the encoding alias.
# with encoding support (USE_UNICODE), may return undef if no alias was found
sub encoding_alias($)
{
    my $encoding = shift;
    return $encoding if (!defined($encoding) or $encoding eq '');
    if ($Texi2HTML::Config::USE_UNICODE)
    {
         if (! Encode::resolve_alias($encoding))
         {
              echo_warn("Encoding name unknown: $encoding");
              return undef;
         }
         print STDERR "# Using encoding " . Encode::resolve_alias($encoding) . "\n"
             if ($T2H_VERBOSE);
         return Encode::resolve_alias($encoding); 
    }
    else
    {
         echo_warn("No alias searched for encoding");
         return $encoding;
    }
}


my %nodes = ();             # nodes hash. The key is the texi node name
my %cross_reference_nodes = ();  # normalized node names arrays

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

my (%cross_ref_simple_map_texi, %cross_ref_style_map_texi, 
  %cross_ref_texi_map, %cross_transliterate_style_map_texi,
  %cross_transliterate_texi_map);

# This function is used to construct link names from node names as
# specified for texinfo
sub cross_manual_links()
{
    print STDERR "# Doing ".scalar(keys(%nodes))." cross manual links\n" 
       if ($T2H_DEBUG);
    my $normal_text_kept = $Texi2HTML::Config::normal_text;
    $::simple_map_texi_ref = \%cross_ref_simple_map_texi;
    $::style_map_texi_ref = \%cross_ref_style_map_texi;
    $::texi_map_ref = \%cross_ref_texi_map;
    $Texi2HTML::Config::normal_text = \&Texi2HTML::Config::t2h_cross_manual_normal_text;

    foreach my $key (keys(%nodes))
    {
        my $node = $nodes{$key};
        #print STDERR "CROSS_MANUAL:$key,$node\n";
        next if ($node->{'index_page'});
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
                if ($Texi2HTML::Config::TRANSLITERATE_NODE and  $Texi2HTML::Config::USE_UNIDECODE)
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
                    {
                        $node_seen = $other_node;
                        last if ($nodes{$other_node}->{'seen'})
                    }
                    echo_error("Node equivalent with `$node->{'texi'}' allready used `$node_seen'");
                    push @{$other_node_array}, $node->{'texi'};
                }
                else 
                {
                    push @{$cross_reference_nodes{$node->{'cross_manual_target'}}}, $node->{'texi'};
                }
            }
        }
    }

    
    if ($Texi2HTML::Config::TRANSLITERATE_NODE and 
         (!$Texi2HTML::Config::USE_UNICODE or !$Texi2HTML::Config::USE_UNIDECODE))
    {
         $::style_map_texi_ref = \%cross_transliterate_style_map_texi;
         $::texi_map_ref = \%cross_transliterate_texi_map;

         foreach my $key (keys(%nodes))
         {
             my $node = $nodes{$key};
             next if ($node->{'index_page'});
             if (defined($node->{'texi'}))
             {
                  $node->{'cross_manual_file'} = remove_texi($node->{'texi'});
                  $node->{'cross_manual_file'} = unicode_to_protected(unicode_to_transliterate($node->{'cross_manual_file'})) if ($Texi2HTML::Config::USE_UNICODE);
             }
         }
    }

    $Texi2HTML::Config::normal_text = $normal_text_kept;
    $::simple_map_texi_ref = \%Texi2HTML::Config::simple_map_texi;
    $::style_map_texi_ref = \%Texi2HTML::Config::style_map_texi;
    $::texi_map_ref = \%Texi2HTML::Config::texi_map;
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
             if (exists($Texi2HTML::Config::ascii_character_map{$1}))
             {
                 $result .= '_' . lc($Texi2HTML::Config::ascii_character_map{$1});
             }
             else
             {
                 $result .= '_' . lc(sprintf("%04x",ord($1)));
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
    my $result = '';
    while ($text ne '')
    {
        if ($text =~ s/^([A-Za-z0-9 ]+)//o)
        {
             $result .= $1;
        }
        elsif ($text =~ s/^(.)//o)
        {
             if (exists($Texi2HTML::Config::ascii_character_map{$1}))
             {
                 $result .= $1;
             }
             elsif (exists($Texi2HTML::Config::transliterate_map{uc(sprintf("%04x",ord($1)))}))
             {
                 $result .= $Texi2HTML::Config::transliterate_map{uc(sprintf("%04x",ord($1)))};
             }
             elsif (exists($Texi2HTML::Config::unicode_diacritical{uc(sprintf("%04x",ord($1)))}))
             {
                 $result .= '';
             }
             else
             {
                 if ($Texi2HTML::Config::USE_UNIDECODE)
                 {
                      $result .= unidecode($1);
                 }
                 else
                 {
                      $result .= $1;
                 }
             }
        }
        else
        {
             print STDERR "Bug: unknown character in cross ref transliteration (likely in infinite loop)\n";
             sleep 1;
        }
    }
    return $result;
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
         $cross_ref_file = remove_texi($text);
         $cross_ref_file = unicode_to_protected(unicode_to_transliterate($cross_ref_file))
               if ($Texi2HTML::Config::USE_UNICODE);
    }

    $Texi2HTML::Config::normal_text = $normal_text_kept;
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

# T2H_OPTIONS is a hash whose keys are the (long) names of valid
# command-line options and whose values are a hash with the following keys:
# type    ==> one of !|=i|:i|=s|:s (see GetOpt::Long for more info)
# linkage ==> ref to scalar, array, or subroutine (see GetOpt::Long for more info)
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
 linkage => \$Texi2HTML::Config::DOCTYPE,
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

$T2H_OPTIONS -> {'macro-expand'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::MACRO_EXPAND,
 verbose => 'output macro expanded source in <file>',
};

$T2H_OPTIONS -> {'expand'} =
{
 type => '=s',
 linkage => sub {set_expansion($_[1], 1);},
 verbose => 'Expand info|tex|none section of texinfo source',
 noHelp => 1,
};

$T2H_OPTIONS -> {'no-expand'} =
{
 type => '=s',
 linkage => sub {set_expansion ($_[1], 0);},
 verbose => 'Don\'t expand the given section of texinfo source',
};

$T2H_OPTIONS -> {'noexpand'} = 
{
 type => '=s',
 linkage => $T2H_OPTIONS->{'no-expand'}->{'linkage'},
 verbose => $T2H_OPTIONS->{'no-expand'}->{'verbose'},
 noHelp  => 1,
};

$T2H_OPTIONS -> {'ifhtml'} =
{
 type => '!',
 linkage => sub { set_expansion('html', $_[1]); },
 verbose => "expand ifhtml and html sections",
};

$T2H_OPTIONS -> {'ifinfo'} =
{
 type => '!',
 linkage => sub { set_expansion('info', $_[1]); },
 verbose => "expand ifinfo",
};

$T2H_OPTIONS -> {'ifxml'} =
{
 type => '!',
 linkage => sub { set_expansion('xml', $_[1]); },
 verbose => "expand ifxml and xml sections",
};

$T2H_OPTIONS -> {'ifdocbook'} =
{
 type => '!',
 linkage => sub { set_expansion('docbook', $_[1]); },
 verbose => "expand ifdocbook and docbook sections",
};

$T2H_OPTIONS -> {'iftex'} =
{
 type => '!',
 linkage => sub { set_expansion('tex', $_[1]); },
 verbose => "expand iftex and tex sections",
};

$T2H_OPTIONS -> {'ifplaintext'} =
{
 type => '!',
 linkage => sub { set_expansion('plaintext', $_[1]); },
 verbose => "expand ifplaintext sections",
};

$T2H_OPTIONS -> {'invisible'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::INVISIBLE_MARK,
 verbose => 'use text in invisble anchor',
 noHelp  => 1,
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

$T2H_OPTIONS -> {'number'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::NUMBER_SECTIONS,
 verbose => 'use numbered sections',
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

$T2H_OPTIONS -> {'separated-footnotes'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::SEPARATED_FOOTNOTES,
 verbose => 'footnotes on a separated page',
 noHelp => 1,
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

$T2H_OPTIONS -> {'sec-nav'} =
{
 type => '!',
 linkage => \$Texi2HTML::Config::SECTION_NAVIGATION,
 verbose => 'output navigation panels for each section',
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

$T2H_OPTIONS -> {'output'} =
{
 type => '=s',
 linkage => \$Texi2HTML::Config::OUT,
 verbose => 'output goes to $s (directory if split)',
};

$T2H_OPTIONS -> {'no-validate'} = 
{
 type => '!',
 linkage => \$Texi2HTML::Config::NOVALIDATE,
 verbose => 'suppress node cross-reference validation',
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

$T2H_OPTIONS -> {'Verbose'} =
{
 type => '!',
 linkage=> \$Texi2HTML::Config::VERBOSE,
 verbose => 'print progress info to stdout',
};

$T2H_OPTIONS -> {'lang'} =
{
 type => '=s',
 linkage => sub {set_document_language($_[1], 1)},
 verbose => 'use $s as document language (ISO 639 encoding)',
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
 linkage=> \$Texi2HTML::Config::TRANSLITERATE_NODE,
 verbose => 'produce file names in ASCII transliteration',
};

##
## obsolete cmd line options
##
my $T2H_OBSOLETE_OPTIONS;

$T2H_OBSOLETE_OPTIONS -> {'out-file'} =
{
 type => '=s',
 linkage => sub {$Texi2HTML::Config::OUT = $_[1]; $Texi2HTML::Config::SPLIT = '';},
 verbose => 'if set, all HTML output goes into file $s, obsoleted by "-output" with different semantics',
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
 linkage => \$Texi2HTML::Config::SECTION_NAVIGATION,
 verbose => 'obsolete, use "-sec-nav" instead',
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
 linkage => sub {$Texi2HTML::Config::SECTION_NAVIGATION = 0;},
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
 verbose => 'obsolete, use "-expand info" instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {expandtex} =
{
 type => '!',
 linkage => sub {push @Texi2HTML::Config::EXPAND, 'tex';},
 verbose => 'obsolete, use "-expand tex" instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {monolithic} =
{
 type => '!',
 linkage => sub {$Texi2HTML::Config::SPLIT = '';},
 verbose => 'obsolete, use "-split no" instead',
 noHelp => 2
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
 linkage => \$Texi2HTML::Config::SECTION_NAVIGATION,
 verbose => 'obsolete, use --sec-nav instead',
 noHelp => 2,
};

$T2H_OBSOLETE_OPTIONS -> {verbose} =
{
 type => '!',
 linkage=> \$Texi2HTML::Config::VERBOSE,
 verbose => 'obsolete, use -Verbose instead',
 noHelp => 2
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


my $T2H_USAGE_TEXT = <<EOT;
Usage: texi2html  [OPTIONS] TEXINFO-FILE
Translates Texinfo source documentation to HTML.
EOT
my $T2H_FAILURE_TEXT = <<EOT;
Try 'texi2html --help' for usage instructions.
EOT

my $options = new Getopt::MySimple;

$T2H_OPTIONS -> {'help'} = 
{ 
 type => ':i', 
 default => '',
 linkage => sub {$options->helpOptions($_[1]); 
    print "\nSend bugs and suggestions to <texi2html-bug\@nongnu.org>\n";
    exit (0);},
 verbose => "print help and exit"
};

# this avoids getOptions defining twice 'help' and 'version'.
$T2H_OBSOLETE_OPTIONS -> {'help'} = 0;
$T2H_OBSOLETE_OPTIONS -> {'version'} = 0;

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

# $T2H_DEBUG and $T2H_VERBOSE are shorthands
$T2H_DEBUG = $Texi2HTML::Config::DEBUG;
$T2H_VERBOSE = $Texi2HTML::Config::VERBOSE;

$Texi2HTML::THISDOC{'debug_l2h'} = 0;
$Texi2HTML::THISDOC{'debug_l2h'} = 1 if ($T2H_DEBUG & $DEBUG_L2H);


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
%cross_ref_texi_map = %Texi2HTML::Config::texi_map;

$cross_ref_texi_map{'enddots'} = '...';

%cross_ref_simple_map_texi = %Texi2HTML::Config::simple_map_texi;

%cross_transliterate_texi_map = %cross_ref_texi_map;

foreach my $command (keys(%Texi2HTML::Config::style_map_texi))
{
    $cross_ref_style_map_texi{$command} = {}; 
    $cross_transliterate_style_map_texi{$command} = {};
    foreach my $key (keys (%{$Texi2HTML::Config::style_map_texi{$command}}))
    {
#print STDERR "$command, $key, $style_map_texi{$command}->{$key}\n";
         $cross_ref_style_map_texi{$command}->{$key} = 
              $Texi2HTML::Config::style_map_texi{$command}->{$key};
         $cross_transliterate_style_map_texi{$command}->{$key} = 
              $Texi2HTML::Config::style_map_texi{$command}->{$key};
    }
}

$cross_ref_simple_map_texi{"\n"} = ' ';
$cross_ref_simple_map_texi{"*"} = ' ';


# Fill in the %style_type hash, a hash associating style @-comand with 
# the type, 'accent', real 'style', simple' style, or 'special'.
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
#foreach my $simple ('ctrl', 'w', 'url','uref','indicateurl','email')
#{
#    $style_type{$simple} = 'simple_style';
#}
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

unshift @texi2html_config_dirs, @Texi2HTML::Config::CONF_DIRS;
# correct %text_macros based on command line and init
# variables
$text_macros{'menu'} = 1 if ($Texi2HTML::Config::SHOW_MENU);

foreach my $expanded (@Texi2HTML::Config::EXPAND)
{
    $text_macros{"if$expanded"} = 1 if (exists($text_macros{"if$expanded"}));
    next unless (exists($text_macros{$expanded}));
    if (grep {$_ eq $expanded} @raw_regions)
    {
         $text_macros{$expanded} = 'raw'; 
    }
    else
    {
         $text_macros{$expanded} = 1; 
    }
}

# handle ifnot regions
foreach my $region (keys (%text_macros))
{
    next if ($region =~ /^ifnot/);
    if ($text_macros{$region} and $region =~ /^if(\w+)$/)
    {
        $text_macros{"ifnot$1"} = 0;
    }
}

if ($T2H_VERBOSE)
{
    print STDERR "# Expanded: ";
    foreach my $text_macro (keys(%text_macros))
    {
        print STDERR "$text_macro " if ($text_macros{$text_macro});
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
    $Texi2HTML::Config::USE_UNICODE = 1;
    eval {
        require Encode;
        require Unicode::Normalize; 
        Encode->import('encode');
    };
    $Texi2HTML::Config::USE_UNICODE = 0 if ($@);
}
elsif ($Texi2HTML::Config::USE_UNICODE)
{# user provided or set by configure
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
elsif ($Texi2HTML::Config::USE_UNIDECODE)
{# user provided or set by configure
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
            $cross_ref_texi_map{$key} = chr(hex($Texi2HTML::Config::unicode_map{$key}));
            if (($Texi2HTML::Config::TRANSLITERATE_NODE and !$Texi2HTML::Config::USE_UNIDECODE)
                and (exists ($Texi2HTML::Config::transliterate_map{$Texi2HTML::Config::unicode_map{$key}})))
            {
                $cross_transliterate_texi_map{$key} = $Texi2HTML::Config::transliterate_map{$Texi2HTML::Config::unicode_map{$key}};
                 
            }
        }
        else
        {
            $cross_ref_texi_map{$key} = '_' . lc($Texi2HTML::Config::unicode_map{$key});
            if ($Texi2HTML::Config::TRANSLITERATE_NODE)
            {
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
}
if ($Texi2HTML::Config::USE_UNICODE and $Texi2HTML::Config::TRANSLITERATE_NODE
     and ! $Texi2HTML::Config::USE_UNIDECODE)
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
        if ($Texi2HTML::Config::TRANSLITERATE_NODE and 
           !($Texi2HTML::Config::USE_UNICODE and $Texi2HTML::Config::USE_UNIDECODE))
        {
             $cross_transliterate_style_map_texi{$key}->{'function'} = \&Texi2HTML::Config::t2h_transliterate_cross_manual_accent;
        }
    }
}

#
# file name business
#


my $docu_dir;            # directory of the document
my $docu_name;           # basename of the document
my $docu_rdir;           # directory for the output
my $docu_ext = $Texi2HTML::Config::EXTENSION;   # extension
my $docu_toc;            # document's table of contents
my $docu_stoc;           # document's short toc
my $docu_foot;           # document's footnotes
my $docu_about;          # about this document
my $docu_top;            # document top
my $docu_doc;            # document (or document top of split)

die "Need exactly one file to translate\n$T2H_FAILURE_TEXT" unless @ARGV == 1;
my $docu = shift(@ARGV);
if ($docu =~ /(.*\/)/)
{
    chop($docu_dir = $1);
    $docu_name = $docu;
    $docu_name =~ s/.*\///;
}
else
{
    $docu_dir = '.';
    $docu_name = $docu;
}
unshift(@Texi2HTML::Config::INCLUDE_DIRS, $docu_dir);
unshift(@Texi2HTML::Config::INCLUDE_DIRS, @Texi2HTML::Config::PREPEND_DIRS);
$docu_name =~ s/\.te?x(i|info)?$//;
$docu_name = $Texi2HTML::Config::PREFIX if $Texi2HTML::Config::PREFIX;

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

# Something like backward compatibility
if ($Texi2HTML::Config::SPLIT and $Texi2HTML::Config::SUBDIR)
{
    $Texi2HTML::Config::OUT = $Texi2HTML::Config::SUBDIR;
}

# subdir

die "output to STDOUT and split or frames incompatible\n" 
    if (($Texi2HTML::Config::SPLIT or $Texi2HTML::Config::FRAMES) and ($Texi2HTML::Config::OUT eq '-'));

if ($Texi2HTML::Config::SPLIT and ($Texi2HTML::Config::OUT eq ''))
{
    $Texi2HTML::Config::OUT = $docu_name;
}

if ($Texi2HTML::Config::SPLIT and ($Texi2HTML::Config::OUT eq '.'))
{# This is to avoid trouble with latex2html
    $Texi2HTML::Config::OUT = '';
}

$docu_rdir = '';

if ($Texi2HTML::Config::SPLIT and ($Texi2HTML::Config::OUT ne ''))
{
    $Texi2HTML::Config::OUT =~ s|/*$||;
    $docu_rdir = "$Texi2HTML::Config::OUT/"; 
    unless (-d $Texi2HTML::Config::OUT)
    {
        if ( mkdir($Texi2HTML::Config::OUT, oct(755)))
        {
            print STDERR "# created directory $Texi2HTML::Config::OUT\n" if ($T2H_VERBOSE);
        }
        else
        {
            die "$ERROR can't create directory $Texi2HTML::Config::OUT\n";
        }
    }
    print STDERR "# putting result files into directory $docu_rdir\n" if ($T2H_VERBOSE);
}
elsif (! $Texi2HTML::Config::SPLIT and ($Texi2HTML::Config::OUT ne ''))
{
    if ($Texi2HTML::Config::OUT =~ m|(.*)/|)
    {# there is a leading directories
        $docu_rdir = "$1/";
        unless (-d $docu_rdir)
        {
            if ( mkdir($docu_rdir, oct(755)))
            {
                 print STDERR "# created directory $docu_rdir\n" if ($T2H_VERBOSE);
            }
            else
            {
                die "$ERROR can't create directory $docu_rdir\n";
            }
        }
        print STDERR "# putting result files into directory $docu_rdir\n" if ($T2H_VERBOSE);
    }
    else
    {
        print STDERR "# putting result files into current directory \n" if ($T2H_VERBOSE);
        $docu_rdir = '';
    }
}

# We don't use "./" as $docu_rdir when $docu_rdir is the current directory
# because it is problematic for latex2html. To test writability with -w, 
# however we need a real directory.
my $result_rdir = $docu_rdir;
$result_rdir = "." if ($docu_rdir eq '');
unless (-w $result_rdir)
{
    $docu_rdir = 'current directory' if ($docu_rdir eq '');
    die "$ERROR $docu_rdir not writable\n";
}

# relative path leading to the working directory from the document directory
my $path_to_working_dir = $docu_rdir;
if ($docu_rdir ne '')
{
    my $cwd = cwd;
    my $docu_path = $docu_rdir;
    $docu_path = $cwd . '/' . $docu_path unless ($docu_path =~ /^\//);
    my @result = ();
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
    $path_to_working_dir =~ s|.*/||;
    $path_to_working_dir .= '/' unless($path_to_working_dir eq '');
}

# extension
if ($Texi2HTML::Config::SHORTEXTN)
{
    $docu_ext = "htm";
}

$docu_doc = $docu_name . ($docu_ext ? ".$docu_ext" : ""); # document's contents
if ($Texi2HTML::Config::SPLIT)
{
    $docu_top   = $Texi2HTML::Config::TOP_FILE || $docu_doc;

    if (defined $Texi2HTML::Config::element_file_name)
    {
        $docu_toc = &$Texi2HTML::Config::element_file_name
            (undef, "toc", $docu_name);
        $docu_stoc = &$Texi2HTML::Config::element_file_name
            (undef, "stoc", $docu_name);
        $docu_foot = &$Texi2HTML::Config::element_file_name
            (undef, "foot", $docu_name);
        $docu_about = &$Texi2HTML::Config::element_file_name
            (undef, "about", $docu_name);
	# $docu_top may be overwritten later.
    }
    if (!defined($docu_toc))
    {
        my $default_toc = "${docu_name}_toc";
        $default_toc .= ".$docu_ext" if (defined($docu_ext));
        $docu_toc   = $Texi2HTML::Config::TOC_FILE || $default_toc;
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
    if ($Texi2HTML::Config::OUT)
    {
        $docu_doc = $Texi2HTML::Config::OUT;
        $docu_doc =~ s|.*/||;
    }
    if (defined $Texi2HTML::Config::element_file_name)
    {
        my $docu_name = &$Texi2HTML::Config::element_file_name
           (undef, "doc", $docu_name);
        $docu_top = $docu_name if (defined($docu_name));
    } 
    $docu_toc = $docu_foot = $docu_stoc = $docu_about = $docu_top = $docu_doc;
}

# Note that file extension has already been added here.


my $docu_doc_file = "$docu_rdir$docu_doc"; 
my $docu_toc_file  = "$docu_rdir$docu_toc";
my $docu_stoc_file = "$docu_rdir$docu_stoc";
my $docu_foot_file = "$docu_rdir$docu_foot";
my $docu_about_file = "$docu_rdir$docu_about";
my $docu_top_file  = "$docu_rdir$docu_top";

my $docu_frame = "${docu_name}_frame";
$docu_frame .= ".$docu_ext" if $docu_ext;
my $docu_frame_file =     "$docu_rdir$docu_frame";
my $docu_toc_frame = "${docu_name}_toc_frame";
$docu_toc_frame .= ".$docu_ext" if $docu_ext;
my $docu_toc_frame_file = "$docu_rdir$docu_toc_frame";

# For use in init files
$Texi2HTML::THISDOC{'filename'}->{'top'} = $docu_top;
$Texi2HTML::THISDOC{'filename'}->{'foot'} = $docu_foot;
$Texi2HTML::THISDOC{'filename'}->{'stoc'} = $docu_stoc;
$Texi2HTML::THISDOC{'filename'}->{'about'} = $docu_about;
$Texi2HTML::THISDOC{'filename'}->{'toc'} = $docu_toc;
$Texi2HTML::THISDOC{'extension'} = $docu_ext;
# FIXME document that
$Texi2HTML::THISDOC{'filename'}->{'toc_frame'} = $docu_toc_frame;
$Texi2HTML::THISDOC{'filename'}->{'frame'} = $docu_frame;
$Texi2HTML::THISDOC{'out_dir'} = $docu_rdir;
$Texi2HTML::THISDOC{'file_base_name'} = $docu_name;

#
# _foo: internal variables to track @foo
#
foreach my $key ('_author', '_title', '_subtitle', '_shorttitlepage',
	 '_settitle', '_setfilename', '_shorttitle', '_titlefont')
{
    $value_initial{$key} = '';            # prevent -w warnings
}
my $index;                         # ref on a hash for the index entries
my %indices = ();                  # hash of indices names containing 
                                   #[ $pages, $entries ] (page indices and 
                                   # raw index entries)
my @index_labels = ();             # array corresponding with @?index commands
                                   # constructed during pass_texi, used to
                                   # put labels in pass_text
#
# initial counters
#
my $foot_num = 0;
my $relative_foot_num = 0;
my $idx_num = 0;
my $sec_num = 0;
my $head_num = 0;
my $anchor_num = 0;

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
    while (<$fh>)
    {
	    #print STDERR "Line: $_";
        if ($in_rules)
        {
            push @$rules, $_;
            next;
        }
        my $text = '';
        while (1)
        { 
		#sleep 1;
		#print STDERR "${text}!in_comment $in_comment in_rules $in_rules in_import $in_import in_string $in_string: $_";
             if ($in_comment)
             {
                 if (s/^(.*?\*\/)//)
                 {
                     $text .= $1;
                     $in_comment = 0;
                 }
                 else
                 {
                     push @$imports, $text . $_;
                     last;
                 }
             }
             elsif (!$in_string and s/^\///)
             { # what do '\' do here ?
                 if (s/^\*//)
                 {
                     $text .= '/*';
                     $in_comment = 1;
                 }
                 else
                 {
                     push (@$imports, $text. "\n") if ($text ne '');
                     push (@$rules, '/' . $_);
                     $in_rules = 1;
                     last;
                 }
             }
             elsif (!$in_string and $in_import and s/^([\"\'])//)
             { # strings outside of import start rules
                 $text .= "$1";
                 $in_string = quotemeta("$1");
             }
             elsif ($in_string and s/^(\\$in_string)//)
             {
                 $text .= $1;
             }
             elsif ($in_string and s/^($in_string)//)
             {
                 $text .= $1;
                 $in_string = 0;
             }
             elsif ((! $in_string and !$in_import) and (s/^([\\]?\@import)$// or s/^([\\]?\@import\s+)//))
             {
                 $text .= $1;
                 $in_import = 1;
             }
             elsif (!$in_string and $in_import and s/^\;//)
             {
                 $text .= ';';
                 $in_import = 0;
             }
             elsif (($in_import or $in_string) and s/^(.)//)
             {
                  $text .= $1;
             }
             elsif (!$in_import and s/^([^\s])//)
             { 
                  push (@$imports, $text. "\n") if ($text ne '');
                  push (@$rules, $1 . $_);
                  $in_rules = 1;
                  last;
             }
             elsif (s/^(\s)//)
             {
                  $text .= $1;
             }
             elsif ($_ eq '')
             {
                  push (@$imports, $text);
                  last;
             }
        } 
    }
    warn "$WARN string not closed in css file $file\n" if ($in_string);
    warn "$WARN comment not closed in css file $file\n" if ($in_comment);
    warn "$WARN \@import not finished in css file $file\n"  if ($in_import and !$in_comment and !$in_string);
    return ($imports, $rules);
}



# parse texinfo cnf file for external manual specifications. This was
# discussed on texinfo list but not in makeinfo for now. 
my @texinfo_htmlxref_files = locate_init_file ($texinfo_htmlxref, 1, \@texinfo_config_dirs);
foreach my $file (@texinfo_htmlxref_files)
{
    print STDERR "html refs config file: $file\n" if ($T2H_DEBUG);    
    unless (open (HTMLXREF, $file))
    {
         warn "Cannot open html refs config file ${file}: $!";
         next;
    }
    while (<HTMLXREF>)
    {
        my $line = $_;
        s/[#]\s.*//;
        s/^\s*//;
        next if /^\s*$/;
        my @htmlxref = split /\s+/;
        my $manual = shift @htmlxref;
        my $split_or_mono = shift @htmlxref;
        if (!defined($split_or_mono) or ($split_or_mono ne 'split' and $split_or_mono ne 'mono'))
        {
            echo_warn("Bad line in $file: $line");
            next;
        }
        my $href = shift @htmlxref;
        next if (exists($Texi2HTML::THISDOC{'htmlxref'}->{$manual}->{$split_or_mono}) and exists($Texi2HTML::THISDOC{'htmlxref'}->{$manual}->{$split_or_mono}->{'href'}));
        
        if (defined($href))
        {
            $href =~ s/\/*$// if ($split_or_mono eq 'split');
            $Texi2HTML::THISDOC{'htmlxref'}->{$manual}->{$split_or_mono}->{'href'} = $href;
        }
        else
        {
            $Texi2HTML::THISDOC{'htmlxref'}->{$manual}->{$split_or_mono} = {};
        }
    }
    close (HTMLXREF);
}

if ($T2H_DEBUG)
{
    foreach my $manual (keys(%{$Texi2HTML::THISDOC{'htmlxref'}}))
    {
         foreach my $split ('split', 'mono')
         {
              my $href = 'NO';
              next unless (exists($Texi2HTML::THISDOC{'htmlxref'}->{$manual}->{$split}));
              $href = $Texi2HTML::THISDOC{'htmlxref'}->{$manual}->{$split}->{'href'} if
                  exists($Texi2HTML::THISDOC{'htmlxref'}->{$manual}->{$split}->{'href'});
              print STDERR "$manual: $split, href: $href\n";
         }
    }
}

print STDERR "# reading from $docu\n" if $T2H_VERBOSE;

#
# Common initializations
#

sub texinfo_initialization($)
{
    my $pass = shift;

    # All the initialization used the last @documentlanguage found during
    # pass_structure. Now we reset it, if it is not set on the command line
    # such that the @documentlanguage macros are used when they arrive
    if (!$cmd_line_lang)
    {
        set_document_language($Texi2HTML::Config::LANG) if defined($Texi2HTML::Config::LANG);
        # $LANG isn't known
        set_document_language('en') unless ($lang_set);
    }
    # reset the @set/@clear values
    %value = %value_initial;
    set_special_names();
    foreach my $init_mac ('everyheading', 'everyfooting', 'evenheading', 
        'evenfooting', 'oddheading', 'oddfooting', 'headings', 
        'allowcodebreaks', 'frenchspacing', 'exampleindent', 
        'firstparagraphindent', 'paragraphindent')
    {
        $Texi2HTML::THISDOC{$init_mac} = undef;
        delete $Texi2HTML::THISDOC{$init_mac};
    }
}

#+++###########################################################################
#                                                                             #
# Pass texi: read source, handle variable, ignored text,                      #
#                                                                             #
#---###########################################################################

my @fhs = ();			# hold the file handles to read
my $input_spool;		# spooled lines to read
my @lines = ();             # whole document
my @lines_numbers = ();     # line number, originating file associated with 
                            # whole document 
my $macros;                 # macros. reference on a hash
my %info_enclose;           # macros defined with definfoenclose
my $texi_line_number = { 'file_name' => '', 'line_nr' => 0, 'macro' => '' };
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
}

my @first_lines = ();

sub pass_texi()
{
    my $first_lines = 1;        # is it the first lines
    my $state = {};
                                # holds the informations about the context
                                # to pass it down to the functions
    initialise_state_texi($state);
    my @stack;
    my $text;
 INPUT_LINE: while (defined($_ = next_line($texi_line_number))) 
    {
        #
        # remove the lines preceding \input or an @-command
        # 
        if ($first_lines)
        {
            if (/^\\input/)
            {
                push @first_lines, $_;
                $first_lines = 0;
                next;
            }
            if (/^\s*\@/)
            {
                $first_lines = 0;
            }
            else
            {
                push @first_lines, $_;
                next;
            }
        }
	#print STDERR "PASS_TEXI($texi_line_number->{'line_nr'})$_";
        my $chomped_line = $_;
        if (scan_texi ($_, \$text, \@stack, $state, $texi_line_number) and chomp($chomped_line))
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
            close_stack_texi_structure(\$text, \@stack, $state, $texi_line_number);
            #dump_stack(\$text, \@stack, $state);
        }
        next if (@stack);
        $_ = $text;
        $text = '';
        if (!defined($_))
        {# FIXME: remove the error message if it is reported too often
            print STDERR "# \$_ undefined after scan_texi. This may be a bug, or not.\n";
            print STDERR "# Report (with texinfo file) if you want, otherwise ignore that message.\n";
            next unless ($state->{'bye'});
        }
        push @lines, split_lines($_);
        last if ($state->{'bye'});
    }
    # close stack at the end of pass texi
    #print STDERR "close stack at the end of pass texi\n";
    close_stack_texi_structure(\$text, \@stack, $state, $texi_line_number);
    push @lines, split_lines($text);
    print STDERR "# end of pass texi\n" if $T2H_VERBOSE;
}

# return the line after preserving things according to misc_command map.
sub preserve_command($$)
{
    my $line = shift;
    my $macro = shift;
    my $text = '';
    my $args = '';
    my $skip_spec = '';
    my $arg_spec = '';

    $skip_spec = $Texi2HTML::Config::misc_command{$macro}->{'skip'}
        if (defined($Texi2HTML::Config::misc_command{$macro}->{'skip'}));
    $arg_spec = $Texi2HTML::Config::misc_command{$macro}->{'arg'}
        if (defined($Texi2HTML::Config::misc_command{$macro}->{'arg'}));

    if ($arg_spec eq 'line')
    {
        $text .= $line;
        $args .= $line;
        $line = '';
    }
    elsif ($arg_spec)
    {
        my $arg_nr = $Texi2HTML::Config::misc_command{$macro}->{'arg'};
        while ($arg_nr)
        {
            $line =~ s/(\s+\S*)//o;
            $text .= $1 if defined($1);
            $args .= $1 if defined($1);
            $arg_nr--;
        }
    }
   
    if ($macro eq 'bye')
    {
        $line = '';
        $text = "\n";
    }
    elsif ($skip_spec eq 'linespace')
    {
        if ($line =~ /^\s*$/o)
        {
            $line =~ s/([ \t]*)//o;
            $text .= $1;
        }
    }
    elsif ($skip_spec eq 'linewhitespace')
    {
        if ($line =~ /^\s*$/o)
        {
            $text .= $line;
            $line = '';
        }	
    }
    elsif ($skip_spec eq 'line')
    {
        $text .= $line;
        $line = '';
    }
    elsif ($skip_spec eq 'whitespace')
    {
        $line =~ s/(\s*)//o;
        $text .=  $1;
    }
    elsif ($skip_spec eq 'space')
    {
        $line =~ s/([ \t]*)//o;
        $text .= $1;
    }
    $line = '' if (!defined($line));
    return ($line, $text, $args);
}

#+++###########################################################################
#                                                                             #
# Pass structure: parse document structure                                    #
#                                                                             #
#---###########################################################################

# This is a virtual element for things appearing before @node and 
# sectionning commands
my $element_before_anything =
{ 
    'before_anything' => 1,
    'place' => [],
    'texi' => 'VIRTUAL ELEMENT BEFORE ANYTHING',
};

# This is a place for index entries, anchors and so on appearing in 
# copying or documentdescription
my $no_element_associated_place = [];

sub initialise_state_structure($)
{
    my $state = shift;
    $state->{'structure'} = 1;      # for substitute_text and close_stack: 
                                    # 1 if pass_structure/scan_structure is 
                                    # to be used
    $state->{'menu'} = 0;           # number of opened menus
    $state->{'detailmenu'} = 0;     # number of opened detailed menus      
    $state->{'sectionning_base'} = 0;         # current base sectionning level
    $state->{'table_stack'} = [ "no table" ]; # a stack of opened tables/lists
    if (exists($state->{'region_lines'}) and !defined($state->{'region_lines'}))
    {
        delete ($state->{'region_lines'});
        print STDERR "Bug: state->{'region_lines'} exists but undef.\n";
    }
}

my @doc_lines = ();         # whole document
my @doc_numbers = ();       # whole document line numbers and file names
my @nodes_list = ();        # nodes in document reading order
                            # each member is a reference on a hash
my @sections_list = ();     # sections in reading order
                            # each member is a reference on a hash
my @all_elements = ();      # sectionning elements (nodes and sections)
                            # in reading order. Each member is a reference
                            # on a hash which also appears in %nodes,
                            # @sections_list @nodes_list, @elements_list
my @elements_list;          # all the resulting elements in document order
my %sections = ();          # sections hash. The key is the section number
my %headings =();           # headings hash. The key is the heading number
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

# This is a virtual element used to have the right hrefs for index entries
# and anchors in footnotes
my $footnote_element = 
{ 
    'id' => 'SEC_Foot',
    'file' => $docu_foot,
    'footnote' => 1,
    'element' => 1,
    'place' => [],
};

my %content_element =
(
    'contents' => { 'id' => 'SEC_Contents', 'contents' => 1, 'texi' => '_contents' },
    'shortcontents' => { 'id' => 'SEC_Overview', 'shortcontents' => 1, 'texi' => '_shortcontents' },
);

# common code for headings and sections
sub new_section_heading($$$)
{
    my $command = shift;
    my $name = shift;
    my $state = shift;
    $name = normalise_space($name);
    $name = '' if (!defined($name));
    # no increase if in @copying and the like. Also no increase if it is top
    # since top has number 0.
    my $docid;
    my $num;

#    if ($state->{'place'} eq $no_element_associated_place)
#    {
#        $docid = "SEC_hidden";
#        $num = "hidden";
#    }
#    else
#    {
#        $sec_num++ if($command ne 'top');
#        $num = $sec_num;
#        $docid = "SEC$sec_num";
#    }
    my $section_ref = { 'texi' => $name,
       'level' => $sec2level{$command},
       'tag' => $command,
    };
#       'sec_num' => $num,
#       'id' => $docid,
    return $section_ref;
}


#my $do_contents;            # do table of contents if true
#my $do_scontents;           # do short table of contents if true
my $novalidate = $Texi2HTML::Config::NOVALIDATE; # @novalidate appeared

sub pass_structure()
{
    my $state = {};
                                # holds the informations about the context
                                # to pass it down to the functions
    initialise_state_structure($state);
    $state->{'element'} = $element_before_anything;
    $state->{'place'} = $element_before_anything->{'place'};
    my @stack;
    my $text;
    my $line_nr;

    while (@lines)
    {
        $_ = shift @lines;
        my $chomped_line = $_;
        if (!chomp($chomped_line) and @lines)
        {
             $lines[0] = $_ . $lines[0];
             next;
        }
        $line_nr = shift (@lines_numbers);
        #print STDERR "PASS_STRUCTURE: $_";
        if (!$state->{'raw'} and !$state->{'verb'})
        {
            my $tag = '';
            if (/^\s*\@(\w+)\b/)
            {
                $tag = $1;
            }

            #
            # analyze the tag
            #
            if ($tag and $tag eq 'node' or (defined($sec2level{$tag}) and ($tag !~ /heading/)) or $tag eq 'printindex')
            {
                #$_ = substitute_texi_line($_); 
                if ($tag eq 'node' or defined($sec2level{$tag}))
                {# in pass structure node shouldn't appear in formats
                    close_stack_texi_structure(\$text, \@stack, $state, $line_nr);
                    if (exists($state->{'region_lines'}))
                    {
                        push @{$region_lines{$state->{'region_lines'}->{'format'}}}, split_lines($text);
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
                    $auto_directions = 1 unless (/,/o);
                    my ($node, $node_next, $node_prev, $node_up) = split(/,/, $_);
                    $node =~ s/^\@node\s+// if ($node);
                    if ($node)
                    {
                        $node = normalise_space($node);
                        if (exists($nodes{$node}) and defined($nodes{$node})
                             and $nodes{$node}->{'seen'})
                        {
                            echo_error ("Duplicate node found: $node", $line_nr);
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
                                my $first;
                                $first = 1 if (!defined($node_ref));
                                $node_ref = {};
                                $node_first = $node_ref if ($first);
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
                            merge_element_before_anything($node_ref);
                            $node_ref->{'index_names'} = [];
                            $state->{'place'} = $node_ref->{'current_place'};
                            $state->{'element'} = $node_ref;
                            $state->{'after_element'} = 1;
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
                                    echo_warn ("Top node allready exists", $line_nr);
                                    #warn "$WARN Top node allready exists\n";
                                }
                            }
                            unless (@nodes_list)
                            {
                                $node_ref->{'first'} = 1;
                            }
                            push (@nodes_list, $node_ref);
                            push @all_elements, $node_ref;
                        }
                    }
                    else
                    {
                        echo_error ("Node is undefined: $_ (eg. \@node NODE-NAME, NEXT, PREVIOUS, UP)", $line_nr);
                        next;
                    }

                    if ($node_next)
                    {
                        $node_ref->{'node_next'} = normalise_node($node_next);
                    }
                    if ($node_prev)
                    {
                        $node_ref->{'node_prev'} = normalise_node($node_prev);
                    }
                    if ($node_up)
                    { 
                        $node_ref->{'node_up'} = normalise_node($node_up);
                    }
                }
                elsif (defined($sec2level{$tag}))
                { # section
                    if (/^\@$tag\s*(.*)$/)
                    {
                        my $name = $1;
                        my $section_ref = new_section_heading($tag, $name, $state);
                        $state->{'after_element'} = 1;

                        $sec_num++ if($tag ne 'top');
                        
                        $section_ref->{'sec_num'} = $sec_num;
                        $section_ref->{'id'} = "SEC$sec_num";
                        $section_ref->{'seen'} = 1;
                        $section_ref->{'index_names'} = [];
                        $section_ref->{'current_place'} = [];
                        $section_ref->{'place'} = [];
                        $section_ref->{'section'} = 1;

                        if ($tag eq 'top')
                        {
                            $section_ref->{'top'} = 1;
                            $section_ref->{'number'} = '';
                            $section_ref->{'id'} = "SEC_Top";
                            $section_ref->{'sec_num'} = 0;
                            $sections{0} = $section_ref;
                            $section_top = $section_ref;
                        }
                        else
                        {
                            $sections{$sec_num} = $section_ref;
                        }
                        merge_element_before_anything($section_ref);
                        if ($state->{'node_ref'} and !exists($state->{'node_ref'}->{'with_section'}))
                        {
                            my $node_ref = $state->{'node_ref'};
                            $section_ref->{'node_ref'} = $node_ref;
                            $section_ref->{'titlefont'} = $node_ref->{'titlefont'};
                            $node_ref->{'with_section'} = $section_ref;
                            $node_ref->{'top'} = 1 if ($tag eq 'top');
                        }
                        if (! $name and $section_ref->{'level'})
                        {
                            echo_warn ("$tag without name", $line_nr);
                        }
                        push @sections_list, $section_ref;
                        push @all_elements, $section_ref;
                        $state->{'element'} = $section_ref;
                        $state->{'place'} = $section_ref->{'current_place'};
                        my $node_ref = "NO NODE";
                        my $node_texi ='';
                        if ($state->{'node_ref'})
                        {
                            $node_ref = $state->{'node_ref'};
                            $node_texi = $state->{'node_ref'}->{'texi'};
                        }
                        print STDERR "# pass_structure node($node_ref)$node_texi, tag \@$tag($section_ref->{'level'}) ref $section_ref, num,id $section_ref->{'sec_num'},$section_ref->{'id'}\n   $name\n"
                           if $T2H_DEBUG & $DEBUG_ELEMENTS;
                    }
                }
                elsif (/^\@printindex\s+(\w+)/)
                {
                    unless (@all_elements)
                    {
                        echo_warn ("Printindex before document beginning: \@printindex $1", $line_nr);
                        next;
                    }
                    delete $state->{'after_element'};
                    # $element_index is the first element with index
                    $element_index = $all_elements[-1] unless (defined($element_index));
                    # associate the index to the element such that the page
                    # number is right
                    my $placed_elements = [];
                    push @{$all_elements[-1]->{'index_names'}}, { 'name' => $1, 'place' => $placed_elements };
                    $state->{'place'} = $placed_elements;
                }
                if (exists($state->{'region_lines'}))
                {
                    push @{$region_lines{$state->{'region_lines'}->{'format'}}}, $_;
                }
                else
                {
                    push @doc_lines, $_;
                    push @doc_numbers, $line_nr;
                }
                next;
            }
        }
        if (scan_structure ($_, \$text, \@stack, $state, $line_nr) and !(exists($state->{'region_lines'})))
        {
            push (@doc_numbers, $line_nr);
        }
        next if (@stack);
        $_ = $text;
        $text = '';
        next if (!defined($_));
        if ($state->{'region_lines'})
        {
            push @{$region_lines{$state->{'region_lines'}->{'format'}}}, split_lines($_);
        }
        else
        {
            push @doc_lines, split_lines($_);
        }
    }
    if (@stack)
    {# close stack at the end of pass structure
        close_stack_texi_structure(\$text, \@stack, $state, $line_nr);
        if ($text)
        {
            if (exists($state->{'region_lines'}))
            {
                push @{$region_lines{$state->{'region_lines'}->{'format'}}}, 
                   split_lines($text);
            }
            else
            {
                push @doc_lines, split_lines($text);
            }
        }
    }
    echo_warn ("At end of document, $state->{'region_lines'}->{'number'} $state->{'region_lines'}->{'format'} not closed") if (exists($state->{'region_lines'}));
    print STDERR "# end of pass structure\n" if $T2H_VERBOSE;
}

# split line at end of line and put each resulting line in an array
# FIXME there must be a more perlish way to do it... Not a big deal 
# as long as it work
sub split_lines($)
{
   my $line = shift;
   my @result = ();
   my $i = 0;
   while ($line)
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
    my $macro = shift;
    my $line = shift;
    my $silent = shift;
    my $line_nr = shift;
    my $return_value = 0;
    if ($line =~ /\s+(\w+)/)
    {
        my $lang = $1;
        if (!$cmd_line_lang && $lang)
        {
            $return_value = set_document_language($lang, 0, $silent, $line_nr);
            # warning, this is not the language of the document but the one that
            # appear in the texinfo. It may be different if $cmd_line_lang 
            # is set
            $Texi2HTML::THISDOC{$macro} = $lang;
        }
    }
    return $return_value;
}

# actions that should be done in more than one pass. In fact most are not 
# to be done in pass_texi. The $pass argument is the number of the pass, 
# 0 for pass_texi, 1 for pass_structure, 2 for pass_text
sub common_misc_commands($$$$)
{
    my $macro = shift;
    my $line = shift;
    my $pass = shift;
    my $line_nr = shift;

    # track variables
    if ($macro eq 'set')
    {
        if ($line =~ /^(\s+)($VARRE)(\s+)(.*)$/)
        {
             $value{$2} = $4;
        }
        else
        {
             echo_warn ("Missing argument for \@$macro", $line_nr) if (!$pass);
        }
    }
    elsif ($macro eq 'clear')
    {
        if ($line =~ /^(\s+)($VARRE)/)
        {
            delete $value{$2};
        }
        else
        {
            echo_warn ("Missing argument for \@$macro", $line_nr) if (!$pass);
        }
    }
    if ($pass)
    { # these commands are only taken into account is pass_structure 1 and 
      # pass_text 2
        if ($macro eq 'paragraphindent')
        {
            if ($line =~ /\s+([0-9]+)/)
            {
                $Texi2HTML::THISDOC{$macro} = $1;
            }
            elsif (($line =~ /\s+(none)[^\w\-]/) or ($line =~ /\s+(asis)[^\w\-]/))
            {
                $Texi2HTML::THISDOC{$macro} = $1;
            }
            else
            {
                echo_error ("Bad \@$macro", $line_nr) if ($pass == 1);
            }
        }
        elsif ($macro eq 'firstparagraphindent')
        {
            if (($line =~ /\s+(none)[^\w\-]/) or ($line =~ /\s+(insert)[^\w\-]/))
            {
                $Texi2HTML::THISDOC{$macro} = $1;
            }
            else
            {
                echo_error ("Bad \@$macro", $line_nr) if ($pass == 1);
            }
        }
        elsif ($macro eq 'exampleindent')
        {
            if ($line =~ /^\s+([0-9]+)/)
            {
                $Texi2HTML::THISDOC{$macro} = $1;
            }
            elsif ($line =~ /^\s+(asis)[^\w\-]/)
            {
                $Texi2HTML::THISDOC{$macro} = $1;
            }
            else
            {
                echo_error ("Bad \@$macro", $line_nr) if ($pass == 1);
            }
        }
        elsif ($macro eq 'frenchspacing')
        {
            if (($line =~ /^\s+(on)[^\w\-]/) or ($line =~ /^\s+(off)[^\w\-]/))
            {
                $Texi2HTML::THISDOC{$macro} = $1;
            }
            else
            {
                echo_error ("Bad \@$macro", $line_nr) if ($pass == 1);
            }
        }
        elsif (grep {$macro eq $_} ('everyheading', 'everyfooting',
              'evenheading', 'evenfooting', 'oddheading', 'oddfooting'))
        {
            my $arg = $line;
            $arg =~ s/^\s+//;
            $Texi2HTML::THISDOC{$macro} = $arg;
        }
        elsif ($macro eq 'allowcodebreaks')
        {
            if (($line =~ /^\s+(true)[^\w\-]/) or ($line =~ /^\s+(false)[^\w\-]/))
            {
                $Texi2HTML::THISDOC{$macro} = $1;
            }
            else
            {
                echo_error ("Bad \@$macro", $line_nr) if ($pass == 1);
            }
        }
        elsif ($macro eq 'headings')
        {
            my $valid_arg = 0;
            foreach my $possible_arg (('off','on','single','double',
                          'singleafter','doubleafter'))
            {
                if ($line =~ /^\s+($possible_arg)[^\w\-]/)
                {   
                    $valid_arg = 1;
                    $Texi2HTML::THISDOC{$macro} = $possible_arg;
                    last;
                }
            }
            unless ($valid_arg)
            {
                echo_error ("Bad \@$macro", $line_nr) if ($pass == 1);
            }
        }
        elsif ($macro eq 'documentlanguage')
        {
            if (do_documentlanguage($macro, $line, $pass -1, $line_nr))
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
   my $macro = shift;
   my $state = shift;
   my $line_nr = shift;
   my $text;
   my $args;
    
   if (!$state->{'ignored'} and !$state->{'arg_expansion'})
   {
      if ($macro eq 'documentencoding')
      {
         my $encoding = '';
         if ($line =~ /(\s+)([0-9\w\-]+)/)
         {
            $encoding = $2;
            $Texi2HTML::Config::DOCUMENT_ENCODING = $encoding;
            my $from_encoding = encoding_alias($encoding);
            $Texi2HTML::Config::IN_ENCODING = $from_encoding if
               defined($from_encoding);
            if (defined($from_encoding) and $Texi2HTML::Config::USE_UNICODE)
            {
               foreach my $file (@fhs)
               {
                  binmode($file->{'fh'}, ":encoding($from_encoding)");
               }
            }
         }
      }
      else
      {
          common_misc_commands($macro, $line, 0, $line_nr);
      }
   }

   ($text, $line, $args) = preserve_command($line, $macro);
   return ($text, $line);
}

# handle misc commands and misc command args
sub misc_command_structure($$$$)
{
    my $line = shift;
    my $macro = shift;
    my $state = shift;
    my $line_nr = shift;
    my $text;
    my $args;

    if ($macro eq 'lowersections')
    {
        my ($sec, $level);
        while (($sec, $level) = each %sec2level)
        {
            $sec2level{$sec} = $level + 1;
        }
        $state->{'sectionning_base'}--;
    }
    elsif ($macro eq 'raisesections')
    {
        my ($sec, $level);
        while (($sec, $level) = each %sec2level)
        {
            $sec2level{$sec} = $level - 1;
        }
        $state->{'sectionning_base'}++;
    }
    elsif (($macro eq 'contents') or ($macro eq 'summarycontents') or ($macro eq 'shortcontents'))
    {
        if ($macro eq 'contents')
        {
             $Texi2HTML::Config::DO_CONTENTS = 1;
        }
        else
        {
             $macro = 'shortcontents';
             $Texi2HTML::Config::DO_SCONTENTS = 1;
        }
        push @{$state->{'place'}}, $content_element{$macro};
    }
    elsif ($macro eq 'detailmenu')
    {
        $state->{'detailmenu'}++;
    }
    elsif ($macro eq 'novalidate')
    {
        $novalidate = 1;
        $Texi2HTML::THISDOC{$macro} = 1; 
    }
    elsif (grep {$_ eq $macro} ('settitle','setfilename','shortitle','shorttitlepage') 
             and ($line =~ /^\s+(.*)$/))
    {
        $value{"_$macro"} = substitute_texi_line($1);
    }
    elsif (grep {$_ eq $macro} ('author','subtitle','title')
             and ($line =~ /^\s+(.*)$/))
    {
        $value{"_$macro"} .= substitute_texi_line($1)."\n";
        push @{$Texi2HTML::THISDOC{"${macro}s"}}, substitute_texi_line($1);
    }
    elsif ($macro eq 'synindex' || $macro eq 'syncodeindex')
    {
        if ($line =~ /^\s+(\w+)\s+(\w+)/)
        {
            my $index_from = $1;
            my $index_to = $2;
            echo_error ("unknown from index name $index_from in \@$macro", $line_nr)
                unless $index_names{$index_from};
            echo_error ("unknown to index name $index_to in \@$macro", $line_nr)
                unless $index_names{$index_to};
            if ($index_names{$index_from} and $index_names{$index_to})
            {
                if ($macro eq 'syncodeindex')
                {
                    $index_names{$index_to}->{'associated_indices_code'}->{$index_from} = 1;
                }
                else
                {
                    $index_names{$index_to}->{'associated_indices'}->{$index_from} = 1;
                }
                push @{$Texi2HTML::THISDOC{$macro}}, [$index_from,$index_to]; 
            }
        }
        else
        {
            echo_error ("Bad $macro line: $line", $line_nr);
        }
    }
    elsif ($macro eq 'defindex' || $macro eq 'defcodeindex')
    {
        if ($line =~ /^\s+(\w+)\s*$/)
        {
            my $name = $1;
            if ($forbidden_index_name{$name})
            {
                echo_error("Reserved index name $name", $line_nr);
            }
            else
            {
                @{$index_names{$name}->{'prefix'}} = ($name);
                $index_names{$name}->{'code'} = 1 if $macro eq 'defcodeindex';
                $index_prefix_to_name{$name} = $name;
                push @{$Texi2HTML::THISDOC{$macro}}, $name; 
            }
        }
        else
        {# makeinfo don't warn and even accepts index with empty name
         # and index with numbers only. I reported it on the mailing list
         # this should be fixed in future makeinfo versions.
            echo_error ("Bad $macro line: $line", $line_nr);
        }
    }
    elsif ($macro eq 'kbdinputstyle')
    {# makeinfo ignores that with --html. I reported it and it should be 
     # fixed in future makeinfo releases
        if ($line =~ /\s+([a-z]+)/)
        {
            if ($1 eq 'code')
            {
                $::style_map_ref->{'kbd'} = $::style_map_ref->{'code'};
                $::style_map_pre_ref->{'kbd'} = $::style_map_pre_ref->{'code'};
                $Texi2HTML::THISDOC{$macro} = $1;
            }
            elsif ($1 eq 'example')
            {
                $::style_map_pre_ref->{'kbd'} = $::style_map_pre_ref->{'code'};
                $Texi2HTML::THISDOC{$macro} = $1;
            }
            elsif ($1 ne 'distinct')
            {
                echo_error ("Unknown argument for \@$macro: $1", $line_nr);
            }
        }
        else
        {
            echo_error ("Bad \@$macro", $line_nr);
        }
    }
    elsif ($macro eq 'fonttextsize')
    {
        if (($line =~ /^\s+(10)[^\w\-]/) or ($line =~ /^\s+(11)[^\w\-]/))
        {
            $Texi2HTML::THISDOC{$macro} = $1;
        }
        else
        {
            echo_error ("Bad \@$macro", $line_nr);
        }
    }
    elsif ($macro eq 'footnotestyle')
    {
        if (($line =~ /^\s+(end)[^\w\-]/) or ($line =~ /^\s+(separate)[^\w\-]/))
        {
            $Texi2HTML::THISDOC{$macro} = $1;
        }
        else
        {
            echo_error ("Bad \@$macro", $line_nr);
        }
    }
    elsif ($macro eq 'setchapternewpage')
    {
        if (($line =~ /^\s+(on)[^\w\-]/) or ($line =~ /^\s+(off)[^\w\-]/)
                or ($line =~ /^\s+(odd)[^\w\-]/))
        {
            $Texi2HTML::THISDOC{$macro} = $1;
        }
        else
        {
            echo_error ("Bad \@$macro", $line_nr);
        }
    }
    elsif ($macro eq 'setcontentsaftertitlepage' or $macro eq 'setshortcontentsaftertitlepage')
    {
        $Texi2HTML::THISDOC{$macro} = 1;
        my $tag = 'contents';
        $tag = 'shortcontents' if ($macro ne 'setcontentsaftertitlepage');
        $content_element{$tag}->{'aftertitlepage'} = 1;
    }
    elsif ($macro eq 'need')
    { # only a warning
        unless (($line =~ /^\s+([0-9]+(\.[0-9]*)?)[^\w\-]/) or 
                 ($line =~ /^\s+(\.[0-9]+)[^\w\-]/))
        {
            echo_warn ("Bad \@$macro", $line_nr);
        }
    }
    else
    {
        common_misc_commands($macro, $line, 1, $line_nr);
    }

    ($text, $line, $args) = preserve_command($line, $macro);
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
# if the skipped macro has an effect it is done here
# this is used during pass_text
sub misc_command_text($$$$$$)
{
    my $line = shift;
    my $macro = shift;
    my $stack = shift;
    my $state = shift;
    my $text = shift;
    my $line_nr = shift;
    my ($skipped, $remaining, $args);

    # The strange condition associated with 'keep_texi' is 
    # there because for an argument appearing on an @itemize 
    # line (we're in 'check_item'), meant to be prepended to an 
    # @item we don't want to keep @c or @comment as otherwise it 
    # eats the @item line. Other commands could do that too but 
    # then the user deserves what he gets.
    if ($state->{'keep_texi'} and 
        (!$state->{'check_item'} or ($macro ne 'c' and $macro ne 'comment'))) 
    {
        ($remaining, $skipped, $args) = preserve_command($line, $macro);
        add_prev($text, $stack, "\@$macro". $skipped);
        return $remaining;
    }

    # if it is true the command args are kept so the user can modify how
    # they are skipped and handle them as unknown @-commands
    my $keep = $Texi2HTML::Config::misc_command{$macro}->{'keep'};

    if ($macro eq 'detailmenu')
    {
        $state->{'detailmenu'}++;
    }
    elsif ($macro eq 'end detailmenu')
    {
        $state->{'detailmenu'}-- if ($state->{'detailmenu'});
    }
    elsif ($macro eq 'sp')
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
            echo_error ("\@$macro needs a numeric arg or no arg", $line_nr);
        }
        $sp_number = 1 if ($sp_number eq '');
        if (!$state->{'remove_texi'})
        {
            add_prev($text, $stack, &$Texi2HTML::Config::sp($sp_number, $state->{'preformatted'}));
        }
    }
    elsif($macro eq 'verbatiminclude' and !$keep)
    {
        if ($line =~ /\s+(.+)/)
        {
            my $arg = $1;
            my $file = locate_include_file($arg);
            if (defined($file))
            {
                if (!open(VERBINCLUDE, $file))
                {
                    echo_warn ("Can't read file $file: $!",$line_nr);
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
                        add_prev ($text, $stack, &$Texi2HTML::Config::raw_no_texi('verbatim', $verb_text));
                    }
                    else
                    { 
                        add_prev($text, $stack, &$Texi2HTML::Config::raw('verbatim', $verb_text));
                    }
                    close VERBINCLUDE;
                }
            }
            else
            {
                echo_error ("Can't find $arg, skipping", $line_nr);
            }
        }
        else
        {
            echo_error ("Bad \@$macro line: $_", $line_nr);
        }
    }
    elsif ($macro eq 'indent' or $macro eq 'noindent')
    {
        $state->{'paragraph_indent'} = $macro;
    }
    else
    {
        common_misc_commands($macro, $line, 2, $line_nr);
    }

    ($remaining, $skipped, $args) = preserve_command($line, $macro);
    return ($skipped) if ($keep);
    return $remaining if ($remaining ne '');
    return undef;
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
    my $node_menu_ref = {};
    if (exists($nodes{$node}))
    {
        $node_menu_ref = $nodes{$node};
    }
    else
    {
        $nodes{$node} = $node_menu_ref;
        $node_menu_ref->{'texi'} = $node;
        $node_menu_ref->{'external_node'} = 1 if ($node =~ /\(.+\)/);
    }
    return if ($state->{'detailmenu'});
    if ($state->{'node_ref'})
    {
        $node_menu_ref->{'menu_up'} = $state->{'node_ref'};
        $node_menu_ref->{'menu_up_hash'}->{$state->{'node_ref'}->{'texi'}} = 1;
    }
    else
    {
        echo_warn ("menu entry without previous node: $node", $line_nr) unless ($node =~ /\(.+\)/);
    }
    if ($state->{'prev_menu_node'})
    {
        $node_menu_ref->{'menu_prev'} = $state->{'prev_menu_node'};
        $state->{'prev_menu_node'}->{'menu_next'} = $node_menu_ref;
    }
    elsif ($state->{'node_ref'})
    {
        $state->{'node_ref'}->{'menu_child'} = $node_menu_ref;
    }
    $state->{'prev_menu_node'} = $node_menu_ref;
}

sub equivalent_nodes($)
{
    my $name = shift;
#print STDERR "equivalent_nodes $name\n";
    my $node = normalise_node($name);
    $name = cross_manual_line($node);
    my @equivalent_nodes = ();
    if (exists($cross_reference_nodes{$name}))
    {
        @equivalent_nodes = grep {$_ ne $node} @{$cross_reference_nodes{$name}};
    }
    return @equivalent_nodes;
}

my %files = ();   # keys are files. This is used to avoid reusing an allready
                  # used file name
my %empty_indices = (); # value is true for an index name key if the index 
                        # is empty
my %printed_indices = (); # value is true for an index name not empty and
                          # printed

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
        elsif ($level < $MIN_LEVEL and !$section->{'top'})
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
    
    foreach my $section (@sections_list)
    {
        ########################### debug
        print STDERR "BUG: node or section_ref defined for section $section->{'texi'}\n"
            if (exists($section->{'node'}) or exists($section->{'section_ref'}));
        ########################### end debug
        next if ($section->{'top'});
        print STDERR "Bug level undef for ($section) $section->{'texi'}\n" if (!defined($section->{'level'}));
        $section->{'toplevel'} = 1 if ($section->{'level'} == $toplevel);
        # undef things under that section level
        for (my $level = $section->{'level'} + 1; $level < $MAX_LEVEL + 1 ; $level++)
        {
            $previous_numbers[$level] = undef;
            $previous_sections[$level] = undef;
        }
        my $number_set;
        # find number at the current level
        if ($section->{'tag'} =~ /appendix/ and !$in_appendix)
        {
            $previous_numbers[$toplevel] = 'A';
            $in_appendix = 1;
            $number_set = 1 if ($section->{'level'} == $toplevel);
        }
        if (!defined($previous_numbers[$section->{'level'}]) and !$number_set)
        {
            if ($section->{'tag'} =~ /unnumbered/)
            {
                 $previous_numbers[$section->{'level'}] = undef;
            }
            else
            {
                $previous_numbers[$section->{'level'}] = 1;
            }
        }
        elsif ($section->{'tag'} !~ /unnumbered/ and !$number_set)
        {
            $previous_numbers[$section->{'level'}]++;
        }
        # construct the section number
        $section->{'number'} = '';

        unless ($section->{'tag'} =~ /unnumbered/)
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
            $section->{'number'} = "$toplevel_number.$section->{'number'}";
        }
        # find the previous section
        if (defined($previous_sections[$section->{'level'}]))
        {
            my $prev_section = $previous_sections[$section->{'level'}];
            $section->{'sectionprev'} = $prev_section;
            $prev_section->{'sectionnext'} = $section;
        }
        # find the up section
        if ($section->{'level'} == $toplevel)
        {
            $section->{'sectionup'} = undef;
        }
        else
        {
            my $level = $section->{'level'} - 1;
            while (!defined($previous_sections[$level]) and ($level >= 0))
            {
                 $level--;
            }
            if ($level >= 0)
            {
                $section->{'sectionup'} = $previous_sections[$level];
                # 'child' is the first child
                $section->{'sectionup'}->{'child'} = $section unless ($section->{'sectionprev'});
                push @{$section->{'sectionup'}->{'section_childs'}}, $section;
            }
            else
            {
                 $section->{'sectionup'} = undef;
            }
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

    my @node_directions = ('node_prev', 'node_next', 'node_up');
    # handle nodes 
    # the node_prev... are texinfo strings, find the associated node references
    print STDERR "# Resolve nodes directions\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    foreach my $node (@nodes_list)
    {
        foreach my $direction (@node_directions)
        { 
            if (defined($node->{$direction}) and !ref($node->{$direction})
                and ($node->{$direction} ne ''))
            {
                if ($nodes{$node->{$direction}} and $nodes{$node->{$direction}}->{'seen'})
                {
                     $node->{$direction} = $nodes{$node->{$direction}};
                }
                elsif (($node->{$direction} =~ /^\(.*\)/) or $novalidate)
                { # ref to an external node
                    if (exists($nodes{$node->{$direction}}))
                    {
                        $node->{$direction} = $nodes{$node->{$direction}};
                    }
                    else
                    {
                        # FIXME if {'seen'} this is a node appearing in the
                        # document and a node like `(file)node'. What to 
                        # do then ?
                        my $node_ref = { 'texi' => $node->{$direction} };
                        $node_ref->{'external_node'} = 1 if ($node->{$direction} =~ /^\(.*\)/);
                        $nodes{$node->{$direction}} = $node_ref;
                        $node->{$direction} = $node_ref;
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

    # Now it is possible to find the unknown directions that are equivalent
    # (have same node id) than an existing node
    foreach my $node (@nodes_with_unknown_directions)
    {
        foreach my $direction (@node_directions)
        { 
            if (defined($node->{$direction}) and !ref($node->{$direction})
                and ($node->{$direction} ne ''))
            {
                echo_warn ("$direction `$node->{$direction}' for `$node->{'texi'}' not found");
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
                    echo_warn (" ---> but equivalent node `$node_seen' found");
                    $node->{$direction} = $nodes{$node_seen};
                }
                else
                {
                    delete $node->{$direction};
                }
            }
        }
    }

    # find section preceding and following top 
    my $section_before_top;   # section preceding the top node
    my $section_after_top;       # section following the top node
    if ($node_top)
    {
        my $previous_is_top = 0;
        foreach my $element (@all_elements)
        {
            if ($element eq $node_top)
            {
                $previous_is_top = 1;
                next;
            }
            if ($previous_is_top)
            {
                if ($element->{'section'})
                {
                    $section_after_top = $element;
                    last;
                }
                next;
            }
            $section_before_top = $element if ($element->{'section'});
        }
    }
    print STDERR "# section before Top: $section_before_top->{'texi'}\n" 
        if ($section_before_top and ($T2H_DEBUG & $DEBUG_ELEMENTS));
    print STDERR "# section after Top: $section_after_top->{'texi'}\n" 
         if ($section_after_top and ($T2H_DEBUG & $DEBUG_ELEMENTS));
    
    print STDERR "# Build the elements list\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    if (!$Texi2HTML::Config::USE_NODES)
    {
        #the only sectionning elements are sections
        @elements_list = @sections_list;
        # if there is no section we use nodes...
        if (!@elements_list)
        {
            print STDERR "# no section\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
            @elements_list = @all_elements;
        }
        elsif (!$section_top and $node_top and !$node_top->{'with_section'})
        { # special case for the top node if it isn't associated with 
          # a section. The top node element is inserted between the 
          # $section_before_top and the $section_after_top
            print STDERR "# Top not associated with a section\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
            $node_top->{'top_as_section'} = 1;
            $node_top->{'section_ref'} = $node_top;
            my @old_element_lists = @elements_list;
            @elements_list = ();
            while (@old_element_lists)
            {
                my $section = shift @old_element_lists;
                if ($section_before_top and ($section eq $section_before_top))
                {
                    push @elements_list, $section;
                    push @elements_list, $node_top;
                    last;
                }
                elsif ($section_after_top and ($section eq $section_after_top))
                {
                    push @elements_list, $node_top;
                    push @elements_list, $section;
                    last;
                }
                push @elements_list, $section;
            }
            push @elements_list, @old_element_lists;
        }
        
        foreach my $element (@elements_list)
        {
            print STDERR "# new section element $element->{'texi'}\n"
                if ($T2H_DEBUG & $DEBUG_ELEMENTS);
        }
    }
    else
    {
        # elements are sections if possible, and node if no section associated
        foreach my $element(@all_elements)
        {
            if ($element->{'node'})
            {
                if (!defined($element->{'with_section'}))
                {
                    $element->{'toc_level'} = $MIN_LEVEL if (!defined($element->{'toc_level'}));
                    print STDERR "# new node element ($element) $element->{'texi'}\n"
                        if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                    push @elements_list, $element;
                }
            }
            else
            {
                print STDERR "# new section element ($element) $element->{'texi'}\n"
                    if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                push @elements_list, $element;
            }
        }
    }
    
    # nodes are attached to the section preceding them if not allready 
    # associated with a section
    # here we don't set @{$element->{'nodes'}} since it may be changed 
    # below if split by indices. Therefore we only set 
    # @{$element->{'all_elements'}} with all the elements associated
    # with an element output, in the right order
    print STDERR "# Find the section associated with each node\n"
        if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    my $current_section = $sections_list[0];
    $current_section = $node_top if ($node_top and $node_top->{'top_as_section'} and !$section_before_top);
    foreach my $element (@all_elements)
    {
        if ($element->{'node'} and !$element->{'top_as_section'})
        {
            if ($element->{'with_section'})
            { # the node is associated with a section
                $element->{'section_ref'} = $element->{'with_section'};
                push @{$element->{'section_ref'}->{'all_elements'}}, $element, $element->{'section_ref'};
                # first index is section if the first index is associated with that node
                $element_index = $element->{'section_ref'} if ($element_index and ($element_index eq $element));
            }
            elsif (defined($current_section))
            {# node appearing after a section, but not before another section,
             # or appearing before any section
                $element->{'section_ref'} = $current_section;
                $element->{'toc_level'} = $current_section->{'toc_level'};
                push @{$current_section->{'node_childs'}}, $element;
                if ($Texi2HTML::Config::USE_NODES)
                { # the node is an element itself
                    push @{$element->{'all_elements'}}, $element;
                }
                else
                {
                    push @{$current_section->{'all_elements'}}, $element;
                    # first index is section if the first index is associated with that node
                    $element_index = $current_section if ($element_index and ($element_index eq $element));
                }
            }
            else
            { # seems like there are only nodes in the documents
                $element->{'toc_level'} = $MIN_LEVEL;
                push @{$element->{'all_elements'}}, $element;
            }
        }
        else
        {
            $current_section = $element;
            if ($element->{'node'})
            { # Top node not associated with a section
                $element->{'toc_level'} = $MIN_LEVEL;
                push @{$element->{'section_ref'}->{'all_elements'}}, $element;
            }
            elsif (!$element->{'node_ref'})
            { # a section not preceded by a node
                push @{$element->{'all_elements'}}, $element;
            }
        }
    }

    # find first, last and top elements 
    $element_first = $elements_list[0];
    print STDERR "# element first: $element_first->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS); 
    print STDERR "# top node: $node_top->{'texi'}\n" if (defined($node_top) and
        ($T2H_DEBUG & $DEBUG_ELEMENTS));
    # element top is the element with @top.
    $element_top = $section_top;
    # If the top node is associated with a section it is the top_element 
    # otherwise element top may be the top node 
    $element_top = $node_top if (!defined($element_top) and defined($node_top));
    # If there is no @top section no top node the first node is the top element
    $element_top = $element_first unless (defined($element_top));
    $element_top->{'top'} = 1 if ($element_top->{'node'});
    print STDERR "# element top: $element_top->{'texi'}\n" if ($element_top and
        ($T2H_DEBUG & $DEBUG_ELEMENTS));

    # It is the last element before indices split, which may add new 
    # elements
    $element_last = $elements_list[-1];
    
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
        # appear in menus
        if (!$node->{'first'} and !$node->{'top'} and !$node->{'menu_up'} and ($node->{'texi'} !~ /^top$/i) and $Texi2HTML::Config::SHOW_MENU)
        {
            my @equivalent_nodes = equivalent_nodes($node->{'texi'});
            my $found = 0;
            foreach my $equivalent_node (@equivalent_nodes)
            {
                if ($nodes{$equivalent_node}->{'first'} or $nodes{$equivalent_node}->{'menu_up'})
                {
                   $found = 1;
                   last;
                }
            }
            unless ($found)
            {
                warn "$WARN `$node->{'texi'}' doesn't appear in menus\n";
            }
        }

        # use values deduced from menus to complete missing up, next, prev
        # or from sectionning commands if automatic sectionning
        if ($node->{'node_up'})
        {
            $node->{'nodeup'} = $node->{'node_up'};
        }
        elsif ($node->{'automatic_directions'} and $node->{'section_ref'})
        {
            if (defined($node_top) and ($node eq $node_top))
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
            elsif (defined($node->{'section_ref'}->{'sectionup'}))
            {
                $node->{'nodeup'} = get_node($node->{'section_ref'}->{'sectionup'});
            }
            elsif ($node->{'section_ref'}->{'toplevel'} and ($node->{'section_ref'} ne $element_top))
            {
                $node->{'nodeup'} = get_node($element_top);
            }
            print STDERR "# Deducing from section node_up $node->{'nodeup'}->{'texi'} for $node->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS and defined($node->{'nodeup'}));
        }

        if (!$node->{'nodeup'} and $node->{'menu_up'} and $Texi2HTML::Config::USE_MENU_DIRECTIONS)
        { # makeinfo don't do that
            $node->{'nodeup'} = $node->{'menu_up'};
            print STDERR "# Deducing from menu node_up $node->{'menu_up'}->{'texi'} for $node->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
        }

        if ($node->{'nodeup'} and !$node->{'nodeup'}->{'external_node'})
        {
            # We detect when the up node has no menu entry for that node, as
            # there may be infinite loops when finding following node (see below)
            unless (defined($node->{'menu_up_hash'}) and ($node->{'menu_up_hash'}->{$node->{'nodeup'}->{'texi'}}))
            {
                print STDERR "$WARN `$node->{'nodeup'}->{'texi'}' is up for `$node->{'texi'}', but has no menu entry for this node\n" if ($Texi2HTML::Config::SHOW_MENU);
                push @{$node->{'up_not_in_menu'}}, $node->{'nodeup'}->{'texi'};
            }
        }

        # Find next node
        if ($node->{'node_next'})
        {
            $node->{'nodenext'} = $node->{'node_next'};
        }
        elsif ($node->{'texi'} eq 'Top')
        { # special case as said in the texinfo manual
            $node->{'nodenext'} = $node->{'menu_child'} if ($node->{'menu_child'});
        }
        elsif ($node->{'automatic_directions'})
        {
            if (defined($node->{'section_ref'}))
            {
                my $next;
                my $section = $node->{'section_ref'};
                if (defined($section->{'sectionnext'}))
                {
                    $next = get_node($section->{'sectionnext'})
                }
                else 
                {
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
        }
        # next we try menus. makeinfo don't do that
        if (!defined($node->{'nodenext'}) and $node->{'menu_next'} 
            and $Texi2HTML::Config::USE_MENU_DIRECTIONS)
        {
            $node->{'nodenext'} = $node->{'menu_next'};
        }
        # Find prev node
        if ($node->{'node_prev'})
        {
            $node->{'nodeprev'} = $node->{'node_prev'};
        }
        elsif ($node->{'automatic_directions'})
        {
            if (defined($node->{'section_ref'}))
            {
                my $section = $node->{'section_ref'};
                if (defined($section->{'sectionprev'}))
                {
                    $node->{'nodeprev'} = get_node($section->{'sectionprev'});
                }
                elsif (defined($section->{'sectionup'}))
                {
                    $node->{'nodeprev'} = get_node($section->{'sectionup'});
                }
            }
        }
        # next we try menus. makeinfo don't do that
        if (!defined($node->{'nodeprev'}) and $node->{'menu_prev'} and $Texi2HTML::Config::USE_MENU_DIRECTIONS) 
        {
            $node->{'nodeprev'} = $node->{'menu_prev'};
        }
        # the prev node is the parent node
        elsif (!defined($node->{'nodeprev'}) and $node->{'menu_up'} and $Texi2HTML::Config::USE_MENU_DIRECTIONS)
        {
            $node->{'nodeprev'} = $node->{'menu_up'};
        }
    
        # the following node is the node following in node reading order
        # it is thus first the child, else the next, else the next following
        # the up
        if ($node->{'menu_child'})
        {
            $node->{'following'} = $node->{'menu_child'};
        }
        elsif ($node->{'automatic_directions'} and defined($node->{'section_ref'}) and defined($node->{'section_ref'}->{'child'}))
        {
            $node->{'following'} = get_node($node->{'section_ref'}->{'child'});
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

        if (defined($node->{'section_ref'}))
        {
            my $section = $node->{'section_ref'};
            foreach my $direction ('sectionnext', 'sectionprev', 'sectionup')
            {
                $node->{$direction} = $section->{$direction}
                  if (defined($section->{$direction}));
            }
            # this is a node appearing within a section but not associated
            # with that section. We consider that it is below that section.
            $node->{'sectionup'} = $section
               if (grep {$node eq $_} @{$section->{'node_childs'}});
        }
        # 'up' is used in .init files. Maybe should go away.
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
    
    print STDERR "# find forward and back\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    my $prev;
    foreach my $element (@elements_list)
    {
        $element->{'element'} = 1;
        # complete the up for toplevel elements now that element_top is defined
        print STDERR "# fwd and back for $element->{'texi'}\n" 
            if ($T2H_DEBUG & $DEBUG_ELEMENTS);
        # at that point no node may be toplevel, only sections. 
        if ($element->{'toplevel'} and ($element ne $element_top))
        {
            $element->{'sectionup'} = $element_top;
            $element->{'up'} = $element_top;
        }
        if ($prev)
        {
            $element->{'back'} = $prev;
            $prev->{'forward'} = $element;
            $prev = $element;
        }
        else
        {
            $prev = $element;
        }
        # If the element is not a node, then all the node directions are copied
        # if there is an associated node
        if (defined($element->{'node_ref'}))
        {
            $element->{'nodenext'} = $element->{'node_ref'}->{'nodenext'};
            $element->{'nodeprev'} = $element->{'node_ref'}->{'nodeprev'};
            $element->{'menu_next'} = $element->{'node_ref'}->{'menu_next'};
            $element->{'menu_prev'} = $element->{'node_ref'}->{'menu_prev'};
            $element->{'menu_child'} = $element->{'node_ref'}->{'menu_child'};
            $element->{'menu_up'} = $element->{'node_ref'}->{'menu_up'};
            $element->{'nodeup'} = $element->{'node_ref'}->{'nodeup'};
            $element->{'following'} = $element->{'node_ref'}->{'following'};
        }
        elsif (! $element->{'node'})
        { # the section has no node associated. Find the node directions using 
          # sections
            if (defined($element->{'sectionnext'}))
            {
                 $element->{'nodenext'} = get_node($element->{'sectionnext'});
            }
            if (defined($element->{'sectionprev'}))
            {
                 $element->{'nodeprev'} = get_node($element->{'sectionprev'});
            }
            if (defined($element->{'up'}))
            {
                 $element->{'nodeup'} = get_node($element->{'up'});
            }
            if ($element->{'child'})
            {
                $element->{'following'} = get_node($element->{'child'});
            }
            elsif ($element->{'sectionnext'})
            {
                $element->{'following'} = get_node($element->{'sectionnext'});
            }
            elsif ($element->{'up'})
            {
                my $up = $element;
                while ($up->{'up'} and !$element->{'following'})
                {
                    print STDERR "# Going up, searching next section from $up->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                    $up = $up->{'up'};
                    if ($up->{'sectionnext'})
                    {
                        $element->{'following'} = get_node ($up->{'sectionnext'});
                    }
                    # avoid infinite loop if the top is up for itself
                    last if ($up->{'toplevel'} or $up->{'top'});
                }
            }
        }
    }

    my @new_elements = ();
    print STDERR "# preparing indices\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);

    while(@elements_list)
    {
        my $element = shift @elements_list;
        # current_element is the last element which can hold text. It is 
        # initialized to a fake element
        my $current_element = { 'holder' => 1, 'texi' => 'HOLDER', 
            'place' => [], 'indices' => [] };
        # $back, $forward and $sectionnext are kept because $element
        # is in @{$element->{'all_elements'}}, so it is possible that 
        # those directions get changed.
        # back is set to find back and forward
        my $back = $element->{'back'} if defined($element->{'back'});
        my $forward = $element->{'forward'};
        my $sectionnext = $element->{'sectionnext'};
        my $index_num = 0;
        my @waiting_elements = (); # elements (nodes) not used for sectionning 
                                 # waiting to be associated with an element
        foreach my $checked_element(@{$element->{'all_elements'}})
        {
	    if ($checked_element->{'element'})
            { # this is the element, we must add it
                push @new_elements, $checked_element;
                if ($current_element->{'holder'})
                { # no previous element added
                    push @{$checked_element->{'place'}}, @{$current_element->{'place'}};
                    foreach my $index(@{$current_element->{'indices'}})
                    {
                        push @{$checked_element->{'indices'}}, [ { 'element' => $checked_element, 'page' => $index->[0]->{'page'}, 'name' => $index->[0]->{'name'} } ] ;
                    }
                }
                else
                {  
                    $current_element->{'sectionnext'} = $checked_element;
                    $current_element->{'following'} = $checked_element;
                    $checked_element->{'sectionprev'} = $current_element;
                }
                $current_element = $checked_element;
                $checked_element->{'back'} = $back;
                $back->{'forward'} = $checked_element if (defined($back));
                $back = $checked_element;
                push @{$checked_element->{'nodes'}}, @waiting_elements;
                @waiting_elements = ();
            }
            elsif ($current_element->{'holder'})
            {
                push @waiting_elements, $checked_element;
            }
            else
            {
                push @{$current_element->{'nodes'}}, $checked_element;
                $checked_element->{'section_ref'} = $current_element;
            }
            push @{$current_element->{'place'}}, @{$checked_element->{'current_place'}};
            foreach my $index (@{$checked_element->{'index_names'}})
            {
                print STDERR "# Index in `$checked_element->{'texi'}': $index->{'name'}. Current is `$current_element->{'texi'}'\n"
                    if ($T2H_DEBUG & $DEBUG_INDEX);
                my ($pages, $entries) = get_index($index->{'name'});
                if (defined($pages))
                {
                    my @pages = @$pages;
                    my $first_page = shift @pages;
                    ############################## begin debug section
                    my $back_texi = 'NO_BACK';
                    $back_texi = $back->{'texi'} if (defined($back));
                    print STDERR "# Index first page (back `$back_texi', in  `$current_element->{'texi'}')\n" if ($T2H_DEBUG & $DEBUG_INDEX);
                    ############################## end debug section
                    push @{$current_element->{'indices'}}, [ {'element' => $current_element, 'page' => $first_page, 'name' => $index->{'name'} } ];
                    if (@pages)
                    {# index is split accross more than one page
                        if ($current_element->{'holder'})
                        { # the current element isn't an element which is
                          # normally outputted. We add a real element. 
                          # we are in a node of a section but the element
                          # is split by the index, thus we must add 
                          # a new element which will contain the text 
                          # between the beginning of the element and the index
                          # WARNING the added element is like a section, and
                          # indeed it is a 'section_ref' and 'sectionup' 
                          # for other nodes, it has 'nodes' 
                          # (see below and above).
                          # But it is also a node. It may have a 'with_section'
                          # and have a 'section_ref'
                          # it may be considered 'node_ref' for a section.
                          # and the Texi2HTML::NODE is relative to this
                          # added element.
                            
                            push @new_elements, $checked_element;
                            print STDERR "# Add `$checked_element->{'texi'}' before index page for `$element->{'texi'}'\n" 
                                if ($T2H_DEBUG & $DEBUG_INDEX);
                            echo_warn("Add `$checked_element->{'texi'}' for indicing");
                            $checked_element->{'element'} = 1;
                            $checked_element->{'level'} = $element->{'level'};
                            $checked_element->{'toc_level'} = $element->{'toc_level'};
                            $checked_element->{'toplevel'} = $element->{'toplevel'};
                            if ($element->{'top'})
                            {
                                $checked_element->{'toplevel'} = 1; 
                                $checked_element->{'top'} = 1;
                            }
                            $checked_element->{'up'} = $element->{'up'};
                            $checked_element->{'sectionup'} = $element->{'sectionup'};
                            $checked_element->{'element_added'} = 1;
                            print STDERR "Bug: checked element wasn't seen" if 
                                 (!$checked_element->{'seen'});
                            $element->{'sectionprev'}->{'sectionnext'} = $checked_element if (exists($element->{'sectionprev'}));
                            push @{$checked_element->{'place'}}, @{$current_element->{'place'}};
                            foreach my $index(@{$current_element->{'indices'}})
                            {
                                push @{$checked_element->{'indices'}}, [ { 'element' => $checked_element, 'page' => $index->[0]->{'page'}, 'name' => $index->[0]->{'name'} } ] ;
                            }
                            foreach my $waiting_element (@waiting_elements)
                            {
                                 next if ($waiting_element eq $checked_element);
                                 $waiting_element->{'section_ref'} = $checked_element;
                                 $waiting_element->{'sectionup'} = $checked_element;
                                 push @{$checked_element->{'nodes'}}, $waiting_element;
                            }
                            @waiting_elements = ();
                            $checked_element->{'back'} = $back;
                            $back->{'forward'} = $checked_element if (defined($back));
                            $current_element = $checked_element;
                            $back = $checked_element;
                        }
                        my $index_page;
                        while(@pages)
                        {
                            print STDERR "# New page (back `$back->{'texi'}', current `$current_element->{'texi'}')\n" if ($T2H_DEBUG & $DEBUG_INDEX);
                            $index_num++;
                            my $page = shift @pages;
                            $index_page = { 'index_page' => 1,
                             'texi' => "NOT REALLY USED: $current_element->{'texi'}' index $index->{'name'} page $index_num",
                             'level' => $element->{'level'},
                             'tag' => $element->{'tag'},
                             'tag_level' => $element->{'tag_level'},
                             'toplevel' => $element->{'toplevel'},
                             'top' => $element->{'top'},
                             'up' => $element->{'up'},
                             'sectionup' => $element->{'sectionup'},
                             'back' => $back,
                             'prev' => $back,
                             'sectionnext' => $sectionnext,
                             'following' => $current_element->{'following'},
                             'nodeup' => $current_element->{'nodeup'},
                             'nodenext' => $current_element->{'nodenext'},
                             'nodeprev' => $back,
                             'place' => [],
                             'seen' => 1,
                             'page' => $page
                            };
                            # the index page is associated with the new element
                            # if there is one, the element otherwise
                            if ($checked_element->{'element_added'})
                            {
                                $index_page->{'original_index_element'} = $checked_element;
                            }
                            else
                            {
                                $index_page->{'original_index_element'} = $element;
                            }
                            $index_page->{'node'} = 1 if ($element->{'node'});
                            while ($nodes{$index_page->{'texi'}})
                            {
                                $nodes{$index_page->{'texi'}} .= ' ';
                            }
                            $nodes{$index_page->{'texi'}} = $index_page;
                            push @{$current_element->{'indices'}->[-1]}, {'element' => $index_page, 'page' => $page, 'name' => $index->{'name'} };
                            push @new_elements, $index_page;
                            $back->{'forward'} = $index_page;
                            $back->{'nodenext'} = $index_page;
                            $back->{'sectionnext'} = $index_page unless ($back->{'top'});
                            $back->{'following'} = $index_page;
                            $back = $index_page;
                            $index_page->{'toplevel'} = 1 if ($element->{'top'});
                        }
                        $current_element = $index_page;
                    }
                }
                else
                {
                    print STDERR "# Empty index: $index->{'name'}\n" 
                        if ($T2H_DEBUG & $DEBUG_INDEX);
                    $empty_indices{$index->{'name'}} = 1;
                }
                push @{$current_element->{'place'}}, @{$index->{'place'}};
            }
        }
        if ($forward and ($current_element ne $element))
        {
            $current_element->{'forward'} = $forward;
            $forward->{'back'} = $current_element;
        }
        next if ($current_element eq $element or !$element->{'toplevel'});
        # reparent the elements below $element to the last index page
        print STDERR "# Reparent for `$element->{'texi'}':\n" if ($T2H_DEBUG & $DEBUG_INDEX);
        foreach my $reparented(@{$element->{'section_childs'}},@{$element->{'node_childs'}})
        {
            $reparented->{'sectionup'} = $current_element;
	    print STDERR "   reparented: $reparented->{'texi'}\n"
                    if ($T2H_DEBUG & $DEBUG_INDEX);
        }
    }
    @elements_list = @new_elements;
    
    print STDERR "# find fastback and fastforward\n" 
       if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    foreach my $element (@elements_list)
    {
        my $up = get_top($element);
        next unless (defined($up));
        $element_chapter_index = $up if ($element_index and ($element_index eq $element));
        # fastforward is the next element on same level than the upper parent
        # element
        $element->{'fastforward'} = $up->{'sectionnext'} if (exists ($up->{'sectionnext'}));
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
    # to that node.
    # It is the section associated with the node except if USE_NODES
    unless ($Texi2HTML::Config::USE_NODES)
    {
        foreach my $node(@nodes_list)
        {
            if ($node->{'with_section'})
            {
                $node->{'reference_element'} = $node->{'with_section'};
            }
        }
    }

    my $index_nr = 0;
    # convert directions in direction with first letter in all caps, to be
    # consistent with the convention used in the .init file.
    # find id for nodes and indices
    foreach my $element (@elements_list)
    {
        $element->{'this'} = $element;
        foreach my $direction (@element_directions)
        {
            my $direction_no_caps = $direction;
            $direction_no_caps =~ tr/A-Z/a-z/;
            $element->{$direction} = $element->{$direction_no_caps};
        }
        if ($element->{'index_page'})
        {
            $element->{'id'} = "INDEX" . $index_nr;
            $index_nr++;
        }
    }

    print STDERR "# find float id\n" 
       if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    foreach my $float (@floats)
    {
        $float->{'style_id'} = cross_manual_line(normalise_space($float->{'style_texi'}));
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
        if (defined($up) and $up->{'number'} ne '')
        {
            $float->{'chapter_nr'} = $up->{'number'};
            $float->{'nr'} = $float->{'chapter_nr'} . $float_style->{'nr_in_chapter'};
        }
        else
        {
            $float->{'nr'} = $float->{'absolute_nr'};
        }
    }
    
    if ($Texi2HTML::Config::NEW_CROSSREF_STYLE)
    { 
        foreach my $key (keys(%nodes))
        {
            my $node = $nodes{$key};
            next if ($node->{'external_node'} or $node->{'index_page'});
            $node->{'id'} = node_to_id($node->{'cross_manual_target'});
        }
    }

    # Find node file names and file names for nodes considered as elements
    my $node_as_top;
    if ($node_top)
    {
        $node_as_top = $node_top;
    }
    elsif ($element_top->{'node_ref'})
    {
        $node_as_top = $element_top->{'node_ref'};
    }
    else
    {
        $node_as_top = $node_first;
    }
    if ($node_as_top)
    {
        my $node_file;
        $node_file = &$Texi2HTML::Config::node_file_name($node_as_top,'top');
        $node_as_top->{'node_file'} = $node_file if (defined($node_file));
    }
    foreach my $key (keys(%nodes))
    {
        my $node = $nodes{$key};
        next if (defined($node_as_top) and ($node eq $node_as_top));
        my $node_file = &$Texi2HTML::Config::node_file_name($node,'');
        $node->{'node_file'} = $node_file if (defined($node_file));
    }
    
    print STDERR "# split and set files\n" 
       if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    # find document nr and document file for sections and nodes. 
    # Split according to Texi2HTML::Config::SPLIT.
    # find file and id for placed elements (anchors, index entries, headings)
    if ($Texi2HTML::Config::SPLIT)
    {
        my $cut_section = $toplevel;
        my $doc_nr = -1;
        if ($Texi2HTML::Config::SPLIT eq 'section')
        {
            $cut_section = 2 if ($toplevel <= 2);
        }
        my $previous_file;
        foreach my $element (@elements_list)
        { 
            print STDERR "# Splitting ($Texi2HTML::Config::SPLIT:$cut_section) $element->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
            my $new_file = 0;
            if (
               ($Texi2HTML::Config::SPLIT eq 'node') or
               (
                 defined($element->{'level'}) and ($element->{'level'} <= $cut_section)
               )
              )
            {
                $new_file = 1;
                $doc_nr++;
            }
            $doc_nr = 0 if ($doc_nr < 0); # happens if first elements are nodes
            $element->{'doc_nr'} = $doc_nr;
            my $is_top = '';
            $element->{'file'} = "${docu_name}_$doc_nr"
                   . ($docu_ext ? ".$docu_ext" : "");
            if ($element->{'top'} or (defined($element->{'node_ref'}) and $element->{'node_ref'} eq $element_top))
            { # the top elements
                $is_top = "top";
                $element->{'file'} = $docu_top;
            }
            elsif ($Texi2HTML::Config::NODE_FILES)
            {
                if ($new_file)
                {
                    my $node = get_node($element) unless(exists($element->{'node_ref'})
                        and $element->{'node_ref'}->{'element_added'});
                    if ($node and defined($node->{'node_file'}))
                    {
                        $element->{'file'} = $node->{'node_file'};
                    }
                    $previous_file = $element->{'file'};
                }
                elsif($previous_file)
                {
                    $element->{'file'} = $previous_file;
                }
            }
            if (defined($Texi2HTML::Config::element_file_name))
            {
                my $filename = 
                    &$Texi2HTML::Config::element_file_name ($element, $is_top, $docu_name);
                $element->{'file'} = $filename if (defined($filename));
            }
            print STDERR "# add_file $element->{'file'} for $element->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
            add_file($element->{'file'});
            foreach my $place(@{$element->{'place'}})
            {
                $place->{'file'} = $element->{'file'};
                $place->{'id'} = $element->{'id'} unless defined($place->{'id'});
            }
            if ($element->{'nodes'})
            {
                foreach my $node (@{$element->{'nodes'}})
                {
                    $node->{'doc_nr'} = $element->{'doc_nr'};
                    $node->{'file'} = $element->{'file'};
                }
            }
        }
    }
    else
    { # not split
        add_file($docu_doc);
        foreach my $element(@elements_list)
        {
            $element->{'file'} = $docu_doc;
            $element->{'doc_nr'} = 0;
            foreach my $place(@{$element->{'place'}})
            {
                $place->{'file'} = $element->{'file'};
                $place->{'id'} = $element->{'id'} unless defined($place->{'id'});
            }
        }
        foreach my $node(@nodes_list)
        {
            $node->{'file'} = $docu_doc;
            $node->{'doc_nr'} = 0;
        }
    }
    # correct the id and file for the things placed in footnotes
    foreach my $place(@{$footnote_element->{'place'}})
    {
        $place->{'file'} = $footnote_element->{'file'};
        $place->{'id'} = $footnote_element->{'id'} unless defined($place->{'id'});
    }
    # if setcontentsaftertitlepage is set, the contents should be associated
    # with the titlepage. That's wat is done there.
    push @$no_element_associated_place, $content_element{'contents'} 
      if ($Texi2HTML::Config::DO_CONTENTS and $Texi2HTML::THISDOC{'setcontentsaftertitlepage'});
    push @$no_element_associated_place, $content_element{'shortcontents'} 
      if ($Texi2HTML::Config::DO_SCONTENTS and $Texi2HTML::THISDOC{'setshortcontentsaftertitlepage'});
    # correct the id and file for the things placed in regions (copying...)
    foreach my $place(@$no_element_associated_place)
    {
#print STDERR "entry $place->{'entry'} texi $place->{'texi'}\n";
        $place->{'file'} = $element_top->{'file'};
        $place->{'id'} = $element_top->{'id'} unless defined($place->{'id'});
        $place->{'element'} =  $element_top if (exists($place->{'element'}));
    }
    foreach my $content_type(keys(%content_element))
    {
        # with set*aftertitlepage, there will always be a href to Contents
        # or Overview pointing to the top element, even if there is no 
        # titlepage outputed.
        if ((!defined($content_element{$content_type}->{'file'})) and $Texi2HTML::Config::INLINE_CONTENTS)
        {
            print STDERR "# No content $content_type\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
            $content_element{$content_type} = undef;
        }
    }

    ########################### debug prints
    foreach my $file (keys(%files))
    {
        last unless ($T2H_DEBUG & $DEBUG_ELEMENTS);
        print STDERR "$file: counter $files{$file}->{'counter'}\n";
    }
    foreach my $element ((@elements_list, $footnote_element))
    {
        last unless ($T2H_DEBUG & $DEBUG_ELEMENTS);
        my $is_toplevel = 'not toplevel';
        $is_toplevel = 'toplevel' if ($element->{'toplevel'});
        print STDERR "$element ";
        if ($element->{'index_page'})
        {
            print STDERR "index($element->{'id'}, $is_toplevel, doc_nr $element->{'doc_nr'}($element->{'file'})): $element->{'texi'}\n";
        }
        elsif ($element->{'node'})
        {
            print STDERR "node($element->{'id'}, toc_level $element->{'toc_level'}, $is_toplevel, doc_nr $element->{'doc_nr'}($element->{'file'})) $element->{'texi'}:\n";
            print STDERR "  section_ref: $element->{'section_ref'}->{'texi'}\n" if (defined($element->{'section_ref'}));
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
        print STDERR "  TOP($toplevel) " if ($element->{'top'});
        print STDERR "  u: $element->{'up'}->{'texi'}\n" if (defined($element->{'up'}));
        print STDERR "  ch: $element->{'child'}->{'texi'}\n" if (defined($element->{'child'}));
        print STDERR "  fb: $element->{'fastback'}->{'texi'}\n" if (defined($element->{'fastback'}));
        print STDERR "  b: $element->{'back'}->{'texi'}\n" if (defined($element->{'back'}));
        print STDERR "  p: $element->{'prev'}->{'texi'}\n" if (defined($element->{'prev'}));
        print STDERR "  n: $element->{'sectionnext'}->{'texi'}\n" if (defined($element->{'sectionnext'}));
        print STDERR "  n_u: $element->{'nodeup'}->{'texi'}\n" if (defined($element->{'nodeup'}));
        print STDERR "  f: $element->{'forward'}->{'texi'}\n" if (defined($element->{'forward'}));
        print STDERR "  follow: $element->{'following'}->{'texi'}\n" if (defined($element->{'following'}));
	print STDERR "  m_p: $element->{'menu_prev'}->{'texi'}\n" if (defined($element->{'menu_prev'}));
	print STDERR "  m_n: $element->{'menu_next'}->{'texi'}\n" if (defined($element->{'menu_next'}));
	print STDERR "  m_u: $element->{'menu_up'}->{'texi'}\n" if (defined($element->{'menu_up'}));
	print STDERR "  m_ch: $element->{'menu_child'}->{'texi'}\n" if (defined($element->{'menu_child'}));
        print STDERR "  ff: $element->{'fastforward'}->{'texi'}\n" if (defined($element->{'fastforward'}));
        if (defined($element->{'menu_up_hash'}))
        {
            print STDERR "  parent nodes:\n";
            foreach my $menu_up (keys%{$element->{'menu_up_hash'}})
            {
                print STDERR "   $menu_up ($element->{'menu_up_hash'}->{$menu_up})\n";
            }
        }
        if (defined($element->{'nodes'}))
        {
            print STDERR "  nodes: $element->{'nodes'} (@{$element->{'nodes'}})\n";
            foreach my $node (@{$element->{'nodes'}})
            {
                my $beginning = "   ";
                $beginning = "  *" if ($node->{'with_section'});
                my $file = $node->{'file'};
                $file = "file undef" if (! defined($node->{'file'}));
                print STDERR "${beginning}$node->{'texi'} $file\n";
            }
        }
        print STDERR "  places: $element->{'place'}\n";
        foreach my $place(@{$element->{'place'}})
        {
            if (!$place->{'entry'} and !$place->{'float'} and !$place->{'texi'} and !$place->{'contents'} and !$place->{'shortcontents'})
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
                print STDERR "    index($place): $place->{'entry'}\n";
            }
            elsif ($place->{'anchor'})
            {
                print STDERR "    anchor: $place->{'texi'}\n";
            }
            elsif ($place->{'float'})
            {
                if (defined($place->{'texi'}))
                {
                    print STDERR "    float($place): $place->{'texi'}\n";
                }
                else
                {
                    print STDERR "    float($place): NO LABEL\n";
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
            else
            {
                print STDERR "    heading: $place->{'texi'}\n";
            }
        }
        if ($element->{'indices'})
        {
            print STDERR "  indices: $element->{'indices'}\n";
            foreach my $index(@{$element->{'indices'}})
            {
                print STDERR "    $index: ";
                foreach my $page (@$index)
                {
                    print STDERR "'$page->{'element'}->{'texi'}'($page->{'name'}): $page->{'page'} ";
                }
                print STDERR "\n";
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
           #'type' => 'section', 
           'counter' => 1,
           'relative_foot_num' => 1,
           'foot_lines' => []
         };
    }
}

# find parent element which is a top element, or a node within the top section
sub get_top($)
{
   my $element = shift;
   my $up = $element;
   while (!$up->{'toplevel'} and !$up->{'top'})
   {
       $up = $up->{'sectionup'};
       if (!defined($up))
       {
           # If there is no section, it is normal not to have toplevel element,
           # and it is also the case if there is a low level element before
           # a top level element
           return undef;
       }
   }
   return $up;
}

sub get_node($)
{
    my $element = shift;
    return undef if (!defined($element));
    return $element if ($element->{'node'});
    return $element->{'node_ref'} if ($element->{'node_ref'});
    return $element;
}

sub do_section_names($$)
{
    my $number = shift;
    my $section = shift;
    #$section->{'name'} = substitute_line($section->{'texi'});
    my $texi = &$Texi2HTML::Config::heading_texi($section->{'tag'}, $section->{'texi'}, $section->{'number'});
    $section->{'text'} = substitute_line($texi);
    $section->{'text_nonumber'} = substitute_line($section->{'texi'});
    # backward compatibility
    $section->{'name'} = $section->{'text_nonumber'};
    $section->{'no_texi'} = remove_texi($texi);
    $section->{'simple_format'} = simple_format(undef,$texi);
    $section->{'heading_texi'} = $texi;
}

# get the html names from the texi for all elements
sub do_names()
{
    print STDERR "# Doing ". scalar(keys(%nodes)) . " nodes, ".
        scalar(keys(%sections)) . " sections, " .
        scalar(keys(%headings)) . "headings in ". $#elements_list . 
        " elements\n" if ($T2H_DEBUG);
    # for nodes and anchors we haven't any state defined
    # This seems right, however, as we don't want @refs or @footnotes
    # or @anchors within nodes, section commands or anchors.
    foreach my $node (keys(%nodes))
    {
        next if ($nodes{$node}->{'index_page'}); # some nodes are index pages.
        my $texi = &$Texi2HTML::Config::heading_texi($nodes{$node}->{'tag'}, 
           $nodes{$node}->{'texi'}, undef);
        $nodes{$node}->{'text'} = substitute_line ($texi);
        $nodes{$node}->{'text_nonumber'} = $nodes{$node}->{'text'};
        # backward compatibility
        $nodes{$node}->{'name'} = $nodes{$node}->{'text_nonumber'};
        $nodes{$node}->{'no_texi'} = remove_texi($texi);
        $nodes{$node}->{'simple_format'} = simple_format(undef, $texi);
        $nodes{$node}->{'heading_texi'} = $texi;
        # FIXME : what to do if $nodes{$node}->{'external_node'} and
        # $nodes{$node}->{'seen'}
    }
    foreach my $number (keys(%sections))
    {
        do_section_names($number, $sections{$number});
    }
    foreach my $number (keys(%headings))
    {
        do_section_names($number, $headings{$number});
    }
    my $tocnr = 1;
    foreach my $element (@elements_list)
    {
        if (!$element->{'top'} and !$element->{'index_page'})
        { # for link back to table of contents
          # FIXME do it for top too?
            $element->{'tocid'} = 'TOC' . $tocnr;
            $tocnr++;
        }
        next if (defined($element->{'text'}));
        if ($element->{'index_page'})
        {
            my $page = $element->{'page'};
            my $original_element = $element->{'original_index_element'};
            my $texi = &$Texi2HTML::Config::index_element_heading_texi(
                 $original_element->{'heading_texi'}, 
                 $original_element->{'tag'}, 
                 $original_element->{'texi'},
                 $original_element->{'number'},
                 $page->{'first_letter'}, $page->{'last_letter'});
            $element->{'heading_texi'} = $texi;
            $element->{'text'} = substitute_line($texi);
            $element->{'no_texi'} = remove_texi($texi);
            $element->{'simple_format'} = simple_format(undef,$texi);
        }
    }
    print STDERR "# Names done\n" if ($T2H_DEBUG);
}

@{$Texi2HTML::TOC_LINES} = ();            # table of contents
@{$Texi2HTML::OVERVIEW} = ();           # short table of contents



#+++############################################################################
#                                                                              #
# Stuff related to Index generation                                            #
#                                                                              #
#---############################################################################

# called during pass_structure
sub enter_index_entry($$$$$$$)
{
    my $prefix = shift;
    my $line_nr = shift;
    my $key = shift;
    my $place = shift;
    my $element = shift;
    my $use_section_id = shift;
    my $command = shift;
    unless ($index_prefix_to_name{$prefix})
    {
        echo_error ("Undefined index command: ${prefix}index", $line_nr);
        $key = '';
    }
    if (!exists($element->{'tag'}) and !$element->{'footnote'})
    {
        echo_warn ("Index entry before document: \@${prefix}index $key", $line_nr); 
    }
    $key =~ s/\s+$//;
    $key =~ s/^\s*//;
    my $entry = $key;
    # The $key is mostly usefull for alphabetical sorting
    $key = remove_texi($key);
    my $id = '';
    # don't add a specific index target if after a section or the index
    # entry is in @copying or the like
    unless ($use_section_id or ($place eq $no_element_associated_place))
    {
        $id = 'IDX' . ++$idx_num;
    }
    my $index_entry = {
           'entry'    => $entry,
           'element'  => $element,
           'prefix'   => $prefix,
           'label'    => $id,
           'command'  => $command
    };
            
    print STDERR "# enter \@$command ${prefix}index '$key' with id $id ($index_entry)\n"
        if ($T2H_DEBUG & $DEBUG_INDEX);
    if ($key =~ /^\s*$/)
    {
        echo_warn("Empty index entry for \@$command",$line_nr);
        # don't add the index entry to the list of index entries used for index
        # entry formatting,if the index entry appears in a region like copying 
        push @index_labels, $index_entry unless ($place eq $no_element_associated_place);
        return;
    }
    while (exists $index->{$prefix}->{$key})
    {
        $key .= ' ';
    }
    $index->{$prefix}->{$key} = $index_entry;
    push @$place, $index_entry;
    # don't add the index entry to the list of index entries used for index
    # entry formatting,if the index entry appears in a region like copying 
    push @index_labels, $index_entry unless ($place eq $no_element_associated_place);
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

# returns an array of index entries pages splitted by letters
# each page has the following members:
# 'first_letter'       first letter on that page
# 'last_letter'        last letter on that page
# 'letters'            ref on an array with all the letters for that page
# 'entries_by_letter'  ref on a hash. Each key is a letter, with value a ref 
#                      on arrays of index entries beginning with this letter
sub get_index_pages($)
{
    my $entries = shift;
    my (@letters);
    my ($entries_by_letter, $pages, $page) = ({}, [], {});
    my @keys = sort by_alpha keys %$entries;

    # each index entry is placed according to its first letter in
    # entries_by_letter
    for my $key (@keys)
    {
        push @{$entries_by_letter->{uc(substr($key,0, 1))}} , $entries->{$key};
    }
    @letters = sort by_alpha keys %$entries_by_letter;
    $Texi2HTML::Config::SPLIT_INDEX = 0 unless $Texi2HTML::Config::SPLIT;

    if ($Texi2HTML::Config::SPLIT_INDEX and $Texi2HTML::Config::SPLIT_INDEX =~ /^\d+$/)
    {
        my $i = 0;
        my ($prev_letter);
        foreach my $letter (@letters)
        {
            if ($i > $Texi2HTML::Config::SPLIT_INDEX)
            {
                $page->{'last_letter'} = $prev_letter;
                push @$pages, $page;
                $i=0;
            }
	    if ($i == 0)
	    {
		$page = {};
		$page->{'letters'} = [];
		$page->{'entries_by_letter'} = {};
		$page->{'first_letter'} = $letter;
	    }
            push @{$page->{'letters'}}, $letter;
            $page->{'entries_by_letter'}->{$letter} = [@{$entries_by_letter->{$letter}}];
            $i += scalar(@{$entries_by_letter->{$letter}});
            $prev_letter = $letter;
        }
        $page->{'last_letter'} = $letters[$#letters];
        push @$pages, $page;
    }
    else
    {
        warn "$WARN Bad Texi2HTML::Config::SPLIT_INDEX: $Texi2HTML::Config::SPLIT_INDEX\n" if ($Texi2HTML::Config::SPLIT_INDEX);
        $page->{'first_letter'} = $letters[0];
        $page->{'last_letter'} = $letters[$#letters];
        $page->{'letters'} = \@letters;
        $page->{'entries_by_letter'} = $entries_by_letter;
        push @$pages, $page;
        return $pages;
    }
    return $pages;
}

# return the page and the entries. Cache the result in %indices.
sub get_index($;$)
{
    my $index_name = shift;
    my $line_nr = shift;

    return (@{$indices{$index_name}}) if ($indices{$index_name});

    unless (exists($index_names{$index_name}))
    {
        echo_error ("Bad index name: $index_name", $line_nr);
        return;
    }
    # add the index name itself to the index names searched for index
    # prefixes. Only those found associated by synindex or syncodeindex are 
    # allready there (unless this code has allready been called).
    if ($index_names{$index_name}->{'code'})
    {
        $index_names{$index_name}->{'associated_indices_code'}->{$index_name} = 1;
    }
    else
    {
        $index_names{$index_name}->{'associated_indices'}->{$index_name} = 1;
    }

    # find all the index names associated with the prefixes and then 
    # all the entries associated with each prefix
    my $entries = {};
    foreach my $associated_indice(keys %{$index_names{$index_name}->{'associated_indices'}})
    {
        foreach my $prefix(@{$index_names{$associated_indice}->{'prefix'}})
        {
            foreach my $key (keys %{$index->{$prefix}})
            {
                $entries->{$key} = $index->{$prefix}->{$key};
            }
        }
    }

    foreach my $associated_indice (keys %{$index_names{$index_name}->{'associated_indices_code'}})
    {
        unless (exists ($index_names{$index_name}->{'associated_indices'}->{$associated_indice}))
        {
            foreach my $prefix (@{$index_names{$associated_indice}->{'prefix'}})
            {
                foreach my $key (keys (%{$index->{$prefix}}))
                {
                    $entries->{$key} = $index->{$prefix}->{$key};
                    # use @code for code style index entry
                    $entries->{$key}->{'entry'} = "\@code{$entries->{$key}->{entry}}";
                }
            }
        }
    }

    return unless %$entries;
    my $pages = get_index_pages($entries);
    $indices{$index_name} = [ $pages, $entries ];
    return ($pages, $entries);
}

my @foot_lines = ();           # footnotes
my $copying_comment = '';      # comment constructed from text between
                               # @copying and @end copying with licence
my $to_encoding;               # out file encoding
my %acronyms_like = ();        # acronyms or similar commands associated texts
                               # the key are the commands, the values are
                               # hash references associating shorthands to
                               # texts.

sub initialise_state($)
{
    my $state = shift;
    $state->{'preformatted'} = 0 unless exists($state->{'preformatted'}); 
    $state->{'code_style'} = 0 unless exists($state->{'code_style'}); 
    $state->{'math_style'} = 0 unless exists($state->{'math_style'}); 
    $state->{'keep_texi'} = 0 unless exists($state->{'keep_texi'});
    $state->{'keep_nr'} = 0 unless exists($state->{'keep_nr'});
    $state->{'detailmenu'} = 0 unless exists($state->{'detailmenu'});     # number of opened detailed menus      
    $state->{'table_list_stack'} = [ {'format' => "noformat"} ] unless exists($state->{'table_list_stack'});
    $state->{'paragraph_style'} = [ '' ] unless exists($state->{'paragraph_style'}); 
    $state->{'preformatted_stack'} = [ '' ] unless exists($state->{'preformatted_stack'}); 
    $state->{'menu'} = 0 unless exists($state->{'menu'}); 
    $state->{'command_stack'} = [] unless exists($state->{'command_stack'});
    $state->{'quotation_stack'} = [] unless exists($state->{'quotation_stack'});
    # if there is no $state->{'element'} the first element is used
    $state->{'element'} = $elements_list[0] unless (exists($state->{'element'}) and !$state->{'element'}->{'before_anything'});
}

sub pass_text()
{
    my %state;
    initialise_state(\%state);
    my @stack;
    my $text;
    my $doc_nr;
    my $in_doc = 0;
    my $element;
    my @text =();
    my @section_lines = ();
    my @head_lines = ();
    my $one_section = 1 if (@elements_list == 1);

    push_state(\%state);

    if (@elements_list == 0)
    {
        warn "$WARN empty document\n";
        exit (0);
    }

    # We set titlefont only if the titlefont appeared in the top element
    if (defined($element_top->{'titlefont'}))
    {
         $value{'_titlefont'} = $element_top->{'titlefont'};
    }
    
    # prepare %Texi2HTML::THISDOC
#    $Texi2HTML::THISDOC{'settitle_texi'} = $value{'_settitle'};
    $Texi2HTML::THISDOC{'fulltitle_texi'} = '';
    $Texi2HTML::THISDOC{'title_texi'} = '';
    foreach my $possible_fulltitle (('_title', '_settitle', '_shorttitlepage', '_titlefont'))
    {
        if ($value{$possible_fulltitle} ne '')
        {
            $Texi2HTML::THISDOC{'fulltitle_texi'} = $value{$possible_fulltitle};
            last;
        }
    }
    foreach my $possible_title_texi ($value{'_settitle'}, $Texi2HTML::THISDOC{'fulltitle_texi'})
    {
        if ($possible_title_texi ne '')
        {
            $Texi2HTML::THISDOC{'title_texi'} = $possible_title_texi;
            last;
        }
    }
#    $Texi2HTML::THISDOC{'fulltitle_texi'} = $value{'_title'} || $value{'_settitle'} || $value{'_shorttitlepage'} || $value{'_titlefont'};
#    $Texi2HTML::THISDOC{'title_texi'} = $value{'_title'} || $value{'_settitle'} || $value{'_shorttitlepage'} || $value{'_titlefont'};
    foreach my $texi_cmd (('shorttitlepage', 'settitle', 'author',
           'titlefont', 'subtitle', 'shorttitle'))
    {
        $Texi2HTML::THISDOC{$texi_cmd . '_texi'} = $value{'_' . $texi_cmd};
    }
    foreach my $doc_thing (('shorttitlepage', 'settitle', 'author',
           'titlefont', 'subtitle', 'shorttitle', 'fulltitle', 'title'))
    {
        my $thing_texi = $Texi2HTML::THISDOC{$doc_thing . '_texi'};
        $Texi2HTML::THISDOC{$doc_thing} = substitute_line($thing_texi);
        $Texi2HTML::THISDOC{$doc_thing . '_no_texi'} =
           remove_texi($thing_texi);
        $Texi2HTML::THISDOC{$doc_thing . '_simple_format'} =
           simple_format(undef, $thing_texi);
    }

    # find Top name
    my $element_top_text = '';
    my $top_no_texi = '';
    my $top_simple_format = '';
    my $top_name;
    if ($element_top and $element_top->{'text'} and (!$node_top or ($element_top ne $node_top)))
    {
        $element_top_text = $element_top->{'text'};
        $top_no_texi = $element_top->{'no_texi'};
        $top_simple_format =  $element_top->{'simple_format'};
    }
    foreach my $possible_top_name ($Texi2HTML::Config::TOP_HEADING, 
         $element_top_text, $Texi2HTML::THISDOC{'title'},
         $Texi2HTML::THISDOC{'shorttitle'}, &$I('Top'))
    {
         if (defined($possible_top_name) and $possible_top_name ne '')
         {
             $top_name = $possible_top_name;
             last;
         }
    }
    foreach my $possible_top_no_texi ($Texi2HTML::Config::TOP_HEADING, 
         $top_no_texi, $Texi2HTML::THISDOC{'title_no_texi'},
         $Texi2HTML::THISDOC{'shorttitle_no_texi'}, 
         &$I('Top',{},{'remove_texi' => 1}))
    {
         if (defined($possible_top_no_texi) and $possible_top_no_texi ne '')
         {
             $top_no_texi = $possible_top_no_texi;
             last;
         }
    }
     
    foreach my $possible_top_simple_format ($top_simple_format,
         $Texi2HTML::THISDOC{'title_simple_format'},
         $Texi2HTML::THISDOC{'shorttitle_simple_format'},
         &$I('Top',{}, {'simple_format' => 1}))
    {
         if (defined($possible_top_simple_format) and $possible_top_simple_format ne '')
         {
             $top_simple_format = $possible_top_simple_format;
             last;
         }
    }
     
     
#    my $top_name = $Texi2HTML::Config::TOP_HEADING || $element_top_text || $Texi2HTML::THISDOC{'title'} || $Texi2HTML::THISDOC{'shorttitle'} || &$I('Top');

    if ($Texi2HTML::THISDOC{'fulltitle_texi'} eq '')
    {
         $Texi2HTML::THISDOC{'fulltitle_texi'} = &$I('Untitled Document',{},
           {'keep_texi' => 1});
    }
    $Texi2HTML::THISDOC{'title_texi'} = $Texi2HTML::THISDOC{'settitle_texi'};
    $Texi2HTML::THISDOC{'title_texi'} = $Texi2HTML::THISDOC{'fulltitle_texi'} 
            if ($Texi2HTML::THISDOC{'title_texi'} eq '');

    foreach my $doc_thing (('fulltitle', 'title'))
    {
        my $thing_texi = $Texi2HTML::THISDOC{$doc_thing . '_texi'};
        $Texi2HTML::THISDOC{$doc_thing} = substitute_line($thing_texi);
        $Texi2HTML::THISDOC{$doc_thing . '_no_texi'} =
           remove_texi($thing_texi);
        $Texi2HTML::THISDOC{$doc_thing . '_simple_format'} =
           simple_format(undef, $thing_texi);
    }

    for my $key (keys %Texi2HTML::THISDOC)
    {
        next if (ref($Texi2HTML::THISDOC{$key}));
print STDERR "!!$key\n" if (!defined($Texi2HTML::THISDOC{$key}));
        $Texi2HTML::THISDOC{$key} =~ s/\s*$//;
    }
    $Texi2HTML::THISDOC{'program'} = $THISPROG;
    $Texi2HTML::THISDOC{'program_homepage'} = $T2H_HOMEPAGE;
    $Texi2HTML::THISDOC{'program_authors'} = $T2H_AUTHORS;
    $Texi2HTML::THISDOC{'user'} = $T2H_USER;
    $Texi2HTML::THISDOC{'user'} = $Texi2HTML::Config::USER if (defined($Texi2HTML::Config::USER));
#    $Texi2HTML::THISDOC{'documentdescription'} = $documentdescription;
    $Texi2HTML::THISDOC{'copying'} = $copying_comment;
    $Texi2HTML::THISDOC{'destination_directory'} = $docu_rdir;
    $Texi2HTML::THISDOC{'authors'} = [] if (!defined($Texi2HTML::THISDOC{'authors'}));
    $Texi2HTML::THISDOC{'subtitles'} = [] if (!defined($Texi2HTML::THISDOC{'subtitles'}));
    $Texi2HTML::THISDOC{'titles'} = [] if (!defined($Texi2HTML::THISDOC{'titles'}));
    foreach my $element (('authors', 'subtitles', 'titles'))
    {
        my $i;
        for ($i = 0; $i < $#{$Texi2HTML::THISDOC{$element}} + 1; $i++) 
        {
            chomp ($Texi2HTML::THISDOC{$element}->[$i]);
            $Texi2HTML::THISDOC{$element}->[$i] = substitute_line($Texi2HTML::THISDOC{$element}->[$i]);
            #print STDERR "$element:$i: $Texi2HTML::THISDOC{$element}->[$i]\n";
        }
    }
    # prepare TOC, OVERVIEW...
    my ($toc_file, $stoc_file, $foot_file, $about_file);
    # if not split the references are to the same file
    $toc_file = $stoc_file = $foot_file = $about_file = '';
    if ($Texi2HTML::Config::SPLIT)
    {
        $toc_file = $docu_toc;
        $stoc_file = $docu_stoc;
        if ($Texi2HTML::Config::INLINE_CONTENTS)
        {
            $toc_file = $content_element{'contents'}->{'file'} if (defined($content_element{'contents'}));
            $stoc_file = $content_element{'shortcontents'}->{'file'} if (defined($content_element{'shortcontents'}));
        }
        $foot_file = $docu_foot;
        $about_file = $docu_about;
    }
    $Texi2HTML::THISDOC{'toc_file'} = $toc_file; 
    $Texi2HTML::HREF{'Contents'} = $toc_file.'#'.$content_element{'contents'}->{'id'} if (@{$Texi2HTML::TOC_LINES} and defined($content_element{'contents'}));
    $Texi2HTML::HREF{'Overview'} = $stoc_file.'#'.$content_element{'shortcontents'}->{'id'} if (@{$Texi2HTML::OVERVIEW} and defined($content_element{'shortcontents'}));
    $Texi2HTML::HREF{'Footnotes'} = $foot_file. '#SEC_Foot';
    $Texi2HTML::HREF{'About'} = $about_file . '#SEC_About' unless ($one_section or (not $Texi2HTML::Config::SPLIT and not $Texi2HTML::Config::SECTION_NAVIGATION));
    
    $Texi2HTML::NAME{'First'} = $element_first->{'text'};
    $Texi2HTML::NAME{'Last'} = $element_last->{'text'};
    $Texi2HTML::NAME{'Top'} = $top_name;
    $Texi2HTML::NAME{'Index'} = $element_chapter_index->{'text'} if (defined($element_chapter_index));
    $Texi2HTML::NAME{'Index'} = $Texi2HTML::Config::INDEX_CHAPTER if ($Texi2HTML::Config::INDEX_CHAPTER ne '');

    $Texi2HTML::NO_TEXI{'First'} = $element_first->{'no_texi'};
    $Texi2HTML::NO_TEXI{'Last'} = $element_last->{'no_texi'};
    $Texi2HTML::NO_TEXI{'Top'} = $top_no_texi;
    $Texi2HTML::NO_TEXI{'Index'} = $element_chapter_index->{'no_texi'} if (defined($element_chapter_index));
    $Texi2HTML::SIMPLE_TEXT{'First'} = $element_first->{'simple_format'};
    $Texi2HTML::SIMPLE_TEXT{'Last'} = $element_last->{'simple_format'};
    $Texi2HTML::SIMPLE_TEXT{'Top'} = $top_simple_format;
    $Texi2HTML::SIMPLE_TEXT{'Index'} = $element_chapter_index->{'simple_format'} if (defined($element_chapter_index));

    # must be after toc_body, but before titlepage
    foreach my $element_tag ('contents', 'shortcontents')
    {
        next if (!defined($content_element{$element_tag}));
        my $toc_lines = &$Texi2HTML::Config::inline_contents(undef, $element_tag, $content_element{$element_tag});
        @{$Texi2HTML::THISDOC{'inline_contents'}->{$element_tag}} = @$toc_lines if (defined($toc_lines));
    }
    $Texi2HTML::TITLEPAGE = '';
    $Texi2HTML::TITLEPAGE = substitute_text({}, @{$region_lines{'titlepage'}})
        if (@{$region_lines{'titlepage'}});
    &$Texi2HTML::Config::titlepage();

    &$Texi2HTML::Config::init_out();
    $to_encoding = $Texi2HTML::Config::OUT_ENCODING;

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

    texinfo_initialization(2);


    ############################################################################
    # Start processing the document
    #

    my $FH;
    my $index_pages;
    my $index_pages_nr;
    my $index_nr = 0;
    my $line_nr;
    my $first_section = 0; # 1 if it is the first section of a page
    my $previous_is_top = 0; # 1 if it is the element following the top element
    while (@doc_lines)
    {
        unless ($index_pages)
        { # not in a index split over sections
            $_ = shift @doc_lines;
            my $chomped_line = $_;
            if (!chomp($chomped_line) and @doc_lines)
            { # if the line has no end of line it is concatenated with the next
                 $doc_lines[0] = $_ . $doc_lines[0];
                 next;
            }
            $line_nr = shift (@doc_numbers);
            #print STDERR "$line_nr->{'file_name'}($line_nr->{'macro'},$line_nr->{'line_nr'}) $_" if ($line_nr);
        }
	#print STDERR "PASS_TEXT: $_";
	#dump_stack(\$text, \@stack, \%state);
        if (!$state{'raw'} and !$state{'verb'})
        {
            my $tag = '';
            $tag = $1 if (/^\@(\w+)/ and !$index_pages);


            if (($tag eq 'node') or (defined($sec2level{$tag}) and ($tag !~ /heading/)) or $index_pages)
            {
                if (@stack or (defined($text) and $text ne ''))
                {# in pass text node and section shouldn't appear in formats
			#print STDERR "close_stack before \@$tag\n";
			#print STDERR "text!$text%" if (! @stack);
                    close_stack(\$text, \@stack, \%state, $line_nr);
                    push @section_lines, $text;
                    $text = '';
                }
                $sec_num++ if ($sec2level{$tag} and ($tag ne 'top'));
                my $new_element;
                my $current_element;

                if (!$index_pages)
                {# handle node and structuring elements
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
                    print STDERR ": $_" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                    ########################## end debug section

                    # The element begins a new section if there is no previous
                    # or it is an element and not the current one or the 
                    # associated section (in case of node) is not the current 
                    # one
                    if (!$element 
                      or ($current_element->{'element'} and ($current_element ne $element))
                      or ($current_element->{'section_ref'} and ($current_element->{'section_ref'} ne $element)))
                    {
                         $new_element = shift @elements_list;
                    }
                    ########################### begin debug
                    my $section_element = $new_element;
                    $section_element = $element unless ($section_element);
                    if (!$current_element->{'node'} and !$current_element->{'index_page'} and ($section_element ne $current_element))
                    {
                         print STDERR "NODE: $element->{'texi'}\n" if ($element->{'node'});
                         warn "elements_list and all_elements not in sync (elements $section_element->{'texi'}, all $current_element->{'texi'}): $_";
                    }
                    ########################### end debug
                }
                else
                { # this is a new index section
                    $new_element = $index_pages->[$index_pages_nr]->{'element'};
                    $current_element = $index_pages->[$index_pages_nr]->{'element'};
                    print STDERR "New index page '$new_element->{'texi'}' nr: $index_pages_nr\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                    my $list_element = shift @elements_list;
                    die "element in index_pages $new_element->{'texi'} and in list $list_element->{'texi'} differs\n" unless ($list_element eq $new_element);
                }
                if ($new_element)
                {
                    $index_nr = 0;
                    my $old = 'NO_OLD';
                    $old = $element->{'texi'} if (defined($element));
                    print STDERR "NEW: $new_element->{'texi'}, OLD: $old\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                    # print the element that just finished
                    $Texi2HTML::THIS_SECTION = \@section_lines;
                    $Texi2HTML::THIS_HEADER = \@head_lines;
                    if ($element)
                    {
                        finish_element($FH, $element, $new_element, $first_section);
                        $first_section = 0;
                        $previous_is_top = 0 if (!$element->{'top'});
                        @section_lines = ();
                        @head_lines = ();
                    }
                    else
                    {
                        print STDERR "# Writing elements:" if ($T2H_VERBOSE);
                        if ($Texi2HTML::Config::IGNORE_PREAMBLE_TEXT)
                        {
                             @section_lines = ();
                             @head_lines = ();
                        }
                        # remove empty line at the beginning of @section_lines
                        shift @section_lines while (@section_lines and ($section_lines[0] =~ /^\s*$/));
                    }
                    # begin new element
                    my $previous_file;
                    $previous_file = $element->{'file'} if (defined($element));
                    $element = $new_element;
                    $state{'element'} = $element;
                    $Texi2HTML::THIS_ELEMENT = $element;
                    #print STDERR "Doing hrefs for $element->{'texi'} First ";
                    $Texi2HTML::HREF{'First'} = href($element_first, $element->{'file'});
                    #print STDERR "Last ";
                    $Texi2HTML::HREF{'Last'} = href($element_last, $element->{'file'});
                    #print STDERR "Index ";
                    $Texi2HTML::HREF{'Index'} = href($element_chapter_index, $element->{'file'}) if (defined($element_chapter_index));
                    #print STDERR "Top ";
                    $Texi2HTML::HREF{'Top'} = href($element_top, $element->{'file'});
                    if ($Texi2HTML::Config::INLINE_CONTENTS)
                    {
                        $Texi2HTML::HREF{'Contents'} = href($content_element{'contents'}, $element->{'file'});
                        $Texi2HTML::HREF{'Overview'} = href($content_element{'shortcontents'}, $element->{'file'});
                    }
                    foreach my $direction (@element_directions)
                    {
                        my $elem = $element->{$direction};
                        $Texi2HTML::NODE{$direction} = undef;
                        $Texi2HTML::HREF{$direction} = undef;
                        next unless (defined($elem));
                        #print STDERR "$direction ";
                        if ($elem->{'node'} or $elem->{'external_node'} or $elem->{'index_page'} or !$elem->{'seen'})
                        {
                            $Texi2HTML::NODE{$direction} = $elem->{'text'};
                        }
                        elsif ($elem->{'node_ref'})
                        {
                            $Texi2HTML::NODE{$direction} = $elem->{'node_ref'}->{'text'};
                        }
                        if (!$elem->{'seen'})
                        {
                            $Texi2HTML::HREF{$direction} = do_external_href($elem->{'texi'});
                        }
                        else
                        {
                            $Texi2HTML::HREF{$direction} = href($elem, $element->{'file'});
                        }
                        $Texi2HTML::NAME{$direction} = $elem->{'text'};
                        $Texi2HTML::NO_TEXI{$direction} = $elem->{'no_texi'};
                        $Texi2HTML::SIMPLE_TEXT{$direction} = $elem->{'simple_format'};
                        #print STDERR "$direction ($element->{'texi'}): \n  NO_TEXI: $Texi2HTML::NO_TEXI{$direction}\n  NAME $Texi2HTML::NAME{$direction}\n  NODE $Texi2HTML::NODE{$direction}\n  HREF $Texi2HTML::HREF{$direction}\n\n";
                    }
                    #print STDERR "\nDone hrefs for $element->{'texi'}\n";
                    $files{$element->{'file'}}->{'counter'}--;
                    if (!defined($previous_file) or ($element->{'file'} ne $previous_file))
                    {
                        my $file = $element->{'file'};
                        print STDERR "\n" if ($T2H_VERBOSE and !$T2H_DEBUG);
                        print STDERR "# Writing to $docu_rdir$file " if $T2H_VERBOSE;
                        my $do_page_head = 0;
                        if ($files{$file}->{'filehandle'})
                        {
                             $FH = $files{$file}->{'filehandle'};
                        }
                        else
                        {
                             $FH = open_out("$docu_rdir$file");
#print STDERR "OPEN $docu_rdir$file, $FH". scalar($FH)."\n";
                             $files{$file}->{'filehandle'} = $FH;
                             $do_page_head = 1;
                        }
                        if ($element->{'top'})
                        {
                             &$Texi2HTML::Config::print_Top_header($FH, $do_page_head);
                             $previous_is_top = 1;
                        }
                        else
                        {
                             &$Texi2HTML::Config::print_page_head($FH) if ($do_page_head);
                             &$Texi2HTML::Config::print_chapter_header($FH) if $Texi2HTML::Config::SPLIT eq 'chapter';
                             &$Texi2HTML::Config::print_section_header($FH) if $Texi2HTML::Config::SPLIT eq 'section';
                        }
                        $first_section = 1;
                    }
                    print STDERR "." if ($T2H_VERBOSE);
                    print STDERR "\n" if ($T2H_DEBUG);
                }
                my $label = &$Texi2HTML::Config::anchor($current_element->{'id'}) . "\n";
                if (@section_lines)
                {
                    push (@section_lines, $label);
                }
                else
                {
                    push @head_lines, $label;
                }
                if ($index_pages)
                {
                    &$Texi2HTML::Config::print_element_header($FH, $first_section, $previous_is_top) if (!$current_element->{'top'} and !$one_section);
                    push @section_lines, &$Texi2HTML::Config::heading($element);
		    #print STDERR "Do index page $index_pages_nr\n";
                    my $page = do_index_page($index_pages, $index_pages_nr);
                    push @section_lines, $page;
                    if (defined ($index_pages->[$index_pages_nr + 1]))
                    {
                        $index_pages_nr++;
                    }
                    else
                    {
                        $index_pages = undef;
                    }
                    next;
                }
                if ($current_element->{'element'} and !$current_element->{'top'})
                {
                    &$Texi2HTML::Config::print_element_header($FH, $first_section, $previous_is_top) if (!$one_section);
                    my $line = $_;
                    $line =~ s/\@$tag\s*//;
                    push @section_lines, &$Texi2HTML::Config::heading($current_element, $tag, $line, substitute_line($line));
                }
                next;
            }
            elsif ($tag eq 'printindex')
            {
                s/\s+(\w+)\s*//;
                my $name = $1;
                close_paragraph(\$text, \@stack, \%state);
                next if (!$index_names{$name} or $empty_indices{$name});
                $printed_indices{$name} = 1;
                print STDERR "print index $name($index_nr) in `$element->{'texi'}', element->{'indices'}: $element->{'indices'},\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS or $T2H_DEBUG & $DEBUG_INDEX);
                print STDERR "element->{'indices'}->[index_nr]: $element->{'indices'}->[$index_nr] (@{$element->{'indices'}->[$index_nr]})\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS or $T2H_DEBUG & $DEBUG_INDEX);
                $index_pages = $element->{'indices'}->[$index_nr] if (@{$element->{'indices'}->[$index_nr]} > 1);
                $index_pages_nr = 0;
                add_prev(\$text, \@stack, do_index_page($element->{'indices'}->[$index_nr], 0));  
                $index_pages_nr++;
                $index_nr++;
                begin_paragraph (\@stack, \%state) if ($state{'preformatted'});
                next if (@stack);
                push @section_lines, $text;
                $text = '';
                next;
            }
            elsif (($tag eq 'contents') or ($tag eq 'summarycontents') or ($tag eq 'shortcontents'))
            {
                my $element_tag = $tag;
                $element_tag = 'shortcontents' if ($element_tag ne 'contents');
                # at that point the content_element is defined for sure since
                # we already saw the tag
                if ($Texi2HTML::Config::INLINE_CONTENTS and !$content_element{$element_tag}->{'aftertitlepage'})
                {
                    if (@stack or (defined($text) and $text ne ''))
                    {# in pass text contents  shouldn't appear in formats
                        close_stack(\$text, \@stack, \%state, $line_nr);
                        push @section_lines, $text;
                        $text = '';
                    }
                    my $toc_lines = &$Texi2HTML::Config::inline_contents($FH, $tag, $content_element{$element_tag});
                    push (@section_lines, @$toc_lines) if (defined($toc_lines)) ;
                }
                next;
            }
        }
        scan_line($_, \$text, \@stack, \%state, $line_nr);
	#print STDERR "after scan_line: $_";
	#dump_stack(\$text, \@stack, \%state);
        next if (@stack);
        if ($text ne '' )
        { 
            push @section_lines, $text;
            $text = '';
        }
    }
    if (@stack)
    {# close stack at the end of pass text
        close_stack(\$text, \@stack, \%state, $line_nr);
    }
    if (defined($text))
    {
        push @section_lines, $text;
    }
    print STDERR "\n" if ($T2H_VERBOSE);
 
    $Texi2HTML::THIS_SECTION = \@section_lines;
    # if no sections, then simply print document as is
    if ($one_section)
    {
        if (@foot_lines)
        {
            &$Texi2HTML::Config::foot_section (\@foot_lines);
            push @section_lines, @foot_lines;
        }
        $Texi2HTML::THIS_HEADER = \@head_lines;
        if ($element->{'top'})
        {
            print STDERR "Bug: `$element->{'texi'}' level undef\n" if (!$element->{'node'} and !defined($element->{'level'}));
            $element->{'level'} = 1 if (!defined($element->{'level'}));
            $element->{'node'} = 0; # otherwise Texi2HTML::Config::heading may uses the node level
            $element->{'text'} = $Texi2HTML::NAME{'Top'};
            print STDERR "[Top]" if ($T2H_VERBOSE);
            unless ($element->{'titlefont'} or $element->{'index_page'})
            {
                unshift @section_lines, &$Texi2HTML::Config::heading($element);
            }
        }
        print STDERR "# Write the section $element->{'texi'}\n" if ($T2H_VERBOSE);
        &$Texi2HTML::Config::one_section($FH);
        close_out($FH);
        return;
    }

    finish_element ($FH, $element, undef, $first_section);

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
    if (@foot_lines)
    {
        print STDERR "# writing Footnotes in $docu_foot_file\n" if $T2H_VERBOSE;
        $FH = open_out ($docu_foot_file)
            if $Texi2HTML::Config::SPLIT;
        $Texi2HTML::HREF{'This'} = $Texi2HTML::HREF{'Footnotes'};
        $Texi2HTML::HREF{'Footnotes'} = '#' . $footnote_element->{'id'};
        $Texi2HTML::NAME{'This'} = $Texi2HTML::NAME{'Footnotes'};
        $Texi2HTML::NO_TEXI{'This'} = $Texi2HTML::NO_TEXI{'Footnotes'};
        $Texi2HTML::SIMPLE_TEXT{'This'} = $Texi2HTML::SIMPLE_TEXT{'Footnotes'};
        $Texi2HTML::THIS_SECTION = \@foot_lines;
        $Texi2HTML::THIS_HEADER = [ &$Texi2HTML::Config::anchor($footnote_element->{'id'}) . "\n" ];
        &$Texi2HTML::Config::print_Footnotes($FH);
        close_out($FH, $docu_foot_file) 
               if ($Texi2HTML::Config::SPLIT);
        $Texi2HTML::HREF{'Footnotes'} = $Texi2HTML::HREF{'This'};
    }

    if (@{$Texi2HTML::TOC_LINES} and !$Texi2HTML::Config::INLINE_CONTENTS)
    {
        print STDERR "# writing Toc in $docu_toc_file\n" if $T2H_VERBOSE;
        $FH = open_out ($docu_toc_file)
            if $Texi2HTML::Config::SPLIT;
        $Texi2HTML::HREF{'This'} = $Texi2HTML::HREF{'Contents'};
        $Texi2HTML::HREF{'Contents'} = "#SEC_Contents";
        $Texi2HTML::NAME{'This'} = $Texi2HTML::NAME{'Contents'};
        $Texi2HTML::NO_TEXI{'This'} = $Texi2HTML::NO_TEXI{'Contents'};
        $Texi2HTML::SIMPLE_TEXT{'This'} = $Texi2HTML::SIMPLE_TEXT{'Contents'};
        $Texi2HTML::THIS_SECTION = $Texi2HTML::TOC_LINES;
        $Texi2HTML::THIS_HEADER = [ &$Texi2HTML::Config::anchor("SEC_Contents") . "\n" ];
        &$Texi2HTML::Config::print_Toc($FH);
        close_out($FH, $docu_toc_file) 
               if ($Texi2HTML::Config::SPLIT);
        $Texi2HTML::HREF{'Contents'} = $Texi2HTML::HREF{'This'};
    }

    if (@{$Texi2HTML::OVERVIEW} and !$Texi2HTML::Config::INLINE_CONTENTS)
    {
        print STDERR "# writing Overview in $docu_stoc_file\n" if $T2H_VERBOSE;
        $FH = open_out ($docu_stoc_file)
            if $Texi2HTML::Config::SPLIT;
        $Texi2HTML::HREF{'This'} = $Texi2HTML::HREF{'Overview'};
        $Texi2HTML::HREF{'Overview'} = "#SEC_Overview";
        $Texi2HTML::NAME{'This'} = $Texi2HTML::NAME{'Overview'};
        $Texi2HTML::NO_TEXI{'This'} = $Texi2HTML::NO_TEXI{'Overview'};
        $Texi2HTML::SIMPLE_TEXT{'This'} = $Texi2HTML::SIMPLE_TEXT{'Overview'};
        $Texi2HTML::THIS_SECTION = $Texi2HTML::OVERVIEW;
        $Texi2HTML::THIS_HEADER = [ &$Texi2HTML::Config::anchor("SEC_Overview") . "\n" ];
        &$Texi2HTML::Config::print_Overview($FH);
        close_out($FH,$docu_stoc_file) 
               if ($Texi2HTML::Config::SPLIT);
        $Texi2HTML::HREF{'Overview'} = $Texi2HTML::HREF{This};
    }
    my $about_body;
    if ($about_body = &$Texi2HTML::Config::about_body())
    {
        print STDERR "# writing About in $docu_about_file\n" if $T2H_VERBOSE;
        $FH = open_out ($docu_about_file)
            if $Texi2HTML::Config::SPLIT;

        $Texi2HTML::HREF{'This'} = $Texi2HTML::HREF{'About'};
        $Texi2HTML::HREF{'About'} = "#SEC_About";
        $Texi2HTML::NAME{'This'} = $Texi2HTML::NAME{'About'};
        $Texi2HTML::NO_TEXI{'This'} = $Texi2HTML::NO_TEXI{'About'};
        $Texi2HTML::SIMPLE_TEXT{'This'} = $Texi2HTML::SIMPLE_TEXT{'About'};
        $Texi2HTML::THIS_SECTION = [$about_body];
        $Texi2HTML::THIS_HEADER = [ &$Texi2HTML::Config::anchor("SEC_About") . "\n" ];
        &$Texi2HTML::Config::print_About($FH);
        close_out($FH, $docu_stoc_file) 
               if ($Texi2HTML::Config::SPLIT);
        $Texi2HTML::HREF{'About'} = $Texi2HTML::HREF{'This'};
    }

    unless ($Texi2HTML::Config::SPLIT)
    {
        &$Texi2HTML::Config::print_page_foot($FH);
        close_out ($FH);
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
    if ($Texi2HTML::Config::SPLIT and scalar(@foot_lines) 
        and !$Texi2HTML::Config::SEPARATED_FOOTNOTES
        and  (! $new_element or
        ($element and ($new_element->{'file'} ne $element->{'file'})))
       )
    {
        if ($files{$element->{'file'}}->{'counter'})
        {# there are other elements in that page we are not on its foot
            $files{$element->{'file'}}->{'relative_foot_num'} 
               = $relative_foot_num;
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
            $relative_foot_num = 
               $files{$new_element->{'file'}}->{'relative_foot_num'};
        }
        @foot_lines = ();
    }
    if ($element->{'top'})
    {
        my $top_file = $docu_top_file;
        #print STDERR "TOP $element->{'texi'}, @section_lines\n";
        print STDERR "[Top]" if ($T2H_VERBOSE);
        $Texi2HTML::HREF{'Top'} = href($element_top, $element->{'file'});
        &$Texi2HTML::Config::print_Top($FH, ($element->{'titlefont'} or $element->{'index_page'}));
        my $end_page = 0;
        if ($Texi2HTML::Config::SPLIT)
        {
            if (!$files{$element->{'file'}}->{'counter'})
            {
                $end_page = 1;
            }
        }
        &$Texi2HTML::Config::print_Top_footer($FH, $end_page);
        close_out($FH, $top_file) if ($end_page);
    }
    else
    {
        print STDERR "# do element $element->{'texi'}\n"
           if ($T2H_DEBUG & $DEBUG_ELEMENTS);
        &$Texi2HTML::Config::print_section($FH, $first_section);
        if (defined($new_element) and ($new_element->{'file'} ne $element->{'file'}))
        {
             if (!$files{$element->{'file'}}->{'counter'})
             {
                 &$Texi2HTML::Config::print_chapter_footer($FH) if ($Texi2HTML::Config::SPLIT eq 'chapter');
                 &$Texi2HTML::Config::print_section_footer($FH) if ($Texi2HTML::Config::SPLIT eq 'section');
                 #print STDERR "Close file after $element->{'texi'}\n";
                 &$Texi2HTML::Config::print_page_foot($FH);
                 close_out($FH);
             }
             else
             {
                 print STDERR "counter $files{$element->{'file'}}->{'counter'} ne 0, file $element->{'file'}\n" if ($T2H_DEBUG);
             }
        }
        elsif (!defined($new_element))
        {
            if ($Texi2HTML::Config::SPLIT)
            { # end of last splitted section
                &$Texi2HTML::Config::print_chapter_footer($FH) if ($Texi2HTML::Config::SPLIT eq 'chapter');
                &$Texi2HTML::Config::print_section_footer($FH) if ($Texi2HTML::Config::SPLIT eq 'section');
                &$Texi2HTML::Config::print_page_foot($FH);
                close_out($FH);
            }
            else
            {
                &$Texi2HTML::Config::end_section($FH, 1);
            }
        }
        elsif ($new_element->{'top'})
        {
            &$Texi2HTML::Config::end_section($FH, 1);
        }
        else
        {
            &$Texi2HTML::Config::end_section($FH);
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
        $redirection_file = $node->{'file'} if ($Texi2HTML::Config::SPLIT);
        if (!$redirection_file)
        {
             print STDERR "Bug: file for redirection for `$node->{'texi'}' don't exist\n" unless ($novalidate);
             next;
        }
        next if ($redirection_file eq $node->{'node_file'});
        my $file = "${docu_rdir}$node->{'node_file'}";
        $Texi2HTML::NODE{'This'} = $node->{'text'};
        $Texi2HTML::NO_TEXI{'This'} = $node->{'no_texi'};
        $Texi2HTML::SIMPLE_TEXT{'This'} = $node->{'simple_format'};
        $Texi2HTML::NAME{'This'} = $node->{'text'};
        $Texi2HTML::HREF{'This'} = "$node->{'file'}#$node->{'id'}";
        my $NODEFILE = open_out ($file);
        &$Texi2HTML::Config::print_redirection_page ($NODEFILE);
        close $NODEFILE || die "$ERROR: Can't close $file: $!\n";
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
    # return $file if (-e $file && -r $file);
    foreach my $dir (@Texi2HTML::Config::INCLUDE_DIRS)
    {
        return "$dir/$file" if (-e "$dir/$file" && -r "$dir/$file");
    }
    return undef;
}

sub open_file($$)
{
    my $name = shift;
    my $line_number = shift;
    local *FH;
    if (open(*FH, "<$name"))
    { 
        if (defined($Texi2HTML::Config::IN_ENCODING) and $Texi2HTML::Config::USE_UNICODE)
        {
            binmode(*FH, ":encoding($Texi2HTML::Config::IN_ENCODING)");
        }
        my $file = { 'fh' => *FH, 
           'input_spool' => { 'spool' => [], 
                              'macro' => '' },
           'name' => $name, 
           'line_nr' => 0 };
        unshift(@fhs, $file);
        $input_spool = $file->{'input_spool'};
        $line_number->{'file_name'} = $name;
        $line_number->{'line_nr'} = 1;
    }
    else
    {
        warn "$ERROR Can't read file $name: $!\n";
    }
}

sub open_out($)
{
    my $file = shift;
    local *FILE;
    if ($file eq '-')
    {
        binmode(STDOUT, ":encoding($to_encoding)") if (defined($to_encoding) and $Texi2HTML::Config::USE_UNICODE);
        return \*STDOUT;
    }

    unless (open(FILE, ">$file"))
    {
        die "$ERROR Can't open $file for writing: $!\n";
    }
    if (defined($to_encoding) and $Texi2HTML::Config::USE_UNICODE)
    {
        if ($to_encoding eq 'utf8' or $to_encoding eq 'utf-8-strict')
        {
            binmode(FILE, ':utf8');
        }
	else
        {
            binmode(FILE, ':bytes');
        }
        binmode(FILE, ":encoding($to_encoding)");
    }
    return *FILE;
}

# FIXME not used when split 
sub close_out($;$)
{
    my $FH = shift;
    my $file = shift;
    $file = '' if (!defined($file));
    return if ($Texi2HTML::Config::OUT eq '');
    close ($FH) || die "$ERROR: Error occurred when closing $file: $!\n";
}

sub next_line($)
{
    my $line_number = shift;
    while (@fhs)
    {
        my $file = $fhs[0];
        $line_number->{'file_name'} = $file->{'name'};
        $input_spool = $file->{'input_spool'};
        if (@{$input_spool->{'spool'}})
        {
             $line_number->{'macro'} = $file->{'input_spool'}->{'macro'};
             $line_number->{'line_nr'} = $file->{'line_nr'};
             my $line = shift(@{$input_spool->{'spool'}});
             print STDERR "# unspooling $line" if ($T2H_DEBUG & $DEBUG_MACROS);
             return($line);
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
        return($line) if (defined($line));
        no strict "refs";
        close($fh);
        use strict "refs";
        shift(@fhs);
    }
    return(undef);
}

# echo a warning
sub echo_warn($;$)
{
    my $text = shift;
    chomp ($text);
    my $line_number = shift;
    warn "$WARN $text " . format_line_number($line_number) . "\n";
}

sub echo_error($;$)
{
    my $text = shift;
    chomp ($text);
    my $line_number = shift;
    warn "$ERROR $text " . format_line_number($line_number) . "\n";
}

sub format_line_number($)
{
    my $line_number = shift;
    my $macro_text = '';
    #$line_number = undef;
    return '' unless (defined($line_number));
    $macro_text = " in $line_number->{'macro'}" if ($line_number->{'macro'} ne '');
    my $file_text = '(';
    $file_text = "(in $line_number->{'file_name'} " if ($line_number->{'file_name'} ne $docu);
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
    unless (open(DMPTEXI, ">$file"))
    {
         warn "Can't open $file for writing: $!\n";
    }
    print STDERR "# Dump texi\n" if ($T2H_VERBOSE);
    my $index = 0;
    foreach my $line (@$lines)
    {
        my $number_information = '';
        my $chomped_line = $line;
        $number_information = "$numbers->[$index]->{'file_name'}($numbers->[$index]->{'macro'},$numbers->[$index]->{'line_nr'}) " if (defined($numbers));
        print DMPTEXI "${number_information}$line";
        $index++ if (chomp($chomped_line));
    }
    close DMPTEXI;
}
 
# return next tag on the line
sub next_tag($)
{
    my $line = shift;
    # macro_regexp
    if ($line =~ /^\s*\@(["'~\@\}\{,\.!\?\s\*\-\^`=:\|\/\\])/o or $line =~ /^\s*\@([a-zA-Z][\w-]*)([\s\{\}\@])/ or $line =~ /^\s*\@([a-zA-Z][\w-]*)$/)
    {
        return ($1);
    }
    return '';
}

sub top_stack($)
{
    my $stack = shift;
    return undef unless(@$stack);
    return $stack->[-1];
}

# return the next element with balanced {}
sub next_bracketed($$)
{
    my $line = shift;
    my $line_nr = shift;
    my $opened_braces = 0;
    my $result = '';
    my $spaces;
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
                $result =~ s/\s*$//;
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
                echo_error("too much '}' in specification", $line_nr);
                $opened_braces = 0;
                next;
            }
            $result .= $brace;
            return ($result, $line, $spaces) if ($opened_braces == 0);
        }
    }
    if ($opened_braces)
    {
        echo_error("'{' not closed in specification", $line_nr);
        return ($result . ( '}' x $opened_braces), '', $spaces);
    }
    print STDERR "BUG: at the end of next_bracketed\n";
    return undef;
}

# do a href using file and id and taking care of ommitting file if it is 
# the same
# element: structuring element to point to
# file: current file
sub href($$)
{
    my $element = shift;
    my $file = shift;
    return '' unless defined($element);
    my $href = '';
    print STDERR "Bug: $element->{'texi'}, id undef\n" if (!defined($element->{'id'}));
    print STDERR "Bug: $element->{'texi'}, file undef\n" if (!defined($element->{'file'}));
#foreach my $key (keys(%{$element}))
#{
#   my $value = 'UNDEF'; $value =  $element->{$key} if defined($element->{$key});
#   print STDERR "$key: $value\n";
#}print STDERR "\n";
    $href .= $element->{'file'} if (defined($element->{'file'}) and $file ne $element->{'file'});
    $href .= "#$element->{'id'}" if (defined($element->{'id'}));
    return $href;
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

sub normalise_node($)
{
    return undef unless (defined ($_[0]));
    my $text = shift;
    $text = normalise_space($text);
    $text =~ s/^top$/Top/i;
    return $text;
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

    return '' if ($state->{'multiple_pass'});
    $anchor = normalise_node($anchor);
    if (!exists($nodes{$anchor}) or !defined($nodes{$anchor}->{'id'}))
    {
        print STDERR "Bug: unknown anchor `$anchor'\n";
    }
    return &$Texi2HTML::Config::anchor($nodes{$anchor}->{'id'});
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
    $term = 1 if ($format->{'term'}); #This should never happen

    return ($format_name,$command,\$format->{'paragraph_number'},$term,
        $format->{'item_nr'}, $format->{'spec'},  $format->{'number'},
        $format->{'stack_at_beginning'});
}

sub do_paragraph($$)
{
    my $text = shift;
    my $state = shift;
    my ($format, $paragraph_command, $paragraph_number, $term, $item_nr, 
        $enumerate_type, $number,$stack_at_beginning) 
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
    
    if (exists($::style_map_ref->{$paragraph_command}) and
       !exists($Texi2HTML::Config::special_list_commands{$format}->{$paragraph_command}))
    { 
        if ($format eq 'itemize')
        {
            chomp ($text);
            $text = do_simple($paragraph_command, $text, $state, [$text]);
            $text = $text . "\n";
        }
    }
    elsif (exists($::things_map_ref->{$paragraph_command}))
    {
        $paragraph_command_formatted = do_simple($paragraph_command, '', $state);
    }
    return &$Texi2HTML::Config::paragraph($text, $align, $indent_style, $paragraph_command, $paragraph_command_formatted, $paragraph_number, $format, $item_nr, $enumerate_type, $number,$state->{'command_stack'},$stack_at_beginning);
}

sub do_preformatted($$)
{
    my $text = shift;
    my $state = shift;
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
    if (exists($::style_map_ref->{$leading_command}) and
       !exists($Texi2HTML::Config::special_list_commands{$format}->{$leading_command}) and ($style_type{$leading_command} eq 'style'))
    {
        $text = do_simple($leading_command, $text, $state,[$text]) if ($format eq 'itemize');
    }
    elsif (exists($::things_map_ref->{$leading_command}))
    {
        $leading_command_formatted = do_simple($leading_command, '', $state);
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
               if ($Texi2HTML::Config::TRANSLITERATE_NODE)
               {
                   $node_file = $nodes{$texi_node}->{'cross_manual_file'};
               }
         }
         else 
         {
              if ($Texi2HTML::Config::TRANSLITERATE_NODE)
              {
                  ($node_id, $node_file) = cross_manual_line($texi_node,1);
              }
              else
              {
                  $node_id = cross_manual_line($texi_node);
              }
         }
         $node_xhtml_id = node_to_id($node_id);
         $node_file = $node_id unless ($Texi2HTML::Config::TRANSLITERATE_NODE);
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

# return 1 if the following tag shouldn't begin a line
sub no_line($)
{
    my $line = shift;
    my $next_tag = next_tag($line);
    return 1 if (($line =~ /^\s*$/) or $no_line_macros{$next_tag} or 
       (($next_tag =~ /^(\w+?)index$/) and ($1 ne 'print')) or 
       (($line =~ /^\@end\s+(\w+)/) and  $no_line_macros{"end $1"}));
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
    
    if (($state->{'preformatted'} 
           and !$Texi2HTML::Config::format_in_paragraph{$command})
        or (!no_paragraph($state,$text_following)))  
    {
        begin_paragraph($stack, $state); 
    }
}

# handle raw formatting, ignored regions...
sub do_text_macro($$$$$)
{
    my $type = shift;
    my $line = shift;
    my $state = shift;
    my $stack = shift;
    my $line_nr = shift;
    my $value;
    #print STDERR "do_text_macro $type\n";

    if ($text_macros{$type} eq 'raw')
    {
        $state->{'raw'} = $type;
        #print STDERR "RAW\n";
        if ($state->{'raw'})
        {
             push @$stack, { 'style' => $type, 'text' => '' };
        }
    }
    elsif ($text_macros{$type} eq 'value')
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
            my $open_ifvalue = 0;
            if ($type eq 'ifclear')
            {
                if (defined($value{$2}))
                {
                    $open_ifvalue = 1;
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
                    $open_ifvalue = 1;
                }
                else
                {
                    push @{$state->{'text_macro_stack'}}, $type;
                }
            }
            if ($open_ifvalue)
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
            echo_error ("Bad $type line: $line", $line_nr) unless ($state->{'ignored'});
        }
    }
    elsif (not $text_macros{$type})
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

sub do_insertcopying($)
{
    my $state = shift;
    return '' unless @{$region_lines{'copying'}};
    my $insert_copying_state = duplicate_state($state);
    $insert_copying_state->{'multiple_pass'} = 1;
    return substitute_text($insert_copying_state, @{$region_lines{'copying'}});
}

sub get_deff_index($$$)
{
    my $tag = shift;
    my $line = shift;
    my $line_nr = shift;
   
    $tag =~ s/x$//;
    my ($style, $category, $name, $type, $class, $arguments);
    ($style, $category, $name, $type, $class, $arguments) = parse_def($tag, $line, $line_nr); 
    $name = &$Texi2HTML::Config::definition_category($name, $class, $style);
    return ($style, '') if (!defined($name) or ($name =~ /^\s*$/));
    return ($style, $name, $arguments);
}

sub parse_def($$$)
{
    my $command = shift;
    my $line = shift;
    my $line_nr = shift;

    my $tag = $command;

    if (!ref ($Texi2HTML::Config::def_map{$tag}))
    {
        # substitute shortcuts for definition commands
        my $substituted = $Texi2HTML::Config::def_map{$tag};
        $substituted =~ s/(\w+)//;
        $tag = $1;
        $line = $substituted . $line;
    }
#print STDERR "PARSE_DEF($command,$tag) $line";
    my ($category, $name, $type, $class, $arguments);
    my @args = @{$Texi2HTML::Config::def_map{$tag}};
    my $style = shift @args;
    while (@args)
    {
        my $arg = shift @args;
        if (defined($arg))
        {
            # backward compatibility, it was possible to have a { in front.
            $arg =~  s/^\{//;
            my $item;
            my $spaces;
            ($item, $line,$spaces) = next_bracketed($line, $line_nr);
            last if (!defined($item));
            $item =~ s/^\{(.*)\}$/$1/ if ($item =~ /^\{/);
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
            elsif ($arg eq 'arg')
            { 
                $line = $spaces . $item . $line;
            }
        }
        else
        {
            last;
        }
    }
#print STDERR "PARSE_DEF (style $style, category $category, name $name, type $type, class $class, line $line)\n";
    return ($style, $category, $name, $type, $class, $line);
}

sub begin_deff_item($$;$)
{
    my $stack = shift;
    my $state = shift;
    my $no_paragraph = shift;
    #print STDERR "DEF push deff_item for $state->{'deff'}\n";
    push @$stack, { 'format' => 'deff_item', 'text' => '', 'deff_line' => $state->{'deff_line'}};
    # there is no paragraph when a new deff just follows the deff we are
    # opening
    begin_paragraph($stack, $state) 
       if ($state->{'preformatted'} and !$no_paragraph);
    delete($state->{'deff_line'});
    #dump_stack(undef, $stack, $state);
}

sub begin_paragraph($$)
{
    my $stack = shift;
    my $state = shift;

    my $command = 1;
    my $top_format = top_format($stack);
    if (defined($top_format))
    {
        $command = $top_format;
    }
    else
    {
        $command = { };
    }
    $command->{'stack_at_beginning'} = [ @{$state->{'command_stack'}} ];
    if ($state->{'preformatted'})
    {
        push @$stack, {'format' => 'preformatted', 'text' => '' };
        $state->{'preformatted_context'} = $command;
        push @$stack, @{$state->{'paragraph_macros'}} if $state->{'paragraph_macros'};
        delete $state->{'paragraph_macros'};
        return;
    }
    $state->{'paragraph_context'} = $command;
    $state->{'paragraph_nr'}++;
    push @$stack, {'format' => 'paragraph', 'text' => '' };
    # if there are macros which weren't closed when the previous 
    # paragraph was closed we reopen them here
    push @$stack, @{$state->{'paragraph_macros'}} if $state->{'paragraph_macros'};
    delete $state->{'paragraph_macros'};
}

sub parse_format_command($$)
{
    my $line = shift;
    my $tag = shift;
    my $command = 'asis';
    # macro_regexp
    if ($line =~ /^\s*\@([A-Za-z][\w-]*)(\{\})?$/ or $line =~ /^\s*\@([A-Za-z][\w-]*)(\{\})?\s/)
    {
        my $macro = $1;
        $macro = $alias{$macro} if (exists($alias{$macro}));
        if ($::things_map_ref->{$macro} or defined($::style_map_ref->{$macro}))
        {
        # macro_regexp
            $line =~ s/^\s*\@([A-Za-z][\w-]*)(\{\})?\s*//;
            $command = $1;
        }
    }
    return ('', $command) if ($line =~ /^\s*$/);
    chomp $line;
    $line = substitute_text ({'keep_nr' => 1, 'keep_texi' => 1, 'check_item' => $tag}, $line);
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
    if ($line =~ s/^\s+\@columnfractions\s+//)
    {
        my @fractions = split /\s+/, $line;
        $table_width = $#fractions + 1;
        while (@fractions)
        {
            my $fraction = shift @fractions;
            unless ($fraction =~ /^(\d*\.\d+)|(\d+)\.?$/)
            { 
                echo_error ("column fraction not a number: $fraction", $line_nr);
                #warn "$ERROR column fraction not a number: $fraction";
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
            ($element, $line, $spaces) = next_bracketed($line, $line_nr);
            if ($element =~ /^\{/)
            {
                $table_width++; 
            }
            else
            {
                echo_error ("garbage in multitable specification: $element", $line_nr);
            }
        }
    }
    return ($table_width);
}

sub end_format($$$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $format = shift;
    my $line_nr = shift;
    #print STDERR "END FORMAT $format\n";
    #dump_stack($text, $stack, $state);
    #sleep 1;
    if ($format_type{$format} eq 'menu')
    {
        $state->{'menu'}--;
        close_menu($text, $stack, $state, $line_nr); 
    }
    if (($format_type{$format} eq 'list') or ($format_type{$format} eq 'table'))
    { # those functions return if they detect an inapropriate context
        add_item($text, $stack, $state, $line_nr, '', 1); # handle lists
        add_term($text, $stack, $state, $line_nr, 1); # handle table
        add_line($text, $stack, $state, $line_nr, 1); # handle table
        add_row($text, $stack, $state, $line_nr); # handle multitable
    }

    #print STDERR "END_FORMAT\n";
    #dump_stack($text, $stack, $state);

    # set to 1 if there is a mismatch between the closed format and format
    # opened before
    my $format_mismatch = 0;
	
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
    
    if (defined($Texi2HTML::Config::def_map{$format}))
    {
        close_stack($text, $stack, $state, $line_nr, undef, 'deff_item')
           unless ($format_ref->{'format'} eq 'deff_item');
        add_prev($text, $stack, &$Texi2HTML::Config::def_item($format_ref->{'text'}));
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
             echo_warn ("Waiting for \@end $format_ref->{'format'}, found \@end $format", $line_nr);
        }
        add_prev($text, $stack, &$Texi2HTML::Config::def($format_ref->{'text'}));
    }
    elsif ($format_type{$format} eq 'cartouche')
    {
        add_prev($text, $stack, &$Texi2HTML::Config::cartouche($format_ref->{'text'},$state->{'command_stack'}));
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
        $caption_text = substitute_text(duplicate_state($state), @$caption_lines) if (defined($caption_lines));
        $shortcaption_text = substitute_text(duplicate_state($state), @$shortcaption_lines) if (defined($shortcaption_lines));
        add_prev($text, $stack, &$Texi2HTML::Config::float($format_ref->{'text'}, $state->{'float'}, $caption_text, $shortcaption_text));
        delete $state->{'float'};
    }
    elsif (exists ($Texi2HTML::Config::complex_format_map->{$format}))
    {
        $state->{'preformatted'}--;
        pop @{$state->{'preformatted_stack'}};
        # debug
        if (!defined($Texi2HTML::Config::complex_format_map->{$format_ref->{'format'}}->{'begin'}))
        {
            print STDERR "Bug undef $format_ref->{'format'}" . "->{'begin'} (for $format...)\n";
            dump_stack ($text, $stack, $state);
        }
        #print STDERR "before $format\n";
        #dump_stack ($text, $stack, $state);
        add_prev($text, $stack, &$Texi2HTML::Config::complex_format($format_ref->{'format'}, $format_ref->{'text'}));
        #print STDERR "after $format\n";
        #dump_stack ($text, $stack, $state);
    }
    elsif (($format_type{$format} eq 'table') or ($format_type{$format} eq 'list'))
    {
	    #print STDERR "CLOSE $format ($format_ref->{'format'})\n$format_ref->{'text'}\n";
        pop @{$state->{'table_list_stack'}};
	#dump_stack($text, $stack, $state); 
        if ($format_ref->{'format'} ne $format)
        { # for example vtable closing a table. Cannot be known 
          # before if in a cell
             $format_mismatch = 1;
             echo_warn ("Waiting for \@end $format_ref->{'format'}, found \@end $format  ", $line_nr);
        }
        if ($Texi2HTML::Config::format_map{$format})
        { # table or list has a simple format
            add_prev($text, $stack, end_simple_format($format_ref->{'format'}, $format_ref->{'text'}));
        }
        else
        { # table or list handler defined by the user
            add_prev($text, $stack, &$Texi2HTML::Config::table_list($format_ref->{'format'}, $format_ref->{'text'}, $format_ref->{'command'}));
        }
    } 
    elsif ($format_type{$format} eq 'menu')
    {
    # it should be short-circuited if $Texi2HTML::Config::SIMPLE_MENU
        if ($state->{'preformatted'})
        {
            # end the fake complex format
            $state->{'preformatted'}--;
            pop @{$state->{'preformatted_stack'}};
            pop @$stack;
        }
        add_prev($text, $stack, &$Texi2HTML::Config::menu($format_ref->{'text'}));
    }
    elsif ($format eq 'quotation')
    {
        my $quotation_args = pop @{$state->{'quotation_stack'}};
        #add_prev($text, $stack, &$Texi2HTML::Config::quotation($format_ref->{'text'}, $quotation_args->{'text'}, $quotation_args->{'style_texi'}, $quotation_args->{'style_id'}));
        add_prev($text, $stack, &$Texi2HTML::Config::quotation($format_ref->{'text'}, $quotation_args->{'text'}, $quotation_args->{'text_texi'}));
    }
    elsif ($Texi2HTML::Config::paragraph_style{$format})
    {
        if ($state->{'paragraph_style'}->[-1] eq $format)
        {
            pop @{$state->{'paragraph_style'}};
        }
        add_prev($text, $stack, &$Texi2HTML::Config::paragraph_style_command($format_ref->{'format'},$format_ref->{'text'}));
    }
    elsif (exists($Texi2HTML::Config::format_map{$format}))
    {
        add_prev($text, $stack, end_simple_format($format_ref->{'format'}, $format_ref->{'text'}));
    }
    else
    {
        echo_warn("Unknown format $format", $line_nr);
    }
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
        print STDERR "Bug: removed_from_stack $removed_from_stack ne format $format\n";
    }
}

sub do_text($;$)
{
    my $text = shift;
    my $state = shift;
    return $text if ($state->{'keep_texi'});
    my $remove_texi = 1 if ($state->{'remove_texi'} and !$state->{'simple_format'});
    return (&$Texi2HTML::Config::normal_text($text, $remove_texi, $state->{'preformatted'}, $state->{'code_style'},$state->{'simple_format'},$state->{'command_stack'}));
}

sub end_simple_format($$)
{
    my $tag = shift;
    my $text = shift;

    my $element = $Texi2HTML::Config::format_map{$tag};
    return &$Texi2HTML::Config::format($tag, $element, $text);
}

sub close_menu($$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    if ($state->{'menu_comment'})
    {
        #print STDERR "close MENU_COMMENT\n";
        #dump_stack($text, $stack, $state);
        close_stack($text, $stack, $state, $line_nr, undef, 'menu_comment');
        # close_paragraph isn't needed in most cases, but a preformatted may 
        # appear after close_stack if we closed a format, as formats reopen
        # preformatted. However it is empty and close_paragraph will remove it
        close_paragraph($text, $stack, $state); 
        my $menu_comment = pop @$stack;
        if (!$menu_comment->{'format'} or $menu_comment->{'format'} ne 'menu_comment')
        {
            warn "Bug waiting for menu_comment, got $menu_comment->{'format'}\n"; 
            dump_stack($text, $stack, $state);
        }
        add_prev($text, $stack, &$Texi2HTML::Config::menu_comment($menu_comment->{'text'}));
        unless ($Texi2HTML::Config::SIMPLE_MENU)
        {
            pop @{$state->{'preformatted_stack'}};
            $state->{'preformatted'}--;
        }
        $state->{'menu_comment'}--;
    }
    if ($state->{'menu_entry'})
    {
        close_stack($text, $stack,$state, $line_nr, undef, 'menu_description');
        my $descr = pop(@$stack);
        print STDERR "# close_menu: close description\n" if ($T2H_DEBUG & $DEBUG_MENU);
        add_prev($text, $stack, do_menu_description($descr->{'text'}, $state));
        delete $state->{'menu_entry'};
    }
}

# Format menu link
sub do_menu_link($$;$)
{
    my $state = shift;
    my $line_nr = shift;
    my $simple = shift;
    my $menu_entry = $state->{'menu_entry'};
    my $file = $state->{'element'}->{'file'};
    my $node_name = normalise_node($menu_entry->{'node'});

    my $substitution_state = duplicate_state($state);
    my $name = substitute_line($menu_entry->{'name'}, $substitution_state);
    my $node_formatted = substitute_line($menu_entry->{'node'}, $substitution_state);

    my $entry = '';
    my $href;
    my $element = $nodes{$node_name};

    # menu points to an unknown node
    if (!$element->{'seen'})
    {
        if ($menu_entry->{'node'} =~ /^\s*\(.*\)/o or $novalidate)
        {
            # menu entry points to another info manual or invalid nodes
            # and novalidate is set
            #$href = $nodes{$node_name}->{'file'};
            $href = do_external_href($node_name);
        }
        else
        {
            echo_error ("Unknown node in menu entry `$node_name'", $line_nr);
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
                echo_warn (" ---> but equivalent node `$node_seen' found");
                $element = $nodes{$node_seen};
            }
        }
    }

    # the original node or an equivalent node was seen
    if ($element->{'seen'})
    {
        if ($element->{'reference_element'})
        {
            $element = $element->{'reference_element'};
        }
    
        #print STDERR "SUBHREF in menu for `$element->{'texi'}'\n";
        $href = href($element, $file);
        if (! $element->{'node'})
        {
            $entry = $element->{'text'}; # this is the section/node name
            $entry = "$Texi2HTML::Config::MENU_SYMBOL $entry" if (($entry ne '') and (!defined($element->{'number'}) or ($element->{'number'} =~ /^\s*$/)) and $Texi2HTML::Config::UNNUMBERED_SYMBOL_IN_MENU);
        }
    }
    # save the element used for the href for the description
    $menu_entry->{'menu_reference_element'} = $element;

    return &$Texi2HTML::Config::menu_link($entry, $substitution_state, $href, $node_formatted, $name, $menu_entry->{'ending'}) unless ($simple);
    return &$Texi2HTML::Config::simple_menu_link($entry, $state->{'preformatted'}, $href, $node_formatted, $name, $menu_entry->{'ending'});
}

sub do_menu_description($$)
{
    my $descr = shift;
    my $state = shift;
    my $menu_entry = $state->{'menu_entry'};

    my $element = $menu_entry->{'menu_reference_element'};

    return &$Texi2HTML::Config::menu_description($descr, duplicate_state($state),$element->{'text_nonumber'});
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
    #print STDERR "DO_XREF: $macro\n";
    my $j = 0;
    for ($j = 0; $j <= $#$args; $j++)
    {
         $args[$j] = normalise_space($args[$j]);
    #     print STDERR " ($j)$args[$j]\n";
    }
    $args[0] = '' if (!defined($args[0]));
    my $node_texi = normalise_node($args[0]);
    # a ref to a node in an info manual
    if ($args[0] =~ s/^\(([^\)]+)\)\s*//)
    {
        if ($macro eq 'inforef')
        {
            $args[2] = $1 unless ($args[2]);
        }
        else
        {
            $args[3] = $1 unless ($args[3]);
        }
    }
    if (($macro ne 'inforef') and $args[3])
    {
        $node_texi = "($args[3])" . normalise_node($args[0]);
    }

    if ($macro eq 'inforef')
    {
        if ((@args < 1) or ($args[0] eq ''))
        {
            echo_error ("Need a node name for \@$macro", $line_nr);
            return '';
        }
        if (@args > 3)
        {
            echo_warn ("Too much arguments for \@$macro", $line_nr);
        }
        $args[2] = '' if (!defined($args[2]));
        $args[1] = '' if (!defined($args[1]));
        $node_texi = "($args[2])$args[0]";
    }
    
    my $i;
    my $new_state = duplicate_state($state);
    $new_state->{'keep_texi'} = 0;
    $new_state->{'keep_nr'} = 0;
    for ($i = 0; $i < 5; $i++)
    {
        $args[$i] = substitute_line($args[$i], $new_state);
    }
    #print STDERR "XREF: (@args)\n";
    
    if (($macro eq 'inforef') or ($args[3] ne '') or ($args[4] ne ''))
    {# external ref
        if ($macro eq 'inforef')
        {
            $macro = 'xref';
            $args[3] = $args[2];
        }
        my $href = '';
        my $node_file = '';
        if ($args[3] ne '')
        {
            $href = do_external_href($node_texi);
            $node_file = "($args[3])$args[0]";
        }
        my $section = '';
        if ($args[4] ne '')
        {
            $section = $args[0];
            if ($args[2] ne '')
            {
                $section = $args[2];
            }
        }
        $result = &$Texi2HTML::Config::external_ref($macro, $section, $args[4], $node_file, $href, $args[1]);
    }
    else
    {
        my $element = $nodes{$node_texi};
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
                echo_warn ("\@$macro not in text (in anchor, node, section...)", $line_nr);
                # if Texi2HTML::Config::SPLIT the file is '' which ensures 
                # a href with the file name. if ! Texi2HTML::Config::SPLIT 
                # the 2 file will be the same thus there won't be the file name
                $file = $element->{'file'} unless ($Texi2HTML::Config::SPLIT);
            }
	    #print STDERR "SUBHREF in ref to node `$node_texi': $_";
            my $href = href($element, $file);
            my $section = $args[2];
            $section = $args[1] if ($section eq '');
            my $name = $section;
            my $short_name = $section;
            if ($section eq '')
            {
                # FIXME maybe one should use 'text' instead of 'text_nonumber'
                # However the real fix would be to have an internal_ref call
                # with more informations 
                $name = $element->{'text_nonumber'};
                $short_name = $args[0];
            }
            $result = &$Texi2HTML::Config::internal_ref ($macro, $href, $short_name, $name, $element->{'section'});
        }
        else
        {
           if (($node_texi eq '') or !$novalidate)
           {
               echo_error ("Undefined node `$node_texi' in \@$macro", $line_nr);
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
               $result = &$Texi2HTML::Config::external_ref($macro, '', '', $args[0], do_external_href($node_texi), $args[1]);
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
        $explanation =~ s/^\s*//;
        $explanation =~ s/\s*$//;
        $explanation = undef if ($explanation eq '');
    }
    $acronym_texi =~ s/^\s*//;
    $acronym_texi =~ s/\s*$//;
    
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
         $explanation_simple_format = simple_format($state, $text);
         $explanation_text = substitute_line($text, duplicate_state($state));
    }
    return &$Texi2HTML::Config::acronym_like($command, $acronym_texi, substitute_line($acronym_texi, duplicate_state($state)), 
       $with_explanation, $explanation_lines, $explanation_text, $explanation_simple_format);
}

sub do_caption_shortcaption($$$$$)
{
    my $command = shift;
    my $args = shift;
    my $text = $args->[0];
    my $style_stack = shift;
    my $state = shift;
    my $line_nr = shift;

    if (!exists($state->{'float'}))
    {
#dump_stack(\"", [], $state);
         echo_error("\@$command outside of float", $line_nr);
         return '';
    }
    my $float = $state->{'float'};
    my @texi_lines = map {$_ = $_."\n"} split (/\n/, $text);
    $float->{"${command}_texi"} = \@texi_lines;
    return '';
}

# function called when a @float is encountered. Don't do any output
# but prepare $state->{'float'}
sub do_float_line($$$$$)
{
    my $command = shift;
    my $args = shift;
    my @args = @$args;
    my $style_texi = shift @args;
    my $label_texi = shift @args;
    my $style_stack = shift;
    my $state = shift;
    my $line_nr = shift;

    $style_texi = undef if (defined($style_texi) and $style_texi=~/^\s*$/);
    $label_texi = undef if (defined($label_texi) and $label_texi=~/^\s*$/);
    if (defined($label_texi))
    { # the float is considered as a node as it may be a target for refs.
      # it was entered as a node in the pass_structure and the float
      # line was parsed at that time
         $state->{'float'} = $nodes{normalise_node($label_texi)};
         #print STDERR "float: $state->{'float'}, $state->{'float'}->{'texi'}\n";
    }
    else 
    { # a float without label. It can't be the target for refs.
         $state->{'float'} = { 'float' => 1 };
         if (defined($style_texi))
         {
              $state->{'float'}->{'style_texi'} = normalise_space($style_texi);
              $state->{'float'}->{'style_id'} = 
                  cross_manual_line($state->{'float'}->{'style_texi'});
              $state->{'float'}->{'style'} = substitute_line($style_texi);
         }
         #print STDERR "float: (no label) $state->{'float'}\n";
    }
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

    $text_texi = undef if (defined($text_texi) and $text_texi=~/^\s*$/);
    if (defined($text_texi))
    {
         $text = substitute_line($text_texi, duplicate_state($state));
         $text =~ s/\s*$//;
    }
    my $quotation_args = { 'text' => $text, 'text_texi' => $text_texi };
    push @{$state->{'quotation_stack'}}, $quotation_args;
    $state->{'prepend_text'} = &$Texi2HTML::Config::quotation_prepend_text($text_texi);
    return '';
}

sub do_def_line($$$$$)
{
    my $command = shift;
    my $args = shift;
    my @args = @$args;
    my $arguments = shift @args;
    my $style_stack = shift;
    my $state = shift;
    my $line_nr = shift;

    $state->{'deff_line'}->{'arguments'} = $arguments;
    return '';
}

sub do_footnote($$$$)
{
    my $command = shift;
    my $args = shift;
    my $text = $args->[0];
    my $style_stack = shift;
    my $state = shift;
    my $line_nr = shift;

    $text .= "\n";
    $foot_num++;
    $relative_foot_num++;
    my $docid  = "DOCF$foot_num";
    my $footid = "FOOT$foot_num";
    my $from_file = '';
    if ($state->{'element'} and $Texi2HTML::Config::SPLIT and $Texi2HTML::Config::SEPARATED_FOOTNOTES)
    { 
        $from_file = $state->{'element'}->{'file'};
    }
    my %state;
    initialise_state(\%state); 
    if ($Texi2HTML::Config::SEPARATED_FOOTNOTES)
    {
        $state{'element'} = $footnote_element;
    }
    else
    {
        $state{'element'} = $state->{'element'};
    }
    my $file = '';
    $file = $docu_foot if ($Texi2HTML::Config::SPLIT and $Texi2HTML::Config::SEPARATED_FOOTNOTES);
    
    # FIXME use split_lines ? It seems to work like it is now ?
    my @lines = substitute_text(\%state, map {$_ = $_."\n"} split (/\n/, $text));
    my ($foot_lines, $foot_label) = &$Texi2HTML::Config::foot_line_and_ref ($foot_num,
         $relative_foot_num, $footid, $docid, $from_file, $file, \@lines, $state);
    push(@foot_lines, @{$foot_lines});
    return $foot_label;
}

sub do_image($$$$)
{
    # replace images
    my $command = shift;
    my $args = shift;
    my $text = $args->[0];
    my $style_stack = shift;
    my $state = shift;
    my $line_nr = shift;
    $text =~ s/\s+/ /gos; # remove useless spaces and newlines
    my @args = split (/\s*,\s*/, $text);
    my $base = $args[0];
    if ($base eq '')
    {
         echo_error ("no file argument for \@image", $line_nr);
         #warn "$ERROR no file argument for \@image\n";
         return '';
    }
    $args[4] = '' if (!defined($args[4]));
    $args[3] = '' if (!defined($args[3]));
    my $image;
    my $file_name;
    my @file_names = &$Texi2HTML::Config::image_files($base,$args[4]);
#    $image = locate_include_file("$base.$args[4]") if ($args[4] ne '');
    foreach my $file (@file_names)
    {
         if ($image = locate_include_file($file))
         {
              $file_name = $file;
              last;
         }
    }
    $image = '' if (!defined($image));
    
    my $alt; 
    if ($args[3] =~ /\S/)
    {
        # makeinfo don't do that. Maybe it should be remove_texi or
        # simple_format... The raw alt is also given in argument
        $alt = do_text($args[3]);
        $alt = $alt if ($alt =~ /\S/);
    }
    return &$Texi2HTML::Config::image($path_to_working_dir . $image, $base, 
        $state->{'preformatted'}, $file_name, $alt, $args[1], $args[2], 
        $args[3], $args[4], $path_to_working_dir, $image);
}

sub duplicate_state($)
{
    my $state = shift;
    my $new_state = { 'element' => $state->{'element'}, 
           'preformatted' => $state->{'preformatted'}, 
           'code_style' => $state->{'code_style'}, 
           'keep_texi' => $state->{'keep_texi'}, 
           'keep_nr' => $state->{'keep_nr'}, 
           'preformatted_stack' => $state->{'preformatted_stack'},
           'multiple_pass' => $state->{'multiple_pass'}
    };
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
    my $index = 0;
    foreach my $arg (@$args)
    { # expand @macros in arguments. It is complicated because we must be
      # carefull not to expand macros in @ignore section or the like, and 
      # still keep every single piece of text (including the @ignore macros).
        $args->[$index] = substitute_text({'texi' => 1, 'arg_expansion' => 1}, split_lines($arg));
        $index++;
    }
    # retrieve the macro definition
    my $macrobody = $macros->{$name}->{'body'};
    my $formal_args = $macros->{$name}->{'args'};
    my $args_index =  $macros->{$name}->{'args_index'};
    my $i;
    
    die "Bug end_line not defined" if (!defined($end_line));
    
    for ($i=0; $i<=$#$formal_args; $i++)
    {
        $args->[$i] = "" unless (defined($args->[$i]));
        print STDERR "# arg($i): $args->[$i]\n" if ($T2H_DEBUG & $DEBUG_MACROS);
    }
    echo_error ("too much arguments for macro $name", $line_nr) if (defined($args->[$i + 1]));
    my $result = '';
    while ($macrobody)
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
                   warn "$ERROR \\ not followed by \\ or an arg but by $arg in macro\n";
                   $result .= '\\' . $arg;
               }
            }
            next;
        }
        $result .= $macrobody;
        last;
    }
    my @result = split(/^/m, $result);
    # Add the result of the macro expansion back to the input_spool.
    # Set the macro name if in the outer macro
    if ($state->{'arg_expansion'})
    {
        unshift @{$state->{'spool'}}, (@result, $end_line);
    }
    else
    {
        unshift @{$input_spool->{'spool'}}, (@result, $end_line);
        $input_spool->{'macro'} = $name if ($input_spool->{'macro'} eq '');
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

sub do_index_summary_file($)
{
    my $name = shift;
    my ($pages, $entries) = get_index($name);
    &$Texi2HTML::Config::index_summary_file_begin ($name, $printed_indices{$name});
    print STDERR "# writing $name index summary\n" if $T2H_VERBOSE;

    foreach my $key (sort keys %$entries)
    {
        my $entry = $entries->{$key};
        my $indexed_element = $entry->{'element'};
        my $entry_element = $indexed_element;
        # notice that we use the section associated with a node even when 
        # there is no with_section, i.e. when there is another node preceding
        # the sectionning command.
        # However when it is the Top node, we use the node instead.
        # (for the Top node, 'top_as_section' is true)
        $entry_element = $entry_element->{'section_ref'} if ($entry_element->{'section_ref'} and !$entry_element->{'top_as_section'});
        my $origin_href = $entry->{'file'};
   #print STDERR "$entry $entry->{'entry'}, real elem $indexed_element->{'texi'}, section $entry_element->{'texi'}, real $indexed_element->{'file'}, entry file $entry->{'file'}\n";
        if ($entry->{'label'})
        { 
             $origin_href .= '#' . $entry->{'label'};
        }
        else
        {
            # If the $indexed_element element and the $index entry are on 
            # the same
            # file the real element is prefered. If they aren't on the same file
            # the entry id is choosed as it means that the real element
            # and the index entry are separated by a printindex.
            print STDERR "id undef ($entry) entry: $entry->{'entry'}, label: $indexed_element->{'text'}\n"  if (!defined($entry->{'id'}));
            if ($entry->{'file'} eq $indexed_element->{'file'})
            {
                $origin_href .= '#' . $indexed_element->{'id'};
            }
            else
            {
                $origin_href .= '#' . $entry->{'id'} ;
            }
        }
        &$Texi2HTML::Config::index_summary_file_entry ($name,
          $key, $origin_href, 
          substitute_line($entry->{'entry'}), $entry->{'entry'},
          href($entry_element, ''),
          $entry_element->{'text'},
          $printed_indices{$name});
    }
    &$Texi2HTML::Config::index_summary_file_end ($name, $printed_indices{$name});
}

sub do_index_page($$;$)
{
    my $index_elements = shift;
    my $nr = shift;
    my $page = shift;
    my $index_element = $index_elements->[$nr];
    my $summary = do_index_summary($index_element->{'element'}, $index_elements);
    my $entries = do_index_entries($index_element->{'element'}, $index_element->{'page'}, $index_element->{'name'});
    return $summary . $entries . $summary;
}

sub do_index_summary($$)
{
    my $element = shift;
    my $index_elements = shift;

    my @letters;
    my @symbols;

    for my $index_element_item (@$index_elements)
    {
        my $index_element = $index_element_item->{'element'};
        my $file = '';
        $file .= $index_element->{'file'} if ($index_element->{'file'} ne $element->{'file'});
        my $index = 0;
        for my $letter (@{$index_element_item->{'page'}->{'letters'}})
        {
            if ($letter =~ /^[A-Za-z]/)
            {
                push @letters, &$Texi2HTML::Config::summary_letter($letter, $file, "$index_element->{'id'}" . "_$index");
            }
            else
            {
                push @symbols, &$Texi2HTML::Config::summary_letter($letter, $file, "$index_element->{'id'}" . "_$index");
            }
            $index++;
        }
    }
    return &$Texi2HTML::Config::index_summary(\@letters, \@symbols);
}

sub do_index_entries($$$)
{
    my $element = shift;
    my $page = shift;
    my $name = shift;
 
    my $letters = '';
    my $index = 0;
    foreach my $letter (@{$page->{'letters'}})
    {
       my $entries = '';
       foreach my $entry (@{$page->{'entries_by_letter'}->{$letter}})
       {
           my $indexed_element = $entry->{'element'};
           my $entry_element = $indexed_element;
           # notice that we use the section associated with a node even when 
           # there is no with_section, i.e. when there is another node preceding
           # the sectionning command.
           # However when it is the Top node, we use the node instead.
           # (for the Top node, 'top_as_section' is true)
           $entry_element = $entry_element->{'section_ref'} if ($entry_element->{'section_ref'} and !$entry_element->{'top_as_section'});
           my $origin_href = '';
           $origin_href = $entry->{'file'} if ($Texi2HTML::Config::SPLIT and $entry->{'file'} ne $element->{'file'});
	   #print STDERR "$entry $entry->{'entry'}, real elem $indexed_element->{'texi'}, section $entry_element->{'texi'}, real $indexed_element->{'file'}, entry file $entry->{'file'}\n";
           if ($entry->{'label'})
           { 
               $origin_href .= '#' . $entry->{'label'};
           }
	   else
           {
               # If the $indexed_element element and the $index entry are 
               # in the same file the indexed_element is prefered. If they 
               # aren't in the same file the entry id is choosed as it means 
               # that the indexed_element element and the index entry are 
               # separated by a printindex.
               print STDERR "id undef ($entry) entry: $entry->{'entry'}, label: $indexed_element->{'text'}\n"  if (!defined($entry->{'id'}));
               if ($entry->{'file'} eq $indexed_element->{'file'})
               {
                   $origin_href .= '#' . $indexed_element->{'id'};
               }
               else
               {
                   $origin_href .= '#' . $entry->{'id'} ;
               }
           }
	   #print STDERR "SUBHREF in index entry `$entry->{'entry'}' for `$entry_element->{'texi'}'\n";
           $entries .= &$Texi2HTML::Config::index_entry ($origin_href, 
                     substitute_line($entry->{'entry'}),
                     href($entry_element, $element->{'file'}),
                     $entry_element->{'text'});
        }
        $letters .= &$Texi2HTML::Config::index_letter ($letter, "$element->{'id'}" . "_$index", $entries);
        $index++;
    }
    return &$Texi2HTML::Config::print_index($letters, $name);
}

# remove texi commands, replacing with what seems adequate. see simple_map_texi
# and texi_map.
# Doesn't protect html
sub remove_texi(@)
{
    return substitute_text ({ 'remove_texi' => 1}, @_);
}

# Same as remove texi but protect text and use special maps for @-commands
sub simple_format($@)
{
    my $state = shift;
    if (!defined($state))
    {
        $state = {};
    }
    else
    {
        $state = duplicate_state($state);
    }
    $state->{'remove_texi'} = 1;
    $state->{'simple_format'} = 1;
    # WARNING currently it is only used for lines. It may change in the future.
    $state->{'no_paragraph'} = 1;
    $::simple_map_texi_ref = \%Texi2HTML::Config::simple_format_simple_map_texi;
    $::style_map_texi_ref = \%Texi2HTML::Config::simple_format_style_map_texi;
    $::texi_map_ref = \%Texi2HTML::Config::simple_format_texi_map;
    my $text = substitute_text($state, @_);
    $::simple_map_texi_ref = \%Texi2HTML::Config::simple_map_texi;
    $::style_map_texi_ref = \%Texi2HTML::Config::style_map_texi;
    $::texi_map_ref = \%Texi2HTML::Config::texi_map;
    return $text;
}

sub enter_table_index_entry($$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    if ($state->{'item'} and ($state->{'table_stack'}->[-1] =~ /^(v|f)table$/))
    {
         my $index = $1;
         my $macro = $state->{'item'};
         delete $state->{'item'};
         close_stack($text, $stack, $state, $line_nr, undef, 'index_item');
         my $item = pop @$stack;
         my $element = $state->{'element'};
         $element = $state->{'node_ref'} unless ($element);
         enter_index_entry($index, $line_nr, $item->{'text'}, 
            $state->{'place'}, $element, 0, $state->{'table_stack'}->[-1]);
         add_prev($text, $stack, "\@$macro" . $item->{'text'});
    }
}

sub scan_texi($$$$;$)
{
    my $line = shift;
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    
    die "stack not an array ref"  unless (ref($stack) eq "ARRAY");
    local $_ = $line;

    while(1)
    {
        # scan_texi
        #print STDERR "WHILE:$_";
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
            if (s/^([^\\\@]*\\)//)
            {# protected character or @end macro
                 $state->{'macro'}->{'body'} .= $1 unless ($state->{'ignored'});
                 if (s/^\\//)
                 {
                      $state->{'macro'}->{'body'} .= '\\' unless ($state->{'ignored'});
                      next;
                 }
                 # I believe it is correct, although makeinfo don't do that.
                 elsif (s/^(\@end\sr?macro)$//o or s/^(\@end\sr?macro\s)//o
                      or s/^(\@r?macro\s+\w+\s*.*)//o) 
                 {
                      $state->{'macro'}->{'body'} .= $1 unless ($state->{'ignored'});
                      next;
                 }
            }
            #if (s/^(.*?)\@end\sr?macro$//o or s/^(.*?)\@end\sr?macro\s+//o)
            if (s/^(\@end\sr?macro)$//o or s/^(\@end\sr?macro\s+)//o)
            {
                 $state->{'macro_inside'}--;
                 next if ($state->{'ignored'});
                 if ($state->{'macro_inside'})
                 {
                     $state->{'macro'}->{'body'} .= $1;
                     next;
                 }
                 chomp $state->{'macro'}->{'body'};
                 print STDERR "# end macro def. Body:\n$state->{'macro'}->{'body'}"
                     if ($T2H_DEBUG & $DEBUG_MACROS);
                 delete $state->{'macro'};
                 return if (/^\s*$/);
                 next;
            }
            elsif(/^(\@r?macro\s+\w+\s*.*)/)
            {
                 $state->{'macro'}->{'body'} .= $_ unless ($state->{'ignored'});
                 $state->{'macro_inside'}++;
                 return;
            }
            elsif (s/^\@(.)//)
            {
                 $state->{'macro'}->{'body'} .= '@' . $1 unless ($state->{'ignored'});
                 next;
            }
            elsif (s/^\@//)
            {
                 $state->{'macro'}->{'body'} .= '@' unless ($state->{'ignored'});
                 next;
            }
            else
            {
                 s/([^\@\\]*)//;
                 if ($state->{'ignored'})
                 {
                     return if (/^$/);
                     next;
                 }
                 $state->{'macro'}->{'body'} .= $1 if (defined($1));
                 if (/^$/)
                 {
                      $state->{'macro'}->{'body'} .= $_;
                      return;
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
                s/^\s*//o;
            }
            if (s/^([^$special_chars]*)([$special_chars])//)
            {
                $state->{'macro_args'}->[-1] .= $1 if defined($1);
                # \ protects any character in macro arguments
                if ($2 eq '\\')
                {
                    print STDERR "# macro call: protected char\n" if ($T2H_DEBUG & $DEBUG_MACROS);
                    if (s/^(.)//)
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
                        s/^\s*//o;
                        push @{$state->{'macro_args'}}, '';
                    }
                }
                elsif ($2 eq '}')
                { # balanced } ends the macro call, otherwise it is in the arg
                    $state->{'macro_depth'}--;
                    if ($state->{'macro_depth'} == 0)
                    { 
                        print STDERR "# expanding macro $state->{'macro_name'}\n" if ($T2H_DEBUG & $DEBUG_MACROS);
                        $_ = expand_macro($state->{'macro_name'}, $state->{'macro_args'}, $_, $line_nr, $state);
                        delete $state->{'macro_name'};
                        delete $state->{'macro_depth'};
                        delete $state->{'macro_args'};
                        return;
                    }
                    else
                    {
                        print STDERR "# macro call: closing }\n" if ($T2H_DEBUG & $DEBUG_MACROS);
                        add_text('}', \$state->{'macro_args'}->[-1]);
                    }
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
            $state->{'macro_args'}->[-1] .= $_;
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
                print STDERR "line: $_";
                dump_stack($text, $stack, $state);
                exit 1;
            }
	    
            # macro_regexp
            if (/^(.*?)\@end\s([a-zA-Z][\w-]*)/o and ($2 eq $tag))
            {
                s/^(.*?)(\@end\s$tag)//;
            # we add it even if 'ignored', it'll be discarded when there is
            # the @end
                add_prev ($text, $stack, $1);
                my $end = $2;
                my $style = pop @$stack;
                if ($style->{'text'} !~ /^\s*$/ or $state->{'arg_expansion'})
                # FIXME if 'arg_expansion' and also 'ignored' is true, 
                # theoretically we should keep
                # what is in the raw format however
                # it will be removed later anyway 
                {# ARG_EXPANSION
                    add_prev ($text, $stack, $style->{'text'} . $end) unless ($state->{'ignored'});
                    delete $state->{'raw'};
                }
                next;
            }
            else
            {# we add it even if 'ignored', it'll be discarded when there is 
             # the @end
                 add_prev ($text, $stack, $_);
                 last;
            }
        }

        # in a @verb{ .. } macro
        if (defined($state->{'verb'}))
        {
            #dump_stack($text, $stack, $state);
            my $char = quotemeta($state->{'verb'});
            #print STDERR "VERB $char\n";
            if (s/^(.*?)$char\}/\}/)
            {# we add it even if 'ignored', it'll be discarded when closing
                 add_prev($text, $stack, $1 . $state->{'verb'});
                 $stack->[-1]->{'text'} = $state->{'verb'} . $stack->[-1]->{'text'};
                 delete $state->{'verb'};
                 next;
            }
            else
            {# we add it even if 'ignored', it'll be discarded when closing
                 add_prev($text, $stack, $_);
                 last;
            }
        }
        # In ignored region
        if ($state->{'ignored'})
        {
            #print STDERR "IGNORED(ifvalue($state->{'ifvalue_inside'})): $state->{'ignored'}\n";
            if (/^.*?\@end(\s+)([a-zA-Z]\w+)/)
            {
                if ($2 eq $state->{'ignored'})
                {
                    s/^(.*?\@end)(\s+)([a-zA-Z]\w+)//; 
                    my $end_ignore = $1.$2.$3;
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
                    # MACRO_ARG => keep ignored text
                    if ($state->{'arg_expansion'})
                    {# this may not be very usefull as it'll be remove later
                        add_prev ($text, $stack, $end_ignore);
                        next;
                    }
                    return if /^\s*$/o;
                    next;
                }
            }
            add_prev ($text, $stack, $_) if ($state->{'arg_expansion'});
            # we could theoretically continue for ignored commands other
            # than ifset or ifclear, however it isn't usefull.
            return unless ($state->{'ifvalue_inside'} and ($state->{'ignored'} eq $state->{'ifvalue'}));
        }

	
        # an @end tag
        # macro_regexp
        if (s/^([^{}@]*)\@end(\s+)([a-zA-Z][\w-]*)//)
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
                if ((($end_tag eq 'menu') and $text_macros{'menu'}) or ($region_lines{$end_tag}) or $state->{'arg_expansion'})
                {
                     add_prev($text, $stack, "\@end${space}$end_tag");
                }
                else
                {
                    #print STDERR "End $end_tag\n";
                    #dump_stack($text, $stack, $state);
                    return if (/^\s*$/);
                }
            }
            elsif ($text_macros{$end_tag})
            {
                echo_error ("\@end $end_tag without corresponding element", $line_nr);
            }
            else
            {# ARG_EXPANSION
                add_prev($text, $stack, "\@end${space}$end_tag");
            }
            next;
        }
        # macro_regexp
        elsif (s/^([^{}@]*)\@(["'~\@\}\{,\.!\?\s\*\-\^`=:\|\/\\])//o or s/^([^{}@]*)\@([a-zA-Z][\w-]*)([\s\{\}\@])/$3/o or s/^([^{}@]*)\@([a-zA-Z][\w-]*)$//o)
        {# ARG_EXPANSION
            add_prev($text, $stack, $1) unless $state->{'ignored'};
            my $macro = $2;
            # FIXME: if it is an alias, it is substituted below, in the
            # diverse add_prev and output of \@$macro. Maybe it could be
            # kept and only substituted in the last passes?
            $macro = $alias{$macro} if (exists($alias{$macro}));
	    #print STDERR "MACRO $macro\n";
            # handle skipped @-commands
            $state->{'bye'} = 1 if ($macro eq 'bye' and !$state->{'ignored'} and !$state->{'arg_expansion'});
            # @-commands with 'texi' are the @-commands that need to have
            # the @value{} expanded
            if (defined($Texi2HTML::Config::misc_command{$macro}) and 
                 !$Texi2HTML::Config::misc_command{$macro}->{'texi'})
            {# ARG_EXPANSION
                 my $line;
                 ($_, $line) = misc_command_texi($_, $macro, $state, 
                       $line_nr);
                 add_prev ($text, $stack, "\@$macro" . $line) unless $state->{'ignored'}; 
            }
            # pertusus: it seems that value substitution are performed after
            # macro argument expansions: if we have 
            # @set comma ,
            # and a call to a macro @macro {arg1 @value{comma} arg2}
            # the macro arg is arg1 , arg2 and the comma don't separate
            # args. Likewise it seems that the @value are not expanded
            # in macro definitions

            elsif ($macro =~ /^r?macro$/)
            { #FIXME what to do if 'arg_expansion' is true (ie within another
              # macro call arguments?
                if (/^\s+(\w[\w-]*)\s*(.*)/)
                {
                    my $name = $1;
                    unless ($state->{'ignored'})
                    {
                         if (exists($macros->{$name}))
                         {
                             echo_warn ("macro `$name' allready defined " . 
                                 format_line_number($macros->{$name}->{'line_nr'}) . " redefined", $line_nr);
                         }
                         
                    }
                    $state->{'macro_inside'} = 1;
                    next if ($state->{'ignored'});
                    # if in 'arg_expansion' we really want to take into account
                    # that we are in an ignored ifclear.
                    my @args = ();
                    @args = split(/\s*,\s*/ , $1)
                       if ($2 =~ /^\s*{\s*(.*?)\s*}\s*/);
                    # keep the context information of the definition
                    $macros->{$name}->{'line_nr'} = { 'file_name' => $line_nr->{'file_name'}, 
                         'line_nr' => $line_nr->{'line_nr'}, 'macro' => $line_nr->{'macro'} } if (defined($line_nr));
                    $macros->{$name}->{'args'} = \@args;
                    my $arg_index = 0;
                    my $debug_msg = '';
                    foreach my $arg (@args)
                    { # when expanding macros, the argument index is retrieved
                      # with args_index
                        $macros->{$name}->{'args_index'}->{$arg} = $arg_index;
                        $debug_msg .= "$arg($arg_index) ";
                        $arg_index++;
                    }
                    $macros->{$name}->{'body'} = '';
                    $state->{'macro'} = $macros->{$name};
                    print STDERR "# macro def $name: $debug_msg\n"
                         if ($T2H_DEBUG & $DEBUG_MACROS);
                }
                else
                {# it means we have a macro without a name
                    echo_error ("Macro definition without macro name $_", $line_nr)
                        unless ($state->{'ignored'});
                }
                return;
            }
            elsif (defined($text_macros{$macro}))
            {
                my $tag;
                ($_, $tag) = do_text_macro($macro, $_, $state, $stack, $line_nr); 
                # if it is a raw formatting command or a menu command
                # we must keep it for later, unless we are in an 'ignored'.
                # if in 'arg_expansion' we keep everything.
                my $macro_kept;
                if ((($state->{'raw'} or (($macro eq 'menu') and $text_macros{'menu'}) or (exists($region_lines{$macro}))) and !$state->{'ignored'}) or $state->{'arg_expansion'})
                {
                    add_prev($text, $stack, $tag);
                    $macro_kept = 1;
                }
                #dump_stack ($text, $stack, $state);
                next if $macro_kept;
                return if (/^\s*$/);
            }
            elsif ($macro eq 'definfoenclose')
            {
                # FIXME if 'ignored' or 'arg_expansion' maybe we could parse
                # the args anyway and don't take away the whole line?

                # as in the makeinfo doc 'definfoenclose' may override
                # texinfo @-commands like @i. It is what we do here.
                if ($state->{'arg_expansion'})
                {
                    add_prev($text, $stack, "\@$macro" . $_);
                    return;
                }
                return if ($state->{'ignored'});
                if (s/^\s+([a-z]+)\s*,\s*([^\s]+)\s*,\s*([^\s]+)//)
                {
                    $info_enclose{$1} = [ $2, $3 ];
                }
                else
                {
                    echo_error("Bad \@$macro", $line_nr);
                }
                return if (/^\s*$/);
                s/^\s*//;
            }
            elsif ($macro eq 'include')
            {
                if ($state->{'arg_expansion'})
                {
                    add_prev($text, $stack, "\@$macro" . $_);
                    return;
                }
                return if ($state->{'ignored'});
                #if (s/^\s+([\/\w.+-]+)//o)
                if (s/^(\s+)(.*)//o)
                {
                    my $file_name = $2;
                    $file_name =~ s/\s*$//;
                    my $file = locate_include_file($file_name);
                    if (defined($file))
                    {
                        open_file($file, $line_nr);
                        print STDERR "# including $file\n" if $T2H_VERBOSE;
                    }
                    else
                    {
                        echo_error ("Can't find $file_name, skipping", $line_nr);
                    }
                }
                else
                {
                    echo_error ("Bad include line: $_", $line_nr);
                    return;
                } 
                return;
            }
            elsif ($macro eq 'value')
            {
                if (s/^{($VARRE)}//)
                {
                    my $value = $1;
                    if ($state->{'arg_expansion'})
                    {
                        add_prev($text, $stack, "\@$macro" .'{'. $value .'}');
                        next;
                    }
                    next if ($state->{'ignored'});
                    my $expansion = "No value for $value";
                    $expansion = $value{$value} if (defined($value{$value}));
                    $_ = $expansion . $_;
                }
                else
                {
                    if ($state->{'arg_expansion'})
                    {
                        add_prev($text, $stack, "\@$macro");
                        next;
                    }
                    next if ($state->{'ignored'});
                    echo_error ("bad \@value macro", $line_nr);
                }
            }
            elsif ($macro eq 'unmacro')
            { #FIXME with 'arg_expansion' should it be passed unmodified ?
                if ($state->{'ignored'})
                {
                    s/^\s+(\w+)//;
                }
                else
                {
                    delete $macros->{$1} if (s/^\s+(\w+)//);
                }
                return if (/^\s*$/);
                s/^\s*//;
            }
            elsif ($macro eq 'alias')
            { # FIXME what to do with 'arg_expansion' ?
                if (s/(\s+)([a-zA-Z][\w-]*)(\s*=\s*)([a-zA-Z][\w-]*)(\s*)//)
                {
                    if ($state->{'arg_expansion'})
                    {
                         my $line = "\@$macro" . $1.$2.$3.$4;
                         $line .= $5 if (defined($4));
                         add_prev($text, $stack, $line); 
                         next;
                    }
                    next if $state->{'ignored'};
                    $alias{$2} = $4;
                }
                else
                {
                    echo_error ("bad \@alias line", $line_nr);
                }
            }
            elsif (exists($macros->{$macro}))
            {# it must be before the handling of {, otherwise it is considered
             # to be regular texinfo @-command. Maybe it could be placed higher
             # if we want user defined macros to override texinfo @-commands

             # in 'ignored' we parse macro defined args anyway as it removes 
             # some text, but we don't expand the macro

                my $ref = $macros->{$macro}->{'args'};
                # we remove any space/new line before the argument
                if (s/^\s*{\s*//)
                { # the macro has args
                    $state->{'macro_args'} = [ "" ];
                    $state->{'macro_name'} = $macro;
                    $state->{'macro_depth'} = 1;
                }
                elsif (($#$ref >= 1) or ($#$ref <0))
                { # no brace -> no arg
                    $_ = expand_macro ($macro, [], $_, $line_nr, $state);
                    return;
                }
                else
                { # macro with one arg on the line
                    chomp $_;
                    $_ = expand_macro ($macro, [$_], "\n", $line_nr, $state);
                    return;
                }
            }
            elsif (s/^{//)
            {# we add nested commands in a stack. verb is also on the stack
             # but handled specifically.
             # we add it the comands even in 'ignored' as their result is 
             # discarded when the closing brace appear, or the ifset or 
             # iclear is closed.
                if ($macro eq 'verb')
                {
                    if (/^$/)
                    {
                        echo_error ("without associated character", $line_nr);
                        #warn "$ERROR verb at end of line";
                    }
                    else
                    {
                        s/^(.)//;
                        $state->{'verb'} = $1;
                    }
                }
                elsif ($macro eq ',')
                {
                    $macro = 'm_cedilla';
                }
                push (@$stack, { 'style' => $macro, 'text' => '' });
            }
            elsif ($macro eq ',')
            { # a @, not followed by an opening brace {, something like @,c.
                # we catch syntax errors at that point because
                # m_cedilla is a normal macro name, not a special
                # macro character, like , is. 
                # So, for example @m_cedilla{@} would be very wrong while 
                # @,@ is less problematic.
                # A side effect of that special handling is that strange
                # use of @, will not result in the same result than strange 
                # use of other accent commands.
                if (s/^(.)//)
                {
                    my $cedilla_char = $1;
                    if ($cedilla_char eq '@' or $cedilla_char eq '}')
                    { 
                       $_ = "\@m_cedilla{}"  .$cedilla_char. $_;
                    }
                    else
                    {
                       $_ = "\@m_cedilla" . "{$1}" .$_;
                    }
                }
                else 
                {# @, followed by an end of line
                    next;
                }
            }
            else
            {
                add_prev($text, $stack, "\@$macro") unless($state->{'ignored'});
            }
            next;
        }
        #elsif(s/^([^{}@]*)\@(.)//o)
        elsif(s/^([^{}@]*)\@([^\s\}\{\@]*)//o)
        {# ARG_EXPANSION
            # No need to warn here for @ followed by a character that
            # is not in any @-command and it is done later
            add_prev($text, $stack, $1 . "\@$2") unless($state->{'ignored'});
            next;
        }
        elsif (s/^([^{}]*)([{}])//o)
        {
         # in ignored section we cannot be sure that there is an @-command
         # allready opened so we must discard the text.
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
                    my $result;
                    if (($style->{'style'} ne '') and exists($info_enclose{$style->{'style'}}) and !$state->{'arg_expansion'})
                    {
                        $result = $info_enclose{$style->{'style'}}->[0] . $style->{'text'} . $info_enclose{$style->{'style'}}->[1];      
                    }              
                    elsif ($style->{'style'} ne '')
                    {
                        $result = '@' . $style->{'style'} . '{' . $style->{'text'} . '}';
                    }
                    else
                    {
                        $result = '{' . $style->{'text'};
                        # don't close { if we are closing stack as we are not 
                        # sure this is a { ... } construct. i.e. we are
                        # not sure that the user properly closed the matching
                        # brace, so we don't close it ourselves
                        $result .= '}' unless ($state->{'close_stack'} or $state->{'arg_expansion'});
                    }
                    if ($state->{'ignored'})
                    {# ARG_EXPANSION
                        print STDERR "# Popped `$style->{'style'}' in ifset/ifclear\n" if ($T2H_DEBUG);
                        next;
                    }
                    add_prev ($text, $stack, $result);
                    #print STDERR "MACRO end $style->{'style'} remaining: $_";
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
            #print STDERR "END_LINE $_";
            add_prev($text, $stack, $_) unless($state->{'ignored'});
            last;
        }
    }
    return undef if ($state->{'ignored'});
    return 1;
}

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
            echo_error ("Duplicate node for anchor found: $anchor", $line_nr);
            return '';
        }
        $anchor_num++;
        $nodes{$anchor} = { 'anchor' => 1, 'seen' => 1, 'texi' => $anchor, 'id' => 'ANC' . $anchor_num};
        push @{$state->{'place'}}, $nodes{$anchor};
    }
    elsif ($cmd_ref->{'style'} eq 'footnote')
    {
        if ($Texi2HTML::Config::SEPARATED_FOOTNOTES)
        {
            $state->{'element'} = $state->{'footnote_element'};
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
        $state->{'element'}->{'titlefont'} = $cmd_ref->{'text'} unless ((exists($state->{'region_lines'}) and ($state->{'region_lines'}->{'format'} eq 'titlepage')) or defined($state->{'element'}->{'titlefont'})) ;
    }
    if (defined($Texi2HTML::Config::command_handler{$cmd_ref->{'style'}}))
    {
        $result = init_special($cmd_ref->{'style'},$cmd_ref->{'text'});
        if ($unclosed_commands)
        {
            $result .= "\n"; # the end of line is eaten by init_special
            echo_error("Closing specially handled \@-command $cmd_ref->{'style'}",$line_nr);
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

sub scan_structure($$$$;$)
{
    my $line = shift;
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;

    die "stack not an array ref"  unless (ref($stack) eq "ARRAY");
    local $_ = $line;
    #print STDERR "SCAN_STRUCTURE: $line";
    #dump_stack ($text, $stack, $state); 
    if (!$state->{'raw'} and (!exists($state->{'region_lines'})))
    { 
        if (!$state->{'verb'} and $state->{'menu'} and /^\*/o)
        {
        # new menu entry
            delete ($state->{'after_element'});
            my $menu_line = $_;
            my $node;
            if (/^\*\s+($NODERE)::/)
            {
                $node = $1;
            }
            elsif (/^\*\s+([^:]+):\s*([^\t,\.\n]+)[\t,\.\n]/)
            {
                #$name = $1;
                $node = $2;
            }
            if ($node)
            {
                menu_entry_texi(normalise_node($node), $state, $line_nr);
            }
        }
        unless (no_line($_))
        {
            delete $state->{'after_element'};
        }
    }

    while(1)
    {
        # scan structure
	#print STDERR "WHILE (s):$_";
	#dump_stack($text, $stack, $state);

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
                print STDERR "line: $_";
                dump_stack($text, $stack, $state);
                exit 1;
            }
            ################# end debug 
            # macro_regexp
            if (/^(.*?)\@end\s([a-zA-Z][\w-]*)/o and ($2 eq $tag))
            {
                s/^(.*?)\@end\s$tag//;
                add_prev ($text, $stack, $1);
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
                unless (no_line($_))
                {
                    delete ($state->{'after_element'});
                }
                next;
            }
            else
            {
                add_prev ($text, $stack, $_);
                return if (defined($Texi2HTML::Config::command_handler{$tag})); 
                last;
            }
        }
	
        if (defined($state->{'verb'}))
        {
            my $char = quotemeta($state->{'verb'});
            if (s/^(.*?)$char\}/\}/)
            {
                add_prev($text, $stack, $1 . $state->{'verb'});
                $stack->[-1]->{'text'} = $state->{'verb'} . $stack->[-1]->{'text'};
                delete $state->{'verb'};
                next;
            }
            else
            {
                add_prev($text, $stack, $_);
                last;
            }
        }
	
        unless (no_line($_))
        {
            delete $state->{'after_element'};
        }
        # macro_regexp
        if (s/^([^{}@]*)\@end\s+([a-zA-Z][\w-]*)//)
        {
            add_prev($text, $stack, $1);
            my $end_tag = $2;
            #print STDERR "END STRUCTURE $end_tag\n";
            $state->{'detailmenu'}-- if ($end_tag eq 'detailmenu' and $state->{'detailmenu'});
            if (defined($state->{'text_macro_stack'})
               and @{$state->{'text_macro_stack'}}
               and ($end_tag eq $state->{'text_macro_stack'}->[-1]))
            {
                pop @{$state->{'text_macro_stack'}};
                if (exists($region_lines{$end_tag}))
                { # end a region_line macro, like documentdescription, copying
                    print STDERR "Bug: end_tag $end_tag ne $state->{'region_lines'}->{'format'}\n" 
                        if ($end_tag ne $state->{'region_lines'}->{'format'});
                    $state->{'region_lines'}->{'number'}--;
                    if ($state->{'region_lines'}->{'number'} == 0)
                    { 
                        close_region($state);
                    }
		    #dump_stack($text, $stack, $state); 
                }
                if ($end_tag eq 'menu')
                {
                    add_prev($text, $stack, "\@end $end_tag");
                    $state->{'menu'}--;
                }
                else
                {
			#print STDERR "End $end_tag\n";
			#dump_stack($text, $stack, $state);
                    return if (/^\s*$/);
                }
            }
            elsif ($text_macros{$end_tag})
            {
                echo_error ("\@end $end_tag without corresponding element", $line_nr);
                #dump_stack($text, $stack, $state);
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
            next;
        }
        #elsif (s/^([^{}@]*)\@([a-zA-Z]\w*|["'~\@\}\{,\.!\?\s\*\-\^`=:\/])//o)
        # macro_regexp
        elsif (s/^([^{}@]*)\@(["'~\@\}\{,\.!\?\s\*\-\^`=:\|\/\\])//o or s/^([^{}@]*)\@([a-zA-Z][\w-]*)([\s\{\}\@])/$3/o or s/^([^{}@]*)\@([a-zA-Z][\w-]*)$//o)
        {
            add_prev($text, $stack, $1);
            my $macro = $2;
            #print STDERR "MACRO $macro\n";
            $macro = $alias{$macro} if (exists($alias{$macro}));
            if (defined($Texi2HTML::Config::misc_command{$macro}))
            {
                 my $line;
                 ($_, $line) = misc_command_structure($_, $macro, $state, 
                       $line_nr);
                 add_prev ($text, $stack, "\@$macro".$line); 
                 next;
            }
            if ($sec2level{$macro})
            {
                if (/^\s*(.*)$/)
                {
                    my $name = $1;
                    my $section_ref = new_section_heading($macro, $name, $state);
                    if ($state->{'place'} eq $no_element_associated_place)
                    {
                        $section_ref->{'id'} = "SEC_hidden";
                        $section_ref->{'sec_num'} = "hidden";
                    }
                    else
                    {
                        $head_num++;
                        $section_ref->{'id'} = "HEAD$head_num";
                        $section_ref->{'sec_num'} = $head_num;
                    }
                    $section_ref->{'heading'} = 1;
                    $section_ref->{'tag_level'} = $macro;
                    $section_ref->{'number'} = '';

                    $state->{'element'} = $section_ref;
                    push @{$state->{'place'}}, $section_ref;
                    $headings{$section_ref->{'sec_num'}} = $section_ref;
                }
                add_prev ($text, $stack, "\@$macro" .  $_);
                last;
            }
            elsif ($macro =~ /^(\w+?)index/ and ($1 ne 'print') and ($1 ne 'syncode') and ($1 ne 'syn') and ($1 ne 'def') and ($1 ne 'defcode'))
            {
                my $index_prefix = $1;
                my $key = $_;
                $key =~ s/^\s*//;
                $_ = substitute_texi_line($_);
                enter_index_entry($index_prefix, $line_nr, $key, $state->{'place'}, $state->{'element'}, $state->{'after_element'}, $macro);
                add_prev ($text, $stack, "\@$macro" .  $_);
                last;
            }
            elsif (defined($text_macros{$macro}))
            {
                #print STDERR "TEXT_MACRO: $macro\n";
                if ($text_macros{$macro} eq 'raw')
                {
                    $state->{'raw'} = $macro;
                    #print STDERR "RAW\n";
                }
                elsif ($format_type{$macro} and $format_type{$macro} eq 'menu')
                {
                    $state->{'menu'}++;
                    delete ($state->{'prev_menu_node'});
                    push @{$state->{'text_macro_stack'}}, $macro;
                    #print STDERR "MENU (text_macro_stack: @{$state->{'text_macro_stack'}})\n";
                }
                elsif (exists($region_lines{$macro}))
                {
                    if (exists($state->{'region_lines'}) and ($state->{'region_lines'}->{'format'} ne $macro))
                    {
                        echo_error("\@$macro not allowed within $state->{'region_lines'}->{'format'}", $line_nr);
                        next;
                    }
                    if (!exists($state->{'region_lines'}))
                    {
                        $state->{'region_lines'}->{'format'} = $macro;
                        $state->{'region_lines'}->{'number'} = 1;
                        $state->{'region_lines'}->{'after_element'} = 1 if ($state->{'after_element'});
                        $state->{'region_lines'}->{'kept_place'} = $state->{'place'};
                        $state->{'place'} = $no_element_associated_place;
                    }
                    else
                    {
                        $state->{'region_lines'}->{'number'}++;
                    }
                    push @{$state->{'text_macro_stack'}}, $macro;
                }
                # if it is a raw formatting command or a menu command
                # we must keep it for later
                my $macro_kept; 
                if (($state->{'raw'} and (!defined($Texi2HTML::Config::command_handler{$macro}))) or ($macro eq 'menu'))
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
                return if (/^\s*$/);
            }
            elsif ($macro eq 'float')
            { 
                my ($style_texi, $label_texi) = split(/,/, $_);
                $style_texi = normalise_space($style_texi);
                $label_texi = undef if (defined($label_texi) and ($label_texi =~ /^\s*$/));
                if (defined($label_texi))
                { # The float may be a target for refs if it has a label
                    $label_texi = normalise_node($label_texi);
                    if (exists($nodes{$label_texi}) and defined($nodes{$label_texi})
                         and $nodes{$label_texi}->{'seen'})
                    {
                        echo_error ("Duplicate label found: $label_texi", $line_nr);
                        while ($_ =~ /,/)
                        {
                            $_ =~ s/,.*$//;
                        }
                    }
                    else
                    {
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
#print STDERR "FLOAT: $float $float->{'texi'}, place $state->{'place'}\n";
                        push @{$state->{'place'}}, $float;
                        $float->{'element'} = $state->{'element'};
                        $state->{'float'} = $float;
                        $float->{'style_texi'} = $style_texi;
                        push @floats, $float;
                    }
                }
                add_prev($text, $stack, "\@$macro" . $_);
                last;
            }
            elsif (defined($Texi2HTML::Config::def_map{$macro}))
            {
                #We must enter the index entries
                my ($prefix, $entry, $argument) = get_deff_index($macro, $_, $line_nr);
                # use deffn instead of deffnx for @-command record 
                # associated with index entry
                my $idx_macro = $macro;
                $idx_macro =~ s/x$//;
                enter_index_entry($prefix, $line_nr, $entry, $state->{'place'},
                   $state->{'element'}, 0, $idx_macro) if ($prefix);
                s/(.*)//;
                add_prev($text, $stack, "\@$macro" . $1);
                # the text is discarded but we must handle correctly bad
                # texinfo with 2 @def-like commands on the same line
                substitute_text({'structure' => 1, 'place' => $state->{'place'} },($argument));
            }
            elsif ($macro =~ /^itemx?$/)
            {
                enter_table_index_entry($text, $stack, $state, $line_nr);
                if ($state->{'table_stack'}->[-1] =~ /^(v|f)table$/)
                {
                    $state->{'item'} = $macro;
                    push @$stack, { 'format' => 'index_item', 'text' => "" };
                }
                else
                {
                    add_prev($text, $stack, "\@$macro");
                }
            }
            elsif ($format_type{$macro} and ($format_type{$macro} eq 'table' or $format_type{$macro} eq 'list'))
            { # We must enter the index entries of (v|f)table thus we track
              # in which table we are
                push @{$state->{'table_stack'}}, $macro;
                add_prev($text, $stack, "\@$macro");
            }
            elsif (s/^{//)
            {
                if ($macro eq 'verb')
                {
                    if (/^$/)
                    {
                        # We allready warned in pass texi
                        #warn "$ERROR verb at end of line";
                    }
                    else
                    {
                        s/^(.)//;
                        $state->{'verb'} = $1;
                    }
                }
                elsif ($macro eq 'footnote' and $Texi2HTML::Config::SEPARATED_FOOTNOTES)
                {
                    $state->{'footnote_element'} = $state->{'element'};
                    $state->{'footnote_place'} = $state->{'place'};
                    $state->{'element'} = $footnote_element;
                    $state->{'place'} = $footnote_element->{'place'};
                }
                push (@$stack, { 'style' => $macro, 'text' => '' });
            }
            else
            {
                add_prev($text, $stack, "\@$macro");
            }
            next;
        }
        #elsif(s/^([^{}@]*)\@(.)//o)
        elsif(s/^([^{}@]*)\@([^\s\}\{\@]*)//o)
        {
            add_prev($text, $stack, $1 . "\@$2");
            next;
        }
        elsif (s/^([^{}]*)([{}])//o)
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
                    add_prev ($text, $stack, close_structure_command($style,
                         $state, 0, $line_nr));
                    next;
                }
                else
                {
                    # We warn in the last pass
                    #warn "$ERROR '}' without opening '{' line: $line";
                    #echo_error ("'}' without opening '{' line: $line", $line_nr);
                    add_prev ($text, $stack, '}');
                }
            }
        }
        else
        {
            #print STDERR "END_LINE $_";
            add_prev($text, $stack, $_);
            enter_table_index_entry($text, $stack, $state, $line_nr);
            last;
        }
    }
    return 1;
}

sub scan_line($$$$;$)
{
    my $line = shift;
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;

    die "stack not an array ref"  unless (ref($stack) eq "ARRAY");
    local $_ = $line;
    #print STDERR "SCAN_LINE (@{$state->{'command_stack'}}): $line";
    #dump_stack($text, $stack,  $state );
    my $new_menu_entry; # true if there is a new menu entry
    my $menu_description_in_format; # true if we are in a menu description 
                                # but in another format section (@table....)
    if (defined($state->{'prepend_text'}))
    {
        $_ = $state->{'prepend_text'} . $_;
        $state->{'prepend_text'} = undef;
        delete $state->{'prepend_text'};
    }

    unless ($state->{'end_of_line_protected'} and $state->{'deff_line'})
    { # end of lines are really protected only for @def*
        if (!$state->{'raw'} and !$state->{'verb'} and $state->{'menu'})
        { # new menu entry
            my ($node, $name, $ending);
            if (s/^\*(\s+$NODERE)(::)//o)
            {
                $node = $1;
                $ending = $2;
            }
            elsif (s/^\*(\s+[^:]+):(\s*[^\t,\.\n]+)([\t,\.\n])//o)
            {
                $name = $1;
                $node = $2;
                $ending = $3;
            }
            if ($node)
            {
                my $top_stack = top_stack($stack);
                if ($top_stack and $top_stack->{'format'} and 
                    (
                     ($top_stack->{'format'} eq 'menu_description') or
                     ($top_stack->{'format'} eq 'menu') or
                     (($top_stack->{'format'} eq 'preformatted') and (stack_order($stack, 'preformatted', 'menu_comment'))) or
                     ($top_stack->{'format'} eq 'menu_preformatted') or
                     ($top_stack->{'format'} eq 'menu_comment')
                    )
                   )
                { # we are in a normal menu state.
                    close_menu($text, $stack, $state, $line_nr);
                    $new_menu_entry = 1;
                    $state->{'menu_entry'} = { 'name' => $name, 'node' => $node,
                       'ending' => $ending };
                    add_prev ($text, $stack, do_menu_link($state, $line_nr));
                    print STDERR "# New menu entry: $node\n" if ($T2H_DEBUG & $DEBUG_MENU);
                    push @$stack, {'format' => 'menu_description', 'text' => ''};
                }
                else
                { # we are within a macro or a format. In that case we use
                  # a simplified formatting of menu which should be right whatever
                  # the context
                    my $menu_entry = $state->{'menu_entry'};
                    $state->{'menu_entry'} = { 'name' => $name, 'node' => $node,
                       'ending' => $ending };
                    add_prev ($text, $stack, do_menu_link($state, $line_nr, 1));
                    $state->{'menu_entry'} = $menu_entry;
                }
            }
        }
        # we're in a menu entry description
        if ($state->{'menu_entry'} and !$new_menu_entry)
        {
            my $top_stack = top_stack($stack);
            if (/^\s+\S.*$/ or (!$top_stack->{'format'} or ($top_stack->{'format'} ne 'menu_description')))
            { # description continues
                $menu_description_in_format = 1 if ($top_stack->{'format'} and ($top_stack->{'format'} ne 'menu_description'));
                print STDERR "# Description continues\n" if ($T2H_DEBUG & $DEBUG_MENU);
            }
            else
            { # enter menu comment after menu entry
                ################################ begin debug
                if (!$top_stack->{'format'} or ($top_stack->{'format'} ne 'menu_description'))
                {
                    print STDERR "Bug: begin menu comment but previous isn't menu_description\n";
                    dump_stack ($text, $stack, $state);
                }
                print STDERR "# Menu comment begins\n" if ($T2H_DEBUG & $DEBUG_MENU);
                ################################ end debug
                my $descr = pop(@$stack);
            
                add_prev ($text, $stack, do_menu_description($descr->{'text'}, $state));
                delete $state->{'menu_entry'};
                unless (/^\s*\@end\s+menu\b/)
                {
                    $state->{'menu_comment'}++;
                    push @$stack, {'format' => 'menu_comment', 'text' => ''};
                    unless ($Texi2HTML::Config::SIMPLE_MENU)
                    {
                        push @{$state->{'preformatted_stack'}}, {'pre_style' => $Texi2HTML::Config::MENU_PRE_STYLE, 'class' => 'menu-comment' };
                        $state->{'preformatted'}++;
                        begin_paragraph($stack, $state);
                    }
                }
            }
        }
        if (($state->{'menu_entry'} and !$menu_description_in_format) or $state->{'raw'} or $state->{'preformatted'}  or $state->{'no_paragraph'} or $state->{'keep_texi'} or $state->{'remove_texi'})
        { # empty lines are left unmodified
            if (/^\s*$/)
            {
                add_prev($text, $stack, $_);
                return;
            }
            elsif (!$state->{'raw'})
            {
                my $next_tag = next_tag($_);
                if ($state->{'deff_line'} and !defined($Texi2HTML::Config::def_map{$next_tag}))
                {
                    begin_deff_item($stack, $state);
                }
            }
        }
        else
        {
            if (/^\s*$/)
            {
                if ($state->{'paragraph_context'})
                { # An empty line ends a paragraph
                    close_paragraph($text, $stack, $state, $line_nr);
                }
                add_prev($text, $stack, &$Texi2HTML::Config::empty_line($_,$state));
                return 1;
           }
           else
           {
               #print STDERR "a line not empty and not in no paragraph format\n";
                my $next_tag = next_tag($_);
                if ($state->{'deff_line'} and !defined($Texi2HTML::Config::def_map{$next_tag}))
                { # finish opening the deff, as this is not a deff tag, it can't be 
                  # a deff macro with x
                    begin_deff_item($stack, $state);
                }
                if (!no_paragraph($state,$_))
                { # open a paragraph, unless the line begins with a macro that
                  # shouldn't trigger a paragraph opening
                    begin_paragraph($stack, $state);
                }
            }
        }
    }
    delete $state->{'end_of_line_protected'} 
       if ($state->{'end_of_line_protected'});

    while(1)
    {
        # scan_line
        #print STDERR "WHILE (l): $_|";
        #dump_stack($text, $stack, $state);
        # we're in a raw format (html, tex if !L2H, verbatim)
        if (defined($state->{'raw'})) 
        {
            (dump_stack($text, $stack, $state), die "Bug for raw ($state->{'raw'})") if (! @$stack or ! ($stack->[-1]->{'style'} eq $state->{'raw'}));
            # macro_regexp
            if (/^(.*?)\@end\s([a-zA-Z][\w-]*)/o and ($2 eq $state->{'raw'}))
            # don't protect html, it is done by Texi2HTML::Config::raw if needed
            {
                s/^(.*?)\@end\s$state->{'raw'}//;
                print STDERR "# end raw $state->{'raw'}\n" if ($T2H_DEBUG & $DEBUG_FORMATS);
                add_prev ($text, $stack, $1);
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
                        add_prev($text, $stack, &$Texi2HTML::Config::raw($style->{'style'}, $style->{'text'}));
                    }
                }
                if (!$state->{'keep_texi'} and !$state->{'remove_texi'})
                {
                    # reopen preformatted if it was interrupted by the raw format
                    # if raw format is html the preformatted wasn't interrupted
                    begin_paragraph($stack, $state) if ($state->{'preformatted'} and (!$Texi2HTML::Config::format_in_paragraph{$state->{'raw'}})); 
                    delete $state->{'raw'};
                    return if (/^\s*$/);
                }
                delete $state->{'raw'};
                next;
            }
            else
            {
                print STDERR "#within raw $state->{'raw'}:$_" if ($T2H_DEBUG & $DEBUG_FORMATS);
                add_prev ($text, $stack, $_);
                last;
            }
        }

        # we are within a @verb
        if (defined($state->{'verb'}))
        {
            my $char = quotemeta($state->{'verb'});
            if (s/^(.*?)$char\}/\}/)
            {
                 if ($state->{'keep_texi'})
                 {
                     add_prev($text, $stack, $1 . $state->{'verb'});
                     $stack->[-1]->{'text'} = $state->{'verb'} . $stack->[-1]->{'text'};
                 }
                 elsif ($state->{'remove_texi'})
                 {
                     add_prev($text, $stack, $1);
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
                 add_prev($text, $stack, $_);
                 last;
            }
        }

        # a special case for @ followed by an end of line in deff
        # FIXME this is similar with makeinfo, but shouldn't that
        # be done for @floats and @quotations too? and @item, @center?
        # this piece of code is required, to avoid the 'cmd_line' to be 
        # closed below 
        if ($state->{'end_of_line_protected'} and $state->{'deff_line'})
        { 
            print STDERR "Bug: 'end_of_line_protected' with text following: $_\n" 
                unless /^$/;
            return;
        }

        # We handle now the end tags 
        # macro_regexp
        if ($state->{'keep_texi'} and s/^([^{}@]*)\@end\s+([a-zA-Z][\w-]*)//)
        {
            my $end_tag = $2;
            add_prev($text, $stack, $1 . "\@end $end_tag");
            next;
        }
        # macro_regexp
        elsif ($state->{'remove_texi'} and s/^([^{}@]*)\@end\s+([a-zA-Z][\w-]*)//)
        {
            add_prev($text, $stack, $1);
            next;
        }
	# macro_regexp
        #if (s/^([^{}@,]*)\@end\s+([a-zA-Z][\w-]*)\s//o or s/^([^{}@,]*)\@end\s+([a-zA-Z][\w-]*)$//o)
        if (s/^([^{}@,]*)\@end\s+([a-zA-Z][\w-]*)//o)
        {
            add_prev($text, $stack, do_text($1, $state));
            my $end_tag = $2;
	    #print STDERR "END_MACRO $end_tag\n";
	    #dump_stack ($text, $stack, $state);

            # first handle @end formats registered as misc_commands. In the
            # default case it is only @end detailmenu
            my $end_macro = "end $end_tag";
            if (defined($Texi2HTML::Config::misc_command{$end_macro}))
            {
                $_ = misc_command_text($_, $end_macro, $stack, $state, $text, $line_nr);
                return unless (defined($_));
                next;
            }

            # First we test if the stack is not empty.
            # Then we test if the end tag is a format tag.
            # We then close paragraphs and preformatted at top of the stack.
            # We handle the end tag (even when it was not the tag which appears
            # on the top of the stack; in that case we close anything 
            # until that element)
            my $top_stack = top_stack($stack);
            if (!$top_stack)
            {
                echo_error ("\@end $end_tag without corresponding opening", $line_nr);
                add_prev($text, $stack, "\@end $end_tag");
                next;
            }

            if (!$format_type{$end_tag})
            {
                echo_warn ("Unknown \@end $end_tag", $line_nr);
                #warn "$ERROR Unknown \@end $end_tag\n";
                add_prev($text, $stack, "\@end $end_tag");
                next;
            }
            unless ($Texi2HTML::Config::format_in_paragraph{$end_tag})
            { # If the $end_tag is wrong we may be keeping paragraph 
              # for a format with paragraphs on the stack
                close_paragraph($text, $stack, $state, $line_nr); 
            }

            $top_stack = top_stack($stack);
            if (!$top_stack or (!defined($top_stack->{'format'})))
            {
                echo_error ("\@end $end_tag without corresponding opening element", $line_nr);
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
                 ($format_type{$end_tag} eq 'menu') and
                 (
                  ($top_stack->{'format'} eq 'menu_preformatted') or
                  ($top_stack->{'format'} eq 'menu_comment') or
                  ($top_stack->{'format'} eq 'menu_description')
                 )
                ) or
                ( 
                 ($end_tag eq 'multitable') and 
                 (
                  ($top_stack->{'format'} eq 'cell') or
                  ($top_stack->{'format'} eq 'null')
                 )
                ) or
                ( 
                 ($format_type{$end_tag} eq 'list' ) and 
                 ($top_stack->{'format'} eq 'item')
                ) or
                (
                 (
                  ($format_type{$end_tag} eq 'table') and 
                  ($end_tag ne 'multitable')
                 ) and 
                 (
                   ($top_stack->{'format'} eq 'term') or
                   ($top_stack->{'format'} eq 'line') 
                 )
                ) or
                (
                 (defined($Texi2HTML::Config::def_map{$end_tag})) and 
                 ($top_stack->{'format'} eq 'deff_item')
                ) or
                (
                 ($end_tag eq 'row') and 
                 ($top_stack->{'format'} eq 'cell')
                )
               )
            {
                # this is not the right format. We try to close other
                # formats to find the format we are searching for.
                # First we close paragraphs, as with a wrong $end_format
                # they may not be closed properly.
                close_paragraph($text, $stack, $state, $line_nr);
                $top_stack = top_stack($stack);
                if (!$top_stack or (!defined($top_stack->{'format'})))
                {
                    echo_error ("\@end $end_tag without corresponding opening element", $line_nr);
                    add_prev($text, $stack, "\@end $end_tag");
                    dump_stack ($text, $stack, $state) if ($T2H_DEBUG);
                    next;
                }
                my $waited_format = $top_stack->{'format'};
                $waited_format = $fake_format{$top_stack->{'format'}} if ($format_type{$top_stack->{'format'}} eq 'fake');
                echo_error ("waiting for end of $waited_format, found \@end $end_tag", $line_nr);
                close_stack($text, $stack, $state, $line_nr, undef, $end_tag);
                # an empty preformatted may appear when closing things as
                # when closed, formats reopen the preformatted environment
                # in case there is some text following, but we know it isn't 
                # the case here, thus we can close paragraphs.
                close_paragraph($text, $stack, $state);
                my $new_top_stack = top_stack($stack);
                next unless ($new_top_stack and defined($new_top_stack->{'format'}) and (($new_top_stack->{'format'} eq $end_tag) 
                   or (($format_type{$new_top_stack->{'format'}} eq 'fake') and ($fake_format{$new_top_stack->{'format'}} eq $format_type{$end_tag}))));
            }
            # We should now be able to handle the format
            if (defined($format_type{$end_tag}) and $format_type{$end_tag} ne 'fake')
            {# remove the space or new line following the @end command
                s/\s//;
                end_format($text, $stack, $state, $end_tag, $line_nr);
                begin_paragraph_after_command($state,$stack,$end_tag,$_);
            }
            else 
            { # this is a fake format, ie a format used internally, inside
              # a real format. We do nothing, hoping the real format will
              # get closed, closing the fake internal formats
              #print STDERR "FAKE \@end $end_tag\n";
            }
            next;
        }
        # This is a macro
	#elsif (s/^([^{}@]*)\@([a-zA-Z]\w*|["'~\@\}\{,\.!\?\s\*\-\^`=:\/])//o)
        # macro_regexp
        elsif (s/^([^{},@]*)\@(["'~\@\}\{,\.!\?\s\*\-\^`=:\|\/\\])//o or s/^([^{}@,]*)\@([a-zA-Z][\w-]*)([\s\{\}\@])/$3/o or s/^([^{},@]*)\@([a-zA-Z][\w-]*)$//o)
        {
            add_prev($text, $stack, do_text($1, $state));
            my $macro = $2;
            $macro = $alias{$macro} if (exists($alias{$macro}));
	    #print STDERR "MACRO $macro\n";
	    #print STDERR "LINE $_";
	    #dump_stack ($text, $stack, $state);
            # This is a macro added by close_stack to mark paragraph end
            if ($macro eq 'end_paragraph')
            {
                s/^\{\}//;
                my $top_stack = top_stack($stack);
                #################################### debug
                if (!$top_stack or !$top_stack->{'format'} 
                    or ($top_stack->{'format'} ne 'paragraph'))
                {
                    print STDERR "Bug: end_paragraph but no paragraph to end\n";
                    dump_stack ($text, $stack, $state);
                    next;
                }
                #################################### end debug
                s/^\s//;
                my $paragraph = pop @$stack;
                add_prev ($text, $stack, do_paragraph($paragraph->{'text'}, $state));
                next;
            }
            # Handle macro added by close_stack to mark preformatted region end
            elsif ($macro eq 'end_preformatted')
            {
                #print STDERR "END_PREFORMATTED\n";
                s/^\{\}//;
                my $top_stack = top_stack($stack);
                #################################### debug
                if (!$top_stack or !$top_stack->{'format'} 
                    or ($top_stack->{'format'} ne 'preformatted'))
                {
                    print STDERR "Bug: end_preformatted but no preformatted to end\n";
                    dump_stack ($text, $stack, $state);
                    next;
                }
                #################################### end debug
                my $paragraph = pop @$stack;
                s/^\s//;
                add_prev ($text, $stack, do_preformatted($paragraph->{'text'}, $state));
                next;
            }
            if (defined($Texi2HTML::Config::misc_command{$macro}))
            {
                # Handle the misc command
                $_ = misc_command_text($_, $macro, $stack, $state, $text, $line_nr);
                return unless (defined($_));
                unless ($Texi2HTML::Config::misc_command{$macro}->{'keep'})
                {
                     begin_paragraph($stack, $state) if 
                       (!no_paragraph($state,$_));
                     next;
                }
            }
            if ($macro eq 'listoffloats')
            {
                if ($state->{'keep_texi'})
                {
                    if (s/(.*)//o)
                    {
                        add_prev($text, $stack, "\@$macro" . $1);
                    }
                    next;
                }
                return undef if ($state->{'remove_texi'});
                
                if (s/^(\s+)(.*)//o)
                {
                    my $arg = $2;
                    my $style_id = cross_manual_line(normalise_space($arg));
                    my $style = substitute_line (&$Texi2HTML::Config::listoffloats_style($arg));
                    if (exists ($floats{$style_id}))
                    {
                         close_paragraph($text, $stack, $state, $line_nr);
                         my @listoffloats_entries = ();
                         foreach my $float (@{$floats{$style_id}->{'floats'}})
                         {
                              my $float_style = substitute_line(&$Texi2HTML::Config::listoffloats_float_style($arg, $float));
                              my $caption_lines = &$Texi2HTML::Config::listoffloats_caption($float);
                              # we set 'multiple_pass' such that index entries
                              # and anchors are not handled one more time;
                              # the caption has allready been formatted, 
                              # and these have been handled at the right place
                              my $caption = substitute_text({ 'multiple_pass' => 1 }, @$caption_lines);
                              push @listoffloats_entries, &$Texi2HTML::Config::listoffloats_entry($arg, $float, $float_style, $caption, href($float, $state->{'element'}->{'file'}));
                         }
                         add_prev($text, $stack, &$Texi2HTML::Config::listoffloats($arg, $style, \@listoffloats_entries));
                    }
                    else
                    {
                         echo_warn ("Unknown float style $arg", $line_nr); 
                    }
                }
                else
                {
                    echo_error ("Bad \@$macro line: $_", $line_nr);
                } 
                return undef;
            }
            if ($macro eq 'm_cedilla' and !$state->{'keep_texi'})
            {
                $macro = ',';
            }
            # This is a @macroname{...} construct. We add it on top of stack
            # It will be handled when we encounter the '}'
            # There is a special case for def macros as @deffn{def} is licit
            if (!$Texi2HTML::Config::def_map{$macro} and s/^{//)
            {
                if ($macro eq 'verb')
                {
                    if (/^$/)
                    {
                        # Allready warned 
                        #warn "$ERROR verb at end of line";
                    }
                    else
                    {
                        s/^(.)//;
                        $state->{'verb'} = $1;
                    }
                } 
                # currently if remove_texi and anchor/ref/footnote
                # the text within the command is ignored
                # see t2h_remove_command in texi2html.init
                push (@$stack, { 'style' => $macro, 'text' => '', 'arg_nr' => 0 });
                $state->{'no_paragraph'}++ if ($no_paragraph_macro{$macro});
                open_arg($macro, 0, $state);
                if (defined($style_type{$macro}) and (($style_type{$macro} eq 'style') or ($style_type{$macro} eq 'accent')))
                {
                     push (@{$state->{'command_stack'}}, $macro);
                     #print STDERR "# Stacked $macro (@{$state->{'command_stack'}})\n" if ($T2H_DEBUG); 
                }
                next;
            }

            # special case if we are checking itemize line. In that case
            # we want to make sure that there is no @item on the @itemize
            # line, otherwise it will be added on the front of another @item,
            # leading to an infinite loop...

            if ($state->{'check_item'} and ($macro =~ /^itemx?$/ or $macro eq 'headitem'))
            {
                echo_error("\@$macro on \@$state->{'check_item'} line", $line_nr);
                next;
            }

            # if we're keeping texi unmodified we can do it now
            if ($state->{'keep_texi'})
            {
                # We treat specially formats accepting {} on command line
                if ($macro eq 'multitable' or defined($Texi2HTML::Config::def_map{$macro}) or defined($sec2level{$macro}))
                {
                    add_prev($text, $stack, "\@$macro" . $_);
                    $_ = '';
                    next;
                }
                # @ at the end of line may protect the end of line even when
                # keeping texi
                if ($macro eq "\n")
                {
                     $state->{'end_of_line_protected'} = 1;
                     #print STDERR "PROTECTING END OF LINE\n";
                }

                add_prev($text, $stack, "\@$macro");
                if ($text_macros{$macro} and $text_macros{$macro} eq 'raw')
                {
                    $state->{'raw'} = $macro;
                    push (@$stack, {'style' => $macro, 'text' => ''});
                }
                next;
            }

            # If we are removing texi, the following macros are not removed 
            # as is but modified. So they are collected first, as if we were
            # in normal text

            # a raw macro beginning
            if ($text_macros{$macro} and $text_macros{$macro} eq 'raw')
            {
                if (!$Texi2HTML::Config::format_in_paragraph{$macro})
                { # close paragraph before verbatim (and tex if !L2H)
                    close_paragraph($text, $stack, $state, $line_nr);
                }
                $state->{'raw'} = $macro;
                push (@$stack, {'style' => $macro, 'text' => ''});
                return if (/^\s*$/);
                next;
            }
            my $simple_macro = 1;
            # An accent macro
            if (exists($Texi2HTML::Config::accent_map{$macro}))
            {
                push (@{$state->{'command_stack'}}, $macro);
                if (s/^(\S)//o)
                {
                    add_prev($text, $stack, do_simple($macro, $1, $state, [ $1 ], $line_nr));
                }
                else
                { # The accent is at end of line
                    add_prev($text, $stack, do_text($macro, $state));
                }
                pop @{$state->{'command_stack'}};
            }
            # an @-command which should be like @command{}. We handle it...
            elsif ($::things_map_ref->{$macro})
            {
                echo_warn ("$macro requires {}", $line_nr);
                add_prev($text, $stack, do_simple($macro, '', $state));
            }
            # an @-command like @command
            elsif (defined($::simple_map_ref->{$macro}))
            {
                add_prev($text, $stack, do_simple($macro, '', $state));
            }
            else
            {
                 $simple_macro = 0;
            }
            if ($simple_macro)
            {# if the macro didn't triggered a paragraph start it might now
                begin_paragraph($stack, $state) if 
                   ($no_line_macros{$macro} and !no_paragraph($state,$_));
                next;
            }
            # the following macros are modified or ignored if we are 
            # removing texi, and they are not handled like macros in text
            if ($state->{'remove_texi'})
            {
                 # handle specially some macros
                 if ((($macro =~ /^(\w+?)index$/) and ($1 ne 'print')) or 
                      ($macro eq 'itemize') or ($macro =~ /^(|v|f)table$/)
                      or ($macro eq 'multitable') or ($macro eq 'quotation'))
                 {
                      return;
                 }
                 elsif ($macro eq 'enumerate')
                 {
                      my $spec;
                      ($_, $spec) = parse_enumerate ($_);
                      return if (/^\s*$/);
                      next;
                 }
                 elsif (defined($Texi2HTML::Config::def_map{$macro}))
                 {
                     my ($style, $category, $name, $type, $class, $arguments);
                     ($style, $category, $name, $type, $class, $arguments) = parse_def($macro, $_, $line_nr); 
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
                {
                    my $num;
                    if ($state->{'multiple_pass'})
                    {
                        $num = "hidden";
                    }
                    else
                    {
                        $head_num++;
                        $num = $head_num;
                    }
                    my $heading_element = $headings{$num};
                    add_prev($text, $stack, &$Texi2HTML::Config::heading_no_texi($heading_element, $macro, $_));
                    return;
                }

                # ignore other macros
                next;
            }

            # handle the other macros, in the context of some normal text
            if (defined($sec2level{$macro}))
            {
                 #dump_stack($text, $stack, $state);
                 my $num;
                 if ($state->{'multiple_pass'})
                 {
                    $num = "hidden";
                 }
                 else
                 {
                     $head_num++;
                     $num = $head_num;
                 }
                 my $heading_element = $headings{$num};
                 add_prev($text, $stack, &$Texi2HTML::Config::anchor($heading_element->{'id'}) . "\n");
                 add_prev($text, $stack, &$Texi2HTML::Config::heading($heading_element, $macro, $_, substitute_line($_), $state->{'preformatted'}));
                 return;
            }

            if (($macro =~ /^(\w+?)index$/) and ($1 ne 'print'))
            {
                add_prev($text, $stack, do_index_entry_label($macro,$state,$line_nr));
                return;
            }
            if ($macro eq 'insertcopying')
            {
                close_paragraph($text, $stack, $state, $line_nr);
                add_prev($text, $stack, do_insertcopying($state));
                # reopen a preformatted format if it was interrupted by the macro
                begin_paragraph ($stack, $state) if ($state->{'preformatted'});
                return;
            }
            if ($macro =~ /^itemx?$/o or ($macro eq 'headitem'))
            {
		    #print STDERR "ITEM: $_";
		    #dump_stack($text, $stack, $state);
                abort_empty_preformatted($stack, $state);
                # FIXME let the user be able not to close the paragraph
                close_paragraph($text, $stack, $state, $line_nr);
                # these functions return the format if in the right context
                my $format;
                if ($format = add_item($text, $stack, $state, $line_nr, $_))
                { # handle lists
                }
                elsif ($format = add_term($text, $stack, $state, $line_nr))
                {# handle table @item line
                }
                elsif ($format = add_line($text, $stack, $state, $line_nr)) 
                {# handle table text
                }
                if ($format)
                {
                    if (defined($format->{'prepended'}))
                    { 
                        $_ = $format->{'prepended'} . ' ' . $_ if ($format->{'prepended'} ne '');
                    }
                    if (defined($format->{'command'}))
                    { 
                         open_arg($format->{'command'},0, $state);
                    }
                    next;
                }
                $format = add_row ($text, $stack, $state, $line_nr); # handle multitable
                unless ($format)
                {
                    echo_warn ("\@$macro outside of table or list", $line_nr);
                    next;
                }
                push @$stack, {'format' => 'row', 'text' => '', 'item_cmd' => $macro };
                if ($format->{'max_columns'})
                {
                    push @$stack, {'format' => 'cell', 'text' => ''};
                    $format->{'cell'} = 1;
                    
                    begin_paragraph_after_command($state,$stack,$macro,$_);
                }
                else
                {
                    echo_warn ("\@$macro in empty multitable", $line_nr);
                }
                next;
            }
            if ($macro eq 'tab')
            {
                abort_empty_preformatted($stack, $state);
                # FIXME let the user be able not to close the paragraph
                close_paragraph($text, $stack, $state, $line_nr);
                my $format = add_cell ($text, $stack, $state);
                #print STDERR "tab, $format->{'cell'}, max $format->{'max_columns'}\n";
                if (!$format)
                {
                    echo_warn ("\@$macro outside of multitable", $line_nr);
                }
                elsif (!$format->{'max_columns'})
                {
                    echo_warn ("\@$macro in empty multitable", $line_nr);
                    push @$stack, {'format' => 'null', 'text' => ''};
                    next;
                }
                elsif ($format->{'cell'} > $format->{'max_columns'})
                {
                    echo_warn ("too much \@$macro (multitable has only $format->{'max_columns'} column(s))", $line_nr);
                    push @$stack, {'format' => 'null', 'text' => ''};
                    next;
                }
                else
                {
                    push @$stack, {'format' => 'cell', 'text' => ''};
                }
                begin_paragraph_after_command($state,$stack,$macro,$_);
                next;
            }
            # Macro opening a format (table, list, deff, example...)
            if ($format_type{$macro} and ($format_type{$macro} ne 'fake'))
            {
                unless ($Texi2HTML::Config::format_in_paragraph{$macro})
                {
                    close_paragraph($text, $stack, $state, $line_nr);
                }
                push (@{$state->{'command_stack'}}, $macro);
                if ($format_type{$macro} eq 'menu')
                {
                    close_menu($text, $stack, $state, $line_nr);
                    $state->{'menu'}++;
                }
                # A deff like macro
                if (defined($Texi2HTML::Config::def_map{$macro}))
                {
                    my $top_format = top_format($stack);
                    if (defined($top_format) and ("$top_format->{'format'}x" eq $macro))
                    {
                      # the @DEFx macro has been put at the top of the 
                      # command_stack, although there is no real format opening
                         pop @{$state->{'command_stack'}};
                         $macro =~ s/x$//o;
                         if (!$state->{'deff_line'})
                         {# DEFx macro within a DEF paragraph
                              close_stack($text, $stack, $state, $line_nr, undef, 'deff_item');
                              my $format_ref = pop @$stack;
                              add_prev($text, $stack, &$Texi2HTML::Config::def_item($format_ref->{'text'}));
			 }
                         #print STDERR "DEFx $macro\n";
                    }
                    else
                    {
                         # The previous @def command isn't the same @def
                         # command. We begin the item for the previous @def
                         # command and immediately open the new one.
                         begin_deff_item($stack, $state, 1) if ($state->{'deff_line'});
                         $macro =~ s/x$//o;
                         # we remove what is on the stack and put it back,
                         # to make sure that it is the form without x.
                         pop @{$state->{'command_stack'}};
                         push @{$state->{'command_stack'}}, $macro;
                         #print STDERR "DEF begin $macro\n";
                         push @$stack, { 'format' => $macro, 'text' => '' };
                    }
                    #print STDERR "BEGIN_DEFF $macro\n";
                    #dump_stack ($text, $stack, $state);
                    $state->{'deff_line'}->{'command'} = $macro;
                    my ($style, $category, $name, $type, $class, $arguments);
                    ($style, $category, $name, $type, $class, $_) = parse_def($macro, $_, $line_nr); 
                    #print STDERR "AFTER parse_def $_";
                    # duplicate_state?
                    $state->{'deff_line'}->{'style'} = $style;
                    $state->{'deff_line'}->{'category'} = substitute_line($category) if (defined($category));
                    $state->{'deff_line'}->{'category'} = '' if (!defined($category));
                    # FIXME -- --- ''... are transformed to entities by 
                    # makeinfo. It may be wrong.
                    $state->{'deff_line'}->{'name'} = substitute_line($name) if (defined($name));
                    $state->{'deff_line'}->{'name'} = '' if (!defined($name));
                    $state->{'deff_line'}->{'type'} = substitute_line($type) if (defined($type));
                    $state->{'deff_line'}->{'class'} = substitute_line($class) if (defined($class));
                    # the remaining of the line (the argument)
                    #print STDERR "DEFF: open_cmd_line do_def_line $_";
                    open_cmd_line($stack, $state, ['keep'], \&do_def_line);
                    next;
                }
                elsif (exists ($Texi2HTML::Config::complex_format_map->{$macro}))
                { # handle menu if SIMPLE_MENU. see texi2html.init
                    $state->{'preformatted'}++;
                    my $complex_format =  $Texi2HTML::Config::complex_format_map->{$macro};
                    my $format = { 'format' => $macro, 'text' => '', 'pre_style' => $complex_format->{'pre_style'} };
                    my $class = $macro;
                    $class = $complex_format->{'class'} if (defined($complex_format->{'class'}));
                    push @{$state->{'preformatted_stack'}}, {'pre_style' =>$complex_format->{'pre_style'}, 'class' => $class };
                    push @$stack, $format;
                    unless ($Texi2HTML::Config::format_in_paragraph{$macro})
                    {
                        begin_paragraph($stack, $state);
                    }
                }
                elsif ($Texi2HTML::Config::paragraph_style{$macro})
                {
                    push (@$stack, { 'format' => $macro, 'text' => '' });
                    begin_paragraph_after_command($state,$stack,$macro,$_);
                    push @{$state->{'paragraph_style'}}, $macro;
                    if ($macro eq 'center')
                    {
                        # @center may be in a weird state with regard with
                        # nesting, so we put it on the bottom of the stack
                        pop @{$state->{'command_stack'}};
                        unshift @{$state->{'command_stack'}}, $macro;
                        # for similar reasons, we may have a bad stack nesting
                        # which results in } after a closing. For example
                        # @center @samp{something @center end of samp}
                        # results to samp being kept in the 'command_stack'

                        # we keep the end of line for @center, to
                        # avoid the return in case there is only spaces
                        # which occurs for all the format commmands followed by 
                        # spaces only
                        next;
                    }
                }
                elsif ($format_type{$macro} eq 'menu')
                {
                    # if $Texi2HTML::Config::SIMPLE_MENU we won't get there
                    # as the menu is a complex format in that case, so it 
                    # is handled above
                    push @$stack, { 'format' => $macro, 'text' => '' };
                    if ($state->{'preformatted'})
                    {
                    # Start a fake complex format in order to have a given pre style
                        $state->{'preformatted'}++;
                        push @$stack, { 'format' => 'menu_preformatted', 'text' => '', 'pre_style' => $Texi2HTML::Config::MENU_PRE_STYLE };
                        push @{$state->{'preformatted_stack'}}, {'pre_style' => $Texi2HTML::Config::MENU_PRE_STYLE, 'class' => 'menu-preformatted' };
                    }
                }
                elsif (($format_type{$macro} eq 'list') or ($format_type{$macro} eq 'table'))
                {
                    my $format;
		    #print STDERR "LIST_TABLE $macro\n";
		    #dump_stack($text, $stack, $state);
                    if (($macro eq 'itemize') or ($macro =~ /^(|v|f)table$/))
                    {
                        my $command;
                        my $prepended;
                        ($prepended, $command) = parse_format_command($_,$macro);
                        $format = { 'format' => $macro, 'text' => '', 'command' => $command, 'prepended' => $prepended, 'term' => 0 };
                        $_ = '';
                    }
                    elsif ($macro eq 'enumerate')
                    {
                        my $spec;
                        ($_, $spec) = parse_enumerate ($_);
                        $spec = 1 if (!defined($spec)); 
                        $format = { 'format' => $macro, 'text' => '', 'spec' => $spec, 'item_nr' => 0 };
                    }
                    elsif ($macro eq 'multitable')
                    {
                        my $max_columns = parse_multitable ($_, $line_nr);
                        if (!$max_columns)
                        {
                            echo_warn ("empty multitable", $line_nr);
                            $max_columns = 0;
                        }
                        $format = { 'format' => $macro, 'text' => '', 'max_columns' => $max_columns, 'cell' => 1 };
                    }
                    $format->{'first'} = 1;
                    $format->{'paragraph_number'} = 0;
                    push @$stack, $format;
                    push @{$state->{'table_list_stack'}}, $format;
                    if ($macro =~ /^(|v|f)table$/)
                    {
                        push @$stack, { 'format' => 'line', 'text' => ''};
                    }
                    elsif ($macro eq 'multitable')
                    {
                        if ($format->{'max_columns'})
                        {
                            push @$stack, { 'format' => 'row', 'text' => '', 'item_cmd' => $macro };
                            push @$stack, { 'format' => 'cell', 'text' => ''};
                        }
                        else 
                        {
                            # multitable without row... We use the special null
                            # format which content is ignored
                            push @$stack, { 'format' => 'null', 'text' => ''};
                            push @$stack, { 'format' => 'null', 'text' => ''};
                        }
                    }
                    if ($format_type{$macro} eq 'list')
                    {
                        push @$stack, { 'format' => 'item', 'text' => ''};
                    }
                    begin_paragraph_after_command($state,$stack,$macro,$_)
                       if ($macro ne 'multitable');
                    return if ($format_type{$macro} eq 'table' or $macro eq 'itemize');
                }
                elsif ($macro eq 'float' or $macro eq 'quotation')
                {
                    push @$stack, {'format' => $macro, 'text' => '' };
                    if ($macro eq 'float')
                    {
                         open_cmd_line($stack, $state, ['keep','keep'], \&do_float_line);
                    }
                    elsif ($macro eq 'quotation')
                    {
                         open_cmd_line($stack, $state, ['keep'], \&do_quotation_line);
                    }
                    #dump_stack($text, $stack, $state);
                    next;
                }
                # keep this one at the end as there are some other formats
                # which are also in format_map
                elsif (defined($Texi2HTML::Config::format_map{$macro}) or ($format_type{$macro} eq 'cartouche'))
                {
                    push @$stack, { 'format' => $macro, 'text' => '' };
                    begin_paragraph_after_command($state,$stack,$macro,$_);
                }
                return if (/^\s*$/);
                next;
            }
            $_ = do_unknown ($macro, $_, $text, $stack, $state, $line_nr);
            next;
        }
        elsif(s/^([^{}@,]*)\@([^\s\}\{\@]*)//o)
        { # A macro with a character which shouldn't appear in macro name
            add_prev($text, $stack, do_text($1, $state));
            $_ = do_unknown ($2, $_, $text, $stack, $state, $line_nr);
            next;
        }
        elsif (s/^([^{},]*)([{}])//o or (@$stack and 
             defined($stack->[-1]->{'style'}) and
             ($stack->[-1]->{'style'} eq 'cmd_line') and /^([^{},]*)$/o))
        {
            my $leading_text = $1;
            my $brace = $2;
            add_prev($text, $stack, do_text($leading_text, $state));
            if (defined($brace) and ($brace eq '{'))
            {
                add_prev($text, $stack, do_text('{',$state));
                if ($state->{'math_style'})
                {
                    $state->{'math_brace'}++;
                }
                else 
                {
                    unless ($state->{'keep_texi'} or $state->{'remove_texi'})
                    {
                        echo_error ("'{' without macro. Before: $_", $line_nr);
                    }
                }
            }
            elsif (defined($brace) and ($brace eq '}') and 
                    (!@$stack or (!defined($stack->[-1]->{'style'}))
            # a non empty stack, but with 'cmd_line' as first item on the stack
            # is like an empty stack
                       or ($stack->[-1]->{'style'} eq 'cmd_line'))
            # braces are allowed in math
                    or $state->{'math_brace'})
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
                    echo_error("'}' without opening '{' before: $_", $line_nr);
                }
            }
            else
            { # A @-command{ ...} is closed
                my $style = pop @$stack;
                my $command = $style->{'style'};
                my $result;
                if (ref($::style_map_ref->{$command}) eq 'HASH')
                {
                    push (@{$style->{'args'}}, $style->{'text'});
                    $style->{'fulltext'} .= $style->{'text'};
                    #my $number = 0;
                    #foreach my $arg(@{$style->{'args'}})
                    #{
                         #print STDERR "  $number: $arg\n";
                    #     $number++;
                    #}
                    $style->{'text'} = $style->{'fulltext'};
                    $state->{'keep_texi'} = 0 if (
                        ($::style_map_ref->{$command}->{'args'}->[$style->{'arg_nr'}] eq 'keep') 
                        and ($state->{'keep_nr'} == 1));
                }
                $state->{'no_paragraph'}-- if ($no_paragraph_macro{$command});
                if ($command)
                {
                    $style->{'no_close'} = 1 if ($state->{'no_close'});
                    if ($::style_map_ref->{$command} and (defined($style_type{$command})) and ((!$style->{'no_close'} and ($style_type{$command} eq 'style')) or ($style_type{$command} eq 'accent')))
                    {
                        my $style_command = pop @{$state->{'command_stack'}};
                        if ($style_command ne $command)
                        {
                            print STDERR "Bug: $style_command on 'command_stack', not $command\n";
                            push @$stack, $style;
                            push @{$state->{'command_stack'}}, $style_command;
                            print STDERR "Stacks before pop top:\n";
                            dump_stack($text, $stack, $state);
                            pop @$stack;
                        }
                    }
                    if ($state->{'keep_texi'})
                    { # don't expand @-commands in anchor, refs...
                        close_arg ($command, $style->{'arg_nr'}, $state);
                        $result = '@' . $command . '{' . $style->{'text'} . '}';
                    }
                    else
                    {
                        $result = do_simple($command, $style->{'text'}, $state, $style->{'args'}, $line_nr, $style->{'no_open'}, $style->{'no_close'});
                        if ($state->{'code_style'} < 0)
                        {
                            echo_error ("Bug: negative code_style: $state->{'code_style'}, line:$_", $line_nr);
                        }
                        if ($state->{'math_style'} < 0)
                        {
                            echo_error ("Bug: negative math_style: $state->{'math_style'}, line:$_", $line_nr);
                        }
                    }
                }
                else
                {
                    print STDERR "Bug: empty style in pass_text\n";
                }
                add_prev($text, $stack, $result);
                if ($command eq 'cmd_line')
                {
                    if ($state->{'deff_line'})
                    {
#print STDERR "DO DEFF $state->{'deff_line'}->{'command'} $state->{'deff_line'}->{'arguments'}\n";
                         my $command = $state->{'deff_line'}->{'command'};
                         my $def_style = $state->{'deff_line'}->{'style'};
                         my $category = $state->{'deff_line'}->{'category'};
                         my $class = $state->{'deff_line'}->{'class'};
                         my $type = $state->{'deff_line'}->{'type'};
                         my $name = $state->{'deff_line'}->{'name'};
                         #my $arguments = $state->{'deff'}->{'arguments'};
                         my $arguments; 
                         $arguments = substitute_line($state->{'deff_line'}->{'arguments'}) if (defined($state->{'deff_line'}->{'arguments'}));

                         $category = &$Texi2HTML::Config::definition_category($category, $class, $def_style);
                         my $index_label = do_index_entry_label($command, $state,$line_nr);
                         add_prev($text, $stack, &$Texi2HTML::Config::def_line($category, $name, $type, $arguments, $index_label));
                    }
                    elsif ($state->{'preformatted'})
                    { # inconditionally begin a preformatted section for 
                      # non @def* commands (currently @float and @quotation)
                      # for @def* it is done in begin_deff_item
                        begin_paragraph($stack, $state);
                    }
                    $state->{'no_paragraph'}--;
                    return;
                }
            }
        }
        elsif (s/^([^,]*)[,]//o)
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
            add_prev($text, $stack, do_text($_, $state));
            #print STDERR "END LINE:$_!!!\n";
            #dump_stack($text, $stack, $state);
            
            # @item line is closed by end of line
            add_term($text, $stack, $state, $line_nr);

            # @center is closed at the end of line. When a @-command which 
            # keeps the texi as is happens on the @center line, the @center
            # is closed at the end of line appearing after the @-command
            # closing (for example @ref, @footnote).

            # when 'closing_center' is true we don't retry to close 
            # the @center line.
            if ($state->{'paragraph_style'}->[-1] eq 'center' 
               and !$state->{'closing_center'} and !$state->{'keep_texi'})
            {
                $state->{'closing_center'} = 1;
                unless ($Texi2HTML::Config::format_in_paragraph{'center'})
                {
                    close_paragraph($text, $stack, $state, $line_nr); 
                }
                close_stack($text, $stack, $state, $line_nr, undef, 'center');
                delete $state->{'closing_center'};
                my $center = pop @$stack;
                add_prev($text, $stack, &$Texi2HTML::Config::paragraph_style_command('center',$center->{'text'}));
                my $top_paragraph_style = pop @{$state->{'paragraph_style'}};
                # center is at the bottom of the comand_stack because it 
                # may be nested in many way
                my $bottom_command_stack = shift @{$state->{'command_stack'}};
                print STDERR "Bug: closing center, top_paragraph_style: $top_paragraph_style, bottom_command_stack: $bottom_command_stack.\n"
                   if ($bottom_command_stack ne 'center' or $top_paragraph_style ne 'center');
                $_ = '';
                next;
            }
            last;
        }
    }
    return 1;
}

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
# that extend until the end of the line
sub open_cmd_line($$$$)
{
    my $stack = shift;
    my $state = shift;
    my $args = shift;
    my $function = shift;
    push @$stack, {'style' => 'cmd_line', 'text' => '', 'arg_nr' => 0};
    foreach my $hash (\%Texi2HTML::Config::style_map, \%Texi2HTML::Config::style_map_pre, \%Texi2HTML::Config::style_map_texi, \%Texi2HTML::Config::simple_format_style_map_texi)
    {
         $hash->{'cmd_line'}->{'args'} = $args;
         $hash->{'cmd_line'}->{'function'} = $function;
    }
    $state->{'no_paragraph'}++;
    open_arg ('cmd_line', 0, $state);
}

# finish @item line in @*table
sub add_term($$$$;$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    my $end = shift;
    return unless (exists ($state->{'table_list_stack'}));
    my $format = $state->{'table_list_stack'}->[-1];
    return unless (($format_type{$format->{'format'}} eq 'table') and ($format->{'format'} ne 'multitable' ) and $format->{'term'});
    #print STDERR "ADD_TERM\n";
    # we set 'term' = 0 early such that if we encounter an end of line
    # during close_stack we don't try to do the term once more
    $state->{'table_list_stack'}->[-1]->{'term'} = 0;
    # it is the first paragraph for the term.
    $format->{'paragraph_number'} = 0;

    #dump_stack($text, $stack, $state);
    close_stack($text, $stack, $state, $line_nr, undef, 'term');
    my $term = pop @$stack;
    my $command_formatted;
    chomp ($term->{'text'});
    if (exists($::style_map_ref->{$format->{'command'}}) and 
       !exists($Texi2HTML::Config::special_list_commands{$format->{'format'}}->{$format->{'command'}}) and ($style_type{$format->{'command'}} eq 'style'))
    {
         my $leading_spaces = '';
         my $trailing_spaces = '';
         $term->{'text'}  =~ s/^(\s*)//o;
         $leading_spaces = $1 if (defined($1));
         $term->{'text'}  =~ s/(\s*)$//o;
         $trailing_spaces = $1 if (defined($1));
         $term->{'text'} = do_simple($format->{'command'}, $term->{'text'}, $state, [$term->{'text'}]); 
         $term->{'text'} = $leading_spaces. $term->{'text'} .$trailing_spaces;
    }
    elsif (exists($::things_map_ref->{$format->{'command'}}))
    {
        $command_formatted = do_simple($format->{'command'}, '', $state);
    }
    my $index_label;
    if ($format->{'format'} =~ /^(f|v)/o)
    {
        $index_label = do_index_entry_label($format->{'format'}, $state,$line_nr);
        print STDERR "Bug: no index entry for $text" unless defined($index_label);
    }
    add_prev($text, $stack, &$Texi2HTML::Config::table_item($term->{'text'}, $index_label,$format->{'format'},$format->{'command'}, $command_formatted,$state->{'command_stack'}));
    unless ($end)
    {
        push (@$stack, { 'format' => 'line', 'text' => '' });
        begin_paragraph($stack, $state) if ($state->{'preformatted'});
    }
    return $format;
}

sub add_row($$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    my $format = $state->{'table_list_stack'}->[-1];
    return unless ($format->{'format'} eq 'multitable');
    if ($format->{'cell'} > $format->{'max_columns'})
    {
        close_stack($text, $stack, $state, $line_nr, undef, 'null');
        pop @$stack;
    }
    unless ($format->{'max_columns'})
    { # empty multitable
        pop @$stack; # pop 'row'
        return $format;
    }
    if ($format->{'first'})
    { # first row
        $format->{'first'} = 0;
        #dump_stack($text, $stack, $state);
	#if ($stack->[-1]->{'format'} and ($stack->[-1]->{'format'} eq 'paragraph') and ($stack->[-1]->{'text'} =~ /^\s*$/) and ($format->{'cell'} == 1))
        if ($stack->[-1]->{'format'} and ($stack->[-1]->{'format'} eq 'cell') and ($stack->[-1]->{'text'} =~ /^\s*$/) and ($format->{'cell'} == 1))
        {
            pop @$stack;
            pop @$stack;
	    #pop @$stack;
            return $format;
        }
    }
    add_cell($text, $stack, $state);
    my $row = pop @$stack;    
    add_prev($text, $stack, &$Texi2HTML::Config::row($row->{'text'}, $row->{'item_cmd'}));
    return $format;
}

sub add_cell($$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    my $format = $state->{'table_list_stack'}->[-1];
    return unless ($format->{'format'} eq 'multitable');
    if ($format->{'cell'} <= $format->{'max_columns'})
    {
        close_stack($text, $stack, $state, $line_nr, undef, 'cell');
        my $cell = pop @$stack;
        my $row = top_stack($stack);
        print STDERR "Bug: top_stack of cell not a row\n" if (!defined($row) or !defined($row->{'format'}) or ($row->{'format'} ne 'row'));
        add_prev($text, $stack, &$Texi2HTML::Config::cell($cell->{'text'}, $row->{'item_cmd'}));
        $format->{'cell'}++;
    }
    return $format;
}

sub add_line($$$$;$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    my $end = shift;
    my $format = $state->{'table_list_stack'}->[-1]; 
    return unless ($format_type{$format->{'format'}} eq 'table' and ($format->{'format'} ne 'multitable') and ($format->{'term'} == 0));
    #print STDERR "ADD_LINE\n";
    #dump_stack($text, $stack, $state);
    # as in pre the end of line are kept, we must explicitely abort empty
    # preformatted, close_stack doesn't abort the empty preformatted regions.
    abort_empty_preformatted($stack, $state) if ($format->{'first'});
    close_stack($text, $stack, $state, $line_nr, undef, 'line');
    my $line = pop @$stack;
    $format->{'paragraph_number'} = 0;
    my $first = 0;
    $first = 1 if ($format->{'first'});
    if ($first)
    {
        $format->{'first'} = 0;
        # we must have <dd> or <dt> following <dl> thus we do a 
        # &$Texi2HTML::Config::table_line here too, although it could have
        # been a normal paragraph.
        add_prev($text, $stack, &$Texi2HTML::Config::table_line($line->{'text'})) if ($line->{'text'} =~ /\S/o);
    }
    else
    {
        add_prev($text, $stack, &$Texi2HTML::Config::table_line($line->{'text'}));
    }
    unless($end)
    {
        push (@$stack, { 'format' => 'term', 'text' => '' });
    }
    $format->{'term'} = 1;
    return $format;
}

# finish @enumerate or @itemize @item
sub add_item($$$$;$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    my $line = shift;
    my $end = shift;
    my $format = $state->{'table_list_stack'}->[-1];
    return unless ($format_type{$format->{'format'}} eq 'list');
    #print STDERR "ADD_ITEM: \n";
    # as in pre the end of line are kept, we must explicitely abort empty
    # preformatted, close_stack doesn't do that.
    abort_empty_preformatted($stack, $state) if ($format->{'first'});
    close_stack($text, $stack, $state, $line_nr, undef, 'item');
    $format->{'paragraph_number'} = 0;
    if ($format->{'format'} eq 'enumerate')
    {
        $format->{'number'} = '';
        my $spec = $format->{'spec'};
        $format->{'item_nr'}++;
        if ($spec =~ /^[0-9]$/)
        {
            $format->{'number'} = $spec + $format->{'item_nr'} - 1;
        }
        else
        {
            my $base_letter = ord('a');
            $base_letter = ord('A') if (ucfirst($spec) eq $spec);

            my @letter_ords = decompose(ord($spec) - $base_letter + $format->{'item_nr'} - 1, 26);
            foreach my $ord (@letter_ords)
            {# WARNING we go directly to 'ba' after 'z', and not 'aa'
             #because 'ba' is 1,0 and 'aa' is 0,0.
                $format->{'number'} = chr($base_letter + $ord) . $format->{'number'};
            }
        }
    }
    
    #dump_stack ($text, $stack, $state);
    my $item = pop @$stack;
    # the element following ol or ul must be li. Thus even though there
    # is no @item we put a normal item.

    # don't do an item if it is the first and it is empty
    if (!$format->{'first'} or ($item->{'text'} =~ /\S/o))
    {
        my $formatted_command;
        if (defined($format->{'command'}) and exists($::things_map_ref->{$format->{'command'}}))
        {
            $formatted_command = do_simple($format->{'command'}, '', $state);
        }
	#chomp($item->{'text'});
        add_prev($text, $stack, &$Texi2HTML::Config::list_item($item->{'text'},$format->{'format'},$format->{'command'}, $formatted_command, $format->{'item_nr'}, $format->{'spec'}, $format->{'number'}));
    } 
    if ($format->{'first'})
    {
        $format->{'first'} = 0;
    }

    # Now prepare the new item
    unless($end)
    {
        push (@$stack, { 'format' => 'item', 'text' => '' });
        begin_paragraph($stack, $state) unless (!$state->{'preformatted'} and no_line($line));
    }
    return $format;
}

# format ``simple'' macros, that is macros without arg or style macros
sub do_simple($$$;$$$$)
{
    my $macro = shift;
    my $text = shift;
    my $state = shift;
    my $args = shift;
    my $line_nr = shift;
    my $no_open = shift;
    my $no_close = shift;
    
    my $arg_nr = 0;
    $arg_nr = @$args - 1 if (defined($args));
    
#print STDERR "DO_SIMPLE $macro $arg_nr $args @$args\n" if (defined($args));
    if (defined($::simple_map_ref->{$macro}))
    {
        # \n may in certain circumstances, protect end of lines
        if ($macro eq "\n")
        {
            $state->{'end_of_line_protected'} = 1;
            #print STDERR "PROTECTING END OF LINE\n";
        }
        if ($state->{'keep_texi'})
        {
            return "\@$macro";
        }
        elsif ($state->{'remove_texi'})
        {
#print STDERR "DO_SIMPLE remove_texi $macro\n";
            return  $::simple_map_texi_ref->{$macro};
        }
        elsif ($state->{'preformatted'})
        {
            return $::simple_map_pre_ref->{$macro};
        }
        else
        {
            return $::simple_map_ref->{$macro};
        }
    }
    if (defined($::things_map_ref->{$macro}))
    {
        my $result;
        if ($state->{'keep_texi'})
        {
            $result = "\@$macro" . '{}';
        }
        elsif ($state->{'remove_texi'})
        {
            $result =  $::texi_map_ref->{$macro};
#print STDERR "DO_SIMPLE remove_texi texi_map $macro\n";
        }
        elsif ($state->{'preformatted'})
        {
            $result = $::pre_map_ref->{$macro};
        }
        else 
        {
            $result = $::things_map_ref->{$macro};
        }
        return $result . $text;
    }
    elsif (defined($::style_map_ref->{$macro}))
    {
        if ($state->{'keep_texi'})
        {
            return "\@$macro" . '{' . $text . '}';
        }
        else 
        {
            my $style;
            my $result;
            if ($state->{'remove_texi'})
            {
#print STDERR "REMOVE $macro, $style_map_texi_ref->{$macro}, fun $style_map_texi_ref->{$macro}->{'function'} remove cmd " . \&Texi2HTML::Config::t2h_remove_command . " ascii acc " . \&t2h_default_ascii_accent;
                $style = $::style_map_texi_ref->{$macro};
            }
            elsif ($state->{'preformatted'})
            {
                $style = $::style_map_pre_ref->{$macro};
            }
            else
            {
                $style = $::style_map_ref->{$macro};
            }
            if (defined($style))
            {                           # known style
                $result = &$Texi2HTML::Config::style($style, $macro, $text, $args, $no_close, $no_open, $line_nr, $state, $state->{'command_stack'});
            }
            if (!$no_close)
            { 
                close_arg($macro,$arg_nr, $state);
            }
            return $result;
        }
    }
    elsif ($macro =~ /^special_(\w+)_(\d+)$/o)
    {
        my $style = $1;
        my $count = $2;
        print STDERR "Bug? text in \@$macro not empty.\n" if ($text ne '');  
        if ($state->{'keep_texi'})
        {# text should be empty
            return "\@$macro" . '{' . $text . '}';
        }
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
    my ($done, $result_text, $message) = &$Texi2HTML::Config::unknown_style($macro, $text,$state);
    if ($done)
    {
        echo_warn($message, $line_nr) if (defined($message));
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
            echo_warn ("Unknown command with braces `\@$macro'", $line_nr);
            $result = do_text("\@$macro") . "{";
        }
        $result .= $text;
        $result .= '}' unless ($no_close);
    }
    return $result;
}

sub do_unknown($$$$$$)
{
    my $macro = shift;
    my $line = shift;
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    #print STDERR "do_unknown: $macro ::: $line"; 
    my ($result_line, $result, $result_text, $message) = &$Texi2HTML::Config::unknown($macro, $line,$stack,$state);
    if ($result)
    {
         add_prev ($text, $stack, $result_text) if (defined($result_text));
         echo_warn($message, $line_nr) if (defined($message));
         return $result_line;
    }
    else
    {
         echo_warn ("Unknown command `\@$macro' (left as is)", $line_nr);
         add_prev ($text, $stack, do_text("\@$macro"));
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
    #if (!defined($stack) or (ref($stack) ne "ARRAY"))
    #{
    #    $string = $stack;
    #    $stack = [];
    #}
    
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

sub close_stack_texi_structure($$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;

    return undef unless (@$stack or $state->{'raw'} or $state->{'macro'} or $state->{'macro_name'} or $state->{'ignored'});

    #print STDERR "close_stack_texi_structure\n";
    #dump_stack ($text, $stack, $state);
    my $stack_level = $#$stack + 1;
    my $string = '';
    
    if ($state->{'ignored'})
    {
        $string .= "\@end $state->{'ignored'} ";
        echo_warn ("closing $state->{'ignored'}", $line_nr); 
    }
    if ($state->{'texi'})
    {
        if ($state->{'macro'})
        {
            $string .= "\@end macro ";
            echo_warn ("closing macro", $line_nr); 
        }
        elsif ($state->{'macro_name'})
        {
            $string .= ('}' x $state->{'macro_depth'}) . " ";
            echo_warn ("closing $state->{'macro_name'} ($state->{'macro_depth'} braces missing)", $line_nr); 
        }
        elsif ($state->{'verb'})
        {
            echo_warn ("closing \@verb", $line_nr); 
            $string .= $state->{'verb'} . '}';
        }
        elsif ($state->{'raw'})
        {
            echo_warn ("closing \@$state->{'raw'} raw format", $line_nr);
            $string .= "\@end $state->{'raw'}";
        }
        if ($string ne '')
        {
            #print STDERR "close_stack scan_texi ($string)\n";
            scan_texi ($string, $text, $stack, $state, $line_nr);
            $string = '';
        }
    }
    elsif ($state->{'verb'})
    {
        $string .= $state->{'verb'};
    }

    while ($stack_level--)
    {
        my $stack_text = $stack->[$stack_level]->{'text'};
        $stack_text = '' if (!defined($stack_text));
        if ($stack->[$stack_level]->{'format'})
        {
            my $format = $stack->[$stack_level]->{'format'};
            if ($format eq 'index_item')
            {
                enter_table_index_entry($text, $stack, $state, $line_nr);
                next;
            }
            elsif (!defined($format_type{$format}) or ($format_type{$format} ne 'fake'))
            {
                $stack_text = "\@$format\n" . $stack_text;
            }
        }
        elsif (defined($stack->[$stack_level]->{'style'}))
        {
            if ($state->{'structure'})
            {
                $stack_text = close_structure_command($stack->[$stack_level],
                   $state,1,$line_nr)
            }
            else
            {
                my $style = $stack->[$stack_level]->{'style'};
                if ($style ne '')
                {
                    $stack_text = "\@$style\{" . $stack_text;
                }
                else
                {# this is a lone opened brace. We readd it there.
                    $stack_text = "\{" . $stack_text;
                }
            }
        }
        pop @$stack;
        add_prev($text, $stack, $stack_text);
    }
    $stack = [ ];

    $state->{'close_stack'} = 1;
    if ($string ne '')
    {
        if ($state->{'texi'})
        {
            #print STDERR "scan_texi in close_stack ($string)\n";
            scan_texi($string, $text, $stack, $state, $line_nr);
        }
        elsif ($state->{'structure'})
        {
            #print STDERR "scan_structure in close_stack ($string)\n";
            scan_structure($string, $text, $stack, $state, $line_nr);
        }
    }
    delete $state->{'close_stack'};
}

# close region like @insertcopying, titlepage...
# restore $state->{'after_element'} and delete the structure
sub close_region($)
{
    my $state = shift;
    $state->{'after_element'} = 1;
    delete $state->{'after_element'} unless 
          ($state->{'region_lines'}->{'after_element'});
    $state->{'place'} = $state->{'region_lines'}->{'kept_place'};
    delete $state->{'region_lines'}->{'number'};
    delete $state->{'region_lines'}->{'format'};
    delete $state->{'region_lines'}->{'after_element'};
    delete $state->{'region_lines'}->{'kept_place'};
    delete $state->{'region_lines'};
}

# close the stack, closing macros and formats left open.
# the precise behavior of the function depends on $close_paragraph:
#  undef   -> close everything
#  defined -> remove empty paragraphs, close until the first format or 
#          paragraph. don't close styles, duplicate stack of styles not closed

# if a $format is given the stack is closed according to $close_paragraph but
# if $format is encountered the closing stops

sub close_stack($$$$;$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    my $close_paragraph = shift;
    my $format = shift;
    my $new_stack;
    
    #print STDERR "sub_close_stack\n";
    return $new_stack unless (@$stack);
    
    my $stack_level = $#$stack + 1;
    my $string = '';
    my $verb = '';
    
    if ($state->{'verb'})
    {
        $string .= $state->{'verb'};
        $verb = $state->{'verb'};
    }

    #debugging
    #my $print_format = 'NO FORMAT';
    #$print_format = $format if ($format);
    #my $print_close_paragraph = 'close everything';
    #$print_close_paragraph = 'close paragraph without duplicating' if (defined($close_paragraph));
    #$print_close_paragraph = $close_paragraph if ($close_paragraph);
    #print STDERR "Close_stack: format $print_format, close_paragraph: $print_close_paragraph\n";
    
    while ($stack_level--)
    {
        if ($stack->[$stack_level]->{'format'})
        {
            my $stack_format = $stack->[$stack_level]->{'format'};
            last if (defined($close_paragraph) or (defined($format) and $stack_format eq $format));
            # We silently close paragraphs, preformatted sections and fake formats
            if ($stack_format eq 'paragraph')
            {
                $string .= "\@end_paragraph{}";
            }
            elsif ($stack_format eq 'preformatted')
            {
                $string .= "\@end_preformatted{}";
            }
            else
            {
                if ($fake_format{$stack_format})
                {
                    warn "# Closing a fake format `$stack_format'\n" if ($T2H_VERBOSE);
                }
                elsif ($stack_format ne 'center')
                { # we don't warn, but add an @end center
                    echo_warn ("closing `$stack_format'", $line_nr); 
                    #dump_stack ($text, $stack, $state);
                }
                $string .= "\@end $stack_format ";
            }
        }
        else
        {
            my $style =  $stack->[$stack_level]->{'style'};
            # FIXME images, footnotes, xrefs, anchors with $close_paragraphs?
            # seems that it is not possible, as it is triggered by 
            # close_paragraph which shouldn't be called with keep_texi
            # and when the arguments are expanded, there is a 
            # substitute_line or similar with a new stack.
            if ($close_paragraph)
            { #duplicate the stack
              # the !exists($style_type{$style}) condition catches the unknown 
              # @-commands: by default they are considered as style commands
                if ((exists($style_type{$style}) and ($style_type{$style} eq 'style')) or (!exists($style_type{$style})))
                {
                    push @$new_stack, { 'style' => $style, 'text' => '', 'no_open' => 1, 'arg_nr' => 0 };
                    $string .= '}';
                }
                elsif (($style_type{$style} eq 'simple_style') or ($style_type{$style} eq 'accent'))
                {
                    $string .= '}';
                }
                else
                {
                    print STDERR "$style while closing paragraph\n";
                }
            }
            else
            {
                ########################## debug
                if (!defined($style))
                {
                    print STDERR "Bug: style not defined, on stack\n";
                    dump_stack ($text, $stack, $state); # bug
                }
                ########################## end debug
                $string .= '}';
                echo_warn ("closing \@-command $style", $line_nr) if ($style); 
            }
        }
    }
    $state->{'no_close'} = 1 if ($close_paragraph);
    $state->{'close_stack'} = 1;
    if ($string ne '')
    {
            #print STDERR "scan_line in CLOSE_STACK ($string)\n";
            #dump_stack ($text, $stack, $state);
         scan_line($string, $text, $stack, $state, $line_nr);
    }
    delete $state->{'no_close'};
    delete $state->{'close_stack'};
    $state->{'verb'} = $verb if (($verb ne '') and $close_paragraph);
    # cancel paragraph states and command_stack
    # FIXME this seems to be unusefull, see formatting/center.texi
    unless (defined($close_paragraph) or defined($format))
    {
        $state->{'paragraph_style'} = [ '' ];
        $state->{'command_stack'} = [ '' ]; 
    }
    return $new_stack;
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

sub close_paragraph($$$;$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $line_nr = shift;
    #my $macro = shift;
    #print STDERR "CLOSE_PARAGRAPH\n";
    #dump_stack($text, $stack, $state);
    my $new_stack = close_stack($text, $stack, $state, $line_nr, 1);
    my $top_stack = top_stack($stack);
    if ($top_stack and !defined($top_stack->{'format'}))
    { #debug
         print STDERR "Bug: no format on top stack\n";
         dump_stack($text, $stack, $state);
    }
    if ($top_stack and ($top_stack->{'format'} eq 'paragraph'))
    {
        my $paragraph = pop @$stack;
        add_prev($text, $stack, do_paragraph($paragraph->{'text'}, $state));
        $state->{'paragraph_macros'} = $new_stack;
        return 1;
    }
    elsif ($top_stack and ($top_stack->{'format'} eq 'preformatted'))
    {
        my $paragraph = pop @$stack;
        add_prev($text, $stack, do_preformatted($paragraph->{'text'}, $state));
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
    if (defined($state->{'table_list_stack'}))
    {
        print STDERR "table_list_stack: ";
        foreach my $format (@{$state->{'table_list_stack'}})
        {
            print STDERR "$format->{'format'} ";
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

sub substitute_line($;$)
{
    my $line = shift;
    my $state = shift;
    $state = {} if (!defined($state));
    $state->{'no_paragraph'} = 1;
    # this is usefull when called from &$I
    return simple_format($state, $line) if ($state->{'simple_format'});
    return substitute_text($state, $line);
}

sub substitute_text($@)
{
    my $state = shift;
    my @stack = ();
    my $text = '';
    my $result = '';
    if ($state->{'structure'})
    {
        initialise_state_structure($state);
    }
    elsif ($state->{'texi'})
    {
        initialise_state_texi($state);
    }
    else
    {
        initialise_state($state);
    }
    $state->{'spool'} = [];
    #print STDERR "SUBST_TEXT begin\n";
    push_state($state);
    
    while (@_ or @{$state->{'spool'}})
    {
        my $line;
        if (@{$state->{'spool'}})
        {
             $line = shift @{$state->{'spool'}};
        }
        else
        {
            $line = shift @_;
        }
        next unless (defined($line));
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
            scan_line($line, \$text, \@stack, $state);
        }
        next if (@stack);
        $result .= $text;
        $text = '';
    }
    # FIXME could we have the line number ?
    # close stack in substitute_text
    if ($state->{'texi'} or $state->{'structure'})
    {
         close_stack_texi_structure(\$text, \@stack, $state, undef);
    }
    else
    {
         close_stack(\$text, \@stack, $state, undef);
    }
    #print STDERR "SUBST_TEXT end\n";
    pop_state();
    return $result . $text;
}

# this function does the second pass formatting. It is not obvious that 
# it is usefull as in that pass the collected things 
sub substitute_texi_line($)
{
    my $text = shift;  
    return $text if $text =~ /^\s*$/;
    #print STDERR "substitute_texi_line $text\n";
    my @text = substitute_text({'structure' => 1}, $text);
    my @result = ();
    while (@text)
    {
        push @result,  split (/\n/, shift (@text));
    }
    return '' unless (@result);
    my $result = shift @result;
    return $result . "\n" unless (@result);
    foreach my $line (@result)
    {
        chomp $line;
        $result .= ' ' . $line;
    }
    return $result . "\n";
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
	if (defined($Texi2HTML::Config::WORDS_IN_PAGE) and ($Texi2HTML::Config::SPLIT eq 'node'))
        {
            @cnt = split(/\W*\s+\W*/, $line);
            $cnt += scalar(@cnt);
        }
    }
    return $cnt;
}

sub do_index_entry_label($$$)
{
    my $command = shift;
    my $state = shift;
    my $line_nr = shift;
    return '' if ($state->{'multiple_pass'});
    my $entry = shift @index_labels;
    if (!defined($entry))
    {
        echo_warn ("Not enough index entries !", $line_nr);
        return '';
    }
    if ($command ne $entry->{'command'})
    {
        # happens with bad texinfo with a line like
        # @deffn func aaaa args  @defvr c--ategory d--efvr_name
        echo_warn ("Waiting for index cmd \@$entry->{'command'}, got \@$command", $line_nr);
    }
    
    print STDERR "[(index $command) $entry->{'entry'} $entry->{'label'}]\n"
        if ($T2H_DEBUG & $DEBUG_INDEX);
    return &$Texi2HTML::Config::index_entry_label ($entry->{'label'}, $state->{'preformatted'}, substitute_line($entry->{'entry'}), 
      $index_prefix_to_name{$prefix},
       $command); 
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

# main processing is called here
open_file($docu, $texi_line_number);
#Texi2HTML::LaTeX2HTML::init() if ($Texi2HTML::Config::L2H);
if ($Texi2HTML::Config::L2H)
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
foreach my $handler(@Texi2HTML::Config::command_handler_init)
{
    &$handler;
}

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
         $css_file = locate_init_file ($file);
         unless (defined($css_file))
         {
             warn "css file $file not found\n";
             next;
         }
         unless (open (CSSFILE, "$css_file"))
         {
             warn "Cannot open ${css_file}: $!";
             next;
        }
        $css_file_fh = \*CSSFILE;
    }
    my ($import_lines, $rules_lines);
    ($import_lines, $rules_lines) = process_css_file ($css_file_fh, $css_file);
    push @css_import_lines, @$import_lines;
    push @css_rule_lines, @$rules_lines;
}

$Texi2HTML::THISDOC{'css_import_lines'} = \@css_import_lines;
$Texi2HTML::THISDOC{'css_lines'} = \@css_rule_lines;

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

texinfo_initialization(0);
pass_texi();
dump_texi(\@lines, 'texi', \@lines_numbers) if ($T2H_DEBUG & $DEBUG_TEXI);
if (defined($Texi2HTML::Config::MACRO_EXPAND))
{
    my @texi_lines = (@first_lines, @lines);
    dump_texi(\@texi_lines, '', undef, $Texi2HTML::Config::MACRO_EXPAND);
}

texinfo_initialization(1);

# APA: There's got to be a better way:
if ($Texi2HTML::Config::TEST)
{
    # to generate files similar to reference ones to be able to check for
    # real changes we use these dummy values if -test is given
    $T2H_USER = 'a tester';
    $THISPROG = 'texi2html';
    setlocale( LC_ALL, "C" );
} 
else
{ 
    # the eval prevents this from breaking on system which do not have
    # a proper getpwuid implemented
    eval { ($T2H_USER = (getpwuid ($<))[6]) =~ s/,.*//;}; # Who am i
    # APA: Provide Windows NT workaround until getpwuid gets
    # implemented there.
    $T2H_USER = $ENV{'USERNAME'} unless (defined($T2H_USER));
}
$T2H_USER = &$I('unknown') unless (defined($T2H_USER));
    
pass_structure();
if ($T2H_DEBUG & $DEBUG_TEXI)
{
    dump_texi(\@doc_lines, 'first', \@doc_numbers);
    if (defined($Texi2HTML::Config::MACRO_EXPAND and $Texi2HTML::Config::DUMP_TEXI))
    {
        unshift (@doc_lines, @first_lines);
        push (@doc_lines, "\@bye\n");
        dump_texi(\@doc_lines, '', undef, $Texi2HTML::Config::MACRO_EXPAND . ".first");
    }
}
exit(0) if ($Texi2HTML::Config::DUMP_TEXI or defined($Texi2HTML::Config::MACRO_EXPAND));

foreach my $style (keys(%special_commands))
{
  $special_commands{$style}->{'max'} = $special_commands{$style}->{'count'};
}

rearrange_elements();
do_names();

#Texi2HTML::LaTeX2HTML::latex2html();
foreach my $handler(@Texi2HTML::Config::command_handler_process)
{
    &$handler;
}

if (@{$region_lines{'documentdescription'}} and (!defined($Texi2HTML::Config::DOCUMENT_DESCRIPTION)))
{
    my $documentdescription = remove_texi(@{$region_lines{'documentdescription'}}); 
    my @documentdescription = split (/\n/, $documentdescription);
    $Texi2HTML::Config::DOCUMENT_DESCRIPTION = shift @documentdescription;
    chomp $Texi2HTML::Config::DOCUMENT_DESCRIPTION;
    foreach my $line (@documentdescription)
    {
        chomp $line;
        $Texi2HTML::Config::DOCUMENT_DESCRIPTION .= ' ' . $line;
    }
}
$sec_num = 0;
$head_num = 0;
# do copyright notice inserted in comment at the beginning of the files
if (@{$region_lines{'copying'}})
{
    $copying_comment = &$Texi2HTML::Config::copying_comment($region_lines{'copying'});
}
&$Texi2HTML::Config::toc_body(\@elements_list);
$sec_num = 0;
$head_num = 0;


&$Texi2HTML::Config::css_lines(\@css_import_lines, \@css_rule_lines);

pass_text();
print STDERR "BUG: " . scalar(@index_labels) . " index entries pending\n" 
   if (scalar(@index_labels));
foreach my $special (keys(%special_commands))
{
    my $count = $special_commands{$special}->{'count'};
    if (($count != 0) and $T2H_VERBOSE)
    {
         echo_warn ("$count special \@$special were not processed.\n");
    }
}
if ($Texi2HTML::Config::IDX_SUMMARY)
{
    foreach my $entry (keys(%index_names))
    {
         do_index_summary_file($entry) unless ($empty_indices{$entry});
    }
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
