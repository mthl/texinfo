SUBDIR_TESTS = GermanNodeTest xemacs texinfo sectionning ccvs viper \
     viper_monolithic texi2html xemacs_frame


test:
	./test.sh

regenerate:
	for dir in ${SUBDIR_TESTS}; do \
	[ -d $${dir}_res ] && cp $$dir/*.html $${dir}_res;\
	done

clean:
	for dir in ${SUBDIR_TESTS}; do \
	(cd $$dir && $(RM) $$dir $$dir-* *.toc *.aux *.log *.op *.cp *.cps \
	*.fn *.fns *.ky *.kys *.pg *.pgs *.tp *.tps *.vr *.vrs \
	*.dvi *.html *.info *.html_tempnotag ) ; \
	done
	${RM} res.2

.PHONY: test clean
