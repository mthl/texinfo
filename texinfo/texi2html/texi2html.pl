#@BANGPERL@
'di ';
'ig 00 ';
#+##############################################################################
#
# texi2html: Program to transform Texinfo documents to HTML
#
#    Copyright (C) 1999, 2000  Free Software Foundation, Inc.
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
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#-##############################################################################

# This requires perl version 5 or higher
require 5.0;

# Perl pragma to restrict unsafe constructs
use strict;
# for POSIX::setlocale
require 5.004;
# used in case of tests, to revert to "C" locale.
use POSIX qw(setlocale LC_ALL LC_CTYPE);
#
# According to
# larry.jones@sdrc.com (Larry Jones)
# this pragma is not present in perl5.004_02:
#
# Perl pragma to control optional warnings
# use warnings;

# Declarations. Empty lines separate the different classes of variables:

# latex2html variables
# customization options variables
# customization variables
# customization variables which may be guessed in the script
# customizable subroutines references
# global variables set in the script, and used in the subroutines
# hash which entries might be redefined by the user
# variables which might be redefined by the user but aren't likely to
# be  
# variable which shouldn't be global FIXME
use vars qw(
            $ADDRESS
            $ANTI_ALIAS
            $ANTI_ALIAS_TEXT
            $ASCII_MODE
            $AUTO_LINK
            $AUTO_PREFIX
            $CHILDLINE
            $DEBUG
            $DESTDIR
            $ERROR
            $EXTERNAL_FILE
            $EXTERNAL_IMAGES
            $EXTERNAL_UP_LINK
            $EXTERNAL_UP_TITLE
            $FIGURE_SCALE_FACTOR
            $HTML_VERSION
            $IMAGES_ONLY
            $INFO
            $LINE_WIDTH
            $LOCAL_ICONS
            $LONG_TITLES
            $MATH_SCALE_FACTOR
            $MAX_LINK_DEPTH
            $MAX_SPLIT_DEPTH
            $NETSCAPE_HTML
            $NOLATEX
            $NO_FOOTNODE
            $NO_IMAGES
            $NO_NAVIGATION
            $NO_SIMPLE_MATH
            $NO_SUBDIR
            $PAPERSIZE
            $PREFIX
            $PS_IMAGES
            $REUSE
            $SCALABLE_FONTS
            $SHORTEXTN
            $SHORT_INDEX
            $SHOW_SECTION_NUMBERS
            $SPLIT
            $TEXDEFS
            $TITLE
            $TITLES_LANGUAGE
            $TMP
            $VERBOSE
            $WORDS_IN_NAVIGATION_PANEL_TITLES
            $WORDS_IN_PAGE

            $T2H_DEBUG
            $T2H_PREFIX
            $T2H_VERBOSE
            $T2H_SUBDIR
            $T2H_IDX_SUMMARY
            $T2H_SPLIT
            $T2H_SHORT_REF
            @T2H_EXPAND
            $T2H_EXPAND
            $T2H_TOC
            $T2H_TOP
            $T2H_DOCTYPE 
            $T2H_FRAMESET_DOCTYPE 
            $T2H_CHECK 
            $T2H_TEST 
            $T2H_DUMP_TEXI
            $T2H_USE_GLOSSARY 
            $T2H_INVISIBLE_MARK 
            $T2H_USE_ISO 
            $T2H_TOP_FILE 
            $T2H_TOC_FILE
            $T2H_FRAMES
            $T2H_SHOW_MENU
            $T2H_NUMBER_SECTIONS
            $T2H_USE_NODES
            $T2H_NODE_FILES
            $T2H_NODE_NAME_IN_MENU
            $T2H_AVOID_MENU_REDUNDANCY
            $T2H_SECTION_NAVIGATION
            $T2H_SHORTEXTN 
            $T2H_OUT 
            $T2H_DEF_TABLE 
            $T2H_LANG 
            $T2H_SEPARATED_FOOTNOTES
            $T2H_L2H 
            $T2H_L2H_L2H 
            $T2H_L2H_SKIP 
            $T2H_L2H_TMP 
            $T2H_L2H_CLEAN 
            $T2H_EXTERNAL_DIR
            @T2H_INCLUDE_DIRS 

            $T2H_MENU_PRE_STYLE
            $T2H_CENTER_IMAGE
            $T2H_EXAMPLE_INDENT_CELL
            $T2H_SMALL_EXAMPLE_INDENT_CELL
            $T2H_SMALL_FONT_SIZE
            $T2H_SMALL_RULE
            $T2H_DEFAULT_RULE
            $T2H_MIDDLE_RULE
            $T2H_BIG_RULE
            $T2H_TOP_HEADING
            $T2H_INDEX_CHAPTER
            $T2H_SPLIT_INDEX
            $T2H_HREF_DIR_INSTEAD_FILE
            $T2H_AFTER_BODY_OPEN
            $T2H_PRE_BODY_CLOSE
            $T2H_EXTRA_HEAD
            $T2H_VERTICAL_HEAD_NAVIGATION
            $T2H_WORDS_IN_PAGE
            $T2H_ICONS
            $T2H_UNNUMBERED_SYMBOL_IN_MENU
            $T2H_MENU_SYMBOL
            $T2H_TOC_LIST_STYLE
            $T2H_TOP_NODE_FILE
            $T2H_NODE_FILE_EXTENSION
            %T2H_ACTIVE_ICONS
            %T2H_NAVIGATION_TEXT
            %T2H_PASSIVE_ICONS
            %T2H_BUTTONS_GOTO
            %T2H_BUTTONS_EXAMPLE
            @T2H_CHAPTER_BUTTONS
            @T2H_MISC_BUTTONS
            @T2H_SECTION_BUTTONS
            @T2H_SECTION_FOOTER_BUTTONS

            $T2H_ADDRESS
            $T2H_BODYTEXT

            $T2H_print_section
            $T2H_print_Top_header
            $T2H_print_Top_footer
            $T2H_print_Top
            $T2H_print_Toc
            $T2H_print_Overview
            $T2H_print_Footnotes
            $T2H_print_About
            $T2H_print_misc_header
            $T2H_print_misc_footer
            $T2H_print_misc
            $T2H_print_section_footer
            $T2H_print_chapter_header
            $T2H_print_chapter_footer
            $T2H_print_page_head
            $T2H_print_page_foot
            $T2H_print_head_navigation
            $T2H_print_foot_navigation
            $T2H_button_icon_img
            $T2H_print_navigation
            $T2H_about_body
            $T2H_print_frame
            $T2H_print_toc_frame
            $T2H_toc_body
            $T2H_print_redirection_page
            $t2h_set_body_text
            $t2h_protect_html
            $t2h_anchor
            $t2h_def_item
            $t2h_def
            $t2h_menu
            $t2h_menu_entry
            $t2h_menu_description
            $t2h_menu_comment
            $t2h_simple_menu_entry
            $t2h_ref_beginning
            $t2h_info_ref
            $t2h_book_ref
            $t2h_external_ref
            $t2h_internal_ref
            $t2h_table_item
            $t2h_table_line
            $t2h_row
            $t2h_cell
            $t2h_list_item
            $t2h_comment
            $t2h_def_line
            $t2h_raw
            $t2h_heading
            $t2h_paragraph
            $t2h_preformatted
            $t2h_table
            $t2h_foot_line_and_ref
            $t2h_foot_section
            $t2h_address
            $t2h_image
            $t2h_index_entry_label
            $t2h_index_entry
            $t2h_index_letter
            $t2h_index
            $t2h_index_summary
            $t2h_summary_letter
            $T2H_PRE_ABOUT
            $T2H_AFTER_ABOUT

            $T2H_WORDS
            $T2H_OVERVIEW
            $T2H_THIS_SECTION
            $T2H_THIS_HEADER
            %T2H_HREF
            %T2H_NAME
            %T2H_NODE
            %T2H_NO_TEXI
            %T2H_THISDOC
            @T2H_TOC_LINES
            @T2H_STOC_LINES

            %value
            %user_sub

            $complex_format_map
            $index_properties
            %accent_map
            %def_map
            %format_map
            %predefined_index
            %simple_map
            %simple_map_texi
            %simple_map_pre
            %style_map
            %style_map_pre
            %paragraph_style
            %things_map
            %pre_map
            %texi_map
            %to_skip
            %to_skip_texi
            %valid_index
            %sec2level

            %l2h_img
           );

#++##############################################################################
#
# NOTE FOR DEBUGGING THIS SCRIPT:
# You can run 'perl texi2html.pl' directly, provided you have
# the environment variable T2H_HOME set to the directory containing
# the texi2html.init file
#
#--##############################################################################

# CVS version:
# $Id: texi2html.pl,v 1.47 2003-05-20 16:39:58 pertusus Exp $

# Homepage:
my $T2H_HOMEPAGE = "http://texi2html.cvshome.org/";

# Authors (appears in comments):
my $T2H_AUTHORS = <<EOT;
Written by: Lionel Cons <Lionel.Cons\@cern.ch> (original author)
            Karl Berry  <karl\@freefriends.org>
            Olaf Bachmann <obachman\@mathematik.uni-kl.de>
            and many others.
Maintained by: Many creative people <dev\@texi2html.cvshome.org>
Send bugs and suggestions to <users\@texi2html.cvshome.org>
EOT

# Version: set in configure.in
my $THISVERSION = '@T2H_VERSION@';
my $THISPROG = "texi2html $THISVERSION"; # program name and version

my $T2H_TODAY; # date set by pretty_date

# The man page for this program is included at the end of this file and can be
# viewed using the command 'nroff -man texi2html'.

#+++############################################################################
#                                                                              #
# Constants                                                                    #
#                                                                              #
#---############################################################################

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

my $FILERE = '[\/\w.+-]+';         # RE for a file name
my $VARRE = '[^\s\{\}]+';          # RE for a variable name
my $NODERE = '[^:]+';             # RE for node names

my $MAX_LEVEL = 4;
my $MIN_LEVEL = 1;

#+++############################################################################
#                                                                              #
# Initialization                                                               #
# Pasted content of File $(srcdir)/texi2html.init: Default initializations     #
#                                                                              #
#---############################################################################

# leave this within comments, and keep the require statement
# This way, you can directly run texi2html.pl, if $ENV{T2H_HOME}/texi2html.init
# exists.

# @INIT@

require "$ENV{T2H_HOME}/texi2html.init"
    if ($0 =~ /\.pl$/ &&
        -e "$ENV{T2H_HOME}/texi2html.init" && -r "$ENV{T2H_HOME}/texi2html.init");
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

#+++############################################################################
#                                                                              #
# Initialization                                                               #
# Pasted content of File $(srcdir)/T2h_i18n.pm: Internationalisation           #
#                                                                              #
#---############################################################################

# leave this within comments, and keep the require statement
# This way, you can directly run texi2html.pl, if $ENV{T2H_HOME}/texi2html.init
# exists.

# @T2H_I18N@
require "$ENV{T2H_HOME}/T2h_i18n.pm"
    if ($0 =~ /\.pl$/ &&
        -e "$ENV{T2H_HOME}/T2h_i18n.pm" && -r "$ENV{T2H_HOME}/T2h_i18n.pm");

package main;

#
# pre-defined indices
#
$index_properties =
{
 'c' => { name => 'cp'},
 'f' => { name => 'fn', code => 1},
 'v' => { name => 'vr', code => 1},
 'k' => { name => 'ky', code => 1},
 'p' => { name => 'pg', code => 1},
 't' => { name => 'tp', code => 1}
};


%predefined_index = (
                     'cp', 'c',
                     'fn', 'f',
                     'vr', 'v',
                     'ky', 'k',
                     'pg', 'p',
                     'tp', 't',
	            );

#
# valid indices
#
%valid_index = (
                'c', 1,
                'f', 1,
                'v', 1,
                'k', 1,
                'p', 1,
                't', 1,
               );

#
# texinfo section names to level
#
%sec2level = (
	      'top', 0,
	      'chapter', 1,
	      'unnumbered', 1,
	      'majorheading', 1,
	      'chapheading', 1,
	      'appendix', 1,
	      'section', 2,
	      'unnumberedsec', 2,
	      'heading', 2,
	      'appendixsec', 2,
	      'appendixsection', 2,
	      'subsection', 3,
	      'unnumberedsubsec', 3,
	      'subheading', 3,
	      'appendixsubsec', 3,
	      'subsubsection', 4,
	      'unnumberedsubsubsec', 4,
	      'subsubheading', 4,
	      'appendixsubsubsec', 4,
             );

#
# This map is used when texi elements are removed and replaced 
# by simple text
#
%simple_map_texi = (
           "*", "",  
           " ", " ",
           "\t", " ",
           "-", "-",  # soft hyphen
           "\n", "\n",
           "|", "",
        # spacing commands
           ":", "",
           "!", "!",
           "?", "?",
           ".", ".",
           "-", "",
           '@', '@',
           '}', '}',
           '{', '{',
          );

# text replacing macros when texi commands are removed and plain text is 
# produced 
%texi_map = (
               'TeX', 'TeX',
               'bullet', '*',
               'copyright', 'C',
               'dots', '...',
               'enddots', '....',
               'equiv', '==',
               'error', 'error-->',
               'expansion', '==>',
               'minus', '-',
               'point', '-!-',
	       'print', '-|',
               'result', '=>',
               'aa', 'aa',
               'AA', 'AA',
               'ae', 'ae',
               'oe', 'oe',
               'AE', 'AE',
               'OE', 'OE',
               'o',  'o',
               'O',  'O',
               'ss', 'ss',
               'l', 'l',
               'L', 'L',
               'exclamdown', '! upside-down',
	       #'exclamdown', '&iexcl;',
               'questiondown', '? upside-down',
	       #'questiondown', '&iquest;',
               'pounds', 'pound sterling'
	       #'pounds', '&pound;'
              );


# a hash associating a format @thing / @end thing with the type of the format
# 'complex' 'simple' 'deff' 'list' 'menu' 'paragraph_style'
my %format_type = (); 

foreach my $simple_format (keys(%format_map))
{
   $format_type{$simple_format} = 'simple';
}
foreach my $paragraph_style (keys(%paragraph_style))
{
   $format_type{$paragraph_style} = 'paragraph_style';
}
foreach my $complex_format (keys(%$complex_format_map))
{
   $format_type{$complex_format} = 'complex';
}
foreach my $table (('table', 'ftable', 'vtable', 'multitable'))
{
   $format_type{$table} = 'table';
}
foreach my $def_format (keys(%def_map))
{
   $format_type{$def_format} = 'deff';
}
$format_type{'itemize'} = 'list';
$format_type{'enumerate'} = 'list';

$format_type{'menu'} = 'menu';

$format_type{'noformat'} = '';

# fake formats are formats used internally within other formats
my %fake_format = (
     'line' => 'table',
     'term' => 'table',
     'item' => 'list',
     'row' => 'multitable',
     'cell' => 'multitable',
     'deff_item' => 'deff',
     'menu_comment' => 'menu',
     'menu_description' => 'menu',
     'menu_preformatted' => 'menu',
  );

foreach my $key (keys(%fake_format))
{
    $format_type{$key} = 'fake';
}
 
# raw formats which are expanded especially
my @raw_regions = ('html', 'verbatim', 'tex');

# special raw formats which are expanded between first and second pass
# and are replaced by specific commands. Currently used for tex. It takes
# precedence over raw_regions.
my @special_regions = ();

my %text_macros = (
     'iftex' => 0, 
     'ignore' => 0, 
     'menu' => 0, 
     'ifplaintext' => 0, 
     'ifinfo' => 1,
     'ifhtml' => 1, 
     'html' => 'raw', 
     'tex' => 0, 
     'titlepage' => 1, 
     'ifnothtml' => 0, 
     'ifnottex' => 1, 
     'ifnotplaintext' => 1, 
     'ifnotinfo' => 1, 
     'verbatim' => 'raw', 
     'ifclear' => 'value', 
     'ifset' => 'value' 
     );
    
# those macros aren't considered as beginning a paragraph
my %no_line_macros = (
    'setfilename' => 1,
    'settitle' => 1,
    'macro' => 1,
    'unmacro' => 1,
    'rmacro' => 1,
    'set' => 1,
    'clear' => 1,
    'syncodeindex' => 1,
    'synindex' => 1,
    'defindex' => 1,
    'defcodeindex' => 1,
    'author' => 1,
    'documentlanguage' => 1,
    'title' => 1,
    'subtitle' => 1,
    'shorttitle' => 1,
    'include' => 1,
    'copying' => 1,
    'end copying' => 1,
);

foreach my $key (keys(%to_skip))
{
    $no_line_macros{$key} = 1;
}

