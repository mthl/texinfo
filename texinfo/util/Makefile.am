# $Id: Makefile.am,v 1.2 2002-09-12 21:27:15 karl Exp $
# Makefile.am for texinfo/util.
# Run automake in .. to produce Makefile.in from this.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

bin_PROGRAMS = install-info texindex
bin_SCRIPTS = texi2dvi

localedir = $(datadir)/locale
INCLUDES = -I$(top_srcdir)/lib -I../intl -DLOCALEDIR=\"$(localedir)\"
LDADD = ../lib/libtxi.a @LIBINTL@

# Most of these are for fun.  The only one that's really supported is texi2dvi.
# 
# automake.diff is necessary to apply if you change configure.ac, are
# building from cvs, or otherwise need to run automake.  Otherwise
# install-info will be built on every make, and make distcleancheck will
# fail.  (These bugs have been reported [several times] to bug-automake.)
# 
EXTRA_DIST = README automake.diff deref.c fix-info-dir fixfonts \
  fixref.gawk gen-dir-node install-info-html outline.gawk prepinfo.awk \
  tex3patch texi-docstring-magic.el texi2dvi 
