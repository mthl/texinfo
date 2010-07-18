EXTRA_DIST = run_test.sh run_test_all.sh tests.sh $(TESTS) long_tests \
 coverage_macro.texi
base_tests = \
 macros sectionning formatting coverage info_coverage encodings indices \
 layout nested_formats contents \
 $(htmlxref_cnf_tests) invalid
long_tests = \
 misc manuals xemacs_manual texi2html_manual tar_manual singular_manual
htmlxref_cnf_tests = htmlxref htmlxref-only_mono htmlxref-only_split

DIST_SUBDIRS = $(base_tests) $(long_tests) many_input_files
SUBDIRS = . many_input_files

copy-tests: copy-base copy-long
	cd many_input_files && $(MAKE) copy-tests

copy-base:
	$(srcdir)/tests.sh all -copy $(base_tests)
#	cp $(srcdir)/formatting/res/texi_formatting/formatting.texi $(srcdir)/formatting/formatting_for_makeinfo.texi

copy-long:
	$(srcdir)/tests.sh all -copy $(long_tests)

clean-tests:
	$(srcdir)/tests.sh all -clean $(base_tests) $(long_tests)

TESTS = base_tests

# mimic automake check for an optional
long-check:
	@srcdir=$(srcdir); export srcdir; \
	tst=tests.sh; failed=0; \
	if test -f ./$$tst; then dir=./; \
	elif test -f $$tst; then dir=; \
	else dir="$(srcdir)/"; fi; \
	if $(TESTS_ENVIRONMENT) $${dir}$$tst all $(long_tests); then :; \
	else failed="1"; fi ; \
	if  test "$$failed" -ne 0; then \
	  echo "FAIL: long_test"; \
	  echo "========================================="; \
	  echo "Failure of long_tests"; \
	  if test -n "$(PACKAGE_BUGREPORT)"; then \
	    echo "Please report to $(PACKAGE_BUGREPORT)"; \
	  fi; \
	  echo "========================================="; \
	else \
	  echo "PASS: long_test"; \
	  echo "================"; \
	  echo "long_test passed"; \
	  echo "================"; \
	fi ;\
	test "$$failed" -eq 0;

all-checks: check long-check

# this is in order to have the files in .texinfo in the build dir
all-local:
	for dir in $(htmlxref_cnf_tests); do \
		$(mkdir_p) $$dir/.texinfo/ ; \
		${INSTALL_DATA} $(srcdir)/$$dir/htmlxref.cnf $$dir/.texinfo/ ; \
	done
	${INSTALL_DATA} $(srcdir)/sectionning/renamednodes.cnf-ref sectionning/equivalent_nodes-noderename.cnf

clean-local:
	for dir in $(htmlxref_cnf_tests); do \
		rm -rf $$dir/.texinfo/ ; \
	done
	rm -f sectionning/equivalent_nodes-noderename.cnf
