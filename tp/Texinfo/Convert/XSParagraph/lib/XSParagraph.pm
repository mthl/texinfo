# Copyright 2010, 2011, 2012, 2014 Free Software Foundation, Inc.

package XSParagraph;
require DynaLoader;

use DynaLoader;

use 5.018001;
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

our $VERSION = '6.0';
#bootstrap XSParagraph $VERSION;

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
      print "found $dir/$file\n";
      return ($dir, "$dir/$file");
    }
  }
  return undef;
}

my ($libtool_dir, $libtool_archive) = _find_file("XSParagraph.la");
if (!$libtool_archive) {
  die "XSParagraph: couldn't find Libtool archive file\n";
}

my $fh;
open $fh, $libtool_archive;
if (!$fh) {
  die "XSParagraph: couldn't open Libtool archive file\n";
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
  die "XSParagraph: couldn't find name of shared object\n";
}

# The *.so file is under .libs in the source directory.
push @DynaLoader::dl_library_path, $libtool_dir;
push @DynaLoader::dl_library_path, "$libtool_dir/.libs";

my $dlpath = DynaLoader::dl_findfile($dlname);
if (!$dlpath) {
  die "XSParagraph: couldn't find $dlname\n";
}

print STDERR "loadable object is at $dlpath\n";

my $module = "XSParagraph";

# Following steps under "bootstrap" in "man DynaLoader".

# TODO: Execute blib/arch/auto/XSParagraph/XSParagraph.bs ?
# That file is empty.

#my $flags = dl_load_flags $module; # This is 0 in DynaLoader
my $flags = 0;
my $libref = DynaLoader::dl_load_file($dlpath, $flags);
if (!$libref) {
  die "XSParagraph: couldn't load file $dlpath\n";
}
my @undefined_symbols = DynaLoader::dl_undef_symbols();
if ($#undefined_symbols+1 != 0) {
  warn "XSParagraph: still have undefined symbols after dl_load_file\n";
}
my $symref = DynaLoader::dl_find_symbol($libref, "boot_$module");
if (!$symref) {
  die "XSParagraph: couldn't find boot_$module symbol\n";
}
my $boot_fn = DynaLoader::dl_install_xsub("${module}::bootstrap",
                                                $symref, $dlname);

if (!$boot_fn) {
  die "XSParagraph: couldn't bootstrap\n";
}

push @DynaLoader::dl_shared_objects, $dlpath; # record files loaded

# This is the module bootstrap function, which causes all the other
# functions (XSUB's) provided by the module to become available to
# be called from Perl code.
&$boot_fn($module, $VERSION);

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
