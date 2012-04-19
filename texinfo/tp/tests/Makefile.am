base_tests = \
 formatting htmlxref htmlxref-only_mono htmlxref-only_split
long_tests = \
 tex_html sectioning coverage indices nested_formats contents layout

DIST_SUBDIRS = many_input_files $(base_tests) $(long_tests)
SUBDIRS = . many_input_files

copy-tests: copy-base copy-long
	cd many_input_files && $(MAKE) copy-tests

copy-base:
	$(srcdir)/parser_tests.sh -copy $(base_tests)

copy-long:
	$(srcdir)/parser_tests.sh -copy $(long_tests)

clean-tests:
	$(srcdir)/parser_tests.sh -clean $(base_tests) $(long_tests)

TESTS = parser_base_tests long_tests.sh

long-check: all
	$(MAKE) $(AM_MAKEFLAGS) check LONG_TESTS=yes

all-checks: all
	$(MAKE) $(AM_MAKEFLAGS) check ALL_TESTS=yes

# this is in order to have the htmlxref.cnf files in the build dir.
# This is done in this directory to be sure that the files are there
# when check is done in this directory.
all-local: htmlxref/htmlxref.cnf htmlxref-only_mono/htmlxref.cnf \
 htmlxref-only_split/htmlxref.cnf htmlxref-only_split/.texinfo/htmlxref.cnf \
 sectioning/equivalent_nodes-noderename.cnf

htmlxref/htmlxref.cnf: htmlxref/htmlxref.cnf-ref
	${INSTALL_DATA} $< $@

htmlxref-only_mono/htmlxref.cnf: htmlxref-only_mono/htmlxref.cnf-ref
	${INSTALL_DATA} $< $@

htmlxref-only_split/htmlxref.cnf: htmlxref-only_split/htmlxref.cnf-ref
	${INSTALL_DATA} $< $@

htmlxref-only_split/.texinfo/htmlxref.cnf: \
 htmlxref-only_split/htmlxref.cnf-texinfo htmlxref-only_split/.texinfo
	${INSTALL_DATA} $< $@

htmlxref-only_split/.texinfo:
	$(mkdir_p) $@

sectioning/equivalent_nodes-noderename.cnf: sectioning/renamednodes.cnf-ref
	${INSTALL_DATA} $< $@

EXTRA_DIST = run_parser_all.sh parser_tests.sh \
 $(TESTS) $(long_TESTS) coverage_macro.texi
