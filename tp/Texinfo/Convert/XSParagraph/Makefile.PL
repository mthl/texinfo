use 5.018001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

# Non numeric characters are not accepted by XS.
# FIXME instead pass -noversioncheck to xsubpp?
# REMARK MM->parse_version is part of an internal API, so could change in
# the future.
my $version = MM->parse_version('XSParagraph.pm');
$version =~ s/[[:alpha:]]+//i;

WriteMakefile(
    NAME              => 'Texinfo::Convert::XSParagraph::XSParagraph',
#    VERSION_FROM      => 'XSParagraph.pm', # finds $VERSION
    VERSION           => $version, 
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (AUTHOR         => 'Gavin Smith  <gavinsmith0123@gmail.com>') : ()),
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-I.', # e.g., '-I. -I/usr/include/other'
	# Un-comment this if you add C files to link with later:
    OBJECT            => '$(O_FILES)', # link all the C files too
    #'MYEXTLIB' => 'mylib/libxspara.a',
);

sub MY::postable {
'
$(MYEXTLIB): Makefile
	cd mylib && $(MAKE) $(PASSTHRU)
';
}
