#! /usr/bin/perl -w

# texi2any: Texinfo converter.
#
# Copyright 2010, 2011 Free Software Foundation, Inc.
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
# Parts (also from Patrice Dumas) come from texi2html.pl or texi2html.init.

# for POSIX::setlocale and File::Spec
require 5.00405;

use strict;

# to determine the path separator and null file
use Config;
# for dirname.
use File::Basename;
#use Cwd;
use Getopt::Long qw(GetOptions);

Getopt::Long::Configure("gnu_getopt");

BEGIN
{
  my $texinfolibdir = '@datadir@/@PACKAGE@';
  unshift @INC, ($texinfolibdir) if ($texinfolibdir ne '');
}

use Texinfo::Convert::Texinfo;

# defaults for options relevant in the main program, not undef, and also
# defaults for all the converters.
# Other relevant options (undef) are NO_WARN FORCE OUTFILE
# Others are set in the converters.
my $converter_default_options = { 'ERROR_LIMIT' => 100,
                                  'TEXI2DVI' => 'texi2dvi' };

# this associates the command line options to the arrays set during
# command line parsing.
my @css_files = ();
my @css_refs = ();
my $cmdline_options = { 'CSS_FILES' => \@css_files,
                        'CSS_REFS' => \@css_refs };

# determine the path separators
my $path_separator = $Config{'path_sep'};
$path_separator = ':' if (!defined($path_separator));
my $quoted_path_separator = quotemeta($path_separator);

# Version: set in configure.in
my $configured_version = '@PACKAGE_VERSION@';
my $configured_name = '@PACKAGE_NAME@';
my $configured_name_version = "$configured_name $configured_version"; 

# Paths and file names

# set by configure, prefix for the sysconfdir and so on
my $prefix = '@prefix@';
my $datarootdir;# = '@datarootdir@';
my $sysconfdir;
my $pkgdatadir;
my $datadir;

# We need to eval as $prefix has to be expanded. However when we haven't
# run configure @sysconfdir will be expanded as an array, thus we verify
# whether configure was run or not
if ('@sysconfdir@' ne '@' . 'sysconfdir@') {
  $sysconfdir = eval '"@sysconfdir@"';
} else {
  $sysconfdir = '/usr/local/etc';
}

if ('@datarootdir@' ne '@' . 'datarootdir@') {
  $datarootdir = eval '"@datarootdir@"';
} else {
  $datarootdir = '/usr/local/share';
}
if ('@datadir@' ne '@' . 'datadir@') {
  $pkgdatadir = eval '"@datadir@/@PACKAGE@"';
  $datadir = eval '"@datadir@"';
} else {
  $pkgdatadir = '/usr/local/share/texinfo';
  $datadir = '/usr/local/share';
}

my $real_command_name = $0;
$real_command_name =~ s/.*\///;
$real_command_name =~ s/\.pl$//;

#my $messages_textdomain = 'texinfo';
my $messages_textdomain = '@PACKAGE@';
$messages_textdomain = 'texinfo' if ($messages_textdomain eq '@'.'PACKAGE@');
my $strings_textdomain = '@PACKAGE@' . '_document';
$strings_textdomain = 'texinfo_document' 
   if ($strings_textdomain eq '@'.'PACKAGE@' . '_document');

sub __($) {
  my $msgid = shift;
  return Locale::Messages::dgettext($messages_textdomain, $msgid);
}

sub __p($$) {
  my $context = shift;
  my $msgid = shift;
  return Locale::Messages::dpgettext($messages_textdomain, $context, $msgid);
}

# FIXME use something else than srcdir?
my $srcdir = defined $ENV{'srcdir'} ? $ENV{'srcdir'} : dirname $0;
# FIXME
my $libsrcdir = "$srcdir/../texi2html";
if ($0 =~ /\.pl$/) {
  unshift @INC, "$libsrcdir/lib/libintl-perl/lib";
} elsif ('@USE_EXTERNAL_LIBINTL@' ne 'yes') {
  unshift @INC, "$pkgdatadir/lib/libintl-perl/lib";
} else {
  eval { require Locale::Messages; };
  if ($@) {
    unshift @INC, "$pkgdatadir/lib/libintl-perl/lib";
  }
}

require Locale::Messages;
# we want a reliable way to switch locale, so we don't use the system
# gettext.
Locale::Messages->select_package ('gettext_pp');

if ($0 =~ /\.pl$/) {
  # in case of out of source build, the locales directory should
  # FIXME srcdir
  # be in the same directory or in the srcdir, 
  # FIXME
  # or in the texi2html directory
  my $locales_dir_found = 0;
  foreach my $locales_dir ("../../../tp/t/locales", "$libsrcdir/locales", "./locales", '../texi2html/locales') {
    if (-d $locales_dir) {
      Locale::Messages::bindtextdomain ($strings_textdomain, $locales_dir);
      $locales_dir_found = 1;
      last;
    }
  }
  if (!$locales_dir_found) {
    warn "Locales dir for document strings not found\n";
  }
} else {
  Locale::Messages::bindtextdomain ($strings_textdomain, "$datadir/locale");
}

