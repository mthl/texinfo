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
#
# According to
# larry.jones@sdrc.com (Larry Jones)
# this pragma is not present in perl5.004_02:
#
# Perl pragma to control optional warnings
# use warnings;

# Declarations
use vars qw(
            $ADDRESS
            $ANTI_ALIAS
            $ANTI_ALIAS_TEXT
            $ASCII_MODE
            $AUTO_LINK
            $AUTO_PREFIX
            $BIBRE
            $CHAPTEREND
            $CHILDLINE
            $DEBUG
            $DEBUG_BIB
            $DEBUG_DEF
            $DEBUG_GLOSS
            $DEBUG_HTML
            $DEBUG_INDEX
            $DEBUG_L2H
            $DEBUG_TOC
            $DEBUG_USER
            $DESTDIR
            $ERROR
            $EXTERNAL_FILE
            $EXTERNAL_IMAGES
            $EXTERNAL_UP_LINK
            $EXTERNAL_UP_TITLE
            $FH
            $FIGURE_SCALE_FACTOR
            $FILERE
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
            $NODERE
            $NODESRE
            $NOLATEX
            $NO_FOOTNODE
            $NO_IMAGES
            $NO_NAVIGATION
            $NO_SIMPLE_MATH
            $NO_SUBDIR
            $PAPERSIZE
            $PREFIX
            $PROTECTTAG
            $PS_IMAGES
            $REUSE
            $SCALABLE_FONTS
            $SECTIONEND
            $SHORTEXTN
            $SHORT_INDEX
            $SHOW_SECTION_NUMBERS
            $SPLIT
            $T2H_ADDRESS
            $T2H_AFTER_ABOUT
            $T2H_AFTER_BODY_OPEN
            $T2H_AUTHORS
            $T2H_BODYTEXT
            $T2H_BUTTONS
            $T2H_EXTRA_HEAD
            $T2H_HAS_TOP_HEADING
            $T2H_HOMEPAGE
            $T2H_ICONS
            $T2H_OBSOLETE_OPTIONS
            $T2H_OVERVIEW
            $T2H_PRE_BODY_CLOSE
            $T2H_THIS_SECTION
            $T2H_TOC
            $T2H_TODAY
            $T2H_TOP
            $T2H_USER
            $TEXDEFS
            $THISPROG
            $TITLE
            $TITLES_LANGUAGE
            $TMP
            $TOPEND
            $VARRE
            $VERBOSE
            $WARN
            $WORDS_IN_NAVIGATION_PANEL_TITLES
            $WORDS_IN_PAGE
            $after
            $before
            $bib_num
            $button
            $call
            $changed
            $complex_format_map
            $contents
            $count
            $counter
            $d
            $doc_num
            $docid
            $done
            $dotbug
            $elt
            $end_tag
            $entry
            $ext
            $extensions
            $failed
            $fh_name
            $file
            $first_index_chapter
            $foot
            $foot_num
            $footid
            $ftype
            $full
            $gloss_num
            $h_content
            $h_line
            $hcontent
            $html_num
            $i
            $id
            $idx_num
            $in
            $in_titlepage
            $index
            $index_properties
            $init_file
            $int_file
            $is_extra
            $key
            $keys
            $l
            $l_l2h
            $latex_file
            $len
            $letter
            $level
            $man
            $match
            $maximage
            $next
            $nn
            $node
            $node_next
            $node_prev
            $node_up
            $nodes
            $num
            $old
            $only_text
            $options
            $post
            $pre
            $prev_node
            $previous
            $progdir
            $sec_num
            $section
            $string
            $style
            $sub
            $subst_code
            $tag
            $texi_style
            $to_do
            $tocid
            $toplevel
            $type
            $url
            $use_bibliography
            $what
            %T2H_ACTIVE_ICONS
            %T2H_BUTTONS_EXAMPLE
            %T2H_BUTTONS_GOTO
            %T2H_HREF
            %T2H_NAME
            %T2H_NAVIGATION_TEXT
            %T2H_NODE
            %T2H_PASSIVE_ICONS
            %T2H_THISDOC
            %accent_map
            %bib2href
            %context
            %def_map
            %format_map
            %gloss2href
            %idx2node
            %l2h_img
            %node2href
            %node2next
            %node2prev
            %node2sec
            %node2up
            %number2sec
            %predefined_index
            %sec2level
            %sec2node
            %sec2seccount
            %seccount2sec
            %sec2number
            %sec2index
            %seen
            %simple_map
            %style_map
            %tag2pro
            %things_map
            %to_skip
            %user_sub
            %valid_index
            %value
            @T2H_CHAPTER_BUTTONS
            @T2H_MISC_BUTTONS
            @T2H_SECTION_BUTTONS
            @appendix_sec_num
            @args
            @doc_lines
            @fhs
            @foot_lines
            @input_spool
            @lines2
            @lines3
            @normal_sec_num
            @sections
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
# $Id: texi2html.pl,v 1.22 2003-02-06 11:52:31 pertusus Exp $

# Homepage:
$T2H_HOMEPAGE = "http://texi2html.cvshome.org/";

# Authors:
$T2H_AUTHORS = <<EOT;
Written by: Lionel Cons <Lionel.Cons\@cern.ch> (original author)
            Karl Berry  <karl\@freefriends.org>
            Olaf Bachmann <obachman\@mathematik.uni-kl.de>
            and many others.
Maintained by: Many creative people <dev\@texi2html.cvshome.org>
Send bugs and suggestions to <users\@texi2html.cvshome.org>
EOT

# Version: set in configure.in
my $THISVERSION = '@T2H_VERSION@';
$THISPROG = "texi2html $THISVERSION"; # program name and version

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

package main;

#+++############################################################################
#                                                                              #
# Prototypes                                                                   #
#                                                                              #
#---############################################################################

sub check();

#+++############################################################################
#                                                                              #
# Constants                                                                    #
#                                                                              #
#---############################################################################

$DEBUG_TOC   =  1;
$DEBUG_INDEX =  2;
$DEBUG_BIB   =  4;
$DEBUG_GLOSS =  8;
$DEBUG_DEF   = 16;
$DEBUG_HTML  = 32;
$DEBUG_USER  = 64;
$DEBUG_L2H   = 128;


$BIBRE = '\[[\w\/-]+\]';        # RE for a bibliography reference
$FILERE = '[\/\w.+-]+';         # RE for a file name
$VARRE = '[^\s\{\}]+';          # RE for a variable name
$NODERE = '[^:]+';             # RE for a node name
$NODESRE = '[^:]+';             # RE for a list of node names

$ERROR = "***";                 # prefix for errors
$WARN  = "**";                  # prefix for warnings

                                # program home page
$PROTECTTAG = "_ThisIsProtected_"; # tag to recognize protected sections

$CHAPTEREND = "<!-- End chapter -->\n"; # to know where a chpater ends
$SECTIONEND = "<!-- End section -->\n"; # to know where section ends
$TOPEND     = "<!-- End top     -->\n"; # to know where top ends



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
	       'dots', '<small>...<\/small>',
	       'enddots', '<small>....<\/small>',
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
	       'l', '\/l',
	       'L', '\/L',
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
	      'dotless',    '&do_accent'
             );

#
# texinfo format (@foo/@end foo) to HTML ones
#
%format_map = (
	       'quotation',  'blockquote',
	       # lists
	       'itemize',    'ul',
	       'enumerate',  'ol',
	       # poorly supported
	       'flushleft',  'pre',
	       'flushright', 'pre',
              );

#
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
%to_skip = (
	    # comments
	    'c', 1,
	    'comment', 1,
            'ifnotinfo', 1,
            'ifnottex', 1,
	    'ifhtml', 1,
	    'end ifhtml', 1,
            'end ifnotinfo', 1,
            'end ifnottex', 1,
	    # useless
	    'detailmenu', 1,
            'direntry', 1,
	    'contents', 1,
	    'shortcontents', 1,
	    'summarycontents', 1,
	    'footnotestyle', 1,
	    'end ifclear', 1,
	    'end ifset', 1,
	    'titlepage', 1,
	    'end titlepage', 1,
	    # unsupported commands (formatting)
	    'afourpaper', 1,
	    'cropmarks', 1,
	    'finalout', 1,
	    'headings', 1,
            'sp', 1,
	    'need', 1,
	    'page', 1,
	    'setchapternewpage', 1,
	    'everyheading', 1,
	    'everyfooting', 1,
	    'evenheading', 1,
	    'evenfooting', 1,
	    'oddheading', 1,
	    'oddfooting', 1,
	    'smallbook', 1,
	    'vskip', 1,
	    'filbreak', 1,
	    'paragraphindent', 1,
	    # unsupported formats
	    'cartouche', 1,
	    'end cartouche', 1,
	    'group', 1,
	    'end group', 1,
           );

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


%value = ();                    # hold texinfo variables, see also -D
$use_bibliography = 1;

