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
            $T2H_USE_GLOSSARY 
            $T2H_INVISIBLE_MARK 
            $T2H_USE_ISO 
            $T2H_TOP_FILE 
            $T2H_TOC_FILE
            $T2H_FRAMES
            $T2H_SHOW_MENU
            $T2H_NUMBER_SECTIONS
            $T2H_NODE_NAME_IN_MENU
            $T2H_AVOID_MENU_REDUNDANCY
            $T2H_SECTION_NAVIGATION
            $T2H_SHORTEXTN 
            $T2H_OUT 
            $T2H_DEF_TABLE 
            $T2H_LANG 
            $T2H_L2H 
            $T2H_L2H_L2H 
            $T2H_L2H_SKIP 
            $T2H_L2H_TMP 
            $T2H_L2H_CLEAN 
            @T2H_INCLUDE_DIRS 

            $T2H_NO_NODE
            $T2H_WARN_PREV_NEXT
            $T2H_CENTER_IMAGE
            $T2H_EXAMPLE_INDENT_CELL
            $T2H_SMALL_EXAMPLE_INDENT_CELL
            $T2H_SMALL_FONT_SIZE
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
            %T2H_ACTIVE_ICONS
            %T2H_NAVIGATION_TEXT
            %T2H_PASSIVE_ICONS
            %T2H_BUTTONS_GOTO
            @T2H_CHAPTER_BUTTONS
            @T2H_MISC_BUTTONS
            @T2H_SECTION_BUTTONS

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
            $T2H_PRE_ABOUT
            $T2H_AFTER_ABOUT

            $T2H_OVERVIEW
            $T2H_THIS_SECTION
            %T2H_HREF
            %T2H_NAME
            %T2H_NODE
            %T2H_THISDOC

            %value
            %user_sub

            $complex_format_map
            $index_properties
            %accent_map
            %def_map
            %format_map
            %predefined_index
            %simple_map
            %style_map
            %things_map
            %to_skip
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
# $Id: texi2html.pl,v 1.33 2003-03-27 18:37:10 pertusus Exp $

# Homepage:
my $T2H_HOMEPAGE = "http://texi2html.cvshome.org/";

# Authors:
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

#+++############################################################################
#                                                                              #
# Constants                                                                    #
#                                                                              #
#---############################################################################

my $DEBUG_TOC   =  1;
my $DEBUG_INDEX =  2;
#my $DEBUG_   =  4;
#my $DEBUG_ =  8;
my $DEBUG_DEF   = 16;
#my $DEBUG_  = 32;
my $DEBUG_USER  = 64;
my $DEBUG_L2H   = 128;


my $FILERE = '[\/\w.+-]+';         # RE for a file name
my $VARRE = '[^\s\{\}]+';          # RE for a variable name
my $NODERE = '[^:]+';             # RE for node names

my $ERROR = "***";                 # prefix for errors
my $WARN  = "**";                  # prefix for warnings

my $MAX_LEVEL = 4;
my $MIN_LEVEL = 1;

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
# accent map, TeX command to ISO name
#
%accent_map = (
          '"',  'uml',
          '~',  'tilde',
          '^',  'circ',
          '`',  'grave',
          '\'', 'acute',
          '=', '',
         );

#
# texinfo "simple things" (@foo) to HTML ones
#
%simple_map = (
           # cf. makeinfo.c
           "*", "<br>",     # HTML+
           " ", "&nbsp;",
           "\t", "&nbsp;",
  	       "-", "&#173;",	 # soft hyphen
	       "\n", "&nbsp;",
	       "|", "",
#	       'tab', '<\/td><td>',
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

#
# texinfo "things" (@foo{}) to HTML ones
#
%things_map = (
	       'TeX', 'TeX',
	       'br', '<p>',     # paragraph break
	       'bullet', '*',
               #'copyright', '(C)',
	       'copyright', '&copy;',
	       'dots', '<small>...</small>',
	       'enddots', '<small>....</small>',
	       'equiv', '==',
	       'error', 'error-->',
	       'expansion', '==>',
	       'minus', '-',
	       'point', '-!-',
	       'print', '-|',
	       'result', '=>',
               # APA: &pretty_date requires $MONTH_NAMES and $T2H_LANG
               # to be initialized.  The latter gets initialized by
               # &SetDocumentLanguage in &main.
               # We set following hash entry in &main afterwards.
	       # 'today', &pretty_date,
	       'aa', '&aring;',
	       'AA', '&Aring;',
	       'ae', '&aelig;',
	       'oe', '&#156;',
	       'AE', '&AElig;',
	       'OE', '&#140;',
	       'o',  '&oslash;',
	       'O',  '&Oslash;',
	       'ss', '&szlig;',
	       'l', '/l',
	       'L', '/L',
	       'exclamdown', '&iexcl;',
	       'questiondown', '&iquest;',
	       'pounds', '&pound;'
              );

#
# texinfo styles (@foo{bar}) to HTML ones
#
%style_map = (
	      'acronym',    '&do_acronym',
	      'asis',       '',
	      'bullet',      '&do_bullet',
	      'b',          'b',
	      'cite',       'cite',
	      'code',       'code',
	      'command',    'code',
	      'ctrl',       '&do_ctrl',   # special case
	      'dfn',        'em',         # DFN tag is illegal in the standard
	      'dmn',        '',           # useless
	      'email',      '&do_email',  # insert a clickable email address
	      'emph',       'em',
	      'env',        'code',
	      'file',       '"tt',        # will put quotes, cf. &apply_style
	      'i',          'i',
	      'kbd',        'kbd',
	      'key',        'kbd',
	      'math',       '&do_math',
	      'option',     '"samp',      # will put quotes, cf. &apply_style
	      'r',          '',           # unsupported
	      'samp',       '"samp',      # will put quotes, cf. &apply_style
	      'sc',         '&do_sc',     # special case
	      'strong',     'strong',
	      't',          'tt',
	      'titlefont',  '',           # useless
	      'uref',       '&do_uref',   # insert a clickable URL
	      'url',        '&do_url',    # insert a clickable URL
	      'var',        'var',
          'verb',       'tt',
	      'w',          '',           # unsupported
	      'H',          '&do_accent',
	      'dotaccent',  '&do_accent',
	      'ringaccent', '&do_accent',
	      'tieaccent',  '&do_accent',
	      'u',          '&do_accent',
	      'ubaraccent', '&do_accent',
	      'udotaccent', '&do_accent',
	      'v',          '&do_accent',
	      ',',          '&do_accent',
              '=',          '&do_accent',
	      'm_cedilla',  '&do_accent',
	      'dotless',    '&do_accent'
         );

foreach my $accent (keys(%accent_map))
{
    $style_map{$accent} = '&do_accent';
}

#
# texinfo format (@foo/@end foo) to HTML ones
#
%format_map = (
	       'quotation',  'blockquote',
	       # lists
	       'itemize',    'ul',
	       'enumerate',  'ol',
	       'multitable',  'table',
	       # poorly supported 
	       #'flushleft',  'pre',
	       #'flushright', 'pre',
              );

#
# associated with these format is the align attribute of paragraphs
#

my %paragraph_style = (
      'center' => 'center',
      'flushleft' => 'left',
      'flushright' => 'right',
      );
      
# an eval of these $complex_format_map->{what}->[0] yields beginning
# an eval of these $complex_format_map->{what}->[1] yieleds end
$complex_format_map =
{
 example =>
 [
  q{"<table><tr>$T2H_EXAMPLE_INDENT_CELL<td class=\"example\"><pre>"},
  q{'</pre></td></tr></table>'}
 ],
 smallexample =>
 [
  q{"<table><tr>$T2H_SMALL_EXAMPLE_INDENT_CELL<td class=\"smallexample\"><pre><font size=\"$T2H_SMALL_FONT_SIZE\">"},
  q{'</font></pre></td></tr></table>'}
 ],
 display =>
 [
  q{"<table><tr>$T2H_EXAMPLE_INDENT_CELL<td class=\"display\"><pre style=\"font-family: serif\">"},
  q{'</pre></td></tr></table>'}
 ],
 smalldisplay =>
 [
  q{"<table><tr>$T2H_SMALL_EXAMPLE_INDENT_CELL<td class=\"smalldisplay\"><pre style=\"font-family: serif\"><font size=\"$T2H_SMALL_FONT_SIZE\">"},
  q{'</font></pre></td></tr></table>'}
 ]
};

$complex_format_map->{lisp} = $complex_format_map->{example};
$complex_format_map->{smalllisp} = $complex_format_map->{smallexample};
$complex_format_map->{format} = $complex_format_map->{display};
$complex_format_map->{smallformat} = $complex_format_map->{smalldisplay};

#
# texinfo definition shortcuts to real ones
#
%def_map = (
	    # basic commands
	    'deffn', 0,
	    'defvr', 0,
	    'deftypefn', 0,
	    'deftypeop', 0,
	    'deftypevr', 0,
	    'defcv', 0,
	    'defop', 0,
	    'deftp', 0,
	    # basic x commands
	    'deffnx', 0,
	    'defvrx', 0,
	    'deftypefnx', 0,
	    'deftypeopx', 0,
	    'deftypevrx', 0,
	    'defcvx', 0,
	    'defopx', 0,
	    'deftpx', 0,
	    # shortcuts
	    'defun', 'deffn Function',
	    'defmac', 'deffn Macro',
	    'defspec', 'deffn {Special Form}',
	    'defvar', 'defvr Variable',
	    'defopt', 'defvr {User Option}',
	    'deftypefun', 'deftypefn Function',
	    'deftypevar', 'deftypevr Variable',
	    'defivar', 'defcv {Instance Variable}',
	    'deftypeivar', 'defcv {Instance Variable}', # NEW: FIXME
	    'defmethod', 'defop Method',
	    'deftypemethod', 'defop Method', # NEW:FIXME
	    # x shortcuts
	    'defunx', 'deffnx Function',
	    'defmacx', 'deffnx Macro',
	    'defspecx', 'deffnx {Special Form}',
	    'defvarx', 'defvrx Variable',
	    'defoptx', 'defvrx {User Option}',
	    'deftypefunx', 'deftypefnx Function',
	    'deftypevarx', 'deftypevrx Variable',
	    'defivarx', 'defcvx {Instance Variable}',
	    'defmethodx', 'defopx Method',
           );

#
# things to skip
#
# Depending on the value, things following the macro may be skipped
# 
# if the value is 'line' then the remaining of the line is skipped
# if the value is 'arg' then an argument is skipped
# if the value is 'space' then any space (including new lines)
# otherwise only the macro, or @end macro is skipped
# 
%to_skip = (
	        # comments
            'comment', 'line',
            'c', 'line',
                # not needed after pass_texi
            'raisesections', 1,
            'lowersections', 1,
	        # useless
            'detailmenu', 1,
            'end detailmenu', 1,
            'direntry', 1,
            'end direntry', 1,
            'contents', 1,
            'shortcontents', 1,
            'summarycontents', 1,
            'footnotestyle', 'arg',
            # unsupported commands (formatting)
            'afourpaper', 1,
            'pagesizes', 'arg',
            'cropmarks', 1,
            'finalout', 1,
            'headings', 'arg',
            'sp', 'arg',
            'need', 'arg',
            'page', 1,
            'setchapternewpage', 'arg',
            'everyheading', 'line',
            'everyfooting', 'line',
            'evenheading', 'line',
            'evenfooting', 'line',
            'oddheading', 'line',
            'oddfooting', 'line',
            'smallbook', 1,
            'vskip', 1,
            'filbreak', 1,
            'paragraphindent', 1,
            # unsupported formats
            'cartouche', 1,
            'end cartouche', 1,
            'group', 1,
            'end group', 1,
            'refill', 'space',  # FIXME pertusus: seems bad to me to remove 
            'exdent', 'space',  # trailing spaces, but it was like that in the
            'noindent', 'space' # original code
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

# raw formats which are expanded especially
my @raw_text = ('tex', 'html', 'verbatim');

# text macros ignored based on a value
my @value_text = ('ifclear', 'ifset' );

# all the potentially ignorable text macros
my @text_macros = ('iftex', 'ignore', 'menu', 'ifplaintext', 'ifinfo', 
'ifhtml', 'html', 'tex', 'titlepage', 'ifnothtml', 'ifnottex', 
'ifnotplaintext', 'ifnotinfo', 'verbatim', 'ifclear', 'ifset' );

# text not ignored (titlepage is treated especially)
my @kept_text = ('ifinfo', 'ifhtml', 'html', 'ifnottex', 'ifnotplaintext', 
'ifnotinfo', 'verbatim', 'titlepage');

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
        print "# reading initialization file from $init_file\n"
            if ($T2H_VERBOSE);
        require($init_file);
    }
    else
    {
        print "$ERROR Error: can't read init file $init_file\n";
        $init_file = '';
    }
}

