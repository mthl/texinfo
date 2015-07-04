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

modulesdir = $(pkglibexecdir)/Texinfo
dist_modules_DATA = lib/XSParagraph.pm

EXTRA_DIST = fetch_conf.pl

# TODO: Rules for installing

# TODO: Figure out what Make variables we need

#PERL_INC = /usr/lib/perl5/CORE
PERL_INC = $(PERL_CONF_archlibexp)/CORE

#PERL = /usr/bin/perl5.18.1

# It's essential that we use the same compiler that was used to build
# Perl.  Otherwise Perl's "config.h" will be incorrect.
CC = $(PERL_CONF_cc)

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

modules_LTLIBRARIES = XSParagraph.la
XSParagraph_la_SOURCES = XSParagraph.c mylib/xspara.c mylib/xspara.h \
			 mylib/text.c mylib/text.h ppport.h

BUILT_SOURCES = XSParagraph.c

XSParagraph_la_CFLAGS =

#CCFLAGS = -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
# Apparently these may be wrong if Perl was compiled with a different 
# compiler from the one we're using.
# Maybe we should strip out anything that isn't a -D or -I flag.
# See http://lists.gnu.org/archive/html/bug-texinfo/2015-06/msg00077.html,
# and http://www.tokiwinter.com/fix-perl-make-errors-under-solaris/
XSParagraph_la_CFLAGS += $(PERL_CONF_ccflags)

XSParagraph_la_CFLAGS += -DVERSION=\"$(VERSION)\" -DXS_VERSION=\"$(VERSION)\"  "-I$(PERL_INC)"

XSParagraph_la_LDFLAGS=-module $(PERL_CONF_cccdlflags)


