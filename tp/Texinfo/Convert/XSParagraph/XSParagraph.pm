# Copyright 2014, 2015 Free Software Foundation, Inc.

package XSParagraph;
require DynaLoader;

use DynaLoader;

# same as texi2any.pl, although I don't know what the real requirement
# is for this module.
use 5.00405;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter DynaLoader);

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

BEGIN {
# We get this from XSParagraph.la
# my $dlpath = "Texinfo/Convert/XSParagraph/.libs/XSParagraph.so.0";

# The following uses the module built by the ExtUtils::MakeMaker makefile.
# my $dlname = "Texinfo/Convert/XSParagraph/blib/arch/auto/XSParagraph/XSParagraph.so";


# We look for the .la and .so files in @INC because this allows us to override
# which modules are used using -I flags to "perl".
sub _find_file($) {
  my $file = shift;
  for my $dir (@INC) {
    #print "checking $dir/$file\n";
    if (-f "$dir/$file") {
      #print "found $dir/$file\n";
      return ($dir, "$dir/$file");
    }
  }
  return undef;
}

my ($libtool_dir, $libtool_archive) = _find_file("XSParagraph.la");
if (!$libtool_archive) {
  warn "XSParagraph: couldn't find Libtool archive file\n";
  goto FALLBACK;
}

my $fh;
open $fh, $libtool_archive;
if (!$fh) {
  warn "XSParagraph: couldn't open Libtool archive file\n";
  goto FALLBACK;
}

# Look for the line in XSParagraph.la giving the name of the loadable object.
my $dlname = undef;
while (my $line = <$fh>) {
  if ($line =~ /^\s*dlname\s*=\s*'([^']+)'\s$/) {
    $dlname = $1;
    last;
  }
}
if (!$dlname) {
  warn "XSParagraph: couldn't find name of shared object\n";
  goto FALLBACK;
}

# The *.so file is under .libs in the source directory.
push @DynaLoader::dl_library_path, $libtool_dir;
push @DynaLoader::dl_library_path, "$libtool_dir/.libs";

my $dlpath = DynaLoader::dl_findfile($dlname);
if (!$dlpath) {
  warn "XSParagraph: couldn't find $dlname\n";
  goto FALLBACK;
}

#print STDERR "loadable object is at $dlpath\n";

my $module = "XSParagraph";
our $VERSION = '6.0';

# Following steps under "bootstrap" in "man DynaLoader".
#bootstrap XSParagraph $VERSION;

# TODO: Execute blib/arch/auto/XSParagraph/XSParagraph.bs ?
# That file is empty.

#my $flags = dl_load_flags $module; # This is 0 in DynaLoader
my $flags = 0;
my $libref = DynaLoader::dl_load_file($dlpath, $flags);
if (!$libref) {
  warn "XSParagraph: couldn't load file $dlpath\n";
  goto FALLBACK;
}
my @undefined_symbols = DynaLoader::dl_undef_symbols();
if ($#undefined_symbols+1 != 0) {
  warn "XSParagraph: still have undefined symbols after dl_load_file\n";
}
my $symref = DynaLoader::dl_find_symbol($libref, "boot_$module");
if (!$symref) {
  warn "XSParagraph: couldn't find boot_$module symbol\n";
  goto FALLBACK;
}
my $boot_fn = DynaLoader::dl_install_xsub("${module}::bootstrap",
                                                $symref, $dlname);

if (!$boot_fn) {
  warn "XSParagraph: couldn't bootstrap\n";
  goto FALLBACK;
}

push @DynaLoader::dl_shared_objects, $dlpath; # record files loaded

# This is the module bootstrap function, which causes all the other
# functions (XSUB's) provided by the module to become available to
# be called from Perl code.
&$boot_fn($module, $VERSION);

if (!XSParagraph::init ()) {
  warn "XSParagraph: error initializing\n";
  goto FALLBACK;
}
goto DONTFALLBACK;

FALLBACK:
  # Fall back to using the Perl code.
  *XSParagraph:: = *Texinfo::Convert::Paragraph::;
DONTFALLBACK: ;
} # end BEGIN


# Preloaded methods go here.

#########################################################################

# Used for debugging.  Not implemented.
sub dump($)
{
  return "\n";
}

1;
__END__
