#! /usr/bin/perl -w

# texi2any: Texinfo converter.
#
# Copyright 2010 Free Software Foundation, Inc.
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
# for dirname.
use File::Basename;
#use Cwd;
use Getopt::Long qw(GetOptions);

Getopt::Long::Configure("gnu_getopt");

use Texinfo::Convert::Texinfo;

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

sub __($) {
  my $msgid = shift;
  return Locale::Messages::dgettext($messages_textdomain, $msgid);
}

sub __p($$) {
  my $context = shift;
  my $msgid = shift;
  return Locale::Messages::dpgettext($messages_textdomain, $context, $msgid);
}

# FIXME use something else than srcdir?
my $srcdir = defined $ENV{'srcdir'} ? $ENV{'srcdir'} : dirname $0;
# FIXME
$srcdir = "$srcdir/../texi2html";
if ($0 =~ /\.pl$/) {
  unshift @INC, "$srcdir/lib/libintl-perl/lib";
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
  unshift @INC, "$srcdir/lib/Unicode-EastAsianWidth/lib";
} elsif ('@USE_EXTERNAL_EASTASIANWIDTH@' ne 'yes') {
  unshift @INC, "$pkgdatadir/lib/Unicode-EastAsianWidth/lib";
} else {
  eval { require Unicode::EastAsianWidth; };
  if ($@) {
    unshift @INC, "$pkgdatadir/lib/Unicode-EastAsianWidth/lib";
  }
}
require Unicode::EastAsianWidth;

# This is done at runtime because the modules are also found at runtime.
require Texinfo::Parser;
require Texinfo::Structuring;
require Texinfo::Convert::Info;

# determine configuration directories.

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

# Namespace for configuration
{
package Texinfo::Config;

my @document_settable_at_commands =
       ('everyheading', 'everyfooting', 'evenheading',
        'evenfooting', 'oddheading', 'oddfooting', 'headings',
        'allowcodebreaks', 'frenchspacing', 'exampleindent',
        'firstparagraphindent', 'paragraphindent', 'clickstyle',
        'documentlanguage');

# those should be unique
my @document_global_at_commands = ('contents', 'shortcontents',
        'setcontentsaftertitlepage', 'setshortcontentsaftertitlepage',
        'footnotestyle', 'novalidate', 'kbdinputstyle', 'documentencoding',
        'setfilename', 'today', 'documentdescription',
        'everyheadingmarks','everyfootingmarks',
        'evenheadingmarks','oddheadingmarks','evenfootingmarks','oddfootingmarks',
        'fonttextsize', 'pagesizes', 'setchapternewpage'
        );


my @command_line_settables = ('FILLCOLUMN', 'SPLIT', 'SPLIT_SIZE',
  'HEADERS',
  'MACRO_EXPAND', 'NUMBER_SECTIONS',
  'NUMBER_FOOTNOTES', 'NODE_FILES',
  'NO_WARN', 'VERBOSE',
  'TRANSLITERATE_FILE_NAMES', 'ERROR_LIMIT', 'ENABLE_ENCODING',
  'FORCE', 'INTERNAL_LINKS', 'OUTFILE', 'SUBDIR', 'OUT',
  'BATCH', 'SILENT'
);

# FIXME TOP_HEADING_AT_BEGINNING seems to be a no-op
my @variable_settables = (
  'DEBUG', 'FRAMES', 'FRAMESET_DOCTYPE', 'DOCTYPE', 'TEST', 'DUMP_TEXI',
  'TOP_FILE', 'TOC_FILE', 'SHOW_MENU', 'USE_NODES', 'TOC_LINKS', 'SHORTEXTN',
  'PREFIX', 'SHORT_REF', 'IDX_SUMMARY', 'DEF_TABLE', 'L2H', 'MONOLITHIC',
  'L2H_L2H', 'L2H_SKIP', 'L2H_TMP', 'L2H_FILE', 'L2H_CLEAN',
  'L2H_HTML_VERSION', 'IGNORE_PREAMBLE_TEXT', 'EXTERNAL_DIR', 'USE_ISO',
  'SPLIT_INDEX', 'IN_ENCODING', 'USE_NLS',
  'VERTICAL_HEAD_NAVIGATION', 'INLINE_CONTENTS', 'NODE_FILE_EXTENSION',
  'NO_CSS', 'INLINE_CSS_STYLE', 'USE_SECTIONS', 'USE_TITLEPAGE_FOR_TITLE',
  'SIMPLE_MENU', 'EXTENSION', 'INLINE_INSERTCOPYING', 'USE_NUMERIC_ENTITY',
  'I18N_PERL_HASH', 'ENABLE_ENCODING_USE_ENTITY', 'ICONS', 'USE_UNICODE',
  'USE_UNIDECODE', 'DATE_IN_HEADER', 'OPEN_QUOTE_SYMBOL',
  'CLOSE_QUOTE_SYMBOL', 'TOP_NODE_UP', 'TOP_NODE_FILE',
  'TOP_NODE_FILE_TARGET', 'SHOW_TITLE', 'WORDS_IN_PAGE',
  'HEADER_IN_TABLE', 'USE_ACCESSKEY', 'USE_REL_REV', 'USE_LINKS',
  'OVERVIEW_LINK_TO_TOC', 'AVOID_MENU_REDUNDANCY', 'NODE_NAME_IN_MENU',
  'NODE_NAME_IN_INDEX', 'USE_SETFILENAME', 'USE_SETFILENAME_EXTENSION',
  'COMPLEX_FORMAT_IN_TABLE',
  'USE_UP_FOR_ADJACENT_NODES', 'TOP_HEADING_AT_BEGINNING',
  'SEPARATE_DESCRIPTION', 'IGNORE_BEFORE_SETFILENAME',
  'COMPLETE_IMAGE_PATHS', 'USE_NODE_TARGET', 'NEW_CROSSREF_STYLE',
  'PROGRAM_NAME_IN_FOOTER', 'NODE_FILENAMES', 'DEFAULT_ENCODING',
  'OUT_ENCODING', 'ENCODING_NAME', 'EXTERNAL_CROSSREF_SPLIT', 'BODYTEXT',
  'CSS_LINES', 'RENAMED_NODES_REDIRECTIONS', 'RENAMED_NODES_FILE',
  'TEXI2DVI');

my %valid_options;
foreach my $var (@document_settable_at_commands, @document_global_at_commands,
         @command_line_settables, @variable_settables) {
  $valid_options{$var} = 1;
}


my $cmdline_options;
our $options = {};

sub _load_config ($) {
  $cmdline_options = $_[0];
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
  if (!$valid_options{$var}) {
    warn (sprintf(__('Unknown variable %s'), $var));
    return 0;
  }
  return 0 if (defined($cmdline_options->{$var}));
  $options->{$var} = $value;
  return 1;
}

sub set_from_cmdline ($$) {
  my $var = shift;
  my $value = shift;
  delete $options->{$var};
  if (!$valid_options{$var}) {
    warn (sprintf(main::__('Unknown variable %s'), $var));
    return 0;
  }
  $cmdline_options->{$var} = $value;
  return 1;
}

# FIXME also get @-command results?
sub get_conf($) {
  my $var = shift;
  if (exists($cmdline_options->{$var})) {
    return $cmdline_options->{$var};
  } elsif (exists($options->{$var})) {
    return $options->{$var};
  } else {
    return undef;
  }
}

}

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

