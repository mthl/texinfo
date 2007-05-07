SUBDIR_TESTS = GermanNodeTest xemacs texinfo sectionning ccvs viper \
     viper_monolithic texi2html xemacs_frame index_table formatting macros \
     nodes_texinfo singular floats node_translit node_translit_no_unicode \
     node_translit_no_unidecode node_utf8_translit \
     node_utf8_translit_no_unidecode index_split_nodes \
     more_before_top_section node_footnote node_in_chapter_index_split \
     index_nodes tar htmlxref htmlxref-only_mono htmlxref-only_split \
     contents contents_book contents_inline


#check-local:
#	$(srcdir)/test.sh

regenerate:
	-for dir in ${SUBDIR_TESTS}; do \
	[ -d $${dir}_res ] && cp $$dir/*.passfirst $$dir/*.html $$dir/*.htm $$dir/*.2 $$dir/*.passtexi $${dir}_res;\
	done
	-rm -f formatting_res/*_l2h.html formatting_res/tex.2 \
          formatting_res/tex_in_copying.2 formatting_res/math_not_closed.2
	-rm -f singular_res/*_l2h.html singular_res/sing.2

clean-local:
	for dir in ${SUBDIR_TESTS}; do \
	(if [ -d $$dir ]; then cd $$dir && $(RM) -- $$dir $$dir-* *.toc *.aux *.log *.op *.cp *.cps \
	*.fn *.fns *.ky *.kys *.pg *.pgs *.tp *.tps *.vr *.vrs \
	*.dvi *.html *.htm *.info *.info-? *.info-?? *.info-??? *.html_tempnotag \
	*.2  *.passfirst *.passtexi \
	*_?.png *_??.png *_???.png *_l2h_img?.old *_l2h_img??.old *_l2h_img???.old \
	*_l2h_img?.png *_l2h_img??.png *_l2h_img???.png \
	 *_l2h.tex *_l2h.css *_l2h_images.pl *_l2h_images.tex \
	*_l2h_labels.pl *-l2h_cache.pm l2h_cache.pm *.out; fi) ; \
	done
