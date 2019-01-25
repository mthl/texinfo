#! /bin/sh
# This file generated by maintain/regenerate_cmd_tests.sh

if test z"$srcdir" = "z"; then
  srcdir=.
fi

one_test_logs_dir=test_log
diffs_dir=diffs



if test "z$TEX_HTML_TESTS" != z"yes"; then
  echo "Skipping HTML TeX tests that are not easily reproducible"
  exit 77
fi

dir=tex_html
name='math_not_closed'
mkdir -p $dir

"$srcdir"/run_parser_all.sh -dir $dir $name
exit_status=$?
cat $dir/$one_test_logs_dir/$name.log
if test $exit_status = 0 && test -f $dir/$diffs_dir/$name.diff; then
  echo 
  cat $dir/$diffs_dir/$name.diff
fi
exit $exit_status

