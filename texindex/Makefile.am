# $Id$
# Makefile.am for texinfo/texindex.
# Run automake in .. to produce Makefile.in from this.
#
# Copyright 2015 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# basic plan: what users invoke will be texindex, a shell script wrapper
# for texindex.awk.
# 
# texindex will be created from texindex.in by configure.
# texindex.awk will be created from ti.twjr by the maintainer (before
# make dist), using the texiwebjr system.

# what we want installed in $(bindir).
dist_bin_SCRIPTS = texindex

# since it's generated, have to clean it explicitly.
CLEANFILES = texindex

# and mention the original source explicitly.
EXTRA_DIST = texindex.in

# we'll put the awk script in $(sharedir)/texinfo.
dist_pkgdata_SCRIPTS = texindex.awk

# since we generate it, have to clean it (at maintainer-clean) explicitly.
MAINTAINERCLEANFILES = texindex.awk

# mention the texiwebjr utilities. they are maintained in another
# repository (see their sources), and updated here manually (see
# ../util/srclist.txt).
noinst_SCRIPTS = jrtangle jrweave

# configure-time variables we use in texindex.in.
do_subst = sed -e 's,[@]pkgdatadir[@],$(pkgdatadir),g' \
               -e 's,[@]AWK[@],$(AWK),g' \
               -e 's,[@]PACKAGE[@],$(PACKAGE),g' \
               -e 's,[@]VERSION[@],$(VERSION),g'

# build the texindex shell wrapper from texindex.in, following automake.
texindex: texindex.in Makefile
	$(do_subst) <$(srcdir)/texindex.in >texindex
	chmod +x texindex

# build texindex.awk from ti.twjr using jrtangle.
texindex.awk: ti.twjr
	$(AWK) -f $(srcdir)/jrtangle $(srcdir)/ti.twjr >texindex.awk \
	|| rm -f texindex.awk

# how to build the pdf of the program-as-document.
ti.pdf: ti.texi
	texi2pdf --tidy ti.texi

ti.html: ti.texi
	makeinfo --no-split --html ti.texi

ti.texi: ti.twjr
	$(AWK) -f $(srcdir)/jrweave $(srcdir)/ti.twjr >ti.texi || rm -f $@

# just a fun cartoon used in the literate document.
EXTRA_DIST += donald_knuth.png
