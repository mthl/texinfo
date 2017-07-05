XSLT = xsltproc
DOCBOOK_XSL_DIR = /usr/share/sgml/docbook/xsl-ns-stylesheets

%D%/hello.xml: %D%/hello.texi
	$(MAKEINFO) -I=$(srcdir) --docbook $< -o $@

hello-html: %D%/hello.xml
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
	  %D%/info-epub.xsl $<
	sed -e '/<footer>/,/<.footer>/d' <ebook/OEBPS/bk01-toc.xhtml \
	  >ebook/OEBPS/ToC.xhtml
	rm ebook/OEBPS/bk01-toc.xhtml
	for file in ebook/OEBPS/*.xhtml; do \
	  sed -e '/<?xml .*>/d' -e '/<script/s|/>|> </script>|' -i $$file; done
	mv ebook/OEBPS/index.xhtml ebook/OEBPS/index.html
	cp style/info.css ebook/OEBPS/info.css
	cp info.js ebook/OEBPS/

PHONY += hello-html
