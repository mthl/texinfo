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
use Pod::Simple::Texinfo;

use Getopt::Long qw(GetOptions);

Getopt::Long::Configure("gnu_getopt");

BEGIN
{
  my $texinfolibdir = '@datadir@/Pod-Simple-Texinfo';
  unshift @INC, ($texinfolibdir)
    if ($texinfolibdir ne ''
        and $texinfolibdir ne '@' .'datadir@/Pod-Simple-Texinfo');
}

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

sub pod2texi_help()
{
  print "Usage: pod2texi [OPTION]... POD-FILE...

Translate Pod to Texinfo.  If the base level is higher than 0, 
a main manual including all the files is done otherwise all
manuals are standalone (the default).

Options:
    --base-level=NUM        level of the head1 commands.
    --unnumbered-sections   use unumbered sections.
    --output=NAME           output name for the first or the main manual.
    --top                   top for the main manual.
    --version               display version information and exit.\n";
}

my $base_level = 0;
my $unnumbered_sections = 0;
my $output = undef;
my $top = 'top';

my $result_options = Getopt::Long::GetOptions (
  'help|h' => sub { print pod2texi_help(); exit 0; },
  'version|V' => sub {print "$real_command_name $Pod::Simple::Texinfo::VERSION\n\n";
    printf __("Copyright (C) %s Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.\n"), '2012';
      exit 0;},
  'base-level=i' => \$base_level,
  'unnumbered-sections!' => \$unnumbered_sections,
  'output|o=s' => \$output,
  'top=s' => \$top,
);

exit 1 if (!$result_options);

my @manuals;
my @all_manual_names;

foreach my $file (@ARGV) {
  # not really used, only the manual name is used.
  my $parser = Pod::Simple::PullParserRun->new();
  $parser->parse_file($file);
  my $short_title = $parser->get_short_title();
  if (defined($short_title) and $short_title =~ m/\S/) {
    push @manuals, $short_title;
    push @all_manual_names, $short_title;
    #print STDERR "$short_title\n";
  } else {
    push @all_manual_names, undef;
  }
}

my $file_nr = 0;
my @included;
foreach my $file (@ARGV) {
  my $outfile;
  my $name = shift @all_manual_names;
  if ($base_level == 0 and !$file_nr and defined($output)) {
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
    open (OUT, ">$outfile") or die "Open $outfile: $!\n";
    $fh = *OUT;
  }
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
    close($fh) or die "Close $outfile: $!\n";
  }
  $file_nr++;
}

my $STDOUT_DOCU_NAME = 'stdout';
if ($base_level > 0) {
  $output = '-' if (!defined($output));
  my $fh;
  if ($output ne '-') {
    open (OUT, ">$output") or die "Open $output: $!\n";
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
  print $fh "\@node Top\n";
  # not escaped on purpose, user may want to use @-commands
  print $fh "\@top $top\n\n";
  foreach my $include (@included) {
    my $file = $include->[1];
    print $fh "\@include ".Pod::Simple::Texinfo::_protect_text ($file)."\n";
  }
  print $fh "\n\@bye\n";
  
  if ($output ne '-') {
    close($fh) or die "Close $output: $!\n";
  }
}

if (defined($output) and $output eq '-') {
  close (STDOUT) or die "Close stdout: $!\n";
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

=item B<--base-level>=I<NUM>

Sets the level of the head1 commands.  1 is for the @chapter/@unnumbered 
level.  If set to 0, the head1 commands level is still 1, but the output 
manual is considered to be a standalone manual.  If not 0, the pod file is 
rendered as a fragment of a Texinfo manual.

=item B<--output>=I<NAME>

Name for the first manual, or the main manual if there is a main manual.

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
