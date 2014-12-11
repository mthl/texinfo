package Parsetexi;

use 5.018001;
use strict;
use warnings;
use Carp;

require Exporter;
use AutoLoader;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Parsetexi ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
  parser
  parse_texi_text
  parse_texi_line
  parse_texi_file
  indices_information
  floats_information
  internal_references_information
  labels_information
  global_commands_information
  global_informations
  errors
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.01';

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.

    my $constname;
    our $AUTOLOAD;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "&Parsetexi::constant not defined" if $constname eq 'constant';
    my ($error, $val) = constant($constname);
    if ($error) { croak $error; }
    {
	no strict 'refs';
	# Fixed between 5.005_53 and 5.005_61
#XXX	if ($] >= 5.00561) {
#XXX	    *$AUTOLOAD = sub () { $val };
#XXX	}
#XXX	else {
	    *$AUTOLOAD = sub { $val };
#XXX	}
    }
    goto &$AUTOLOAD;
}

require XSLoader;
XSLoader::load('Parsetexi', $VERSION);

# Stub for Texinfo::Parser::parser (line 574)
sub parser (;$$)
{
  # None of these are implemented yet.
  my $parser = {
    'labels' => {},
    'floats' => {},
    'internal_references' => [],
    'extra' => {},
    'info' => {},
    'index_names' => {},
    'merged_indices' => {},
  };

  bless $parser;

  return $parser;
}

use Data::Dumper;

sub _add_parents ($);

sub _add_parents ($) {
  my $elt = shift;

  if (exists $elt->{'contents'}) {
    foreach my $child (@{$elt->{'contents'}}) {
      $child->{'parent'} = $elt;
      _add_parents ($child);
    }
  }

  if (exists $elt->{'args'}) {
    foreach my $child (@{$elt->{'args'}}) {
      $child->{'parent'} = $elt;
      _add_parents ($child);
    }
  }
}

# Stub for Texinfo::Parser::parse_texi_file (line 835)
sub parse_texi_file ($$)
{
  my $self = shift;
  my $file_name = shift;
  my $tree_stream;

  #print "Getting tree...\n";

  # Note we are calling a separate executable instead of using the code
  # compliled into Parsetexi.pm as a library.  We should add functions 
  # to Parsetexi.pm to get the tree without doing this.
  $tree_stream = qx(./parsetexi $file_name 2>/dev/null);

  my $VAR1;
  #print "Reading tree...\n";
  eval $tree_stream;
  #print "Read tree.\n";

  #print "Adjusting tree...\n";
  _add_parents ($VAR1);
  #print "Adjusted tree.\n";

  #$Data::Dumper::Purity = 1;
  #$Data::Dumper::Indent = 1;
  #my $bar = Data::Dumper->Dump([$VAR1], ['$VAR1']);
  #print $bar;
  
  return $VAR1;
}

# Public interfaces of Texinfo::Parser (starting line 942)
sub indices_information($)
{
  my $self = shift;
  return ($self->{'index_names'}, $self->{'merged_indices'});
}

sub floats_information($)
{
  my $self = shift;
  return $self->{'floats'};
}

sub internal_references_information($)
{
  my $self = shift;
  return $self->{'internal_references'};
}

sub global_commands_information($)
{
  my $self = shift;
  return $self->{'extra'};
}

sub global_informations($)
{
  my $self = shift;
  return $self->{'info'};
}

sub labels_information($)
{
  my $self = shift;
  return $self->{'labels'};
}

################ Stubs for Texinfo::Report ########################
#

# Report.pm:54
sub errors ($)
{
  return ([], 0);
}

# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Parsetexi - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Parsetexi;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Parsetexi, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

A. U. Thor, E<lt>g@slackware.lanE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014 by A. U. Thor

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