Locale::Messages::bindtextdomain ($messages_textdomain, "$datadir/locale");

if ($0 =~ /\.pl$/) {
  unshift @INC, "$libsrcdir/lib/Unicode-EastAsianWidth/lib";
} elsif ('@USE_EXTERNAL_EASTASIANWIDTH@' ne 'yes') {
  unshift @INC, "$pkgdatadir/lib/Unicode-EastAsianWidth/lib";
} else {
  eval { require Unicode::EastAsianWidth; };
  if ($@) {
    unshift @INC, "$pkgdatadir/lib/Unicode-EastAsianWidth/lib";
  }
}
require Unicode::EastAsianWidth;

if ($0 =~ /\.pl$/) {
  unshift @INC, "$libsrcdir/lib/Text-Unidecode/lib";
} elsif ('@USE_EXTERNAL_UNIDECODE@' ne 'yes') {
  unshift @INC, "$pkgdatadir/lib/Text-Unidecode/lib";
} else {
  eval { require Text::Unidecode; };
  if ($@) {
    unshift @INC, "$pkgdatadir/lib/Text-Unidecode/lib";
  }
}
require Text::Unidecode;

# This is done at runtime because the modules above are also found at runtime.
require Texinfo::Parser;
require Texinfo::Structuring;
require Texinfo::Convert::Info;
require Texinfo::Convert::HTML;
require Texinfo::Convert::XML;
require Texinfo::Convert::DocBook;
require DebugTexinfo::DebugCount;
require DebugTexinfo::DebugTree;

# determine configuration directories.

my $conf_file_name = 'Config' ;
my $texinfo_htmlxref = 'htmlxref.cnf';

# directories for texinfo configuration files
my @language_config_dirs = ('./.texinfo');
push @language_config_dirs, "$ENV{'HOME'}/.texinfo" if (defined($ENV{'HOME'}));
push @language_config_dirs, "$sysconfdir/texinfo" if (defined($sysconfdir));
push @language_config_dirs, "$datadir/texinfo" if (defined($datadir));
my @texinfo_config_dirs = ('.', @language_config_dirs);

my @program_config_dirs;
my @program_init_dirs;

my $program_name = 'texi2any';
@program_config_dirs = ('.', "./.$program_name");
push @program_config_dirs, "$ENV{'HOME'}/.$program_name" 
       if (defined($ENV{'HOME'}));
push @program_config_dirs, "$sysconfdir/$program_name" if (defined($sysconfdir));
push @program_config_dirs, "$datadir/$program_name" if (defined($datadir));

@program_init_dirs = @program_config_dirs;
foreach my $texinfo_config_dir (@language_config_dirs) {
  push @program_init_dirs, "${texinfo_config_dir}/init";
}

# Namespace for configuration
{
package Texinfo::Config;

# passed from main program
my $cmdline_options;
my $default_options;
# used in main program
our $options = {};

sub _load_config ($$) {
  $default_options = shift;
  $cmdline_options = shift;
  #print STDERR "cmdline_options: ".join('|',keys(%$cmdline_options))."\n";
}

sub _load_init_file($) {
  my $file = shift;
  eval { require($file) ;};
  my $e = $@;
  if ($e ne '') {
    main::document_warn(sprintf(main::__("error loading %s: %s\n"), 
                                 $file, $e));
  }
}

sub set_from_init_file ($$) {
  my $var = shift;
  my $value = shift;
  if (!Texinfo::Common::valid_option($var)) {
    warn (sprintf(__('Unknown variable %s'), $var));
    return 0;
  }
  return 0 if (defined($cmdline_options->{$var}));
  delete $default_options->{$var};
  $options->{$var} = $value;
  return 1;
}

sub set_from_cmdline ($$) {
  my $var = shift;
  my $value = shift;
  delete $options->{$var};
  delete $default_options->{$var};
  if (!Texinfo::Common::valid_option($var)) {
    warn (sprintf(main::__("Unknown variable %s\n"), $var));
    return 0;
  }
  $cmdline_options->{$var} = $value;
  return 1;
}

# FIXME also get @-command results?
sub get_conf($) {
  my $var = shift;
  if (exists($cmdline_options->{$var})) {
    return $cmdline_options->{$var};
  } elsif (exists($options->{$var})) {
    return $options->{$var};
  } elsif (exists($default_options->{$var})) {
    return $default_options->{$var};
  } else {
    return undef;
  }
}

}
# back in main program namespace

# file:        file name to locate. It can be a file path.
# directories: a reference on a array containing a list of directories to
#              search the file in. 
# all_files:   if true collect all the files with that name, otherwise stop
#              at first match.
sub locate_init_file($$$)
{
  my $file = shift;
  my $directories = shift;
  my $all_files = shift;

  if ($file =~ /^\//) {
    return $file if (-e $file and -r $file);
  } else {
    my @files;
    foreach my $dir (@$directories) {
      next unless (-d "$dir");
      if ($all_files) {
        push (@files, "$dir/$file") if (-e "$dir/$file" and -r "$dir/$file");
      } else {
        return "$dir/$file" if (-e "$dir/$file" and -r "$dir/$file");
      }
    }
    return @files if ($all_files);
  }
  return undef;
}


