SUBDIR_TESTS = GermanNodeTest xemacs texinfo sectionning cvs viper \
     viper_monolithic texi2html


test:
	./test.sh

clean:
	for dir in ${SUBDIR_TESTS}; do \
	(cd $$dir && $(RM) $$dir $$dir-* *.toc *.aux *.log *.op *.cp *.cps \
	*.fn *.fns *.ky *.kys *.pg *.pgs *.tp *.tps *.vr *.vrs \
	*.dvi *.html *.info ) ; \
	done
	${RM} res.2

.PHONY: test clean
