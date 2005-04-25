# Makefile.am for texinfo.
# $Id: Makefile.am,v 1.15 2005-04-25 00:28:31 karl Exp $
# Process this file with automake to produce Makefile.in in all directories.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# Be sure we're using the right version of Automake.
AUTOMAKE_OPTIONS = 1.8 readme-alpha

# Additional files to distribute.
EXTRA_DIST = ChangeLog.46 INSTALL.generic INTRODUCTION README.dev \
  config.rpath \
  djgpp/README djgpp/config.bat djgpp/config.sed djgpp/config.site

# This is to prevent texinfo.tex from being included in the top-level
# distribution directory.
TEXINFO_TEX = doc/texinfo.tex

if TOOLS_ONLY
  # Build native tools only.
  SUBDIRS = lib info makeinfo util
else
  # All subdirectories.
  # Do lib first since the C programs depend on it.
  # Do doc last so makeinfo will be built when we get there.
  # Others are alphabetical.
  SUBDIRS = $(native_tools) lib info makeinfo po util doc
endif

ACLOCAL_AMFLAGS = -I m4

# One special target for installers to use by hand if desired.
install-tex:
	cd doc && $(MAKE) TEXMF=$(TEXMF) install-tex

distclean-local:
	-test -d "$(native_tools)" && rm -rf "$(native_tools)"

# Don't install native tools for cross compile.
if TOOLS_ONLY
install:

endif
