use 5.00405;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Texinfo::Parser',
    VERSION_FROM      => 'Texinfo/Parser.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    PMLIBDIRS         => [ 'Texinfo' ],
    EXE_FILES         => [ 'texi2any.pl' ],
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'Texinfo/Parser.pm', # retrieve abstract from module
       AUTHOR         => 'Patrice Dumas <pertusus@free.fr>') : ()),
);
