 use ExtUtils::MakeMaker;
$Verbose = 1;
WriteMakefile(
	NAME   => 'XSParagraph::mylib',
	SKIP   => [qw(all static static_lib dynamic dynamic_lib)],
	CCFLAGS => '-fno-diagnostics-show-caret -g -O0',
	clean  => {'FILES' => 'libxspara$(LIB_EXT)'},
);


sub MY::top_targets {
        '
all :: static

pure_all :: static

static ::       libxspara$(LIB_EXT)

libxspara$(LIB_EXT): $(O_FILES)
	$(AR) cr libxspara$(LIB_EXT) $(O_FILES)
	$(RANLIB) libxspara$(LIB_EXT)

';
}

