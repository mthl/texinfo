SUBDIR_TESTS = GermanNodeTest xemacs texinfo sectionning ccvs viper \
     viper_monolithic texi2html xemacs_frame index_table formatting macros \
     nodes_texinfo


check-local:
	$(srcdir)/test.sh

regenerate:
	for dir in ${SUBDIR_TESTS}; do \
	[ -d $${dir}_res ] && cp $$dir/*.html $$dir/*.2 $$dir/*.passfirst $${dir}_res;\
	done

clean-local:
	for dir in ${SUBDIR_TESTS}; do \
	(cd $$dir && $(RM) -- $$dir $$dir-* *.toc *.aux *.log *.op *.cp *.cps \
	*.fn *.fns *.ky *.kys *.pg *.pgs *.tp *.tps *.vr *.vrs \
	*.dvi *.html *.info *.info-? *.info-?? *.info-??? *.html_tempnotag \
	*.2  *.passfirst *.passtexi \
	*_?.png *_l2h.tex *_l2h.css *_l2h_images.pl *_l2h_images.tex \
	*_l2h_labels.pl l2h_cache.pm) ; \
	done