# read initialization files
foreach my $file (locate_init_file($conf_file_name, 
                  [ reverse(@program_config_dirs) ], 1)) {
  Texinfo::Config::_load_init_file($file);
}

sub set_from_cmdline ($$) {
  return &Texinfo::Config::set_from_cmdline(@_);
}

sub set_from_init_file ($$) {
  return &Texinfo::Config::set_from_init_file(@_);
}

sub get_conf ($) {
  return &Texinfo::Config::get_conf(@_);
}

my @input_file_suffixes = ('.txi','.texinfo','.texi','.txinfo','');

my @texi2dvi_args = ();

my $format = 'info';
# this is the format associated with the output format, which is replaced
# when the output format changes.  It may also be removed if there is the
# corresponding --no-ifformat.
my $default_expanded_format = [ $format ];
my @conf_dirs = ();
my @include_dirs = ();
my @prepend_dirs = ();

# options for all the files
my $parser_default_options = {'expanded_formats' => [], 'values' => {},
                              'gettext' => \&__};

Texinfo::Config::_load_config($converter_default_options, $cmdline_options);

sub set_expansion($$) {
  my $region = shift;
  my $set = shift;
  $set = 1 if (!defined($set));
  if ($set) {
    push @{$parser_default_options->{'expanded_formats'}}, $region
      unless (grep {$_ eq $region} @{$parser_default_options->{'expanded_formats'}});
  } else {
    @{$parser_default_options->{'expanded_formats'}} = 
      grep {$_ ne $region} @{$parser_default_options->{'expanded_formats'}};
    @{$default_expanded_format} 
       = grep {$_ ne $region} @{$default_expanded_format};
  }
}

my $format_from_command_line = 0;
sub set_format($)
{
  my $format = shift;
  $default_expanded_format = [$format];
  $format_from_command_line = 1;
  return $format;
}

my $call_texi2dvi = 0;
sub set_texi2dvi_format($)
{
  my $format = shift;
  $call_texi2dvi = 1;
  push @texi2dvi_args, '--'.$format; 
  $format_from_command_line = 1;
  return $format;
}


sub document_warn ($) {
  return if (get_conf('NO_WARN'));
  my $text = shift;
  chomp ($text);
  warn sprintf(__p("warning: warning_message", "warning: %s\n"), $text);
}

sub handle_errors($$) {
  my $self = shift;
  my $error_count = shift;
  my ($errors, $new_error_count) = $self->errors();
  $error_count += $new_error_count if ($new_error_count);
  foreach my $error_message (@$errors) {
    warn $error_message->{'error_line'} if ($error_message->{'type'} eq 'error'
                                           or !get_conf('NO_WARN'));
  }
  
  exit (1) if ($error_count and (!get_conf('FORCE')
     or $error_count > get_conf('ERROR_LIMIT')));
  return $error_count;
}

sub _set_variables_texi2html()
{
  # FIXME all that are set to 0 could be negated, in order to have the default
  # (undef) right.
  my @texi2html_options = (
  ['NO_USE_SETFILENAME', 1],
  ['USE_SETFILENAME_EXTENSION', 0],
  ['footnotestyle', 'separate'],
  ['INLINE_CONTENTS', 0],
  ['FORCE', 1],
  ['AVOID_MENU_REDUNDANCY', 1],
  ['TOP_HEADING_AT_BEGINNING', 1],
  ['TOP_FILE', ''],
  ['USE_ACCESSKEY', 0],
  ['NODE_NAME_IN_MENU', 0],
  ['OVERVIEW_LINK_TO_TOC', 0],
  ['USE_UP_FOR_ADJACENT_NODES', 1],
  ['USE_REL_REV', 0],
  ['USE_LINKS', 0],
  ['USE_NODES', undef],
  ['USE_SECTIONS', 1],
  ['NODE_FILENAMES', 0],
  ['USE_NUMERIC_ENTITY', 1],
  ['SPLIT', ''],
  ['SPLIT_INDEX', 100],
  ['PROGRAM_NAME_IN_FOOTER', 1],
  ['HEADER_IN_TABLE', 1],
  ['SHORT_REF', 0],
  ['USE_TITLEPAGE_FOR_TITLE', 1],
  ['MENU_ENTRY_COLON', ''],
  ['INDEX_ENTRY_COLON', ''],
  ['ENABLE_ENCODING_USE_ENTITY', 1],
  ['DO_ABOUT', undef],
  ['NODE_NAME_IN_INDEX', 0],
  ['BIG_RULE', '<hr size="6">'],
  ['SECTION_BUTTONS', ['FastBack', 'Back', 'Up', 'Forward', 'FastForward',
                             ' ', ' ', ' ', ' ',
                             'Top', 'Contents', 'Index', 'About' ]],
  ['TOP_BUTTONS', ['Back', 'Forward', ' ',
                             'Contents', 'Index', 'About']],

  ['MISC_BUTTONS', [ 'Top', 'Contents', 'Index', 'About' ]],
  ['CHAPTER_BUTTONS', [ 'FastBack', 'FastForward', ' ',
                              ' ', ' ', ' ', ' ',
                              'Top', 'Contents', 'Index', 'About', ]],
  ['SECTION_FOOTER_BUTTONS', [ 'FastBack', 'Back', 'Up', 
                                               'Forward', 'FastForward' ]],
  ['NODE_FOOTER_BUTTONS', [ 'FastBack', 'Back', 
                                            'Up', 'Forward', 'FastForward' ]],
  );
  foreach my $option (@texi2html_options) {
    #set_from_init_file($option->[0], $option->[1]);
    #$converter_default_options->{$option->[0]} = $option->[1];
    #no warnings 'once';
    if (exists($Texinfo::Convert::HTML::defaults{$option->[0]})) {
      $Texinfo::Convert::HTML::defaults{$option->[0]} = $option->[1];
    } else {# (exists($Texinfo::Convert::Converter::all_converters_defaults{$option->[0]})) {
      no warnings 'once';
      $Texinfo::Convert::Converter::all_converters_defaults{$option->[0]} = $option->[1];
    }
  }
}

