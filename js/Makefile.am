## Process this file with automake to produce Makefile.in
# Copyright (C) 2017-2018  Free Software Foundation, Inc.
#
# This file is part of GNU Texinfo.
#
# GNU Texinfo is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# GNU Texinfo is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Texinfo.  If not, see <http://www.gnu.org/licenses/>.


phony =

if HAVE_ESLINT
phony += lint
lint:
	$(ESLINT) -c build-aux/eslint.json info.js -f unix
endif

if HAVE_TYPESCRIPT
phony += check-types
check-types:
	$(TSC) --allowJs --checkJS --noEmit --lib dom,es2017 info.js
endif

if HAVE_UGLIFYJS
phony += minify
minify:
	$(UGLIFYJS) info.js -o info.min.js --mangle --compress
endif

if HAVE_MODERNIZR
phony += modernizr
modernizr:
	$(MODERNIZR) -c build-aux/modernizr.json
endif

.PHONY: $(phony)
EXTRA_DIST =

# Javascript files that will be included in the html pages.  The order
# of those files is the order in which they will be included
js_scripts = \
  modernizr.js \
  info.js

dist_pkgdata_DATA=$(js_scripts) info.css

bin_SCRIPTS = texinfo-js
EXTRA_DIST += texinfo-js.in

texinfo-js: texinfo-js.in
	sed -e 's,@pkgdatadir@,'$(pkgdatadir)',g' $(srcdir)/texinfo-js.in >$@
	chmod a+x $@

EXTRA_DIST += HACKING README TODO \
	      build-aux/eslint.json \
	      build-aux/modernizr.json \
	      modernizr.js \
	      package.json \
	      server.js \
	      tsconfig.json \
	      yarn.lock

info_TEXINFOS=texinfo-js.texi
EXTRA_DIST += fdl.texi

## ---------- ##
## Examples.  ##
## ---------- ##

examples: $(examples)

examples = \
  examples/hello-html \
  examples/kawa-html

examples_src = \
  examples/hello \
  examples/kawa \
  kawa.css

EXTRA_DIST += $(examples_src)


hello_extra_head = '<link rel="stylesheet" type="text/css" href="info.css"/><script src="modernizr.js" type="text/javascript"></script><script src="info.js" type="text/javascript"></script>'

examples/hello-html: examples/hello/hello.texi
	$(MAKEINFO) -I=$(srcdir) --html \
	  -c EXTRA_HEAD=$(hello_extra_head) \
	  examples/hello/hello.texi -o $@ && \
	cp $(js_scripts) info.css $@

kawa_extra_head = '<link rel="stylesheet" type="text/css" href="info.css"/><link rel="stylesheet" type="text/css" href="kawa.css"/><script src="modernizr.js" type="text/javascript"></script><script src="info.js" type="text/javascript"></script>'

examples/kawa-html: examples/kawa/kawa.texi
	$(MAKEINFO) -I=$(srcdir) --html \
	  -c EXTRA_HEAD=$(kawa_extra_head) \
	  examples/kawa/kawa.texi -o $@ && \
	cp $(js_scripts) info.css kawa.css $@

clean-local:
	rm -rf $(examples)

.PHONY: $(examples)
