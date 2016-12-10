# Copyright 2014, 2015, 2016 Free Software Foundation, Inc.
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

package Texinfo::XSLoader;

use DynaLoader;

use 5.00405;
use strict;
use warnings;

our $TEXINFO_XS;

our $VERSION = '6.2';

our $disable_XS;

# For verbose information about what's being done
sub _debug($) {
  if ($TEXINFO_XS eq 'debug') {
    my $msg = shift;
    warn $msg . "\n";
  }
}

# For messages to say that XS module couldn't be loaded
sub _fatal($) {
  if ($TEXINFO_XS eq 'debug'
      or $TEXINFO_XS eq 'required'
      or $TEXINFO_XS eq 'warn') {
    my $msg = shift;
    warn $msg . "\n";
  }
}

# We look for the .la and .so files in @INC because this allows us to override
# which modules are used using -I flags to "perl".
sub _find_file($) {
  my $file = shift;
  for my $dir (@INC) {
    _debug "checking $dir/$file";
    if (-f "$dir/$file") {
      _debug "found $dir/$file";
      return ($dir, "$dir/$file");
    }
  }
  return undef;
}
 
sub init {
 my ($full_module_name,
     $module,
     $fallback_module,
     $module_name,
 # Module interface number, to be changed when the XS interface changes.  
 # The value used for the .xs file compilation is set in configure.ac.  
 # Both should correspond, but it should be manually changed here to make
 # sure that a changed interface has not been missed.
     $interface_version,
     $warning_message,
     $fatal_message
   ) = @_;
 
 # Possible values for TEXINFO_XS environment variable:
 #
 # TEXINFO_XS=omit         # don't try loading xs at all
 # TEXINFO_XS=default      # try xs, libtool and then perl paths,
 #                         # silent fallback
 # TEXINFO_XS=libtool      # try xs, libtool only, silent fallback
 # TEXINFO_XS=standalone   # try xs, perl paths only, silent fallback
 # TEXINFO_XS=warn         # try xs, libtool and then perl paths, warn
 #                         # on failure
 # TEXINFO_XS=required     # abort if not loadable, no fallback
 # TEXINFO_XS=debug        # voluminuous debugging
 #
 # Other values are treated at the moment as 'default'.
 
 $TEXINFO_XS = $ENV{'TEXINFO_XS'};
 if (!defined($TEXINFO_XS)) {
   $TEXINFO_XS = '';
 }
 
 if ($TEXINFO_XS eq 'omit') {
   # Don't try to use the XS module
   goto FALLBACK;
 }
 
 if ($disable_XS) {
   _fatal "use of XS modules was disabled when Texinfo was built";
   goto FALLBACK;
 }

 if ($warning_message) {
   _debug $warning_message;
 }

 if ($fatal_message) {
   _fatal $fatal_message;
   goto FALLBACK;
 }
 
 my ($libtool_dir, $libtool_archive);
 if ($TEXINFO_XS ne 'standalone') {
   ($libtool_dir, $libtool_archive) = _find_file("XS$module_name.la");
   if (!$libtool_archive) {
     if ($TEXINFO_XS eq 'libtool') {
       _fatal "XS for $module_name: couldn't find Libtool archive file";
       goto FALLBACK;
     }
     _debug "XS for $module_name: couldn't find Libtool archive file";
   }
 }
 
 my $dlname = undef;
 my $dlpath = undef;
 
 # Try perl paths
 if (!$libtool_archive) {
   my @modparts = split(/::/,$module);
   my $dlname = $modparts[-1];
   my $modpname = join('/',@modparts);
   # the directories with -L prepended setup directories to
   # be in the search path. Then $dlname is prepended as it is
   # the name really searched for.
   $dlpath = DynaLoader::dl_findfile(map("-L$_/auto/$modpname", @INC), $dlname);
   if (!$dlpath) {
     _fatal "XS for $module_name:  couldn't find $module";
     goto FALLBACK;
   }
   goto LOAD;
 }
 
 my $fh;
 open $fh, $libtool_archive;
 if (!$fh) {
   _fatal "XS for $module_name: couldn't open Libtool archive file";
   goto FALLBACK;
 }
 
 # Look for the line in XS*.la giving the name of the loadable object.
 while (my $line = <$fh>) {
   if ($line =~ /^\s*dlname\s*=\s*'([^']+)'\s$/) {
     $dlname = $1;
     last;
   }
 }
 if (!$dlname) {
   _fatal "XS for $module_name: couldn't find name of shared object";
   goto FALLBACK;
 }
 
 # The *.so file is under .libs in the source directory.
 push @DynaLoader::dl_library_path, $libtool_dir;
 push @DynaLoader::dl_library_path, "$libtool_dir/.libs";
 
 $dlpath = DynaLoader::dl_findfile($dlname);
 if (!$dlpath) {
   _fatal "XS for $module_name: couldn't find $dlname";
   goto FALLBACK;
 }
 
LOAD:
  
  #my $flags = dl_load_flags $module; # This is 0 in DynaLoader
  my $flags = 0;
  my $libref = DynaLoader::dl_load_file($dlpath, $flags);
  if (!$libref) {
    _fatal "XS for $module_name: couldn't load file $dlpath";
    goto FALLBACK;
  }
  _debug "$dlpath loaded";
  my @undefined_symbols = DynaLoader::dl_undef_symbols();
  if ($#undefined_symbols+1 != 0) {
    _fatal "XS for $module_name: still have undefined symbols after dl_load_file";
  }
  my $bootname = "boot_$module";
  $bootname =~ s/:/_/g;
  _debug "looking for $bootname";
  my $symref = DynaLoader::dl_find_symbol($libref, $bootname);
  if (!$symref) {
    _fatal "XS for $module_name: couldn't find $bootname symbol";
    goto FALLBACK;
  }
  my $boot_fn = DynaLoader::dl_install_xsub("${module}::bootstrap",
                                                  $symref, $dlname);
  
  if (!$boot_fn) {
    _fatal "XS for $module_name: couldn't bootstrap";
    goto FALLBACK;
  }
  
  push @DynaLoader::dl_shared_objects, $dlpath; # record files loaded
  
  # This is the module bootstrap function, which causes all the other
  # functions (XSUB's) provided by the module to become available to
  # be called from Perl code.
  &$boot_fn($module, $interface_version);
  
  # This makes it easier to refer to packages and symbols by name.
  no strict 'refs';
  
  if (!&{"${module}::init"} ()) {
    _fatal "XS for $module_name: error initializing";
    goto FALLBACK;
  }
  
  *{"${full_module_name}::"} = *{"${module}::"};
  
  return;
  
FALLBACK:
  if ($TEXINFO_XS eq 'required') {
    die "unset the TEXINFO_XS environment variable to use the "
       ."pure Perl modules\n";
  } elsif ($TEXINFO_XS eq 'warn' or $TEXINFO_XS eq 'debug') {
    warn "falling back to pure Perl modules\n";
  }
  # Fall back to using the Perl code.
  # Use eval here to interpret :: properly in module name.
  eval "require $fallback_module";

  *{"${full_module_name}::"} = \%{"${fallback_module}::"};
} # end init

# NB Don't add more functions down here, because this can cause an error
# with some versions of Perl, connected with the typeglob assignment just
# above.  ("Can't call mro_method_changed_in() on anonymous symbol table").
#
# See http://perl5.git.perl.org/perl.git/commitdiff/03d9f026ae253e9e69212a3cf6f1944437e9f070?hp=ac73ea1ec401df889d312b067f78b618f7ffecc3
#
# (change to Perl interpreter on 22 Oct 2011)


1;
__END__
