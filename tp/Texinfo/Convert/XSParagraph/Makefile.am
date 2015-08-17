# Parts of this file derived from the output of MakeMaker version
# 6.66 (Revision: 66600) from the contents of a Makefile.PL.
#
# Test with
# make clean && make && (pushd ../../.. && ./texi2any.pl --version ; popd)
#
# Can use the MakeMaker makefile, for comparison with
# "make -f Makefile.old"
# "make -f Makefile.old install" gives
# Installing /usr/local/lib/perl5/auto/XSParagraph/XSParagraph.so
# Installing /usr/local/lib/perl5/auto/XSParagraph/XSParagraph.bs
# Installing /usr/local/lib/perl5/XSParagraph.pm
#
# The *.bs is a "bootstrap" file which is empty, so we shouldn't have to
# worry about it.

AUTOMAKE_OPTIONS=foreign subdir-objects

EXTRA_DIST=

######################## Gnulib ################################

AM_CPPFLAGS =                \
  -I$(srcdir)                \
  -I$(srcdir)/gnulib/lib     \
  -I$(builddir)/gnulib/lib

XSParagraph_la_LIBADD = $(builddir)/lib/libgnu.la \
	                $(TERMLIBS) $(LIBINTL) $(LIBICONV)

ACLOCAL_AMFLAGS = -I m4

SUBDIRS=lib

EXTRA_DIST+=m4/gnulib-cache.m4

################### End Gnulib section #########################

modulesdir = $(pkgdatadir)/Texinfo/Convert/XSParagraph
xsdir = $(pkglibexecdir)

dist_modules_DATA = XSParagraph.pm

EXTRA_DIST += fetch_conf.pl

PERL_INC = $(PERL_CONF_archlibexp)/CORE

XSUBPPARGS = -typemap $(PERL_CONF_privlibexp)/ExtUtils/typemap

#XSUBPPARGS = -typemap /usr/share/perl5/ExtUtils/typemap

.xs.c:
	$(XSUBPP) $(XSUBPPARGS) $*.xs > $*.xsc && mv $*.xsc $*.c

# We won't need this rule
#.xs$(OBJ_EXT):
#	$(XSUBPPRUN) $(XSPROTOARG) $(XSUBPPARGS) $*.xs > $*.xsc \
#		&& mv $*.xsc $*.c
#	$(CCCMD) $(CCCDLFLAGS) "-I$(PERL_INC)" $(PASTHRU_DEFINE) \
#	$(DEFINE) $*.c

# -------------------------------------------------------

xs_LTLIBRARIES = XSParagraph.la
XSParagraph_la_SOURCES = XSParagraph.c xspara.c xspara.h \
			 text.c text.h ppport.h

BUILT_SOURCES = XSParagraph.c

# Override these variables set by configure at the top level, because 
# the compiler used in this subdirectory might be different.  
# PERL_EXT_var are user variables, allowing configuring at the top-level 
# with e.g. "./configure CFLAGS='-g -O0' PERL_EXT_CFLAGS='-g'".

CFLAGS = $(PERL_EXT_CFLAGS)
CPPFLAGS = $(PERL_EXT_CPPFLAGS)
LDFLAGS = $(PERL_EXT_LDFLAGS)

XSParagraph_la_CFLAGS = $(PERL_CONF_ccflags)

XSParagraph_la_CFLAGS += -DVERSION=\"$(VERSION)\" -DXS_VERSION=\"$(VERSION)\"  "-I$(PERL_INC)"

XSParagraph_la_LDFLAGS=-module $(PERL_CONF_cccdlflags)


# only used to regenerate a stand-alone perl module
perl_specific_files = \
  Makefile.PL \
  MANIFEST \
  prepare_standalone_perl_module.sh

EXTRA_DIST += $(perl_specific_files)

