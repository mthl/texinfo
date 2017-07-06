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

NODE_BIN = node_modules/.bin

all: $(examples)

lint:
	$(NODE_BIN)/eslint -c build-aux/eslint.json info.js -f unix

minify:
	$(NODE_BIN)/uglifyjs info.js -o info.min.js

modernizr:
	$(NODE_BIN)/modernizr -c build-aux/modernizr.json

.PHONY: lint minify modernizr

## ---------- ##
## Examples.  ##
## ---------- ##

examples = \
  examples/hello-html \
  examples/kawa-html

build_html_pages = \
  $(XSLT) --path "$(DOCBOOK_XSL_DIR)/epub3:$(srcdir)/style" \
    --stringparam base.dir ebook/OEBPS/ \
    --stringparam html.script info.js \
    --stringparam html.stylesheet info.css \
    --stringparam chunker.output.encoding UTF-8 \
    --stringparam generate.section.toc.level 0 \
    --stringparam generate.index 1 \
    --stringparam use.id.as.filename 1 \
    --stringparam autotoc.label.in.hyperlink 0 \
    --stringparam chunker.output.indent yes \
    --stringparam chunk.first.sections 1 \
    --stringparam chunk.section.depth 1 \
    --stringparam chapter.autolabel 0 \
    --stringparam chunk.fast 1 \
    --stringparam toc.max.depth 4 \
    --stringparam toc.list.type ul \
    --stringparam toc.section.depth 3 \
    --stringparam chunk.separate.lots 1 \
    --stringparam chunk.tocs.and.lots 1 \
    info-epub.xsl $${xml_file} && \
  sed -e '/<footer>/,/<.footer>/d' <ebook/OEBPS/bk01-toc.xhtml \
    >ebook/OEBPS/ToC.xhtml && \
  rm ebook/OEBPS/bk01-toc.xhtml && \
  for file in ebook/OEBPS/*.xhtml; do \
    sed -e '/<?xml .*>/d' -e '/<script/s|/>|> </script>|' -i $$file; done && \
  mv ebook/OEBPS/index.xhtml ebook/OEBPS/index.html && \
  cp style/info.css ebook/OEBPS/info.css && \
  cp info.js ebook/OEBPS/ && \
  rm -rf $@ && \
  mv ebook/OEBPS $@; \
  rm -rf ebook

.texi.xml:
	$(MAKEINFO) -I=$(srcdir) --docbook $< -o $@

examples/hello-html: examples/hello/hello.xml
	$(AM_V_GEN)xml_file=examples/hello/hello.xml; \
	$(build_html_pages)

examples/kawa-html: examples/kawa/kawa.xml
	$(AM_V_GEN)xml_file=examples/kawa/kawa.xml; \
	$(build_html_pages)

.PHONY: $(examples)
