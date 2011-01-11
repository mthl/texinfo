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

foreach my $texinfo_config_dir (@language_config_dirs) {
  push @program_init_dirs, "${texinfo_config_dir}/init";
}

my @input_file_suffixes = ('.txi','.texinfo','.texi','.txinfo','');

my @texi2dvi_args = ();

my $macro_expand = undef;
my $option_force = 0;
my $option_error_limit = 100;
my $option_no_warn = 0;
my $format = 'info';
my $converter_default_options = {};


my $result_options = Getopt::Long::GetOptions (
 'macro-expand|E=s' => sub {push @texi2dvi_args, '-E'; $macro_expand = $_[1]; },
 'error-limit|e=i' => \$option_error_limit,
 'no-warn' => \$option_no_warn,
);

my %formats_table = (
 'info' => { 'nodes_tree' => 1,
             'floats' => 1,
             'converter' => sub{Texinfo::Convert::Info->converter(@_)},
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
                                           or !$option_no_warn);
  }
  
  exit (1) if ($error_count and (!$option_force
     or $error_count > $option_error_limit));
  return $error_count;
}

my $file_number = 0;
# main processing
while(@input_files)
{
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

  my $parser = Texinfo::Parser::parser({'gettext' => \&__});
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
      exit (1) if ($error_count and (!$option_force
         or $error_count > $option_error_limit));
    }
  }
  $file_number++;
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

  my $converter_options = { %$converter_default_options };
  $converter_options->{'parser'} = $parser;
  my $converter = &{$formats_table{$format}->{'converter'}}($converter_options);
  $converter->convert($tree);
  handle_errors($converter, $error_count);
}