foreach my $key (keys(%text_macros))
{
    unless ($text_macros{$key} eq 'raw')
    {
        $no_line_macros{$key} = 1;
        $no_line_macros{"end $key"} = 1;
    }
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

my $init_file;
#
# called on -init-file
sub LoadInitFile
{
    # First argument is option
    shift;
    # second argument is value of options
    $init_file = shift;
    if (-f $init_file)
    {
        print STDERR "# reading initialization file from $init_file\n"
            if ($T2H_VERBOSE);
        require($init_file);
    }
    else
    {
        print "$ERROR Error: can't read init file $init_file\n";
        $init_file = '';
    }
}

#
# called on -lang
sub SetDocumentLanguage
{
    my $lang = shift;
    $T2H_WORDS = T2h_i18n::set_language($lang);
    if (defined($T2H_WORDS))
    {
        print STDERR "# using '$lang' as document language\n" if ($T2H_VERBOSE);
        $T2H_LANG = $lang;
    }
    else
    {
        warn "$ERROR Language specs for '$lang' do not exists. Reverting to '$T2H_LANG'\n";
    }
}

# T2H_OPTIONS is a hash whose keys are the (long) names of valid
# command-line options and whose values are a hash with the following keys:
# type    ==> one of !|=i|:i|=s|:s (see GetOpt::Long for more info)
# linkage ==> ref to scalar, array, or subroutine (see GetOpt::Long for more info)
# verbose ==> short description of option (displayed by -h)
# noHelp  ==> if 1 -> for "not so important options": only print description on -h 1
#                2 -> for obsolete options: only print description on -h 2
my $T2H_OPTIONS;
$T2H_OPTIONS -> {debug} =
{
 type => '=i',
 linkage => \$T2H_DEBUG,
 verbose => 'output HTML with debuging information',
};

$T2H_OPTIONS -> {doctype} =
{
 type => '=s',
 linkage => \$T2H_DOCTYPE,
 verbose => 'document type which is output in header of HTML files',
 noHelp => 1
};

$T2H_OPTIONS -> {frameset_doctype} =
{
 type => '=s',
 linkage => \$T2H_FRAMESET_DOCTYPE,
 verbose => 'document type for HTML frameset documents',
 noHelp => 1
};

$T2H_OPTIONS -> {test} =
{
 type => '!',
 linkage => \$T2H_TEST,
 verbose => 'use predefined information to avoid differences with reference files',
 noHelp => 1
};

$T2H_OPTIONS -> {dump_texi} =
{
 type => '!',
 linkage => \$T2H_DUMP_TEXI,
 verbose => 'dump the output of first pass into a file with extension passfirst and exit',
 noHelp => 1
};

$T2H_OPTIONS -> {expand} =
{
 type => '=s',
 linkage => \@T2H_EXPAND,
 verbose => 'Expand info|tex|none section of texinfo source',
};

$T2H_OPTIONS -> {glossary} =
{
 type => '!',
 linkage => \$T2H_USE_GLOSSARY,
 verbose => "if set, uses section named `Footnotes' for glossary",
 noHelp  => 1,
};


$T2H_OPTIONS -> {invisible} =
{
 type => '=s',
 linkage => \$T2H_INVISIBLE_MARK,
 verbose => 'use text in invisble anchot',
 noHelp  => 1,
};

$T2H_OPTIONS -> {iso} =
{
 type => 'iso',
 linkage => \$T2H_USE_ISO,
 verbose => 'if set, ISO8859 characters are used for special symbols (like copyright, etc)',
 noHelp => 1,
};

$T2H_OPTIONS -> {I} =
{
 type => '=s',
 linkage => \@T2H_INCLUDE_DIRS,
 verbose => 'append $s to the @include search path',
};

$T2H_OPTIONS -> {top_file} =
{
 type => '=s',
 linkage => \$T2H_TOP_FILE,
 verbose => 'use $s as top file, instead of <docname>.html',
};


$T2H_OPTIONS -> {toc_file} =
{
 type => '=s',
 linkage => \$T2H_TOC_FILE,
 verbose => 'use $s as ToC file, instead of <docname>_toc.html',
};

$T2H_OPTIONS -> {frames} =
{
 type => '!',
 linkage => \$T2H_FRAMES,
 verbose => 'output files which use HTML 4.0 frames (experimental)',
 noHelp => 1,
};

$T2H_OPTIONS -> {menu} =
{
 type => '!',
 linkage => \$T2H_SHOW_MENU,
 verbose => 'ouput Texinfo menus',
};

$T2H_OPTIONS -> {number} =
{
 type => '!',
 linkage => \$T2H_NUMBER_SECTIONS,
 verbose => 'use numbered sections'
};

$T2H_OPTIONS -> {'use-nodes'} =
{
 type => '!',
 linkage => \$T2H_USE_NODES,
 verbose => 'use nodes for sectionning'
};

$T2H_OPTIONS -> {'node-files'} =
{
 type => '!',
 linkage => \$T2H_NODE_FILES,
 verbose => 'produce one file per node for cross references'
};

$T2H_OPTIONS -> {'separated-footnotes'} =
{
 type => '!',
 linkage => \$T2H_SEPARATED_FOOTNOTES,
 verbose => 'footnotes on a separated page'
};

$T2H_OPTIONS -> {split} =
{
 type => '=s',
 linkage => \$T2H_SPLIT,
 verbose => 'split document on section|chapter else no splitting',
};

$T2H_OPTIONS -> {sec_nav} =
{
 type => '!',
 linkage => \$T2H_SECTION_NAVIGATION,
 verbose => 'output navigation panels for each section',
};

$T2H_OPTIONS -> {subdir} =
{
 type => '=s',
 linkage => \$T2H_SUBDIR,
 verbose => 'put HTML files in directory $s, instead of $cwd',
};

$T2H_OPTIONS -> {short_ext} =
{
 type => '!',
 linkage => \$T2H_SHORTEXTN,
 verbose => 'use "htm" extension for output HTML files',
};

$T2H_OPTIONS -> {prefix} =
{
 type => '=s',
 linkage => \$T2H_PREFIX,
 verbose => 'use as prefix for output files, instead of <docname>',
};

$T2H_OPTIONS -> {out_file} =
{
 type => '=s',
 linkage => sub {$T2H_OUT = $_[1]; $T2H_SPLIT = '';},
 verbose => 'if set, all HTML output goes into file $s',
};

$T2H_OPTIONS -> {short_ref} =
{
 type => '!',
 linkage => \$T2H_SHORT_REF,
 verbose => 'if set, references are without section numbers',
};

$T2H_OPTIONS -> {idx_sum} =
{
 type => '!',
 linkage => \$T2H_IDX_SUMMARY,
 verbose => 'if set, also output index summary',
 noHelp  => 1,
};

$T2H_OPTIONS -> {def_table} =
{
 type => '!',
 linkage => \$T2H_DEF_TABLE,
 verbose => 'if set, \@def.. are converted using tables.',
 noHelp  => 1,
};

$T2H_OPTIONS -> {Verbose} =
{
 type => '!',
 linkage => \$T2H_VERBOSE,
 verbose => 'print progress info to stdout',
};

$T2H_OPTIONS -> {lang} =
{
 type => '=s',
 linkage => sub {SetDocumentLanguage($_[1])},
 verbose => 'use $s as document language (ISO 639 encoding)',
};

$T2H_OPTIONS -> {'html-xref-prefix'} =
{
 type => '=s',
 linkage => \$T2H_EXTERNAL_DIR,
 verbose => '$s is the base dir for external manual references',
};

$T2H_OPTIONS -> {l2h} =
{
 type => '!',
 linkage => \$T2H_L2H,
 verbose => 'if set, uses latex2html for @math and @tex',
};

$T2H_OPTIONS -> {l2h_l2h} =
{
 type => '=s',
 linkage => \$T2H_L2H_L2H,
 verbose => 'program to use for latex2html translation',
 noHelp => 1,
};

$T2H_OPTIONS -> {l2h_skip} =
{
 type => '!',
 linkage => \$T2H_L2H_SKIP,
 verbose => 'if set, tries to reuse previously latex2html output',
 noHelp => 1,
};

$T2H_OPTIONS -> {l2h_tmp} =
{
 type => '=s',
 linkage => \$T2H_L2H_TMP,
 verbose => 'if set, uses $s as temporary latex2html directory',
 noHelp => 1,
};

$T2H_OPTIONS -> {l2h_clean} =
{
 type => '!',
 linkage => \$T2H_L2H_CLEAN,
 verbose => 'if set, do not keep intermediate latex2html files for later reuse',
 noHelp => 1,
};

$T2H_OPTIONS -> {D} =
{
 type => '=s',
 linkage => sub {$value{$_[1]} = 1;},
 verbose => 'equivalent to Texinfo "@set $s 1"',
 noHelp => 1,
};

$T2H_OPTIONS -> {init_file} =
{
 type => '=s',
 linkage => \&LoadInitFile,
 verbose => 'load init file $s'
};
##
## obsolete cmd line options
##
my $T2H_OBSOLETE_OPTIONS;
$T2H_OBSOLETE_OPTIONS -> {'no-section_navigation'} =
{
 type => '!',
 linkage => sub {$T2H_SECTION_NAVIGATION = 0;},
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
 linkage => sub {push @T2H_EXPAND, 'info';},
 verbose => 'obsolete, use "-expand info" instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {expandtex} =
{
 type => '!',
 linkage => sub {push @T2H_EXPAND, 'tex';},
 verbose => 'obsolete, use "-expand tex" instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {monolithic} =
{
 type => '!',
 linkage => sub {$T2H_SPLIT = '';},
 verbose => 'obsolete, use "-split no" instead',
 noHelp => 2
};
$T2H_OBSOLETE_OPTIONS -> {split_node} =
{
 type => '!',
 linkage => sub{$T2H_SPLIT = 'section';},
 verbose => 'obsolete, use "-split section" instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {split_chapter} =
{
 type => '!',
 linkage => sub{$T2H_SPLIT = 'chapter';},
 verbose => 'obsolete, use "-split chapter" instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {no_verbose} =
{
 type => '!',
 linkage => sub {$T2H_VERBOSE = 0;},
 verbose => 'obsolete, use -noverbose instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {output_file} =
{
 type => '=s',
 linkage => sub {$T2H_OUT = $_[1]; $T2H_SPLIT = '';},
 verbose => 'obsolete, use -out_file instead',
 noHelp => 2
};

$T2H_OBSOLETE_OPTIONS -> {section_navigation} =
{
 type => '!',
 linkage => \$T2H_SECTION_NAVIGATION,
 verbose => 'obsolete, use -sec_nav instead',
 noHelp => 2,
};

$T2H_OBSOLETE_OPTIONS -> {verbose} =
{
 type => '!',
 linkage => \$T2H_VERBOSE,
 verbose => 'obsolete, use -Verbose instead',
 noHelp => 2
};

# read initialzation from $sysconfdir/texi2htmlrc or $HOME/.texi2htmlrc
my $home = $ENV{HOME};
defined($home) or $home = '';
foreach my $i ('@sysconfdir@/texi2htmlrc', "$home/.texi2htmlrc")
{
    if (-f $i)
    {
	print STDERR "# reading initialization file from $i\n"
	    if ($T2H_VERBOSE);
	require($i);
    }
}

%value = ();                       # hold texinfo variables, see also -D

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
Try 'texi2html -help' for usage instructions.
EOT

my $options = new Getopt::MySimple;
# some older version of GetOpt::Long don't have
# Getopt::Long::Configure("pass_through")
eval {Getopt::Long::Configure("pass_through");};
my $Configure_failed = $@ && <<EOT;
**WARNING: Parsing of obsolete command-line options could have failed.
           Consider to use only documented command-line options (run
           'texi2html -help 2' for a complete list) or upgrade to perl
           version 5.005 or higher.
EOT
# FIXME getOptions is called 2 times, and thus adds 2 times the default 
# help and version 
if (! $options->getOptions($T2H_OPTIONS, $T2H_USAGE_TEXT, "$THISVERSION\n"))
{
    print $Configure_failed if $Configure_failed;
    die $T2H_FAILURE_TEXT;
}
if (@ARGV > 1)
{
    eval {Getopt::Long::Configure("no_pass_through");};
    if (! $options->getOptions($T2H_OBSOLETE_OPTIONS, $T2H_USAGE_TEXT, "$THISVERSION\n"))
    {
        print $Configure_failed if $Configure_failed;
        die $T2H_FAILURE_TEXT;
    }
}

#+++############################################################################
#                                                                              #
# evaluation of cmd line options
#                                                                              #
#---############################################################################

# retro compatibility for $T2H_EXPAND
push (@T2H_EXPAND, $T2H_EXPAND) if ($T2H_EXPAND);

$text_macros{'menu'} = 1 if ($T2H_SHOW_MENU);

push @special_regions, 'tex' if ($T2H_L2H);

foreach my $expanded (@T2H_EXPAND)
{
    $text_macros{"if$expanded"} = 1;
    if (grep {$_ eq $expanded} @special_regions)
    {
         $text_macros{$expanded} = 'special'; 
    }
    elsif (grep {$_ eq $expanded} @raw_regions)
    {
         $text_macros{$expanded} = 'raw'; 
    }
    else
    {
         $text_macros{$expanded} = 1; 
    }
}

# This is kept in that file although it is html formatting as it seems to 
# be rather obsolete
$T2H_INVISIBLE_MARK = '<img src="invisible.xbm" alt="">' if $T2H_INVISIBLE_MARK eq 'xbm';

$T2H_DEBUG |= $DEBUG_TEXI if ($T2H_DUMP_TEXI);

#
# file name buisness
#

my $docu_dir;            # directory of the document
my $docu_name;           # basename of the document
my $docu_rdir;           # directory for the output
my $docu_ext = "html";   # extension
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
unshift(@T2H_INCLUDE_DIRS, $docu_dir);
$docu_name =~ s/\.te?x(i|info)?$//;
$docu_name = $T2H_PREFIX if ($T2H_PREFIX);

# subdir
if ($T2H_SUBDIR && ! $T2H_OUT)
{
    $T2H_SUBDIR =~ s|/*$||;
    unless (-d "$T2H_SUBDIR" && -w "$T2H_SUBDIR")
    {
        if ( mkdir($T2H_SUBDIR, oct(755)))
        {
            print STDERR "# created directory $T2H_SUBDIR\n" if ($T2H_VERBOSE);
        }
        else
        {
            warn "$ERROR can't create directory $T2H_SUBDIR. Put results into current directory\n";
            $T2H_SUBDIR = '';
        }
    }
}

if ($T2H_SUBDIR && ! $T2H_OUT)
{
    $docu_rdir = "$T2H_SUBDIR/";
    print STDERR "# putting result files into directory $docu_rdir\n" if ($T2H_VERBOSE);
}
else
{
    if ($T2H_OUT && $T2H_OUT =~ m|(.*)/|)
    {
        $docu_rdir = "$1/";
        print STDERR "# putting result files into directory $docu_rdir\n" if ($T2H_VERBOSE);
    }
    else
    {
        print STDERR "# putting result files into current directory \n" if ($T2H_VERBOSE);
        $docu_rdir = '';
    }
}

# extension
if ($T2H_SHORTEXTN)
{
    $docu_ext = "htm";
}
if ($T2H_TOP_FILE =~ s/\..*$//)
{
    $T2H_TOP_FILE .= ".$docu_ext";
}

# result files
if (! $T2H_OUT && $T2H_SPLIT =~ /section/i)
{
    $T2H_SPLIT = 'section';
}
elsif (! $T2H_OUT && $T2H_SPLIT =~ /node/i)
{
    $T2H_SPLIT = 'node';
}
elsif (! $T2H_OUT && $T2H_SPLIT =~ /chapter/i)
{
    $T2H_SPLIT = 'chapter';
}
else
{
    $T2H_SPLIT = '';
}

$docu_doc = "$docu_name.$docu_ext"; # document's contents
if ($T2H_SPLIT)
{
    # FIXME if T2H_NODE_FILES is true and a node is called ${docu_name}_toc
    # ${docu_name}_ovr... there is trouble. This is fixable, but is it worth
    # fixing it ?
    $docu_toc   = $T2H_TOC_FILE || "${docu_name}_toc.$docu_ext"; 
    $docu_stoc  = "${docu_name}_ovr.$docu_ext"; 
    $docu_foot  = "${docu_name}_fot.$docu_ext";
    $docu_about = "${docu_name}_abt.$docu_ext";
    $docu_top   = $T2H_TOP_FILE || $docu_doc;
}
else
{
    if ($T2H_OUT)
    {
        $docu_doc = $T2H_OUT;
        $docu_doc =~ s|.*/||;
    }
    $docu_toc = $docu_foot = $docu_stoc = $docu_about = $docu_top = $docu_doc;
}

my $docu_doc_file = "$docu_rdir$docu_doc"; # unused
my $docu_toc_file  = "$docu_rdir$docu_toc";
my $docu_stoc_file = "$docu_rdir$docu_stoc";
my $docu_foot_file = "$docu_rdir$docu_foot";
my $docu_about_file = "$docu_rdir$docu_about";
my $docu_top_file  = "$docu_rdir$docu_top";

my $docu_frame_file =     "$docu_rdir${docu_name}_frame.$docu_ext";
my $docu_toc_frame_file = "$docu_rdir${docu_name}_toc_frame.$docu_ext";

#
# variables
#
$value{'html'} = 1;             # predefine html (the output format)
$value{'texi2html'} = $THISVERSION; # predefine texi2html (the translator)
# _foo: internal to track @foo
foreach my $key ('_author', '_title', '_subtitle',
	 '_settitle', '_setfilename', '_shorttitle')
{
    $value{$key} = '';            # prevent -w warnings
}
my $index;                        # ref on a hash for the index entries
my %indices = ();                  # hash of indices names containing 
                                   #[ $Pages, $Entries ] (page indices and 
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
my $anchor_num = 0;

#
# can I use ISO8859 characters? (HTML+)
#
if ($T2H_USE_ISO)
{
    $things_map{'bullet'} = "&bull;";
    $things_map{'copyright'} = "&copy;";
    $things_map{'dots'} = "&hellip;";
    $things_map{'equiv'} = "&equiv;";
    $things_map{'expansion'} = "&rarr;";
    $things_map{'point'} = "&lowast;";
    $things_map{'result'} = "&rArr;";
}

#
# read texi2html extensions (if any)
#
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

print STDERR "# reading from $docu\n" if $T2H_VERBOSE;

#########################################################################
#
# latex2html stuff
#
# latex2html conversions consist of three stages:
# 1) ToLatex: Put "latex" code into a latex file
# 2) ToHtml: Use latex2html to generate corresponding html code and images
# 3) FromHtml: Extract generated code and images from latex2html run
#

# init l2h defaults for files and names

my ($l2h_name, $l2h_latex_file, $l2h_cache_file, $l2h_html_file, $l2h_prefix);

if ($T2H_L2H)
{
    $l2h_name =  "${docu_name}_l2h";
    $l2h_latex_file = "$docu_rdir${l2h_name}.tex";
    $l2h_cache_file = "${docu_rdir}l2h_cache.pm";
    $T2H_L2H_L2H = "latex2html" unless ($T2H_L2H_L2H);
    # destination dir -- generated images are put there, should be the same
    # as dir of enclosing html document --
    $l2h_html_file = "$docu_rdir${l2h_name}.html";
    $l2h_prefix = "${l2h_name}_";
}

##########################
#
# First stage: Generation of Latex file
# Initialize with: l2h_InitToLatex
# Add content with: l2h_ToLatex($text) --> HTML placeholder comment
# Finish with: l2h_FinishToLatex
#

my $l2h_latex_preamble = <<EOT;
% This document was automatically generated by the l2h extenstion of texi2html
% DO NOT EDIT !!!
\\documentclass{article}
\\usepackage{html}
\\begin{document}
EOT

my $l2h_latex_closing = <<EOT;
\\end{document}
EOT

my %l2h_to_latex = ();
my @l2h_to_latex = ();
my $l2h_latex_count = 0;
my $l2h_to_latex_count = 0;
my $l2h_cached_count = 0;
my %l2h_cache = ();
$T2H_L2H = l2h_InitToLatex() if ($T2H_L2H);

# return used latex 1, if l2h could be initalized properly, 0 otherwise
sub l2h_InitToLatex
{
    unless ($T2H_L2H_SKIP)
    {
        unless (open(L2H_LATEX, ">$l2h_latex_file"))
        {
            warn "$ERROR Error l2h: Can't open latex file '$l2h_latex_file' for writing\n";
            return 0;
        }
        print STDERR "# l2h: use ${l2h_latex_file} as latex file\n" if ($T2H_VERBOSE);
        print L2H_LATEX $l2h_latex_preamble;
    }
    # open database for caching
    l2h_InitCache();
    return  1;
}


# print text (1st arg) into latex file (if not already there), return
# @tex_$number which can be later on replaced by the latex2html
# generated text
sub l2h_ToLatex
{
    my($text) = @_;
    my($count);
    $l2h_to_latex_count++;
    $text =~ s/(\s*)$//;
    # try whether we can cache it
    my $cached_text = l2h_FromCache($text);
    if ($cached_text)
    {
        $l2h_cached_count++;
        return $cached_text;
    }
    # try whether we have text already on things to do
    unless ($count = $l2h_to_latex{$text})
    {
        $count = $l2h_latex_count;
        $l2h_latex_count++;
        $l2h_to_latex{$text} = $count;
        $l2h_to_latex[$count] = $text;
        unless ($T2H_L2H_SKIP)
        {
            print L2H_LATEX "\\begin{rawhtml}\n";
            print L2H_LATEX "<!-- l2h_begin ${l2h_name} ${count} -->\n";
            print L2H_LATEX "\\end{rawhtml}\n";

            print L2H_LATEX "$text\n";

            print L2H_LATEX "\\begin{rawhtml}\n";
            print L2H_LATEX "<!-- l2h_end ${l2h_name} ${count} -->\n";
            print L2H_LATEX "\\end{rawhtml}\n";
        }
    }
    return "\@tex_${count} ";
}

# print closing into latex file and close it
sub l2h_FinishToLatex
{
    my ($reused);
    $reused = $l2h_to_latex_count - $l2h_latex_count - $l2h_cached_count;
    unless ($T2H_L2H_SKIP)
    {
        print L2H_LATEX $l2h_latex_closing;
        close(L2H_LATEX);
    }
    print STDERR "# l2h: finished to latex ($l2h_cached_count cached, $reused reused, $l2h_latex_count contents)\n" if ($T2H_VERBOSE);
    unless ($l2h_latex_count)
    {
        l2h_Finish();
        return 0;
    }
    return 1;
}

###################################
# Second stage: Use latex2html to generate corresponding html code and images
#
# l2h_ToHtml([$l2h_latex_file, [$l2h_html_dir]]):
#   Call latex2html on $l2h_latex_file
#   Put images (prefixed with $l2h_name."_") and html file(s) in $l2h_html_dir
#   Return 1, on success
#          0, otherwise
#
sub l2h_ToHtml
{
    my ($call, $dotbug);
    if ($T2H_L2H_SKIP)
    {
        print STDERR "# l2h: skipping latex2html run\n" if ($T2H_VERBOSE);
        return 1;
    }
    # Check for dot in directory where dvips will work
    if ($T2H_L2H_TMP)
    {
        if ($T2H_L2H_TMP =~ /\./)
        {
            warn "$ERROR Warning l2h: l2h_tmp dir contains a dot. Use /tmp, instead\n";
            $dotbug = 1;
        }
    }
    else
    {
        if (getcwd() =~ /\./)
        {
            warn "$ERROR Warning l2h: current dir contains a dot. Use /tmp as l2h_tmp dir \n";
            $dotbug = 1;
        }
    }
    # fix it, if necessary and hope that it works
    $T2H_L2H_TMP = "/tmp" if ($dotbug);

    $call = $T2H_L2H_L2H;
    # use init file, if specified
    $call = $call . " -init_file " . $init_file if ($init_file && -f $init_file);
    # set output dir
    $call .=  ($docu_rdir ? " -dir $docu_rdir" : " -no_subdir");
    # use l2h_tmp, if specified
    $call = $call . " -tmp $T2H_L2H_TMP" if ($T2H_L2H_TMP);
    # options we want to be sure of
    $call = $call ." -address 0 -info 0 -split 0 -no_navigation -no_auto_link";
    $call = $call ." -prefix ${l2h_prefix} $l2h_latex_file";

    print STDERR "# l2h: executing '$call'\n" if ($T2H_VERBOSE);
    if (system($call))
    {
        warn "l2h ***Error: '${call}' did not succeed\n";
        return 0;
    }
    else
    {
        print STDERR "# l2h: latex2html finished successfully\n" if ($T2H_VERBOSE);
        return 1;
    }
}

# this is directly pasted over from latex2html
sub getcwd
{
    local($_) = `pwd`;

    die "'pwd' failed (out of memory?)\n"
        unless length;
    chop;
    $_;
}


##########################
# Third stage: Extract generated contents from latex2html run
# Initialize with: l2h_InitFromHtml
#   open $l2h_html_file for reading
#   reads in contents into array indexed by numbers
#   return 1,  on success -- 0, otherwise
# Extract Html code with: l2h_FromHtml($text)
#   replaces in $text all previosuly inserted comments by generated html code
#   returns (possibly changed) $text
# Finish with: l2h_FinishFromHtml
#   closes $l2h_html_dir/$l2h_name.".$docu_ext"

my $l2h_extract_error = 0;
my $l2h_range_error = 0;
my @l2h_from_html;

sub l2h_InitFromHtml()
{
    local(%l2h_img);
    my ($count, $h_line);

    if (! open(L2H_HTML, "<${l2h_html_file}"))
    {
        print "$ERROR Error l2h: Can't open ${l2h_html_file} for reading\n";
        return 0;
    }
    print STDERR "# l2h: use ${l2h_html_file} as html file\n" if ($T2H_VERBOSE);

    my $l2h_html_count = 0;
    while ($h_line = <L2H_HTML>)
    {
        if ($h_line =~ /^<!-- l2h_begin $l2h_name ([0-9]+) -->/)
        {
            $count = $1;
            my $h_content = "";
            while ($h_line = <L2H_HTML>)
            {
                if ($h_line =~ /^<!-- l2h_end $l2h_name $count -->/)
                {
                    chomp $h_content;
                    chomp $h_content;
                    $l2h_html_count++;
                    $h_content = l2h_ToCache($count, $h_content);
                    $l2h_from_html[$count] = $h_content;
                    $h_content = '';
                    last;
                }
                $h_content = $h_content.$h_line;
            }
            if ($h_content)
            {
                print "$ERROR Warning l2h: l2h_end $l2h_name $count not found\n"
                    if ($T2H_VERBOSE);
                close(L2H_HTML);
                return 0;
            }
        }
    }
    print STDERR "# l2h: Got $l2h_html_count of $l2h_latex_count html contents\n"
        if ($T2H_VERBOSE);

    close(L2H_HTML);
    return 1;
}

sub l2h_FromHtml($)
{
    my($text) = @_;
    my($done, $to_do, $count);
    $to_do = $text;
    $done = '';
    while ($to_do =~ /([^\000]*)<!-- l2h_replace $l2h_name ([0-9]+) -->([^\000]*)/)
    {
        $to_do = $1;
        $count = $2;
        $done = $3.$done;
        $done = "<!-- l2h_end $l2h_name $count -->".$done
            if ($T2H_DEBUG & $DEBUG_L2H);

        $done = l2h_ExtractFromHtml($count) . $done;

        $done = "<!-- l2h_begin $l2h_name $count -->".$done
            if ($T2H_DEBUG & $DEBUG_L2H);
    }
    return $to_do.$done;
}

sub do_tex($)
{
    my $count = shift;
    my $result = '';
    $result = "<!-- l2h_end $l2h_name $count -->"
            if ($T2H_DEBUG & $DEBUG_L2H);
    $result .= l2h_ExtractFromHtml($count);
    $result .= "<!-- l2h_begin $l2h_name $count -->"
            if ($T2H_DEBUG & $DEBUG_L2H);
    return $result;
}

sub l2h_ExtractFromHtml($)
{
    my $count = shift;
    return $l2h_from_html[$count] if ($l2h_from_html[$count]);
    if ($count >= 0 && $count < $l2h_latex_count)
    {
        # now we are in trouble
        my $line;
        $l2h_extract_error++;
        print STDERR "$ERROR l2h: can't extract content $count from html\n"
            if ($T2H_VERBOSE);
        # try simple (ordinary) substition (without l2h)
        my $l_l2h = $T2H_L2H;
        $T2H_L2H = 0;
        $line = $l2h_to_latex{$count};
        $line = substitute_text({}, $line);
        $line = "<!-- l2h: ". __LINE__ . " use texi2html -->" . $line
            if ($T2H_DEBUG & $DEBUG_L2H);
        $T2H_L2H = $l_l2h;
        return $line;
    }
    else
    {
        # now we have been incorrectly called
        $l2h_range_error++;
        print "$ERROR l2h: Request of $count content which is out of valide range [0,$l2h_latex_count)\n";
        return "<!-- l2h: ". __LINE__ . " out of range count $count -->"
            if ($T2H_DEBUG & $DEBUG_L2H);
        return "<!-- l2h: out of range count $count -->";
    }
}

sub l2h_FinishFromHtml()
{
    if ($T2H_VERBOSE)
    {
        if ($l2h_extract_error + $l2h_range_error)
        {
            print "# l2h: finished from html ($l2h_extract_error extract and $l2h_range_error errors)\n";
        }
        else
        {
            print "# l2h: finished from html (no errors)\n";
        }
    }
}

sub l2h_Finish()
{
    l2h_StoreCache();
    if ($T2H_L2H_CLEAN)
    {
        local ($_);
        print "# l2h: removing temporary files generated by l2h extension\n"
            if $T2H_VERBOSE;
        while (<"$docu_rdir$l2h_name"*>)
        {
            unlink $_;
        }
    }
    print "# l2h: Finished\n" if $T2H_VERBOSE;
    return 1;
}

##############################
# stuff for l2h caching
#

# I tried doing this with a dbm data base, but it did not store all
# keys/values. Hence, I did as latex2html does it
sub l2h_InitCache
{
    if (-r "$l2h_cache_file")
    {
        my $rdo = do "$l2h_cache_file";
        warn("$ERROR l2h Error: could not load $docu_rdir$l2h_cache_file: $@\n")
            unless ($rdo);
    }
}

sub l2h_StoreCache
{
    return unless $l2h_latex_count;
    my ($key, $value);
    open(FH, ">$l2h_cache_file") || return warn"$ERROR l2h Error: could not open $docu_rdir$l2h_cache_file for writing: $!\n";
    while (($key, $value) = each %l2h_cache)
    {
        # escape stuff
        $key =~ s|/|\\/|g;
        $key =~ s|\\\\/|\\/|g;
        # weird, a \ at the end of the key results in an error
        # maybe this also broke the dbm database stuff
        $key =~ s|\\$|\\\\|;
        $value =~ s/\|/\\\|/go;
        $value =~ s/\\\\\|/\\\|/go;
        $value =~ s|\\\\|\\\\\\\\|g;
        print FH "\n\$l2h_cache_key = q/$key/;\n";
        print FH "\$l2h_cache{\$l2h_cache_key} = q|$value|;\n";
    }
    print FH "1;";
    close(FH);
}

# return cached html, if it exists for text, and if all pictures
# are there, as well
sub l2h_FromCache
{
    my $text = shift;
    my $cached = $l2h_cache{$text};
    if ($cached)
    {
        while ($cached =~ m/SRC="(.*?)"/g)
        {
            unless (-e "$docu_rdir$1")
            {
                return undef;
            }
        }
        return $cached;
    }
    return undef;
}

# insert generated html into cache, move away images,
# return transformed html
my $maximage = 1;
sub l2h_ToCache($$)
{
    my $count = shift;
    my $content = shift;
    my @images = ($content =~ /SRC="(.*?)"/g);
    my ($src, $dest);

    for $src (@images)
    {
        $dest = $l2h_img{$src};
        unless ($dest)
        {
            my $ext;
            if ($src =~ /.*\.(.*)$/ && $1 ne $docu_ext)
            {
                $ext = $1;
            }
            else
            {
                warn "$ERROR: L2h image $src has invalid extension\n";
                next;
            }
            while (-e "$docu_rdir${docu_name}_$maximage.$ext")
            {
                $maximage++;
            }
            $dest = "${docu_name}_$maximage.$ext";
            system("cp -f $docu_rdir$src $docu_rdir$dest");
            $l2h_img{$src} = $dest;
            unlink "$docu_rdir$src" unless ($DEBUG & $DEBUG_L2H);
        }
        $content =~ s/$src/$dest/g;
    }
    $l2h_cache{$l2h_to_latex[$count]} = $content;
    return $content;
}

#+++###########################################################################
#                                                                             #
# Pass texi: read source, handle variable, ignored text, document structure   #
#                                                                             #
#---###########################################################################

my @fhs = ();			# hold the file handles to read
my @input_spool = ();		# spooled lines to read
my $fh_name = 'FH000';
my @lines = ();             # whole document
my @copying_lines = ();     # lines between @copying and @end copying
my $macros;                 # macros. reference on a hash

sub initialise_state_texi($)
{
    my $state = shift;
    $state->{'texi'} = 1;           # for substitute_text and close_stack: 
                                    # 1 if pass_texi/scan_texi is to be used
    $state->{'copying'} = 0;        # number of opened copying
}

sub pass_texi()
{
    my $first_line = 1;         # is it the first line
    my $state = {};
                                # holds the informations about the context
                                # to pass it down to the functions
    initialise_state_texi($state);
    my @stack;
    my $text;

 INPUT_LINE: while ($_ = next_line())
    {
        #
        # remove \input on the first lines only
        #
        if ($first_line)
        {
            next if /^\\input/;
            $first_line = 0;
        }
	#print STDERR "PASS_TEXI: $_";
        scan_texi ($_, \$text, \@stack, $state);
	#dump_stack (\$text, \@stack, $state);
        if ($state->{'bye'})
        {
            close_stack(\$text, \@stack, $state);
        }
        next if (@stack);
        $_ = $text;
        $text = '';
        next if !defined($_);
        if (!$state->{'copying'})
        {
            push @lines, split_lines ($_);
        }
        else
        {
            push @copying_lines, split_lines ($_);
        }
        last if ($state->{'bye'});
    }
    if (@stack or $state->{'macro'} or $state->{'ignored'} or $state->{'macro_name'} or $state->{'raw'} or $state->{'copying'})
    {
	    #dump_stack(\$text, \@stack, $state);
        close_stack(\$text, \@stack, $state);
        push @lines, split_lines ($text);
    }
    print STDERR "# end of pass texi\n" if $T2H_VERBOSE;
}

# return the line after removing things according to to_skip map.
sub skip_texi($$$)
{
    my $line = shift;
    my $macro = shift;
    my $state = shift;
    
    if ($macro eq 'bye')
    {
        $state->{'bye'} = 1;
        $line = "\n";
    }
    elsif ($macro eq 'end')
    {
        if ($line =~ /^\s+(\w+)/o and $to_skip_texi{"end $1"})
        {
            $line =~ s/^\s+(\w+)\s*//o;
        }
    }
    elsif ($to_skip_texi{$macro} eq 'arg')
    {
        $line =~ s/\s+([^\s]*)//o;
    }
    elsif ($to_skip_texi{$macro} eq 'line')
    {
        $line = '';
        #chomp $line;
    }
    elsif ($to_skip_texi{$macro} eq 'space')
    {
        $line =~ s/\s*//o;
    }
    return $line if ($line);
    return undef;
}

#+++###########################################################################
#                                                                             #
# Pass structure: parse document structure, remove unneeded empty lines       #
#                                                                             #
#---###########################################################################

sub initialise_state_structure($)
{
    my $state = shift;
    $state->{'structure'} = 1;      # for substitute_text and close_stack: 
                                    # 1 if pass_structure/scan_structure is 
                                    # to be used
    $state->{'titlepage'} = 0;      # number of opened titlepages
    $state->{'menu'} = 0;           # number of opened menus
    $state->{'detailmenu'} = 0;     # number of opened detailed menus      
    $state->{'level'} = 0;          # current sectionning level
    $state->{'complex_format'} = 0; # number of opened complex formats
    $state->{'table_stack'} = [ "no table" ]; # a stack of opened tables/lists
}

my @doc_lines = ();         # whole document
my @nodes_list = ();        # nodes in document reading order
                            # each member is a reference on a hash
my @sections_list = ();     # sections in reading order
                            # each member is a reference on a hash
my @elements_list = ();     # sectionning elements (nodes and sections)
                            # in reading order. Each member is a reference
                            # on a hash which also appears in %nodes,
                            # @sections_list @nodes_list, @all_elements
my @all_elements;           # all the elements in document order
my %nodes = ();             # nodes hash. The key is the texi node name
my %sections = ();          # sections hash. The key is the section number
                            # headings are there, although they are not elements
my $element_top;            # Top element
my $node_top;               # Top node
my $node_first;             # First node
my $element_index;          # element with first index
my $element_chapter_index;  # chapter with first index
my $element_first;          # first element
my $element_last;           # last element

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

my $do_contents;            # do table of contents if true
my $do_scontents;           # do short table of contents if true

sub pass_structure()
{
    my $first_line = 1;         # is it the first line
    my $state = {};
                                # holds the informations about the context
                                # to pass it down to the functions
    initialise_state_structure($state);
    my @stack;
    my $text;

    while (@lines)
    {
        $_ = shift @lines;
	#print STDERR "PASS_STRUCTURE: $_";
        if (!$state->{'raw'} and !$state->{'special'} and !$state->{'verb'})
        {
            my $tag = '';
            if (/^\s*\@(\w+)\b/)
            {
                $tag = $1;
            }

            #
            # analyze the tag
            #
            if ($tag and $tag eq 'node' or defined($sec2level{$tag}) or $tag eq 'printindex')
            {
                $_ = substitute_texi_line($_);
                delete $state->{'empty_line'};
                if (@stack and $tag eq 'node' or defined($sec2level{$tag}))
                {
                    close_stack (\$text, \@stack, $state);
                    next if $state->{'titlepage'};
                    push @doc_lines, split_lines ($text);
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
                             and $nodes{$node}->{'seen'} )
                        {
                            warn "$ERROR Duplicate node found: $node\n";
                            next;
                        }
                        elsif (exists($nodes{$node}) and defined($nodes{$node}))
                        {
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
                        $node_ref->{'texi'} = $node;
                        $node_ref->{'seen'} = 1;
                        $node_ref->{'automatic_directions'} = $auto_directions;
                        $node_ref->{'place'} = [];
                        $node_ref->{'current_place'} = [];
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
                                warn "$WARN Top node allready exists\n";
                            }
                        }
                        unless (@nodes_list)
                        {
                            $node_ref->{'first'} = 1;
                        }
                        push (@nodes_list, $node_ref);
                        push @elements_list, $node_ref;
                    }
                    else
                    {
                        warn "$ERROR Node is undefined: $_ (eg. \@node NODE-NAME, NEXT, PREVIOUS, UP)";
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
                {
                    if (/^\@$tag\s*(.*)$/)
                    {
                        my $name = normalise_space($1);
                        $name = '' if (!defined($name));
                        my $level = $sec2level{$tag};
                        $state->{'after_element'} = 1;
                        my ($docid, $num);
                        if($tag ne 'top')
                        {
                            $sec_num++;
                            $num = $sec_num;
                            $docid = "SEC$sec_num";
                        }
                        else
                        {
                            $num = 0;
                            $docid = "SEC_Top";
                        }
                        if ($tag !~ /heading/)
                        {
                            my $section_ref = { 'texi' => $name, 
                               'level' => $level,
                               'tag' => $tag,
                               'sec_num' => $num,
                               'section' => 1, 
                               'id' => $docid,
                               'index_names' => [],
                               'current_place' => [],
                               'place' => []
                            };
             
                            if ($tag eq 'top')
                            {
                                $section_ref->{'top'} = 1;
                                $section_ref->{'number'} = '';
                                $sections{0} = $section_ref;
                                $element_top = $section_ref;
                            }
                            $sections{$num} = $section_ref;
                            if ($state->{'node_ref'} and !exists($state->{'node_ref'}->{'with_section'}))
                            {
                                my $node_ref = $state->{'node_ref'};
                                $section_ref->{'node_ref'} = $node_ref;
                                $node_ref->{'with_section'} = $section_ref;
                                $node_ref->{'top'} = 1 if ($tag eq 'top');
                            }
                            if (! $name and $level)
                            {
                               warn "$ERROR $tag without name\n";
                            }
                            push @sections_list, $section_ref;
                            push @elements_list, $section_ref;
                            $state->{'section_ref'} = $section_ref;
                            $state->{'element'} = $section_ref;
                            $state->{'place'} = $section_ref->{'current_place'};
                            my $node_ref = "NO NODE";
                            my $node_texi ='';
                            if ($state->{'node_ref'})
                            {
                                $node_ref = $state->{'node_ref'};
                                $node_texi = $state->{'node_ref'}->{'texi'};
                            }
                            print STDERR "# pass_structure node($node_ref)$node_texi, tag \@$tag($level) ref $section_ref, num,id $num,$docid\n   $name\n"
                               if $T2H_DEBUG & $DEBUG_ELEMENTS;
                        }
                        else 
                        {
                            my $section_ref = { 'texi' => $name, 
                                'level' => $level,
                                'heading' => 1,
                                'tag' => $tag,
                                'sec_num' => $sec_num, 
                                'id' => $docid,
                                'number' => '' };
                            $state->{'element'} = $section_ref;
                            push @{$state->{'place'}}, $section_ref;
                            $sections{$sec_num} = $section_ref;
                        }
                    }
                }
                elsif (/^\@printindex\s+(\w+)/)
                {
                    unless (@elements_list)
                    {
                        warn "$WARN Printindex command before document beginning: \@printindex $1\n";
                        next;
                    }
                    # $element_index is the first element with index
                    $element_index = $elements_list[-1] unless (defined($element_index));
                    # associate the index to the element such that the page
                    # number is right
                    my $placed_elements = [];
                    push @{$elements_list[-1]->{'index_names'}}, { 'name' => $1, 'place' => $placed_elements };
                    $state->{'place'} = $placed_elements;
                }
                next if ($state->{'titlepage'});
                push @doc_lines, $_;
                next;
            }
        }
        scan_structure ($_, \$text, \@stack, $state);
        next if (@stack);
        $_ = $text;
        $text = '';
        next if ($state->{'titlepage'} or !defined($_));
        push @doc_lines, split_lines ($_);
    }
    if (@stack)
    {
        close_stack(\$text, \@stack, $state);
        push @doc_lines, split_lines ($text) if ($text and !$state->{'titlepage'});
    }
    warn "$WARN $state->{'titlepage'} titlepage not closed\n" if ($state->{'titlepage'});
    print STDERR "# end of pass structure\n" if $T2H_VERBOSE;
}

# split line at end of line and put each resulting line in an array
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

# return the line after removing things according to to_skip map.
# if the skipped macro has an effect it is done here
sub skip($$$)
{
    my $line = shift;
    my $macro = shift;
    my $state = shift;

    if ($macro eq 'lowersections')
    {
        my ($sec, $level);
        while (($sec, $level) = each %sec2level)
        {
            $sec2level{$sec} = $level + 1;
        }
        $state->{'level'}--;
    }
    elsif ($macro eq 'raisesections')
    {
        my ($sec, $level);
        while (($sec, $level) = each %sec2level)
        {
            $sec2level{$sec} = $level - 1;
        }
        $state->{'level'}++;
    }
    elsif ($macro eq 'contents')
    {
        $do_contents = 1;
    }
    elsif ($macro eq 'detailmenu')
    {
        $state->{'detailmenu'}++;
    }
    elsif (($macro eq 'summarycontents') or ($macro eq 'shortcontents'))
    {
        $do_scontents = 1;
    }
    
    if ($macro eq 'end')
    {
        if ($line =~ /^\s+(\w+)/o and $to_skip{"end $1"})
        {
            $state->{'detailmenu'}-- if ($1 eq 'detailmenu' and $state->{'detailmenu'});
            $line =~ s/^\s+(\w+)\s*//o;
        }
    }
    elsif ($to_skip{$macro} eq 'arg')
    {
        $line =~ s/\s+([^\s]*)//o;
    }
    elsif ($to_skip{$macro} eq 'line')
    {
        $line = '';
        #chomp $line;
    }
    elsif ($to_skip{$macro} eq 'space')
    {
        $line =~ s/\s*//o;
    } 
    return $line if ($line);
    return undef;
}

# find menu_prev, menu_up... for a node in menu
sub menu_entry_texi($$)
{
    my $node = shift;
    my $state = shift;
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
    $node_menu_ref->{'menu_node'} = 1;
    if ($state->{'node_ref'})
    {
        $node_menu_ref->{'menu_up'} = $state->{'node_ref'};
	$node_menu_ref->{'menu_up_hash'}->{$state->{'node_ref'}->{'texi'}} = 1;
    }
    else
    {
        warn "$WARN menu without previous node\n" unless $node =~ /\(.+\)/;
    }
    return if ($state->{'detailmenu'});
    if ($state->{'prev_menu_node'})
    {
        $node_menu_ref->{'menu_prev'} = $state->{'prev_menu_node'};
        $state->{'prev_menu_node'}->{'menu_next'} = $node_menu_ref;
    }
    else
    {
        $state->{'node_ref'}->{'menu_child'} = $node_menu_ref;
    }
    $state->{'prev_menu_node'} = $node_menu_ref;
}

my %files = ();   #keys are files. This is used to avoid reusing an allready
                  # used file name

# find next, prev, up, back, forward, fastback, fastforward
# find element id and file
# split index pages
# associate placed items (items which have links to them) with the right 
# file and id
# associate nodes with sections
sub rearrange_elements()
{
    @all_elements = @elements_list;
    
    print STDERR "# find sections levels and toplevel\n"
        if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    
    my $toplevel = 4;
    # correct level if raisesections or lowersections overflowed
    # and find toplevel
    foreach my $element (values(%sections))
    {
        my $level = $element->{'level'};
        if ($level > $MAX_LEVEL)
        {
             $element->{'level'} = $MAX_LEVEL;
        }
        elsif ($level < $MIN_LEVEL and !$element->{'top'})
        {
             $element->{'level'} = $MIN_LEVEL;
        }
        else
        {
             $element->{'level'} = $level;
        }
        $element->{'toc_level'} = $element->{'level'};
        $element->{'toc_level'} = $MIN_LEVEL if ($element->{'level'} < $MIN_LEVEL);
        $toplevel = $element->{'level'} if (($element->{'level'} < $toplevel) and ($element->{'level'} > 0 and ($element->{'tag'} !~ /heading/)));
        print STDERR "# section level $level: $element->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    }
    
    print STDERR "# find sections structure, construct section numbers (toplevel=$toplevel)\n"
        if ($T2H_DEBUG & $DEBUG_ELEMENTS);
	
    my $in_appendix = 0;
    # these arrays heve an element per sectionning level. 
    my @previous_numbers = ();   # holds the number of the previous sections
                                 # at the same and upper levels
    my @previous_sections = ();  # holds the ref of the previous sections
    
    foreach my $section (@sections_list)
    {
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
            $section->{'section_prev'} = $prev_section;
            $prev_section->{'next'} = $section;
	    #$prev_section->{'section_next'} = $section;
            $prev_section->{'element_next'} = $section;
        }
        # find the up section
        if ($section->{'level'} == $toplevel)
        {
            $section->{'up'} = undef;
        }
        else
        {
            my $level = $section->{'level'} - 1;
            while (!defined($previous_sections[$level]))
            {
                 $level--;
            }
            $section->{'up'} = $previous_sections[$level];
            # 'child' is the first child
            $section->{'up'}->{'child'} = $section unless ($section->{'section_prev'});
        }
        $previous_sections[$section->{'level'}] = $section;
        # element_up is used for reparenting in case an index page 
        # splitted a section. This is used in order to preserve the up which
        # points to the up section. See below at index pages generation.
        $section->{'element_up'} = $section->{'up'};

        my $up = "NO_UP";
        $up = $section->{'up'} if (defined($section->{'up'}));
        print STDERR "# numbering section ($section->{'level'}): $section->{'number'}: (up: $up) $section->{'texi'}\n"
            if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    }

    my @node_directions = ('node_prev', 'node_next', 'node_up');
    # handle nodes 
    # the node_prev... are texinfo strings, find the associated node references
    print STDERR "# Resolve nodes directions\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    foreach my $node (@nodes_list)
    {
        foreach my $direction (@node_directions)
        {
            if ($node->{$direction} and !ref($node->{$direction}))
            {
                if ($nodes{$node->{$direction}} and $nodes{$node->{$direction}}->{'seen'})
                {
                     $node->{$direction} = $nodes{$node->{$direction}};
                }
                elsif ($node->{$direction} =~ /^\(.*\)/)
                { # ref to an external node
                    if (exists($nodes{$node->{$direction}}))
                    {
                        $node->{$direction} = $nodes{$node->{$direction}};
                    }
                    else
                    {
                        # FIXME if {'seen'} this is a node appearing in the
                        # document. What to do in that case ?
                        my $node_ref = { 'texi' => $node->{$direction},
                            'external_node' => 1 };
                        $nodes{$node->{$direction}} = $node_ref;
                        $node->{$direction} = $node_ref;
                    }
                }
                else
                {
                     warn "$WARN $direction `$node->{$direction}' for `$node->{'texi'}' not found\n";
                     delete $node->{$direction};
                }
            }
        }
    }
    
    # nodes are attached to the section preceding them if not allready 
    # associated with a section
    print STDERR "# Find the section associated with each node\n"
        if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    my $current_section = $sections_list[0];
    my $current;
    foreach my $element (@all_elements)
    {
        if ($element->{'node'})
        {   
            if ($element->{'with_section'})
            { # the node is associated with a section
                $element->{'section_ref'} = $element->{'with_section'};
                push @{$element->{'section_ref'}->{'nodes'}}, $element;
            }
            elsif (defined($current_section))
            {
                $element->{'in_top'} = 1 if ($current_section->{'top'});
                $element->{'section_ref'} = $current_section;
                # nodes are considered sub elements for the purprose of 
                # reparenting and their element_next and element_prev
                # are next and prev node associated with the same section
                $element->{'element_up'} = $current_section;
                $element->{'toc_level'} = $current_section->{'toc_level'};
                if (defined($current))
                {
                   $current->{'element_next'} = $element;
                   $element->{'element_prev'} = $current;
                }
                $current = $element;
                push @{$element->{'section_ref'}->{'nodes'}}, $element;
            }
            else
            {
                $element->{'toc_level'} = $MIN_LEVEL;
            }
        }
        else
        {
            $current = undef;
            $current_section = $element;
        }
    }
    print STDERR "# Complete nodes next prev and up based on menus and sections\n"
        if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    foreach my $node (@nodes_list)
    {
        if (!$node->{'first'} and !$node->{'top'} and !$node->{'menu_up'} and ($node->{'texi'} !~ /^top$/i) and $T2H_SHOW_MENU)
        {
            warn "$WARN `$node->{'texi'}' doesn't appear in menus\n";
        }

        # use values deduced from menus to complete missing up, next, prev
        # or from sectionning commands if automatic sectionning
        if ($node->{'node_up'})
        {
            $node->{'up'} = $node->{'node_up'};
        }
        elsif ($node->{'automatic_directions'} and $node->{'section_ref'} and defined($node->{'section_ref'}->{'up'}))
        {
            $node->{'up'} = get_node($node->{'section_ref'}->{'up'});
        }
        elsif ($node->{'menu_up'})
        {
            $node->{'up'} = $node->{'menu_up'};
        }

        if ($node->{'up'} and !$node->{'up'}->{'external_node'})
        {
            # We detect when the up node has no menu entry for that node, as
            # there may be infinite loops when finding following node (see below)
            unless (defined($node->{'menu_up_hash'}) and ($node->{'menu_up_hash'}->{$node->{'up'}->{'texi'}}))
            {
                print STDERR "$WARN `$node->{'up'}->{'texi'}' is up for `$node->{'texi'}', but has no menu entry for this node\n";
                push @{$node->{'up_not_in_menu'}}, $node->{'up'}->{'texi'};
            }
        }

        # Find next node
        if ($node->{'node_next'})
        {
            $node->{'next'} = $node->{'node_next'};
        }
        elsif ($node->{'texi'} eq 'Top')
        { # special case as said in the texinfo manual
            $node->{'next'} = $node->{'menu_child'} if ($node->{'menu_child'});
        }
        elsif ($node->{'automatic_directions'})
        {
            if (defined($node->{'section_ref'}))
            {
                my $next;
                my $section = $node->{'section_ref'};
                if (defined($section->{'next'}))
                {
                    $next = get_node($section->{'next'})
                }
		else 
                {
                    while (defined($section->{'up'}) and !defined($section->{'next'}))
                    {
                        $section = $section->{'up'};
                    }
                    if (defined($section->{'next'}))
                    {
                        $next = get_node($section->{'next'});
                    }
                }
                $node->{'next'} = $next;
            }
        }
        if (!defined($node->{'next'}) and $node->{'menu_next'})
        {
            $node->{'next'} = $node->{'menu_next'};
        }
        # Find prev node
        if ($node->{'node_prev'})
        {
            $node->{'prev'} = $node->{'node_prev'};
        }
        elsif ($node->{'automatic_directions'})
        {
            if (defined($node->{'section_ref'}))
            {
                my $section = $node->{'section_ref'};
                if (defined($section->{'section_prev'}))
                {
                    $node->{'prev'} = get_node($section->{'section_prev'});
                }
                elsif (defined($section->{'up'}))
                {
                    $node->{'prev'} = get_node($section->{'up'});
                }
            }
        }
        # next we try menus. makeinfo don't do that
        if (!defined($node->{'prev'}) and $node->{'menu_prev'}) 
        {
            $node->{'prev'} = $node->{'menu_prev'};
        }
        # the prev node is the parent node
        elsif (!defined($node->{'prev'}) and $node->{'menu_up'})
        {
            $node->{'prev'} = $node->{'menu_up'};
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
            $node->{'following'} = get_node ($node->{'section_ref'}->{'child'});
        }
        elsif (defined($node->{'next'}))
        {
            $node->{'following'} = $node->{'next'};
        }
	else
        {
            my $up = $node->{'up'};
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
                if (defined($up->{'next'}))
                {
                    $node->{'following'} = $up->{'next'};
                }
                elsif (defined($up->{'up'}))
                {
                    if (! grep { $_ eq $up->{'up'}->{'texi'} } @{$node->{'up_not_in_menu'}}) 
                    { 
                        $up = $up->{'up'};
                    }
                    else
                    { # in that case we can go into a infinite loop
                        $node->{'following'} = $up->{'up'};
                    }
                }
                else
                {
                    $up = undef;
                }
            }
        }
    }
    
    print STDERR "# Build the elements list\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    if (!$T2H_USE_NODES)
    {
        #the only sectionning elements are sections
        @elements_list = @sections_list;
        # if there is no section we use nodes...
        if (!@elements_list)
        {
            print STDERR "# no section\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
            @elements_list = @all_elements;
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
        my @elements = ();
        while (@elements_list)
        {
            my $element = shift @elements_list;
            if ($element->{'node'})
            {
                if (!defined($element->{'with_section'}))
                {
                    $element->{'toc_level'} = $MIN_LEVEL if (!defined($element->{'toc_level'}));
                    print STDERR "# new node element ($element) $element->{'texi'}\n"
                        if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                    push @elements, $element;
                }
            }
            else
            {
                print STDERR "# new section element ($element) $element->{'texi'}\n"
                    if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                push @elements, $element;
            }
        }
        @elements_list = @elements;
    }
    foreach my $element (@elements_list)
    {
        $element->{'element'} = 1;
    }
    
    # find first and last elements before we split indices
    # FIXME Is it right for the last element ? Or should it be the last
    # with indices taken into account ?
    $element_first = $elements_list[0];
    # If there is no @top section no top node the first node is the top element
    $element_top = $node_top if (!defined($element_top) and defined($node_top));
    $element_top = $element_first unless (defined($element_top));
    $element_top->{'top'} = 1 if ($element_top->{'node'});
    $element_last = $elements_list[-1];
    
    print STDERR "# find forward and back\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
    my $prev;
    foreach my $element (@elements_list)
    {
        # complete the up for toplevel elements
        if ($element->{'toplevel'} and !defined($element->{'up'}) and $element ne $element_top)
        {
            $element->{'up'} = $element_top;
        }
        # The childs are element which should be reparented in cas a chapter 
        # is split by an index
        push @{$element->{'element_up'}->{'childs'}}, $element if (defined($element->{'element_up'}));
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
            $element->{'nodenext'} = $element->{'node_ref'}->{'next'};
            $element->{'nodeprev'} = $element->{'node_ref'}->{'prev'};
            $element->{'menu_next'} = $element->{'node_ref'}->{'menu_next'};
            $element->{'menu_prev'} = $element->{'node_ref'}->{'menu_prev'};
            $element->{'menu_child'} = $element->{'node_ref'}->{'menu_child'};
            $element->{'menu_up'} = $element->{'node_ref'}->{'menu_up'};
            $element->{'nodeup'} = $element->{'node_ref'}->{'up'};
            $element->{'following'} = $element->{'node_ref'}->{'following'};
        }
        elsif (! $element->{'node'})
        { # the section has no node associated. Find the node directions using 
          # sections
            if (defined($element->{'next'}))
            {
                 $element->{'nodenext'} = get_node($element->{'next'});
            }
            if (defined($element->{'section_prev'}))
            {
                 $element->{'nodeprev'} = get_node($element->{'section_prev'});
            }
            if (defined($element->{'up'}))
            {
                 $element->{'nodeup'} = get_node($element->{'up'});
            }
            if ($element->{'child'})
            {
                $element->{'following'} = get_node($element->{'child'});
            }
            elsif ($element->{'next'})
            {
                $element->{'following'} = get_node($element->{'next'});
            }
            elsif ($element->{'up'})
            {
                my $up = $element;
                while ($up->{'up'} and !$element->{'following'})
                {
                    $up = $up->{'up'};
                    if ($up->{'next_section'})
                    {
                        $element->{'following'} = get_node ($up->{'next_section'});
                    }
                }
            }
        }
        if ($element->{'node'})
        {
             $element->{'nodeup'} = $element->{'up'};
             $element->{'nodeprev'} = $element->{'prev'};
             $element->{'nodenext'} = $element->{'next'};
        }
    }

    my @new_elements = ();
    print STDERR "# preparing indices\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);

    while(@elements_list)
    {
        my $element = shift @elements_list;
        # @checked_elements are the elements included in the $element (including
        # itself) and are searched for indices
        my @checked_elements = ();
        if (!$element->{'node'})
        {
            if (!$T2H_USE_NODES)
            {
                foreach my $node (@{$element->{'nodes'}})
                {
                    # we update the element index, first element with index
                    # if it is a node
                    $element_index = $element if ($element_index and ($node eq $element_index));
                    push @checked_elements, $node;
                    # we push the section itself after the corresponding node
                    push @checked_elements, $element if (defined($element->{'node_ref'}) and ($node eq $element->{'node_ref'}));
                }
                push @checked_elements, $element if (!defined($element->{'node_ref'}));
                $element->{'nodes'} = []; # We reset the element nodes list
                # as the nodes may be associated below to another element if 
                # the element is split accross several other elements/pages
            }
            else
            {
                if ($element->{'node_ref'})
                {
                    push @checked_elements, $element->{'node_ref'};
                    $element_index = $element if ($element_index and ($element->{'node_ref'} eq $element_index));
                }
                push @checked_elements, $element;
                $element->{'nodes'} = [];
            }
        }
        else
        {
            push @checked_elements, $element;
        }
        #print STDERR "Add index pages for ($element) $element->{'texi'} (@checked_elements)\n";
        # current_element is the last element holding text
        my $current_element = { 'holder' => 1, 'texi' => 'HOLDER', 
            'place' => [], 'indices' => [] };
        # back is sed to find back and forward
        my $back = $element->{'back'} if defined($element->{'back'});
        # forward is sed to find forward of the last inserted element
        my $forward = $element->{'forward'};
        my $element_next = $element->{'element_next'};
        my $index_num = 0;
        my @waiting_elements = (); # elements (nodes) not used for sectionning 
                                 # waiting to be associated with an element
        foreach my $checked_element(@checked_elements)
        {
	    if ($checked_element->{'element'})
            { # this is the element, we must add it
                push @new_elements, $checked_element;
                if ($current_element->{'holder'})
                { # no previous element added
                    push @{$checked_element->{'place'}}, @{$current_element->{'place'}};
                    foreach my $index(@{$current_element->{'indices'}})
                    {
                        push @{$checked_element->{'indices'}}, [ { 'element' => $checked_element, 'page' => $index->[0]->{'page'} } ] ;
                    }
                }
                else
                {  
                    if ($checked_element->{'toplevel'})
                    # there was an index_page added, this index_page is toplevel.
                    # it begun a new chapter. The element next for this 
                    # index page (current_element) is the checked_element
                    {
                        $current_element->{'element_next'} = $checked_element;
                    }
                    $current_element->{'next'} = $checked_element;
                    $current_element->{'following'} = $checked_element;
                    $checked_element->{'prev'} = $current_element;
                }
                $current_element = $checked_element;
                $checked_element->{'back'} = $back;
                $back->{'forward'} = $checked_element if (defined($back));
                $back = $checked_element;
                push @{$checked_element->{'nodes'}}, @waiting_elements;
                my $waiting_element;
                while (@waiting_elements)
                {
                    $waiting_element = shift @waiting_elements;
                    $waiting_element->{'section_ref'} = $checked_element;
                }
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
                my ($Pages, $Entries) = GetIndex($index->{'name'});
                if (defined($Pages))
                {
                    my @pages = @$Pages;
                    my $first_page = shift @pages;
                    # debug
                    my $back_texi = 'NO_BACK';
                    $back_texi = $back->{'texi'} if (defined($back));
		    print STDERR "# New index first page (back `$back_texi', current `$current_element->{'texi'}')\n" if ($T2H_DEBUG & $DEBUG_INDEX);
                    push @{$current_element->{'indices'}}, [ {'element' => $current_element, 'page' => $first_page} ];
                    if (@pages)
                    {
                        if ($current_element->{'holder'})
                        { # the current element isn't a real element. 
                          # We add the real element 
                          # we are in a node of a section but the element
                          # is splitted by the index, thus we must add 
                          # a new element which will contain the text 
                          # between the beginning of the element and the index
                            push @new_elements, $checked_element;
                            print STDERR "# Add element `$element->{'texi'}' before index page\n" 
                                if ($T2H_DEBUG & $DEBUG_INDEX);
                            $checked_element->{'element'} = 1;
                            $checked_element->{'level'} = $element->{'level'};
                            $checked_element->{'toc_level'} = $element->{'toc_level'};
                            $checked_element->{'toplevel'} = $element->{'toplevel'};
                            $checked_element->{'up'} = $element->{'up'};
                            $checked_element->{'element_added'} = 1;
                            delete $checked_element->{'with_section'};
                            if ($checked_element->{'toplevel'})
                            {
                                $element->{'element_prev'}->{'element_next'} = $checked_element if (exists($element->{'element_prev'}));
                            }
                            push @{$checked_element->{'place'}}, @{$current_element->{'place'}};
                            foreach my $index(@{$current_element->{'indices'}})
                            {
                                push @{$checked_element->{'indices'}}, [ { 'element' => $checked_element, 'page' => $index->[0]->{'page'} } ] ;
                            }
                            push @{$checked_element->{'nodes'}}, @waiting_elements;
                            my $waiting_element;
                            while (@waiting_elements)
                            {
                                $waiting_element = shift @waiting_elements;
                                $waiting_element->{'section_ref'} = $checked_element;
                            }
                            $checked_element->{'back'} = $back;
                            $back->{'forward'} = $checked_element if (defined($back));
                            $current_element = $checked_element;
                            $back = $checked_element;
                        }
                        my $index_page;
                        while(@pages)
                        {
                            # debug
			    print STDERR "# New page (back `$back->{'texi'}', current `$current_element->{'texi'}')\n" if ($T2H_DEBUG & $DEBUG_INDEX);
                            $index_num++;
                            my $page = shift @pages;
                            $index_page = { 'index_page' => 1,
                             'texi' => "$element->{'texi'} index $index->{'name'} page $index_num",
                             'level' => $element->{'level'},
                             'toplevel' => $element->{'toplevel'},
                             'up' => $element->{'up'},
                             'element_up' => $element->{'element_up'},
                             'element_next' => $element_next,
                             'element_ref' => $element,
                             'back' => $back,
                             'prev' => $back,
                             'next' => $current_element->{'next'},
                             'following' => $current_element->{'following'},
                             'nodeup' => $current_element->{'nodeup'},
                             'nodenext' => $current_element->{'nodenext'},
                             'nodeprev' => $back,
                             'place' => [],
                             'page' => $page
                            };
                            $index_page->{'node'} = 1 if ($element->{'node'});
                            while ($nodes{$index_page->{'texi'}})
                            {
                                $nodes{$index_page->{'texi'}} .= ' ';
                            }
                            $nodes{$index_page->{'texi'}} = $index_page;
                            push @{$current_element->{'indices'}->[-1]}, {'element' => $index_page, 'page' => $page };
                            push @new_elements, $index_page;
                            $back->{'forward'} = $index_page;
                            $back->{'next'} = $index_page;
                            $back->{'nodenext'} = $index_page;
                            $back->{'element_next'} = $index_page unless ($back->{'top'});
                            $back->{'following'} = $index_page;
                            $back = $index_page;
                            $index_page->{'toplevel'} = 1 if ($element->{'top'});
                        }
                        $current_element = $index_page;
                    }
                }
                push @{$current_element->{'place'}}, @{$index->{'place'}};
            }
        }
        if ($forward and ($current_element ne $element))
        {
            $current_element->{'forward'} = $forward;
            $forward->{'back'} = $current_element;
        }
        next if ($current_element eq $element or !$current_element->{'toplevel'});
        # reparent the elements below $element, following element
        # and following parent of element to the last index page
	print STDERR "# Reparent `$element->{'texi'}':\n" if ($T2H_DEBUG & $DEBUG_INDEX);
        my @reparented_elements = ();
        @reparented_elements = (@{$element->{'childs'}}) if (defined($element->{'childs'}));
        push @reparented_elements, $element->{'element_next'} if (defined($element->{'element_next'}));
        foreach my $reparented(@reparented_elements)
        {
            next if ($reparented->{'toplevel'});
            $reparented->{'element_up'} = $current_element;
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
	#print STDERR "$element->{'texi'} (top: $element->{'top'}, toplevel: $element->{'toplevel'}, $element->{'element_up'}, $element->{'element_up'}->{'texi'}): up: $up, $up->{'texi'}\n";
        # fastforward is the next element on same level than the upper parent
        # element
        $element->{'fastforward'} = $up->{'element_next'} if (exists ($up->{'element_next'}));
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
    my $index_nr = 0;
    # convert directions in direction with first letter in all caps, to be
    # consistent with the convention used in the .init file.
    # find id for nodes and indices
    foreach my $element (@elements_list)
    {
        $element->{'this'} = $element;
        foreach my $direction (('Up', 'Forward', 'Back', 'Next', 
            'Prev', 'FastForward', 'FastBack', 'This', 'NodeUp', 
            'NodePrev', 'NodeNext', 'Following' ))
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
    my $node_nr = 1;
    foreach my $node (@nodes_list)
    {
        $node->{'id'} = 'NOD' . $node_nr;
        $node_nr++;
        # debug check
        print STDERR "Bug: level defined for node `$node->{'texi'}'\n" if (defined($node->{'level'}) and !$node->{'element_added'});
    }

    # Find node file names
    if ($T2H_NODE_FILES)
    {
        my $top;
        if ($node_top)
        {
            $top = $node_top;
        }
        elsif ($element_top->{'node_ref'})
        {
            $top = $element_top->{'node_ref'};
        }
        else
        {
            $top = $node_first;
        }
        if ($top)
        {
            my $file = "$T2H_TOP_NODE_FILE.$T2H_NODE_FILE_EXTENSION";
            $top->{'file'} = $file if ($T2H_SPLIT eq 'node');
            $top->{'node_file'} = $file;
            $files{$file} = "node";
        }
        foreach my $key (keys(%nodes))
        {
            my $node = $nodes{$key};
            next if ($node->{'external_node'} or $node->{'index_page'} or defined($node->{'file'}));
            my $name = remove_texi($node->{'texi'});
            $name =~ s/[^\w\.\-]/-/g;
            my $file = "${name}.$T2H_NODE_FILE_EXTENSION";
            my $index = 0;
            while ($files{$file})
            {
                $index++;
                $file = "${name}_${index}.$T2H_NODE_FILE_EXTENSION";
            }
            $node->{'file'} = $file if ($T2H_SPLIT eq 'node');
            $node->{'node_file'} = $file;
            if ($node->{'node'})
            {
                $files{$file} = "node";
            }
            elsif ($node->{'anchor'})
            {
                $files{$file} = "anchor";
            }
	    else
            {
                print STDERR "Bug: $node->{'texi'} not a node nor an anchor nor an index_page\n";
            }
        }
    }
    # find document nr and document file for sections and nodes. 
    # Split according to T2H_SPLIT.
    # find file and id for placed elements (anchors, index entries, headings)
    if ($T2H_SPLIT)
    {
        my $cut_section = $toplevel;
        my $doc_nr = -1;
        if ($T2H_SPLIT eq 'section')
        {
            $cut_section = 2 if ($toplevel <= 2);
        }
        my $top_doc_nr;
        my $prev_nr;
        foreach my $element (@elements_list)
        {
            print STDERR "# Splitting ($T2H_SPLIT) $element->{'texi'}\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
            $doc_nr++ if (
               ($T2H_SPLIT eq 'node') or
               (
                 (!$element->{'node'} or $element->{'element_added'}) and ($element->{'level'} <= $cut_section)
               )
              );
            $doc_nr = 0 if ($doc_nr < 0); # happens if first elements are nodes
            $element->{'doc_nr'} = $doc_nr;
            if ($T2H_NODE_FILES and $T2H_SPLIT eq 'node')
            {
                my $node = get_node($element);
                if ($node and $node->{'file'})
                {
                    $element->{'file'} = $node->{'file'};
                }
                unless ($element->{'file'})
                {
                    my $file = "${docu_name}_$doc_nr.$docu_ext";
                    while ($files{$file})
                    {
                        $doc_nr++;
                        $file = "${docu_name}_$doc_nr.$docu_ext";
                    }
                    $element->{'file'} = $file;
                    $element->{'doc_nr'} = $doc_nr;
                }
            }
            else
            {
                $element->{'file'} = "${docu_name}_$doc_nr.$docu_ext";
                if (defined($top_doc_nr))
                {
                    if ($doc_nr eq $top_doc_nr)
                    {
                        $element->{'file'} = "$docu_top";
                        if ($element->{'level'} # this is an element below @top. It
                                               # starts a new file.
                          or ($element->{'node'} and ($element ne $node_top) and (!defined($element->{'section_ref'}) or $element->{'section_ref'} ne $element_top))
                          )# this is a node not associated with top
                        {
                            $doc_nr++;
                            my $file = "${docu_name}_$doc_nr.$docu_ext";
                            while ($files{$file})
                            {
                                $doc_nr++;
                                $file = "${docu_name}_$doc_nr.$docu_ext";
                            }
                            $element->{'doc_nr'} = $doc_nr;
                            $element->{'file'} = "${docu_name}_$doc_nr.$docu_ext";
                        }
                    }
                }
                elsif ($element eq $element_top or (defined($element->{'section_ref'}) and $element->{'section_ref'} eq $element_top) or (defined($element->{'node_ref'}) and !$element->{'node_ref'}->{'element_added'} and $element->{'node_ref'} eq $element_top))
                {
                    $element->{'file'} = "$docu_top";
                    # if there is a previous element, we force it to be in 
                    # an other file than top
                    $doc_nr++ if (defined($prev_nr) and $doc_nr == $prev_nr);
                    $top_doc_nr = $doc_nr;
                    $element->{'doc_nr'} = $doc_nr;
                }
            }
            $prev_nr = $doc_nr;
#            $element->{'file'} = "$docu_name.$docu_ext" if ($doc_nr == 0);
            foreach my $place(@{$element->{'place'}})
            {
                $place->{'file'} = $element->{'file'};
                $place->{'id'} = $element->{'id'} unless defined($place->{'id'});
            }
            if (!$element->{'node'} and (!$T2H_NODE_FILES or ($T2H_SPLIT ne 'node')))
            { 
                if (!$T2H_USE_NODES and $element->{'nodes'})
                {
                    foreach my $node (@{$element->{'nodes'}})
                    {
                        $node->{'doc_nr'} = $element->{'doc_nr'};
                        $node->{'file'} = $element->{'file'};
                    }
                }
                elsif ($element->{'node_ref'} and !$element->{'node_ref'}->{'element_added'})
                {
                    $element->{'node_ref'}->{'doc_nr'} = $element->{'doc_nr'} ;
                    $element->{'node_ref'}->{'file'} = $element->{'file'};
                }
            }
        }
    }
    else
    {
        foreach my $element(@elements_list)
        {
            die "$ERROR monolithic file and a node have the same file name $docu_name.$docu_ext\n" if ($T2H_NODE_FILES and $files{$docu_name.$docu_ext});
            $element->{'file'} =  "$docu_name.$docu_ext";
            $element->{'doc_nr'} = 0;
            foreach my $place(@{$element->{'place'}})
            {
                $place->{'file'} = "$element->{'file'}";
                $place->{'id'} = $element->{'id'} unless defined($place->{'id'});
            }
        }
        foreach my $node(@nodes_list)
        {
            $node->{'file'} =  "$docu_name.$docu_ext";
            $node->{'doc_nr'} = 0;
        }
    }
    # correct the id and file for the things placed in footnotes
    foreach my $place(@{$footnote_element->{'place'}})
    {
        $place->{'file'} = $footnote_element->{'file'};
        $place->{'id'} = $footnote_element->{'id'} unless defined($place->{'id'});
    }
    foreach my $element ((@elements_list, $footnote_element))
    {
        last unless ($T2H_DEBUG & $DEBUG_ELEMENTS);
        my $is_toplevel = 'not top';
        $is_toplevel = 'top' if ($element->{'toplevel'});
        print STDERR "$element ";
        if ($element->{'index_page'})
        {
            print STDERR "index($element->{'id'}, $is_toplevel, doc_nr $element->{'doc_nr'}($element->{'file'})): $element->{'texi'}\n";
        }
        elsif ($element->{'node'})
        {
            my $added = '';
            $added = 'added, ' if ($element->{'element_added'});
            print STDERR "node($element->{'id'}, toc_level $element->{'toc_level'}, $is_toplevel, ${added}doc_nr $element->{'doc_nr'}($element->{'file'})) $element->{'texi'}:\n";
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
        print STDERR "  TOP($toplevel) " if ($element->{'top'});
        print STDERR "  u: $element->{'up'}->{'texi'}\n" if (defined($element->{'up'}));
        print STDERR "  ch: $element->{'child'}->{'texi'}\n" if (defined($element->{'child'}));
        print STDERR "  fb: $element->{'fastback'}->{'texi'}\n" if (defined($element->{'fastback'}));
        print STDERR "  b: $element->{'back'}->{'texi'}\n" if (defined($element->{'back'}));
        print STDERR "  p: $element->{'prev'}->{'texi'}\n" if (defined($element->{'prev'}));
        print STDERR "  n: $element->{'next'}->{'texi'}\n" if (defined($element->{'next'}));
        print STDERR "  n_u: $element->{'nodeup'}->{'texi'}\n" if (defined($element->{'nodeup'}));
        print STDERR "  f: $element->{'forward'}->{'texi'}\n" if (defined($element->{'forward'}));
        print STDERR "  follow: $element->{'following'}->{'texi'}\n" if (defined($element->{'following'}));
	print STDERR "  m_p: $element->{'menu_prev'}->{'texi'}\n" if (defined($element->{'menu_prev'}));
	print STDERR "  m_n: $element->{'menu_next'}->{'texi'}\n" if (defined($element->{'menu_next'}));
	print STDERR "  m_u: $element->{'menu_up'}->{'texi'}\n" if (defined($element->{'menu_up'}));
	print STDERR "  m_ch: $element->{'menu_child'}->{'texi'}\n" if (defined($element->{'menu_child'}));
	print STDERR "  u_e: $element->{'element_up'}->{'texi'}\n" if (defined($element->{'element_up'}));
	print STDERR "  n_e: $element->{'element_next'}->{'texi'}\n" if (defined($element->{'element_next'}));
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
                print STDERR "${beginning}$node->{'texi'}\n";
            }
        }
        print STDERR "  places: $element->{'place'}\n";
        foreach my $place(@{$element->{'place'}})
        {
            if ($place->{'entry'})
            {
                print STDERR "    index($place): $place->{'entry'}\n";
            }
            elsif ($place->{'anchor'})
            {
                print STDERR "    anchor: $place->{'texi'}\n";
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
                    print "'$page->{'element'}->{'texi'}': $page->{'page'} ";
                }
                print STDERR "\n";
            }
        }
    }
}

# find parent element which is a top element, or a node within the top section
sub get_top($)
{
   my $element = shift;
   my $up = $element;
   while (!$up->{'toplevel'} and !$up->{'top'})
   {
       $up = $up->{'element_up'};
       if (!defined($up))
       {
           # If there is no section, it is normal not to have toplevel element
           print STDERR "$WARN no toplevel for $element->{'texi'}\n" if (@sections_list);
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
    return $element->{'node_ref'} if ($element->{'node_ref'} and !$element->{'node_ref'}->{'element_added'});
    return $element;
}
# get the html names from the texi for all elements
sub do_names()
{
    # for nodes and anchors we haven't any state defined
    # This seems right, however, as we don't want @refs or @footnotes
    # or @anchors within nodes, section commands or anchors.
    foreach my $node (%nodes)
    {
        next if ($nodes{$node}->{'index_page'}); # some nodes are index pages.
        $nodes{$node}->{'text'} = substitute_line ($nodes{$node}->{'texi'});
        $nodes{$node}->{'name'} = $nodes{$node}->{'text'};
        $nodes{$node}->{'no_texi'} = &$t2h_protect_html(remove_texi($nodes{$node}->{'texi'}));
	if ($nodes{$node}->{'external_node'})
        {
            $nodes{$node}->{'file'} = do_external_ref($node);
        }
    }
    foreach my $number (keys(%sections))
    {
        my $section = $sections{$number};
        $section->{'name'} = substitute_line ($section->{'texi'});
        $section->{'text'} = $section->{'number'} . " " . $section->{'name'};
        $section->{'text'} =~ s/^\s*//;
        $section->{'no_texi'} = &$t2h_protect_html($section->{'number'} . " " .remove_texi($section->{'texi'}));
        $section->{'no_texi'} =~ s/^\s*//;
    }
    foreach my $element (@elements_list)
    {
        next if (defined($element->{'text'}));
        if ($element->{'index_page'})
        {
            my $page = $element->{'page'};
            my $sec_name = $element->{'element_ref'}->{'text'};
            $element->{'text'} = ($page->{First} ne $page->{Last} ?
                "$sec_name: $page->{First} -- $page->{Last}" :
                "$sec_name: $page->{First}");
            $sec_name = $element->{'element_ref'}->{'no_texi'};
	    #$sec_name = $element->{'element_ref'}->{'number'} . " " .$sec_name if (defined($element->{'element_ref'}->{'number'}));
	    #$sec_name =~ s/^\s*//;
            $element->{'no_texi'} = &$t2h_protect_html($page->{First} ne $page->{Last} ?
                "$sec_name: $page->{First} -- $page->{Last}" :
                "$sec_name: $page->{First}");
        }
    }
}

@T2H_TOC_LINES = ();            # table of contents
@T2H_STOC_LINES = ();           # short table of contents



#+++############################################################################
#                                                                              #
# Stuff related to Index generation                                            #
#                                                                              #
#---############################################################################

sub enter_index_entry($$$$$$)
{
    my $prefix = shift;
    my $key = shift;
    my $place = shift;
    my $element = shift;
    my $use_section_id = shift;
    my $in_pre = shift;
    unless (exists ($index_properties->{$prefix}))
    {
        warn "$ERROR Undefined index command: ${prefix}index\n";
        return 0;
    }
    unless (defined($element))
    {
        warn "$WARN Index entry before document: \@${prefix}index $key\n"; 
        return 0; 
    }
    $key =~ s/\s+$//;
    $key =~ s/^\s*//;
    # done later, during index writing.
    #my $entry = substitute_line($key);
    my $entry = $key;
    # The $key is only usefull for alphabetical sorting
    $key = remove_texi($key);
    return if ($key =~ /^\s*$/);
    while (exists $index->{$prefix}->{$key})
    {
        $key .= ' ';
    }
    my $id = '';
    unless ($use_section_id)
    {
        $id = 'IDX' . ++$idx_num;
    }
    $index->{$prefix}->{$key}->{'entry'} = $entry;
    $index->{$prefix}->{$key}->{'element'} = $element;
    $index->{$prefix}->{$key}->{'label'} = $id;
    push @$place, $index->{$prefix}->{$key};
    print STDERR "# enter ${prefix}index '$key' with id $id ($index->{$prefix}->{$key})\n"
        if ($T2H_DEBUG & $DEBUG_INDEX);
    push @index_labels, $index->{$prefix}->{$key};
    return $index->{$prefix}->{$key};
}

# returns prefix of @?index command associated with 2 letters prefix name
# for example returns 'c' for 'cp'
sub IndexName2Prefix
{
    my $name = shift;
    my $prefix;

    for $prefix (keys %$index_properties)
    {
        return $prefix if ($index_properties->{$prefix}->{name} eq $name);
    }
    return undef;
}

# get all the entries (for all the prefixes) in the $normal and $code 
# references, formatted with @code{code } if it is a $code entry.
sub GetIndexEntries($$)
{
    my $normal = shift;
    my $code = shift;
    my $entries = {};
    foreach my $prefix (keys %$normal)
    {
        for my $key (keys %{$index->{$prefix}})
        {
            $entries->{$key} = $index->{$prefix}->{$key};
        }
    }

    if (defined($code))
    {
        foreach my $prefix (keys %$code)
        {
            unless (exists $normal->{$prefix})
            {
                foreach my $key (keys %{$index->{$prefix}})
                {
                    $entries->{$key} = $index->{$prefix}->{$key};
		    # use @code for code style index entry
                    $entries->{$key}->{entry} = "\@code{$entries->{$key}->{entry}}";
                }
            }
        }
    }
    return $entries;
}

# sort according to cmp if both $a and $b are alphabetical or non alphabetical, 
# otherwise the alphabetical is ranked first
sub byAlpha
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
# {First}            first letter on that page
# {Last}             last letter on that page
# {Letters}          ref on an array with all the letters for that page
# {EntriesByLetter}  ref on a hash. Each key is a letter, with value
#                    a ref on arrays of index entries begining with this letter
sub GetIndexPages($)
{
    my $entries = shift;
    my (@Letters);
    my ($EntriesByLetter, $Pages, $page) = ({}, [], {});
    my @keys = sort byAlpha keys %$entries;

    # each index entry is placed according to its first letter in
    # EntriesByLetter
    for my $key (@keys)
    {
        push @{$EntriesByLetter->{uc(substr($key,0, 1))}} , $entries->{$key};
    }
    @Letters = sort byAlpha keys %$EntriesByLetter;
    $T2H_SPLIT_INDEX = 0 unless $T2H_SPLIT;

    if ($T2H_SPLIT_INDEX and $T2H_SPLIT_INDEX =~ /^\d+$/)
    {
        my $i = 0;
        my ($prev_letter);
        for my $letter (@Letters)
        {
            if ($i > $T2H_SPLIT_INDEX)
            {
                $page->{Last} = $prev_letter;
                push @$Pages, $page;
                $i=0;
            }
	    if ($i == 0)
	    {
		$page = {};
		$page->{Letters} = [];
		$page->{EntriesByLetter} = {};
		$page->{First} = $letter;
	    }
            push @{$page->{Letters}}, $letter;
            $page->{EntriesByLetter}->{$letter} = [@{$EntriesByLetter->{$letter}}];
            $i += scalar(@{$EntriesByLetter->{$letter}});
            $prev_letter = $letter;
        }
        $page->{Last} = $Letters[$#Letters];
        push @$Pages, $page;
    }
    else
    {
        warn "$WARN Bad T2H_SPLIT_INDEX: $T2H_SPLIT_INDEX\n" if ($T2H_SPLIT_INDEX);
        $page->{First} = $Letters[0];
        $page->{Last} = $Letters[$#Letters];
        $page->{Letters} = \@Letters;
        $page->{EntriesByLetter} = $EntriesByLetter;
        push @$Pages, $page;
        return $Pages;
    }
    return $Pages;
}

sub GetIndex($)
{
    my $name = shift;
    return (@{$indices{$name}}) if ($indices{$name});
    my $prefix = IndexName2Prefix($name);
    unless ($prefix)
    {
        warn "$ERROR Bad index name: $name\n";
        return;
    }
    if ($index_properties->{$prefix}->{code})
    {
        $index_properties->{$prefix}->{from_code}->{$prefix} = 1;
    }
    else
    {
        $index_properties->{$prefix}->{from}->{$prefix}= 1;
    }

    my $Entries = GetIndexEntries($index_properties->{$prefix}->{from},
                                  $index_properties->{$prefix}->{from_code});
    return unless %$Entries;
    my $Pages = GetIndexPages($Entries);
    $indices{$name} = [ $Pages, $Entries ];
    return ($Pages, $Entries);
}

my @foot_lines = ();           # footnotes
my $copying_comment = '';      # comment constructed from text between
                               # @copying and @end copying with licence

sub initialise_state($)
{
    my $state = shift;
    $state->{'preformatted'} = 0 unless exists($state->{'preformatted'}); 
    $state->{'keep_texi'} = 0 unless exists($state->{'keep_texi'});
    $state->{'format_stack'} = [ {'format' => "noformat"} ] unless exists($state->{'format_stack'});
    $state->{'paragraph_style'} = [ '' ] unless exists($state->{'paragraph_style'}); 
    $state->{'preformatted_stack'} = [ '' ] unless exists($state->{'preformatted_stack'}); 
    $state->{'menu'} = 0 unless exists($state->{'menu'}); 
}

sub pass_text()
{
    my %state;
    initialise_state (\%state);
    my @stack;
    my $text;
    my $doc_nr;
    my $in_doc = 0;
    my $element;
    my @text_lines = @doc_lines;
    my @text =();
    my @section_lines = ();
    my @head_lines = ();
    my $one_section = 1 if (@elements_list == 1);
    my $FH;

    if (@elements_list == 0)
    {
        warn "$WARN empty document\n";
        exit (0);
    }

    # prepare %T2H_THISDOC
    $T2H_THISDOC{'fulltitle'} = substitute_line($value{'_title'}) || substitute_line($value{'_settitle'}) || "Untitled Document";
    $T2H_THISDOC{'title'} = substitute_line($value{'_settitle'}) || $T2H_THISDOC{'fulltitle'};
    $T2H_THISDOC{'author'} = substitute_line($value{'_author'});
    $T2H_THISDOC{'subtitle'} =  substitute_line($value{'_subtitle'});
    $T2H_THISDOC{'shorttitle'} =  substitute_line($value{'_shorttitle'});
    $T2H_THISDOC{'title_no_texi'} = &$t2h_protect_html(remove_texi($value{'_settitle'})) || &$t2h_protect_html(remove_texi($value{'_title'})) || "Untitled Document";
    $T2H_THISDOC{'shorttitle_no_texi'} =  &$t2h_protect_html(remove_texi($value{'_shorttitle'}));
    for my $key (keys %T2H_THISDOC)
    {
        $T2H_THISDOC{$key} =~ s/\s*$//;
    }
    $T2H_THISDOC{'program'} = $THISPROG;
    $T2H_THISDOC{'program_homepage'} = $T2H_HOMEPAGE;
    $T2H_THISDOC{'program_authors'} = $T2H_AUTHORS;
    $T2H_THISDOC{'today'} = $T2H_TODAY;
    $T2H_THISDOC{'copying'} = $copying_comment;
    
    # prepare TOC, OVERVIEW
    $T2H_TOC = \@T2H_TOC_LINES;
    $T2H_OVERVIEW = \@T2H_STOC_LINES;
    if ($T2H_SPLIT)
    {
        $T2H_HREF{'Contents'} = $docu_toc.'#SEC_Contents' if @T2H_TOC_LINES;
        $T2H_HREF{'Overview'} = $docu_stoc.'#SEC_Overview' if @T2H_STOC_LINES;
        $T2H_HREF{'Footnotes'} = $docu_foot. '#SEC_Foot';
        $T2H_HREF{'About'} = $docu_about . '#SEC_About' unless $one_section;
    }
    else
    {
        $T2H_HREF{'Contents'} = '#SEC_Contents' if @T2H_TOC_LINES;
        $T2H_HREF{'Overview'} = '#SEC_Overview' if @T2H_STOC_LINES;
        $T2H_HREF{'Footnotes'} = '#SEC_Foot';
        $T2H_HREF{'About'} = '#SEC_About' unless $one_section;
    }
    
    my $top_text = '';
    if ($element_top and $element_top->{'text'})
    {
        $top_text = $element_top->{'text'};
    }
    %T2H_NAME =
        (
         'First',   $element_first->{'text'},
         'Last',    $element_last->{'text'},
         'About',    $T2H_WORDS->{'About_Title'},
         'Contents', $T2H_WORDS->{'ToC_Title'},
         'Overview', $T2H_WORDS->{'Overview_Title'},
         'Top',      $T2H_TOP_HEADING || $top_text || $T2H_THISDOC{'title'} || $T2H_THISDOC{'shorttitle'},
         'Footnotes', $T2H_WORDS->{'Footnotes_Title'},
        );
    $T2H_NAME{'Index'} = $element_chapter_index->{'text'} if (defined($element_chapter_index));
    
    my $top_no_texi = '';
    if ($element_top and $element_top->{'no_texi'})
    {
        $top_text = $element_top->{'no_texi'};
    }
    %T2H_NO_TEXI =
        (
         'First',   $element_first->{'no_texi'},
         'Last',    $element_last->{'no_texi'},
         'About',    $T2H_WORDS->{'About_Title'},
         'Contents', $T2H_WORDS->{'ToC_Title'},
         'Overview', $T2H_WORDS->{'Overview_Title'},
         'Top',      $T2H_TOP_HEADING || $top_no_texi || $T2H_THISDOC{'title_no_texi'} || $T2H_THISDOC{'shorttitle_no_texi'},
         'Footnotes', $T2H_WORDS->{'Footnotes_Title'},
        );
    $T2H_NO_TEXI{'Index'} = $element_chapter_index->{'no_texi'} if (defined($element_chapter_index));

    ############################################################################
    # print frame and frame toc file
    #
    if ( $T2H_FRAMES )
    {
        open(FILE, "> $docu_frame_file")
            || die "$ERROR: Can't open $docu_frame_file for writing: $!\n";
        print STDERR "# Creating frame in $docu_frame_file ...\n" if $T2H_VERBOSE;
        &$T2H_print_frame(\*FILE, $docu_toc_frame_file, $docu_top_file);
        close(FILE);

        open(FILE, "> $docu_toc_frame_file")
            || die "$ERROR: Can't open $docu_toc_frame_file for writing: $!\n";
        print STDERR "# Creating toc frame in $docu_frame_file ...\n" if $T2H_VERBOSE;
        &$T2H_print_toc_frame(\*FILE, \@T2H_STOC_LINES);
        close(FILE);
    }

    ############################################################################
    # Monolithic beginning.
    #

    my $index_pages;
    my $index_pages_nr;
    my $index_nr = 0;
    while (@text_lines)
    {
        $_ = shift @text_lines unless $index_pages;
	#print STDERR "PASS_TEXT: $_";
        unless ($in_doc)
        {
            if (/^\@(\w+)/)
            { 
                if (defined($sec2level{$1}) or ($1 eq 'node'))
                {
                    $in_doc = 1;
                }
            }
            next unless ($in_doc);
        }
        if (!$state{'raw'} and !$state{'verb'})
        {
            my $tag = '';
            $tag = $1 if (/^\@(\w+)/ and !$index_pages);

            if (($tag eq 'node') or defined($sec2level{$tag}) or $index_pages)
            {
                if (@stack)
                {
                    close_stack(\$text, \@stack, \%state);
                    push @section_lines, $text;
                    $text = '';
                }
                $sec_num++ if ($sec2level{$tag});
                my $new_element;
                my $current_element;
                # headings are not in element lists
                if ($tag =~ /heading/)
                {
                    $current_element = $sections{$sec_num};
		    #print STDERR "HEADING $_";
                    if (! $element)
                    {
                        $new_element = shift @elements_list;
                        $element->{'has_heading'} = 1 if ($new_element->{'top'});
                    }
		    else
                    {
                        if ($element->{'top'})
                        {
                            $element->{'has_heading'} = 1;
                        }
                        push (@section_lines, &$t2h_anchor($current_element->{'id'}) . "\n");
                        push @section_lines, &$t2h_heading($current_element);
                        next;
                    }
                }
                elsif (!$index_pages)
                {
                    $current_element = shift (@all_elements);
                    if ($current_element->{'node'})
                    {
		         print STDERR 'NODE ' . $current_element->{'texi'} if ($T2H_DEBUG & $DEBUG_ELEMENTS);
			 print STDERR "($current_element->{'section_ref'}->{'texi'})" if ($current_element->{'section_ref'} and $T2H_DEBUG & $DEBUG_ELEMENTS);;
                    }
                    else
                    {
			 print STDERR 'SECTION ' . $current_element->{'texi'} if ($T2H_DEBUG & $DEBUG_ELEMENTS);
                    }
		    print STDERR ": $_" if ($T2H_DEBUG & $DEBUG_ELEMENTS);
		    # The element begins a new section if there is no previous
                    # or it is an element and not the current one or the 
                    # associated section (in case of node) is not the current one
                    if (!$element 
                      or ($current_element->{'element'} and ($current_element ne $element))
                      or ($current_element->{'section_ref'} and ($current_element->{'section_ref'} ne $element)))
                    {
                         $new_element = shift @elements_list;
                    }
                    my $section_element = $new_element;
                    $section_element = $element unless ($section_element);
                    if (!$current_element->{'node'} and !$current_element->{'index_page'} and ($section_element ne $current_element))
                    {
                         print STDERR "NODE: $element->{'texi'}\n" if ($element->{'node'});
                         warn "elements_list and all_elements not in sync (elements $section_element->{'texi'}, all $current_element->{'texi'}): $_";
                    }
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
                    if ($element and ($new_element->{'doc_nr'} != $element->{'doc_nr'}) and @foot_lines and !$T2H_SEPARATED_FOOTNOTES)
                    { # note that this can only happen if $T2H_SPLIT
                        &$t2h_foot_section (\@foot_lines);
                        push @section_lines, @foot_lines;
                        @foot_lines = ();
                        $relative_foot_num = 0;
                    }
                    # print the element that just finished
                    $T2H_THIS_SECTION = \@section_lines;
                    $T2H_THIS_HEADER = \@head_lines;
		    #print STDERR "LINES: @section_lines";
                    if ($element and $element->{'top'})
                    {
                        my $top_file = $docu_top_file;
                        if ($T2H_SPLIT)
                        {
                            my $top_file = $docu_rdir . $element->{'file'};
                            open(FILE, "> $top_file")
                                || die "$ERROR: Can't open $top_file for writing: $!\n";
                            $FH = \*FILE;
                        }
                        #print STDERR "TOP $element->{'texi'}, @section_lines\n";
                        print STDERR "[Top]" if ($T2H_VERBOSE);
                        $T2H_HREF{'Top'} = href($element_top, $element->{'file'});
                        &$T2H_print_Top($FH, $element->{'has_heading'});

                        if ($T2H_SPLIT)
                        {
                            close($FH)
                                || die "$ERROR: Error occurred when closing $top_file: $!\n";
                            undef $FH;
                        }
                    }
                    elsif ($element)
                    {
                        &$T2H_print_section($FH);
                        if ($new_element->{'doc_nr'} != $element->{'doc_nr'})
                        {
                            &$T2H_print_chapter_footer($FH) if $T2H_SPLIT eq 'chapter';
                            &$T2H_print_section_footer($FH) if $T2H_SPLIT eq 'section';
			    #print STDERR "Close file after $element->{'texi'}\n";
                            &$T2H_print_page_foot($FH);
                            close($FH);
                            undef $FH;
                        }
                    }
                    # begin new element
                    print STDERR "# Writing elements:" if (! defined($element) and $T2H_VERBOSE);
                    $element = $new_element;
                    $state{'element'} = $element;
		    #print STDERR "Doing hrefs for $element->{'texi'} First ";
                    $T2H_HREF{'First'} = href($element_first, $element->{'file'});
		    #print STDERR "Last ";
                    $T2H_HREF{'Last'} = href($element_last, $element->{'file'});
		    #print STDERR "Index ";
                    $T2H_HREF{'Index'} = href($element_chapter_index, $element->{'file'}) if (defined($element_chapter_index));
		    #print STDERR "Top ";
                    $T2H_HREF{'Top'} = href($element_top, $element->{'file'});
                    foreach my $direction (('Up', 'Forward', 'Back', 'Next', 
                        'Prev', 'FastForward', 'FastBack', 'This', 'NodeUp', 
                        'NodePrev', 'NodeNext', 'Following' ))
                    {
                        my $elem = $element->{$direction};
                        $T2H_NODE{$direction} = undef;
                        $T2H_HREF{$direction} = undef;
                        next unless (defined($elem));
			#print STDERR "$direction ";
                        if ($elem->{'node'} or $elem->{'external_node'} or $elem->{'index_page'})
                        {
                            $T2H_NODE{$direction} = $elem->{'text'};
                        }
                        elsif ($elem->{'node_ref'})
                        {
                            $T2H_NODE{$direction} = $elem->{'node_ref'}->{'text'};
                        }
                        if ($elem->{'menu_node'} and ! $elem->{'seen'})
                        {
                            $T2H_HREF{$direction} = '';
                        }
                        elsif ($elem->{'external_node'})
                        {
                            $T2H_HREF{$direction} = $elem->{'file'};
                        }
                        else
                        {
                            $T2H_HREF{$direction} = href($elem, $element->{'file'});
                        }
                        $T2H_NAME{$direction} = $elem->{'text'};
                        $T2H_NO_TEXI{$direction} = $elem->{'no_texi'};
                    }   
		    #print STDERR "\nDone hrefs for $element->{'texi'}\n";
                    if (! defined($FH))
                    {
                        my $file = $element->{'file'};
			#print STDERR "Open file for $element->{'texi'}\n";
                        open(FILE, "> $docu_rdir$file") ||
                        die "$ERROR: Can't open $docu_rdir$file for writing: $!\n";
                        print "\n" if ($T2H_VERBOSE and !$T2H_DEBUG);
                        print STDERR "# Writing to $docu_rdir$file " if $T2H_VERBOSE;
                        $FH = \*FILE;
                        &$T2H_print_page_head($FH);
                        &$T2H_print_chapter_header($FH) if $T2H_SPLIT eq 'chapter';
                    }
                    print STDERR "." if ($T2H_VERBOSE);
                    print STDERR "\n" if ($T2H_DEBUG);
                    @section_lines = ();
                    @head_lines = ();
                }
                my $label = &$t2h_anchor($current_element->{'id'}) . "\n";
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
                    push @section_lines, &$t2h_heading($element);
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
                push @section_lines, &$t2h_heading($current_element) if ($current_element->{'element'} and !$current_element->{'top'});
                next;
            }
            elsif ($tag eq 'printindex')
            {
                s/\s+(\w+)\s*//;
                my $name = $1;
		print STDERR "print index $name($index_nr) in `$element->{'texi'}', element->{'indices'}: $element->{'indices'},\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS or $T2H_DEBUG & $DEBUG_INDEX);
		print STDERR "element->{'indices'}->[index_nr]: $element->{'indices'}->[$index_nr] (@{$element->{'indices'}->[$index_nr]})\n" if ($T2H_DEBUG & $DEBUG_ELEMENTS or $T2H_DEBUG & $DEBUG_INDEX);
                close_stack(\$text, \@stack, \%state, '');
		#close_paragraph (\$text, \@stack, \%state, '');
                close_paragraph (\$text, \@stack, \%state);
                next unless (IndexName2Prefix($name));
                $index_pages = $element->{'indices'}->[$index_nr] if (@{$element->{'indices'}->[$index_nr]} > 1);
                $index_pages_nr = 0;
                add_prev(\$text, \@stack, do_index_page($element->{'indices'}->[$index_nr], 0));  
                $index_pages_nr++;
		#print STDERR "index_pages $index_pages\n" if defined($index_pages);
                $index_nr++;
                begin_paragraph (\@stack, \%state) if ($state{'preformatted'});
                next if (@stack);
                push @section_lines, $text;
                $text = '';
                next;
            }
            elsif ($tag eq 'contents')
            {
                next;
            }
        }
        scan_line ($_, \$text, \@stack, \%state);
        next if (@stack);
        push @section_lines, $text;
        $text = '';
    }
    if (@stack)
    {
        close_stack(\$text, \@stack, \%state);
        push @section_lines, $text;
    }
    print STDERR "\n" if ($T2H_VERBOSE);
    $T2H_THIS_SECTION = \@section_lines;
    # if no sections, then simply print document as is
    if ($one_section)
    {
        if (@foot_lines)
        {
            &$t2h_foot_section (\@foot_lines);
            push @section_lines, @foot_lines;
        }
        $T2H_THIS_HEADER = \@head_lines;
        if ($element->{'top'})
        {
            print STDERR "Bug: `$element->{'texi'}' level undef\n" if (!$element->{'node'} and !defined($element->{'level'}));
            $element->{'level'} = 1 if (!defined($element->{'level'}));
            $element->{'node'} = 0; # otherwise t2h_heading may uses the node level
            $element->{'text'} = $T2H_NAME{'Top'};
            print STDERR "[Top]" if ($T2H_VERBOSE);
            unless ($element->{'has_heading'})
            {
                unshift @section_lines, &$t2h_heading($element);
            }
        }
        print STDERR "# Write the section $element->{'texi'}\n" if ($T2H_VERBOSE);
        t2h_print_lines($FH);
        &$T2H_print_foot_navigation($FH);
        &$T2H_print_page_foot($FH);
        close($FH);
        return;
    }
    &$T2H_print_section($FH);
    if ($T2H_SPLIT)
    {
        &$T2H_print_chapter_footer($FH) if $T2H_SPLIT eq 'chapter';
        &$T2H_print_page_foot($FH);
        close($FH);
    }

    ############################################################################
    # Print ToC, Overview, Footnotes
    #
    for my $direction (('Prev', 'Next', 'Back', 'Forward', 'Up', 'NodeUp', 
        'NodePrev', 'NodeNext', 'Following', 'This'))
    {
        delete $T2H_HREF{$direction};
        # it is better to undef in case the references to these hash entries
        # are used, as if deleted, the
        # references are still refering to the old, undeleted element
        # (we could do both)
        $T2H_NAME{$direction} = undef;
        $T2H_NO_TEXI{$direction} = undef;
        $T2H_NODE{$direction} = undef;
    }
    if (@foot_lines)
    {
        print STDERR "# writing Footnotes in $docu_foot_file\n" if $T2H_VERBOSE;
        open (FILE, "> $docu_foot_file") || die "$ERROR: Can't open $docu_foot_file for writing: $!\n"
            if $T2H_SPLIT;
        $T2H_HREF{This} = $T2H_HREF{Footnotes};
        $T2H_HREF{Footnotes} = '#' . $footnote_element->{'id'};
        $T2H_NAME{This} = $T2H_NAME{Footnotes};
        $T2H_NO_TEXI{This} = $T2H_NO_TEXI{Footnotes};
        $T2H_THIS_SECTION = \@foot_lines;
        $T2H_THIS_HEADER = [ &$t2h_anchor($footnote_element->{'id'}) . "\n" ];
        &$T2H_print_Footnotes(\*FILE);
        close(FILE) if $T2H_SPLIT;
        $T2H_HREF{Footnotes} = $T2H_HREF{This};
    }

    if (@T2H_TOC_LINES)
    {
        print STDERR "# writing Toc in $docu_toc_file\n" if $T2H_VERBOSE;
        open (FILE, "> $docu_toc_file") || die "$ERROR: Can't open $docu_toc_file for writing: $!\n"
            if $T2H_SPLIT;
        $T2H_HREF{This} = $T2H_HREF{Contents};
        $T2H_HREF{Contents} = "#SEC_Contents";
        $T2H_NAME{This} = $T2H_NAME{Contents};
        $T2H_NO_TEXI{This} = $T2H_NO_TEXI{Contents};
        $T2H_THIS_SECTION = \@T2H_TOC_LINES;
        $T2H_THIS_HEADER = [ &$t2h_anchor("SEC_Contents") . "\n" ];
        &$T2H_print_Toc(\*FILE);
        close(FILE) if $T2H_SPLIT;
        $T2H_HREF{Contents} = $T2H_HREF{This};
    }

    if (@T2H_STOC_LINES)
    {
        print STDERR "# writing Overview in $docu_stoc_file\n" if $T2H_VERBOSE;
        open (FILE, "> $docu_stoc_file") || die "$ERROR: Can't open $docu_stoc_file for writing: $!\n"
            if $T2H_SPLIT;
        $T2H_HREF{This} = $T2H_HREF{Overview};
        $T2H_HREF{Overview} = "#SEC_Overview";
        $T2H_NAME{This} = $T2H_NAME{Overview};
        $T2H_NO_TEXI{This} = $T2H_NO_TEXI{Overview};
        $T2H_THIS_SECTION = \@T2H_STOC_LINES;
        $T2H_THIS_HEADER = [ &$t2h_anchor("SEC_Overview") . "\n" ];
        &$T2H_print_Overview(\*FILE);
        close(FILE) if $T2H_SPLIT;
        $T2H_HREF{Overview} = $T2H_HREF{This};
    }
    my $about_body;
    if ($about_body = &$T2H_about_body())
    {
        print STDERR "# writing About in $docu_about_file\n" if $T2H_VERBOSE;
        open (FILE, "> $docu_about_file") || die "$ERROR: Can't open $docu_about_file for writing: $!\n"
            if $T2H_SPLIT;

        $T2H_HREF{This} = $T2H_HREF{About};
        $T2H_HREF{About} = "#SEC_About";
        $T2H_NAME{This} = $T2H_NAME{About};
        $T2H_NO_TEXI{This} = $T2H_NO_TEXI{About};
        $T2H_THIS_SECTION = [$about_body];
        $T2H_THIS_HEADER = [ &$t2h_anchor("SEC_About") . "\n" ];
        &$T2H_print_About(\*FILE);
        $T2H_HREF{About} = $T2H_HREF{This};
        close(FILE) if $T2H_SPLIT;
    }

    unless ($T2H_SPLIT)
    {
        &$T2H_print_page_foot(\*FILE);
        close (FILE);
    }
}

# write to files with name the node name for cross manual references.
sub do_node_files()
{
    foreach my $key (keys(%nodes))
    {
        my $node = $nodes{$key};
        next unless ($node->{'node_file'});
        my $file = "${docu_rdir}$node->{'node_file'}";
        $T2H_NODE{'This'} = $node->{'text'};
        $T2H_NO_TEXI{'This'} = $node->{'no_texi'};
        $T2H_NAME{'This'} = $node->{'text'};
        my $redirection_file = $docu_doc;
        $redirection_file = $node->{'file'} if ($T2H_SPLIT);
        print STDERR "Bug: file for redirection for `$node->{'texi'}' don't exist\n" if (!$redirection_file);
        $T2H_HREF{'This'} = "$node->{'file'}#$node->{'id'}";
        open (NODEFILE, "> $file") || die "$ERROR: Can't open $file for writing: $!\n";
        &$T2H_print_redirection_page (\*NODEFILE);
        close NODEFILE || die "$ERROR: Can't close $file: $!\n";
    }
}

#+++############################################################################
#                                                                              #
# Low level functions                                                          #
#                                                                              #
#---############################################################################

sub LocateIncludeFile($)
{
    my $file = shift;

    # APA: Don't implicitely search ., to conform with the docs!
    # return $file if (-e $file && -r $file);
    foreach my $dir (@T2H_INCLUDE_DIRS)
    {
        return "$dir/$file" if (-e "$dir/$file" && -r "$dir/$file");
    }
    return undef;
}

sub open_file($)
{
    my $name = shift;

    ++$fh_name;
    no strict "refs";
    if (open($fh_name, $name))
    {
        unshift(@fhs, $fh_name);
    }
    else
    {
        warn "$ERROR Can't read file $name: $!\n";
    }
    use strict "refs";
}

sub next_line
{
    my($fh, $line);

    if (@input_spool)
    {
        $line = shift(@input_spool);
        print STDERR "# unspooling $line" if ($T2H_DEBUG & $DEBUG_MACROS);
        return($line);
    }
    while (@fhs)
    {
        $fh = $fhs[0];
        no strict "refs";
        $line = <$fh>;
        use strict "refs";
        return($line) if $line;
        no strict "refs";
        close($fh);
        use strict "refs";
        shift(@fhs);
    }
    return(undef);
}

# to debug, dump the result of pass_texi and pass_structure in a file
sub dump_texi($$)
{
    my $lines = shift;
    my $pass = shift;
    unless (open(DMPTEXI, ">$docu_rdir$docu_name" . ".pass$pass"))
    {
         warn "Can't open > $docu_rdir$docu_name" . ".pass$pass for writing: $!\n";
    }
    print STDERR "# Dump texi\n";
    foreach my $line (@$lines)
    {
        print DMPTEXI $line;
    }
    close DMPTEXI;
}
 
# return next tag on the line
sub next_tag ($)
{
    my $line = shift;
    if ($line =~ /^\s*\@(\w+)\s/ or $line =~ /^\s*\@(\w+)$/)
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
sub next_bracketed ($)
{
    my $line = shift;
    my $opened_braces = 0;
    my $result = '';
    while ($line !~ /^\s*$/)
    {
        if (!$opened_braces)
        {
            $line =~ s/^\s*//;
            if ($line =~ s/^([^\{\}\s]+)//)
            {
                my $text = $1;
                $text =~ s/\s*$//;
                return ($text, $line);
            }
        }
        elsif($line =~ s/^([^\{\}]+)//)
        {
            $result .= $1;
        }
        if ($line =~ s/^(\{|\})//)
        {
            my $brace = $1;
            $opened_braces++ if ($brace eq '{');
            $opened_braces-- if ($brace eq '}');
    
            if ($opened_braces < 0)
            {
                warn "$ERROR too much '}' in specification";
                $opened_braces = 0;
                next;
            }
            $result .= $brace;
            return ($result, $line) if ($opened_braces == 0);
        }
    }
    if ($opened_braces)
    {
        warn "$ERROR '{' not closed in specification";
        return ($result . ( '}' x $opened_braces));
    }
    return undef;
}

# do a href using file and id and taking care of ommitting file if it is 
# the same
sub href($$)
{
    my $element = shift;
    my $file = shift;
    return '' unless defined($element);
    my $href = '';
    $href .= $element->{'file'} if ($file ne $element->{'file'});
    print STDERR "Bug: $element->{'texi'}, id undef\n" if (!defined($element->{'id'}));
    return $href . "#$element->{'id'}";
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

sub do_math($;$)
{
    return l2h_ToLatex("\$".$_[0]."\$");
}

sub do_anchor_label($)
{
    my $anchor = shift;
    $anchor = normalise_node($anchor);
    return &$t2h_anchor($nodes{$anchor}->{'id'});
}


sub do_paragraph($$)
{
    my $text = shift;
    my $state = shift;
    delete $state->{'paragraph'};
    $state->{'paragraph_nr'}--;
    (print STDERR "Bug text undef in do_paragraph", return '') unless defined($text);
    my $align = '';
    $align = $state->{'paragraph_style'}->[-1] if ($state->{'paragraph_style'}->[-1]);
    return &$t2h_paragraph($text, $align);
}

sub do_preformatted($$)
{
    my $text = shift;
    my $state = shift;

    my $pre_style = '';
    $pre_style = $state->{'preformatted_stack'}->[-1] if ($state->{'preformatted_stack'}->[-1]);
    return &$t2h_preformatted($text, $pre_style);
}

sub do_external_ref($)
{
    my $node = shift;
    $node =~ s/^\((.+?)\)//;
    my $file = $1 . "/";
    $file = $T2H_EXTERNAL_DIR . $file if ($T2H_EXTERNAL_DIR);
    return $file unless ($node);
    $node = normalise_node($node);
    $node = remove_texi($node);
    $node =~ s/[^\w\.\-]/-/g;
    $node = $T2H_TOP_NODE_FILE if ($node eq 'Top');
    return $file . $node . ".$T2H_NODE_FILE_EXTENSION";
}

# return 1 if the following tag shouldn't begin a line
sub no_line($)
{
    my $line = shift;
    my $next_tag = next_tag($line);
    return 1 if ($no_line_macros{$next_tag} or 
       ($next_tag =~ /^(\w+?)index$/ and ($1 ne 'print')) or 
       ($line =~ /^\@end\s+(\w+)/ and  $no_line_macros{"end $1"}));
    return 0;
}

# handle raw formatting, ignored regions...
sub do_text_macro($$$)
{
    my $type = shift;
    my $line = shift;
    my $state = shift;
    #print STDERR "do_text_macro $type\n";

    if (not $text_macros{$type})
    { # ignored text
        $state->{'ignored'} = $type;
        #print STDERR "IGNORED\n";
    }
    elsif ($text_macros{$type} eq 'raw' or $text_macros{$type} eq 'special')
    {
        $state->{'raw'} = $type;
        #print STDERR "RAW\n";
    }
    elsif ($text_macros{$type} eq 'value')
    {
        if ($line =~ s/\s+($VARRE)$//o or $line =~ s/\s+($VARRE)\s//o)
        {
            if ($type eq 'ifclear')
            {
                if (defined($value{$1}))
                {
                    $state->{'ignored'} = $type;
                }
                else
                {
                    push @{$state->{'text_macro_stack'}}, $type;
                }
            }
            elsif ($type eq 'ifset')
            {
                unless (defined($value{$1}))
                {
                    $state->{'ignored'} = $type;
                }
                else
                {
                    push @{$state->{'text_macro_stack'}}, $type;
                }
            }
        }
        else
        {
            warn "$ERROR Bad $type line: $line";
        }
    }
    else
    {
        push @{$state->{'text_macro_stack'}}, $type;
    }
    return $line;
}

sub save_line_state($$)
{
    my $state = shift;
    my $tag = shift;
    my $saved_state;
    $saved_state->{'empty_line'} = 1 if ($state->{'empty_line'});
    $saved_state->{'after_element'} = 1 if ($state->{'after_element'});
    $state->{"$tag" . '_line_state'} = $saved_state;
}

sub retrieve_line_state ($$)
{
    my $state = shift;
    my $tag = shift;
    my $key = "$tag" . '_line_state';
    $state->{'empty_line'} = 1;
    delete $state->{'empty_line'} unless ($state->{$key}->{'empty_line'});
    $state->{'after_element'} = 1;
    delete $state->{'after_element'} unless ($state->{$key}->{'after_element'});
    delete $state->{$key};
}

# do regions handled specially, currently only tex, going throug latex2html
sub do_special ($$)
{
    my $style = shift;
    my $text = shift;
    if ($style eq 'tex')
    {
        # add space to the end -- tex(i2dvi) does this, as well
        return (l2h_ToLatex($text . " "));
    }
}

sub do_insertcopying($)
{
    my $state = shift;
    return '' unless @copying_lines;
    return substitute_text({ 'element' => $state->{'element'}, 
           'preformatted' => $state->{'preformatted'},
           'keep_texi' => $state->{'keep_texi'} },
           @copying_lines);
}

sub get_deff_index($$)
{
    my $tag = shift;
    my $line = shift;
   
    $tag =~ s/x$// if $tag =~ /x$/;
    if (defined($def_map{$tag}) and $def_map{$tag})
    {
        # substitute shortcuts for definition commands
        my $substituted = $def_map{$tag};
        $substituted =~ s/(\w+)//;
        $tag = $1;
        $line = $substituted . $line;
    }
    my ($type, $name, $ftype);
    ($line, $type, $name, $ftype) = parse_def($tag, $line);
    my $result = '';
    my ($prefix, $entry);
    if ($tag eq 'deffn' || $tag eq 'deftypefn')
    {
        $prefix = 'f'; 
        $entry = $name;
    }
    elsif ($tag eq 'defop')
    {
        $prefix = 'f'; 
        # i18n
        $entry = "$name on $ftype";
    }
    elsif ($tag eq 'defvr' || $tag eq 'deftypevr' || $tag eq 'defcv')
    {
        $prefix = 'f'; 
        $entry = $name;
    }
    else
    {
        $prefix = 'f'; 
        $entry = $name;
    }
    return ($prefix, $entry);
}

sub parse_def($$)
{
    my $tag = shift;
    my $line = shift;
    
    my $type;
    ($type, $line) = next_bracketed($line);
    $type =~ s/^\{(.*)\}$/$1/ if ($type =~ /^\{/);
    return undef unless ($type);
    my $name;
    ($name, $line) = next_bracketed($line);
    return undef unless ($name);
    $name =~ s/^\{(.*)\}$/$1/ if ($name =~ /^\{/);
    my $ftype;
    if ($tag eq 'deftypefn' || $tag eq 'deftypevr'
        || $tag eq 'deftypeop' || $tag eq 'defcv'
        || $tag eq 'defop')
    {
        $ftype = $name;
        ($name, $line) = next_bracketed($line);
        $name =~ s/^\{(.*)\}$/$1/ if ($name =~ /^\{/);
    }
    return ($line, $type, $name, $ftype);
}

sub begin_deff_item($$;$)
{
    my $stack = shift;
    my $state = shift;
    my $no_paragraph = shift;
    #print STDERR "DEF push deff_item for $state->{'deff'}\n";
    push @$stack, { 'format' => 'deff_item', 'text' => '' };
    # there is no paragraph when a new deff just follows the deff we are
    # opening
    push @$stack, { 'format' => 'preformatted', 'text' => '' } if ($state->{'preformatted'} and !$no_paragraph);
    delete($state->{'deff'});
}

sub begin_paragraph($$)
{
    my $stack = shift;
    my $state = shift;

    if ($state->{'preformatted'})
    {
        push @$stack, {'format' => 'preformatted', 'text' => '' };
        return;
    }
    $state->{'paragraph'} = 1;
    $state->{'paragraph_nr'}++;
    push @$stack, {'format' => 'paragraph', 'text' => '' };
}

sub parse_format_command($)
{
    my $line = shift;
    my $command;
    if ($line =~ /^\s*\@(\w+)/ and ($things_map{$1} or defined($style_map{$1})))
    {
        $line =~ s/^\s*\@(\w+)(\{\})?//;
        $command = $1;
        $line =~ s/^\s*// unless ($line =~ /^\s*$/) ;
    }
    return ($line, $command);
}

sub parse_enumerate($)
{
    my $line = shift;
    my $spec;
    if ($line =~ /^\s*(\w)\b/ and ($1 ne '_'))
    {
        $spec = $1;
        $line =~ s/^\s*\@(\w)\s*//;
    }
    return ($line, $spec);
}

sub parse_multitable($)
{
    my $line = shift;
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
                warn "$ERROR column fraction not a number: $fraction";
            }
        }
    }
    else
    {
        my $element;
        my $line_orig = $line;
        while ($line !~ /^\s*$/)
        {
            ($element, $line) = next_bracketed ($line);
            if ($element =~ /^\{/)
            {
                $table_width++; 
            }
            else
            {
                warn "$ERROR garbage in multitable specification: $line_orig";
            }
        }
    }
    return ($table_width);
}

sub end_paragraph_style($$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $end_tag = shift;
    return 0 if ($format_type{$end_tag} ne 'paragraph_style');
    if ($state->{'paragraph_style'}->[-1] ne $paragraph_style{$end_tag})
    {
        warn "$WARN close $end_tag without corresponding opening element\n";
        if ($end_tag eq 'center')
        {
            dump_stack ($text, $stack, $state);
            exit (1);
        }
        add_prev($text, $stack, "\@end $end_tag");
    }
    else
    {
        pop @{$state->{'paragraph_style'}};
    }
    return 1;
}

sub end_format($$$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $format = shift;
    #print STDERR "END FORMAT $format\n";
    #dump_stack($text, $stack, $state);
    close_menu ($text, $stack, $state) if ($format_type{$format} eq 'menu');
    if (($format_type{$format} eq 'list') or ($format_type{$format} eq 'table'))
    { # those functions return if they detect an inapropriate context
        add_item($text, $stack, $state, 1); # handle lists
        add_term($text, $stack, $state, 1); # handle table
        add_line($text, $stack, $state, 1); # handle table
        add_row($text, $stack, $state); # handle multitable
    }

    my $format_ref = pop @$stack;
    
    if (!defined($format_ref->{'text'}))
    {
        push @$stack, $format_ref;
        print STDERR "Bug: text undef in end_format $format\n";
        dump_stack($text, $stack, $state);
        pop @$stack;
    }
    
    if (defined($def_map{$format}))
    {
        close_stack($text, $stack, undef, 'deff_item');
        add_prev($text, $stack, &$t2h_def_item($format_ref->{'text'}));
        $format_ref = pop @$stack;
        add_prev($text, $stack, &$t2h_def($format_ref->{'text'}));
    }
    elsif ($format_type{$format} eq 'menu')
    {
        if ($state->{'preformatted'})
        {
            # end the fake complex format
            $state->{'preformatted'}--;
            pop @{$state->{'preformatted_stack'}};
            pop @$stack;
        }
        $state->{'menu'}--;
        add_prev($text, $stack, &$t2h_menu($format_ref->{'text'}));
    }
    elsif ($format_type{$format} eq 'complex')
    {
        $state->{'preformatted'}--;
        pop @{$state->{'preformatted_stack'}};
        # debug
        if (!defined($complex_format_map->{$format_ref->{'format'}}->{'begin'}))
        {
            print STDERR "Bug undef $format_ref->{'format'}" . "->{'begin'} (for $format...)\n";
            dump_stack ($text, $stack, $state);
        }
        add_prev($text, $stack, end_complex_format($format_ref->{'format'}, $format_ref->{'text'}));
    }
    elsif (($format_type{$format} eq 'table') or ($format_type{$format} eq 'list'))
    {
	    #print STDERR "CLOSE $format ($format_ref->{'format'})\n$format_ref->{'text'}\n";
        pop @{$state->{'format_stack'}};
	#dump_stack($text, $stack, $state); 
        if ($format_map{$format})
        { # multitable has a simple format
            add_prev($text, $stack, end_simple_format($format_ref->{'format'}, $format_ref->{'text'}));
        }
        else
        { # tables other than multitables
            add_prev($text, $stack, &$t2h_table($format_ref->{'text'}));
        }
    } 
    elsif (exists($format_map{$format}))
    {
        add_prev($text, $stack, end_simple_format($format_ref->{'format'}, $format_ref->{'text'}));
    }
    # We restart the preformatted format which was stopped by the format
    # if in preformatted
    begin_paragraph($stack, $state) if ($state->{'preformatted'});
}

sub end_complex_format($$)
{
    my $tag = shift;
    my $text = shift;
    return '' unless ($text);
    my $start = eval $complex_format_map->{$tag}->{'begin'} ;
    if ($@)
    {
        warn "$ERROR: eval of complex_format_map->{$tag}->{'begin'} $complex_format_map->{$tag}->{'begin'}: $@";
        $start = '';
    }
    my $end = eval $complex_format_map->{$tag}->{'end'}; 
    if ($@)
    {
        warn "$ERROR: eval of complex_format_map->{$tag}->{'end'} $complex_format_map->{$tag}->{'end'}: $@";
        $end = '';
    }
    return $start . $text . $end;
}

sub do_text($;$)
{
    my $text = shift;
    my $state = shift;
    return $text if (defined($state) and ($state->{'keep_texi'} or $state->{'remove_texi'}));
    if (defined($state) and !$state->{'preformatted'})
    {
        $text =~ s/``/"/go;
        $text =~ s/''/"/go;
        $text =~ s/---/--/go;
    }
    return &$t2h_protect_html($text);
}

sub end_simple_format($$)
{
    my $tag = shift;
    my $text = shift;

    if ($text =~ /[^\s]/)
    {
        return "<$format_map{$tag}>\n" . $text. "</$format_map{$tag}>\n";
    }
    return '';
}

sub close_menu($$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    close_stack ($text, $stack, $state, '');
    if ($state->{'menu_comment'})
    {
	    #print STDERR "Before close_stack\n";
	    #dump_stack($text, $stack, $state);
        close_stack ($text, $stack, $state, undef, 'menu_comment');
        # close_paragraph isn't needed in most cases, but A preformatted may 
        # appear after close_stack if we closed a format, as formats reopen
        # preformatted. However it is empty and close_paragraph will remove it
        close_paragraph ($text, $stack, $state); 
        my $menu_comment = pop @$stack;
        if (!$menu_comment->{'format'} or $menu_comment->{'format'} ne 'menu_comment')
        {
            warn "Bug waiting for menu_comment, got $menu_comment->{'format'}\n"; 
            dump_stack($text, $stack, $state);
        }
        add_prev ($text, $stack, &$t2h_menu_comment($menu_comment->{'text'}));
        pop @{$state->{'preformatted_stack'}};
        $state->{'preformatted'}--;
        $state->{'menu_comment'}--;
    }
    if ($state->{'menu_entry'})
    {
        close_stack($text, $stack,$state, undef, 'menu_description');
        my $descr = pop(@$stack);
        print STDERR "# close_menu: close description\n" if ($T2H_DEBUG & $DEBUG_MENU);
        add_prev ($text, $stack, menu_description($descr->{'text'}, $state));
        delete $state->{'menu_entry'};
    }
}

sub menu_entry1($)
{
    my $state = shift;
    my $menu_entry = $state->{'menu_entry'};
    my $file = $state->{'element'}->{'file'};
    my $node_texi = normalise_node($menu_entry->{'node'});

    my $substitution_state = { 'no_paragraph' => 1, 'element' => $state->{'element'}, 
       'preformatted' => $state->{'preformatted'}, 
       'preformatted_stack' => $state->{'preformatted_stack'} };
         
    my $name = substitute_text($substitution_state, $menu_entry->{'name'});
    my $node = substitute_text($substitution_state, $node_texi);
    my $descr = substitute_text($substitution_state, $menu_entry->{'descr'});

    my $entry;
    my $element = $nodes{$node_texi};
    if ($element->{'seen'})
    {
        if ($element->{'with_section'})
        {
            $element = $element->{'with_section'};
        }
    
	#print STDERR "href in menu for $element->{'texi'}\n";
        my $href = href($element, $file);
        unless ($state->{'preformatted'})
        { 
            $descr =~ s/^\s+//;
            $descr =~ s/\s*$//;
        }
        if ($T2H_NUMBER_SECTIONS && !$T2H_NODE_NAME_IN_MENU)
        {
            $entry = $element->{'text'};
            $entry = "$T2H_MENU_SYMBOL $entry" if ($entry and ($element->{'node'}) or   ((!defined($element->{'number'}) or ($element->{'number'} =~ /^\s*$/)) and $T2H_UNNUMBERED_SYMBOL_IN_MENU));
            # If there is no section name
            $entry = "$T2H_MENU_SYMBOL $node" unless ($entry);
            $name = '';
            if ($T2H_AVOID_MENU_REDUNDANCY && $descr && !$state->{'preformatted'})
            {
                my $clean_entry = $element->{'name'};
                $clean_entry =~ s/[^\w]//g;
                my $clean_descr = $descr;
                $clean_descr =~ s/[^\w]//g;
                $descr = '' if ($clean_entry eq $clean_descr)
            }
        }
	elsif ($state->{'preformatted'})
        {
            $entry = ($name ? "$T2H_MENU_SYMBOL ${name}: $node" : "$T2H_MENU_SYMBOL $node" );
        }
        else
        {
            $entry = ($name && ($name ne $node || ! $T2H_AVOID_MENU_REDUNDANCY)
                      ? "$T2H_MENU_SYMBOL ${name}: $node" : "$T2H_MENU_SYMBOL $node");
        }
        return &$t2h_menu_entry($entry, $descr, $state, $href);
    }
    elsif ($node_texi =~ /^\(.*\)/)
    {
        # menu entry points to another info manual
	if ($state->{'preformatted'})
        {
            $entry = ( $name ? "$T2H_MENU_SYMBOL ${name}: $node" : "$T2H_MENU_SYMBOL $node" );
        }
	else
        {
            $entry = ($name && ($name ne $node || ! $T2H_AVOID_MENU_REDUNDANCY)
                      ? "$T2H_MENU_SYMBOL ${name}: $node" : "$T2H_MENU_SYMBOL $node");
        }
        return &$t2h_menu_entry($entry, $descr, $state, $nodes{$node_texi}->{'file'});
    }
    else
    {
        warn "$ERROR Unknown node in menu entry `$node_texi'\n";
        return &$t2h_menu_entry($name ? "$T2H_MENU_SYMBOL ${name}: $node" : "$T2H_MENU_SYMBOL $node", $descr, $state);
    }
}

sub menu_entry($;$)
{
    my $state = shift;
    my $simple = shift;
    my $menu_entry = $state->{'menu_entry'};
    my $file = $state->{'element'}->{'file'};
    my $node_texi = normalise_node($menu_entry->{'node'});
    $menu_entry->{'node'} = $node_texi;
    
    my $substitution_state = { 'no_paragraph' => 1, 'element' => $state->{'element'}, 
       'preformatted' => $state->{'preformatted'}, 
       'preformatted_stack' => $state->{'preformatted_stack'} };
         
    my $name = substitute_text($substitution_state, $menu_entry->{'name'});
    my $node = substitute_text($substitution_state, $node_texi);

    my $entry;
    my $href;
    my $element = $nodes{$node_texi};
    if ($element->{'seen'})
    {
        if ($element->{'with_section'})
        {
            $element = $element->{'with_section'};
        }
    
	#print STDERR "href in menu for $element->{'texi'}\n";
        $href = href($element, $file);
        if ($T2H_NUMBER_SECTIONS && !$T2H_NODE_NAME_IN_MENU)
        {
            $entry = $element->{'text'};
            $entry = "$T2H_MENU_SYMBOL $entry" if ($entry and ($element->{'node'}) or   ((!defined($element->{'number'}) or ($element->{'number'} =~ /^\s*$/)) and $T2H_UNNUMBERED_SYMBOL_IN_MENU));
            # If there is no section name
            $entry = "$T2H_MENU_SYMBOL $node" unless ($entry);
            $name = '';
        }
	elsif ($state->{'preformatted'})
        {
            $entry = ($name ? "$T2H_MENU_SYMBOL ${name}: $node" : "$T2H_MENU_SYMBOL $node" );
        }
        else
        {
            $entry = ($name && ($name ne $node || ! $T2H_AVOID_MENU_REDUNDANCY)
                      ? "$T2H_MENU_SYMBOL ${name}: $node" : "$T2H_MENU_SYMBOL $node");
        }
    }
    elsif ($node_texi =~ /^\(.*\)/)
    {
        # menu entry points to another info manual
	if ($state->{'preformatted'})
        {
            $entry = ( $name ? "$T2H_MENU_SYMBOL ${name}: $node" : "$T2H_MENU_SYMBOL $node" );
        }
        else
        {
            $entry = ($name && ($name ne $node || ! $T2H_AVOID_MENU_REDUNDANCY)
                      ? "$T2H_MENU_SYMBOL ${name}: $node" : "$T2H_MENU_SYMBOL $node");
        }
        $href = $nodes{$node_texi}->{'file'};
    }
    else
    {
        warn "$ERROR Unknown node in menu entry `$node_texi'\n";
        $entry = $name ? "$T2H_MENU_SYMBOL ${name}: $node" : "$T2H_MENU_SYMBOL $node";
    }
    return &$t2h_menu_entry($entry, $state, $href) unless ($simple);
    return &$t2h_simple_menu_entry($entry, $state, $href);
}

sub menu_description($$)
{
    my $descr = shift;
    my $state = shift;
    my $menu_entry = $state->{'menu_entry'};
    my $node_texi = $menu_entry->{'node'};

    #my $descr = substitute_text($substitution_state, $menu_entry->{'descr'});
    # AAAA
    my $element = $nodes{$node_texi};
    if ($element->{'seen'})
    {
        if ($element->{'with_section'})
        {
            $element = $element->{'with_section'};
        }
	# FXME put at AAAA
    unless ($state->{'preformatted'})
    { 
        $descr =~ s/^\s+//;
        $descr =~ s/\s*$//;
    }
        if ($T2H_AVOID_MENU_REDUNDANCY && $descr && !$state->{'preformatted'})
        {
            my $clean_entry = $element->{'name'};
            $clean_entry =~ s/[^\w]//g;
            my $clean_descr = $descr;
            $clean_descr =~ s/[^\w]//g;
            $descr = '' if ($clean_entry eq $clean_descr);
        }
        return &$t2h_menu_description($descr, $state);
    }
    else
    {
        # menu entry points to another info manual or not found
        return &$t2h_menu_description($descr, $state);
    }
}

sub do_xref($$$)
{
    my $macro = shift;
    my $text = shift;
    my $state = shift;

    my $result = '';
    
    $text =~ s/\s+/ /gos; # remove useless spaces and newlines
    my @args = split(/\s*,\s*/, $text);
    $args[0] = normalise_space($args[0]);
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
        warn "$ERROR Wrong number of arguments: \@$macro" ."$text" unless (@args == 3);
        $node_texi = "($args[2])$args[0]";
    }
    
    my $i;
    for ($i = 0; $i < @args; $i++)
    {
        $args[$i] = substitute_text({ 'element' => $state->{'element'}, 
           'preformatted' => $state->{'preformatted'},  'no_paragraph' => 1,
           'keep_texi' => $state->{'keep_texi'}, 'preformatted_stack' => $state->{'preformatted_stack'} }, 
           $args[$i]);
    }
    #print STDERR "(@args)\n";
    
    if (($macro eq 'inforef') or ($args[3]) or $args[4])
    {# inforef
        if ($macro eq 'inforef')
        {
            $macro = 'xref';
            $args[3] = $args[2];
        }
        my $info_ref;
        $info_ref = &$t2h_info_ref("($args[3])$args[0]", do_external_ref($node_texi), $args[1]) if ($args[3]);
        my $book_ref;
        $book_ref = &$t2h_book_ref($args[2] || $args[0], $args[4]) if ($args[4]);
        $result = &$t2h_external_ref($macro, $info_ref, $book_ref);
    }
    #elsif (@args == 5)
    #{                   # reference to another manual
    #     my $sec = $args[2] || $args[0];
    #     my $man = $args[4];
    #     $result = &$t2h_book_ref($macro, $sec, $man);
    #}
    else
    {
        my $element = $nodes{$node_texi};
        if ($element and $element->{'seen'})
        {
            if ($element->{'with_section'})
            {
                $element = $element->{'with_section'};
            }
	    #print STDERR "href in ref `$node_texi': $_";
            my $file = '';
            if (defined($state->{'element'}))
            {
                $file = $state->{'element'}->{'file'};
            }
            else
            {
                print STDERR "$WARN \@$macro not in text (in anchor, node, section...)\n";
                # if T2H_SPLIT the file is '' which ensures a href with the file
                # name. if ! T2H_SPLIT the 2 file will be the same thus there
                # won't be the file name
                $file = $element->{'file'} unless ($T2H_SPLIT);
            }
            my $href = href($element, $file);
            my $section = $args[2] || $args[1];
            $result = &$t2h_internal_ref ($macro, $href, $section || $args[0], $section || $element->{'name'}, $element->{'section'});
        }
        else
        {
           warn "$ERROR Undefined node `$node_texi' in \@$macro: $text\n";
           $result = "\@$macro"."{${text}}";
        }
    }
    return $result;
}

sub do_footnote($$$)
{
    my $command = shift;
    my $text = shift;
    my $state = shift;

    $text .= "\n";
    $foot_num++;
    $relative_foot_num++;
    my $docid  = "DOCF$foot_num";
    my $footid = "FOOT$foot_num";
    my $from_file = '';
    if ($state->{'element'} and $T2H_SPLIT and $T2H_SEPARATED_FOOTNOTES)
    { 
        $from_file = $state->{'element'}->{'file'};
    }
    my %state;
    initialise_state (\%state); 
    if ($T2H_SEPARATED_FOOTNOTES)
    {
        $state{'element'} = $footnote_element;
    }
    else
    {
        $state{'element'} = $state->{'element'};
    }
    my $file = '';
    $file = $docu_foot if ($T2H_SPLIT and $T2H_SEPARATED_FOOTNOTES);
    
    # FIXME use split_lines ? It seems to work like it is now ?
    my @lines = substitute_text(\%state, map {$_ = $_."\n"} split (/\n/, $text));
    my ($foot_lines, $foot_label) = &$t2h_foot_line_and_ref ($foot_num,
         $relative_foot_num, $footid, $docid, $from_file, $file, \@lines, $state);
    push(@foot_lines, @{$foot_lines});
    return $foot_label;
}

sub do_image($$$)
{
    # replace images
    my $macro = shift;
    my $text = shift;
    my $state = shift;
    $text =~ s/\s+/ /gos; # remove useless spaces and newlines
    my @args = split (/\s*,\s*/, $text);
    my $base = $args[0];
    my $image =
         LocateIncludeFile("$base.$args[4]") if ($args[4]) ||
         LocateIncludeFile("$base.png") ||
         LocateIncludeFile("$base.jpg") ||
         LocateIncludeFile("$base.gif");
    warn "$ERROR no image file for $base: $text" unless ($image && -e $image);
    return &$t2h_image($image, $base, $state->{'preformatted'});
}

sub apply_style($$;$$$)
{
    my $texi_style = shift;
    my $text = shift;
    my $preformatted = shift;
    my $no_open = shift;
    my $no_close = shift;
    my $style;
    if ($preformatted)
    {
        $style = $style_map_pre{$texi_style};
    }
    else
    {
        $style = $style_map{$texi_style};
    }
    if (defined($style))
    {                           # known style
        my $do_quotes = 0;
        if ($style =~ s/^\"//)
        {                       # add quotes
            $do_quotes = 1;
        }
        if ($style =~ s/^\&//)
        {                       # custom
            no strict "refs";
            $text = &$style($text, $texi_style);
            use strict "refs";
        }
        elsif ($style)
        {                       # good style
            $text = "<$style>$text</$style>";
        }
        else
        {                       # no style
        }
        if ($do_quotes)
        {
            if (!$no_close and !$no_open)
            {
                $text = "\`$text\'";
            }
            elsif ($no_close and $no_open)
            {
                $text = "$text";
            }
            elsif ($no_close)
            {
                $text = "\`$text";
            }
            elsif ($no_open)
            {
                $text = "$text\'";
            }
        }
    }
    else
    {                           # unknown style
        $text = undef;
    }
    return($text);
}

sub expand_macro($$;$)
{
    my $name = shift;
    my $args = shift;
    my $end_line = shift;
    my $macrobody = $macros->{$name}->{Body};
    my $formal_args = $macros->{$name}->{'Args'};
    my $args_index =  $macros->{$name}->{'Args_index'};
    my $i;
   
    for ($i=0; $i<=$#$formal_args; $i++)
    {
        $args->[$i] = "" unless (defined($args->[$i]));
        print STDERR "# arg($i): $args->[$i]\n" if ($T2H_DEBUG & $DEBUG_MACROS);
    }
    warn "$ERROR too much arguments for macro $name" if (defined($args->[$i + 1]));
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
    my $end_of_line = chomp($result);
    my @result = split(/\n/, $result);
    my $last_line = pop @result;
    if ($end_of_line)
    {
        $last_line .= "\n";
    }
    else
    {
        $last_line .= $end_line if (defined($end_line));
    }
    unless (@result)
    {
       if (defined($end_line) and $end_of_line)
       {
           unshift @input_spool, $end_line;
       }
       return $last_line;
    }
    @result = map {$_ = $_."\n"} @result;
    my $first_line = shift (@result);
    push @result, $last_line;
    push @result, $end_line if (defined($end_line) and $end_of_line);
    unshift @input_spool, @result;
    if ($T2H_DEBUG & $DEBUG_MACROS)
    {
        print STDERR "# macro expansion result:\n";
        print STDERR "$first_line";
        foreach my $line (@result)
        {
            print STDERR "$line";
        }
    }
    return $first_line;
}

# FIXME not used and buggy (Entries->{$key}->{href} not defined)
sub do_index_summary_file($)
{
    my $name = shift;
    my ($Pages, $Entries) = GetIndex($name);
    if ($T2H_IDX_SUMMARY)
    {
        open(FHIDX, ">$docu_rdir$docu_name" . "_$name.idx")
            || die "Can't open > $docu_rdir$docu_name" . "_$name.idx for writing: $!\n";
        print STDERR "# writing $name index summary in $docu_rdir$docu_name" . "_$name.idx...\n" if $T2H_VERBOSE;

        for my $key (sort keys %$Entries)
        {
            print FHIDX "$key\t$Entries->{$key}->{href}\n";
        }
    }
}

sub do_index_page($$;$)
{
    my $index_elements = shift;
    my $nr = shift;
    my $page = shift;
    my $index_element = $index_elements->[$nr];
    my $summary = do_index_summary($index_element->{'element'}, $index_elements);
    my $entries = do_index_entries($index_element->{'element'}, $index_element->{'page'});
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
        for my $letter (@{$index_element_item->{'page'}->{Letters}})
        {
            if ($letter =~ /^[A-Za-z]/)
            {
                push @letters, &$t2h_summary_letter($letter, $file, $index, $index_element->{'id'});
            }
            else
            {
                push @symbols, &$t2h_summary_letter($letter, $file, $index, $index_element->{'id'});
            }
            $index++;
        }
    }
    return &$t2h_index_summary(\@letters, \@symbols);
}

sub do_index_entries($$)
{
    my $element = shift;
    my $page = shift;
 
    my $letters = '';
    my $index = 0;
    for my $letter (@{$page->{Letters}})
    {
       my $entries = '';
       for my $entry (@{$page->{EntriesByLetter}->{$letter}})
       {
           my $label = $entry->{'element'};
           my $entry_element = $label;
           # notice that we use the section associated with a node even when 
           # there is no with_section, i.e. when there is another node preceding
           # the sectionning command
           $entry_element = $entry_element->{'section_ref'} if ($entry_element->{'node'} and $entry_element->{'section_ref'});
           my $origin_href = '';
           $origin_href = $entry->{'file'} if ($T2H_SPLIT and $entry->{'file'} ne $element->{'file'});
	   #print STDERR "$entry $entry->{'entry'}, real elem $label->{'texi'}, section $entry_element->{'texi'}, real $label->{'file'}, entry file $entry->{'file'}\n";
           if ($entry->{'label'})
           { 
               $origin_href .= '#' . $entry->{'label'};
           }
	   else
           {
               # If the $label element and the $index entry are on the same
               # file the label is prefered. If they aren't on the same file
               # the entry id is choosed as it means that the label element
               # and the index entry are separated by a printindex.
               print STDERR "id undef ($entry) entry: $entry->{'entry'}, label: $label->{'text'}\n"  if (!defined($entry->{'id'}));
               if ($entry->{'file'} eq $label->{'file'})
               {
                   $origin_href .= '#' . $label->{'id'};
               }
               else
               {
                   $origin_href .= '#' . $entry->{'id'} ;
               }
           }
           $entries .= &$t2h_index_entry ($origin_href, 
                     substitute_line($entry->{entry}),
                     href($entry_element, $element->{'file'}),
                     $entry_element->{'text'});
        }
        $letters .= &$t2h_index_letter ($letter, $index, $element->{'id'}, $entries);
        $index++;
    }
    return &$t2h_index($letters);
}

# remove texi commands, replacing with what seems adequate. see simple_map_texi
# and texi_map.
# Doesn't protect html
sub remove_texi(@)
{
    return substitute_text ({ 'remove_texi' => 1 }, @_);
}

sub enter_table_index_entry($$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    if ($state->{'item'} and ($state->{'table_stack'}->[-1] =~ /^(v|f)table$/))
    {
        my $index = $1;
        my $macro = $state->{'item'};
        delete $state->{'item'};
        close_stack($text, $stack, $state, undef, 'index_item');
        my $item = pop @$stack;
        my $element = $state->{'element'};
        $element = $state->{'node_ref'} unless ($element);
        #print STDERR "enter_table_index_entry $item->{'text'}";
        enter_index_entry($index, $item->{'text'}, $state->{'place'}, $element, 0, $state->{'preformatted'});
        add_prev($text, $stack, "\@$macro" . $item->{'text'});
    }
}

sub scan_texi($$$$)
{
    my $line = shift;
    my $text = shift;
    my $stack = shift;
    my $state = shift;

    die "stack not an array ref"  unless (ref($stack) eq "ARRAY");
    local $_ = $line;
    #print STDERR "SCAN_TEXI: $line";
    if (!$state->{'raw'} and !$state->{'macro'} and !$state->{'verb'} and !$state->{'ignored'} and !$state->{'macro_name'})
    {
        # noindent at beginning of line is special, it removes spaces, but 
        # no new lines. Same for exdent 
        my $next_tag = next_tag($_);
        if ($next_tag eq 'noindent' or $next_tag eq 'exdent')
        { # FIXME exdent should be handled differently
            unless (/^\s*\@$next_tag\s*$/)
            {
                s/^(\s*)\@$next_tag\s*/$1/;
            }
        }
        elsif ((/^\@(\w+)/o and $to_skip_texi{$1}) or (/^\@end\s+(\w+)/o and $to_skip_texi{"end $1"}))
        {
            s/^\@$next_tag//;
            $_ = skip_texi ($_, $next_tag, $state);
            return unless (defined($_));
        }
    }

    while(1)
    {
        #print STDERR "WHILE\n";
	#dump_stack($text, $stack, $state);

        # In ignored region
        if ($state->{'ignored'})
        {
            if (s/^.*?\@end\s+$state->{'ignored'}$// or s/^.*?\@end\s+$state->{'ignored'}\s+//)
            {
                 delete $state->{'ignored'};
                 #dump_stack($text, $stack, $state);
                 return if /^\s*$/o;
                 next;
            }
            return;
        }

        # in macro definition
        if (defined($state->{'macro'}))
        {
            if (s/^(.*?)\@end\smacro$//o or s/^(.*?)\@end\smacro\s+//o)
            {
                 $state->{'macro'}->{'Body'} .= $1 if defined($1) ;
                 print STDERR "# end macro def. Body:\n$state->{'macro'}->{'Body'}"
                     if ($T2H_DEBUG & $DEBUG_MACROS);
                 delete $state->{'macro'};
                 return if (/^\s*$/);
                 next;
            }
            else
            {
                 $state->{'macro'}->{'Body'} .= $_ if defined($_) ;
                 return;
            }
        }
        # in macro arguments parsing/expansion
        if (defined($state->{'macro_name'}))
        {
            my $special_chars = quotemeta ('\{}');
            my $multi_args = 0;
            my $formal_args = $macros->{$state->{'macro_name'}}->{'Args'};
            $multi_args = 1 if ($#$formal_args >= 1);
            $special_chars .= quotemeta(',') if ($multi_args);
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
                { # separate args
                    print STDERR "# macro call: new arg\n" if ($T2H_DEBUG & $DEBUG_MACROS);
                    s/^\s*//o;
                    push @{$state->{'macro_args'}}, '';
                }
                elsif ($2 eq '}')
                { # balanced } ends the macro call, otherwise it is in the arg
                    $state->{'macro_depth'}--;
                    if ($state->{'macro_depth'} == 0)
                    {
                        print STDERR "# expanding macro $state->{'macro_name'}\n" if ($T2H_DEBUG & $DEBUG_MACROS);
                        $_ = expand_macro($state->{'macro_name'}, $state->{'macro_args'}, $_);
                        delete $state->{'macro_name'};
                        delete $state->{'macro_depth'};
                        delete $state->{'macro_args'};
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
	    
            if (s/^(.*?)\@end\s$tag$// or s/^(.*?)\@end\s$tag\s//)
            {
                add_prev ($text, $stack, $1);
                my $style = pop @$stack;
                if ($style->{'text'} !~ /^\s*$/)
                {
                    my $after_macro = '';
                    $after_macro = ' ' unless (/^\s*$/);
                    add_prev ($text, $stack, $style->{'text'} . "\@end $state->{'raw'}" . $after_macro);
                    delete $state->{'raw'};
                }
                next;
            }
            else
            {
                 add_prev ($text, $stack, $_);
                 last;
            }
        }

        # in a @verb{ .. } macro
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
	
        # an @end tag
        if (s/^([^{}@]*)\@end\s+([a-zA-Z]\w*)//)
	{
            add_prev($text, $stack, $1);
            my $end_tag = $2;
            if (defined($state->{'text_macro_stack'})
               and @{$state->{'text_macro_stack'}}
               and ($end_tag eq $state->{'text_macro_stack'}->[-1]))
            {
                pop @{$state->{'text_macro_stack'}};
                # we keep menu and titlepage for the following pass
                if (($end_tag eq 'menu') or ($end_tag eq 'titlepage'))
                {
                     add_prev($text, $stack, "\@end $end_tag");
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
                warn "$ERROR \@end $end_tag without corresponding element.\n";
            }
            elsif ($end_tag eq 'copying')
            {
                if ($state->{'copying'})
                {
                    $state->{'copying'}--;
                    return if (/^\s*$/);
                }
                else
                {
                    warn "$ERROR \@end $end_tag but no opening of copying.\n";
                }
            }
            else
            {
                add_prev($text, $stack, "\@end $end_tag");
            }
            next;
        }
        elsif (s/^([^{}@]*)\@([a-zA-Z]\w*|["'~\@\}\{,\.!\?\s*\-\^`=:])//o)
        {
            add_prev($text, $stack, $1);
            my $macro = $2;
	    #print STDERR "MACRO $macro\n";
            if ($to_skip_texi{$macro})
            {
                 $_ = skip_texi ($_, $macro, $state);
                 return unless (defined($_));
                 next;
            }
            # pertusus: it seems that value substitution are performed after
            # macro argument expansions: if we have 
            # @set comma ,
            # and a call to a macro @macro {arg1 @value{comma} arg2}
            # the macro arg is arg1 , arg2 and the comma don't separate
            # args. Likewise it seems that the @value are not expanded
            # in macro definitions

            # track variables
            my $value_macro = 1;
            if ($macro eq 'set' and  s/^\s+($VARRE)\s+(.*)$//o)
            {
                $value{$1} = $2;
            }
            elsif ($macro eq 'clear' and s/^\s+($VARRE)//o)
            {
                delete $value{$1};
            }
            else
            {
                 $value_macro = 0;
            }
            if ($value_macro)
            {
                return if (/^\s*$/);
                next;
            }
	    
            if ($macro =~ /^r?macro$/)
            {
                if (/^\s+(\w+)\s*(.*)/)
                {
                    my $name = $1;
                    my @args = ();
                    @args = split(/\s*,\s*/ , $1)
                       if ($2 =~ /^\s*{\s*(.*?)\s*}\s*/);
                    $macros->{$name}->{'Args'} = \@args;
                    my $arg_index = 0;
                    my $debug_msg = '';
                    foreach my $arg (@args)
                    { # when expanding macros, the argument index is retrieved
                      # with Args_index
                        $macros->{$name}->{'Args_index'}->{$arg} = $arg_index;
                        $debug_msg .= "$arg($arg_index) ";
                        $arg_index++;
                    }
                    $macros->{$name}->{'Body'} = '';
                    $state->{'macro'} = $macros->{$name};
                    print STDERR "# macro def $name: $debug_msg\n"
                     if ($T2H_DEBUG & $DEBUG_MACROS);
                }
                else
                {
                    warn "$ERROR: Bad macro defintion $_";
                }
                return;
            }
            elsif (defined($text_macros{$macro}))
            {
                $_ = do_text_macro ($macro, $_, $state);
                # if it is a raw formatting command or a menu command
                # we must keep it for later
                my $macro_kept;
                if ($state->{'raw'} or ($macro eq 'menu') or ($macro eq 'titlepage'))
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
            elsif ($macro eq 'copying')
            {
                $state->{'copying'}++;
                return if (/^\s*$/);
            }
            elsif ($macro eq 'value')
            {
                if (s/^{($VARRE)}//)
                {
                    $_ = get_value($1) . $_;
                }
		else
                {
                    warn "$ERROR bad \@value macro";
                }
            }
            elsif ($macro eq 'include')
            {
                if (s/^\s+($FILERE)//o)
                {
                    my $file = LocateIncludeFile($1);
                    if ($file && -e $file)
                    {
                        open_file($file);
                        print STDERR "# including $file\n" if $T2H_VERBOSE;
                    }
                    else
                    {
                        warn "$ERROR Can't find $1, skipping";
                    }
                }
                else
                {
                    warn "$ERROR Bad include line: $_";
                    return;
                }
                return if (/^\s*$/);
            }
            elsif ($macro eq 'unmacro')
            {
                delete $macros->{$1} if (s/^\s+(\w+)//);
                return if (/^\s*$/);
                s/^\s*//;
            }
            elsif (exists($macros->{$macro}))
            {
                my $ref = $macros->{$macro}->{'Args'};
                if (s/^\s*{\s*//)
                {
                    $state->{'macro_args'} = [ "" ];
                    $state->{'macro_name'} = $macro;
                    $state->{'macro_depth'} = 1;
                }
                elsif ($#$ref >= 1)
                {
                    $_ = expand_macro ($macro, [], $_);
                }
                else
                {
                    chomp $_;
                    $_ = expand_macro ($macro, [$_]);
                }
            }
            elsif ($macro eq ',')
            {# the @, causes problems when `,' separates things (in @node, @ref)
                $_ = "\@m_cedilla" . $_;
            }
            elsif (s/^{//)
            {
                if ($macro eq 'verb')
                {
                    if (/^$/)
                    {
                        warn "$ERROR verb at end of line";
                    }
                    else
                    {
                        s/^(.)//;
                        $state->{'verb'} = $1;
                    }
                } 
                push (@$stack, { 'style' => $macro, 'text' => '' });
            }
            else
            {
                add_prev($text, $stack, "\@$macro");
            }
            next;
        }
        elsif(s/^([^{}@]*)\@(.)//o)
        {
            my $chomped_line = $line;
            chomp($chomped_line);
            warn "$ERROR Unknown command: `$2', line: $chomped_line\n";
            add_prev($text, $stack, "\@$2");
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
                    if ($style->{'style'})
                    {
                         $result = '@' . $style->{'style'} . '{' . $style->{'text'} . '}';
                    }
                    else
                    {
                        $result = '{' . $style->{'text'};
                        # don't close { if we are closing stack as we are not 
                        # sure this is a licit { ... } construct.
                        $result .= '}' unless $state->{'close_stack'};
                    }
                    add_prev ($text, $stack, $result);
                    #print STDERR "MACRO end $style->{'style'} remaining: $_";
                    next;
                }
                else
                {
                    warn "$ERROR '}' without opening '{' line: $line";
                    add_prev ($text, $stack, '}');
                }
            }
        }
        else
        {
            #print STDERR "END_LINE $_";
            add_prev($text, $stack, $_);
            last;
        }
    }
    return undef;
}

sub scan_structure($$$$)
{
    my $line = shift;
    my $text = shift;
    my $stack = shift;
    my $state = shift;

    die "stack not an array ref"  unless (ref($stack) eq "ARRAY");
    local $_ = $line;
    #print STDERR "SCAN_STRUCTURE: $line";
    #dump_stack ($text, $stack, $state); 
    if (!$state->{'raw'} and !$state->{'special'})
    { 
        if (!$state->{'verb'} and $state->{'menu'} and /^\*/o)
        {
        # new menu entry
            delete $state->{'empty_line'};
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
                menu_entry_texi(normalise_node($node), $state);
		#add_prev($text, $stack, $menu_line);
		#return;
            }
        }
        if (/^\s*$/)
        {
        # remove unneeded empty lines
            if (!$state->{'preformatted'})
            {
                return if ($state->{'empty_line'});
                $state->{'empty_line'} = 1;
            }
            add_prev($text, $stack, $_);
            return;
        } 
        else
        {
            if (!$state->{'preformatted'} and !no_line($_))
            {
                 delete $state->{'empty_line'};
                 delete $state->{'after_element'};
            }
        }
        my $next_tag = next_tag($_);
        if ((/^\@(\w+)/o and $to_skip{$1}) or (/^\@end\s+(\w+)/o and $to_skip{"end $1"}))
        {
            s/^\@$next_tag//;
            $_ = skip ($_, $next_tag, $state);
            return unless (defined($_));
        }
    }

    while(1)
    {
        #
	#print STDERR "WHILE\n";
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
        if ($state->{'raw'} or $state->{'special'}) 
        {
            my $tag = $state->{'raw'};
            $tag = $state->{'special'} unless $tag;
            if (! @$stack or ($stack->[-1]->{'style'} ne $tag))
            {
                print STDERR "Bug: raw or special: $tag but not on top of stack\n";
                print STDERR "line: $_";
                dump_stack($text, $stack, $state);
                exit 1;
            }
            if (s/^(.*?)\@end\s$tag$// or s/^(.*?)\@end\s$tag\s//)
            {
                add_prev ($text, $stack, $1);
                my $style = pop @$stack;
                if ($style->{'text'} !~ /^\s*$/)
                {
                    if ($state->{'special'})
                    {
                        delete $state->{'special'};
                        add_prev ($text, $stack, do_special($style->{'style'}, $style->{'text'}));
                    }
                    else
                    {
                        my $after_macro = '';
                        $after_macro = ' ' unless (/^\s*$/);
                        add_prev ($text, $stack, $style->{'text'} . "\@end $state->{'raw'}" . $after_macro);
                        delete $state->{'raw'};
                    }
                }
                unless (no_line($_))
                {
                    delete $state->{'empty_line'};
                    delete ($state->{'after_element'});
                }
                next;
            }
            else
            {
                add_prev ($text, $stack, $_);
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
            delete $state->{'empty_line'};
            delete $state->{'after_element'};
        }
        if (s/^([^{}@]*)\@end\s+([a-zA-Z]\w*)//)
	{
            add_prev($text, $stack, $1);
            my $end_tag = $2;
            $state->{'detailmenu'}-- if ($end_tag eq 'detailmenu' and $state->{'detailmenu'});
            next if ($to_skip{"end $end_tag"});
            if (defined($state->{'text_macro_stack'}) 
               and @{$state->{'text_macro_stack'}} 
               and ($end_tag eq $state->{'text_macro_stack'}->[-1]))
            {
                pop @{$state->{'text_macro_stack'}};
                if ($end_tag eq 'titlepage')
                {
                     $state->{'titlepage'}--;
                     retrieve_line_state ($state, 'titlepage') if ($state->{'titlepage'} == 0);
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
                warn "$ERROR \@end $end_tag without corresponding element\n";
                dump_stack($text, $stack, $state);
            }
            else
            {
                if ($end_tag eq $state->{'table_stack'}->[-1])
                {
                    enter_table_index_entry($text, $stack, $state);
                    pop @{$state->{'table_stack'}};
                }
                #add end tag
                add_prev($text, $stack, "\@end $end_tag");
            }
            $state->{'preformatted'}--  if ($complex_format_map->{$end_tag});
            next;
        }
        elsif (s/^([^{}@]*)\@([a-zA-Z]\w*|["'~\@\}\{,\.!\?\s*\-\^`=:])//o)
        {
            add_prev($text, $stack, $1);
            my $macro = $2;
	    #print STDERR "MACRO $macro\n";
            if ($to_skip{$macro})
            {
                 $_ = skip ($_, $macro, $state);
                 return unless (defined($_));
                 next;
            }

            # track variables
            my $value_macro = 1;
            if ($macro eq 'shorttitle' and s/^\s+(.*)$//)
            {
                $value{'_shorttitle'} = substitute_texi_line($1);
            }
            elsif($macro eq 'setfilename' and s/^\s+(.*)$//)
            {
                $value{'_setfilename'} = substitute_texi_line($1);
            }
            elsif($macro eq 'settitle' and s/^\s+(.*)$//)
            {
                $value{'_settitle'} = substitute_texi_line($1);
            }
            elsif($macro eq 'author' and  s/^\s+(.*)$//)
            {
                 $value{'_author'}   .= substitute_texi_line($1)."\n";
            }
            elsif($macro eq 'subtitle' and s/^\s+(.*)$//)
            {
                 $value{'_subtitle'} .= substitute_texi_line($1)."\n";
            }
            elsif($macro eq 'title' and s/^\s+(.*)$//)
            {
                $value{'_title'}    .= substitute_texi_line($1)."\n";
            }
            else
            {
                 $value_macro = 0;
            }
            if ($value_macro)
            {
                return if (/^\s*$/);
                next;
            }
            if ($macro =~ /^(\w+?)index/ and ($1 ne 'print') and ($1 ne 'syncode') and ($1 ne 'syn') and ($1 ne 'def') and ($1 ne 'defcode'))
            {
                my $index_prefix = $1;
                if (/^\s+(.*)/)
                {
                    my $key = $1;
                    $_ = substitute_texi_line($_);
                    my $index_entry = enter_index_entry($index_prefix, $key, $state->{'place'}, $state->{'element'}, $state->{'after_element'}, $state->{'preformatted'});
                    if ($index_entry)
                    {
                        add_prev ($text, $stack, "\@$macro" .  $_);
                    }
                    elsif (!defined($index_entry))
                    {
                        warn "$WARN Bad index entry: $_";
                    }
                }
                else
                {
                     warn "$WARN empty index entry\n";
                }
                return;
            }
            elsif (defined($text_macros{$macro}))
            {
		    #print STDERR "TEXT_MACRO: $macro\n";
                if ($text_macros{$macro} eq 'special')
                {
                     $state->{'special'} = $macro;
                }
                elsif ($text_macros{$macro} eq 'raw')
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
                elsif ($macro eq 'titlepage')
                {
                    $state->{'titlepage'}++;
                    if ($state->{'titlepage'} == 1)
                    {
                        save_line_state($state, 'titlepage');
                    }
                    push @{$state->{'text_macro_stack'}}, $macro;
                }
                # if it is a raw formatting command or a menu command
                # we must keep it for later
                my $macro_kept;
                if ($state->{'raw'} or ($macro eq 'menu'))
                {
                    add_prev($text, $stack, "\@$macro");
                    $macro_kept = 1;
                }
                if ($state->{'raw'} or $state->{'special'})
                {
                    push @$stack, { 'style' => $macro, 'text' => '' };
                }
                next if $macro_kept;
		#dump_stack ($text, $stack, $state);
                return if (/^\s*$/);
            }
            elsif ($macro eq 'synindex' || $macro eq 'syncodeindex')
            {
                if (s/^\s+(\w+)\s+(\w+)\s*$//)
                {
                    my $from = $1;
                    my $to = $2;
                    my $prefix_from = IndexName2Prefix($from);
                    my $prefix_to = IndexName2Prefix($to);

                    warn("$ERROR unknown from index name $from ind syn*index line: $_"), next
                        unless $prefix_from;
                    warn("$ERROR unknown to index name $to ind syn*index line: $_"), next
                        unless $prefix_to;

                    if ($macro eq 'syncodeindex')
                    {
                        $index_properties->{$prefix_to}->{'from_code'}->{$prefix_from} = 1;
                    }
                    else
                    {
                        $index_properties->{$prefix_to}->{'from'}->{$prefix_from} = 1;
                    }
                }
                else
                {
                    warn "$ERROR Bad syn*index line: $_";
                    return;
                }
                return if /^\s*$/;
            }
            elsif ($macro eq 'defindex' || $macro eq 'defcodeindex')
            {
                if (s/^\s+(\w+)\s*$//)
                {
                    my $name = $1;
                    $index_properties->{$name}->{name} = $name;
                    $index_properties->{$name}->{code} = 1 if $macro eq 'defcodeindex';
                }
                else
                {
                    warn "$ERROR Bad defindex line: $_";
                }
                return if /^\s*$/;
            }
            elsif ($macro eq 'documentlanguage')
            {
                s/\s+(\w+)//;
                my $lang = $1;
                SetDocumentLanguage($lang) if (!$T2H_WORDS && $lang);
                return if (/^\s*$/);
                s/^\s*//;
            }
            elsif (defined($def_map{$macro}))
            {
                #We must enter the index entries
                my ($prefix, $entry) = get_deff_index($macro, $_);
                enter_index_entry($prefix, $entry, $state->{'place'}, $state->{'element'}, 0, $state->{'preformatted'});
                s/(.*)//;
                add_prev($text, $stack, "\@$macro" . $1);
            }
            elsif ($macro =~ /^itemx?$/)
            {
                enter_table_index_entry($text, $stack, $state);
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
            elsif ($complex_format_map->{$macro})    
            { # We must know whether we are in preformatted, in that case lines
              # are all kept
                $state->{'preformatted'}++  if ($complex_format_map->{$macro});
                add_prev($text, $stack, "\@$macro");
            }
            elsif (s/^{//)
            {
                if ($macro eq 'verb')
                {
                    if (/^$/)
                    {
                        warn "$ERROR verb at end of line";
                    }
                    else
                    {
                        s/^(.)//;
                        $state->{'verb'} = $1;
                    }
                } 
                elsif ($macro eq 'footnote' and $T2H_SEPARATED_FOOTNOTES)
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
        elsif(s/^([^{}@]*)\@(.)//o)
        {
            add_prev($text, $stack, "\@$2");
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
                    if ($style->{'style'} eq 'anchor')
                    {
                        my $anchor = $style->{'text'};
                        $anchor = normalise_node($anchor);
                        if ($nodes{$anchor})
                        {
                            warn "$ERROR Duplicate node for anchor found: $anchor\n";
                            next;
                        }
                        $anchor_num++;
                        $nodes{$anchor} = { 'anchor' => 1, 'seen' => 1, 'texi' => $anchor, 'id' => 'ANC' . $anchor_num};
                        push @{$state->{'place'}}, $nodes{$anchor};
                    }
                    elsif ($style->{'style'} eq 'footnote')
                    {
                        if ($T2H_SEPARATED_FOOTNOTES)
                        {
                            $state->{'element'} = $state->{'footnote_element'};
                            $state->{'place'} = $state->{'footnote_place'};
                        }
                    }
                    elsif ($style->{'style'} eq 'math' and $T2H_L2H)
                    {
                         add_prev ($text, $stack, do_math($style->{'text'}));
                         next;
                    }
                    if ($style->{'style'})
                    {
                         $result = '@' . $style->{'style'} . '{' . $style->{'text'} . '}';
                    }
                    else
                    {
                        $result = '{' . $style->{'text'};
                        # don't close { if we are closing stack as we are not 
                        # sure this is a licit { ... } construct.
                        $result .= '}' unless $state->{'close_stack'};
                    }
                    add_prev ($text, $stack, $result);
                    #print STDERR "MACRO end $style->{'style'} remaining: $_";
                    next;
                }
                else
                {
                    warn "$ERROR '}' without opening '{' line: $line";
                    add_prev ($text, $stack, '}');
                }
            }
        }
        else
        {
            #print STDERR "END_LINE $_";
            add_prev($text, $stack, $_);
            enter_table_index_entry($text, $stack, $state);
            last;
        }
    }
    return undef;
}

sub scan_line($$$$)
{
    my $line = shift;
    my $text = shift;
    my $stack = shift;
    my $state = shift;

    die "stack not an array ref"  unless (ref($stack) eq "ARRAY");
    local $_ = $line;
    #print STDERR "SCAN_LINE: $line";
    my $new_menu_entry;
    if (!$state->{'raw'} and !$state->{'verb'} and $state->{'menu'})
    { # new menu entry
        my ($node, $name);
        if (s/^\*\s+($NODERE):://o)
        {
            $node = $1;
        }
        elsif (s/^\*\s+([^:]+):\s*([^\t,\.\n]+)[\t,\.\n]//o)
        {
            $name = $1;
            $node = $2;
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
                close_menu($text, $stack, $state);
                $new_menu_entry = 1;
                $state->{'menu_entry'} = { 'name' => $name, 'node' => $node };
                add_prev ($text, $stack, menu_entry($state));
                print STDERR "# New menu entry: $node\n" if ($T2H_DEBUG & $DEBUG_MENU);
                push @$stack, {'format' => 'menu_description', 'text' => ''};
            }
            else
            { # we are within a macro or a format. In that case we use
              # a simplified formatting of menu which should be right whatever
              # the context
                my $menu_entry = $state->{'menu_entry'};
                $state->{'menu_entry'} = { 'name' => $name, 'node' => $node };
                add_prev ($text, $stack, menu_entry($state, 1));
                $state->{'menu_entry'} = $menu_entry;
            }
        }
    }
    # we're in a menu entry description
    if ($state->{'menu_entry'} and !$new_menu_entry)
    {
        my $top_stack = top_stack($stack);
        if (/^\s+[^\s].*$/ or (!$top_stack->{'format'} or ($top_stack->{'format'} ne 'menu_description')))
        { # description continues
            print STDERR "# Description continues\n" if ($T2H_DEBUG & $DEBUG_MENU);
	    #dump_stack ($text, $stack, $state);
        }
        else
        { # enter menu comment after menu entry
            if (!$top_stack->{'format'} or ($top_stack->{'format'} ne 'menu_description'))
            {
                print STDERR "Bug: begin menu comment but previous isn't menu_description\n";
                dump_stack ($text, $stack, $state);
            }
            print STDERR "# Menu comment begins\n" if ($T2H_DEBUG & $DEBUG_MENU);
	    #dump_stack ($text, $stack, $state);
            my $descr = pop(@$stack);
            add_prev ($text, $stack, menu_description($descr->{'text'}, $state));
            delete $state->{'menu_entry'};
            unless (/^\s*\@end\s+menu\b/)
            {
                $state->{'menu_comment'}++;
                push @$stack, {'format' => 'menu_comment', 'text' => ''};
                push @$stack, {'format' => 'preformatted', 'text' => ''};# if ($state->{'preformatted'});
                $state->{'preformatted'}++;
                push @{$state->{'preformatted_stack'}}, $T2H_MENU_PRE_STYLE;
            }
	    #dump_stack ($text, $stack, $state);
        }
    }
    if ($state->{'menu_entry'} or $state->{'raw'} or $state->{'preformatted'}  or $state->{'no_paragraph'} or $state->{'keep_texi'} or $state->{'remove_texi'})
    { # empty lines are left unmodified
        if (/^\s*$/)
        {
             add_prev($text, $stack, $_);
             return;
        }
        else
        {
            my $next_tag = next_tag($_);
            if ($state->{'deff'} and !defined($def_map{$next_tag}))
            {
                 begin_deff_item($stack, $state);
            }
        }
    }
    else
    {
        if (/^\s*$/)
        {
            #ignore the line if it just follows a deff
            return if ($state->{'deff'});
            #if a paragraph is open and empty, it is removed
            return if (abort_empty_paragraph ($stack, $state));
                    
            if ($state->{'paragraph'})
            { # An empty line ends a paragraph
                my $new_stack;
		#dump_stack ($text, $stack, $state);
                # We close the stack, duplicating commands still opened
                ($text, $stack, $state, $new_stack) = close_stack($text, $stack, $state, 1);
                my $paragraph = pop @$stack;
                if (!$paragraph->{'format'} or ($paragraph->{'format'} ne 'paragraph'))
                { # After closing the stack, there is no paragraph, it is a bug
                    my $format = "UNDEF";
                    $format = "format $paragraph->{'format'}" if ($paragraph->{'format'});
                    $format = "style $paragraph->{'style'}" if ($paragraph->{'style'});
                    print STDERR "Bug: paragraph closed but no paragraph ($format) $_\n";
                    dump_stack ($text, $stack, $state);
                }
                add_prev ($text, $stack, do_paragraph($paragraph->{'text'}, $state));
                # paragraph_macros is a macros stack containing macros 
                # which were open before paragraph end
                $state->{'paragraph_macros'} = $new_stack;
                return;
            }
        }
        else
        {
            my $next_tag = next_tag($_);
            if ($state->{'deff'} and !defined($def_map{$next_tag}))
            { # finish opening the deff, as this is not a deff tag, it can't be 
              # a deff macro with x
                begin_deff_item($stack, $state);
            }
            if (!$state->{'paragraph'} and !($next_tag =~ /^(\w+?)index$/ and ($1 ne 'print')) and ($next_tag !~ /^itemx?$/) and ($next_tag ne 'html'))
            { # index entries and @html don't trigger new paragraph beginning
              # otherwise we begin a new paragraph
                begin_paragraph($stack, $state);
                push @$stack, @{$state->{'paragraph_macros'}} if $state->{'paragraph_macros'};
                delete $state->{'paragraph_macros'};
            }
        }
    }
    # an index entry at beginning of line is handled here FIXME why ?
    if (!$state->{'raw'} and !$state->{'verb'} and /^\@(\w+?)index\s+(.*)/ and ($1 ne 'print'))
    {
        if ($state->{'keep_texi'})
        {
            add_prev($text, $stack, $_);
        }
        else
        {
            add_prev($text, $stack, do_index_entry_label($state));
        }
        return;
    }

    while(1)
    {
	    #print STDERR "WHILE\n";
	    #dump_stack($text, $stack, $state);
        # we're in a raw format (html, tex if !L2H, verbatim)
        if (defined($state->{'raw'})) 
        {
	    (dump_stack($text, $stack, $state), die "Bug for raw ($state->{'raw'})") if (! @$stack or ! ($stack->[-1]->{'style'} eq $state->{'raw'}));
            if (s/^(.*?)\@end\s$state->{'raw'}$// or s/^(.*?)\@end\s$state->{'raw'}\s+//)
            # don't protect html, it is done by t2h_raw if needed
            {
                print STDERR "# end raw $state->{'raw'}\n" if ($T2H_DEBUG & $DEBUG_FORMATS);
                add_prev ($text, $stack, $1);
                my $style = pop @$stack;
                if ($style->{'text'} !~ /^\s*$/)
                {
                    if ($state->{'remove_texi'})
                    {
                        add_prev ($text, $stack, $style->{'text'});
                    }
                    elsif ($state->{'keep_texi'})
                    {
                        add_prev ($text, $stack, $style->{'text'} . "\@end $state->{'raw'}");
                    }
                    else
                    { 
                        add_prev($text, $stack, &$t2h_raw($style->{'style'}, $style->{'text'}));
                    }
                }
                if (!$state->{'keep_texi'} and !$state->{'remove_texi'})
                {
                    # reopen preformatted if it was interrupted by the raw format
                    # if raw format is html the preformatted wasn't interrupted
                    begin_paragraph($stack, $state) if ($state->{'preformatted'} and ($state->{'raw'} ne 'html')); 
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
                    add_prev($text, $stack, do_text($1));
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

        # We handle now the end tags 
        if ($state->{'keep_texi'} and s/^([^{}@]*)\@end\s+([a-zA-Z]\w*)//)
	{
            my $end_tag = $2;
            add_prev($text, $stack, $1 . "\@end $end_tag");
            next;
        }
        elsif ($state->{'remove_texi'} and s/^([^{}@]*)\@end\s+([a-zA-Z]\w*)//)
	{
            add_prev($text, $stack, $1);
            next;
        }
	
        if (s/^([^{}@]*)\@end\s+([a-zA-Z]\w*)\s// or s/([^{}@]*)^\@end\s+([a-zA-Z]\w*)$//)
        {
            add_prev($text, $stack, do_text($1, $state));
            my $end_tag = $2;
            
            # First we test if the stack is not empty.
            # Then we test if the end tag is a format tag.
            # If so, we close the styles.
            # We then close paragraphs and preformatted at top of the stack.
            # We handle the end tag (even when it was not the tag which appears
            # on the top of the stack; in that case we close anything 
            # until that element)
            my $top_stack = top_stack($stack);
            if (!$top_stack)
            {
                # paragraph style have a separate stack and can be closed too
                next if end_paragraph_style($text, $stack, $state, $end_tag);
                warn "$ERROR \@end $end_tag without corresponding opening element\n";
                add_prev($text, $stack, "\@end $end_tag");
                next;
            }

            if (!$top_stack->{'format'})
            {
                warn "$ERROR waiting for closing of $top_stack->{'style'}, found \@end $end_tag";
            }
            
            if (!$format_type{$end_tag})
            {
                warn "$ERROR Unknown \@end $end_tag\n";
                add_prev($text, $stack, "\@end $end_tag");
                next;
            }

            # we close all the macros with braces
            close_stack($text, $stack, $state, '');
            $top_stack = top_stack($stack);
            if (!$top_stack)
            {
                next if end_paragraph_style($text, $stack, $state, $end_tag);
                warn "$ERROR ended $end_tag without corresponding opening element\n";
                add_prev($text, $stack, "\@end $end_tag");
                next;
            }
            # if the previous format is a paragraph it is ended and @end end_tag 
            # is reinjected
            if ($top_stack->{'format'} eq 'paragraph')
            {
                my $paragraph = pop @$stack;
                add_prev($text, $stack, do_paragraph($paragraph->{'text'}, $state));
                next if end_paragraph_style($text, $stack, $state, $end_tag);
                $_ = "\@end $end_tag " . $_;
                next;
            }
            # if the previous format is a preformatted it is ended, @end end_tag 
            # is reinjected
            elsif ($top_stack->{'format'} eq 'preformatted')
            {
                my $paragraph = pop @$stack;
                add_prev($text, $stack, do_preformatted($paragraph->{'text'}, $state));
                next if end_paragraph_style($text, $stack, $state, $end_tag);
                $_ = "\@end $end_tag " . $_;
                next;
            }
            my $top_not_end_tag;
            # Warn if the format on top of stack is not compatible with the 
            # end tag, and find the end tag.
            if (
                ( 
                 ($format_type{$end_tag} eq 'menu') and 
                 ($top_stack->{'format'} ne $end_tag and
                 ($top_stack->{'format'} ne 'menu_preformatted') and
                 ($top_stack->{'format'} ne 'menu_comment') and
                 ($top_stack->{'format'} ne 'menu_description'))
                ) or
                ( 
                 ($end_tag eq 'multitable') and 
		 ($top_stack->{'format'} ne 'cell') and
                 ($top_stack->{'format'} ne $end_tag) and
		 ($top_stack->{'format'} ne 'null')
                ) or
                ( 
                 ($format_type{$end_tag} eq 'list' ) and 
                 ($top_stack->{'format'} ne 'item') and
                 ($top_stack->{'format'} ne $end_tag)
                ) or
                (
                 ($format_type{$end_tag} eq 'table') and 
                 ($end_tag ne 'multitable') and 
                 ($top_stack->{'format'} ne 'term') and
                 ($top_stack->{'format'} ne 'line') and 
                 ($top_stack->{'format'} ne $end_tag)
                ) or
                (
                 (defined($def_map{$end_tag})) and 
                 ($top_stack->{'format'} ne 'deff_item') and
                 ($top_stack->{'format'} ne $end_tag)
                )
               )
            {
		    #print STDERR "top_stack $top_stack->{'format'}\n";
                warn  "$WARN \@end $end_tag without opening element\n";
                $top_not_end_tag = 1;
            }
            elsif (($top_stack->{'format'} ne $end_tag) and 
               ($end_tag ne 'menu') and
               ($format_type{$end_tag} ne 'table') and ($format_type{$end_tag} ne 'list') and !defined($def_map{$end_tag})) 
            {
                warn "$ERROR waiting for end of $top_stack->{'format'}, found $end_tag\n";
                $top_not_end_tag = 1;
            }
            if ($top_not_end_tag)
            {
                close_stack($text, $stack, $state, undef, $end_tag);
                # an empty preformatted may appear when closing things as
                # when closed formats reopen the preformatted environment
                # if there is some text following, which isn't the case here.
                close_paragraph($text, $stack, $state);
            }
            # We should now be able to handle the format
            if (defined($format_type{$end_tag}) and $format_type{$end_tag} ne 'fake')
            {
                end_format($text, $stack, $state, $end_tag);
                next;
            }
            else 
            { # this is a fake format, ie a format used internally, inside
              # a real format. We do nothing, hoping the real format will get
              # get closed, closing the fake internal formats
		    #warn "$WARN Unknown \@end $end_tag\n";
		    #add_prev($text, $stack, "\@end $end_tag");
            }
            next;
        }
        # This is a macro
        elsif (s/^([^{}@]*)\@([a-zA-Z]\w*|["'~\@\}\{,\.!\?\s*\-\^`=:])//o)
        {
            add_prev($text, $stack, do_text($1, $state));
            my $macro = $2;
	    #print STDERR "MACRO $macro\n";
            # This is a macro added by close_stack to mark paragraph end
            if ($macro eq 'end_paragraph')
            {
                my $top_stack = top_stack($stack);
                if (!$top_stack or !$top_stack->{'format'} 
                    or ($top_stack->{'format'} ne 'paragraph'))
                {
                    print STDERR "Bug: end_paragraph but no paragraph to end\n";
                    dump_stack ($text, $stack, $state);
                    next;
                }
                s/^\s//;
                my $paragraph = pop @$stack;
                add_prev ($text, $stack, do_paragraph($paragraph->{'text'}, $state));
                next;
            }
            # Handle macro added by close_stack to mark preformatted region end
            elsif ($macro eq 'end_preformatted')
            {
                my $top_stack = top_stack($stack);
                if (!$top_stack or !$top_stack->{'format'} 
                    or ($top_stack->{'format'} ne 'preformatted'))
                {
                    print STDERR "Bug: end_preformatted but no preformatted to end\n";
                    dump_stack ($text, $stack, $state);
                    next;
                }
                my $paragraph = pop @$stack;
                s/^\s//;
                add_prev ($text, $stack, do_preformatted($paragraph->{'text'}, $state));
                next;
            }
            # This is a @macroname{...} construct. We add it on top of stack
            # It will be handled when we encounter the '}'
            if (s/^{//)
            {
                if ($macro eq 'verb')
                {
                    if (/^$/)
                    {
                        warn "$ERROR verb at end of line";
                    }
                    else
                    {
                        s/^(.)//;
                        $state->{'verb'} = $1;
                    }
                } #FIXME what to do if remove_texi and anchor/ref/footnote ?
                $state->{'keep_texi'}++ if ($macro eq 'anchor' or ($macro =~ /^(x|px|info|)ref$/o) or $macro eq 'footnote');
                push (@$stack, { 'style' => $macro, 'text' => '' });
                next;
            }

            # if we're keeping texi unmodified we can do it now
            if ($state->{'keep_texi'})
            {
                add_prev($text, $stack, "\@$macro");
                if ($text_macros{$macro} and $text_macros{$macro} eq 'raw')
                {
                    $state->{'raw'} = $macro;
                    push (@$stack, {'style' => $macro, 'text' => ''});
                }
                next;
            }
            # If we are removing texi, the following macros are not removed 
            # as is but modified

            # a raw macro beginning
            if ($text_macros{$macro} and $text_macros{$macro} eq 'raw')
            {
                unless ($macro eq 'html')
                { # close paragraph before verbatim (and tex if !L2H)
		    #my $result = close_paragraph($text, $stack, $state, $macro);
                    if (close_paragraph($text, $stack, $state))
		    #if ($result)
                    {
			    #$_ = $result . $_;
                        $_ = "\@$macro " . $_;
                        next;
                    }
                }
                $state->{'raw'} = $macro;
                push (@$stack, {'style' => $macro, 'text' => ''});
                return if (/^\s*$/);
                next;
            }
            # An accent macro
            if (defined($accent_map{$macro}))
            {
                if (s/^([^\s])//o)
                {
                    add_prev ($text, $stack, do_simple($macro, $1));
                }
                else
                { # The accent is at end of line
                    add_prev ($text, $stack, do_text($macro, $state));
                }
                next;
            }
            # a macro which should be like @macroname{}. We handle it...
            if ($things_map{$macro})
            {
                warn "$WARN $macro requires {}\n";
                add_prev ($text, $stack, do_simple($macro, '', $state));
                next;
            }
            # a macro like @macroname
            if (defined($simple_map{$macro}))
            {
                add_prev($text, $stack, do_simple($macro, '', $state));
                next;
            }
            # the following macros are not modified but just ignored 
            # if we are removing texi
            next if ($state->{'remove_texi'});
            if (($macro =~ /^(\w+?)index$/) and ($1 ne 'print'))
            {
                add_prev($text, $stack, do_index_entry_label($state));
                return;
            }
            # a macro which triggers paragraph closing
            if ($macro =~ /^tex_(\d+)$/o or $macro eq 'insertcopying')
            {
                if (close_paragraph($text, $stack, $state))
                {
			#$_ = $result . $_;
                    $_ = "\@$macro " . $_;
                }
		else
                {
                    if ($macro =~ /^tex_(\d+)$/o)
                    {
                        add_prev ($text, $stack, do_tex($1));
                    }
                    else
                    {
                        add_prev ($text, $stack, do_insertcopying($state));
                    }
                    # reopen a preformatted format if it was interrupted by the tex
                    begin_paragraph ($stack, $state) if ($state->{'preformatted'});
                }
                next;
            }
            if ($macro =~ /^itemx?$/)
            {
		    #print STDERR "ITEM\n";
		    #dump_stack($text, $stack, $state);
                # these functions return trus if the context was their own
                next if (add_item($text, $stack, $state)); # handle lists
                next if (add_term($text, $stack, $state)); # handle table
                next if (add_line($text, $stack, $state)); # handle table
	        my $format = add_row ($text, $stack, $state); # handle multitable
                unless ($format)
                {
                    warn "$WARN \@item outside of table or list\n";
                    next;
                }
                push @$stack, {'format' => 'row', 'text' => ''};
                if ($format->{'max_columns'})
                {
                    push @$stack, {'format' => 'cell', 'text' => ''};
                    $format->{'cell'} = 1;
                    begin_paragraph($stack, $state);			
                }
                else
                {
                    warn "$WARN \@$macro in empty multitable\n";
                }
                next;
            }
            if ($macro eq 'tab')
            {
	        my $format = add_cell ($text, $stack, $state);
                #print STDERR "tab, $format->{'cell'}, max $format->{'max_columns'}\n";
                unless ($format)
                {
                    warn "$WARN \@tab outside of multitable\n";
                    next;
                }
                if ($format->{'cell'} > $format->{'max_columns'})
                {
                    warn "$WARN cell over table width\n";
                    push @$stack, {'format' => 'null', 'text' => ''};
                }
                else
                {
                    push @$stack, {'format' => 'cell', 'text' => ''};
                    begin_paragraph($stack, $state);			
                }
                next;
            }
            # Macro opening a format (table, list, deff, example...)
            if ($format_type{$macro} and ($format_type{$macro} ne 'fake'))
            {
                if (close_paragraph($text, $stack, $state))
                {
                    $_ = "\@$macro " . $_;
                    next;
                }
		#print STDERR "begin $macro\n";
                # A deff like macro
                if (defined($def_map{$macro}))
                {
                    if ($state->{'deff'} and ("$state->{'deff'}x" eq $macro))
                    {
                         $macro =~ s/x$//o;
                         #print STDERR "DEFx $macro\n";
                    }
                    else
                    {
                         begin_deff_item($stack, $state, 1) if ($state->{'deff'});
                         $macro =~ s/x$//o;
                         #print STDERR "DEF begin $macro\n";
                         push @$stack, { 'format' => $macro, 'text' => '' };
                    }
                    #print STDERR "BEGIN_DEFF $macro\n";
                    #dump_stack ($text, $stack, $state);
                    add_prev ($text, $stack, &$t2h_def_line($macro, $_, $state));
                    return;
                }
                elsif ($format_type{$macro} eq 'menu')
                {
                    $state->{'menu'}++;
                    push @$stack, { 'format' => $macro, 'text' => '' };
                    if ($state->{'preformatted'})
                    {
                    # Start a fake complex format in order to have a given pre style
                        $state->{'preformatted'}++;
                        push @$stack, { 'format' => 'menu_preformatted', 'text' => '', 'pre_style' => $T2H_MENU_PRE_STYLE };
                        push @{$state->{'preformatted_stack'}}, $T2H_MENU_PRE_STYLE;
                    }
                    next;
                }
                elsif (exists ($complex_format_map->{$macro}))
                {
                    $state->{'preformatted'}++;
                    my $format = { 'format' => $macro, 'text' => '', 'pre_style' => $complex_format_map->{$macro}->{'pre_style'} };
                    push @{$state->{'preformatted_stack'}}, $complex_format_map->{$macro}->{'pre_style'};
                    push @$stack, $format;
		    push @$stack, { 'format' => 'preformatted', 'text' => '' };
                    next;
                }
                elsif ($paragraph_style{$macro})
                {
                    if (/^\s*$/)
                    {
                        next if ($macro eq 'center');
                    }    
                    else
                    {
                        begin_paragraph($stack, $state);			
                    }    
                    push @{$state->{'paragraph_style'}}, $paragraph_style{$macro};
                    next;
                }
                elsif (($format_type{$macro} eq 'list') or ($format_type{$macro} eq 'table'))
                {
                    my $format;
		    #print STDERR "BEGIN $macro\n";
		    #dump_stack($text, $stack, $state);
                    if (($macro eq 'itemize') or ($macro =~ /^(|v|f)table$/))
                    {
                        my $command;
                        ($_, $command) = parse_format_command ($_);
                        $format = { 'format' => $macro, 'text' => '', 'command' => $command, 'term' => 0 };
                    }
                    elsif ($macro eq 'enumerate')
                    {
                        my $spec;
                        ($_, $spec) = parse_enumerate ($_);
                        $format = { 'format' => $macro, 'text' => '', 'spec' => $spec };
                    }
                    elsif ($macro eq 'multitable')
                    {
                        my $max_columns = parse_multitable ($_);
                        if (!$max_columns)
                        {
                            warn "$WARN empty multitable\n";
                            $max_columns = 0;
                        }
                        $format = { 'format' => $macro, 'text' => '', 'max_columns' => $max_columns, 'cell' => 1 };
                    }
                    $format->{'first'} = 1;
                    push @$stack, $format;
                    push @{$state->{'format_stack'}}, $format;
                    if ($macro =~ /^(|v|f)table$/)
                    {
                        push @$stack, { 'format' => 'line', 'text' => ''};
                    }
                    elsif ($macro eq 'multitable')
                    {
                        if ($format->{'max_columns'})
                        {
                            push @$stack, { 'format' => 'row', 'text' => ''};
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
                    if (($macro ne 'multitable') or ($format->{'max_columns'}))
                    {
                        begin_paragraph($stack, $state);
                    }
		    #dump_stack ($text, $stack, $state);
                    return if ($macro eq 'multitable');
                    next;
                }
                # keep this one at the end as there are some other formats
                # which are also in format_map
                elsif (defined($format_map{$macro}))
                {
                    push @$stack, { 'format' => $macro, 'text' => '' };
                    push @$stack, { 'format' => 'preformatted', 'text' => ''} if ($state->{'preformatted'});
                }
                next;
            }
            warn "$WARN Unknown macro `$macro' (left as is)\n";
            add_prev ($text, $stack, do_text("\@$macro"));
            next;
        }
        elsif(s/^([^{}@]*)\@(.)//o)
        { # A character which shouldn't appear in macro name
            my $chomped_line = $line;
            chomp($chomped_line);
            warn "$ERROR Unknown command: `$2', line: $chomped_line\n";
            add_prev($text, $stack, do_text("\@$2"));
            next;
        }
        elsif (s/^([^{}]*)([{}])//o)
        {
            add_prev($text, $stack, do_text($1, $state));
            if ($2 eq '{')
            {
                if ($state->{'keep_texi'} or $state->{'remove_texi'})
                {
                    add_prev($text, $stack, '{' );
                }
		else
                {
                    add_prev($text, $stack, '{<!-- brace without macro -->');
                    warn "$ERROR '{' without macro line: $line";
                }
            }
            else
            { # A @macroname{ ...} is closed
                if (@$stack)
                {
                    my $style = pop @$stack;
                    my $result;
                    if ($state->{'remove_texi'})
                    {
                        add_prev ($text, $stack, $texi_map{$style->{'style'}}) if (defined($texi_map{$style->{'style'}}));
                        add_prev ($text, $stack, $style->{'text'});
                        next;
                    }

                    if ($style->{'style'})
                    {
                        $style->{'no_close'} = 1 if ($state->{'no_close'});
                        if (($state->{'keep_texi'} > 1) and (($style->{'style'} eq 'anchor') or ($style->{'style'} =~ /^(x|px|info|)ref$/o) or ($style->{'style'} eq 'footnote')))
                        { 
                            $state->{'keep_texi'}--;
                            $result = '@' . $style->{'style'} . '{' . $style->{'text'} . '}';
                        }
                        elsif ($style->{'style'} eq 'anchor')
                        {
                            $state->{'keep_texi'}--;
                            $result = do_anchor_label($style->{'text'});
                        }
                        elsif ($style->{'style'} =~ /^(x|px|info|)ref$/o)
                        {
                            $state->{'keep_texi'}--;
                            $result = do_xref($style->{'style'}, $style->{'text'}, $state);
                        }
                        elsif ($style->{'style'} eq 'footnote')
                        {
                             $state->{'keep_texi'}--;
                             $result = do_footnote($style->{'style'}, $style->{'text'}, $state);
                        }
                        elsif($state->{'keep_texi'})
                        { # don't expand macros in anchor and ref
                            $result = '@' . $style->{'style'} . '{' . $style->{'text'} . '}';
                        }
                        elsif ($style->{'style'} eq 'image')
                        {
                            $result = do_image($style->{'style'}, $style->{'text'}, $state);
                        }
                        else
                        {
                             $result = do_simple($style->{'style'}, $style->{'text'}, $state, $style->{'no_open'}, $style->{'no_close'});
                        }
                    }
                    else
                    {
                        $result = $style->{'text'} . '}';
                    }
                    add_prev ($text, $stack, $result);
                    next;
                }
                else
                {
                    warn "$ERROR '}' without opening '{' line: $line";
                    add_prev ($text, $stack, '}') if ($state->{'keep_texi'});
                }
            }
        }
        else
        { # no macro nor  '}', but normal text
            add_prev($text, $stack, do_text($_, $state));
	    #print STDERR "END LINE: $_";
	    #dump_stack($text, $stack, $state);

            # @item line is closed by end of line
            add_term($text, $stack, $state);
            if ($state->{'paragraph_style'}->[-1] eq 'center')
            {
                $_ = "\@end center\n";
                next;
            }
            last;
        }
    }
    return undef;
}

sub get_value($)
{
    my $value = shift;
    return $value{$value} if ($value{$value});
    return "No value for $value";
} 

sub add_term($$$;$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $end = shift;
    return unless (exists ($state->{'format_stack'}));
    my $format = $state->{'format_stack'}->[-1];
    return unless (($format_type{$format->{'format'}} eq 'table') and ($format->{'format'} ne 'multitable' ) and $format->{'term'});
    #print STDERR "ADD_TERM\n";
    # we set 'term' = 0 early such that if we encounter an end of line
    # during close_stack we don't try to do the term once more
    $state->{'format_stack'}->[-1]->{'term'} = 0;
    if ($format->{'command'} and $stack->[-1]->{'style'} and ($stack->[-1]->{'style'} eq $format->{'command'}))
    {
        my $style = pop @$stack;
        add_prev($text, $stack, do_simple($style->{'style'}, $style->{'text'}, $state));
    }
    # no <pre> allowed in <dt>, thus it is possible there is a @t added
    # to have teletype in preformatted.
    if ($state->{'preformatted'} and $stack->[-1]->{'style'} and ($stack->[-1]->{'style'} eq 't'))
    {
        my $style = pop @$stack;
        add_prev($text, $stack, do_simple($style->{'style'}, $style->{'text'}, $state));
    }

    #dump_stack($text, $stack, $state);
    close_stack($text, $stack, $state, undef, 'term');
    my $term = pop @$stack;
    my $index_entry = ($format->{'format'} =~ /^(f|v)/);
    add_prev($text, $stack, &$t2h_table_item($term->{'text'}, $index_entry, $state));
    unless ($end)
    {
        push (@$stack, { 'format' => 'line', 'text' => '' });
        begin_paragraph($stack, $state);			
    }
    return 1;
}

sub add_row($$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $format = $state->{'format_stack'}->[-1];
    return unless ($format->{'format'} eq 'multitable');
    if ($format->{'cell'} > $format->{'max_columns'})
    {
        close_stack($text, $stack, $state, undef, 'null');
        pop @$stack;
    }
    unless ($format->{'max_columns'})
    {
        pop @$stack; # pop 'row'
        return $format;
    }
    if ($format->{'first'})
    {
        $format->{'first'} = 0;
        if ($stack->[-1]->{'format'} and ($stack->[-1]->{'format'}  eq 'paragraph') and ($stack->[-1]->{'text'} =~ /^\s*$/) and ($format->{'cell'} == 1))
        {
            pop @$stack;
            pop @$stack;
            pop @$stack;
            return $format;
        }
    }
    add_cell($text, $stack, $state);
    my $row = pop @$stack;    
    add_prev($text, $stack, &$t2h_row($row->{'text'}));
    return $format;
}

sub add_cell($$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $format = $state->{'format_stack'}->[-1];
    return unless ($format->{'format'} eq 'multitable');
    if ($format->{'cell'} <= $format->{'max_columns'})
    {
        close_stack($text, $stack, $state, undef, 'cell');
        my $cell = pop @$stack;
        add_prev($text, $stack, &$t2h_cell($cell->{'text'}));
        $format->{'cell'}++;
    }
    return $format;
}

sub add_line($$$;$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $end = shift;
    my $format = $state->{'format_stack'}->[-1]; 
    return unless ($format_type{$format->{'format'}} eq 'table' and ($format->{'format'} ne 'multitable') and ($format->{'term'} == 0));
    #print STDERR "ADD_LINE\n";
    #dump_stack($text, $stack, $state);
    # as in pre the end of line are kept, we must explicitely abort empty
    # preformatted, close_stack doesn't abort the empty preformatted regions.
    abort_empty_preformatted($stack, $state) if ($format->{'first'});
    close_stack($text, $stack, $state, undef, 'line');
    my $line = pop @$stack;
    my $first = 0;
    $first = 1 if ($format->{'first'});
    if ($first)
    {
        $format->{'first'} = 0;
        # we must have <dd> or <dt> following <dl> thus we do a 
        # &$t2h_table_line here too, although it could have been nice to
        # have a normal paragraph.
        add_prev($text, $stack, &$t2h_table_line($line->{'text'})) if ($line->{'text'} =~ /[^\s]/o);
    }
    else
    {
        add_prev($text, $stack, &$t2h_table_line($line->{'text'}));
    }
    unless($end)
    {
        push (@$stack, { 'format' => 'term', 'text' => '' });
        # we cannot have a preformatted in table term (no <pre> in <dt>)
        # thus we set teletyped style @t if there is no pre_style
        push (@$stack, { 'style' => 't', 'text' => '' }) if ($state->{'preformatted'} and (!$state->{'preformatted_stack'}->[-1]));
        push (@$stack, { 'style' => $format->{'command'}, 'text' => '' }) if ($format->{'command'});
    }
    $format->{'term'} = 1;
    return 1;
}

sub add_item($$$;$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $end = shift;
    my $format = $state->{'format_stack'}->[-1];
    return unless ($format_type{$format->{'format'}} eq 'list');
    #print STDERR "ADD_ITEM: \n";
    # as in pre the end of line are kept, we must explicitely abort empty
    # preformatted, close_stack doesn't do that.
    abort_empty_preformatted($stack, $state) if ($format->{'first'});
    close_stack($text, $stack, $state, undef, 'item');
    #dump_stack ($text, $stack, $state);
    my $item = pop @$stack;
    # the element following ol or ul must be li. Thus even though there
    # is no @item we put a normal item.
    if ($format->{'first'})
    {
        $format->{'first'} = 0;
        add_prev($text, $stack, &$t2h_list_item($item->{'text'})) if ($item->{'text'} =~ /[^\s]/o);
    }
    else
    {
        add_prev($text, $stack, &$t2h_list_item($item->{'text'}));
    }
    unless($end)
    {
        push (@$stack, { 'format' => 'item', 'text' => '' });
        begin_paragraph($stack, $state);
    }
    return 1;
}

sub do_simple($$$;$$)
{
    my $macro = shift;
    my $text = shift;
    my $state = shift;
    my $no_open = shift;
    my $no_close = shift;
    my $result;
    if (defined($simple_map{$macro}))
    {
        if ($state->{'keep_texi'})
        {
             return "\@$macro";
        }
        elsif ($state->{'remove_texi'})
        {
             return  $simple_map_texi{$macro};
        }
        elsif ($state->{'preformatted'})
        {
             return $simple_map_pre{$macro};
        }
        else
        {
             return $simple_map{$macro};
        }
    }
    if (defined($things_map{$macro}))
    {
        if ($state->{'keep_texi'})
        {
             $result = "\@$macro" . '{}';
        }
        elsif ($state->{'remove_texi'})
        {
             $result =  $texi_map{$macro};
        }
        elsif ($state->{'preformatted'})
        {
             $result = $pre_map{$macro};
        }
        else 
        {
             $result = $things_map{$macro};
        }
        return $result . $text;
    }
    elsif (defined($style_map{$macro}))
    {
        if ($state->{'keep_texi'})
        {
             $result = "\@$macro" . '{' . $text . '}';
        }
        elsif ($state->{'remove_texi'})
        {
             $result = $text;
        }
        else 
        {
             $result = apply_style($macro, $text, $state->{'preformatted'}, $no_open, $no_close);
        }
        return $result;
    }
    # Unknown macro
    $result = '';
    unless ($no_open)
    {
        warn "$WARN Unknown macro $macro\n";
        $result = "\@$macro" . '{' ;
    }
    $result .= $text;
    $result .= '}' unless ($no_close); 
    return $result;
}

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

sub add_prev ($$;$)
{
    my $text = shift;
    my $stack = shift;
    my $string = shift;

    unless (defined($text) and ref($text) eq "SCALAR")
    {
       die "text not a SCALAR ref: " . ref($text) . "";
    }
    if (!defined($stack) or (ref($stack) ne "ARRAY"))
    {
        $string = $stack;
        $stack = [];
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

# close the stack, closing macros and formats left open.
# the precise behavior of the function depends on $close_paragraph:
#  undef   -> close everything
#  defined -> remove empty paragraphs, close until the first format or paragraph.
#      1          -> don't close styles, duplicate stack of styles not closed
#      ''         -> close styles, don't duplicate
# if a $format is given the stack is closed according to $close_paragraph but
# if $format is encountered the closing stops

sub close_stack($$$;$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    my $close_paragraph = shift;
    my $format = shift;
    my $new_stack;
    
    # abort empty paragraphs
    abort_empty_paragraph($stack, $state) if (defined($close_paragraph));

    # cancel paragraph states
    $state->{'paragraph_style'} = [ '' ] unless (defined($close_paragraph) or defined($format));
    return ($text, $stack, $state, $new_stack) unless (@$stack or $state->{'raw'} or $state->{'macro'} or $state->{'macro_name'} or $state->{'ignored'} or $state->{'copying'});
    
    my $stack_level = $#$stack + 1;
    my $string = '';
    my $verb = '';
    
    if ($state->{'verb'})
    {
        $string .= $state->{'verb'};
        $verb = $state->{'verb'};
    }
    if ($state->{'raw'})
    {
        if (defined($close_paragraph))
        {
            print STDERR "Bug: close_paragraph is true and we're in raw";
        }
        $string .= "\@end $state->{'raw'} ";
        warn "$WARN closing $state->{'raw'}\n"; 
        $stack_level--;
    }
    if ($state->{'ignored'})
    {
        $string .= "\@end $state->{'ignored'} ";
        warn "$WARN closing $state->{'ignored'}\n"; 
    }
    if ($state->{'macro'})
    {
        $string .= "\@end macro ";
        warn "$WARN closing macro\n"; 
    }
    if ($state->{'macro_name'})
    {
        $string .= ('}' x $state->{'macro_depth'}) . " ";
        warn "$WARN closing $state->{'macro_name'} ($state->{'macro_depth'} braces missing)\n"; 
    }
    if ($state->{'copying'})
    {
        $string .= '@end copying ' x $state->{'copying'};
        warn "$WARN closing $state->{'copying'} copying\n"; 
    }
    
    #debugging
    my $print_format = 'NO FORMAT';
    $print_format = $format if ($format);
    my $print_close_paragraph = 'close everything';
    $print_close_paragraph = 'close paragraph without duplicating' if (defined($close_paragraph));
    $print_close_paragraph = $close_paragraph if ($close_paragraph);
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
                $string .= "\@end_paragraph ";
            }
            elsif ($stack_format eq 'preformatted')
            {
                $string .= "\@end_preformatted ";
            }
            else
            {
                if ($fake_format{$stack_format})
                {
                    warn "# Closing a fake format `$stack_format'\n" if ($T2H_VERBOSE);
                }
                else
                {
                    warn "$WARN closing `$stack_format'\n"; 
                }
                $string .= "\@end $stack_format ";
            }
        }
        else
        {
            my $style =  $stack->[$stack_level]->{'style'};
            # FIXME images, footnotes, xrefs, anchors with $close_paragraphs ?
            if ($close_paragraph)
            { #duplicate the stack
                push @$new_stack, { 'style' => $style, 'text' => '', 'no_open' => 1 };
                $string .= '} ';
            }
            else
            {
                dump_stack ($text, $stack, $state) if (!defined($style)); 
                $string .= '} ';
                warn "$WARN closing $style\n" if ($style); 
            }
        }
    }
    $state->{'no_close'} = 1 if ($close_paragraph);
    $state->{'close_stack'} = 1;
    if ($string)
    {
        if ($state->{'texi'})
        {
		#print STDERR "scan_texi in close_stack ($string)\n";
            scan_texi ($string, $text, $stack, $state);
        }
        elsif ($state->{'structure'})
        {
		#print STDERR "scan_structure in close_stack ($string)\n";
            scan_structure ($string, $text, $stack, $state);
        }
        else
        {
		#print STDERR "scan_line in close_stack ($string)\n";
            scan_line ($string, $text, $stack, $state);
        }
    }
    delete $state->{'no_close'};
    delete $state->{'close_stack'};
    $state->{'verb'} = $verb if ($verb and $close_paragraph);
    return ($text, $stack, $state, $new_stack);
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


sub close_paragraph($$$)
{
    my $text = shift;
    my $stack = shift;
    my $state = shift;
    #my $macro = shift;
    #print STDERR "CLOSE_PARAGRAPH\n";
    #dump_stack($text, $stack, $state);
    close_stack($text, $stack, $state, '');
    my $top_stack = top_stack($stack);
    if ($top_stack and $top_stack->{'format'} eq 'paragraph')
    {
        my $paragraph = pop @$stack;
        add_prev($text, $stack, do_paragraph($paragraph->{'text'}, $state));
        return 1;
	#return "\@$macro ";
    }
    elsif ($top_stack and $top_stack->{'format'} eq 'preformatted')
    {
        my $paragraph = pop @$stack;
        add_prev($text, $stack, do_preformatted($paragraph->{'text'}, $state));
        return 1;
	#return "\@$macro ";
    }
    return;
}

sub abort_empty_paragraph($$)
{
    my $stack = shift;
    my $state = shift;
    if (@$stack and $stack->[-1]->{'format'} 
       and ($stack->[-1]->{'format'} eq 'paragraph')
       and ($stack->[-1]->{'text'} !~ /[^\s]/))
    {
        pop @$stack;
        delete $state->{'paragraph'};
        $state->{'paragraph_nr'}--;
        return 1;
    }
    return 0;
}

sub abort_empty_preformatted($$)
{
    my $stack = shift;
    my $state = shift;
    if (@$stack and $stack->[-1]->{'format'} 
       and ($stack->[-1]->{'format'} eq 'preformatted')
       and ($stack->[-1]->{'text'} !~ /[^\s]/))
    {
        pop @$stack;
        return 1;
    }
    return 0;
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
    print STDERR "state: ";
    foreach my $key (keys(%$state))
    {
        my $value = 'UNDEF';
        $value = $state->{$key} if (defined($state->{$key}));
        print STDERR "$key: $value ";
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
    if (defined($state->{'format_stack'}))
    {
        print STDERR "format_stack: ";
        foreach my $format (@{$state->{'format_stack'}})
        {
            print STDERR "$format->{'format'} ";
        }
        print STDERR "\n";
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

sub substitute_line($)
{
    my $line = shift;
    return substitute_text({ 'no_paragraph' => 1 }, $line);
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
    else
    {
        initialise_state($state);
    }
    #print STDERR "SUBST_TEXT begin\n";
    
    while (@_)
    {
        my $line = shift @_;
        next unless (defined($line));
        if ($state->{'structure'})
        {
            scan_structure ($line, \$text, \@stack, $state);
        }
        else
        {
            scan_line ($line, \$text, \@stack, $state);
        }
        next if (@stack);
        $result .= $text;
        $text = '';
    }
    close_stack (\$text, \@stack, $state);
    #print STDERR "SUBST_TEXT end\n";
    return $result . $text;
}

sub substitute_texi_line($)
{
    my $text = shift;
    my @result = substitute_text({'structure' => 1}, $text);
    return '' unless (@result);
    my $result = shift @result;
    foreach my $line (@result)
    {
        chomp $line;
        $result .= ' ' . $line;
    }
    return $result;
}

sub t2h_print_lines($;$)
{
    my ($fh, $lines) = @_;
    $lines = $T2H_THIS_SECTION unless $lines;
    my @cnt;
    my $cnt = 0;
    for my $line (@$lines)
    {
        print $fh $line;
	if ($T2H_WORDS_IN_PAGE and ($T2H_SPLIT eq 'node'))
        {
            @cnt = split(/\W*\s+\W*/, $line);
            $cnt += scalar(@cnt);
        }
    }
    return $cnt;
}

sub do_index_entry_label($)
{
    my $state = shift;
    my $entry = shift @index_labels;
    if (!defined($entry))
    {
        print STDERR "Bug: not enough index entries\n";
        return '';
    }
    
    print STDERR "[(index) $entry->{'entry'} $entry->{'label'}]\n"
        if ($T2H_DEBUG & $DEBUG_INDEX);
    return &$t2h_index_entry_label ($entry->{'label'}, $state->{'preformatted'});
}

# main processing is called here
SetDocumentLanguage('en') unless ($T2H_WORDS);
# APA: There's got to be a better way:
$things_map{'today'} = T2h_i18n::pretty_date($T2H_LANG);
$T2H_TODAY = T2h_i18n::pretty_date($T2H_LANG);  # like "20 September 1993";
my $T2H_USER = "unknown";
if ($T2H_TEST)
{
    # to generate files similar to reference ones to be able to check for
    # real changes we use these dummy values if -test is given
    $T2H_TODAY = 'a sunny day';
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
    $T2H_USER = $ENV{'USERNAME'} unless defined $T2H_USER;
}
# Set the body text
&$t2h_set_body_text();
# this is used in footer
unless (defined($T2H_ADDRESS))
{
    $T2H_ADDRESS = &$t2h_address($T2H_USER, $T2H_TODAY);
}

open_file($docu);
pass_texi();
dump_texi(\@lines, 'texi') if ($T2H_DEBUG & $DEBUG_TEXI);
# do copyright notice inserted in comment at the begining of the files
$copying_comment = &$t2h_comment(remove_texi(@copying_lines)) . "\n" if (@copying_lines);
pass_structure();
dump_texi(\@doc_lines, 'first') if ($T2H_DEBUG & $DEBUG_TEXI);
exit(0) if $T2H_DUMP_TEXI;
rearrange_elements();
do_names();
&$T2H_toc_body(\@elements_list, $do_contents, $do_scontents);
$sec_num = 0;
$T2H_L2H = l2h_FinishToLatex() if ($T2H_L2H);
$T2H_L2H = l2h_ToHtml()        if ($T2H_L2H);
$T2H_L2H = l2h_InitFromHtml()  if ($T2H_L2H);
pass_text();
do_node_files() if ($T2H_SPLIT ne 'node' and $T2H_NODE_FILES);
l2h_FinishFromHtml() if ($T2H_L2H);
l2h_Finish() if($T2H_L2H);
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