sub get_conf ($) {
  return &Texinfo::Config::get_conf(@_);
}

my @input_file_suffixes = ('.txi','.texinfo','.texi','.txinfo','');

my @texi2dvi_args = ();

my $macro_expand = undef;
my $format = 'info';
# this is the format associated with the output format, which is replaced
# when the output format changes.  It may also be removed if there is the
# corresponding --no-ifformat.
my $default_expanded_format = [ $format ];
my @conf_dirs = ();
my @include_dirs = ();
my @prepend_dirs = ();
my @css_files = ();
my @css_refs = ();

my $converter_default_options = {};
my $parser_default_options = {'expanded_formats' => [], 'values' => {}};

Texinfo::Config::_load_config($converter_default_options);

sub set_expansion($$) {
  my $region = shift;
  my $set = shift;
  $set = 1 if (!defined($set));
  if ($set) {
    push @{$parser_default_options->{'expanded_formats'}}, $region
      unless (grep {$_ eq $region} @{$parser_default_options->{'expanded_formats'}})
  } else {
    @{$parser_default_options->{'expanded_formats'}} = 
      grep {$_ ne $region} @{$parser_default_options->{'expanded_formats'}};
    grep {$_ ne $region} @{$default_expanded_format};
  }
}

sub document_warn ($) {
  return if (get_conf('NO_WARN'));
  my $text = shift;
  chomp ($text);
  warn sprintf(__p("warning: warning_message", "warning: %s\n"), $text);
}

