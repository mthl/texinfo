
htmlxref_cnf_tests = htmlxref htmlxref-only_mono htmlxref-only_split
base_tests = \
 formatting encodings \
 $(htmlxref_cnf_tests)
long_tests = \
 sectioning coverage indices nested_formats contents layout

DIST_SUBDIRS = $(base_tests) $(long_tests) many_input_files
SUBDIRS = . many_input_files

copy-tests: copy-base copy-long
	cd many_input_files && $(MAKE) copy-tests

copy-base:
	$(srcdir)/parser_tests.sh -copy $(base_tests)

# this is not used directly when recursively doing long-check from the 
# parent directory as TESTS is set to long_tests.sh, but long_tests.sh
# calls 
copy-long:
	$(srcdir)/parser_tests.sh -copy $(long_tests)

clean-tests:
	$(srcdir)/parser_tests.sh -clean $(base_tests) $(long_tests)

TESTS = parser_base_tests
long_TESTS = long_tests.sh

long-check: all
	$(MAKE) $(AM_MAKEFLAGS) TESTS='$(long_TESTS)' check

all-checks: check long-check

# this is in order to have the files in .texinfo in the build dir
all-local:
	for dir in $(htmlxref_cnf_tests); do \
		if [ -f "$(srcdir)/$$dir/htmlxref.cnf-texinfo" ]; then \
			$(mkdir_p) $$dir/.texinfo/ ; \
			${INSTALL_DATA} "$(srcdir)/$$dir/htmlxref.cnf-texinfo" $$dir/.texinfo/ ; \
		fi; \
		if [ -f $(srcdir)/$$dir/htmlxref.cnf-ref ]; then \
			${INSTALL_DATA} "$(srcdir)/$$dir/htmlxref.cnf-ref" $$dir/htmlxref.cnf ; \
		fi; \
	done
	${INSTALL_DATA} $(srcdir)/sectioning/renamednodes.cnf-ref sectioning/equivalent_nodes-noderename.cnf

clean-local:
	for dir in $(htmlxref_cnf_tests); do \
		rm -rf $$dir/.texinfo/ $$dir/htmlxref.cnf ; \
	done
	rm -f sectioning/equivalent_nodes-noderename.cnf

EXTRA_DIST = run_parser_all.sh parser_tests.sh \
 $(TESTS) $(long_TESTS) coverage_macro.texi
