# Copyright 2010, 2011, 2012, 2014 Free Software Foundation, Inc.

package XSParagraph;

use 5.018001;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use XSParagraph ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
    add_next
    add_text
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '6.0';

require XSLoader;
XSLoader::load('XSParagraph', $VERSION);

# Preloaded methods go here.

#########################################################################

# Used for debugging.  Not implemented.
sub dump($)
{
  return "\n";
}

# Will not be implemented.
sub add_underlying_text($$)
{
}

1;
__END__
