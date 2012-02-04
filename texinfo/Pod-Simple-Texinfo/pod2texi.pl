#! /usr/bin/perl -w

# pod2texi: Convert Pod to Texinfo
#
# Copyright 2012 Free Software Foundation, Inc.
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

use strict;
use Getopt::Long qw(GetOptions);

Getopt::Long::Configure("gnu_getopt");

BEGIN
{
  if ('@datadir@' ne '@' . 'datadir@') {
    my $pkgdatadir = eval '"@datadir@/@PACKAGE@"';
    my $datadir = eval '"@datadir@"';
    unshift @INC, ("$pkgdatadir/Pod-Simple-Texinfo",
        "$pkgdatadir",
        "$pkgdatadir/lib/libintl-perl/lib", 
        "$pkgdatadir/lib/Unicode-EastAsianWidth/lib",
        "$pkgdatadir/lib/Text-Unidecode/lib");
  }
}
use Pod::Simple::Texinfo;
use Texinfo::Common;

{
# A fake package to be able to use Pod::Simple::PullParser without generating
# any output.
package Pod::Simple::PullParserRun;

use vars qw(@ISA);
@ISA = ('Pod::Simple::PullParser');
sub new
{
  return shift->SUPER::new(@_);
}
sub run(){};
}

my $real_command_name = $0;
$real_command_name =~ s/.*\///;

# placeholder for string translations, not used for now
sub __($)
{
  return $_[0];
}