sub _get_converter_default($)
{
  my $option = shift;
  return $Texinfo::Convert::Converter::all_converters_defaults{$option}
   if (defined($Texinfo::Convert::Converter::all_converters_defaults{$option}));
  return undef;
}

sub makeinfo_help()
{
  my $makeinfo_help =
    sprintf(__("Usage: %s [OPTION]... TEXINFO-FILE...\n"), $real_command_name)
."\n".
__("Translate Texinfo source documentation to various other formats, by default
Info files suitable for reading online with Emacs or standalone GNU Info.\n")
."\n";
  $makeinfo_help .= sprintf(__("General options:
      --error-limit=NUM       quit after NUM errors (default %d).
      --document-language=STR locale to use in translating Texinfo keywords
                                for the output document (default C).
      --force                 preserve output even if errors.
      --help                  display this help and exit.
      --no-validate           suppress node cross-reference validation.
      --no-warn               suppress warnings (but not errors).
      --conf-dir=DIR          search also for initialization files in DIR.
      --init-file=FILE        load FILE to modify the default behavior.
      --set-init-variable VAR=VAL  set configuration variable VAR to VAL.
  -v, --verbose               explain what is being done.
      --version               display version information and exit.\n"), get_conf('ERROR_LIMIT'))
."\n";
  $makeinfo_help .= __("Output format selection (default is to produce Info):
      --docbook               output Docbook XML rather than Info.
      --html                  output HTML rather than Info.
      --plaintext             output plain text rather than Info.
      --xml                   output Texinfo XML rather than Info.
      --dvi, --ps, --pdf      call texi2dvi to generate specified output.\n")

."\n";
  $makeinfo_help .= __("General output options:
  -E, --macro-expand=FILE     output macro-expanded source to FILE,
                                ignoring any \@setfilename.
      --no-headers            suppress node separators, Node: lines, and menus
                                from Info output (thus producing plain text)
                                or from HTML (thus producing shorter output).
                                Also, if producing Info, write to
                                standard output by default 
      --no-split              suppress any splitting of the output;
                                generate only one output file.
      --[no-]number-sections  output chapter and sectioning numbers;
                                default is on.
  -o, --output=DEST           output to DEST.
                                With split output, create DEST as a directory
                                 and put the output files there.
                                With non-split output, if DEST is already
                                 a directory or ends with a /,
                                 put the output file there.
                                Otherwise, DEST names the output file.\n")
."\n";
  $makeinfo_help .= sprintf(__("Options for Info and plain text:
      --disable-encoding      do not output accented and special characters
                                in Info output based on \@documentencoding.
      --enable-encoding       override --disable-encoding (default).
      --fill-column=NUM       break Info lines at NUM characters (default %d).
      --footnote-style=STYLE  output footnotes in Info according to STYLE:
                                `separate' to put them in their own node;
                                `end' to put them at the end of the node, in
                                which they are defined (this is the default).
      --paragraph-indent=VAL  indent Info paragraphs by VAL spaces (default %d).
                                If VAL is `none', do not indent; if VAL is
                                `asis', preserve existing indentation.
      --split-size=NUM        split Info files at size NUM (default %d).\n"),
    _get_converter_default('fillcolumn'), 
    _get_converter_default('paragraphindent'), 
    _get_converter_default('SPLIT_SIZE'))
."\n";
  $makeinfo_help .= __("Options for HTML:
      --css-include=FILE      include FILE in HTML <style> output;
                                read stdin if FILE is -.
      --css-ref=URL           generate CSS reference to URL.
      --internal-links=FILE   produce list of internal links in FILE.
      --split=SPLIT           split at SPLIT, where SPLIT may be `chapter',
                                `section' or `node'.
      --transliterate-file-names  use file names in ASCII transliteration.
      --node-files            produce redirection files for nodes and 
                                anchors; default is set only if split.\n")
."\n";
  $makeinfo_help .= __("Options for XML and Docbook:
      --output-indent=VAL     does nothing, retained for compatibility.\n")
."\n";
  $makeinfo_help .= __("Options for DVI/PS/PDF:
      --Xopt=OPT              pass OPT to texi2dvi; can be repeated.\n")
."\n";
  $makeinfo_help .= __("Input file options:
      --commands-in-node-names  does nothing, retained for compatibility.
  -D VAR                        define the variable VAR, as with \@set.
  -I DIR                        append DIR to the \@include search path.
  -P DIR                        prepend DIR to the \@include search path.
  -U VAR                        undefine the variable VAR, as with \@clear.\n")
."\n";
  $makeinfo_help .= __("Conditional processing in input:
  --ifdocbook       process \@ifdocbook and \@docbook even if
                      not generating Docbook.
  --ifhtml          process \@ifhtml and \@html even if not generating HTML.
  --ifinfo          process \@ifinfo even if not generating Info.
  --ifplaintext     process \@ifplaintext even if not generating plain text.
  --iftex           process \@iftex and \@tex.
  --ifxml           process \@ifxml and \@xml.
  --no-ifdocbook    do not process \@ifdocbook and \@docbook text.
  --no-ifhtml       do not process \@ifhtml and \@html text.
  --no-ifinfo       do not process \@ifinfo text.
  --no-ifplaintext  do not process \@ifplaintext text.
  --no-iftex        do not process \@iftex and \@tex text.
  --no-ifxml        do not process \@ifxml and \@xml text.

  Also, for the --no-ifFORMAT options, do process \@ifnotFORMAT text.\n")
."\n";
  $makeinfo_help .= __("  The defaults for the \@if... conditionals depend on the output format:
  if generating HTML, --ifhtml is on and the others are off;
  if generating Info, --ifinfo is on and the others are off;
  if generating plain text, --ifplaintext is on and the others are off;
  if generating XML, --ifxml is on and the others are off.\n")
."\n";
  $makeinfo_help .= __("Examples:
  makeinfo foo.texi                      write Info to foo's \@setfilename
  makeinfo --html foo.texi               write HTML to \@setfilename
  makeinfo --xml foo.texi                write Texinfo XML to \@setfilename
  makeinfo --docbook foo.texi            write DocBook XML to \@setfilename
  makeinfo --no-headers foo.texi         write plain text to standard output

  makeinfo --html --no-headers foo.texi  write html without node lines, menus
  makeinfo --number-sections foo.texi    write Info with numbered sections
  makeinfo --no-split foo.texi           write one Info file however big\n")
."\n";
  $makeinfo_help .= __("Email bug reports to bug-texinfo\@gnu.org,
general questions and discussion to help-texinfo\@gnu.org.
Texinfo home page: http://www.gnu.org/software/texinfo/") ."\n";
  return $makeinfo_help;
}

my $result_options = Getopt::Long::GetOptions (
 'help|h' => sub { print makeinfo_help(); exit 0; },
 'version|V' => sub {print "$real_command_name (GNU texinfo) $configured_version\n\n";
    printf __("Copyright (C) %s Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.\n"), '2011';
      exit 0;},
 'macro-expand|E=s' => sub { push @texi2dvi_args, '-E'; 
                             set_from_cmdline('MACRO_EXPAND', $_[1]); },
 'ifhtml!' => sub { set_expansion('html', $_[1]); },
 'ifinfo!' => sub { set_expansion('info', $_[1]); },
 'ifxml!' => sub { set_expansion('xml', $_[1]); },
 'ifdocbook!' => sub { set_expansion('docbook', $_[1]); },
 'iftex!' => sub { set_expansion('tex', $_[1]); },
 'ifplaintext!' => sub { set_expansion('plaintext', $_[1]); },
 'I=s' => sub { push @texi2dvi_args, ('-'.$_[0], $_[1]);
                push @include_dirs, split(/$quoted_path_separator/, $_[1]); },
 'conf-dir=s' => sub { push @conf_dirs, split(/$quoted_path_separator/, $_[1]); },
 'P=s' => sub { unshift @prepend_dirs, split(/$quoted_path_separator/, $_[1]); },
 'number-sections!' => sub { set_from_cmdline('NUMBER_SECTIONS', $_[1]); },
 'number-footnotes!' => sub { set_from_cmdline('NUMBER_FOOTNOTES', $_[1]); },
 'node-files!' => sub { set_from_cmdline('NODE_FILES', $_[1]); },
 'footnote-style=s' => sub {
    if ($_[1] eq 'end' or $_[1] eq 'separate') {
       set_from_cmdline('footnotestyle', $_[1]);
    } else {
      die sprintf(__("%s: --footnote-style arg must be `separate' or `end', not `%s'.\n"), $real_command_name, $_[1]);
    }
  },
 'split=s' => sub { set_from_cmdline('SPLIT', $_[1]); },
 'no-split' => sub { set_from_cmdline('SPLIT', ''); 
                     set_from_cmdline('SPLIT_SIZE', undef);},
 'headers!' => sub { set_from_cmdline('HEADERS', $_[1]);
                     set_from_cmdline('SHOW_MENU', $_[1]);
                     $format = 'plaintext' if (!$_[1] and $format eq 'info'); },
 'output|out|o=s' => sub { 
    my $var = 'OUTFILE';
    if ($_[1] =~ m:/$: or -d $_[1]) {
      $var = 'SUBDIR';
    }
    set_from_cmdline($var, $_[1]);
    set_from_cmdline('OUT', $_[1]);
    push @texi2dvi_args, '-o', $_[1];
  },
 'no-validate|no-pointer-validate' => sub {
      set_from_cmdline('novalidate',$_[1]);
      $parser_default_options->{'novalidate'} = $_[1];
    },
 'no-warn' => sub { set_from_cmdline('NO_WARN', $_[1]); },
 # FIXME pass to parser? What could it mean in parser?
 'verbose|v' => sub {set_from_cmdline('VERBOSE', $_[1]); 
                     push @texi2dvi_args, '--verbose'; },
 'document-language=s' => sub {
                      set_from_cmdline('documentlanguage', $_[1]); 
                      $parser_default_options->{'documentlanguage'} = $_[1];
                      my @messages 
                       = Texinfo::Common::warn_unknown_language($_[1], \&__);
                      foreach my $message (@messages) {
                        document_warn($message);
                      }
                    },
 'D=s' => sub {$parser_default_options->{'values'}->{$_[1]} = 1;},
 'U=s' => sub {delete $parser_default_options->{'values'}->{$_[1]};},
 'init-file=s' => sub {
    my $file = locate_init_file($_[1], [ @conf_dirs, @program_init_dirs ], 0);
    if (defined($file)) {
      Texinfo::Config::_load_init_file($file);
    } else {
      document_warn (sprintf(__("Can't read init file %s"), $_[1]));
    }
 },
 'set-init-variable=s' => sub {
   my $var_val = $_[1];
   if ($var_val =~ s/^(\w+)\s*=?\s*//) {
     my $var = $1;
     my $value = $var_val;
     if ($value =~ /^undef$/i) {
       $value = undef;
     }
     # special case, this is a pseudo format for debug
     if ($var eq 'DEBUGCOUNT') {
       $format = 'debugcount';
     } elsif ($var eq 'TEXI2HTML') {
       $format = set_format('html');
       _set_variables_texi2html();
       $parser_default_options->{'values'}->{'texi2html'} = 1;
     } elsif ($var eq 'DEBUGTREE') {
       $format = 'debugtree';
     } else {
       set_from_cmdline ($var, $value);
     # this is very wrong, but a way to avoid a spurious warning.
      # no warnings 'once';
      # if (set_from_cmdline ($var, $value) 
      #     and exists($Texinfo::Parser::default_configuration{$var})) {
      #   $parser_default_options->{$var} = $value;
      # }
     }
   }
 },
 'css-include=s' => \@css_files,
 'css-ref=s' => \@css_refs,
 'transliterate-file-names!' => 
     sub {set_from_cmdline ('TRANSLITERATE_FILE_NAMES', $_[1]);},
 'error-limit|e=i' => sub { set_from_cmdline('ERROR_LIMIT', $_[1]); },
 'split-size=s' => sub {set_from_cmdline('SPLIT_SIZE', $_[1])},
 'paragraph-indent|p=s' => sub {
    my $value = $_[1];
    if ($value =~ /^([0-9]+)$/ or $value eq 'none' or $value eq 'asis') {
      set_from_cmdline('paragraphindent', $_[1]);
    } else {
      die sprintf(__("%s: --paragraph-indent arg must be numeric/`none'/`asis', not `%s'.\n"), 
                  $real_command_name, $value);
    }
 },
 'fill-column|f=i' => sub {set_from_cmdline('FILLCOLUMN',$_[1]);},
 'enable-encoding' => sub {set_from_cmdline('ENABLE_ENCODING',$_[1]);
                     $parser_default_options->{'ENABLE_ENCODING'} = $_[1];},
 'disable-encoding' => sub {set_from_cmdline('ENABLE_ENCODING', 0);
                     $parser_default_options->{'ENABLE_ENCODING'} = 0;},
 'internal-links=s' => sub {set_from_cmdline('INTERNAL_LINKS', $_[1]);},
 'force|F' => sub {set_from_cmdline('FORCE', $_[1]);},
 'commands-in-node-names' => sub { ;},
 'output-indent=i' => sub { ;},
 'reference-limit=i' => sub { ;},
 'Xopt' => \@texi2dvi_args,
 'batch' => sub {set_from_cmdline('BATCH', $_[1]); 
                 push @texi2dvi_args, '--'.$_[0];},
 'silent|quiet' => sub {set_from_cmdline('SILENT', $_[1]);
                         push @texi2dvi_args, '--'.$_[0];},
   
 'plaintext' => sub {$format = $_[0]; 
                     set_from_cmdline('SHOW_MENU', 0);
 },
 'html' => sub {$format = set_format($_[0]);},
 'info' => sub {$format = set_format($_[0]);},
 'docbook' => sub {$format = set_format($_[0]);
                   set_from_cmdline('SHOW_MENU', 0)},
 'xml' => sub {$format = set_format($_[0]);},
 'dvi' => sub {$format = set_texi2dvi_format($_[0]);},
 'ps' => sub {$format = set_texi2dvi_format($_[0]);},
 'pdf' => sub {$format = set_texi2dvi_format($_[0]);},
 'debug=i' => sub {set_from_cmdline('DEBUG', $_[1]); 
                   $parser_default_options->{'DEBUG'} = $_[1];
                   push @texi2dvi_args, '--'.$_[0]; },
);

exit 1 if (!$result_options);

my %formats_table = (
 'info' => {
             'nodes_tree' => 1,
             'floats' => 1,
             'converter' => sub{Texinfo::Convert::Info->converter(@_)},
           },
  'plaintext' => {
             'nodes_tree' => 1,
             'floats' => 1,
             'converter' => sub{Texinfo::Convert::Plaintext->converter(@_)},
           },
  'html' => {
             'nodes_tree' => 1,
             'floats' => 1,
             'split' => 1,
             'internal_links' => 1,
             'simple_menu' => 1,
             'converter' => sub{Texinfo::Convert::HTML->converter(@_)},
           },
  'xml' => {
             'nodes_tree' => 1,
             'converter' => sub{Texinfo::Convert::XML->converter(@_)},
           },
  'docbook' => {
             'converter' => sub{Texinfo::Convert::DocBook->converter(@_)},
           },
  'pdf' => {
             'texi2dvi_format' => 1,
           },
  'ps' =>  {
             'texi2dvi_format' => 1,
           },
  'dvi' => {
             'texi2dvi_format' => 1,
           },
  'debugcount' => {
             'nodes_tree' => 1,
             'floats' => 1,
             'converter' => sub{DebugTexinfo::DebugCount->converter(@_)},
           },
  'debugtree' => {
     'split' => 1,
     'converter' => sub{DebugTexinfo::DebugTree->converter(@_)},
  },
);

if (!$format_from_command_line and defined($ENV{'TEXINFO_OUTPUT_FORMAT'}) 
    and $ENV{'TEXINFO_OUTPUT_FORMAT'} ne '') {
  if (!$formats_table{$ENV{'TEXINFO_OUTPUT_FORMAT'}}) {
    warn sprintf(__("%s: Ignoring unrecognized TEXINFO_OUTPUT_FORMAT value `%s'.\n"), 
                 $real_command_name, $ENV{'TEXINFO_OUTPUT_FORMAT'});
  } else {
    if ($formats_table{$ENV{'TEXINFO_OUTPUT_FORMAT'}}->{'texi2dvi_format'}) {
      $format = set_texi2dvi_format($ENV{'TEXINFO_OUTPUT_FORMAT'});
    } else {
      $format = set_format($ENV{'TEXINFO_OUTPUT_FORMAT'});
    }
  }
}

if ($call_texi2dvi) {
  if (defined(get_conf('OUT')) and @ARGV > 1) {
    die sprintf(__('when generating %s, only one input FILE may be specified with -o'),
                $format);
  }
  if (get_conf('DEBUG') or get_conf('VERBOSE')) {
    print STDERR "".join('|', (get_conf('TEXI2DVI'), @texi2dvi_args,  @ARGV)) 
       ."\n";
  }
  exec { get_conf('TEXI2DVI') } (@texi2dvi_args,  @ARGV);
}

if (get_conf('SPLIT') and !$formats_table{$format}->{'split'}) {
  document_warn (sprintf(__('Ignoring splitting for format %s'), $format));
  set_from_cmdline('SPLIT', ''); 
  #set_from_cmdline('FRAMES', 0); 
}

foreach my $format (@{$default_expanded_format}) {
  push @{$parser_default_options->{'expanded_formats'}}, $format 
    unless (grep {$_ eq $format} @{$parser_default_options->{'expanded_formats'}});
}

# FIXME should this be set when the --set is set too?  The corresponding
# code is ready above, but commented out.
foreach my $parser_settable_option ('TOP_NODE_UP', 'MAX_MACRO_CALL_NESTING',
                                    'INLINE_INSERTCOPYING', 'SHOW_MENU',
                                    'IGNORE_BEFORE_SETFILENAME', 'TEST') {
  $parser_default_options->{$parser_settable_option} = get_conf($parser_settable_option) 
    if (defined(get_conf($parser_settable_option)));
}


# Main processing, process all the files given on the command line

my @input_files = @ARGV;
# use STDIN if not a tty, like makeinfo does
@input_files = ('-') if (!scalar(@input_files) and !-t STDIN);
die sprintf(__("%s: missing file argument.\n"), $real_command_name) 
   .sprintf(__("Try `%s --help' for more information.\n"), $real_command_name)
     unless (scalar(@input_files) >= 1);

my $file_number = -1;
# main processing
while(@input_files)
{
  $file_number++;
  my $input_file_arg = shift(@input_files);
  my $input_file_name;
  # try to concatenate with different suffixes. The last suffix is ''
  # such that the plain file name is checked.
  foreach my $suffix (@input_file_suffixes) {
    $input_file_name = $input_file_arg.$suffix if (-e $input_file_arg.$suffix);
  }
  # in case no file was found, still set the file name
  $input_file_name = $input_file_arg if (!defined($input_file_name));

  my $input_directory = '.';
  if ($input_file_name =~ /(.*\/)/) {
    $input_directory = $1;
  }

  my $input_file_base = $input_file_name;
  $input_file_base =~ s/\.te?x(i|info)?$//;

  my @htmlxref_dirs = @language_config_dirs;
  if ($input_directory ne '.' and $input_directory ne '') {
    unshift @htmlxref_dirs, $input_directory;
  }
  unshift @htmlxref_dirs, '.';
  my @texinfo_htmlxref_files 
      = locate_init_file ($texinfo_htmlxref, \@htmlxref_dirs, 1);

  my $parser_options = { %$parser_default_options };

  $parser_options->{'include_directories'} = [@include_dirs];
  my @prependended_include_directories = ('.');
  push @prependended_include_directories, $input_directory
      if ($input_directory ne '.');
  unshift @{$parser_options->{'include_directories'}},
     @prependended_include_directories;
  unshift @{$parser_options->{'include_directories'}}, @prepend_dirs;

  my $parser = Texinfo::Parser::parser($parser_options);
  my $tree = $parser->parse_texi_file($input_file_name);

  my $error_count = 0;
  if (!defined($tree)) {
    handle_errors($parser, $error_count);
    next;
  }

  if (defined(get_conf('DUMP_TREE'))) {
    # this is very wrong, but a way to avoid a spurious warning.
    no warnings 'once';
    local $Data::Dumper::Purity = 1;
    no warnings 'once';
    local $Data::Dumper::Indent = 1;
    print STDERR Data::Dumper->Dump([$tree]);
  }

  if (defined(get_conf('MACRO_EXPAND'))) {
    my $texinfo_text = Texinfo::Convert::Texinfo::convert ($tree);
    #print STDERR "$texinfo_text\n";
    my $macro_expand_file = get_conf('MACRO_EXPAND');
    my $macro_expand_fh = Texinfo::Common::open_out({}, $macro_expand_file,
                                               $parser->{'perl_encoding'});
    if (defined ($macro_expand_fh)) {
      print $macro_expand_fh $texinfo_text;
      close ($macro_expand_fh);
    } else {
      warn (sprintf(__("Could not open %s for writing: %s\n"), 
                    $macro_expand_file, $!));
      $error_count++;
      exit (1) if ($error_count and (!get_conf('FORCE')
         or $error_count > get_conf('ERROR_LIMIT')));
    }
  }
  if (get_conf('DUMP_TEXI')) {
    handle_errors($parser, $error_count);
    next;
  }
  Texinfo::Structuring::associate_internal_references($parser);
  # every format needs the sectioning structure
  # FIXME this adjusts the level of sectioning commands.  Maybe should be
  # done before dumping the tree?
  my $structure = Texinfo::Structuring::sectioning_structure($parser, $tree);
  # this can be done for every format, since information is already gathered
  my $floats = $parser->floats_information();

  my $top_node;
  if ($formats_table{$format}->{'nodes_tree'}) {
    $top_node = Texinfo::Structuring::nodes_tree($parser);
  }
  if ($formats_table{$format}->{'floats'}) {
    Texinfo::Structuring::number_floats($floats);
  }
  $error_count = handle_errors($parser, $error_count);
  if (get_conf('SIMPLE_MENU')
      and $formats_table{$format}->{'simple_menu'}) {
    $parser->Texinfo::Structuring::set_menus_to_simple_menu();
  }

  my $converter_options = { %$converter_default_options, 
                            %$cmdline_options,
                            %$Texinfo::Config::options };

  if (defined(get_conf('OUTFILE')) and $file_number == 0) {
    $converter_options->{'OUTFILE'} = get_conf('OUTFILE');
  }
  $converter_options->{'parser'} = $parser;
  $converter_options->{'output_format'} = $format;
  $converter_options->{'htmlxref_files'} = \@texinfo_htmlxref_files;
  my $converter = &{$formats_table{$format}->{'converter'}}($converter_options);
  $converter->output($tree);
  handle_errors($converter, $error_count);
  if (defined(get_conf('INTERNAL_LINKS')) and $file_number == 0
      and $formats_table{$format}->{'internal_links'}) {
    my $internal_links_file = get_conf('INTERNAL_LINKS');
    my $internal_links_fh = Texinfo::Common::open_out({}, $internal_links_file,
                                               $parser->{'perl_encoding'});
    if (defined ($internal_links_fh)) {
      # FIXME no possibility of configuration?
      Texinfo::Structuring::output_internal_links($converter, 
                                                  $internal_links_fh);
      close ($internal_links_fh);
    } else {
      warn (sprintf(__("Could not open %s for writing: %s\n"), 
                    $internal_links_file, $!));
      $error_count++;
      exit (1) if ($error_count and (!get_conf('FORCE')
         or $error_count > get_conf('ERROR_LIMIT')));
    }
  }
}

