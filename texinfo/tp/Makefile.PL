use 5.00405;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Texinfo::Parser',
    VERSION_FROM      => 'Texinfo/Parser.pm', # finds $VERSION
    PREREQ_PM         => {"Encode" => 0,
                          "Data::Dumper" => 0,
                          "File::Spec" => 0,
                          "Config" => 0,
                          "Carp" => 0,
                          "Unicode::Normalize" => 0,
                          "File::Basename" => 0,
                          "Getopt::Long" => 0,
                         },
    BUILD_REQUIRES    => {"Data::Compare" => 0,
                          "Test::Deep" => 0,
                          "Test::More" => "0.88",
                          "Clone" => 0,
                         },
    PMLIBDIRS         => [ 'Texinfo' ],
    EXE_FILES         => [ 'texi2any.pl' ],
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'Texinfo/Parser.pm', # retrieve abstract from module
       AUTHOR         => 'Patrice Dumas <pertusus@free.fr>') : ()),
);

#package MY;
#sub test 
#{
#  my $inherited = shift->SUPER::test(@_);
#  print STDERR "|$inherited|\n";
#  $inherited;
#}