#
# called on -init-file
sub LoadInitFile
{
    # First argument is option
    shift;
    # second argument is value of options
    my $init_file = shift;
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

#
# called on -lang
sub SetDocumentLanguage
{
    my $lang = shift;
    if (! exists($T2H_WORDS->{$lang}))
    {
        warn "$ERROR: Language specs for '$lang' do not exists. Reverting to '" .
            ($T2H_LANG ? $T2H_LANG : "en") . "'\n";
    }
    else
    {
        print "# using '$lang' as document language\n" if ($T2H_VERBOSE);
        $T2H_LANG = $lang;
    }
}

##
## obsolete cmd line options
##
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
 linkage => sub {$T2H_EXPAND = 'info';},
 verbose => 'obsolete, use "-expand info" instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {expandtex} =
{
 type => '!',
 linkage => sub {$T2H_EXPAND = 'tex';},
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

if ($T2H_CHECK)
{
    die "Need file to check\n$T2H_FAILURE_TEXT" unless @ARGV > 0;
    check();
    exit;
}

#+++############################################################################
#                                                                              #
# evaluation of cmd line options
#                                                                              #
#---############################################################################

if ($T2H_EXPAND eq 'info')
{
    $to_skip{'ifinfo'} = 1;
    $to_skip{'end ifinfo'} = 1;
}
elsif ($T2H_EXPAND eq 'tex')
{
    $to_skip{'iftex'} = 1;
    $to_skip{'end iftex'} = 1;

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
my $docu_doc;            # current document

die "Need exactly one file to translate\n$T2H_FAILURE_TEXT" unless @ARGV == 1;
my $docu = shift(@ARGV);
if ($docu =~ /.*\//)
{
    chop($docu_dir = $&);
    $docu_name = $';
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
if ($T2H_TOP_FILE =~ /\..*$/)
{
    $T2H_TOP_FILE = $`.".$docu_ext";
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
    undef $T2H_SPLIT;
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

my $docu_doc_file = "$docu_rdir$docu_doc";
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
foreach ('_author', '_title', '_subtitle',
	 '_settitle', '_setfilename', '_shorttitle')
{
    $value{$_} = '';            # prevent -w warnings
}
%node2sec = ();                 # node to section name
%sec2node = ();			# section to node name
%sec2seccount = ();		# section to section count
%seccount2sec = ();		# section count to section
%sec2number = ();		# section to number
				# $number =~ ^[\dA-Z]+\.(\d+(\.\d+)*)?$
%sec2index = ();                # 1 if section in index
%number2sec = ();		# number to section
%idx2node = ();                 # index keys to node
%node2href = ();                # node to HREF
%node2next = ();                # node to next
%node2prev = ();                # node to prev
%node2up   = ();                # node to up
%bib2href = ();                 # bibliography reference to HREF
%gloss2href = ();               # glossary term to HREF
@sections = ();                 # list of sections
%tag2pro = ();                  # protected sections

#
# initial indexes
#
$bib_num = 0;
$foot_num = 0;
$gloss_num = 0;
$idx_num = 0;
$sec_num = 0;
$doc_num = 0;
$html_num = 0;

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
$extensions = 'texi2html.ext';  # extensions in working directory
if (-f $extensions)
{
    print "# reading extensions from $extensions\n" if $T2H_VERBOSE;
    require($extensions);
}
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
            warn "$ERROR Error l2h: Can't open latex file '$latex_file' for writing\n";
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
# HTML commentary which can be later on replaced by the latex2html
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
    return "<!-- l2h_replace ${l2h_name} ${count} -->";
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
    local($call, $ext, $dotbug);
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
        if (&getcwd =~ /\./)
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

sub l2h_InitFromHtml
{
    local($h_line, $h_content, $count, %l2h_img);

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
            $h_content = "";
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
            if ($hcontent)
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

sub l2h_FromHtml
{
    my($text) = @_;
    my($done, $to_do, $count);
    $to_do = $text;
    while ($to_do =~ /([^\000]*)<!-- l2h_replace $l2h_name ([0-9]+) -->([^\000]*)/)
    {
        $to_do = $1;
        $count = $2;
        $done = $3.$done;
        $done = "<!-- l2h_end $l2h_name $count -->".$done
            if ($T2H_DEBUG & $DEBUG_L2H);

        $done = &l2h_ExtractFromHtml($count) . $done;

        $done = "<!-- l2h_begin $l2h_name $count -->".$done
            if ($T2H_DEBUG & $DEBUG_L2H);
    }
    return $to_do.$done;
}


sub l2h_ExtractFromHtml
{
    local($count) = @_;
    return $l2h_from_html[$count] if ($l2h_from_html[$count]);
    if ($count >= 0 && $count < $l2h_latex_count)
    {
        # now we are in trouble
        local($l_l2h, $_);

        $l2h_extract_error++;
        print "$ERROR l2h: can't extract content $count from html\n"
            if ($T2H_VERBOSE);
        # try simple (ordinary) substition (without l2h)
        $l_l2h = $T2H_L2H;
        $T2H_L2H = 0;
        $_ = $l2h_to_latex{$count};
        $_ = &substitute_style($_);
        $_ = &unprotect_texi($_);
        $_ = "<!-- l2h: ". __LINE__ . " use texi2html -->" . $_
            if ($T2H_DEBUG & $DEBUG_L2H);
        $T2H_L2H = $l_l2h;
        return $_;
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

sub l2h_FinishFromHtml
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

sub l2h_Finish
{
    l2h_StoreCache();
    if ($T2H_L2H_CLEAN)
    {
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
$maximage = 1;
sub l2h_ToCache
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


#+++############################################################################
#                                                                              #
# Pass 1: read source, handle command, variable, simple substitution           #
#                                                                              #
#---############################################################################

# build code for simple substitutions
# the maps used (%simple_map and %things_map) MUST be aware of this
# watch out for regexps, / and escaped characters!
sub build_simple_substitutions ()
{    
    my $subst_code = '';
    foreach (keys(%simple_map))
    {
        my $re;
        ($re = $_) =~ s/(\W)/\\$1/g; # protect regexp chars
        $subst_code .= "s/\\\@$re/$simple_map{$_}/g;\n";
    }
    foreach (keys(%things_map))
    {
        $subst_code .= "s/\\\@$_\\{\\}/$things_map{$_}/g;\n";
    }
    # first remove dotless command
    $subst_code .= "s/\\\@dotless\\{([a-z])\\}/\${1}/gi;\n";
    # then substitute accentuated characters
    foreach (keys(%accent_map))
    {
        my $subst_command;
        if ($_ eq "`")
        {
            $subst_command .= "s/$;3";
        }
        elsif ($_ eq "'")
        {
            $subst_command .= "s/$;4";
        }
        elsif ($_ eq '"')
        {
            $subst_command .= "s/$;5";
        }
        else
        {
            $subst_command .= "s/\\\@\\$_";
        }
        $subst_code .= $subst_command ."([a-z])/&\${1}$accent_map{$_};/gi;\n";
        $subst_code .= $subst_command ."{([a-z])}/&\${1}$accent_map{$_};/gi;\n";
    }
    eval("sub simple_substitutions { $subst_code }");
}

my $has_top = 0;            # did I see a top node?
my $has_top_command = 0;    # did I see @top for automatic pointers?
my @html_stack = ();        # HTML elements stack
my $html_element = '';      # current HTML element

my @lines = ();             # whole document
my @toc_lines = ();            # table of contents
my @stoc_lines = ();           # table of contents

sub pass1
{
    my $name;
    my @nodes_and_anchors = (); # all nodes and anchors
    my $curlevel = 0;           # current level in TOC
    my $node = '';              # current node name
    my $node_next = '';         # current node next name
    my $node_prev = '';         # current node prev name
    my $node_up = '';           # current node up name
    my $in_table = 0;           # am I inside a table 
              # holds the command used to format entries for tables ;
              # for multitable, in_table is like: $table_width:$current_column
              # $current_column == 0 if there was no line
    my $table_type = '';        # type of table ('', 'f', 'v', 'multi')
    my @tables = ();            # nested table support
    my $in_bibliography = 0;    # am I inside a bibliography
    my $in_glossary = 0;        # am I inside a glossary
    my $in_top = 0;             # am I inside the top node
    my $in_pre = 0;             # am I inside a preformatted section
    my $in_list = 0;            # am I inside a list
    my $in_html = 0;            # am I inside an HTML section
    my $first_line = 1;         # is it the first line
    my $dont_html = 0;          # don't protect HTML on this line
    #my %macros = ();           # macros #FIXME: really unused ?
    my $macros;                 # macros. reference on a hash

    &html_reset;
    build_simple_substitutions();
    &init_input;

 INPUT_LINE: while ($_ = &next_line)
    {
        #
        # remove \input on the first lines only
        #
        if ($first_line)
        {
            next if /^\\input/;
            $first_line = 0;
        }
        # non-@ substitutions cf. texinfmt.el
        #
        # parse texinfo tags
        #
        $tag = '';
        $end_tag = '';
        if (/^\s*\@end\s+(\w+)\b/)
        {
            $end_tag = $1;
        }
        elsif (/^\s*\@(\w+)\b/)
        {
            $tag = $1;
        }
        #
        # handle @html / @end html
        #
        if ($in_html)
        {
            if ($end_tag eq 'html')
            {
                $in_html = 0;
            }
            else
            {
                $tag2pro{$in_html} .= $_;
            }
            next;
        }
        elsif ($tag eq 'html')
        {
            $in_html = $PROTECTTAG . ++$html_num;
            push(@lines, $in_html);
            next;
        }

        #
        # try to remove inlined comments
        # syntax from tex-mode.el comment-start-skip
        #
        s/((^|[^\@])(\@\@)*)\@(c( |\{)|comment ).*$/$1/;

        # Sometimes I use @c right at the end of  a line ( to suppress the line feed )
        #    s/((^|[^\@])(\@\@)*)\@c(omment)?$/$1/;
        #     s/((^|[^\@])(\@\@)*)\@c(omment)? .*/$1/;
        #     s/(.*)\@c{.*?}(.*)/$1$2/;
        #     s/(.*)\@comment{.*?}(.*)/$1$2/;
        #     s/^(.*)\@c /$1/;
        #     s/^(.*)\@comment /$1/;

        #############################################################
        # value substitution before macro expansion, so that
        # it works in macro arguments
        s/\@value{($VARRE)}/$value{$1}/eg;

        #############################################################
        # macro substitution
        while (/\@(\w+)/g)
        {
            if (exists($macros->{$1}))
            {
                my $before = $`;
                $name = $1;
                my $after = $';
                my @args;
                my $args;
                #####################################################
                # Support for multi-line macro invocations and nested
                # '{' and '}' within macro invocations added by
                # Eric Sunshine <sunshine@sunshineco.com> 2000/09/10.
                #####################################################
                if ($after =~ /^\s*\{/) # Macro arguments delimited by '{' and '}'?
                {
                    my ($protect, $start, $end, $depth, $c) = (0, 0, 0, 0, 0);
                    foreach $c (unpack('C*', $after))
                    {
                        if ($protect)
                        {       # Character protected by '\' or '@'; pass through unmolested.
                            $protect = 0;
                        }
                        elsif ($c == ord('\\') || $c == ord('@'))
                        {       # '\' and '@' remove special meaning of next character.
                            $protect = 1;
                        }
                        elsif ($c == ord('{')) # Allow '{' and '}' to nest.
                        {
                            $depth++;
                        }
                        elsif ($c == ord('}'))
                        {
                            $depth--;
                            last if $depth == 0;
                        }
                        $start++ if !$depth; # Position of opening brace.
                        $end++; # Position of closing brace.
                    }

                    # '{' & '}' did not completely unnest; append next line; try again.
                    if ($depth > 0)
                    {
                        my $paste = &next_line;
                        die "$ERROR Missing closing brace '}' for invocation of macro " .
                            "\"\@$name\" on line:\n", substr($_,0,70), "...\n" unless $paste;
                        s/\n$/ /;
                        unshift @input_spool, $_ . $paste;
                        next INPUT_LINE;
                    }

                    # Extract macro arguments from within '{' and '}'.
                    $len = $end - $start - 1;
                    $args = ($len > 0) ? substr($after, $start + 1, $len) : '';
                    $after = substr($after, $end + 1);
                }
                ############ End Sunshine Modifications #############
                elsif (@{$macros->{$name}->{Args}} == 1) # Macro arg extends to EOL.
                {
                    $args = $after;
                    $args =~ s/^\s*//;
                    $args =~ s/\s*$//;
                    $after = '';
                }
                $args =~ s|\\\\|\\|g;
                $args =~ s|\\{|{|g;
                                $args =~ s|\\}|}|g;
                if (@{$macros->{$name}->{Args}} > 1)
                {
                    $args =~ s/(^|[^\\]),/$1$;/g ;
                    $args =~ s|\\,|,|g;
                    @args = split(/$;\s*/, $args) if (@{$macros->{$name}->{Args}} > 1);
                }
                else
                {
                    $args =~ s|\\,|,|g;
                    @args = ($args);
                }
                my $macrobody = $macros->{$name}->{Body};
                for ($i=0; $i<=$#args; $i++)
                {
                    $macrobody =~ s|\\$macros->{$name}->{Args}->[$i]\\|$args[$i]|g;
                }
                $macrobody =~ s|\\\\|\\|g;
                $_ = $before . $macrobody . $after;
                unshift @input_spool, map {$_ = $_."\n"} split(/\n/, $_);
                next INPUT_LINE;
            }
        }
        #
        # try to skip the line
        #
        if ($end_tag)
        {
            $in_titlepage = 0 if $end_tag eq 'titlepage';
            next if $to_skip{"end $end_tag"};
        }
        elsif ($tag)
        {
            $in_titlepage = 1 if $tag eq 'titlepage';
            next if $to_skip{$tag};
            last if $tag eq 'bye';
        }
        if ($in_top)
        {
            # parsing the top node
            if ($tag eq 'node' ||
                ($sec2level{$tag} && $tag !~ /unnumbered/ && $tag !~ /heading/))
            {
                # no more in top
                $in_top = 0;
                push(@lines, $TOPEND);
            }
        }
        unless ($in_pre)
        {
            s/``/\"/go;
            s/''/\"/go;
            s/([\w ])---([\w ])/$1--$2/g;
        }
        #
        # analyze the tag
        #
        if ($tag)
        {
            # skip lines
            (&skip_until($tag), next) if $tag eq 'ignore';
            (&skip_until($tag), next) if $tag eq 'ifnothtml';
            if ($tag eq 'ifinfo')
            {
                (&skip_until($tag), next) unless $T2H_EXPAND eq 'info';
            }
            if ($tag eq 'iftex')
            {
                (&skip_until($tag), next) unless $T2H_EXPAND eq 'tex';
            }
            if ($tag eq 'tex')
            {
                # add to latex2html file
                if ($T2H_EXPAND eq 'tex' && $T2H_L2H && ! $in_pre)
                {
                    # add space to the end -- tex(i2dvi) does this, as well
                    push(@lines, &l2h_ToLatex(&string_until($tag) . " "));
                }
                else
                {
                    &skip_until($tag);
                }
                next;
            }
            if ($tag eq 'titlepage')
            {
                next;
            }
            # handle special tables
            if ($tag =~ /^(|f|v|multi)table$/)
            {
                $table_type = $1;
                $tag = 'table';
            }
            # special cases
            # APA: Fixed regexp to ONLY match the top node, not any
            # node starting with the word top.
            if ($tag eq 'top' || ($tag eq 'node' && /^\@node\s+top\s*(,.*)?$/i))
            {
                $in_top = 1;
                $has_top = 1;
                $has_top_command = 1 if $tag eq 'top';
                @lines = ();    # ignore all lines before top (title page garbage)
                next;
            }
            elsif ($tag eq 'node')
            {
                if ($in_top)
                {
                    $in_top = 0;
                    push(@lines, $TOPEND);
                }
                warn "$ERROR Bad node line: $_" unless $_ =~ /^\@node\s$NODESRE$/o;
                # request of "Richard Y. Kim" <ryk@ap.com>
                s/^\@node\s+//;
                # cedilla @,{c} has a , which could be confused with a , between
                # nodes. We protect it before splitting.
                my @nodes = split(/,/, &protect_cedilla($_));
                ($node, $node_next, $node_prev, $node_up) = &unprotect_cedilla (@nodes);
                if ($node)
                {
                    $node = &normalise_node($node);
                    if (grep {$node eq $_} @nodes_and_anchors)
                    {
                        warn "$ERROR Duplicate node found: $node\n"
                    }
                    else
                    {
                        push @nodes_and_anchors, $node;
                    }
                    $node2href{$node} = "$docu_doc#NODE_$node";
                }
                else
                {
                    warn "$ERROR Node is undefined: $_ (eg. \@node NODE-NAME, NEXT, PREVIOUS, UP)";
                }
                if ($node_next)
                {
                    $node_next = &normalise_node($node_next);
                }
                if ($node_prev)
                {
                    $node_prev = &normalise_node($node_prev);
                }
                if ($node_up)
                {
                    $node_up = &normalise_node($node_up);
                }
                push @lines, &html_debug("<a name=\"".'NODE_'.$node."\"></a>\n", __LINE__);
                next;
            }
            elsif ($tag eq 'include')
            {
                if (/^\@include\s+($FILERE)\s*$/o)
                {
                    $file = LocateIncludeFile($1);
                    if ($file && -e $file)
                    {
                        &open($file);
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
                }
                next;
            }
            elsif ($tag eq 'ifclear')
            {
                if (/^\@ifclear\s+($VARRE)\s*$/o)
                {
                    next unless defined($value{$1});
                    &skip_until($tag);
                }
                else
                {
                    warn "$ERROR Bad ifclear line: $_";
                }
                next;
            }
            elsif ($tag eq 'ifset')
            {
                if (/^\@ifset\s+($VARRE)\s*$/o)
                {
                    next if defined($value{$1});
                    &skip_until($tag);
                }
                else
                {
                    warn "$ERROR Bad ifset line: $_";
                }
                next;
            }
            elsif ($tag eq 'menu')
            {
                unless ($T2H_SHOW_MENU)
                {
                    &skip_until($tag);
                    next;
                }
                &html_push_if($tag);
                push(@lines, &html_debug('', __LINE__));
            }
            elsif ($format_map{$tag})
            {
                $in_pre = 1 if $format_map{$tag} eq 'pre';
                &html_push_if($format_map{$tag});
                push(@lines, &html_debug('', __LINE__));
                $in_list++ if $format_map{$tag} eq 'ul' || $format_map{$tag} eq 'ol' ;
                #	    push(@lines, &debug("<blockquote>\n", __LINE__))
                #	      if $tag =~ /example/i;
                # Eric Sunshine <sunshine@sunshineco.com>: <pre>blah</pre>
                # looks better than <pre>\nblah</pre> on OmniWeb2 NextStep
                # browser.
                push(@lines, &debug("<$format_map{$tag}>" .
                                    ($in_pre ? '' : "\n"), __LINE__));
                next;
            }
            elsif (exists $complex_format_map->{$tag})
            {
                my $start = eval $complex_format_map->{$tag}->[0];
                # APA: <table> implicitly ends paragraph, so let's do it
                # explicitly to keep our HTML stack in sync.
                if ($start =~ /\A\s*<table>/i)
                {
                    if ($html_element eq 'p')
                    {
                        push (@lines, &debug("</p>\n", __LINE__));
                        &html_pop();
                    }
                }
                if ($@)
                {
                    print "$ERROR: eval of complex_format_map->{$tag}->[0] $complex_format_map->{$tag}->[0]: $@";
                    $start = '<pre>'
                }
                $in_pre = 1 if $start =~ /<pre/;
                push(@lines, html_debug($start. ($in_pre ? '' : "\n"), __LINE__));
                next;
            }
            elsif ($tag eq 'table')
            {
                if ($table_type eq 'multi')
                { 
                    # first find the table width
                    my $table_width = 0;
                    if (s/^\s*\@multitable\s+\@columnfractions\s+//)
                    {
                        my @fractions = split /\s+/;
                        $table_width = $#fractions + 1;
                        while (@fractions)
                        {
                            my $fraction = shift @fractions;
                            unless ($fraction =~ /^(\d*\.\d+)|(\d+)$/)
                            { 
                                warn "$ERROR column fraction not a number: $fraction";
                            }
                        }
                    }
                    elsif (s/^\s*\@multitable\s+\{//)
                    {
                        my $opened_braces = 1;
                        while ($_ !~ /^\s*$/)
                        {
                            if (s/^[^\{\}]*(\{|\})?//)
                            {
                                if (defined($1))
                                {
                                    $opened_braces++ if ($1 eq '{');
                                    $opened_braces-- if ($1 eq '}');
                                }
                                else
                                {
                                    warn "$ERROR garbage in multitable specification";
                                }
                            }
                            $table_width++ if ($opened_braces == 0);
                            if ($opened_braces < 0)
                            {
                                 warn "$ERROR too much '}' in multitable specification";
                                 $opened_braces = 0;
                            }
                        }
                        if ($opened_braces)
                        {
                            warn "$ERROR '{' not closed in multitable specification";
                            $table_width++;
                        }
                    }
                    $in_table = "$table_width:0";
                    unshift(@tables, join($;, $table_type, $in_table));
                    # APA: <table> implicitly ends paragraph, so let's
                    # do it explicitly to keep our HTML stack in sync.
                    if ($html_element eq 'p')
                    {
                        push (@lines, &debug("</p>\n", __LINE__));
                        &html_pop();
                    }
                    # don't use borders -- gets confused by empty cells
                    push(@lines, &debug("<table>\n", __LINE__));
                    &html_push_if('table');
                    push(@lines, &html_debug('', __LINE__));
                }
                # anorland@hem2.passagen.se
                # if (/^\s*\@(|f|v|multi)table\s+\@(\w+)|(\{[^\}]*\})/)
                elsif (/^\s*\@(|f|v)table\s+\@(\w+)/)
                {
                    $in_table = $2;
                    unshift(@tables, join($;, $table_type, $in_table));
                    # APA: <dl> implicitly ends paragraph, so let's
                    # do it explicitly to keep our HTML stack in sync.
                    if ($html_element eq 'p')
                    {
                        push (@lines, &debug("</p>\n", __LINE__));
                        &html_pop();
                    }
                    push(@lines, &debug("<dl compact=\"compact\">\n", __LINE__));
                    &html_push_if('dl');
                    
                    push(@lines, &html_debug('', __LINE__));
                }
                else
                {
                    warn "$ERROR Bad table line: $_";
                }
                next;
            }
            elsif ($tag eq 'synindex' || $tag eq 'syncodeindex')
            {
                if (/^\@$tag\s+(\w+)\s+(\w+)\s*$/)
                {
                    my $from = $1;
                    my $to = $2;
                    my $prefix_from = IndexName2Prefix($from);
                    my $prefix_to = IndexName2Prefix($to);

                    warn("$ERROR unknown from index name $from ind syn*index line: $_"), next
                        unless $prefix_from;
                    warn("$ERROR unknown to index name $to ind syn*index line: $_"), next
                        unless $prefix_to;

                    if ($tag eq 'syncodeindex')
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
                }
                next;
            }
            elsif ($tag eq 'defindex' || $tag eq 'defcodeindex')
            {
                if (/^\@$tag\s+(\w+)\s*$/)
                {
                    $name = $1;
                    $index_properties->{$name}->{name} = $name;
                    $index_properties->{$name}->{code} = 1 if $tag eq 'defcodeindex';
                }
                else
                {
                    warn "$ERROR Bad defindex line: $_";
                }
                next;
            }
            elsif (/^\@printindex/)
            {
                # APA: HTML generated for @printindex contains <table>
                # which implicitly ends paragraph, so let's do it
                # explicitly to keep our HTML stack in sync.
                if ($html_element eq 'p')
                {
                    push(@lines, &debug("</p>\n", __LINE__));
                    &html_pop();
                }
                push (@lines, "<!--::${section}::-->$_");
                next;
            }
            elsif ($tag eq 'sp')
            {
                push(@lines, &debug("<p></p>\n", __LINE__));
                next;
            }
            elsif ($tag eq 'center')
            {
                push(@lines, &debug("<div align=\"center\">\n", __LINE__));
                s/\@center//;
            }
            elsif ($tag eq 'lowersections')
            {
                my ($sec, $level);
                while (($sec, $level) = each %sec2level)
                {
                    $sec2level{$sec} = $level + 1;
                }
                next;
            }
            elsif ($tag eq 'raisesections')
            {
                my ($sec, $level);
                while (($sec, $level) = each %sec2level)
                {
                    $sec2level{$sec} = $level - 1;
                }
                next;
            }
            elsif ($tag eq 'macro' || $tag eq 'rmacro')
            {
                if (/^\@$tag\s*(\w+)\s*(.*)/)
                {
                    $name = $1;
                    my @args;
                    @args = split(/\s*,\s*/ , $1)
                        if ($2 =~ /^\s*{(.*)}\s*/);

                    $macros->{$name}->{Args} = \@args;
                    $macros->{$name}->{Body} = '';
                    while (($_ = &next_line) && $_ !~ /\@end $tag/)
                    {
                        $macros->{$name}->{Body} .= $_;
                    }
                    die "ERROR: No closing '\@end $tag' found for macro definition of '$name'\n"
                        unless (/\@end $tag/);
                    chomp $macros->{$name}->{Body};
                }
                else
                {
                    warn "$ERROR: Bad macro defintion $_"
                }
                next;
            }
            elsif ($tag eq 'unmacro')
            {
                delete $macros->{$1} if (/^\@unmacro\s*(\w+)/);
                next;
            }
            elsif ($tag eq 'documentlanguage')
            {
                SetDocumentLanguage($1) if (!$T2H_LANG && /documentlanguage\s*(\w+)/);
            }
            elsif (defined($def_map{$tag}))
            {
                if ($def_map{$tag})
                {
                    # substitute shortcuts for definition commands
                    s/^\@$tag\s+//;
                    $tag = $def_map{$tag};
                    $_ = "\@$tag $_";
                    $tag =~ s/\s.*//;
                }
            }
            elsif (defined($user_sub{$tag}))
            {
                s/^\@$tag\s+//;
                $sub = $user_sub{$tag};
                print "# user $tag = $sub, arg: $_" if $T2H_DEBUG & $DEBUG_USER;
                if (defined(&$sub))
                {
                    chop($_);
                    &$sub($_);
                }
                else
                {
                    warn "$ERROR Bad user sub for $tag: $sub\n";
                }
                next;
            }
            if (defined($def_map{$tag}))
            {
                # process definition commands
                s/^\@$tag\s+//;
                if ($tag =~ /x$/)
                {
                    # extra definition line
                    $tag = $`;
                    $is_extra = 1;
                }
                else
                {
                    $is_extra = 0;
                }
                while (/\{([^\{\}]*)\}/)
                {
                    # this is a {} construct
                    my ($before, $contents, $after) = ($`, $1, $');
                    # protect spaces
                    $contents =~ s/\s+/$;9/g;
                    # restore $_ protecting {}
                    $_ = "$before$;7$contents$;8$after";
                }
                @args = split(/\s+/, &protect_html($_));
                foreach (@args)
                {
                    s/$;9/ /g;  # unprotect spaces
                    s/$;7/\{/g; # ... {
                    s/$;8/\}/g; # ... }
                }
                $type = shift(@args);
                $type =~ s/^\{(.*)\}$/$1/;
                print "# def ($tag): {$type} ", join(', ', @args), "\n"
                    if $T2H_DEBUG & $DEBUG_DEF;
                $type .= ':' if (!$T2H_DEF_TABLE); # it's nicer like this
                $name = shift(@args);
                $name =~ s/^\{(.*)\}$/$1/;
                if ($is_extra)
                {
                    $_ = &debug($T2H_DEF_TABLE ? '' : '<dt>', __LINE__);
                    #$_ = &debug("<tr TEST1>\n", __LINE__) if ($T2H_DEF_TABLE);
                }
                else
                {
                    # APA: <dl> implicitly ends paragraph, so let's
                    # do it explicitly to keep our HTML stack in sync.
                    if ($html_element eq 'p')
                    {
                        $_ = &debug("</p>\n", __LINE__);
                        &html_pop();
                    }
                    else
                    {
                        $_ = '';
                    }
                    $_ .= &debug($T2H_DEF_TABLE ?
                                 "<table width=\"100%\">\n" : "<dl>\n<dt>",
                                 __LINE__);
                }
                if ($tag eq 'deffn' || $tag eq 'defvr' || $tag eq 'deftp')
                {
                    if ($T2H_DEF_TABLE)
                    {
                        $_ .= "<tr>\n<td align=\"left\"><b>$name</b>\n";
                        $_ .= " <i>@args</i>" if @args;
                        $_ .= "</td>\n";
                        $_ .= "<td align=\"right\">";
                        $_ .= "$type</td>\n</tr>\n";
                    }
                    else
                    {
                        $_ .= "<u>$type</u> <b>$name</b>";
                        $_ .= " <i>@args</i>" if @args;
                    }
                }
                elsif ($tag eq 'deftypefn' || $tag eq 'deftypevr'
                       || $tag eq 'deftypeop' || $tag eq 'defcv'
                       || $tag eq 'defop')
                {
                    $ftype = $name;
                    $name = shift(@args);
                    $name =~ s/^\{(.*)\}$/$1/;
                    if ($T2H_DEF_TABLE)
                    {
                        $_ .= "<tr>\n<td align=\"left\"><b>$name</b>";
                        $_ .= " <i>@args</i>" if @args;
                        $_ .= "</td>\n";
                        $_ .= "<td align=\"right\">";
                        $_ .= "$type of $ftype</td>\n</tr>\n";
                    }
                    else
                    {
                        $_ .= "<u>$type</u> $ftype <b>$name</b>";
                        $_ .= " <i>@args</i>" if @args;
                    }
                }
                else
                {
                    warn "$ERROR Unknown definition type: $tag\n";
                    $_ .= "<u>$type</u> <b>$name</b>";
                    $_ .= " <i>@args</i>" if @args;
                }
                $_ .= &debug("\n<dd>", __LINE__) if (!$T2H_DEF_TABLE);
                ########$_ .= &debug("\n</table TEST3>\n<table width=\"95%\">\n", __LINE__) if ($T2H_DEF_TABLE);
                $name = &unprotect_html($name);
                if ($tag eq 'deffn' || $tag eq 'deftypefn')
                {
                    EnterIndexEntry('f', $name, $docu_doc, $section, \@lines, $in_pre);
                    #		unshift(@input_spool, "\@findex $name\n");
                }
                elsif ($tag eq 'defop')
                {
                    EnterIndexEntry('f', "$name on $ftype", $docu_doc, $section, \@lines, $in_pre);
                    #		unshift(@input_spool, "\@findex $name on $ftype\n");
                }
                elsif ($tag eq 'defvr' || $tag eq 'deftypevr' || $tag eq 'defcv')
                {
                    EnterIndexEntry('v', $name, $docu_doc, $section, \@lines, $in_pre);
                    #		unshift(@input_spool, "\@vindex $name\n");
                }
                else
                {
                    EnterIndexEntry('t', $name, $docu_doc, $section, \@lines, $in_pre);
                    #		unshift(@input_spool, "\@tindex $name\n");
                }
                $dont_html = 1;
            }
        }
        elsif ($end_tag)
        {
            if ($format_map{$end_tag})
            {
                $in_pre = 0 if $format_map{$end_tag} eq 'pre';
                $in_list-- if $format_map{$end_tag} eq 'ul' || $format_map{$end_tag} eq 'ol' ;
                &html_pop_if('p');
                &html_pop_if('li');
                &html_pop_if();
                push(@lines, &debug("</$format_map{$end_tag}>\n", __LINE__));
                push(@lines, &html_debug('', __LINE__));
            }
            elsif (exists $complex_format_map->{$end_tag})
            {
                my $end = eval $complex_format_map->{$end_tag}->[1];
                if ($@)
                {
                    print "$ERROR: eval of complex_format_map->{$end_tag}->[1] $complex_format_map->{$end_tag}->[0]: $@";
                    $end = '</pre>'
                }
                $in_pre = 0 if $end =~ m|</pre>|;
                push(@lines, html_debug($end, __LINE__));
            }
            elsif ($end_tag =~ /^(|f|v|multi)table$/)
            {
                unless (@tables)
                {
                    warn "$ERROR \@end $end_tag without \@*table\n";
                    next;
                }
                &html_pop_if('p');
                ($table_type, $in_table) = split($;, shift(@tables));
                unless ($1 eq $table_type)
                {
                    warn "$ERROR \@end $end_tag without matching \@$end_tag\n";
                    next;
                }
                if ($table_type eq "multi")
                {
                    my ($max_column, $current_column);
                    ($max_column, $current_column) = split /:/, $in_table;
                    if (!$max_column || !$current_column)
                    { # empty table
                        push(@lines, "</table>\n");
                    }
                    else
                    { 
                        push(@lines, "</td></tr></table>\n");
                    }
                    
#                    &html_pop_if('tr');
                }
                else
                {
                    # APA: </dl> implicitly ends paragraph, so let's
                    # do it explicitly to keep our HTML stack in sync.
                    if ($html_element eq 'p')
                    {
                        push(@lines, &debug("</p>\n", __LINE__));
                        &html_pop();
                    }
                    push(@lines, "</dl>\n");
                    &html_pop_if('dd');
                }
                &html_pop_if();
                if (@tables)
                {
                    ($table_type, $in_table) = split($;, $tables[0]);
                }
                else
                {
                    $in_table = 0;
                }
            }
            elsif (defined($def_map{$end_tag}))
            {
                # APA: </dl> and </table> implicitly ends paragraph,
                # so let's do it explicitly to keep our HTML stack in
                # sync.
                if ($html_element eq 'p')
                {
                    push(@lines, &debug("</p>\n", __LINE__));
                    &html_pop();
                }
                push(@lines, &debug($T2H_DEF_TABLE ?
                                    "</table>\n" : "</dl>\n", __LINE__));
            }
            elsif ($end_tag eq 'menu')
            {
                &html_pop_if();
                push(@lines, $_); # must keep it for pass 2
            }
            next;
        }
        #############################################################
        # anchor insertion
        while (/\@anchor\s*\{(.*?)\}/)
        {
            $_ = $`.$';
            my $anchor = $1;
            $anchor = &normalise_node($anchor);
            if (grep {$anchor eq $_} @nodes_and_anchors)
            {
                warn "$ERROR Duplicate node found: $anchor\n"
            }
            else
            {
                push @nodes_and_anchors, $anchor;
            }
            push @lines, &html_debug("<a name=\""."ANC_".$anchor."\"></a>\n", __LINE__);
            $node2href{$anchor} = "$docu_doc#ANC_$anchor";
            next INPUT_LINE if $_ =~ /^\s*$/;
        }
        #############################################################
        # index entry generation, after value substitutions
        if (/^\@(\w+?)index\s+/)
        {
            EnterIndexEntry($1, $', $docu_doc, $section, \@lines, $in_pre);
            next;
        }
        #
        # protect texi and HTML things
        $_ = &protect_texi($_);
        $_ = &protect_html($_) unless $dont_html;
        $dont_html = 0;
        # substitution (unsupported things)
        s/^\@exdent\s+//go;
        s/\@noindent\s+//go;
        s/\@refill\s+//go;
        # other substitutions
        &simple_substitutions;
        s/\@footnote\{/\@footnote$docu_doc\{/g; # mark footnotes, cf. pass 4

        # handle multitables. Transform @tab and @item into html, and
        # ignore if out of bounds.
        if ($in_table && $table_type eq 'multi' && !$end_tag)
        {
            my ($max_column, $current_column);
            ($max_column, $current_column) = split /:/, $in_table;

            next INPUT_LINE if (!$max_column);
            my $stored_text = "";

            while (! /^$/)
            {
                # discard until end of column if out of bounds 
                if ($current_column > $max_column)
                {
                    last unless (s/.*?(\@itemx?\s+)/$1/ or s/.*?(\@itemx?)$/$1/);
                    $current_column = $max_column;
                    next;
                }
                if (/(\@tab\s+|\@itemx?\s+)/ or /(\@tab|\@itemx?)$/)
                {
                    $stored_text = $stored_text . $`;
                    $_ = $';
                    if ($1 =~ /^\@tab/)
                    {
                        $current_column++;
                        if ($current_column == 1)
                        { #first text on first line, first @item was omitted
                             $stored_text = $stored_text . '<tr><td>';
                             $current_column++;
                        }
                        $stored_text = $stored_text . '</td>';

                        if ($current_column > $max_column)
                        {
                            warn "$ERROR too much \@tab";
                        }
                        else
                        {
                            $stored_text = $stored_text . '<td>';
                        }
                    }
                    else # an @item(x) on the line
                    {
                        if ($current_column)
                        {
                             $stored_text = $stored_text . '</td></tr><tr><td>';
                        }
                        else
                        { #first line
                             $stored_text = $stored_text . '<tr><td>';
                        }
                        $current_column = 1;
                    }
                }
                else # no @tab nor @itemx
                {
                    if (!$current_column)
                    { #first line
                        $stored_text = $stored_text . '<tr><td>';
                        $current_column = 1;
                    }
                    $stored_text = $stored_text . $_;
                    $_ = '';
                }
            }
            $_ = $stored_text;
            $in_table = "$max_column:$current_column";
        }
        #
        # analyze the tag again
        #
        if ($tag)
        {
            if (defined($sec2level{$tag}) && $sec2level{$tag} > 0)
            {
                if (/^\@$tag\s+(.+)$/)
                {
                    $name = $1;
                    $name = &normalise_space_style($name);
                    $level = $sec2level{$tag};
                    # check for index
                    $first_index_chapter = $name
                        if ($level == 1 && !$first_index_chapter &&
                            $name =~ /index/i);
                    if ($in_top && /heading/)
                    {
                        $T2H_HAS_TOP_HEADING = 1;
                        $_ = &debug("<h$level>$name</h$level>\n", __LINE__);
                        &html_push_if('body');
                        print "# top heading, section $name, level $level\n"
                            if $T2H_DEBUG & $DEBUG_TOC;
                    }
                    else
                    {
                        unless (/^\@\w*heading/)
                        {
                            unless (/^\@unnumbered/)
                            {
                                my $number = &update_sec_num($tag, $level);
                                $name = $number . ' ' . $name if $T2H_NUMBER_SECTIONS;
                                $sec2number{$name} = $number;
                                $number2sec{$number} = $name;
                            }
                            if (defined($toplevel))
                            {
                                push @lines, ($level==$toplevel ? $CHAPTEREND : $SECTIONEND);
                            }
                            else
                            {
                                # first time we see a "section"
                                unless ($level == 1)
                                {
                                    warn "$WARN The first section found is not of level 1: $_";
                                }
                                $toplevel = $level;
                            }
                            push(@sections, $name);
                            next_doc() if (defined $T2H_SPLIT
                                           and
                                           ($T2H_SPLIT eq 'section'
                                            ||
                                            $T2H_SPLIT && $level == $toplevel));
                        }
                        $sec_num++;
                        $docid = "SEC$sec_num";
                        $tocid = (/^\@\w*heading/ ? undef : "TOC$sec_num");
                        # check biblio and glossary
                        $in_bibliography = ($name =~ /^([A-Z]|\d+)?(\.\d+)*\s*bibliography$/i);
                        $in_glossary = ($name =~ /^([A-Z]|\d+)?(\.\d+)*\s*glossary$/i);
                        # check node
                        unless ($node)
                        {
                            $name .= ' ' while ($node2sec{$name});
                            $node = $name;
                        }
                        $name .= ' ' while ($sec2node{$name});
                        $section = $name;
                        $node2sec{$node} = $name;
                        $sec2node{$name} = $node;
			$sec2seccount{$name} = $sec_num;
			$seccount2sec{$sec_num} = $name;
                        $node2href{$node} = "$docu_doc#$docid";
                        $node2next{$node} = $node_next;
                        $node2prev{$node} = $node_prev;
                        $node2up{$node} = $node_up;
                        print "# node $node, section $name, level $level\n"
                            if $T2H_DEBUG & $DEBUG_TOC;

                        $node = '';
                        $node_next = '';
                        $node_prev = '';
                        $node_next = '';
                        if ($tocid)
                        {
                            my $ul_style = $T2H_NUMBER_SECTIONS ?
                                ' style="list-style: none"' : '';
                            my $ind = '  ' x $curlevel;
                            # update TOC
                            if ($level > $curlevel) {
                                while ($level > $curlevel)
                                {
                                    $curlevel++;
                                    my $ln = "\n$ind<ul${ul_style}>\n";
                                    $ind = '  ' x $curlevel;
                                    push(@toc_lines, $ln);
                                }
                            }
                            elsif ($level < $curlevel)
                            {
                                while ($level < $curlevel)
                                {
                                    $curlevel--;
                                    $ind = '  ' x $curlevel;
                                    push(@toc_lines,
                                         "</li>\n$ind</ul>\n");
                                }
                            }
                            else
                            {
                                push(@toc_lines, "</li>\n");
                            }
                            $_ = &t2h_anchor($tocid, "$docu_doc#$docid",$name);
                            $_ = &substitute_style($_);
                            push(@stoc_lines,
                                 "  <li>$_</li>\n") if ($level == 1);
                            push(@toc_lines, "$ind<li>$_");
                        }
                        else
                        {
                            push(@lines, &html_debug("<a name=\"".protect_html($docid)."\"></a>\n",
                                                     __LINE__));
                        }
                        # update DOC
                        push(@lines, &html_debug('', __LINE__));
                        &html_reset;
                        $_ =  "<h$level> $name </h$level>\n<!--docid::${docid}::-->\n";
                        $_ = &debug($_, __LINE__);
                        push(@lines, &html_debug('', __LINE__));
                    }
                    # update DOC
                    foreach my $line (split(/\n+/, $_))
                    {
                        push(@lines, "$line\n");
                    }
                    next;
                }
                else
                {
                    warn "$ERROR Bad section line: $_";
                }
            }
            else
            {
                # track variables
                $value{$1} = Unprotect_texi($2), next if /^\@set\s+($VARRE)\s+(.*)$/o;
                delete $value{$1}, next if /^\@clear\s+($VARRE)\s*$/o;
                # store things
                $value{'_shorttitle'} = Unprotect_texi($1), next if /^\@shorttitle\s+(.*)$/;
                $value{'_setfilename'}   = Unprotect_texi($1), next if /^\@setfilename\s+(.*)$/;
                $value{'_settitle'}      = Unprotect_texi($1), next if /^\@settitle\s+(.*)$/;
                $value{'_author'}   .= Unprotect_texi($1)."\n", next if /^\@author\s+(.*)$/;
                $value{'_subtitle'} .= Unprotect_texi($1)."\n", next if /^\@subtitle\s+(.*)$/;
                $value{'_title'}    .= Unprotect_texi($1)."\n", next if /^\@title\s+(.*)$/;

                # list item
                if (/^\s*\@itemx?\s+/)
                {
                    $what = $';
                    $what =~ s/\s+$//;
                    if ($in_bibliography && $use_bibliography)
                    {
                        if ($what =~ /^$BIBRE$/o)
                        {
                            $id = 'BIB' . ++$bib_num;
                            $bib2href{$what} = "$docu_doc#$id";
                            print "# found bibliography for '$what' id $id\n"
                                if $T2H_DEBUG & $DEBUG_BIB;
                            $what = &t2h_anchor($id, '', $what);
                        }
                    }
                    elsif ($in_glossary && $T2H_USE_GLOSSARY)
                    {
                        $id = 'GLOSS' . ++$gloss_num;
                        $entry = $what;
                        $entry =~ tr/A-Z/a-z/ unless $entry =~ /^[A-Z\s]+$/;
                        $gloss2href{$entry} = "$docu_doc#$id";
                        print "# found glossary for '$entry' id $id\n"
                            if $T2H_DEBUG & $DEBUG_GLOSS;
                        $what = &t2h_anchor($id, '', $what);
                    }
                    elsif ($in_table && ($table_type eq 'f' || $table_type eq 'v'))
                    {
                        # APA: Insert <dt> before index anchor, if
                        # necessary to produce valid HTML.  Close open
                        # paragraph first.
                        if ($html_element ne 'dt')
                        {
                            # APA: End paragraph, if any.
                            if ($html_element eq 'p')
                            {
                                push(@lines, &debug("</p>\n", __LINE__));
                                &html_pop();
                            }
                            push(@lines, &debug("<dt>", __LINE__));
                            &html_push('dt');
                        }
                        EnterIndexEntry($table_type, $what, $docu_doc, $section, \@lines, $in_pre);
                    }
                    # APA: End paragraph, if any.
                    if ($html_element eq 'p')
                    {
                        push(@lines, &debug("</p>\n", __LINE__));
                        &html_pop();
                    }
                    if ($html_element =~ m|^d[dlt]$|)
                    {
                        unless ($html_element eq 'dt')
                        {
                            push(@lines, &debug("<dt>", __LINE__));
                        }
                        if ($things_map{$in_table} && !$what)
                        {
                            # special case to allow @table @bullet for instance
                            push(@lines, &debug("$things_map{$in_table}\n", __LINE__));
                        }
                        else
                        {
                            push(@lines, &debug("\@$in_table\{$what\}\n", __LINE__));
                        }
                        push(@lines, "<dd>");
                        &html_push('dd') unless $html_element eq 'dd';
                        if ($table_type)
                        {       # add also an index
                            unshift(@input_spool, "\@${table_type}index $what\n");
                        }
                    }
                    elsif ($html_element eq 'table')
                    {
                        push(@lines, &debug("<tr><td>$what</td>\n", __LINE__));
                        &html_push('tr');
                    }
                    elsif ($html_element eq 'tr')
                    {
                        push(@lines, &debug("</tr>\n", __LINE__));
                        push(@lines, &debug("<tr><td>$what</td>\n", __LINE__));
                    }
                    else
                    {
                        push(@lines, &debug("<li>$what\n", __LINE__));
                        &html_push('li') unless $html_element eq 'li';
                    }
                    push(@lines, &html_debug('', __LINE__));
                    next;
                }
                elsif (/^\@tab\s+(.*)$/)
                {
                    push(@lines, "<td>$1</td>\n");
                    next;
                }
            }
        }
        # paragraph separator
        if ($_ eq "\n" && ! $in_pre)
        {
            next if $#lines >= 0 && $lines[$#lines] eq "\n";
            if ($html_element eq 'p')
            {
                push (@lines, &debug("</p>\n<p>\n", __LINE__));
            }
            # 	else
            # 	{
            # 	  push(@lines, "<p></p>\n");
            # 	  $_ = &debug("<p></p>\n", __LINE__);
            # 	}
            elsif ($html_element eq 'body' || $html_element eq 'blockquote' || $html_element eq 'dd' || $html_element eq 'li')
            {
                &html_push('p');
                push(@lines, &debug("<p>\n", __LINE__));
            }
        }
        # otherwise
        push(@lines, $_) unless $in_titlepage;
        push(@lines, &debug("</div>\n", __LINE__))  if ($tag eq 'center');
    }
    # finish TOC
    $level = 0;
    while ($level < $curlevel)
    {
        $curlevel--;
        push(@toc_lines, "</li></ul>\n");
    }
    print "# end of pass 1\n" if $T2H_VERBOSE;
}

#+++############################################################################
#                                                                              #
# Stuff related to Index generation                                            #
#                                                                              #
#---############################################################################

sub EnterIndexEntry
{
    my $prefix = shift;
    my $key = shift;
    my $docu_doc = shift;
    my $section = shift;
    my $lines = shift;
    my $in_pre = shift;
    local $_;

    warn "$ERROR Undefined index command: $_", next
        unless (exists ($index_properties->{$prefix}));
    $key =~ s/\s+$//;
    $_ = $key;
    $_ = &protect_texi($_);
    $key = $_;
    $_ = &protect_html($_);
    my $html_key = substitute_style($_);
    my $id;
    $key = remove_style($key);
    $key = remove_things($key);
    $_ = $key;
    $_ = &unprotect_texi($_);
    $key = $_;
    while (exists $index->{$prefix}->{$key})
    {
        $key .= ' ';
    }
    ;
    if ($lines->[$#lines] =~ /^<!--docid::(.+)::-->$/)
    {
        $id = $1;
    }
    else
    {
        $id = 'IDX' . ++$idx_num;
        push(@$lines, &t2h_anchor($id, '', $T2H_INVISIBLE_MARK, !$in_pre));
    }
    $index->{$prefix}->{$key}->{html_key} = $html_key;
    $index->{$prefix}->{$key}->{section} = $section;
    $index->{$prefix}->{$key}->{href} = "$docu_doc#$id";
    print "# found ${prefix}index  for '$key' with id $id\n"
        if $T2H_DEBUG & $DEBUG_INDEX;
}

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

sub GetIndexEntries
{
    my $normal = shift;
    my $code = shift;
    my ($entries, $prefix, $key) = ({});
    for $prefix (keys %$normal)
    {
        for $key (keys %{$index->{$prefix}})
        {
            $entries->{$key} = {%{$index->{$prefix}->{$key}}};
        }
    }

    if (defined($code))
    {
        for $prefix (keys %$code)
        {
            unless (exists $normal->{$prefix})
            {
                for $key (keys %{$index->{$prefix}})
                {
                    $entries->{$key} = {%{$index->{$prefix}->{$key}}};
                    $entries->{$key}->{html_key} = "<code>$entries->{$key}->{html_key}</code>";
                }
            }
        }
    }
    return $entries;
}

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

sub GetIndexPages
{
    my $entries = shift;
    my (@Letters, $key);
    my ($EntriesByLetter, $Pages, $page) = ({}, [], {});
    my @keys = sort byAlpha keys %$entries;

    for $key (@keys)
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
        my ($prev_letter, $letter);
        for $letter (@Letters)
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

sub GetIndexSummary
{
    my $first_page = shift;
    my $Pages = shift;
    my $name = shift;
    my ($page, $letter, $summary, $l1, $l2, $l);

    $summary = '<table><tr><th valign="top">Jump to: &nbsp; </th><td>';
    for $page ($first_page, @$Pages)
    {
        for $letter (@{$page->{Letters}})
        {
            $l = t2h_anchor('', "$page->{href}#${name}_$letter",
                            "<b>$letter</b>",
                            0, 'style="text-decoration: none"')
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
    $summary .= $l2 . '</td></tr></table>';
    return $summary;
}

sub PrintIndexPage
{
    my $lines = shift;
    my $summary = shift;
    my $page = shift;
    my $name = shift;

    push @$lines, $summary;

    push @$lines , <<EOT;
<p></p>
<table border="0">
<tr><td></td><th align="left">Index Entry</th><th align="left"> Section</th></tr>
<tr><td colspan="3"> <hr></td></tr>
EOT

    for $letter (@{$page->{Letters}})
    {
        push @$lines, '<tr><th>' .
            &t2h_anchor("${name}_$letter", '', protect_html($letter)) .
                "</th><td></td><td></td></tr>\n";
        for $entry (@{$page->{EntriesByLetter}->{$letter}})
        {
            push @$lines,
                "<tr><td></td><td valign=\"top\">" .
                    t2h_anchor('', $entry->{href}, $entry->{html_key}) .
                        "</td><td valign=\"top\">" .
                            t2h_anchor('', sec_href($entry->{section}), clean_name($entry->{section})) .
                                "</td></tr>\n";
        }
        push @$lines, "<tr><td colspan=\"3\"> <hr></td></tr>\n";
    }
    push @$lines, "</table><p></p>";
    push @$lines, $summary;
}

sub PrintIndex
{
    my $lines = shift;
    my $name = shift;
    my $section = shift;
    $section = 'Top' unless $section;
    my $prefix = IndexName2Prefix($name);

    warn ("$ERROR printindex: bad index name: $name"), return
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

    if ($T2H_IDX_SUMMARY)
    {
        my $key;
        open(FHIDX, ">$docu_rdir$docu_name" . "_$name.idx")
            || die "Can't open > $docu_rdir$docu_name" . "_$name.idx for writing: $!\n";
        print "# writing $name index summary in $docu_rdir$docu_name" . "_$name.idx...\n" if $T2H_VERBOSE;

        for $key (sort keys %$Entries)
        {
            print FHIDX "$key\t$Entries->{$key}->{href}\n";
        }
    }

    my $Pages = GetIndexPages($Entries);
    my $page;
    my $first_page = shift @$Pages;
    my $sec_name = $section;
    $sec2index{$section} = 1;

    # remove section number
    $sec_name =~ s/.*? // if $sec_name =~ /^([A-Z]|\d+)\./;

    ($first_page->{href} = sec_href($section)) =~ s/\#.*$//;
    # FIXME $node2sec{$section} might be undef, in that case Sec2PrevNode 
    # returns Top. The resulting html is perfectly right nevertheless.
    # Is it normal that it is undef ? Is Top the right thing ?
    # Why does it work in that case and produce the right output ?
    $node2prev{$section} = Sec2PrevNode($node2sec{$section});
    $prev_node = $section;
    # Update tree structure of document
    if (@$Pages)
    {
        my $sec;
        my @after;

        while (@sections && $sections[$#sections] ne $section)
        {
            unshift @after, pop @sections;
        }

        for $page (@$Pages)
        {
            my $node = ($page->{First} ne $page->{Last} ?
                        "$sec_name: $page->{First} -- $page->{Last}" :
                        "$sec_name: $page->{First}");
            push @sections, $node;
            $node2sec{$node} = $node;
            $sec2node{$node} = $node;
            $sec2index{$node} = 1;
            $node2up{$node} = $section;
            $page->{href} = next_doc();
            $page->{name} = $node;
            $node2href{$node} = $page->{href};
            if ($prev_node)
            {
                $node2next{$prev_node} = $node;
                $node2prev{$node} = $prev_node;
            }
            $prev_node = $node;
        }
	# Full circle - Next on last index page goes to Top
	$node2next{$prev_node} = "Top";
        push @sections, @after;
    }

    my $summary = GetIndexSummary($first_page, $Pages, $name);
    PrintIndexPage($lines, $summary, $first_page, $name);
    for $page (@$Pages)
    {
        push @$lines, ($T2H_SPLIT eq 'chapter' ? $CHAPTEREND : $SECTIONEND);
        push @$lines, "<h2 align=\"left\">$page->{name}</h2>\n";
        PrintIndexPage($lines, $summary, $page, $name);
    }
}


#+++############################################################################
#                                                                              #
# Pass 2/3: handle style, menu, index, cross-reference                         #
#                                                                              #
#---############################################################################
my @lines2 = ();               # whole document (2nd pass)
my @lines3 = ();               # whole document (3rd pass)

sub pass2
{
    my $sec;
    my $href;
    my $in_menu = 0;            # am I inside a menu
    my $in_menu_listing;

    while (@lines)
    {
        $_ = shift(@lines);
        #
        # special case (protected sections)
        #
        if (/^$PROTECTTAG/o)
        {
            push(@lines2, $_);
            next;
        }
        #
        # menu
        #
        if (/^\@menu\b/)
        {
            $in_menu = 1;
            $in_menu_listing = 1;
            # APA: <table> implicitly ends paragraph, so let's do it
            # explicitly to keep our HTML stack in sync.
            if ($html_element eq 'p')
            {
                push (@lines2, &debug("</p>\n", __LINE__));
                &html_pop();
            }
            push(@lines2, &debug("<table border=\"0\" cellspacing=\"0\">\n", __LINE__));
            next;
        }
        if (/^\@end\s+menu\b/)
        {
            if ($in_menu_listing)
            {
                push(@lines2, &debug("</table>\n", __LINE__));
            }
            $in_menu = 0;
            $in_menu_listing = 0;
            next;
        }
        if ($in_menu)
        {
            my ($node, $name, $descr);
            if (/^\*\s+($NODERE)::/o)
            {
                $node = $1;
                $descr = $';
            }
            elsif (/^\*\s+(.+):\s+([^\t,\.\n]+)[\t,\.\n]/)
            {
                $name = $1;
                $node = $2;
                $descr = $';
            }
                #pertusus: makeinfo doesn't complain here
            #elsif (/^\*/)
            #{
                #warn "$ERROR Bad menu line: $_";
            #}
            else
            {
                if ($in_menu_listing)
                {
                    # APA: Handle menu comment lines. These don't end the menu!
                    # $in_menu_listing = 0;
                    push(@lines2,&debug('<tr><th colspan="3" align="left" valign="top">' . $_ . '</th></tr>
', __LINE__));
                }
            }
            if ($node)
            {
                if (! $in_menu_listing)
                {
                    $in_menu_listing = 1;
                    push(@lines2, &debug("<table border=\"0\" cellspacing=\"0\">\n", __LINE__));
                }
                # look for continuation
                while ($lines[0] =~ /^\s+.*$/)
                {
                    $descr .= shift(@lines);
                }
                &menu_entry($node, $name, $descr);
            }
            next;
        }
        #
        # printindex
        #
        PrintIndex(\@lines2, $2, $1), next
            if (/^<!--::(.*)::-->\@printindex\s+(\w+)/);
        #
        # simple style substitutions
        #
        $_ = &substitute_style($_);
        #
        # xref
        #
        while (/\@(x|px|info|)ref{([^{}]+)(}?)/)
        {
            # note: Texinfo may accept other characters
            ($type, $nodes, $full) = ($1, $2, $3);
            ($before, $after) = ($`, $');
            if (! $full && $after)
            {
                warn "$ERROR Bad xref (no ending } on line): $_";
                $_ = "$before$;0${type}ref\{$nodes$after";
                next;           # while xref
            }
            if ($type eq 'x')
            {
                $type = "$T2H_WORDS->{$T2H_LANG}->{'See'} ";
            }
            elsif ($type eq 'px')
            {
                $type = "$T2H_WORDS->{$T2H_LANG}->{'see'} ";
            }
            elsif ($type eq 'info')
            {
                $type = "$T2H_WORDS->{$T2H_LANG}->{'See'} Info";
            }
            else
            {
                $type = '';
            }
            unless ($full)
            {
                $next = shift(@lines);
                $next = &substitute_style($next);
                chop($nodes);   # remove final newline
                if ($next =~ /\}/)
                {               # split on 2 lines
                    $nodes .= " $`";
                    $after = $';
                }
                else
                {
                    $nodes .= " $next";
                    $next = shift(@lines);
                    $next = &substitute_style($next);
                    chop($nodes);
                    if ($next =~ /\}/)
                    {           # split on 3 lines
                        $nodes .= " $`";
                        $after = $';
                    }
                    else
                    {
                        warn "$ERROR Bad xref (no ending }): $_";
                        $_ = "$before$;0xref\{$nodes$after";
                        unshift(@lines, $next);
                        next;   # while xref
                    }
                }
            }
            $nodes =~ s/\s+/ /go; # remove useless spaces
            @args = split(/\s*,\s*/, $nodes);
            $node = $args[0];   # the node is always the first arg
            $node = &normalise_space_style($node);
            if ($node =~ s/^\(([^\s\(\)]+)\)\s*//)
            {
                $args[3] = $1 unless ($args[3]);
                $args[0] = $node;
            }
            $sec = $args[2] || $args[1] || $node2sec{$node};
            $href = $node2href{$node};
            if (@args == 5)
            {                   # reference to another manual
                $sec = $args[2] || $node;
                $man = $args[4] || $args[3];
                $_ = "${before}${type}$T2H_WORDS->{$T2H_LANG}->{'section'} `$sec' in \@cite{$man}$after";
            }
            elsif ($type =~ /Info/)
            {                   # inforef 
                warn "$ERROR Wrong number of arguments: $_" unless @args == 3;
                ($nn, $_, $in) = @args;
                $_ = "${before}${type} file `$in', node `$nn'$after";
            }
            elsif (@args == 4)
            {        # ref to info file        
                my $dummy;
                ($nn, $dummy, $dummy, $in) = @args;
                if ($nn)
                {
                    $_ = "${before}${type}Info `$in', node `$nn'$after";
                }
                else 
                {
                    $_ = "${before}${type}${in}$after";
                }
            }
            
            elsif ($sec && $href && ! $T2H_SHORT_REF)
            {
                $_  = "${before}${type}";
                $_ .= "$T2H_WORDS->{$T2H_LANG}->{'section'} " if $type;
                $_ .= &t2h_anchor('', $href, $sec, 0, '', 1) . $after;
            }
            elsif ($href)
            {
                $_ = "${before}${type} " .
                    &t2h_anchor('', $href, $args[2] || $args[1] || $node, 0, '', 1) .
                        $after;
            }
            else
            {
                warn "$ERROR Undefined node ($node): $_";
                $_ = "$before$;0xref{$nodes}$after";
            }
        }

        # replace images
        s[\@image\s*{(.+?)}]
        {
         my @args = split (/\s*,\s*/, $1);
         my $base = $args[0];
         my $image =
         LocateIncludeFile("$base.png") ||
         LocateIncludeFile("$base.jpg") ||
         LocateIncludeFile("$base.gif");
         warn "$ERROR no image file for $base: $_" unless ($image && -e $image);
         ($T2H_CENTER_IMAGE ?
          "<div align=\"center\"><img src=\"$image\" alt=\"$base\"></div>" :
          "<img src=\"$image\" alt=\"$base\">");
        }eg;

        #
        # try to guess bibliography references or glossary terms
        #
        unless (/^<h\d><a name=\"SEC\d/)
        {
            if ($use_bibliography)
            {
                $done = '';
                while (/$BIBRE/o)
                {
                    ($pre, $what, $post) = ($`, $&, $');
                    $href = $bib2href{$what};
                    if (defined($href) && $post !~ /^[^<]*<\/a>/)
                    {
                        $done .= $pre . &t2h_anchor('', $href, $what);
                    }
                    else
                    {
                        $done .= "$pre$what";
                    }
                    $_ = $post;
                }
                $_ = $done . $_;
            }
            if ($T2H_USE_GLOSSARY)
            {
                $done = '';
                while (/\b\w+\b/)
                {
                    ($pre, $what, $post) = ($`, $&, $');
                    $entry = $what;
                    $entry =~ tr/A-Z/a-z/ unless $entry =~ /^[A-Z\s]+$/;
                    $href = $gloss2href{$entry};
                    if (defined($href) && $post !~ /^[^<]*<\/a>/)
                    {
                        $done .= $pre . &t2h_anchor('', $href, $what);
                    }
                    else
                    {
                        $done .= "$pre$what";
                    }
                    $_ = $post;
                }
                $_ = $done . $_;
            }
        }
        # otherwise
        push(@lines2, $_);
    }
    print "# end of pass 2\n" if $T2H_VERBOSE;
}

sub pass3
{
    #
    # split style substitutions
    #
    my @style_stack=();
    my $in_index = 0;
    my $text = '';

    while (@lines2)
    {
        $_ = shift(@lines2);

        if (/<!--docid::SEC(\d+)::-->/)
        {
            if ($sec2index{$seccount2sec{$1}})
            {
                $in_index = 1;
            }
            else 
            {
                $in_index = 0;
            }
        }

        #
        # special case (protected sections)
        #
        if (/^$PROTECTTAG/o || $in_index)
        {
            push(@lines3, $_);
            next;
        }
        #
        # split style substitutions
        #

        while (1)
        {
            if (s/^([^\{\}]*)\{//)
            {
                my $before_brace = $1;
                $before_brace = '' unless (defined($before_brace));
                my $before = '';
                my $style = '';
                if ($before_brace =~ /^([^\{\}]*)@(footnote[^\s]*?|\w+|,)$/)
                {
                    $before = $1;
                    $before = '' unless (defined($before));
                    $style = $2;
                }
                else
                {
                    $before = $before_brace . '{';
                    warn "$ERROR '{' without macro near $before_brace";
                    $before .= '<!-- brace without macro --!>';
                }
                if (@style_stack)
                {
                    $style_stack[-1]->{'text'} .= $before;
                }
                else
                {
                    $text .= $before;
                }
                push (@style_stack, { 'style' => $style, 'text' => '' });
            }
            elsif (s/^([^\{\}]*)\}//)
            {
                my $before = $1;
                $before = '' unless (defined($before));
                if (@style_stack)
                {
                    my $style = pop @style_stack;
                    my $result;
                    if ($style->{'style'})
                    {
                        $result = &apply_style($style->{'style'}, $style->{'text'} . $before);
                        if (!defined($result))
                        {
                            $result = '@' . $style->{'style'} . '{' . $style->{'text'} . $before . '}';
                        }
                    }
                    else
                    {
                        $result = $style->{'text'} . $before . '}';
                    }
                    if (@style_stack)
                    {
                         $style_stack[-1]->{'text'} .= $result;
                    }
                    else
                    {
                         $text .= $result;
                    }
                }
                else
                {
                    $text .= $before . '}';
                    warn "$ERROR '}' without opening '{' near $text";
                }
            }
            elsif (@style_stack)
            {
                $style_stack[-1]->{'text'} .= $_;
                last;
            }
            else
            {
                $text .= $_;
                push (@lines3, $text);
                $text = '';
                last;
            }
        }
    }
    print "# end of pass 3\n" if $T2H_VERBOSE;
}

#+++############################################################################
#                                                                              #
# Pass 4: foot notes, final cleanup                                            #
#                                                                              #
#---############################################################################

my @foot_lines = ();           # footnotes
my @doc_lines = ();            # final document

sub pass4
{
    my $text;
    my $name;
    my $end_of_para = 0;        # true if last line is <p>

    # APA: There aint no paragraph before the first one!
    # This fixes a HTML validation error.
    $lines3[0] =~ s|^</p>\n|\n|;
    while (@lines3)
    {
        $_ = shift(@lines3);
        #
        # special case (protected sections)
        #
        if (/^$PROTECTTAG/o)
        {
            push(@doc_lines, $_);
            $end_of_para = 0;
            next;
        }
        #
        # footnotes
        #
        while (/\@footnote([^\{\s]+)\{/)
        {
            ($before, $d, $after) = ($`, $1, $');
            $_ = $after;
            $text = '';
            $after = '';
            $failed = 1;
            while (@lines3)
            {
                if (/\}/)
                {
                    $text .= $`;
                    $after = $';
                    $failed = 0;
                    last;
                }
                else
                {
                    $text .= $_;
                    $_ = shift(@lines3);
                }
            }
            if ($failed)
            {
                die "* Bad syntax (\@footnote) after: $before\n";
            }
            else
            {
                $foot_num++;
                $docid  = "DOCF$foot_num";
                $footid = "FOOT$foot_num";
                $foot = "($foot_num)";
                push(@foot_lines, "<h3>" . &t2h_anchor($footid, "$d#$docid", $foot) . "</h3>\n");
                $text = "<p>$text" unless $text =~ /^\s*<p>/;
                push(@foot_lines, "$text\n");
                $_ = $before . &t2h_anchor($docid, "$docu_foot#$footid", $foot) . $after;
            }
        }
        #
        # remove unnecessary <p>
        #
        if (/^\s*<p>\s*$/)
        {
            next if $end_of_para++;
        }
        else
        {
            $end_of_para = 0;
        }
        # otherwise
        push(@doc_lines, $_);
    }

    print "# end of pass 4\n" if $T2H_VERBOSE;
}


#+++############################################################################
#                                                                              #
# Pass 5: print things                                                         #
#                                                                              #
#---############################################################################
sub pass5
{
    $T2H_L2H = &l2h_FinishToLatex if ($T2H_L2H);
    $T2H_L2H = &l2h_ToHtml        if ($T2H_L2H);
    $T2H_L2H = &l2h_InitFromHtml  if ($T2H_L2H);

    T2H_InitGlobals();

    # fix node2up, node2prev, node2next, if desired
    if ($has_top_command)
    {
        for $section (keys %sec2number)
        {
	    $node2href{$sec2node{$section}} =~ /SEC(\d+)$/;
            $node = $sec2node{$section};
            $node2up{$node} = Sec2UpNode($section) unless $node2up{$node};
            $node2prev{$node} = Sec2PrevNode($section) unless $node2prev{$node};
            $node2next{$node} = Sec2NextNode($section) unless $node2next{$node};
        }
    }

    # prepare %T2H_THISDOC
    $T2H_THISDOC{fulltitle} = $value{'_title'} || $value{'_settitle'} || "Untitled Document";
    $T2H_THISDOC{title} = $value{'_settitle'} || $T2H_THISDOC{fulltitle};
    $T2H_THISDOC{author} = $value{'_author'};
    $T2H_THISDOC{subtitle} = $value{'_subtitle'};
    $T2H_THISDOC{shorttitle} = $value{'_shorttitle'};
    for $key (keys %T2H_THISDOC)
    {
        $_ = &substitute_style($T2H_THISDOC{$key});
        $_ = &unprotect_texi ($_);
        s/\s*$//;
        $T2H_THISDOC{$key} = $_;
    }

    # if no sections, then simply print document as is
    unless (@sections)
    {
        print "# Writing content into $docu_top_file \n" if $T2H_VERBOSE;
        open(FILE, "> $docu_top_file")
            || die "$ERROR: Can't open $docu_top_file for writing: $!\n";

        &$T2H_print_page_head(\*FILE);
        $T2H_THIS_SECTION = \@doc_lines;
        t2h_print_lines(\*FILE);
        &$T2H_print_foot_navigation(\*FILE);
        &$T2H_print_page_foot(\*FILE);
        close(FILE);
        goto Finish;
    }

    # initialize $T2H_HREF, $T2H_NAME
    %T2H_HREF =
        (
         'First',   sec_href($sections[0]),
         'Last',    sec_href($sections[$#sections]),
         'About',   $docu_about . '#SEC_About',
        );

    # prepare TOC, OVERVIEW, TOP
    $T2H_TOC = \@toc_lines;
    $T2H_OVERVIEW = \@stoc_lines;
    if ($has_top)
    {
        while (1)
        {
            $_ = shift @doc_lines;
            unless (defined($_))
            {
                print STDERR "Bug, line undef\n";
                $_ = "<!-- line of doc_lines undef --!>\n";
            }
            last if /$TOPEND/;
            push @$T2H_TOP, $_;
        }
        $T2H_HREF{'Top'} = $docu_top . '#SEC_Top';
    }
    else
    {
        $T2H_HREF{'Top'} = $T2H_HREF{First};
    }

    $node2href{Top} = $T2H_HREF{Top};
    $T2H_HREF{Contents} = $docu_toc.'#SEC_Contents' if @toc_lines;
    $T2H_HREF{Overview} = $docu_stoc.'#SEC_OVERVIEW' if @stoc_lines;

    # settle on index
    if ($T2H_INDEX_CHAPTER)
    {
        $T2H_HREF{Index} = $node2href{normalise_node($T2H_INDEX_CHAPTER)};
        warn "$ERROR T2H_INDEX_CHAPTER '$T2H_INDEX_CHAPTER' not found\n"
            unless $T2H_HREF{Index};
    }
    if (! $T2H_HREF{Index} && $first_index_chapter)
    {
        $T2H_INDEX_CHAPTER = $first_index_chapter;
        $T2H_HREF{Index} = $node2href{$T2H_INDEX_CHAPTER};
    }

    print "# Using '" . clean_name($T2H_INDEX_CHAPTER) . "' as index page\n"
        if ($T2H_VERBOSE && $T2H_HREF{Index});

    %T2H_NAME =
        (
         'First',   clean_name($sec2node{$sections[0]}),
         'Last',    clean_name($sec2node{$sections[$#sections]}),
         'About',    $T2H_WORDS->{$T2H_LANG}->{'About_Title'},
         'Contents', $T2H_WORDS->{$T2H_LANG}->{'ToC_Title'},
         'Overview', $T2H_WORDS->{$T2H_LANG}->{'Overview_Title'},
         'Index' ,   clean_name($T2H_INDEX_CHAPTER),
         'Top',      clean_name($T2H_TOP_HEADING || $T2H_THISDOC{'title'} || $T2H_THISDOC{'shorttitle'}),
        );

    #############################################################################
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


    #############################################################################
    # Monolithic beginning.
    #
    unless ($T2H_SPLIT)
    {
        open(FILE, "> $docu_doc_file")
            || die "$ERROR: Can't open $docu_doc_file for writing: $!\n";
        &$T2H_print_page_head(\*FILE);
    }


    #############################################################################
    # print Top
    #
    if ($has_top)
    {
        if ($T2H_SPLIT)
        {
            open(FILE, "> $docu_top_file")
                || die "$ERROR: Can't open $docu_top_file for writing: $!\n";
        }

        print "# Creating Top in $docu_top_file ...\n" if $T2H_VERBOSE;
        $T2H_THIS_SECTION = $T2H_TOP;
        $T2H_HREF{This} = $T2H_HREF{Top};
        $T2H_NAME{This} = $T2H_NAME{Top};
        &$T2H_print_Top(\*FILE);

        if ($T2H_SPLIT)
        {
            close(FILE)
                || die "$ERROR: Error occurred when closing $docu_top_file: $!\n";
        }
    }


    #############################################################################
    # Print sections
    #
    $T2H_NODE{Forward} = $sec2node{$sections[0]};
    $T2H_NAME{Forward} = &clean_name($sec2node{$sections[0]});
    $T2H_HREF{Forward} = sec_href($sections[0]);
    $T2H_NODE{This} = 'Top';
    $T2H_NAME{This} = $T2H_NAME{Top};
    $T2H_HREF{This} = $T2H_HREF{Top};
    if ($T2H_SPLIT)
    {
        print "# writing " . scalar(@sections) .
            " sections into $docu_rdir$docu_name"."_[1..$doc_num].$docu_ext"
                if $T2H_VERBOSE;
        $previous = ($T2H_SPLIT eq 'chapter' ? $CHAPTEREND : $SECTIONEND);
        undef $FH;
        $doc_num = 0;
    }
    else
    {
        print "# writing " . scalar(@sections) . " sections in $docu_top_file ..."
            if $T2H_VERBOSE;
        $FH = \*FILE;
        $previous = '';
    }

    $counter = 0;
    # loop through sections
    while ($section = shift(@sections))
    {
        if ($T2H_SPLIT && ($T2H_SPLIT eq 'section' || $previous eq $CHAPTEREND))
        {
            if ($FH)
            {
                #close previous page
                &$T2H_print_chapter_footer($FH) if $T2H_SPLIT eq 'chapter';
                &$T2H_print_page_foot($FH);
                close($FH);
                undef $FH;
            }
        }
        $T2H_NAME{Back} = $T2H_NAME{This};
        $T2H_HREF{Back} = $T2H_HREF{This};
        $T2H_NODE{Back} = $T2H_NODE{This};
        $T2H_NAME{This} = $T2H_NAME{Forward};
        $T2H_HREF{This} = $T2H_HREF{Forward};
        $T2H_NODE{This} = $T2H_NODE{Forward};
        if ($sections[0])
        {
            $T2H_NODE{Forward} = $sec2node{$sections[0]};
            $T2H_NAME{Forward} = &clean_name($T2H_NODE{Forward});
            $T2H_HREF{Forward} = sec_href($sections[0]);
        }
        else
        {
            delete $T2H_HREF{Forward};
            delete $T2H_NODE{Forward};
            delete $T2H_NAME{Forward};
        }

        $node = $node2up{$T2H_NODE{This}};
        $T2H_HREF{Up} = $node2href{$node};
        if (! $T2H_HREF{Up} || $T2H_HREF{Up} eq $T2H_HREF{This})
        {
            $T2H_NAME{Up} = $T2H_NAME{Top};
            $T2H_HREF{Up} = $T2H_HREF{Top};
            $T2H_NODE{Up} = 'Up';
        }
        else
        {
            $T2H_NAME{Up} = &clean_name($node);
            $T2H_NODE{Up} = $node;
        }

        $node = $node2prev{$T2H_NODE{This}};
        $T2H_NAME{Prev} = &clean_name($node);
        $T2H_HREF{Prev} = $node2href{$node};
        $T2H_NODE{Prev} = $node;

	$node = Node2FastBack($T2H_NODE{This});
        $T2H_NAME{FastBack} = &clean_name($node);
        $T2H_HREF{FastBack} = $node2href{$node};
        $T2H_NODE{FastBack} = $node;

        $node = $node2next{$T2H_NODE{This}};
        $T2H_NAME{Next} = &clean_name($node);
        $T2H_HREF{Next} = $node2href{$node};
        $T2H_NODE{Next} = $node;

	$node = Node2FastForward($T2H_NODE{This});
        $T2H_NAME{FastForward} = &clean_name($node);
        $T2H_HREF{FastForward} = $node2href{$node};
        $T2H_NODE{FastForward} = $node;

        if (! defined($FH))
        {
            my $file = $T2H_HREF{This};
            $file =~ s/\#.*$//;
            open(FILE, "> $docu_rdir$file") ||
                die "$ERROR: Can't open $docu_rdir$file for writing: $!\n";
            $FH = \*FILE;
            &$T2H_print_page_head($FH);
            t2h_print_label($FH);
            &$T2H_print_chapter_header($FH) if $T2H_SPLIT eq 'chapter';
        }
        else
        {
            t2h_print_label($FH);
        }

        $T2H_THIS_SECTION = [];
        while (@doc_lines)
        {
            $_ = shift(@doc_lines);
            last if ($_ eq $SECTIONEND || $_ eq $CHAPTEREND);
            push(@$T2H_THIS_SECTION, $_);
        }
        $previous = $_;
        &$T2H_print_section($FH);

        if ($T2H_VERBOSE)
        {
            $counter++;
            print "." if $counter =~ /00$/;
        }
    }
    if ($T2H_SPLIT)
    {
        &$T2H_print_chapter_footer($FH) if $T2H_SPLIT eq 'chapter';
        &$T2H_print_page_foot($FH);
        close($FH);
    }
    print "\n" if $T2H_VERBOSE;

    #############################################################################
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
        $T2H_NAME{This} = $T2H_WORDS->{$T2H_LANG}->{'Footnotes_Title'};
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
        my $ul_style = $T2H_NUMBER_SECTIONS ?
            ' style="list-style: none"' : '';
        unshift @$T2H_THIS_SECTION, "<ul${ul_style}>\n";
        push @$T2H_THIS_SECTION, "</ul>\n";
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

 Finish:
    &l2h_FinishFromHtml if ($T2H_L2H);
    &l2h_Finish if($T2H_L2H);
    print "# that's all folks\n" if $T2H_VERBOSE;

    exit(0);
}

#+++############################################################################
#                                                                              #
# Low level functions                                                          #
#                                                                              #
#---############################################################################

sub LocateIncludeFile
{
    my $file = shift;
    my $dir;

    # APA: Don't implicitely search ., to conform with the docs!
    # return $file if (-e $file && -r $file);
    foreach $dir (@T2H_INCLUDE_DIRS)
    {
        return "$dir/$file" if (-e "$dir/$file" && -r "$dir/$file");
    }
    return undef;
}

sub clean_name
{
    local ($_);
    $_ = &remove_style($_[0]);
    $_ = &unprotect_texi($_);
    return $_;
}

# initialize or increments @appendix_sec_num for the appendix sectionning,
# initialize or increments @normal_sec_num for the normal sections, 
# return the sectionning number.
sub update_sec_num
{
    my($name, $level) = @_;
    my $ret;

    $level--;                   # here we start at 0
    if ($name =~ /^appendix/ || defined(@appendix_sec_num))
    {
        # appendix style
        if (defined(@appendix_sec_num))
        {
            &incr_sec_num($level, @appendix_sec_num);
        }
        else
        {
            @appendix_sec_num = ('A', 0, 0, 0);
        }
        $ret = join('.', @appendix_sec_num[0..$level]);
    }
    else
    {
        # normal style
        if (defined(@normal_sec_num))
        {
            &incr_sec_num($level, @normal_sec_num);
        }
        else
        {
            @normal_sec_num = (1, 0, 0, 0);
        }
        $ret = join('.', @normal_sec_num[0..$level]);
    }
    $ret .= "." if $level == 0;
    return $ret;
}

sub incr_sec_num
{
    local($level, $l);
    $level = shift(@_);
    $_[$level]++;
    foreach $l ($level+1 .. 3)
    {
        $_[$l] = 0;
    }
}

sub Sec2UpNode
{
    my $sec = shift;
    my $num = $sec2number{$sec};

    return '' unless $num;
    return 'Top' unless $num =~ /\.\d+/;
    $num =~ s/\.[^\.]*$//;
    $num = $num . '.' unless $num =~ /\./;
    return $sec2node{$number2sec{$num}};
}

# Return previous node or "Top"
sub Sec2PrevNode
{
    my $sec = shift;
    my $sec_num = 0;
    if (defined($sec) and defined($sec2seccount{$sec})) 
    { 
        $sec_num = $sec2seccount{$sec} - 1;
    }
    return "Top" if $sec_num < 1;
    return $sec2node{$seccount2sec{$sec_num}};
}

# Return next node or "Top"
sub Sec2NextNode
{
    my $sec = shift;
    my $sec_num = $sec2seccount{$sec} + 1;
    return "Top" unless exists $seccount2sec{$sec_num};
    return $sec2node{$seccount2sec{$sec_num}};
}

#
# sub Node2FastBack NODE
#
# INPUTS
#    NODE	A node
#
# RETURNS
#    The beginning of this chapter, or if already there, the beginning of the
#    previous chapter.
#
sub Node2FastBack
{
    my $node = shift;
    my $num = $sec2number{$node2sec{$node}};
    my $n;

    # Index Pages  have no section number and 1. should go back to Top
    return $node2prev{$node} if !$num or $num eq "1.";

    # Get the current chapter
    $num =~ /^([A-Z\d]+)\./;
    $n = $1;

    # If the first section of this chapter, decrement chapter
    $n = $n eq 'A' ? $normal_sec_num[0] : $n =~ /^\d+$/ ? --$n : chr(ord($n)-1)
	if $n . '.' eq $num;

    # Return node name for section number "$n."
    return $sec2node{$number2sec{$n . '.'}} || $node2prev{$node};
}

#
# sub Node2FastForward NODE
#
# INPUTS
#    NODE	A node
#
# RETURNS
#    The beginning of the next chapter.
#
sub Node2FastForward
{
    my $node = shift;
    my $num = $sec2number{$node2sec{$node}};

    my $n;
    my $returned_node;

    # Index pages
    return $node2next{$node} if !$num;

    # Get current chapter
    $num =~ /^([A-Z\d]+)\./;
    $n = $1;

    # Increment chapter
    $n = $n eq $normal_sec_num[0] ? 'A' : ++$n;

    # Return node name

    if (defined($number2sec{$n . '.'}) and ($returned_node = $sec2node{$number2sec{$n . '.'}}))
    {
        return $returned_node;
    }
    return $node2next{$node};
}

sub check()
{
    local($_);
    my (%seen, %context);

    while (<>)
    {
        if (/\@(\*|\.|\:|\@|\{|\})/)
        {
            $seen{$&}++;
            $context{$&} .= "> $_" if $T2H_VERBOSE;
            $_ = "$`XX$'";
            redo;
        }
        if (/\@(\w+)/)
        {
            my ($before, $match, $after);
            ($before, $match, $after) = ($`, $&, $');
            if ($before =~ /\b[-\w]+$/ && $after =~ /^[-\w.]*\b/)
            {                   # e-mail address
                $seen{'e-mail address'}++;
                $context{'e-mail address'} .= "> $_" if $T2H_VERBOSE;
            }
            else
            {
                $seen{$match}++;
                $context{$match} .= "> $_" if $T2H_VERBOSE;
            }
            $match =~ s/^\@/X/;
            $_ = "$before$match$after";
            redo;
        }
    }

    foreach (sort(keys(%seen)))
    {
        if ($T2H_VERBOSE)
        {
            print "$_\n";
            print $context{$_};
        }
        else
        {
            print "$_ ($seen{$_})\n";
        }
    }
}

sub open
{
    my($name) = @_;

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

sub init_input
{
    @fhs = ();			# hold the file handles to read
    @input_spool = ();		# spooled lines to read
    $fh_name = 'FH000';
    &open($docu);
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
        $line = <$fh>;
        return($line) if $line;
        close($fh);
        shift(@fhs);
    }
    return(undef);
}

# used in pass 1, use &next_line
sub skip_until
{
    local($tag) = @_;
    local($_);

    while ($_ = &next_line)
    {
        return if /^\@end\s+$tag\s*$/;
    }
    die "* Failed to find '$tag' after: " . $lines[$#lines];
}

# used in pass 1 for l2h use &next_line
sub string_until
{
    local($tag) = @_;
    local($_, $string);

    while ($_ = &next_line)
    {
        return $string if /^\@end\s+$tag\s*$/;
        #	$_ =~ s/hbox/mbox/g;
        $string = $string.$_;
    }
    die "* Failed to find '$tag' after: " . $lines[$#lines];
}

#
# HTML stacking to have a better HTML output
#

sub html_reset
{
    @html_stack = ('html');
    $html_element = 'body';
}

sub html_push
{
    local($what) = @_;
    push(@html_stack, $html_element);
    $html_element = $what;
}

# push the html element on the top the html stack if it is not a <p>
sub html_push_if
{
    local($what) = @_;
    push(@html_stack, $html_element)
        if ($html_element && $html_element ne 'p');
    $html_element = $what;
}

sub html_pop
{
    $html_element = pop(@html_stack);
}

sub html_pop_if
{
    local($elt);

    if (@_)
    {
        foreach $elt (@_)
        {
            if ($elt eq $html_element)
            {
                $html_element = pop(@html_stack) if @html_stack;
                last;
            }
        }
    }
    else
    {
        $html_element = pop(@html_stack) if @html_stack;
    }
}

sub html_debug
{
    my($what, $line) = @_;
    if ($T2H_DEBUG & $DEBUG_HTML)
    {
        $what = "\n" unless $what;
        return("<!-- $line @html_stack, $html_element -->$what")
    }
    return($what);
}

# to debug the output...
sub debug
{
    my($what, $line) = @_;
    return("<!-- $line -->$what")
        if $T2H_DEBUG & $DEBUG_HTML;
    return($what);
}

sub SimpleTexi2Html
{
    return undef unless (defined ($_[0]));
    local $_ = shift;
    $_ = &protect_texi($_);
    $_ = &protect_html($_);
    $_ = substitute_style($_);
    return $_;
}

sub normalise_node
{
    return undef unless (defined ($_[0]));
    local $_ = shift;
    $_ = &normalise_space ($_);
    $_ = &SimpleTexi2Html ($_);
    return $_;
}
 
sub normalise_space
{
    return undef unless (defined ($_[0]));
    local $_ = shift;
    s/\s+/ /go;
    s/ $//;
    s/^ //;
    return $_;
}

sub normalise_space_style
{
    return undef unless (defined ($_[0]));
    local $_ = shift;
    $_ = &normalise_space ($_);
    $_ = substitute_style($_);
    return $_;
}

sub menu_entry
{
    my ($node, $name, $descr) = @_;
    my ($href, $entry);

    $node = &normalise_space_style($node);
    $href = $node2href{$node};
    if ($href)
    {
        $descr =~ s/^\s+//;
        $descr =~ s/\s*$//;
        $descr = &substitute_style($descr);
        if ($T2H_NUMBER_SECTIONS && !$T2H_NODE_NAME_IN_MENU && $node2sec{$node})
        {
            $entry = $node2sec{$node};
            $name = '';
        }
        else
        {
            $name = &normalise_space_style($name);
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
        push(@lines2,&debug('<tr><td align="left" valign="top">' .
                            &t2h_anchor('', $href, $entry, 0, '', 1) .
                            '</td><td>&nbsp;&nbsp;</td>' .
                            '<td align="left" valign="top">' . $descr .
                            "</td></tr>\n", __LINE__));
    }
    elsif ($node =~ /^\(.*\)\w+/)
    {
        push(@lines2,&debug('<tr><td align="left" valign="top">' .
                            $entry .
                            '</td><td align="left" valign="top">' . $descr .
                            "</td></tr>\n", __LINE__))
    }
    else
    {
        warn "$ERROR Undefined node of menu_entry ($node): $_";
    }
}

sub do_ctrl { "^$_[0]" }

sub do_bullet 
{ 
    my $text = shift;
    $text = "" unless (defined($text));
    return "$things_map{bullet} $text";
}

sub do_email
{
    my($addr, $text) = split(/,\s*/, $_[0]);

    $text = $addr unless $text;
    &t2h_anchor('', "mailto:$addr", $text);
}

sub do_sc
{
    # l2h does this much better
    return &l2h_ToLatex("{\\sc ".&unprotect_html($_[0])."}") if ($T2H_L2H);
    return "\U$_[0]\E";
}

sub do_math
{
    # APA: FIXME
    # This sub doesn't seem to be used.
    # What are $_[0] and $text?
    my $text;
    return &l2h_ToLatex("\$".&unprotect_html($_[0])."\$") if ($T2H_L2H);
    return '<em>' . $text . '</em>';
}

sub do_uref
{
    my($url, $text, $only_text) = split(/,\s*/, $_[0]);
    # APA: Don't markup obviously bad links.
    # e.g. texinfo.texi 4.0 has this, which would lead to a broken
    # link:
    # @section @code{@@uref@{@var{url}[, @var{text}][, @var{replacement}]@}}
    #return if $url =~ /[<>]/;
    $text = $only_text if $only_text;
    $text = $url unless $text;
    &t2h_anchor('', $url, $text);
}

sub do_url { &t2h_anchor('', $_[0], $_[0]) }

sub do_acronym
{
    return '<font size="-1">' . $_[0] . '</font>';
}

sub do_accent
{
    return "$_[0]''" if $_[1] eq 'H';
    return "$_[0]." if $_[1] eq 'dotaccent';
    return "$_[0]*" if $_[1] eq 'ringaccent';
    return "$_[0]".'[' if $_[1] eq 'tieaccent';
    return "$_[0]".'(' if $_[1] eq 'u';
    return "$_[0]_" if $_[1] eq 'ubaraccent';
    return ".$_[0]" if $_[1] eq 'udotaccent';
    return "$_[0]&lt;" if $_[1] eq 'v';
    return "&$_[0]cedil;" if $_[1] eq ',';
    return "$_[0]" if $_[1] eq 'dotless';
    return undef;
}

sub apply_style
{
    my($texi_style, $text) = @_;
    my($style);

    $style = $style_map{$texi_style};
    if (defined($style))
    {                           # known style
        my $do_quotes = 0;
        if ($style =~ /^\"/)
        {                       # add quotes
            $style = $';
            $do_quotes = 1;
        }
        if ($style =~ /^\&/)
        {                       # custom
            $style = $';
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
        $text = "\`$text\'" if $do_quotes;
    }
    else
    {                           # unknown style
        $text = undef;
    }
    return($text);
}

# remove Texinfo styles
sub remove_style
{
    local($_) = @_;
    1 while(s/\@\w+{([^\{\}]+)}/$1/g);
    return($_);
}

sub remove_things
{
    local ($_) = @_;
    s|\@(\w+)\{\}|$1|g;
    return $_;
}

sub substitute_style
{
    local($_) = @_;
    my($changed, $done, $style, $text);

    &simple_substitutions;
    $changed = 1;
    while ($changed)
    {
        $changed = 0;
        $done = '';
        while (/\@(\w+){([^\{\}]+)}/ || /\@(,){([^\{\}]+)}/)
        {
            $text = &apply_style($1, $2);
            if ($text)
            {
                $_ = "$`$text$'";
                $changed = 1;
            }
            else
            {
                $done .= "$`\@$1";
                $_ = "{$2}$'";
            }
        }
        $_ = $done . $_;
    }
    return($_);
}

sub t2h_anchor
{
    my($name, $href, $text, $newline, $extra_attribs, $dont_html) = @_;
    my @result = ();

    push(@result, '<a');
    if ($name)
    {
        if ($dont_html)
        {
            push(@result, ' name="', $name, '"') if $name;
        }
        else
        {
            push(@result, ' name="', protect_html($name), '"') if $name;
        }
    }
    if ($href)
    {
        $href =~ s|^$T2H_HREF_DIR_INSTEAD_FILE|./|
            if ($T2H_HREF_DIR_INSTEAD_FILE);
        if ($dont_html)
        {
            push(@result, ' href="', $href, '"');
        }
        else
        {
            push(@result, ' href="', protect_html($href), '"');
        }
    }
    push(@result, ' ', $extra_attribs) if $extra_attribs;
    push(@result, '>');
    push(@result, $text) if $text;
    push(@result, '</a>');
    push(@result, "\n") if $newline;

    return join('', @result);
}

sub doc_href
{
    local($num) = @_;

    return("${docu_name}_$num.$docu_ext");
}

sub sec_href
{
    return $node2href{$sec2node{$_[0]}};
}

sub next_doc
{
    ++$doc_num;
    if ("$docu_rdir${docu_name}_$doc_num.$docu_ext" eq "$docu_top_file") {
        warn "$WARN Section $docu_rdir${docu_name}_$doc_num.$docu_ext would overwrite Top, continuing at $docu_rdir${docu_name}_".($doc_num+1).".$docu_ext";
        $doc_num++;
    }
    $docu_doc = &doc_href($doc_num);
}

sub t2h_print_lines
{
    my ($fh, $lines) = @_;
    local($_);
    $lines = $T2H_THIS_SECTION unless $lines;
    my $cnt = 0;
    my @cnt;
    for (@$lines)
    {
        $_ = l2h_FromHtml($_) if ($T2H_L2H);
        if (/^$PROTECTTAG/o)
        {
            $_ = $tag2pro{$_};
        }
        else
        {
            $_ =  &unprotect_texi ($_);
        }
        print $fh $_;
        @cnt = split(/\W*\s+\W*/);
        $cnt += scalar(@cnt);
    }
    return $cnt;
}

# protect the , in @,{}
sub protect_cedilla
{
    my $text = shift;
    $text =~ s/\@,\{(\w)\}/$;6$1/g;
    return $text;
}

sub protect_texi
{
    # protect @ { } ` '
    my $text = shift;
    $text =~ s/\@\@/$;0/go;
    $text =~ s/\@\{/$;1/go;
    $text =~ s/\@\}/$;2/go;
    $text =~ s/\@\`/$;3/go;
    $text =~ s/\@\'/$;4/go;
    $text =~ s/\@\"/$;5/go;
    return $text;
}

sub protect_html
{
    local($what) = @_;
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

sub unprotect_cedilla
{
    my @result = ();
    while (@_)
    {
        my $text = shift;
        $text =~ s/$;6(\w)/\@,\{$1\}/g;
        push @result, $text;
    }
    return @result;
}

sub unprotect_texi
{
    my $text = shift;
    $text =~ s/$;0/\@/go;
    $text =~ s/$;1/\{/go;
    $text =~ s/$;2/\}/go;
    $text =~ s/$;3/\`/go;
    $text =~ s/$;4/\'/go;
    $text =~ s/$;5/\"/go;
    return $text;
}

sub Unprotect_texi
{
    local $_ = shift;
    $_ = &unprotect_texi($_);
    return($_);
}

sub unprotect_html
{
    local($what) = @_;
    # APA: Use
    # Character entity references (eg. &lt;)
    # instead of
    # Numeric character references (eg. &#60)
    $what =~ s/\&amp;/\&/go;
    $what =~ s/\&quot;/\"/go;
    $what =~ s/\&lt;/\</go;
    $what =~ s/\&gt;/\>/go;
    return($what);
}

sub t2h_print_label
{
    my $fh = shift;
    my $href = shift || $T2H_HREF{This};
    $href =~ s/.*#(.*)$/$1/;
    print $fh qq{<a name="$href"></a>\n};
}

sub main
{
    SetDocumentLanguage('en') unless ($T2H_LANG);
    # APA: There's got to be a better way:
    $things_map{'today'} = &pretty_date;
    if ($T2H_TEST)
    {
        $T2H_TODAY = 'a sunny day';
        $T2H_USER = 'a tester';
        $THISPROG = 'texi2html';
    } 
    else
    { 
        # Identity:
        $T2H_TODAY = &pretty_date;  # like "20 September 1993"
        # the eval prevents this from breaking on system which do not have
        # a proper getpwuid implemented
        eval { ($T2H_USER = (getpwuid ($<))[6]) =~ s/,.*//;}; # Who am i
        # APA: Provide Windows NT workaround until getpwuid gets
        # implemented there.
        $T2H_USER = $ENV{'USERNAME'} unless defined $T2H_USER;
    }
    &pass1();
    &pass2();
    &pass3();
    &pass4();
    &pass5();
}

&main();

##############################################################################

# These next few lines are legal in both Perl and nroff.

.00 ;                           # finish .ig

'di			\" finish diversion--previous line must be blank
.nr nl 0-1		\" fake up transition to first page again
.nr % 0			\" start at page 1
'; __END__ ############# From here on it's a standard manual page ############
    .so @mandir@/man1/texi2html.1
