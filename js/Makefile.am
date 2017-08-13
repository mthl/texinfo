## Process this file with automake to produce Makefile.in
# Copyright (C) 2017  Free Software Foundation, Inc.
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

all: $(examples)

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

## ---------- ##
## Examples.  ##
## ---------- ##

examples = \
  examples/hello-html \
  examples/hello-xhtml \
  examples/kawa-html \
  examples/kawa-xhtml

# Javascript files that will be included in the html pages.  The order
# of those files is the order in which they will be included
js_scripts = \
  modernizr.js \
  info.js

build_xhtml_pages = \
  $(XSLT) --path "$(DOCBOOK_XSL_DIR)/epub3:$(srcdir)/style" \
    --stringparam base.dir ebook/OEBPS/ \
    --stringparam html.script "$(js_scripts)" \
    --stringparam html.stylesheet info.css \
    info-epub.xsl $${xml_file} && \
  sed -e '/<footer>/,/<.footer>/d' <ebook/OEBPS/bk01-toc.xhtml \
    >ebook/OEBPS/ToC.xhtml && \
  rm ebook/OEBPS/bk01-toc.xhtml && \
  for file in ebook/OEBPS/*.xhtml; do \
    mv $$file `echo $$file | sed -e 's/xhtml$$/html/'`; \
  done && \
  for file in ebook/OEBPS/*.html; do \
    sed \
      -e '/<?xml .*>/d' \
      -e '/<script/s|/>|> </script>|' \
      -e 's,</title>,</title><meta charset="utf-8" />,' \
      -e 's/ title="[^"]*"//' \
      -e 's,<header/>,<header></header>,' \
      -i $$file; \
  done && \
  cp style/info.css ebook/OEBPS/info.css && \
  cp $(js_scripts) ebook/OEBPS/ && \
  (test "x$$imgdir" = x || cp -r $$imgdir ebook/OEBPS/) && \
  rm -rf $@ && \
  mv ebook/OEBPS $@; \
  rm -rf ebook

## Fix target to make "Top" id the first page.
.texi.xml:
	$(MAKEINFO) -I=$(srcdir) --docbook $< -o - | \
	sed \
	  -e 's|<book id="-" lang="en">|<book id="book" xmlns="http://docbook.org/ns/docbook" lang="en"><?dbhtml filename="top.html"?>|' \
	  -e 's|<chapter label="" id="Top">|<chapter label="Top" id="Top"><?dbhtml filename="index.html"?>|' \
	  > $@

examples/hello-xhtml: examples/hello/hello.xml
	$(AM_V_GEN)xml_file=examples/hello/hello.xml; imgdir=""; \
	$(build_xhtml_pages)

examples/kawa-xhtml: examples/kawa/kawa.xml
	$(AM_V_GEN)xml_file=examples/kawa/kawa.xml; imgdir=examples/kawa/images; \
	$(build_xhtml_pages)

CLEANFILES = \
  examples/kawa/kawa.xml \
  examples/hello/hello.xml

html_extra_head = '<link rel="stylesheet" type="text/css" href="info-html.css"/><script src="modernizr.js" type="text/javascript"></script><script src="info-html.js" type="text/javascript"></script>'

examples/hello-html: examples/hello/hello.texi
	$(MAKEINFO) -I=$(srcdir) --html \
	  -c EXTRA_HEAD=$(html_extra_head) \
	  examples/hello/hello.texi -o $@ && \
	cp modernizr.js info-html.js style/info-html.css $@

examples/kawa-html: examples/kawa/kawa.texi
	$(MAKEINFO) -I=$(srcdir) --html \
	  -c EXTRA_HEAD=$(html_extra_head) \
	  examples/kawa/kawa.texi -o $@ && \
	cp modernizr.js info-html.js style/info-html.css $@

clean-local:
	rm -rf $(examples)

.PHONY: $(examples)
