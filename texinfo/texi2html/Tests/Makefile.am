SUBDIR_TESTS = GermanNodeTest xemacs texinfo sectionning ccvs viper \
     viper_monolithic texi2html xemacs_frame index_table formatting macros


test:
	./test.sh

regenerate:
	for dir in ${SUBDIR_TESTS}; do \
	[ -d $${dir}_res ] && cp $$dir/*.html $$dir/*.2 $$dir/*.passfirst $${dir}_res;\
	done

clean:
	for dir in ${SUBDIR_TESTS}; do \
	(cd $$dir && $(RM) $$dir $$dir-* *.toc *.aux *.log *.op *.cp *.cps \
	*.fn *.fns *.ky *.kys *.pg *.pgs *.tp *.tps *.vr *.vrs \
	*.dvi *.html *.info *.html_tempnotag *.2 *.passfirst ) ; \
	done

.PHONY: test clean
