# Makefile.am for MiscXS
#
# Copyright 2015, 2016 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
AUTOMAKE_OPTIONS=foreign subdir-objects

EXTRA_DIST=

######################## Gnulib ################################

AM_CPPFLAGS =                \
  -I$(srcdir)                \
  -I$(srcdir)/lib     \
  -I$(builddir)/lib

MiscXS_la_LIBADD = $(builddir)/lib/libgnu.la \
	                $(TERMLIBS) $(LIBINTL) $(LIBICONV)

ACLOCAL_AMFLAGS = -I m4

SUBDIRS=lib

EXTRA_DIST+=m4/gnulib-cache.m4

################### End Gnulib section #########################

modulesdir = $(pkgdatadir)/Texinfo/Convert/XSParagraph
xsdir = $(pkglibdir)

PERL_INC = $(PERL_CONF_archlibexp)/CORE

XSUBPPARGS = -typemap $(PERL_CONF_privlibexp)/ExtUtils/typemap

.xs.c:
	$(XSUBPP) $(XSUBPPARGS) $< > $*.xsc && mv $*.xsc $*.c

# -------------------------------------------------------

CLEANFILES =

xs_LTLIBRARIES = MiscXS.la
MiscXS_la_SOURCES = MiscXS.c miscxs.c miscxs.h ppport.h

CLEANFILES += MiscXS.c
EXTRA_DIST += MiscXS.xs

# Override these variables set by configure at the top level, because 
# the compiler used in this subdirectory might be different.  
# PERL_EXT_var are user variables, allowing configuring at the top-level 
# with e.g. "./configure CFLAGS='-g -O0' PERL_EXT_CFLAGS='-g'".

CFLAGS = $(PERL_EXT_CFLAGS)
CPPFLAGS = $(PERL_EXT_CPPFLAGS)
LDFLAGS = $(PERL_EXT_LDFLAGS)

AM_CFLAGS = $(PERL_CONF_ccflags)

MiscXS_la_CFLAGS = $(AM_CFLAGS)
MiscXS_la_CFLAGS += -DVERSION=\"$(VERSION)\" -DXS_VERSION=\"$(VERSION)\"  "-I$(PERL_INC)"

AM_LDFLAGS = -no-undefined -L$(PERL_INC) $(PERL_CONF_libperl)
AM_LDFLAGS += -avoid-version -module $(PERL_CONF_ccdlflags)
# The -no-undefined flag is for MS-Windows.  See info node
# `(gnulib)Libtool and Windows'.  The -L and -l options after it show
# where to find the undefined symbols.