my $result_options = Getopt::Long::GetOptions (
 'macro-expand|E=s' => sub { push @texi2dvi_args, '-E'; 
                             $macro_expand = $_[1]; },
 'ifhtml' => sub { set_expansion('html', $_[1]); },
 'ifinfo' => sub { set_expansion('info', $_[1]); },
 'ifxml' => sub { set_expansion('xml', $_[1]); },
 'ifdocbook' => sub { set_expansion('docbook', $_[1]); },
 'iftex' => sub { set_expansion('tex', $_[1]); },
 'ifplaintext' => sub { set_expansion('plaintext', $_[1]); },
 'I=s' => sub { push @texi2dvi_args, ('-'.$_[0], $_[1]);
                push @include_dirs, split(/$quoted_path_separator/, $_[1]); },
 'conf-dir=s' => sub { push @conf_dirs, split(/$quoted_path_separator/, $_[1]); },
 'P=s' => sub { unshift @prepend_dirs, split(/$quoted_path_separator/, $_[1]); },
 'number-sections' => sub { set_from_cmdline('NUMBER_SECTIONS', $_[1]); },
 'number-footnotes' => sub { set_from_cmdline('NUMBER_FOOTNOTES', $_[1]); },
 'node-files' => sub { set_from_cmdline('NODE_FILES', $_[1]); },
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
 'headers' => sub { set_from_cmdline('HEADERS', $_[1]);
                    set_from_cmdline('SHOW_MENU', $_[1]);
                    $parser_default_options->{'SHOW_MENU'} = $_[1];
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
 # FIXME pass to parser? What could it mean in parser?
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
     if (set_from_cmdline ($var, $value) 
         and exists($Texinfo::Parser::default_configuration{$var})) {
       $parser_default_options->{$var} = $value;
     }
   }
 },
 'css-include=s' => \@css_files,
 'css-ref=s' => \@css_refs,
 'transliterate-file-names' => 
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
   
 'plaintext' => sub {$format = $_[0];},
 'html' => sub {$format = $_[0];},
 'info' => sub {$format = $_[0];},
 'docbook' => sub {$format = $_[0];},
 'xml' => sub {$format = $_[0];},
 'dvi' => sub {$format = $_[0]; push @texi2dvi_args, '--'.$_[0];},
 'ps' => sub {$format = $_[0]; push @texi2dvi_args, '--'.$_[0];},
 'pdf' => sub {$format = $_[0]; push @texi2dvi_args, '--'.$_[0];},
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
);

# Main processing, process all the files given on the command line

my $failure_text =  sprintf(__("Try `%s --help' for more information.\n"), 
                            $real_command_name);
my @input_files = @ARGV;
# use STDIN if not a tty, like makeinfo does
@input_files = ('-') if (!scalar(@input_files) and !-t STDIN);
die sprintf(__("%s: missing file argument.\n"), $real_command_name) 
   .$failure_text unless (scalar(@input_files) >= 1);

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

  my $parser_options = { %$parser_default_options };

  $parser_options->{'include_directories'} = [@include_dirs];
  my @prependended_include_directories = ('.');
  push @prependended_include_directories, $input_directory
      if ($input_directory ne '.');
  unshift @{$parser_options->{'include_directories'}}, @prependended_include_directories;
  unshift @{$parser_options->{'include_directories'}}, @prepend_dirs;

  $parser_options->{'gettext'} = \&__;

  my $parser = Texinfo::Parser::parser($parser_options);
  my $tree = $parser->parse_texi_file($input_file_name);

  my $error_count = 0;
  if (!defined($tree)) {
    handle_errors($parser, $error_count);
    next;
  }
  if (defined($macro_expand)) {
    my $texinfo_text = Texinfo::Convert::Texinfo::convert ($tree);
    #print STDERR "$texinfo_text\n";
    my $macro_expand_fh = Texinfo::Common::open_out({}, $macro_expand,
                                               $parser->{'encoding'});
    if (defined ($macro_expand_fh)) {
      print $macro_expand_fh $texinfo_text;
      close ($macro_expand_fh);
    } else {
      warn (sprintf(__("Could not open %s for writing: %s\n"), 
                    $macro_expand, $!));
      $error_count++;
      exit (1) if ($error_count and (!get_conf('FORCE')
         or $error_count > get_conf('ERROR_LIMIT')));
    }
  }
  # every format needs the sectioning structure
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

  my $converter_options = { %$converter_default_options, 
                            %$Texinfo::Config::options };
  if (defined(get_conf('OUTFILE')) and $file_number == 0) {
    $converter_options->{'OUTFILE'} = get_conf('OUTFILE');
  }
  $converter_options->{'parser'} = $parser;
  my $converter = &{$formats_table{$format}->{'converter'}}($converter_options);
  $converter->output($tree);
  handle_errors($converter, $error_count);
}

