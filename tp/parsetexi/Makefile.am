AUTOMAKE_OPTIONS=foreign subdir-objects

ACLOCAL_AMFLAGS=-I m4

EXTRA_DIST=
CLEANFILES =

modulesdir = $(pkgdatadir)/Parsetexi
xsdir = $(pkglibdir)

PERL_INC = $(PERL_CONF_archlibexp)/CORE

XSUBPPARGS = -typemap $(PERL_CONF_privlibexp)/ExtUtils/typemap

.xs.c:
	$(XSUBPP) $(XSUBPPARGS) $< > $*.xsc && mv $*.xsc $*.c

bin_PROGRAMS=parsetexi
xs_LTLIBRARIES = Parsetexi.la

CLEANFILES += Parsetexi.c
EXTRA_DIST += Parsetexi.xs

# Override these variables set by configure at the top level, because 
# the compiler used in this subdirectory might be different.  
# PERL_EXT_var are user variables, allowing configuring at the top-level 
# with e.g. "./configure CFLAGS='-g -O0' PERL_EXT_CFLAGS='-g'".

CFLAGS = $(PERL_EXT_CFLAGS)
CPPFLAGS = $(PERL_EXT_CPPFLAGS)
LDFLAGS = $(PERL_EXT_LDFLAGS)

AM_CFLAGS = $(PERL_CONF_ccflags)

Parsetexi_la_CFLAGS = $(AM_CFLAGS)
Parsetexi_la_CFLAGS += -DVERSION=\"$(VERSION)\" "-I$(PERL_INC)"

AM_LDFLAGS = -no-undefined -L$(PERL_INC) $(PERL_CONF_libperl)
AM_LDFLAGS += -avoid-version -module $(PERL_CONF_ccdlflags)
# The -no-undefined flag is for MS-Windows.  See info node
# `(gnulib)Libtool and Windows'.  The -L and -l options after it show
# where to find the undefined symbols.


Parsetexi_la_SOURCES= Parsetexi.c \
                  api.c api.h \
		  parser.c parser.h tree_types.h \
		  element_types.c element_types.h \
		  commands.c commands.h \
		  command_ids.h \
		  input.c input.h \
		  tree.c tree.h close.c \
		  text.c text.h \
		  context_stack.c context_stack.h \
		  debug.c \
		  convert.c convert.h \
		  end_line.c \
		  separator.c \
		  multitable.c \
		  indices.c \
		  macro.c macro.h \
		  handle_commands.c handle_commands.h \
		  def.c def.h \
		  dump_perl.c dump_perl.h \
		  extra.c \
		  menus.c \
		  labels.c \
		  errors.c errors.h \
		  counter.c counter.h

parsetexi_SOURCES=$(Parsetexi_la_SOURCES) main.c
parsetexi_CFLAGS = -DVERSION=\"$(VERSION)\" "-I$(PERL_INC)"

# TODO: should -lpthread come from the Perl conf?
parsetexi_LDFLAGS = $(AM_LDFLAGS) -lpthread


BUILT_SOURCES=element_types.c element_types.h \
              command_data.c command_ids.h

# Need to be distributed
EXTRA_DIST+=element_types.txt element_types.awk \
	   command_data.txt command_data.awk

# For reference
EXTRA_DIST+=Common.pm Parser-5556.pm

EXTRA_DIST+=complete_tree.pl

# Notes
EXTRA_DIST+=debug_perl.txt makeinfo-debug.txt

element_types.c element_types.h: element_types.txt element_types.awk
	awk -f element_types.awk element_types.txt >element_types.h

command_data.c command_ids.h: command_data.txt command_data.awk
	awk -f command_data.awk command_data.txt >command_ids.h
