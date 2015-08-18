# This is intended to attempt to build a minimal Perl XS module to
# see if it is possible.
AUTOMAKE_OPTIONS=foreign subdir-objects

EXTRA_DIST=
EXTRA_DIST += fail.pl

AM_CPPFLAGS = -I$(srcdir) 

ACLOCAL_AMFLAGS = -I m4

# Need to use an installation dir, otherwise shared library doesn't
# build.  This is a Libtool bug.
modulesdir = $(pkgdatadir)/Texinfo/Convert/XSParagraph
xsdir = $(pkglibexecdir)

dist_modules_DATA = TestXS.pm

PERL_INC = $(PERL_CONF_archlibexp)/CORE

XSUBPPARGS = -typemap $(PERL_CONF_privlibexp)/ExtUtils/typemap

.xs.c:
	$(XSUBPP) $(XSUBPPARGS) $*.xs > $*.xsc && mv $*.xsc $*.c

xs_LTLIBRARIES = TestXS.la
TestXS_la_SOURCES = TestXS.c ppport.h

BUILT_SOURCES = TestXS.c
EXTRA_DIST += TestXS.xs

# Override these variables set by configure at the top level, because 
# the compiler used in this subdirectory might be different.  
# PERL_EXT_var are user variables, allowing configuring at the top-level 
# with e.g. "./configure CFLAGS='-g -O0' PERL_EXT_CFLAGS='-g'".

CFLAGS = $(PERL_EXT_CFLAGS)
CPPFLAGS = $(PERL_EXT_CPPFLAGS)
LDFLAGS = $(PERL_EXT_LDFLAGS)

TestXS_la_CFLAGS = $(PERL_CONF_ccflags)

TestXS_la_CFLAGS += -DVERSION=\"$(VERSION)\" -DXS_VERSION=\"$(VERSION)\"  "-I$(PERL_INC)"

TestXS_la_LDFLAGS=-module $(PERL_CONF_cccdlflags)