my $T2H_WORDS;
#
# called on -lang
sub SetDocumentLanguage
{
    my $lang = shift;
    $T2H_WORDS = T2h_i18n::set_language($lang);
    if (defined($T2H_WORDS))
    {
        print "# using '$lang' as document language\n" if ($T2H_VERBOSE);
        $T2H_LANG = $lang;
    }
    else
    {
        warn "$ERROR: Language specs for '$lang' do not exists. Reverting to '$T2H_LANG'\n";
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
	print "# reading initialization file from $i\n"
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

# retro compatibility
push (@T2H_EXPAND, $T2H_EXPAND) if ($T2H_EXPAND);

push (@kept_text, 'menu') if ($T2H_SHOW_MENU);

foreach my $expanded (@T2H_EXPAND)
{
    push (@kept_text, "if$expanded") unless grep {"if$expanded" eq $_} @kept_text;
    push (@kept_text, "$expanded") unless grep {"$expanded" eq $_} @kept_text;
}

$T2H_INVISIBLE_MARK = '<img src="invisible.xbm" alt="">' if $T2H_INVISIBLE_MARK eq 'xbm';

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
            print "# created directory $T2H_SUBDIR\n" if ($T2H_VERBOSE);
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
    print "# putting result files into directory $docu_rdir\n" if ($T2H_VERBOSE);
}
else
{
    if ($T2H_OUT && $T2H_OUT =~ m|(.*)/|)
    {
        $docu_rdir = "$1/";
        print "# putting result files into directory $docu_rdir\n" if ($T2H_VERBOSE);
    }
    else
    {
        print "# putting result files into current directory \n" if ($T2H_VERBOSE);
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
if (! $T2H_OUT && ($T2H_SPLIT =~ /section/i || $T2H_SPLIT =~ /node/i))
{
    $T2H_SPLIT = 'section';
}
elsif (! $T2H_OUT && $T2H_SPLIT =~ /chapter/i)
{
    $T2H_SPLIT = 'chapter'
}
else
{
    $T2H_SPLIT = '';
}

$docu_doc = "$docu_name.$docu_ext"; # document's contents
if ($T2H_SPLIT)
{
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
    print "# reading extensions from $extensions\n" if $T2H_VERBOSE;
    require($extensions);
}
my $progdir;
($progdir = $0) =~ s/[^\/]+$//;
if ($progdir && ($progdir ne './'))
{
    $extensions = "${progdir}texi2html.ext"; # extensions in texi2html directory
    if (-f $extensions)
    {
	print "# reading extensions from $extensions\n" if $T2H_VERBOSE;
	require($extensions);
    }
}

print "# reading from $docu\n" if $T2H_VERBOSE;

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
        print "# l2h: use ${l2h_latex_file} as latex file\n" if ($T2H_VERBOSE);
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
    print "# l2h: finished to latex ($l2h_cached_count cached, $reused reused, $l2h_latex_count contents)\n" if ($T2H_VERBOSE);
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
        print "# l2h: skipping latex2html run\n" if ($T2H_VERBOSE);
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

    print "# l2h: executing '$call'\n" if ($T2H_VERBOSE);
    if (system($call))
    {
        warn "l2h ***Error: '${call}' did not succeed\n";
        return 0;
    }
    else
    {
        print "# l2h: latex2html finished successfully\n" if ($T2H_VERBOSE);
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
    print "# l2h: use ${l2h_html_file} as html file\n" if ($T2H_VERBOSE);

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
    print "# l2h: Got $l2h_html_count of $l2h_latex_count html contents\n"
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
        print "$ERROR l2h: can't extract content $count from html\n"
            if ($T2H_VERBOSE);
        # try simple (ordinary) substition (without l2h)
        my $l_l2h = $T2H_L2H;
        $T2H_L2H = 0;
        $line = $l2h_to_latex{$count};
        $line = substitute_text(0, $line);
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
my @lines = ();             # whole document
my $macros;                 # macros. reference on a hash
my $element_top;            # Top element
my $element_index;          # element with first index
my $element_chapter_index;  # chapter with first index
my $element_first;          # first element
my $element_last;           # last element

my $do_contents;            # do table of contents if true
my $do_scontents;           # do short table of contents if true
my $has_top;                # true if there is a @top command

sub pass_texi
{
    my $first_line = 1;         # is it the first line
    my $state;                  # holds the informations about the context
                                # to pass it down to the functions
    $state->{'menu'} = 0;           # number of opened menus      
    $state->{'titlepage'} = 0;      # number of opened titlepages
    $state->{'level'} = 0;          # current sectionning level
    $state->{'complex_format'} = 0; # number of opened complex formats
    $state->{'table_stack'} = [ "no table" ]; # a stack of opened tables/lists

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
	#print STDERR "line: $_";	
        $_ = scan_texi ($_, $state);
        unless (defined($_))
        {
            last if ($state->{'bye'});
            next;
        }
        delete $state->{'after_element'} unless (/^\s*$/ or /^\@(\w+?)index\s+(.*)/);
        if ($state->{'raw'})
        {
            push @lines, $_;
            next;
        }
        if ($state->{'verb'})
        {
            #remove empty lines
            if (/^\s*$/ and !$state->{'complex_format'})
            {
                 next if ($state->{'empty_line'});
                 $state->{'empty_line'} = 1;
            }
            else
            {
                 delete $state->{'empty_line'};
            }
            push @lines, $_;
            next;
        }
        
        my $tag = '';
        if (/^\s*\@(\w+)\b/)
        {
            $tag = $1;
        }

        #
        # use menu to figure out the document structure regarding nodes
        #
        if ($state->{'menu'})
        {
             my $no_entry;
             my $node;
             if (/^\*\s+($NODERE)::/o)
             {
                 $node = normalise_space($1);
             }
             elsif (/^\*\s+(.+):\s+([^\t,\.\n]+)[\t,\.\n]/o)
             {
                 $node = normalise_space($2);
             }
             else
             {
                  $no_entry = 1;
             }
             unless ($no_entry)
             {
                 my $node_menu_ref = {};
                 if (exists($nodes{$node}))
                 {
                     $node_menu_ref = $nodes{$node};
                 }
                 else
                 {
                     $nodes{$node} = $node_menu_ref;
                     $node_menu_ref->{'texi'} = $node;
                 }
                 if($state->{'node_ref'})
                 {
                     $node_menu_ref->{'menu_up'} = $state->{'node_ref'};
                     $node_menu_ref->{'menu_level'} = $state->{'node_ref'}->{'menu_level'} + 1;
                 }
                 else
                 {
                      warn "$WARN menu without previous node";
                      $node_menu_ref->{'menu_level'} = 0;
                 }
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
        }
        #
        # analyze the tag
        #
        if ($tag)
        {
            if ($tag eq 'node')
            {
                warn "$ERROR Bad node line: $_" unless $_ =~ /^\@node\s$NODERE$/o;
                my $node_ref;
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
                         $node_ref = {};
                         $nodes{$node} = $node_ref;
                    }     
                    $node_ref->{'node'} = 1;
                    $node_ref->{'texi'} = $node; 
                    $node_ref->{'seen'} = 1;
                    $node_ref->{'level_modifier'} = $state->{'level'};
                    $node_ref->{'place'} = [];
                    $node_ref->{'index_names'} = [];
                    $state->{'place'} = $node_ref->{'place'};
                    $state->{'element'} = $node_ref;
                    $state->{'after_element'} = 1;
                    $state->{'node_ref'} = $node_ref;
                    unless (@nodes_list)
                    {
                        $node_ref->{'first'} = 1;
                        $node_ref->{'menu_level'} = 0;
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
                    $node_ref->{'node_next'} = normalise_space($node_next);
                }
                if ($node_prev)
                {
                    $node_ref->{'node_prev'} = normalise_space($node_prev);
                }
                if ($node_up)
                {
                    $node_ref->{'node_up'} = normalise_space($node_up);
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
                    my $docid;
                    if($tag ne 'top')
                    {
                       $sec_num++;
                       $docid = "SEC$sec_num";
                    }
                    else
                    {
                       $docid = "SEC_Top";
                    }
                    if ($tag !~ /heading/)
                    {
                        my $section_ref = { 'texi' => $name, 
                           'section_level' => $level,
                           'level_modifier' => $state->{'level'},
                           'tag' => $tag,
                           'sec_num' => $sec_num, 
                           'id' => $docid,
                           'index_names' => [],
                           'place' => []};

                        if ($tag eq 'top')
                        {
                            $section_ref->{'top'} = 1;
                            $section_ref->{'number'} = '';
                            $sections{0} = $section_ref;
                            $element_top = $section_ref;
                            $has_top = 1;
                        }
                        $sections{$sec_num} = $section_ref;
                        if ($state->{'node_ref'} and !exists($state->{'node_ref'}->{'section_ref'}))
                        {
                            my $node_ref = $state->{'node_ref'};
                            $section_ref->{'node_ref'} = $node_ref;
                            $node_ref->{'section_ref'} = $section_ref;
                            $node_ref->{'section'} = $section_ref;
                            $node_ref->{'level_modifier'} = $state->{'level'};
                            $node_ref->{'top'} = 1 if ($tag eq 'top');
                            $node_ref->{'menu_level'} = 0 if ($tag eq 'top');
                        }
                        if (! $name and $level)
                        {
                           warn "$ERROR $tag without name";
                        }
                        push @sections_list, $section_ref;
                        push @elements_list, $section_ref;
                        $state->{'section_ref'} = $section_ref;
                        $state->{'element'} = $section_ref;
                        $state->{'place'} = $section_ref->{'place'};
                        print "# pass_texi node $state->{'node_ref'}->{'texi'}, section \@$tag $name, level $level node $state->{'node_ref'}, id $docid \n" #in_top $in_top \n"
                           if $T2H_DEBUG & $DEBUG_TOC;
                    }
                    else 
                    {
                        my $section_ref = { 'texi' => $name, 
                           'section_level' => $level,
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
                # associate the index to the element such that the page number
                # is right
                unless (@elements_list)
                {
                    warn "$WARN \@printindex before document begining\n";
                    next;
                }
                # $element_index is the first element with index
                $element_index = $elements_list[-1] unless (defined($element_index));
                my $placed_elements = [];
                push @{$elements_list[-1]->{'index_names'}}, { 'name' => $1, 'place' => $placed_elements };
                $state->{'place'} = $placed_elements;
            }
        }
        if (/^\@(\w+?)index\s+(.+)/ and ($1 ne 'print'))
        {
            my $index_entry = enter_index_entry($1, $2, $state->{'place'}, $state->{'element'}, $state->{'after_element'}, $state->{'complex_format'});
            unless ($index_entry)
            {
                warn "$WARN Bad index entry $_\n";
                s/^\@(\w+?)index\s+(.+)//;
                next if (/^\s*$/);
            }
        }
        next if ($state->{'titlepage'});
        if (/^\s*$/ and !$state->{'complex_format'})
        {
             next if ($state->{'empty_line'});
             $state->{'empty_line'} = 1;
        }
        else
        {
             delete $state->{'empty_line'};
        }
        push (@lines, $_);
        last if ($state->{'bye'});
    }
    my $not_closed = '';
    if ($state->{'verb'})
    {
        $not_closed .= " verb";
        $lines[$#lines] .= "$state->{'verb'}" . '}';
    }
    $state->{'macro'} = 'macro' if (defined($state->{'macro'}));
    for my $state(($state->{'raw'}, $state->{'macro'}, $state->{'macro_name'}))
    {
        next unless ($state);
        $not_closed .= " $state ";
        $lines[$#lines] .= " \@end $state ";
    }

    $not_closed .= " @{$state->{'text_macro_stack'}} " 
        if (defined($state->{'text_macro_stack'}) and @{$state->{'text_macro_stack'}});
    $not_closed .= " $state->{'complex_format'} complex formats" if $state->{'complex_format'}; 
    warn "$ERROR $not_closed macros not properly closed\n" if ($not_closed);
    print "# end of pass texi\n" if $T2H_VERBOSE;
    #print STDERR "@lines";
    #exit;
}

sub rearrange_elements()
{
    my @node_directions = ('node_prev', 'node_next', 'node_up');
    @all_elements = @elements_list;
    # the node_prev... are texinfo strings, find the associated node references
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
                else 
                {
                     warn "$WARN $direction $node->{$direction} for $node->{'texi'} not found\n" if (!$node->{'first'} or ($direction eq 'node_next'));
                     delete $node->{$direction};
                }
            }
        }
    }
    #
    foreach my $node (@nodes_list)
    {
        last unless ($has_top);
        # use values deduced from menus to complete missing up, next, prev
        if (!$node->{'first'} and !$node->{'top'} and !$node->{'menu_up'} and $T2H_SHOW_MENU)
        {
            warn "$WARN `$node->{'texi'}' doesn't appear in menus";
        }
        elsif (!$node->{'node_up'})
        {
            $node->{'node_up'} = $node->{'menu_up'};
        }
        if (!$node->{'node_next'})
        {
            my $next;
            # if the node has a child the child is the next
            if ($node->{'menu_child'})
            {
                 if ($node->{'menu_child'}->{'seen'})
                 {
                      $next = $node->{'menu_child'};
                 }
                 else
                 {
                      warn "$WARN $node->{'menu_child'}->{'texi'} not found\n";
                 }
            }
            # otherwise if there is no child, the next is the following node
            # in the menu 
            elsif ($node->{'menu_next'})
            {
                 if ($node->{'menu_next'}->{'seen'})
                 {
                      $next = $node->{'menu_next'};
                 }
                 else
                 {
                      warn "$WARN $node->{'menu_next'}->{'texi'} not found\n";
                 }
            }
            # the next node is the node following the parent node in menu
            else
            {
                 my $current_node = $node->{'menu_up'};
                 while (!defined($current_node->{'menu_next'}) and defined($current_node->{'menu_up'}))
                 {
                      $current_node = $current_node->{'menu_up'};
                 }
                 if (defined($current_node->{'menu_next'}))
                 {
                      $next = $current_node->{'menu_next'};
                 }
                 else
                 {
                      warn "$WARN menu tree isn't rooted at the first node\n" if (!$current_node->{'first'});
                      $next = $current_node;
                 }
             }
             if (!$next or !$next->{'seen'})
             {
                 $next = undef;
             }
             else
             {
                 $node->{'node_next'} = $next;
             }
        }
        # optionally warn if the next for the previous isn't the node 
        if ($T2H_WARN_PREV_NEXT)
	{
            if ($node->{'node_next'})
            {
                if ($node->{'node_next'}->{'node_prev'} and $node->{'node_next'}->{'node_prev'} ne $node)
                {
                    warn "$WARN next for `$node->{'texi'}' is `$node->{'node_next'}->{'texi'}' but prev for `$node->{'node_next'}->{'texi'}' is `$node->{'node_next'}->{'node_prev'}->{'texi'}'\n";
                }
            }
            if ($node->{'node_prev'})
            {
                if ($node->{'node_prev'}->{'node_next'} and $node->{'node_prev'}->{'node_next'} ne $node)
                {
                    warn "$WARN prev for `$node->{'texi'}' is `$node->{'node_prev'}->{'texi'}' but next for `$node->{'node_prev'}->{'texi'}' is `$node->{'node_prev'}->{'node_next'}->{'texi'}'\n";
                }
            }
        }
        if (!$node->{'seen'})
        {
            warn "$WARN (bug?) $node->{'texi'} not seen";
        }
    }
    if ($T2H_NO_NODE)
    {
        # nodes are not sectionning commands. They are attached to the section
        # preceding them if not allready associated with a section
        my $current_section = $elements_list[0];
        foreach my $element (@all_elements)
        {
            if ($element->{'node'})
            {   
                if ($element->{'section_ref'})
                {
                    push @{$element->{'section_ref'}->{'nodes'}}, $element;
                }
                else
                {
                    $element->{'in_top'} = 1 if ($current_section->{'top'});
                    $element->{'section_ref'} = $current_section;
                    push @{$element->{'section_ref'}->{'nodes'}}, $element;
                }
            }
            else
            {
                $current_section = $element;
            }
        }
    }
    # turn to sections
    my @previous_numbers = ();
    my @previous_sections = ();
    my $toplevel = 4;
    # correct level if raisesections or lowersections overflowed
    # and find toplevel
    foreach my $element ((values(%sections), @nodes_list))
    {
        my $level;
        if ($element->{'node'})
        {
             $level = $element->{'menu_level'} + $element->{'level_modifier'};
        }
        else
        {
             $level = $element->{'section_level'};
        }
        if ($level > $MAX_LEVEL)
        {
             $element->{'level'} = $MAX_LEVEL;
        }
        elsif ($level < $MIN_LEVEL and !$element->{'top'} and !$element->{'in_top'})
        {
             $element->{'level'} = $MIN_LEVEL;
        }
        else
        {
             $element->{'level'} = $level;
        }
        $element->{'toc_level'} = $element->{'level'};
        $element->{'toc_level'} = $MIN_LEVEL if ($element->{'level'} < $MIN_LEVEL);
        $toplevel = $element->{'level'} if ($element->{'level'} < $toplevel) and ($element->{'level'} > 0 and ($element->{'tag'} !~ /heading/) and !$element->{'node'});
    }
    my $in_appendix = 0;
    # 
    foreach my $section (@sections_list)
    {
        next if ($section->{'top'});
        # undef things under that section
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
            $section->{'number'} = "$previous_numbers[$toplevel].$section->{'number'}";
        }
        # find the previous section and the up section
	$section->{'section_prev'} = $previous_sections[$section->{'level'}]
            if (defined($previous_sections[$section->{'level'}]));
        $previous_sections[$section->{'level'}]->{'section_next'} = $section
            if (defined($previous_sections[$section->{'level'}]));
        if ($section->{'level'} == $toplevel)
        {
            $section->{'section_up'} = undef;
        }
        else
        {
            my $level = $section->{'level'} - 1;
            while (!defined($previous_sections[$level]))
            {
                 $level--;
            }
            $section->{'section_up'} = $previous_sections[$level];
        }
        $previous_sections[$section->{'level'}] = $section;
    }
    # build the elements list and find the up elements
    if ($T2H_NO_NODE)
    {
        #the only sectionning elements are sections
        @elements_list = @sections_list;
        foreach my $element (@elements_list)
        {
            $element->{'element'} = 1;
            $element->{'up'} = $element->{'section_up'};
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
                push @elements_list, $element if (!defined($element->{'section_ref'}));
            }
	    else 
            { 
                push @elements, $element;
            }
        }
        @elements_list = @elements;
        # find the up element
        foreach my $element (@elements_list)
        {
            $element->{'element'} = 1;
            if (!$element->{'node'})
            {
            # use the up of the section if defined, else the associated node up
                 if ($element->{'section_up'})
                 {
                      $element->{'up'} = $element->{'section_up'};
                      next;
                 }
	         elsif ($element->{'node_ref'} and $element->{'node_ref'}->{'node_up'})
	         {
                     $element->{'up'} = $element->{'node_ref'}->{'node_up'};
                 }
            }
	    else
            {
                if ($element->{'section_ref'} and $element->{'section_ref'}->{'section_up'})
                {
                     $element->{'up'} = $element->{'section_ref'}->{'section_up'};
                }
                elsif ($element->{'node_up'})
                {
                     $element->{'up'} = $element->{'node_up'};
                }
                elsif ($element->{'node_prev'})
                {
                     $element->{'up'} = $element->{'node_prev'}->{'up'}; 
                }
            }
            # fallback: no up for node, using the up for the prev. It should
            # be defined in most cases...
        }
    }
    # FIXME Is it right for the last element ? Or should it be the last
    # with indices taken into account ?
    # find first and last elements before we add indices
    $element_first = $elements_list[0];
    $element_top = $element_first unless (defined($element_top));
    $element_last = $elements_list[-1];
    # find forward and back, find top_elements
    # element_up is the up element except when the up element is the top element
    my $prev;
    foreach my $element (@elements_list)
    {
        my $node = get_node($element);
        $element->{'top_element'} = 1 if (($node and defined($node->{'menu_level'}) and ($node->{'menu_level'} == 1)) 
            or (defined($element->{'level'}) and ($element->{'level'} == $toplevel)));
        $element->{'element_up'} = $element->{'up'};
        if ($element->{'top_element'} and !$element->{'up'})
        {
            $element->{'up'} = $element_top;
        }
	
        push @{$element->{'up'}->{'childs'}}, $element if (defined($element->{'up'}));
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
        next if ($element->{'top'});
        # find element_next, the next element on same level
        if (defined($element->{'section_next'}))
        {
            $element->{'element_next'} = $element->{'section_next'};
        }
        elsif ($element->{'node'} and $element->{'menu_next'})
        {
            $element->{'element_next'} = get_element ($element->{'menu_next'})
        }
        elsif ($element->{'node'} and $element->{'back'})
        {
            $element->{'element_next'} = $element->{'back'}->{'element_next'};
            $element->{'back'}->{'element_next'} = $element;
        }
    }

    my @new_elements = ();
    #print STDERR "Preparing indices\n";
    while(@elements_list)
    {
        my $element = shift @elements_list;
        my @checked_elements = ();
        push @new_elements, $element;
        if (!$element->{'node'})
        {
            if ($T2H_NO_NODE)
            {
                foreach my $node (@{$element->{'nodes'}})
                {
                    $element_index = $element if ($element_index and ($node eq $element_index));
                    push @checked_elements, $node;
                    # we push the section itself after the corresponding node
                    push @checked_elements, $element if (defined($element->{'node_ref'}) and ($node eq $element->{'node_ref'}));
                }
                push @checked_elements, $element if (!defined($element->{'node_ref'}));
            }
            else
            {
                if ($element->{'node_ref'})
                {
                    push @checked_elements, $element->{'node_ref'};
                    $element_index = $element if ($element->{'node_ref'} eq $element_index);
                }
                push @checked_elements, $element;
            }
        }
        else
        {
           push @checked_elements, $element;
        }
	#print STDERR "Add index pages for ($element) $element->{'texi'} (@checked_elements)\n";
        my $element_at_top = get_top($element);
        my $forward = $element->{'forward'};
        # count the additionnal pages and put the elements needing file name
	# at the right places 
        my $current_element = $element; # current_element is the last element
                                        # holding text
        my $previous_element = $element; # used to compute back and forward
        my $index_num = 0;
        foreach my $checked_element(@checked_elements)
        {
		#print STDERR "Check index pages in $checked_element->{'texi'}\n";
            push @{$current_element->{'place'}}, @{$checked_element->{'place'}};
            foreach my $index (@{$checked_element->{'index_names'}})
            {
		    #print STDERR "index $index->{'name'}\n";
                my ($Pages, $Entries) = GetIndex($index->{'name'});
                if (defined($Pages))
                {
                    my @pages = @$Pages;
                    my $first_page = shift @pages;
		    #my $next_texi = 'NO_NEXT';
		    #$next_texi = $element_at_top->{'element_next'}->{'texi'} if (defined($element_at_top->{'element_next'}));
		    #print STDERR "New first_page (top $element_at_top->{'texi'}, previous $previous_element->{'texi'}, current $current_element->{'texi'}, next $next_texi)\n";
                    push @{$current_element->{'indices'}}, [ {'element' => $current_element, 'page' => $first_page} ];
                    if (@pages)
                    {
                        my $index_page;
                        while(@pages)
                        {
                            #my $next_texi = 'NO_NEXT';
			    #$next_texi = $element_at_top->{'element_next'}->{'texi'} if (defined($element_at_top->{'element_next'}));
			    #print STDERR "New page (top $element_at_top->{'texi'}, previous $previous_element->{'texi'}, current $current_element->{'texi'}, next  $next_texi)\n";
                            $index_num++;
                            my $page = shift @pages;
                            $index_page = { 'index_page' => 1,
                             'texi' => "$element->{'texi'}_index_page_$index_num",
                             'level' => $toplevel,
                             'top_element' => 1,
                             'up' => $element_top,
                             'element_ref' => $element,
                             'element_next' => $element_at_top->{'element_next'},
                             'back' => $previous_element,
                             'place' => [],
                             'page' => $page };
                             push @{$current_element->{'indices'}->[-1]}, {'element' => $index_page, 'page' => $page };
                             push @new_elements, $index_page;
                             $previous_element->{'forward'} = $index_page;
                             $previous_element = $index_page;
                             $element_at_top->{'element_next'} = $index_page;
                             $element_at_top = $index_page;
                        }
                        $current_element = $index_page;
                    }
                }
                push @{$current_element->{'place'}}, @{$index->{'place'}};
            }
        }
        if ($forward and ($previous_element ne $element))
        {
            $previous_element->{'forward'} = $forward;
            $forward->{'back'} = $previous_element;
        }
        next unless ($current_element ne $element);
        # reparent the elements below $element, following element
        # and following parent of element to the last index page
	#print STDERR "Reparent `$element->{'texi'}'\n";
        my @reparented_elements = ();
        @reparented_elements = (@{$element->{'childs'}}) if (defined($element->{'childs'}));
        my $up = $element;
        while ($up and !$up->{'top_element'})
        {
           my $next = $up->{'element_next'};
           while (defined($next))
           {
               push @reparented_elements, $next;
               $next = $next->{'element_next'};
           }
           $up = $up->{'element_up'};
        }
        foreach my $reparented(@reparented_elements)
        {
            $reparented->{'element_up'} = $current_element;
	    #print STDERR "reparented: $reparented->{'texi'}\n";
        }
    }
    @elements_list = @new_elements;
    # complete missing prev and next 
    # find fastback and fastforward
    foreach my $element (@elements_list)
    {
        next if ($element->{'top'});
        if ($element->{'node_prev'})
        {
             $element->{'prev'} = $element->{'node_prev'};
        }
        else
        {
             $element->{'prev'} = $element->{'back'};
        }
        if ($element->{'node_next'})
        {
             $element->{'next'} = $element->{'node_next'};
        }
        else
        {
             $element->{'next'} = $element->{'forward'};
        }
        my $up = get_top($element);
        $element_chapter_index = $up if ($element_index and ($element_index eq $element));
        # fastforward is the next element on same level than the upper parent
        # element
        $element->{'fastforward'} = $up->{'element_next'};
        # if the element isn't at the highest level, fastback is the 
        # highest parent element
        if ($up ne $element)
        {
            $element->{'fastback'} = $up;
        }
        else
        {
            # the element is a top level element, we adjust the next
            # toplevel element fastback
            $element->{'fastforward'}->{'fastback'} = $element if ($element->{'fastforward'});
        }
    }
    if ($T2H_SPLIT)
    {
        my $cut_section = $toplevel;
        my $cut_node = 1;
        my $doc_nr = -1;
        my @indices_list = ();
        if ($T2H_SPLIT eq 'section')
        {
           $cut_section = 2 if ($toplevel <= 2);
           $cut_node = 2;
        }
        foreach my $element (@elements_list)
        {
            $doc_nr++ if (($element->{'node'} and ($element->{'menu_level'} <= $cut_node))
               or (!$element->{'node'} and ($element->{'level'} <= $cut_section))
               or $element->{'index_page'});
            $element->{'doc_nr'} = $doc_nr;
            $element->{'file'} = "${docu_name}_$doc_nr.$docu_ext";
            $element->{'file'} = "$docu_name.$docu_ext" if ($doc_nr == 0);
            $element->{'file'} = "$docu_top" if ($element->{'top'} or $element->{'in_top'});
            foreach my $place(@{$element->{'place'}})
            {
                $place->{'file'} = $element->{'file'};
            }
            #FIXME this may be wrong, but do we care ?
            #(it is wrong when the nodes follow the section and there 
            #is an index inbetween)
            unless ($element->{'node'})
            { 
                if ($T2H_NO_NODE and $element->{'nodes'})
                {
                    foreach my $node (@{$element->{'nodes'}})
                    {
                        $node->{'doc_nr'} = $doc_nr;
                        $node->{'file'} = $element->{'file'};
                    }
                }
                elsif ($element->{'node_ref'})
                {
                    $element->{'node_ref'}->{'doc_nr'} = $doc_nr ;
                    $element->{'node_ref'}->{'file'} = $element->{'file'};
                }
            }
        }
    }
    else
    {
        foreach my $element(@elements_list)
        {
            $element->{'file'} =  "$docu_name.$docu_ext"; 
            $element->{'doc_nr'} = 0;
            foreach my $place(@{$element->{'place'}})
            {
                $place->{'file'} = $element->{'file'};
            }
 
        }
        foreach my $node(@nodes_list)
        {
            $node->{'file'} =  "$docu_name.$docu_ext";
            $node->{'doc_nr'} = 0;
        }
    }
    my $index_nr = 0;
    foreach my $element (@elements_list)
    {
        $element->{'this'} = $element;
        foreach my $direction (('Up', 'Forward', 'Back', 'Next', 
            'Prev', 'FastForward', 'FastBack', 'This'))
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
    }
    foreach my $element (@elements_list)
    {
	    last;
        print STDERR "$element ";
        if ($element->{'node'})
        {
             print STDERR "node($element->{'id'}, $element->{'menu_level'}, $element->{'doc_nr'}) $element->{'texi'}:\n";
        }
        elsif ($element->{'index_page'})
        {
             print STDERR "index($element->{'id'}, doc_nr $element->{'doc_nr'}): $element->{'texi'}\n";
        }
        else 
        {
             my $number = "UNNUMBERED";
             $number = $element->{'number'} if ($element->{'number'});
             print STDERR "$number ($element->{'id'}, level $element->{'level'}, doc_nr $element->{'doc_nr'}) $element->{'texi'}:\n";
        }
        print STDERR "  TOP($toplevel) " if ($element->{'top'});
        print STDERR "  u: $element->{'up'}->{'texi'}\n" if (defined($element->{'up'}));
        print STDERR "  fb: $element->{'fastback'}->{'texi'}\n" if (defined($element->{'fastback'}));
        print STDERR "  b: $element->{'back'}->{'texi'}\n" if (defined($element->{'back'}));
        print STDERR "  p: $element->{'prev'}->{'texi'}\n" if (defined($element->{'prev'}));
        print STDERR "  n: $element->{'next'}->{'texi'}\n" if (defined($element->{'next'}));
        print STDERR "  f: $element->{'forward'}->{'texi'}\n" if (defined($element->{'forward'}));
	#print STDERR "  n_e: $element->{'element_next'}->{'texi'}\n" if (defined($element->{'element_next'}));
        print STDERR "  ff: $element->{'fastforward'}->{'texi'}\n" if (defined($element->{'fastforward'}));
        print STDERR "  places: $element->{'place'}\n";
        foreach my $place(@{$element->{'place'}})
        {
            if ($place->{'real_html'})
            {
                print STDERR "    index: $place->{'real_html'}\n";
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
    }
}

sub get_node($)
{
    my $element = shift;
    return $element if ($element->{'node'});
    return $element->{'node_ref'} if ($element->{'node_ref'});
    return undef;
}

sub get_element($)
{
    my $node = shift;
    return $node if ($node->{'element'});
    return $node->{'section_ref'} if ($node->{'section_ref'});
    print STDERR "Bug: cannot get element for a node ?\n";
    return undef;
}

sub get_top($)
{
   my $element = shift;
   my $up = $element;
   while (!$up->{'top_element'} and !$up->{'top'})
   {
       $up = $up->{'element_up'};
   }
   return $up;
}


sub do_names()
{
    foreach my $node (@nodes_list)
    {
        $node->{'html'} = substitute_text (1, $node->{'texi'});
    }
    foreach my $number (keys(%sections))
    {
        my $section = $sections{$number};
        $section->{'name'} = substitute_text (1, $section->{'texi'});
        $section->{'html'} = $section->{'number'} . " " . $section->{'name'};
        $section->{'html'} =~ s/^\s*//;
    }
    foreach my $element (@elements_list)
    {
        next if (defined($element->{'html'}));
        if ($element->{'index_page'})
        {
            my $page = $element->{'page'};
            my $sec_name = $element->{'element_ref'}->{'html'};
            $element->{'html'} = ($page->{First} ne $page->{Last} ?
                "$sec_name: $page->{First} -- $page->{Last}" :
                "$sec_name: $page->{First}");
        }
    }
}

my @toc_lines = ();            # table of contents
my @stoc_lines = ();           # table of contents

sub do_toc()
{
    return unless ($do_contents or $do_scontents or $T2H_FRAMES);
    my $current_level = 0;
    my $toc_nr = 0;
    my $ul_style = $T2H_NUMBER_SECTIONS ? ' style="list-style: none"' : '';
    foreach my $element (@elements_list)
    {
        next if ($element->{'top'} or $element->{'index_page'});
        my $ind = '  ' x $current_level;
        my $level = $element->{'toc_level'};
        if ($level > $current_level)
        {
            while ($level > $current_level)
            {
                $current_level++;
                my $ln = "\n$ind<ul${ul_style}>\n";
                $ind = '  ' x $current_level;
                push(@toc_lines, $ln);
            }
        }
        elsif ($level < $current_level)
        {
            while ($level < $current_level)
            {
                $current_level--;
                $ind = '  ' x $current_level;
                push(@toc_lines, "</li>\n$ind</ul></li>\n");
            }
        }
        else
        {
            push(@toc_lines, "</li>\n");
        }
        $toc_nr++;
        my $entry = "<li>" . t2h_anchor('TOC' . $toc_nr, "$element->{'file'}#$element->{'id'}",$element->{'html'});
        push (@toc_lines, $ind . $entry);
        push(@stoc_lines, $entry. "</li>\n") if ($level == 1);
    }
    while (0 < $current_level)
    {
        $current_level--;
        my $ind = '  ' x $current_level;
        push(@toc_lines, "</li>\n$ind</ul>\n");
    }
    @toc_lines = () unless ($do_contents);
    @stoc_lines = () unless ($do_scontents or $T2H_FRAMES);
    if (@stoc_lines)
    {
        unshift @stoc_lines, "<ul${ul_style}>\n";
        push @stoc_lines, "</ul>\n";
    }
}

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

    warn "$ERROR Undefined index command: ${prefix}index", return
        unless (exists ($index_properties->{$prefix}));
    $key =~ s/\s+$//;
    $key =~ s/^\s*//;
    my $html_key = substitute_text(1, $key);
    # The $key is only usefull for alphabetical sorting
    $key = remove_texi($key);
    warn "$WARN Index entry before document\n", return 
       unless defined($element);
    return if ($key =~ /^\s*$/);
    while (exists $index->{$prefix}->{$key})
    {
        $key .= ' ';
    }

    my $id = '';
    unless ($use_section_id)
    {
        $id = 'IDX' . ++$idx_num;
	#push(@$lines, t2h_anchor($id, '', $T2H_INVISIBLE_MARK, !$in_pre));
    }
    $index->{$prefix}->{$key}->{html_key} = $html_key;
    $index->{$prefix}->{$key}->{element} = $element;
    $index->{$prefix}->{$key}->{id} = $id;
    push @$place, $index->{$prefix}->{$key};
    print "# enter_index_entry: found ${prefix}index  for '$key' with id $id\n"
        if $T2H_DEBUG & $DEBUG_INDEX;
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
# references, formatted with <code> if it is a $code entry.
sub GetIndexEntries($$)
{
    my $normal = shift;
    my $code = shift;
    my $entries = {};
    #$index = $index;
    for my $prefix (keys %$normal)
    {
        for my $key (keys %{$index->{$prefix}})
        {
            $entries->{$key} = {%{$index->{$prefix}->{$key}}};
        }
    }

    if (defined($code))
    {
        for my $prefix (keys %$code)
        {
            unless (exists $normal->{$prefix})
            {
                for my $key (keys %{$index->{$prefix}})
                {
                    $entries->{$key} = {%{$index->{$prefix}->{$key}}};
                    $entries->{$key}->{html_key} = "<code>$entries->{$key}->{html_key}</code>";
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

    unless ($T2H_SPLIT_INDEX)
    {
        $page->{First} = $Letters[0];
        $page->{Last} = $Letters[$#Letters];
        $page->{Letters} = \@Letters;
        $page->{EntriesByLetter} = $EntriesByLetter;
        push @$Pages, $page;
        return $Pages;
    }

    if ($T2H_SPLIT_INDEX =~ /^\d+$/)
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
    return $Pages;
}

sub GetIndex($)
{
    my $name = shift;
    return (@{$indices{$name}}) if ($indices{$name});
    my $prefix = IndexName2Prefix($name);
    warn ("$ERROR bad index name: $name"), return
        unless $prefix;
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

sub pass_text()
{
    my %state;
    $state{'complex_format'} = 0; 
    $state{'format_stack'} = [ {'format' => "noformat"} ];
    $state{'paragraph_style'} = [ '' ]; 
    my @stack;
    my $text;
    my $doc_nr;
    my $in_doc = 0;
    my $element;
    my @text_lines = @lines;
    my @text =();
    my @section_lines = ();
    my $one_section = 1 if (@elements_list == 1);
    my $FH;

    if (@elements_list == 0)
    {
        warn "$WARN empty document\n";
        exit (0);
    }

    # prepare %T2H_THISDOC
    $T2H_THISDOC{fulltitle} = $value{'_title'} || $value{'_settitle'} || "Untitled Document";
    $T2H_THISDOC{title} = $value{'_settitle'} || $T2H_THISDOC{fulltitle};
    $T2H_THISDOC{author} = $value{'_author'};
    $T2H_THISDOC{subtitle} = $value{'_subtitle'};
    $T2H_THISDOC{shorttitle} = $value{'_shorttitle'};

    for my $key (keys %T2H_THISDOC)
    {
        $T2H_THISDOC{$key} =~ s/\s*$//;
    }
    $T2H_THISDOC{program} = $THISPROG;
    $T2H_THISDOC{program_homepage} = $T2H_HOMEPAGE;
    $T2H_THISDOC{program_authors} = $T2H_AUTHORS;
    $T2H_THISDOC{today} = $T2H_TODAY;

    # prepare TOC, OVERVIEW
    $T2H_TOC = \@toc_lines;
    $T2H_OVERVIEW = \@stoc_lines;
    if ($T2H_SPLIT)
    {
        $T2H_HREF{'Contents'} = $docu_toc.'#SEC_Contents' if @toc_lines;
        $T2H_HREF{'Overview'} = $docu_stoc.'#SEC_OVERVIEW' if @stoc_lines;
        $T2H_HREF{'About'} = $docu_about . '#SEC_About' unless $one_section;
    }
    else
    {
        $T2H_HREF{'Contents'} = '#SEC_Contents' if @toc_lines;
        $T2H_HREF{'Overview'} = '#SEC_OVERVIEW' if @stoc_lines;
        $T2H_HREF{'About'} = '#SEC_About' unless $one_section;
    }
     
    %T2H_NAME =
        (
         'First',   $element_first->{'html'},
         'Last',    $element_last->{'html'},
         'About',    $T2H_WORDS->{'About_Title'},
         'Contents', $T2H_WORDS->{'ToC_Title'},
         'Overview', $T2H_WORDS->{'Overview_Title'},
         'Top',      $T2H_TOP_HEADING || $T2H_THISDOC{'title'} || $T2H_THISDOC{'shorttitle'},
        );
    $T2H_NAME{'Index'} = $element_chapter_index->{'html'} if (defined($element_chapter_index));
    if ($element_top and $element_top->{'html'})
    {
        $T2H_NAME{Top} = $element_top->{'html'};
    }

    ############################################################################
    # print frame and frame toc file
    #
    if ( $T2H_FRAMES )
    {
        open(FILE, "> $docu_frame_file")
            || die "$ERROR: Can't open $docu_frame_file for writing: $!\n";
        print "# Creating frame in $docu_frame_file ...\n" if $T2H_VERBOSE;
        &$T2H_print_frame(\*FILE, $docu_toc_frame_file, $docu_top_file);
        close(FILE);

        open(FILE, "> $docu_toc_frame_file")
            || die "$ERROR: Can't open $docu_toc_frame_file for writing: $!\n";
        print "# Creating toc frame in $docu_frame_file ...\n" if $T2H_VERBOSE;
        &$T2H_print_toc_frame(\*FILE, \@stoc_lines);
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
	#print STDERR "line: $_";
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
                close_stack(\$text, \@stack, \%state);
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
                        push (@section_lines, do_label($current_element->{'id'}) . "\n");
                        push @section_lines, do_heading($current_element);
                        next;
                    }
                }
                elsif (!$index_pages)
                {
                    $current_element = shift (@all_elements);
                    if ($current_element->{'node'})
                    {
			    #print STDERR 'NODE ' . $current_element->{'texi'};
			    #print STDERR "($current_element->{'section_ref'}->{'texi'})" if ($current_element->{'section_ref'});
                    }
                    else
                    {
			    #print STDERR 'SECTION ' . $current_element->{'texi'};
                    }
		    #print STDERR ": $_";
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
                         warn "elements_list and all_elements not in sync (elements $section_element->{'texi'}, all $current_element->{'texi'})\n";
                    }
                }
                else
                {
                    $new_element = $index_pages->[$index_pages_nr]->{'element'};
		    #print STDERR "New index page index_page_nr $index_pages_nr\n";
                    my $list_element = shift @elements_list;
                    die "element in index_pages $new_element->{'texi'} and in list $list_element->{'texi'} differs\n" unless ($list_element eq $new_element);
                }
                if ($new_element)
                {
                    $index_nr = 0;
                    my $old = 'NO_OLD';
                    $old = $element->{'texi'} if (defined($element));
		    #print STDERR "NEW: $new_element->{'texi'}, OLD: $old\n";
                    $T2H_THIS_SECTION = \@section_lines;
                    if ($element and $element->{'top'})
                    {
                        if ($T2H_SPLIT)
                        {
                            open(FILE, "> $docu_top_file")
                                || die "$ERROR: Can't open $docu_top_file for writing: $!\n";
                            $FH = \*FILE;
                        }
			#print STDERR "TOP $element->{'texi'}, \@section_lines\n";
                        print "# Creating Top in $docu_top_file ...\n" if ($T2H_VERBOSE);
                        $T2H_HREF{'Top'} = href($element_top, $element->{'file'});
                        &$T2H_print_Top($FH, $element->{'has_heading'});

                        if ($T2H_SPLIT or $one_section)
                        {
                            close($FH)
                                || die "$ERROR: Error occurred when closing $docu_top_file: $!\n";
                            undef $FH;
                            return if ($one_section);
                        }
                    }
                    elsif ($element)
                    {
                        &$T2H_print_section($FH);
                        if ($new_element->{'doc_nr'} != $element->{'doc_nr'})
                        {
                            &$T2H_print_chapter_footer($FH) if $T2H_SPLIT eq 'chapter';
			    #print STDERR "Close file after $element->{'texi'}\n";
                            &$T2H_print_page_foot($FH);
                            close($FH);
                            undef $FH;
                        }
                    }
                    $element = $new_element;
                    $state{'element'} = $element;
		    #print STDERR "Doing hrefs for $element->{'texi'}\n";
                    $T2H_HREF{'First'} = href($element_first, $element->{'file'});
                    $T2H_HREF{'Last'} = href($element_last, $element->{'file'});
                    $T2H_HREF{'Index'} = href($element_chapter_index, $element->{'file'}) if (defined($element_chapter_index));
                    $T2H_HREF{'Top'} = href($element_top, $element->{'file'});
                    foreach my $direction (('Up', 'Forward', 'Back', 'Next', 
                       'Prev', 'FastForward', 'FastBack', 'This'))
                    {
                        my $elem = $element->{$direction};
                        next unless (defined($elem));
                        if ($elem->{'node'})
                        {
                            $T2H_NODE{$direction} = $elem->{'html'};
                        }
                        elsif ($elem->{'node_ref'})
                        {
                            $T2H_NODE{$direction} = $elem->{'node_ref'}->{'html'};
                        }
                        $T2H_HREF{$direction} = href($elem, $element->{'file'});
                        $T2H_NAME{$direction} = $elem->{'html'};
                    }   
		    #print STDERR "Done hrefs for $element->{'texi'}\n";
                    if (! defined($FH))
                    {
                        my $file = $element->{'file'};
			#print STDERR "Open file for $element->{'texi'}\n";
                        open(FILE, "> $docu_rdir$file") ||
                        die "$ERROR: Can't open $docu_rdir$file for writing: $!\n";
                        print "# Writing to $docu_rdir$file\n" if $T2H_VERBOSE;
                        $FH = \*FILE;
                        &$T2H_print_page_head($FH);
                        &$T2H_print_chapter_header($FH) if $T2H_SPLIT eq 'chapter';
                    }
                    @section_lines = ();
                }
                if ($index_pages)
                {
                    push @section_lines, do_heading($element);
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
                push (@section_lines, do_label($current_element->{'id'}) . "\n");
                push @section_lines, do_heading($current_element) if ($current_element->{'element'});
                next;
            }
            elsif ($tag eq 'printindex')
            {
                s/\s+(\w+)\s*//;
                my $name = $1;
		#print STDERR "print index $name($index_nr) `$element->{'texi'}' element->{'indices'} $element->{'indices'}, element->{'indices'}->[index_nr] $element->{'indices'}->[$index_nr] (@{$element->{'indices'}->[$index_nr]})\n";
                close_stack(\$text, \@stack, \%state);
                $index_pages = $element->{'indices'}->[$index_nr] if (@{$element->{'indices'}->[$index_nr]} > 1);
                $index_pages_nr = 0;
                push @section_lines, do_index_page($element->{'indices'}->[$index_nr], 0);
                $index_pages_nr++;
		#print STDERR "index_pages $index_pages\n" if defined($index_pages);
                $index_nr++;
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

    $T2H_THIS_SECTION = \@section_lines;
    # if no sections, then simply print document as is
    if ($one_section)
    {
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
    delete $T2H_HREF{Prev};
    delete $T2H_HREF{Next};
    delete $T2H_HREF{Back};
    delete $T2H_HREF{Forward};
    delete $T2H_HREF{Up};

    if (@foot_lines)
    {
        print "# writing Footnotes in $docu_foot_file...\n" if $T2H_VERBOSE;
        open (FILE, "> $docu_foot_file") || die "$ERROR: Can't open $docu_foot_file for writing: $!\n"
            if $T2H_SPLIT;
        $T2H_HREF{This} = $docu_foot;
        $T2H_NAME{This} = $T2H_WORDS->{'Footnotes_Title'};
        $T2H_THIS_SECTION = \@foot_lines;
        &$T2H_print_Footnotes(\*FILE);
        close(FILE) if $T2H_SPLIT;
    }

    if (@toc_lines)
    {
        print "# writing Toc in $docu_toc_file...\n" if $T2H_VERBOSE;
        open (FILE, "> $docu_toc_file") || die "$ERROR: Can't open $docu_toc_file for writing: $!\n"
            if $T2H_SPLIT;
        $T2H_HREF{This} = $T2H_HREF{Contents};
        $T2H_NAME{This} = $T2H_NAME{Contents};
        $T2H_THIS_SECTION = \@toc_lines;
        &$T2H_print_Toc(\*FILE);
        close(FILE) if $T2H_SPLIT;
    }

    if (@stoc_lines)
    {
        print "# writing Overview in $docu_stoc_file...\n" if $T2H_VERBOSE;
        open (FILE, "> $docu_stoc_file") || die "$ERROR: Can't open $docu_stoc_file for writing: $!\n"
            if $T2H_SPLIT;
        $T2H_HREF{This} = $T2H_HREF{Overview};
        $T2H_NAME{This} = $T2H_NAME{Overview};
        $T2H_THIS_SECTION = \@stoc_lines;
        &$T2H_print_Overview(\*FILE);
        close(FILE) if $T2H_SPLIT;
    }
    my $about_body;
    if ($about_body = &$T2H_about_body())
    {
        print "# writing About in $docu_about_file...\n" if $T2H_VERBOSE;
        open (FILE, "> $docu_about_file") || die "$ERROR: Can't open $docu_about_file for writing: $!\n"
            if $T2H_SPLIT;

        $T2H_HREF{This} = $T2H_HREF{About};
        $T2H_NAME{This} = $T2H_NAME{About};
        $T2H_THIS_SECTION = [$about_body];
        &$T2H_print_About(\*FILE);
        close(FILE) if $T2H_SPLIT;
    }

    unless ($T2H_SPLIT)
    {
        &$T2H_print_page_foot(\*FILE);
        close (FILE);
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

sub do_heading($)
{
    my $element = shift;
    return '' if ($element->{'html'} =~ /^\s*$/);
    my $level = 3;
    if (!$element->{'node'})
    {
	$level = $element->{'level'};
        print STDERR "Bug: $element->{'texi'} level undef\n" if (!defined($level));
        $level = 1 if ($level == 0);
    }
    return "<h$level> $element->{'html'} </h$level>\n";
}


sub do_ctrl($;$) { return "^$_[0]" }

sub do_bullet ($;$)
{ 
    my $text = shift;
    $text = "" unless (defined($text));
    return "$things_map{bullet} $text";
}

sub do_email($;$)
{
    my($addr, $text) = split(/,\s*/, $_[0]);

    $text = $addr unless $text;
    t2h_anchor('', "mailto:$addr", $text);
}

sub do_sc($;$)
{
    # l2h does this much better
    return l2h_ToLatex("{\\sc ".$_[0]."}") if ($T2H_L2H);
    return "\U$_[0]\E";
}

sub do_math($;$)
{
    # APA: FIXME
    # This sub doesn't seem to be used.
    return l2h_ToLatex("\$".$_[0]."\$") if ($T2H_L2H);
    return '<em>' . $_[0] . '</em>';
}

sub do_uref($;$)
{
    my($url, $text, $only_text) = split(/,\s*/, $_[0]);
    # APA: Don't markup obviously bad links.
    # e.g. texinfo.texi 4.0 has this, which would lead to a broken
    # link:
    # @section @code{@@uref@{@var{url}[, @var{text}][, @var{replacement}]@}}
    #return if $url =~ /[<>]/;
    $text = $only_text if $only_text;
    $text = $url unless $text;
    t2h_anchor('', $url, $text);
}

sub do_url($;$) { return t2h_anchor('', $_[0], $_[0]); }

sub do_acronym($;$)
{
    return '<font size="-1">' . $_[0] . '</font>';
}

sub do_accent($$)
{
    return "$_[0]''" if $_[1] eq 'H';
    return "$_[0]." if $_[1] eq 'dotaccent';
    return "$_[0]*" if $_[1] eq 'ringaccent';
    return "$_[0]".'[' if $_[1] eq 'tieaccent';
    return "$_[0]".'(' if $_[1] eq 'u';
    return "$_[0]".'=' if $_[1] eq '=';
    return "$_[0]_" if $_[1] eq 'ubaraccent';
    return ".$_[0]" if $_[1] eq 'udotaccent';
    return "$_[0]&lt;" if $_[1] eq 'v';
    return "&$_[0]cedil;" if ($_[1] eq ',' or $_[1] eq 'm_cedilla');
    return "$_[0]" if $_[1] eq 'dotless';
    return "&$_[0]$accent_map{$_[1]};" if $accent_map{$_[1]};
    return undef;
}

sub end_paragraph($$)
{
   my $text = shift;
   my $state = shift;
   delete $state->{'paragraph'};
   $state->{'paragraph_nr'}--;
   die "Bug text undef in end_paragraph" unless defined($text);
   #print STDERR "Empty paragraph\n" if ($text =~ /^\s*$/);
   return '' if ($text =~ /^\s*$/);
   my $open = '<p>';
   if ($state->{'paragraph_style'}->[-1])
   {
       $open = "<p align=\"$state->{'paragraph_style'}->[-1]\">";
   }
   return $open. "$text</p>";
}

sub do_text_macro($$$)
{
    my $type = shift;
    my $line = shift;
    my $state = shift;

    if (not grep {$type eq $_} @kept_text)
    { # ignored text
        $state->{'ignored'} = $type;
    }
    elsif (grep {$type eq $_} @raw_text)
    {
        $state->{'raw_text'} = '' if ($T2H_L2H and ($type eq 'tex'));
        $state->{'raw'} = $type;
    }
    elsif (grep {$type eq $_} @value_text)
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
        if ($format_type{$type} and $format_type{$type} eq 'menu')
        {
             $state->{'menu'}++;
             delete ($state->{'prev_menu_node'});
        }
        $state->{'titlepage'}++ if ($type eq 'titlepage');
        push @{$state->{'text_macro_stack'}}, $type;
    }
    return $line;
}

sub do_raw_text ($$)
{
    my $style = shift;
    my $text = shift;
    if ($T2H_L2H and ($style eq 'tex'))
    {
        # add space to the end -- tex(i2dvi) does this, as well
        return (l2h_ToLatex($text . " "));
    }
}

sub do_raw
{
    my $style = shift;
    my $text = shift;
    if ($style eq 'verbatim')
    {
        return '<pre>' . protect_html($text) . '</pre>';
    }
    elsif ($style eq 'html')
    {
        return $text;
    }
    elsif ($style eq 'tex')
    {
        # add to latex2html file
        if ($T2H_L2H)
        {
            # add space to the end -- tex(i2dvi) does this, as well
            return (l2h_ToLatex($text . " "));
        }
        else
        {
            return '';
        }
    }
    else
    {
        warn "$WARN (bug) unknown style $style\n";
        return protect_html($text);
    }
}

sub get_deff_index ($$)
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

# process definition commands
sub begin_deff ($$$$)
{
    my $tag = shift;
    my $line = shift;
    my $state = shift;
    my $is_extra = shift;
    
    $state->{'deff'} = $tag;
    
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
    #print STDERR "Def $tag $name, $type\n";
    my $result = '';
    unless ($type)
    {
        warn "$ERROR bad $state->{'deff'}, no type\n";
        return '';
    }
    $type = substitute_text(1, $type);
    $type .= ':' if (!$T2H_DEF_TABLE); # it's nicer like this
    unless ($name)
    {
        warn "$ERROR bad $state->{'deff'} nothing after the type\n";
        return '';
    }
    $name = substitute_text(1, $name);
    $line = '' if (!$line);
    print "# def ($tag): {$type} {$name}" . "$line"
        if $T2H_DEBUG & $DEBUG_DEF;
    if ($is_extra)
    {
        $result = $T2H_DEF_TABLE ? '' : '<dt>';
    }
    else
    {
         $result .= $T2H_DEF_TABLE ?
         "<table width=\"100%\">\n" : "<dl>\n<dt>";
    }
    if ($tag eq 'deffn' || $tag eq 'defvr' || $tag eq 'deftp')
    {
        if ($T2H_DEF_TABLE)
        {
            $result .= "<tr>\n<td align=\"left\"><b>$name</b>\n";
            $result .= substitute_text(1, $line);
            $result .= "</td>\n";
            $result .= "<td align=\"right\">";
            $result .= "$type</td>\n</tr>\n";
        }
        else
        {
            #FIXME <u> is deprecated in xhtml 1.1
            #use <span style="text-description: underline"> ?
            $result .= "<u>$type</u> <b>$name</b>";
            $result .= substitute_text(1, $line);
        }
    }
    elsif ($tag eq 'deftypefn' || $tag eq 'deftypevr'
        || $tag eq 'deftypeop' || $tag eq 'defcv'
        || $tag eq 'defop')
    {
        $ftype = substitute_text(1, $ftype);
        if ($T2H_DEF_TABLE)
        {
            $result .= "<tr>\n<td align=\"left\"><b>$name</b>";
            $result .= substitute_text(1, $line);
            $result .= "</td>\n";
            $result .= "<td align=\"right\">";
            $result .= "$type of $ftype</td>\n</tr>\n";
        }
        else
        {
            $result .= "<u>$type</u> $ftype <b>$name</b>";
            $result .= substitute_text(1, $line);
        }
    }
    else
    {
        warn "$ERROR Unknown definition type: $tag\n";
        $result .= "<u>$type</u> <b>$name</b>";
        $result .= substitute_text(1, $line);
    }
    $result .= do_index_entry_label($state);
    $result .= "</dt>\n" if (!$T2H_DEF_TABLE);
    return $result;
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
    {
        add_item($text, $stack, $state, 1); # handle lists
        add_term($text, $stack, $state, 1); # handle table
        add_line($text, $stack, $state, 1); # handle table
        add_row($text, $stack, $state); # handle multitable
    }

    my $format_ref = pop @$stack;
    
    if (defined($def_map{$format}))
    {
        add_prev($text, $stack, end_deff($format_ref->{'text'}));
    }
    elsif ($format_type{$format} eq 'menu')
    {
        $state->{'menu'}--;
        add_prev($text, $stack, end_menu($format_ref->{'text'}));
    }
    elsif ($format_type{$format} eq 'complex')
    {
        $state->{'complex_format'}--;
        add_prev($text, $stack, end_complex_format($format_ref->{'format'}, $format_ref->{'text'}));
    }
    elsif (($format_type{$format} eq 'table') or ($format_type{$format} eq 'list'))
    {
	    #print STDERR "CLOSE $format ($format_ref->{'format'})\n$format_ref->{'text'}\n";
        pop @{$state->{'format_stack'}};
	#dump_stack($text, $stack, $state); 
        if ($format_map{$format})
        {
            add_prev($text, $stack, end_simple_format($format_ref->{'format'}, $format_ref->{'text'}));
        }
        else
        {
            add_prev($text, $stack, end_table($format_ref->{'text'}));
        }
    } 
    elsif (exists($format_map{$format}))
    {
        add_prev($text, $stack, end_simple_format($format_ref->{'format'}, $format_ref->{'text'}));
    }
}

sub end_table($)
{
    my $text = shift;

    if ($text =~ /[^\s]/)
    {
        return "<dl compact=\"compact\">\n" . $text. "</dl>\n";
    }
    return '';
}

sub end_complex_format($$)
{
    my $tag = shift;
    my $text = shift;
    return '' unless ($text);
    my $start = eval $complex_format_map->{$tag}->[0] ;
    if ($@)
    {
        warn "$ERROR: eval of complex_format_map->{$tag}->[0] $complex_format_map->{$tag}->[0]: $@";
        $start = '<pre>';
    }
    my $end = eval $complex_format_map->{$tag}->[1]; 
    if ($@)
    {
        warn "$ERROR: eval of complex_format_map->{$tag}->[1] $complex_format_map->{$tag}->[1]: $@";
        $end = '</pre>';
    }
    return $start . $text . $end;
}

sub end_deff($)
{
    my $text = shift;

    if ($text =~ /[^\s]/)
    {
        $text = $T2H_DEF_TABLE ? ('<tr><td colspan="2">'. $text .'</td></tr>')
            : ('<dd>' . $text . '</dd>');
    }
    $text .= $T2H_DEF_TABLE ? "</table>\n" : "</dl>\n"; 
    return $text;
}

sub end_menu($)
{
    my $text = shift;

    if ($text =~ /[^\s]/)
    {
        return "<table border=\"0\" cellspacing=\"0\">\n" . $text. "</table>\n";
    }
    return '';
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
    if ($state->{'menu_comment'})
    {
        close_stack ($text, $stack, $state, undef, 'menu_comment');
        my $menu_comment = pop @$stack;
        warn "Bug waiting for menu_comment, got $menu_comment->{'format'}\n" 
           if (!$menu_comment->{'format'} or $menu_comment->{'format'} ne 'menu_comment');
        add_prev ($text, $stack, do_menu_comment($menu_comment->{'text'}));
        $state->{'menu_comment'}--;
    }
    if ($state->{'menu_entry'})
    {
        add_prev ($text, $stack, do_menu_entry($state->{'menu_entry'}, $state->{'element'}->{'file'}));
    }
}
    
sub do_menu_entry($$)
{
    my $menu_entry = shift;
    my $file = shift;
    my $name = $menu_entry->{'name'};
    my $node = $menu_entry->{'node'};
    my $descr = substitute_text(1, $menu_entry->{'descr'});

    $node = normalise_space($node);
    my $node_texi = $node;

    my ($entry, $href, $element);
    if (defined($nodes{$node}))
    {
        $element = $nodes{$node};
	#print STDERR "href in menu for $node_element->{'texi'}\n";
        if (defined($element->{'section'}))
        {
            $element = $element->{'section'};
        }
    }
    $href = href($element, $file);
    $node = substitute_text (1, $node);
 
    if ($href)
    {
        $descr =~ s/^\s+//;
        $descr =~ s/\s*$//;
        if ($T2H_NUMBER_SECTIONS && !$T2H_NODE_NAME_IN_MENU && $element)
        {
            $entry = $element->{'html'};
            $name = '';
        }
        else
        {
            $name = substitute_text(1, $name);
            $entry = ($name && ($name ne $node || ! $T2H_AVOID_MENU_REDUNDANCY)
                      ? "$name : $node" : $node);
        }

        if ($T2H_AVOID_MENU_REDUNDANCY && $descr)
        {
            my $clean_entry = $entry;
            $clean_entry =~ s/^.*? // if ($clean_entry =~ /^([A-Z]|\d+)\.[\d\.]* /);
            $clean_entry =~ s/[^\w]//g;
            my $clean_descr = $descr;
            $clean_descr =~ s/[^\w]//g;
            $descr = '' if ($clean_entry eq $clean_descr)
        }
        return '<tr><td align="left" valign="top">' .
                t2h_anchor('', $href, $entry) .
                '</td><td>&nbsp;&nbsp;</td>' .
                '<td align="left" valign="top">' . $descr .
                "</td></tr>\n";
    }
    elsif ($node =~ /^\(.*\)\w+/)
    {
        # menu entry points to another info manual
        $entry = $node;
        return '<tr><td align="left" valign="top">' .
                  $entry .
              '</td><td align="left" valign="top">' . $descr .
              "</td></tr>\n";
    }
    else
    {
        warn "$ERROR Undefined node of menu_entry ($node_texi): $_";
        return '';
    }
}

sub do_menu_comment($)
{
    my $text = shift;

    if ($text =~ /[^\s]/)
    {
         return '<tr><th colspan="3" align="left" valign="top">' . $text . '</th></tr>';
    }
    return '';
}

sub do_xref
{
    my $macro = shift;
    my $text = shift;
    my $file = shift;
    my $type = $macro;

    my $result = '';
    # note: Texinfo may accept other characters
    if ($type eq 'xref')
    {
        $type = "$T2H_WORDS->{'See'} ";
    }
    elsif ($type eq 'pxref')
    {
        $type = "$T2H_WORDS->{'see'} ";
    }
    elsif ($type eq 'inforef')
    {
         $type = "$T2H_WORDS->{'See'} Info";
    }
    else
    {
         $type = '';
    }
    #chop($text);   # remove final newline
    $text =~ s/\s+/ /gos; # remove useless spaces and newlines
    my @args = split(/\s*,\s*/, $text);
    my $node = $args[0];   # the node is always the first arg
    $node = normalise_space($node);
    my $node_texi = $node;
    if ($node =~ s/^\(([^\s\(\)]+)\)\s*//)
    {
         $args[3] = $1 unless ($args[3]);
         $args[0] = $node;
    }
    my ($node_element, $section_name, $href);
    if (defined($nodes{$node}))
    {
        $node_element = $nodes{$node};
        $href = href($node_element, $file);
        if (defined($node_element->{'section_ref'}))
        {
            $section_name = $node_element->{'section_ref'}->{'name'};
        }
    }
    $node = substitute_text(1, $node);
    my $i;
    for ($i = 0; $i < @args; $i++)
    {
        # FIXME the state isn't transmitted, thus the $state->{'element'}
        # for example isn't there (usefull to do href in xref, anchor). 
        # What else should be transmitted ? This happens at other places.
        $args[$i] = substitute_text(1, $args[$i]);
    }
    
    my $sec = $args[2] || $args[1] || $section_name;
    if (@args == 5)
    {                   # reference to another manual
         $sec = $args[2] || $node;
         my $man = $args[4] || $args[3];
         $result = "${type}$T2H_WORDS->{'section'} `$sec' in " . apply_style ('cite', $man);
    }
    elsif ($type =~ /Info/)
    {                   # inforef 
        warn "$ERROR Wrong number of arguments: \@$macro" ."$text" unless @args == 3;
        my $in_file = $args[2];
        $result = "${type} file `$in_file', node `$node'";
    }
    elsif (@args == 4)
    {# ref to info file        
        my $in_file = $args[3];
        if ($node)
        {
             $result = "${type}Info `$in_file', node `$node'";
        }
        else 
        {
             $result = "${type}${in_file}";
        }
    }
    elsif ($sec && $href && ! $T2H_SHORT_REF)
    {
        $result  = "$type";
        $result .= "$T2H_WORDS->{'section'} " if $type;
        $result .= t2h_anchor('', $href, $sec);
    }
    elsif ($href)
    {
        $result = "${type} " .
            t2h_anchor('', $href, $args[2] || $args[1] || $node);
    }
    else
    {
        warn "$ERROR Undefined node ($node_texi) in $macro: $text";
        $result = "\@$macro"."{${text}}";
    }
    return $result;
}

sub do_anchor($$)
{
    my $anchor = shift;
    my $file = shift;
    $anchor = normalise_space($anchor);
    $nodes{$anchor}->{'html'} = substitute_text(1, $anchor);
    return do_label($nodes{$anchor}->{'id'});
}

sub do_footnote($$$)
{
    my $command = shift;
    my $text = shift;
    my $state = shift;

    $foot_num++;
    my $docid  = "DOCF$foot_num";
    my $footid = "FOOT$foot_num";
    my $foot = "($foot_num)";
    my $from_file = '';
    if ($state->{'element'})
    { 
        $from_file = $state->{'element'}->{'file'};
    }
    push(@foot_lines, "<h3>" . t2h_anchor($footid, "$from_file#$docid", $foot) . "</h3>\n");
    push(@foot_lines, "$text\n");
    return t2h_anchor($docid, "$docu_foot#$footid", $foot);
}

sub do_image
{
    # replace images
    my $macro = shift;
    my $text = shift;
    $text =~ s/\s+/ /gos; # remove useless spaces and newlines
    my @args = split (/\s*,\s*/, $text);
    my $base = $args[0];
    my $image =
         LocateIncludeFile("$base.$args[4]") if ($args[4]) ||
         LocateIncludeFile("$base.png") ||
         LocateIncludeFile("$base.jpg") ||
         LocateIncludeFile("$base.gif");
    warn "$ERROR no image file for $base: $text" unless ($image && -e $image);
    return ($T2H_CENTER_IMAGE ?
          "<div align=\"center\"><img src=\"$image\" alt=\"$base\"></div>" :
          "<img src=\"$image\" alt=\"$base\">");
}

sub apply_style($$;$)
{
    my($texi_style, $text, $close_or_no_close) = @_;
    my($style);
    
    my $no_close;
    my $no_open;
    
    if (defined($close_or_no_close))
    {
        $no_close = 1 if (($close_or_no_close) eq 'no_close');
        $no_open = 1 if (($close_or_no_close) eq 'no_open');
    }
    
    $style = $style_map{$texi_style};
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
    return $first_line;
}

sub do_index_first_page($)
{
    my $name = shift;
    my ($Pages, $Entries) = GetIndex($name);
    if ($T2H_IDX_SUMMARY)
    {
        open(FHIDX, ">$docu_rdir$docu_name" . "_$name.idx")
            || die "Can't open > $docu_rdir$docu_name" . "_$name.idx for writing: $!\n";
        print "# writing $name index summary in $docu_rdir$docu_name" . "_$name.idx...\n" if $T2H_VERBOSE;

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

sub do_index_entries($$)
{
    my $element = shift;
    my $page = shift;
 
    #FIXME i18n
    my $result = '<table border="0">' . "\n" .
"<tr><td></td><th align=\"left\">Index Entry</th><th align=\"left\"> Section</th></tr>\n" .
"<tr><td colspan=\"3\"> <hr></td></tr>\n";

    for my $letter (@{$page->{Letters}})
    {
       $result .= '<tr><th>' .
            t2h_anchor("$element->{'id'}_" . protect_html($letter), '', protect_html($letter)) .
                "</th><td></td><td></td></tr>\n";
       for my $entry (@{$page->{EntriesByLetter}->{$letter}})
       {
           my $label = $entry->{'element'};
           my $element = $label;
           $element = $element->{'section_ref'} if ($element->{'node'} and $element->{'section_ref'});
           $entry->{href} = "$label->{'file'}#";
	   my $label_href = $entry->{href} . $label->{'id'};
           if ($entry->{'id'})
	   {
               $entry->{href} .=  $entry->{'id'};
	   }
	   else
	   {
               $entry->{href} = $label_href;
	   }
	   $entry->{'section'} = $element->{'html'};
           $result .=
                "<tr><td></td><td valign=\"top\">" .
                t2h_anchor('', $entry->{href}, $entry->{html_key}) .
                "</td><td valign=\"top\">" .
                t2h_anchor('', "$element->{'file'}#$element->{'id'}", $element->{'html'}) .
                "</td></tr>\n";
        }
        $result .= "<tr><td colspan=\"3\"> <hr></td></tr>\n";
    }
    $result .= "</table>";
    return $result;
}

sub do_index_summary($$)
{
    my $element = shift;
    my $index_elements = shift;
    my ($summary, $l1, $l2);

    #FIXME i18n
    $summary = '<table><tr><th valign="top">Jump to: &nbsp; </th><td>';
    for my $index_element_item (@$index_elements)
    {
        my $index_element = $index_element_item->{'element'};
        my $file = '';
        $file .= $index_element->{'file'} if ($index_element->{'file'} ne $element->{'file'});
        for my $letter (@{$index_element_item->{'page'}->{Letters}})
        {
            my $l = t2h_anchor('', "$file#$index_element->{'id'}_" . protect_html($letter),
                            "<b>" . protect_html($letter) . "</b>",
                            'style="text-decoration: none"')
                . "\n &nbsp; \n";
            if ($letter =~ /^[A-Za-z]/)
            {
                $l2 .= $l;
            }
            else
            {
                $l1 .= $l;
            }
        }
    }
    $summary .= $l1 . "<br>\n" if ($l1);
    $summary .= $l2 if ($l2);
    $summary .= '</td></tr></table>';
    return $summary;
}

sub remove_texi($)
{
    my $line = shift;
    my @stack = ();
    my $text = '';
    my %state = ( 
        'remove_texi' => 1,
        'paragraph_style' => [ '' ]);
    scan_line($line, \$text, \@stack, \%state);
    close_stack (\$text, \@stack, \%state);
    return $text;
}

# return undef if the line shouldn't be kept
sub scan_texi($$)
{
    my $line = shift;
    my $state = shift;
    my $result = undef;
    
    local $_ = $line;
    
    while(1)
    {
        # in ignored text 
        if ($state->{'ignored'})
        {
            if (s/^.*?\@end\s+$state->{'ignored'}$// or s/^.*?\@end\s+$state->{'ignored'}\s+//)
            {
                 delete $state->{'ignored'};
                 next if (defined($result) or $_ !~ /^\s*$/o);
            }
            return $result;
        }

        # in macro definition
        if (defined($state->{'macro'}))
        {
            if (s/^(.*?)\@end\smacro$//o or s/^(.*?)\@end\smacro\s+//o)
            {
                 add_text($1, \$state->{'macro'}->{'Body'});
                 delete $state->{'macro'};
                 next;
            }
            else
            {
                 add_text($_, \$state->{'macro'}->{'Body'});
                 return undef;
            }
        }
        # in macro expansion
        if (defined($state->{'macro_name'}))
        {
            my $special_chars = quotemeta ('\{}');
            my $multi_args = 0;
            my $formal_args = $macros->{$state->{'macro_name'}}->{'Args'};
            $multi_args = 1 if ($#$formal_args >= 1);
            $special_chars .= quotemeta(',') if ($multi_args);
            if (s/^([^$special_chars]*)([$special_chars])//)
            {
                add_text($1, \$state->{'macro_args'}->[-1]);
                # \ protects any character
                if ($2 eq '\\')
                {
                    if (s/^(.)//)
                    {
                        add_text($1, \$state->{'macro_args'}->[-1]);
                    }
                    else
                    {
                        add_text('\\', \$state->{'macro_args'}->[-1]);
                    }
                }
                elsif ($2 eq ',')
                { # separate args
                    s/^\s*//o;
                    push @{$state->{'macro_args'}}, "";
                }
                elsif ($2 eq '}')
                { # balanced } ends the macro call, otherwise it is in the arg
                    $state->{'macro_depth'}--;
                    if ($state->{'macro_depth'} == 0)
                    {
                        $_ = expand_macro($state->{'macro_name'}, $state->{'macro_args'}, $_);
                        delete $state->{'macro_name'};
                        delete $state->{'macro_depth'};
                    }
                    else
                    {
                        add_text('}', \$state->{'macro_args'}->[-1]);
                    }
                }
                elsif ($2 eq '{')
                {
                    $state->{'macro_depth'}++;
                    add_text('{', \$state->{'macro_args'}->[-1]);
                }
                next;
            }
            add_text($_, \$state->{'macro_args'}->[-1]);
            return undef;
        }
        
        # in a raw format. If raw_text the text is kept, as the format 
        # is used during the current pass (@tex is expanded) 
        if (defined($state->{'raw'}))
        {
            if (s/^(.*?\@end\s$state->{'raw'})$// or s/^(.*?\@end\s$state->{'raw'}\s)\s*//)
            {
                my $raw_text = $1;
                if (defined($state->{'raw_text'}))
                {
                    $raw_text =~ s/\@end\s$state->{'raw'}\s?//; 
                    $state->{'raw_text'} .= $raw_text;
		    
                    $raw_text = do_raw_text ($state->{'raw'}, $state->{'raw_text'});
                    delete $state->{'raw_text'};
                }
                add_text($raw_text, $state->{'item'}, \$result);
                delete $state->{'raw'};
                next;
            }
            else
            {
                if (defined($state->{'raw_text'}))
                {
                    $state->{'raw_text'} .= $_;
                }
                else
                {
                    add_text($_, $state->{'item'}, \$result);
                }
                return $result;
            }
        }
        # in verb
        if (defined($state->{'verb'}))
        {
            my $char = quotemeta($state->{'verb'});
            if (s/^(.*?)$char\}//)
            {
                 add_text($1 . $state->{'verb'} . '}', $state->{'item'}, \$result);
                 delete $state->{'verb'};
                 next;
            }
            else
            {
                 add_text($_, $state->{'item'}, \$result);
                 return $result;
            }
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
        if (s/^\@set\s+($VARRE)\s+(.*)$//o)
        {
             $value{$1} = $2;
        }
        elsif (s/^\@clear\s+($VARRE)//o)
        {
             delete $value{$1};
        }
        elsif (s/^\@shorttitle\s+(.*)$//)
        {
             $value{'_shorttitle'} = substitute_text(1, $1);
        }
        elsif(s/^\@setfilename\s+(.*)$//)
        {
             $value{'_setfilename'} = substitute_text(1, $1);
        }
        elsif(s/^\@settitle\s+(.*)$//)
        {
              $value{'_settitle'} = substitute_text(1, $1);
        }
        elsif(s/^\@author\s+(.*)$//)
        {
             $value{'_author'}   .= substitute_text(1, $1)."\n";
        }
        elsif(s/^\@subtitle\s+(.*)$//)
        {
             $value{'_subtitle'} .= substitute_text(1, $1)."\n";
        }
        elsif(s/^\@title\s+(.*)$//)
        {
             $value{'_title'}    .= substitute_text(1, $1)."\n";
        }
        else
        {
             $value_macro = 0;
        }
        if ($value_macro)
        {
             return $result if (!defined($result) and /^\s*$/);
             next;
        }
	
        if (s/^([^@]*)\@end\s+([a-zA-Z]\w+)//)
        {
            add_text($1, $state->{'item'}, \$result) if ($1);
            my $end_tag = $2;
            if ($to_skip{"end $end_tag"})
            {
                 return $result if (!defined($result) and /^\s*$/);
                 next;
            }
            if (defined($state->{'text_macro_stack'}) 
               and @{$state->{'text_macro_stack'}} 
               and ($end_tag eq $state->{'text_macro_stack'}->[-1]))
            {
                 pop @{$state->{'text_macro_stack'}};
                 if ($end_tag eq 'menu')
                 {
                      add_text("\@end $end_tag", $state->{'item'}, \$result);
                      $state->{'menu'}--;
                 }
            }
            elsif (grep {$_ eq $end_tag} @kept_text)
            {
                 warn "$ERROR \@end $end_tag without corresponding element.\n";
            }
            else
            {
                $state->{'complex_format'}-- if ($state->{'complex_format'} and $complex_format_map->{$end_tag});
                if ($end_tag eq $state->{'table_stack'}->[-1])
                {
                    enter_table_index_entry($state);
                    pop @{$state->{'table_stack'}};
                }
                #add end tag
                add_text("\@end $end_tag", $state->{'item'}, \$result);
            }

            $state->{'titlepage'}-- if ($end_tag eq 'titlepage');
            return $result if (!defined($result) and /^\s*$/);
            next;
        }
        elsif (s/^([^@]*)\@([a-zA-Z]\w*|["'@}{,.!?\s*-^~`=:])//o)
        {
            add_text($1, $state->{'item'}, \$result) if ($1);
            my $macro = $2;
            if ($to_skip{$macro})
            {
                 if ($to_skip{$macro} eq 'arg')
                 {
                     s/\s+([^\s]*)//o;
                 }
                 elsif ($to_skip{$macro} eq 'line')
                 {
                     s/.*//o;
                 }
                 elsif ($to_skip{$macro} eq 'space')
                 {
                     s/\s+//o; 
                 } # warning: make sure that the usefull ignored macros 
                   # are not associated with 'arg', 'line' or 'space'
                 elsif ($macro eq 'contents')
                 {
                     $do_contents = 1;
                 }
                 elsif (($macro eq 'summarycontents') or ($macro eq 'shortcontents'))
                 {
                     $do_scontents = 1;
                 }
                 elsif ($macro eq 'lowersections')
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

                 return $result if (!defined($result) and /^\s*$/);
                 next;
            }
            if ($macro eq ',')
            { # the @, causes problems when `,' separates things (in @node, @ref)
                 $macro = 'm_cedilla';
            }
            if ($macro eq 'verb' and s/^{//)
            {
                if (/^$/)
                {
                    warn "$ERROR verb at end of line";
                    add_text('@verb{', $state->{'item'},  \$result);
                }
                else
                {
                    s/^(.)//;
                    $state->{'verb'} = $1;
                    add_text('@verb{' . $1, $state->{'item'}, \$result);
                }
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
                    $macros->{$name}->{Args} = \@args;
                    my $arg_index = 0;
                    foreach my $arg (@args)
                    { # when expanding macros, the argument index is retrieved
                      # with Args_index
                        $macros->{$name}->{Args_index}->{$arg} = $arg_index;
                        $arg_index++;
                    }
                    $macros->{$name}->{Body} = '';
                    $state->{'macro'} = $macros->{$name};
                }
                else
                {
                    warn "$ERROR: Bad macro defintion $_";
                }
                return $result;
            }
            elsif (grep {$macro eq $_} @text_macros)
            {
                $_ = do_text_macro ($macro, $_, $state);
                # if it is a raw formatting command or a menu command
                # we must keep it for later
                if ((defined($state->{'raw'}) and !defined($state->{'raw_text'})) or ($macro eq 'menu'))
                {
                    add_text("\@$macro", $state->{'item'}, \$result) ;
                    next;
                }
                return $result if (!defined($result) and /^\s*$/);
                next;
            }
	    
            elsif ($macro eq 'bye')
            {
                $state->{'bye'} = 1;
                return $result;
            }
            elsif ($macro eq 'value')
            {
                #FIXME pertusus: what is the e modifier ?
                unless (s/^{($VARRE)}/$value{$1}/eg)
                {
                    warn "$ERROR bad \@value macro";
                }
                next;
            }
            elsif ($macro eq 'include')
            {
                if (s/^\s+($FILERE)//o)
                {
                    my $file = LocateIncludeFile($1);
                    if ($file && -e $file)
                    {
                        open_file($file);
                        print "# including $file\n" if $T2H_VERBOSE;
                    }
                    else
                    {
                        warn "$ERROR Can't find $1, skipping";
                    }
                }
                else
                {
                    warn "$ERROR Bad include line: $_";
                    return $result;
                }
                return $result if (!defined($result) and /^\s*$/);
                next;
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
                    return $result;
                }
                return $result if (!defined($result) and /^\s*$/);
                next;
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
                return $result if (!defined($result) and /^\s*$/);
                next;
            }
            elsif ($macro eq 'unmacro')
            {
                delete $macros->{$1} if (s/^\s+(\w+)//);
                if (/^\s*$/)
                {
                     return $result if (!defined($result));
                     return $result . "\n";
                }
                #FIXME really remove all the spaces following macro arg ?
                # including new line ?
                s/^\s*//;
                next;
            }
            elsif ($macro eq 'documentlanguage')
            {
                s/\s+(\w+)//;
                my $lang = $1;
                SetDocumentLanguage($lang) if (!$T2H_WORDS && $lang);
                if (/^\s*$/)
                {
                     return $result if (!defined($result));
                     return $result . "\n";
                }
                s/^\s*//;
                next;
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
                next;
            }
            if (defined($def_map{$macro}))
            {
                #We must enter the index entries
                my ($prefix, $entry) = get_deff_index($macro, $_);
                enter_index_entry($prefix, $entry, $state->{'place'}, $state->{'element'}, 0, $state->{'complex_format'});
                s/(.*)//;
                add_text("\@$macro" . $1, $state->{'item'}, \$result);
                next;
            }
            elsif ($macro =~ /^(|f|v|multi)table$/ or $macro eq 'itemize' or $macro eq 'enumerate')
            {
                 push @{$state->{'table_stack'}}, $macro;
            }
            elsif ($macro =~ /^itemx?$/)
            {
                enter_table_index_entry($state, $result);
                add_text("\@$macro", $state->{'item'}, \$result);

                if ($state->{'table_stack'}->[-1] =~ /^(f|v)table$/)
                {
                    my $text = '';
                    $state->{'item'} = \$text;
                }
                next;
            }
            elsif ($macro eq 'anchor')
            {
                my ($anchor, $line);
                ($anchor, $line) = next_bracketed($_);
                if ($anchor =~ /^\{\s*[^\s]/)
                {
                    $anchor =~ s/^\{(.*)\}$/$1/;
                    $anchor = normalise_space($anchor);
                    if ($nodes{$anchor})
                    {
                       warn "$ERROR Duplicate node found: $anchor\n";
                       return '';
                    }
                    $anchor_num++;
                    $nodes{$anchor} = { 'node' => 0, 'anchor' => 1, 'texi' => $anchor, 'id' => 'ANC' . $anchor_num};
                    push @{$state->{'place'}}, $nodes{$anchor};
                }
                else
                {
                    warn "$ERROR \@anchor without braces or empty, ignored\n";
                    s/^\{\s*\}//;
                    next;
                }
            }    
	    
            $state->{'complex_format'}++ if ($complex_format_map->{$macro});
            add_text("\@$macro", $state->{'item'}, \$result);
            next;
        }
        add_text($_, $state->{'item'}, \$result);
        enter_table_index_entry($state, \$result);
        return $result;
    }
}

sub enter_table_index_entry($$)
{
    my $state = shift;
    my $result = shift;
    if ($state->{'item'} and ($state->{'table_stack'}->[-1] =~ /^(v|f)table$/))
    {
        my $index = $1;
        my $element = $state->{'element'};
        $element = $state->{'node_ref'} unless ($element);
        enter_index_entry($index, ${$state->{'item'}}, $state->{'place'}, $element, 0, $state->{'complex_format'});
        add_text(${$state->{'item'}}, $result);
        delete($state->{'item'});
    }
}

sub scan_line($$$$)
{
    my $line = shift;
    my $text = shift;
    my $stack = shift;
    my $state = shift;

    die "stack not an array ref"  unless (ref($stack) eq "ARRAY");
    local $_ = $line;
   
    if (!$state->{'raw'} and !$state->{'verb'} and $state->{'menu'})
    { # new menu entry
        my ($node, $name);
        if (s/^\*\s+($NODERE):://o)
        {
            $node = $1;
        }
        elsif (s/^\*\s+(.+):\s+([^\t,\.\n]+)[\t,\.\n]//o)
        {
            $name = $1;
            $node = $2;
        }
        if ($node)
        {
            my $descr = $_;
            close_menu($text, $stack, $state);
            $state->{'menu_entry'} = { 'name' => $name, 'node' => $node, 
                'descr' => $descr };
            return;
        }
    }
    if ($state->{'menu_entry'})
    {
        if (/^\s+[^\s].*$/)
        { # description continues
             $state->{'menu_entry'}->{'descr'} .= $_;
             return;
        }
        else
        { # enter menu comment after menu entry
            add_prev ($text, $stack, do_menu_entry($state->{'menu_entry'}, $state->{'element'}->{'file'}));
            delete $state->{'menu_entry'};
            unless (/^\s*\@end\s+menu\b/)
            {
                 $state->{'menu_comment'}++;
                 push @$stack, {'format' => 'menu_comment', 'text' => ''};
            }
        }
    }
    if ($state->{'raw'} or $state->{'complex_format'}  or $state->{'no_paragraph'} or $state->{'keep_texi'} or $state->{'remove_texi'})
    {
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
                push @$stack, { 'format' => $state->{'deff'}, 'text' => '' };
                delete($state->{'deff'});
            }
        }
    }
    else
    {
        if (/^\s*$/)
        {
            #ignore the line if it just follows a deff
            return if ($state->{'deff'});
            return if (abort_empty_paragraph ($stack, $state));
            if ($state->{'paragraph'})
            {
                my $new_stack;
		#dump_stack ($text, $stack, $state);
                ($text, $stack, $state, $new_stack) = close_stack($text, $stack, $state, 'no_open');
                my $paragraph = pop @$stack;
                if (!$paragraph->{'format'} or 
                    ($paragraph->{'format'} ne 'paragraph'))
                {
                    my $format = "UNDEF";
                    $format = $paragraph->{'format'} if ($paragraph->{'format'});
                    $format = $paragraph->{'style'} if ($paragraph->{'style'});
                    print STDERR "Bug: paragraph closed but no paragraph (format $format) $_\n";
                    dump_stack ($text, $stack, $state);
                }
                add_prev ($text, $stack, end_paragraph($paragraph->{'text'}, $state));
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
            {
                push @$stack, { 'format' => $state->{'deff'}, 'text' => '' };
                delete $state->{'deff'};
            }
            if (!$state->{'paragraph'} and !($next_tag =~ /^(\w+?)index$/ and ($1 ne 'print')) and ($next_tag !~ /^itemx?$/))
            {
                $state->{'paragraph'} = 1;
                $state->{'paragraph_nr'}++;
                push @$stack, {'format' => 'paragraph', 'text' => '' };
                push @$stack, @{$state->{'paragraph_macros'}} if $state->{'paragraph_macros'};
                delete $state->{'paragraph_macros'};
            }
        }
    }
    if (/^\@(\w+?)index\s+(.*)/ and ($1 ne 'print'))
    {
        add_prev($text, $stack, do_index_entry_label($state));
        return;
    }

    while(1)
    {
        #dump_stack($text, $stack, $state);
        if (defined($state->{'raw'})) 
        {
            die "Bug" if (! @$stack or ! ($stack->[-1]->{'style'} eq $state->{'raw'}));
            if (s/^(.*?)\@end\s$state->{'raw'}$// or s/^(.*?)\@end\s$state->{'raw'}\s+//)
            # don't protect html, it is done by do_raw if needed
            {
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
                       add_prev($text, $stack, do_raw($style->{'style'}, $style->{'text'}));
                   }
                }
                delete $state->{'raw'};
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
	
        if ($state->{'keep_texi'} and s/^([^{}@]*)\@end\s+([a-zA-Z]\w*)//)
	{
            my $end_tag = $2;
            add_prev($text, $stack, $1 . "\@end $end_tag");
            next;
        }
        elsif ($state->{'remove_texi'} and s/^([^{}@]*)\@end\s+([a-zA-Z]\w*)//)
	{
            my $end_tag = $2;
            add_prev($text, $stack, $1);
            next;
        }
        
		
        if (s/^([^{}@]*)\@end\s+([a-zA-Z]\w*)\s// or s/([^{}@]*)^\@end\s+([a-zA-Z]\w*)$//)
        {
            add_prev($text, $stack, do_text($1, $state));
            my $end_tag = $2;
                
            my $top_stack = top_stack($stack);
            if (!$top_stack)
            {
                if ($format_type{$end_tag} eq 'paragraph_style')
                {
                    end_paragraph_style($text, $stack, $state, $end_tag);
                    next;
                }
                warn "$ERROR \@end $end_tag without corresponding opening element\n";
                add_prev($text, $stack, "\@end $end_tag");
                next;
            }
            if (!$top_stack->{'format'})
            {
                warn "$ERROR waiting for closing of $top_stack->{'style'}, found \@end $end_tag";
            }
            
            unless ($format_type{$end_tag})
            {
                warn "$ERROR Unknown \@end $end_tag";
                add_prev($text, $stack, "\@end $end_tag");
                next;
            }

            # we close all the macros with braces
            my $new_stack;
            ($text, $stack, $state, $new_stack) = close_stack($text, $stack, $state, '');
            # if the previous format is a paragraph it is ended and @end end_tag 
            # is reinjected
            $top_stack = top_stack($stack);
            if (!$top_stack)
            {
                if ($format_type{$end_tag} eq 'paragraph_style')
                {
                    end_paragraph_style($text, $stack, $state, $end_tag);
                    next;
                }
                warn "$ERROR ended $end_tag without corresponding opening element\n";
                add_prev($text, $stack, "\@end $end_tag");
                next;
            }
            if ($top_stack->{'format'} eq 'paragraph')
            {
                my $paragraph = pop @$stack;
                add_prev($text, $stack, end_paragraph($paragraph->{'text'}, $state));
                if ($format_type{$end_tag} eq 'paragraph_style')
                {
                    end_paragraph_style($text, $stack, $state, $end_tag);
                    next;
                }
                $_ = "\@end $end_tag " . $_;
                next;
            }
            if ($top_stack->{'format'} eq 'menu_comment')
            {
                 warn "$WARN Waiting for end of menu comment, found $end_tag" if ($end_tag ne 'menu_comment' and $end_tag ne 'menu');
                 my $menu_comment = pop @$stack;
                 $state->{'menu_comment'}--;
                 add_prev($text, $stack, do_menu_comment ($menu_comment->{'text'}));
                 $_ = "\@end $end_tag " . $_ if ($end_tag ne 'menu_comment');
                 next;
            }
            # We should now be able to handle the format
            if (
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
                )
               )
            {
		    #print STDERR "top_stack $top_stack->{'format'}\n";
                warn  "$WARN \@end $end_tag without opening element\n";
            }
            elsif (($top_stack->{'format'} ne $end_tag) and 
               ($format_type{$end_tag} ne 'table') and ($format_type{$end_tag} ne 'list')) 
            {
                warn "$ERROR waiting for end of $top_stack->{'format'}, found $end_tag\n";
            }
            if (defined($format_type{$end_tag}))
            {
               end_format($text, $stack, $state, $end_tag);
               next;
            }
            else 
            {
                warn "$WARN Unknown \@end $end_tag\n";
                add_prev($text, $stack, "\@end $end_tag");
            }
            next;
        }
        elsif (s/^([^{}@]*)\@([a-zA-Z]\w*|["'~\@\}\{,\.!\?\s*\-\^`=:])//o)
        {
            add_prev($text, $stack, do_text($1, $state));
            my $macro = $2;
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
                my $paragraph = pop @$stack;
                add_prev ($text, $stack, end_paragraph($paragraph->{'text'}, $state));
                next;
            }
            if ($macro eq 'value')
            {
                #FIXME pertusus: what is the e modifier ?
                unless (s/^{($VARRE)}/$value{$1}/e)
                {
                    warn "$ERROR bad \@value macro";
                }
                next;
            }
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
                } #FIXME what to do if remove_texi and anchor/ref/footnote
                $state->{'keep_texi'}++ if ($macro eq 'anchor' or $macro =~ /^(x|px|info|)ref$/o);
                push (@$stack, { 'style' => $macro, 'text' => '' });
                if ($macro eq 'footnote')
                {
                    push @$stack, {'format' => 'paragraph', 'text' => ''};
                    $state->{'paragraph'} = 1;
                    $state->{'paragraph_nr'}++;
                }
                next;
            }
            if ($state->{'keep_texi'})
            {
                add_prev($text, $stack, "\@$macro");
                next;
            }
            if (grep {$macro eq $_} @raw_text)
            {
                my $result =  close_paragraph($text, $stack, $state, $macro);
                if ($result)
                {
                   $_ = $result . $_;
                   next;
                }
                $state->{'raw'} = $macro;
                push (@$stack, {'style' => $macro, 'text' => ''});
                next;
            }
            next if ($state->{'remove_texi'} and ($macro =~ /^[A-Za-z]/) and ($macro ne 'm_cedilla'));
            if (defined($simple_map{$macro}))
            {
                add_prev($text, $stack, $simple_map{$macro});
                next;
            }
            if (($macro =~ /^(\w+?)index$/) and ($1 ne 'print'))
            {
                add_prev($text, $stack, do_index_entry_label($state));
                return;
            }
            if ($things_map{$macro})
            {
                warn "$WARN $macro requires {}\n";
                my $result = $things_map{$macro};
                add_prev ($text, $stack, $result);
                next;
            }
            if (defined($accent_map{$macro}))
            {
                if (s/^([^\s])//o)
                {
                    if ($state->{'remove_texi'})
                    {
                        add_prev ($text, $stack, $1);
                    }
                    else
                    {
                        add_prev ($text, $stack, do_accent ($1, $macro));
                    }
                }
                else
                {
                    add_prev ($text, $stack, do_text($macro, $state));
                }
                next;
            }
            if ($macro =~ /^tex_(\d+)$/o)
            {
                my $result =  close_paragraph($text, $stack, $state, $macro);
                if ($result)
                {
                   $_ = $result . $_;
                   next;
                }
                add_prev ($text, $stack, do_tex($1));
                next;
            }
            if ($macro =~ /^itemx?$/)
            {
		    #print STDERR "item\n";
		    #dump_stack($text, $stack, $state);
                next if (add_item($text, $stack, $state)); # handle lists
                next if (add_term($text, $stack, $state)); # handle table
                next if (add_line($text, $stack, $state)); # handle table
	        my $format = add_row ($text, $stack, $state); # handle multitable
                push @$stack, {'format' => 'row', 'text' => ''};
                if ($format->{'max_columns'})
                {
                   push @$stack, {'format' => 'cell', 'text' => ''};
                   push @$stack, {'format' => 'paragraph', 'text' => ''};
                   $state->{'paragraph'} = 1;
                   $state->{'paragraph_nr'}++;
                   $format->{'cell'} = 1;
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
                if ($format->{'cell'} > $format->{'max_columns'})
                {
                    warn "$WARN cell over table width\n";
                    push @$stack, {'format' => 'null', 'text' => ''};
                }
                else
                {
                    push @$stack, {'format' => 'cell', 'text' => ''};
                    push @$stack, {'format' => 'paragraph', 'text' => ''};
                    $state->{'paragraph'} = 1;
                    $state->{'paragraph_nr'}++;
                }
                next;
            }
	    
            if ($format_type{$macro})
            {
                my $result =  close_paragraph($text, $stack, $state, $macro);
                if ($result)
                {
                   $_ = $result . $_;
                   next;
                }
		#print STDERR "begin $macro\n";
                if (defined($def_map{$macro}))
                {
                    my $is_extra;
                    if (defined($state->{'deff'}) and ("$state->{'deff'}x" eq $macro))
                    {
                        $is_extra = 1;
                    }
		    #push @$stack, { 'format' => $state->{'deff'}, 'text' => '' };
                    $macro =~ s/x$//o;
                    add_prev ($text, $stack, begin_deff($macro, $_, $state, $is_extra));
                    return;
                }
                elsif ($format_type{$macro} eq 'menu')
                {
                    $state->{'menu'}++;
                    push @$stack, { 'format' => $macro, 'text' => '' };
                    next;
                }
                elsif (exists ($complex_format_map->{$macro}))
                {
                    $state->{'complex_format'}++;
                    push @$stack, { 'format' => $macro, 'text' => '' };
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
                        push (@$stack, { 'format' => 'paragraph', 'text' => '' });
                        $state->{'paragraph'} = 1;
                        $state->{'paragraph_nr'}++;
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
                    elsif ($macro =~ /^multitable$/)
                    {
                        if ($format->{'max_columns'})
                        {
                            push @$stack, { 'format' => 'row', 'text' => ''};
                            push @$stack, { 'format' => 'cell', 'text' => ''};
                        }
			else 
                        {
                            push @$stack, { 'format' => 'null', 'text' => ''};
                        }
                    }
                    if ($format_type{$macro} eq 'list')
                    {
                        push @$stack, { 'format' => 'item', 'text' => ''};
                    }
                    push @$stack, { 'format' => 'paragraph', 'text' => ''};
                    if (($macro ne 'multitable') or ($format->{'max_columns'}))
                    {
                        $state->{'paragraph'} = 1;
                        $state->{'paragraph_nr'}++;
                    }
                    return if ($macro eq 'multitable');
                    next;
                }
                # keep this one at the end as there are some other formats
                # which are also in format_map
                elsif (defined($format_map{$macro}))
                {
                    push @$stack, { 'format' => $macro, 'text' => '' };
                }
                next;
            }
            warn "$WARN Unknown macro `$macro' (left as is)\n";
            add_prev ($text, $stack, do_text("\@$macro"));
            next;
        }
        elsif(s/^([^{}@]*)\@(.)//o)
        {
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
            {
                if (@$stack)
                {
                    my $style = pop @$stack;
                    my $result;
                    if ($state->{'remove_texi'})
                    {
                        if ($style->{'text'} ne '')
                        {
                            add_prev ($text, $stack, $style->{'text'});
                        }
                        else
                        {
                            add_prev ($text, $stack, $style->{'style'});
                        }
                        next;
                    }
                    if ($style->{'format'} and ($style->{'format'} eq 'paragraph'))
                    {
                        my $top_stack = top_stack($stack);
                        if ($top_stack and $top_stack->{'style'} and ($top_stack->{'style'} eq 'footnote'))
                        {
                            add_prev($text, $stack, end_paragraph($style->{'text'}, $state));
                            # If the footnote appeared within a paragraph, 
                            # we must restore the state
                            $state->{'paragraph'} = 1 if ($state->{'paragraph_nr'});
                        }
                        $style = pop @$stack;
                    }
                            
                    if ($style->{'style'})
                    {
                        $style->{'no_close_open'} = 'no_close' if ($state->{'no_close'});
                        if ($style->{'style'} eq 'anchor')
                        {
                            $result = do_anchor($style->{'text'}, $state->{'element'}->{'file'});
                            $state->{'keep_texi'}--;
                        }
                        elsif ($style->{'style'} =~ /^(x|px|info|)ref$/o)
                        {
                            $result = do_xref($style->{'style'}, $style->{'text'}, $state->{'element'}->{'file'});
                            $state->{'keep_texi'}--;
                        }
                        elsif($state->{'keep_texi'})
                        { # don't expand macros rn anchor and ref
                            $result = '@' . $style->{'style'} . '{' . $style->{'text'} . '}';
                        }
                        elsif ($style->{'style'} =~ /^footnote$/o)
                        {
                            $result = do_footnote($style->{'style'}, $style->{'text'}, $state);
                        }
                        elsif ($style->{'style'} eq 'image')
                        {
                            $result = do_image($style->{'style'}, $style->{'text'});
                        }
                        elsif ($things_map{$style->{'style'}})
                        {
                            $result = $things_map{$style->{'style'}} . $style->{'text'};
			    #$result =~ s/\\//g if ($result =~ /\\/);
                        }
                        else
                        {
                             $result = apply_style($style->{'style'}, $style->{'text'}, $style->{'no_close_open'});
                        }
                        if (!defined($result))
                        {
                            $result = '@' . $style->{'style'} . '{' . $style->{'text'} . '}';
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
        {
            add_prev($text, $stack, do_text($_, $state));
	    #print STDERR "END LINE: $_";
	    #dump_stack($text, $stack, $state);
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
    close_stack($text, $stack, $state, undef, 'term');
    my $term = pop @$stack;
    my $index_entry = ($format->{'format'} =~ /^(f|v)/);
    add_prev($text, $stack, do_term($term->{'text'}, $index_entry, $state));
    $state->{'format_stack'}->[-1]->{'term'} = 0;
    unless ($end)
    {
        push (@$stack, { 'format' => 'line', 'text' => '' });
        push (@$stack, { 'format' => 'paragraph', 'text' => '' });
        $state->{'paragraph'} = 1;
        $state->{'paragraph_nr'}++;
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
    add_prev($text, $stack, do_row($row->{'text'}));
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
        add_prev($text, $stack, do_cell($cell->{'text'}));
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
    close_stack($text, $stack, $state, undef, 'line');
    my $line = pop @$stack;
    my $first = 0;
    $first = 1 if ($format->{'first'});
    if ($first)
    {
        $format->{'first'} = 0;
        add_prev($text, $stack, $line->{'text'});
    }
    else
    {
        add_prev($text, $stack, do_table_line($line->{'text'}));
    }
    push (@$stack, { 'format' => 'term', 'text' => '' }) unless $end;
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
    close_stack($text, $stack, $state, undef, 'item');
    #dump_stack ($text, $stack, $state);
    my $item = pop @$stack;
    if ($format->{'first'})
    {
        $format->{'first'} = 0;
        add_prev($text, $stack, $item->{'text'});
    }
    else
    {
        add_prev($text, $stack, do_item($item->{'text'}));
    }
    unless($end)
    {
        push (@$stack, { 'format' => 'item', 'text' => '' });
        push (@$stack, { 'format' => 'paragraph', 'text' => '' });
        $state->{'paragraph'} = 1;
        $state->{'paragraph_nr'}++;
    }
    return 1;
}

sub do_term($$$)
{
   my $text = shift;
   my $do_index = shift;
   my $state = shift;
   $text .= do_index_entry_label($state) if ($do_index);
   return '<dt>' . $text . '</dt>' . "\n";
}

sub do_table_line($)
{
    my $text = shift;

    if ($text =~ /[^\s]/)
    {
         return '<dd>' . $text . '</dd>' . "\n";
    }
    return '';
}

sub do_row($)
{
    my $text = shift;

    if ($text =~ /[^\s]/)
    {
         return '<tr>' . $text . '</tr>' . "\n";
    }
    return '';
}

sub do_cell($)
{
    my $text = shift;
    return '<td>' . $text . '</td>';
}

sub do_item($$)
{
   my $text = shift;
# FIXME add . "\n" ?
   return '<li>' . $text . '</li>';
}

sub do_text($;$)
{
    my $text = shift;
    my $state = shift;
    return $text if (defined($state) and ($state->{'keep_texi'} or $state->{'remove_texi'}));
    if (defined($state) and !$state->{'complex_format'})
    {
        $text =~ s/``/"/go;
        $text =~ s/''/"/go;
        $text =~ s/---/--/go;
    }
    return protect_html($text);
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
#      'no_close' -> don't close styles, duplicate stack of styles not closed
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
    $state->{'paragraph-style'} = [ '' ] unless (defined($close_paragraph) or defined($format));
    return ($text, $stack, $state, $new_stack) unless @$stack;
    
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
        $string .= " \@end $state->{'raw'} ";
        $stack_level--;
    }

    
    while ($stack_level--)
    {
        if ($stack->[$stack_level]->{'format'})
        {
            last if (defined($close_paragraph) or (defined($format) and $stack->[$stack_level]->{'format'} eq $format));
            if ($stack->[$stack_level]->{'format'} eq 'paragraph')
            {
                $string .= " \@end_paragraph ";
            }
            else
            {
                warn "$WARN closing $stack->[$stack_level]->{'format'}\n"; 
                $string .= " \@end $stack->[$stack_level]->{'format'} ";
            }
        }
        else
        {
            if ($close_paragraph)
            { #duplicate the stack
                push @$new_stack, { 'style' => $stack->[$stack_level]->{'style'},
                    'text' => '', 'no_close_open' => $close_paragraph };
            }
	    else
            {
                dump_stack ($text, $stack, $state) if (!defined($stack->[$stack_level]->{'style'})); 
                warn "$WARN closing $stack->[$stack_level]->{'style'}\n"; 
            }
            $string .= '} ';
        }
    }
    $state->{'no_close'} = 1 if (defined($close_paragraph) and $close_paragraph eq 'no_open');
    #print STDERR "scan_line in close_stack\n";
    scan_line ($string, $text, $stack, $state) if ($string);
    $state->{'no_close'} = 0;
    $state->{'verb'} = $verb if ($verb);
    return ($text, $stack, $state, $new_stack);
}

sub close_paragraph($$$$)
{
   my $text = shift;
   my $stack = shift;
   my $state = shift;
   my $macro = shift;
   my $new_stack;
   ($text, $stack, $state, $new_stack) = close_stack($text, $stack, $state, '');
   my $top_stack = top_stack($stack);
   if ($top_stack and $top_stack->{'format'} eq 'paragraph')
   {
       my $paragraph = pop @$stack;
       add_prev($text, $stack, end_paragraph($paragraph->{'text'}, $state));
       return "\@$macro ";
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

sub substitute_text($@)
{
    my $no_paragraph = shift;
    my @stack = ();
    my %state = ();
    my $text = '';
    my $result = '';
    if ($no_paragraph)
    {
        $state{'no_paragraph'} = 1;
    }
    #delete $state{'paragraph'} = 0;
    $state{'paragraph_style'} = [ '' ];
    
    while (@_)
    {
        my $line = shift @_;
        next unless (defined($line));
        scan_line ($line, \$text, \@stack, \%state);
        next if (@stack);
        $result .= $text;
        $text = '';
    }
    close_stack (\$text, \@stack, \%state);
    return $result . $text;
}

# $name           :   anchor name
# $href           :   anchor href
# text            :   text displayed
# extra_attribs   : added to anchor attributes list
sub t2h_anchor($$$;$)
{
    my($name, $href, $text, $extra_attribs) = @_;
    my @result = ();

    push(@result, '<a');
    push(@result, ' name="', $name, '"') if $name;
    if ($href)
    {
        $href =~ s|^$T2H_HREF_DIR_INSTEAD_FILE|./|
            if ($T2H_HREF_DIR_INSTEAD_FILE);
        push(@result, ' href="', $href, '"');
    }
    push(@result, ' ', $extra_attribs) if $extra_attribs;
    push(@result, '>');
    push(@result, $text) if $text;
    push(@result, '</a>');
    return join('', @result);
}

sub t2h_print_lines($;$)
{
    my ($fh, $lines) = @_;
    $lines = $T2H_THIS_SECTION unless $lines;
    for my $line (@$lines)
    {
        print $fh $line;
    }
}

sub protect_html($)
{
    my $what = shift;
    # protect &, ", <, and >.
    # APA: Keep it simple.  This is what perl's CGI::espaceHTML does.
    # We may consider using that instead.
    # If raw HTML is used outside @ifhtml or @html it's an error
    # anyway.
    $what =~ s/\&/\&amp;/go;
    $what =~ s/\"/\&quot;/go;
    $what =~ s/\</\&lt;/go;
    $what =~ s/\>/\&gt;/go;
    return($what);
}

sub t2h_print_label($;$)
{
    my $fh = shift;
    my $href = shift || $T2H_HREF{This};
    $href =~ s/.*#(.*)$/$1/;
    print $fh qq{<a name="$href"></a>\n};
}

sub do_label($)
{
    my $label = shift;
    return qq{<a name="$label"></a>};
}

sub do_index_entry_label($$)
{
    my $state = shift;
    my $entry = shift @index_labels;
    
    #print STDERR "adding $entry->{'html_key'} $entry->{'id'}\n";
    my $label = do_label($entry->{'id'}) if ($entry->{'id'});
    $label .= "\n" if ($label and !$state->{'complex_format'});
    return $label;
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
# Set the default body text, inserted between <body ... >
$T2H_BODYTEXT = 'lang="' . $T2H_LANG . '" bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000"' unless (defined($T2H_BODYTEXT));

# this is used in footer
unless (defined($T2H_ADDRESS))
{
    $T2H_ADDRESS = "by <i>$T2H_USER</i> " if $T2H_USER;
    $T2H_ADDRESS .= "on <i>$T2H_TODAY</i>";
}

open_file($docu);
pass_texi();
rearrange_elements();
do_names();
do_toc();
$sec_num = 0;
$T2H_L2H = l2h_FinishToLatex() if ($T2H_L2H);
$T2H_L2H = l2h_ToHtml()        if ($T2H_L2H);
$T2H_L2H = l2h_InitFromHtml()  if ($T2H_L2H);
pass_text(); 
l2h_FinishFromHtml() if ($T2H_L2H);
l2h_Finish() if($T2H_L2H);
print "# that's all folks\n" if $T2H_VERBOSE;

exit(0);


##############################################################################

# These next few lines are legal in both Perl and nroff.

.00 ;                           # finish .ig

'di			\" finish diversion--previous line must be blank
.nr nl 0-1		\" fake up transition to first page again
.nr % 0			\" start at page 1
'; __END__ ############# From here on it's a standard manual page ############
    .so @mandir@/man1/texi2html.1