sub pod2texi_help()
{
  return __("Usage: pod2texi [OPTION]... POD-FILE...

Translate Pod to Texinfo.  If the base level is higher than 0, 
a main manual including all the files is done otherwise all
manuals are standalone (the default).

Options:
    --base-level=NUM|NAME   level of the head1 commands.
    --unnumbered-sections   use unumbered sections.
    --output=NAME           output to <NAME> for the first or the main manual
                            instead of standard out.
    --top                   top for the main manual.
    --version               display version information and exit.\n");
}

my $base_level = 0;
my $unnumbered_sections = 0;
my $output = '-';
my $top = 'top';

my $result_options = Getopt::Long::GetOptions (
  'help|h' => sub { print pod2texi_help(); exit 0; },
  'version|V' => sub {print "$real_command_name $Pod::Simple::Texinfo::VERSION\n\n";
    printf __("Copyright (C) %s Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.\n"), '2012';
      exit 0;},
  'base-level=s' => sub {
     if ($_[1] =~ /^[0-4]$/) {
       $base_level = $_[1];
     } elsif (defined($Texinfo::Common::command_structuring_level{$_[1]})) {
       $base_level = $Texinfo::Common::command_structuring_level{$_[1]};
     } else {
       die sprintf(__("%s: wrong argument for --base-level.\n"), 
                   $real_command_name);
     }
   },
  'unnumbered-sections!' => \$unnumbered_sections,
  'output|o=s' => \$output,
  'top=s' => \$top,
);

exit 1 if (!$result_options);

my @manuals;
my @all_manual_names;

my @input_files = @ARGV;

# use STDIN if not a tty, like makeinfo does
@input_files = ('-') if (!scalar(@input_files) and !-t STDIN);
die sprintf(__("%s: missing file argument.\n"), $real_command_name)
   .sprintf(__("Try `%s --help' for more information.\n"), $real_command_name)
     unless (scalar(@input_files) >= 1);

# First gather all the manual names
foreach my $file (@input_files) {
  # not really used, only the manual name is used.
  my $parser = Pod::Simple::PullParserRun->new();
  $parser->parse_file($file);
  my $short_title = $parser->get_short_title();
  if (defined($short_title) and $short_title =~ m/\S/) {
    push @manuals, $short_title;
    push @all_manual_names, $short_title;
    #print STDERR "NEW MANUAL: $short_title\n";
  } else {
    push @all_manual_names, undef;
  }
}

my $file_nr = 0;
my @included;
foreach my $file (@input_files) {
  my $outfile;
  my $name = shift @all_manual_names;
  if ($base_level == 0 and !$file_nr) {
    $outfile = $output;
  } else {
    if (defined($name)) {
      $outfile = Pod::Simple::Texinfo::_pod_title_to_file_name($name);
      $outfile .= '.texi';
    } else {
      $outfile = $file;
      $outfile =~ s/\.(pm|pod)$/.texi/i;
    }
  }
  push @included, [$name, $outfile] if ($base_level > 0);
  my $fh;
  if ($outfile eq '-') {
    $fh = *STDOUT;
  } else {
    open (OUT, ">$outfile") or die sprintf(__("%s: Open %s: %s.\n"), 
                                          $real_command_name, $outfile, $!);
    $fh = *OUT;
  }
  # FIXME should use =encoding
  binmode($fh, ':encoding(utf8)');
  my $new = Pod::Simple::Texinfo->new();
  $new->output_fh($fh);
  $new->texinfo_sectioning_base_level($base_level);
  if ($unnumbered_sections) {
    $new->texinfo_sectioning_style('unnumbered');
  }
  if ($base_level > 0 and @manuals) {
    $new->texinfo_internal_pod_manuals(\@manuals);
  }
  
  $new->parse_file($file);
  if ($outfile ne '-') {
    close($fh) or die sprintf (__("%s: Close %s: %s.\n"), 
                               $real_command_name, $outfile, $!);
  }
  $file_nr++;
}

my $STDOUT_DOCU_NAME = 'stdout';
if ($base_level > 0) {
  my $fh;
  if ($output ne '-') {
    open (OUT, ">$output") or die sprintf(__("%s: Open %s: %s.\n"), 
                                          $real_command_name, $output, $!);
    $fh = *OUT;
  } else {
    $fh = *STDOUT;
  }
  my $outfile_name = $output;
  $outfile_name = $STDOUT_DOCU_NAME if ($outfile_name eq '-');
  $outfile_name =~ s/\.te?x(i|info)?$//;
  $outfile_name .= '.info';
  print $fh '\input texinfo'."\n";
  print $fh '@setfilename '
    .Pod::Simple::Texinfo::_protect_text ($outfile_name)."\n\n";
  print $fh '@documentencoding utf-8'."\n\n";
  print $fh "\@node Top\n";
  # not escaped on purpose, user may want to use @-commands
  print $fh "\@top $top\n\n";
  print $fh "\@contents\n\n";
  foreach my $include (@included) {
    my $file = $include->[1];
    print $fh "\@include ".Pod::Simple::Texinfo::_protect_text ($file)."\n";
  }
  print $fh "\n\@bye\n";
  
  if ($output ne '-') {
    close($fh) or die sprintf (__("%s: Close %s: %s.\n"), 
                               $real_command_name, $output, $!);
  }
}

if (defined($output) and $output eq '-') {
  close(STDOUT) or die sprintf (__("%s: Close stdout: %s.\n"), 
                               $real_command_name, $!);
}

1;

__END__

=head1 NAME

pod2texi - convert Pod files to a Texinfo

=head1 SYNOPSIS

  pod2texi [OPTION]... POD-FILE...

=head1 DESCRIPTION

Translate Pod to Texinfo.  If the base level is higher than 0, 
a main manual including all the files is done otherwise all
manuals are standalone (the default).

=head1 OPTIONS

=over

=item B<--base-level>=I<NUM|NAME>

Sets the level of the head1 commands.  It may be an integer or a Texinfo
sectioning command.  If it is a Texinfo sectioning command the corresponding
level is used.  If the resulting level is 1, this corresponds to 
@chapter/@unnumbered level.  If set to 0, the head1 commands level is 
still 1, but the output manual is considered to be a standalone manual.

If the level is not 0, the pod file is rendered as a fragment of a 
Texinfo manual.  In that case, each pod file has an additional sectioning
command one level above the head1 commands level added for the whole
file.  Therefore if you want to have each pod file as a chapter, you should
use C<section> as the base level.

=item B<--output>=I<NAME>

Name for the first manual, or the main manual if there is a main manual.
Default is output on standard out.

=item B<--unnumbered-sections>

Use unnumbered sectioning commands (@unnumbered...) instead of the default
numbered sectioning Texinfo @-commands (@chapter, @section...).

=item B<--top>=I<TOP>

Name of the C<@top> element for the main manual.  May contain Texinfo code.

=item B<--version>

Display version information and exit.

=back

=head1 SEE ALSO

L<Pod::Simple::Texinfo>.  The Texinfo manual.  L<perlpod>.

=head1 COPYRIGHT

Copyright (C) 2012 Free Software Foundation, Inc.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License,
or (at your option) any later version.

There is NO WARRANTY, to the extent permitted by law.

=head1 AUTHOR

Patrice Dumas E<lt>pertusus@free.frE<gt>.

=cut
