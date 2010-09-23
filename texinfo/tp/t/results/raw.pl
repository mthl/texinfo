use vars qw(%result_texts %result_trees %result_errors);

################ nested macros
$result_trees{'nested macros'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'truc',
          'type' => 'macro_arg_name'
        },
        {
          'parent' => {},
          'text' => '{ arg,  ex}',
          'type' => 'macro_arg_args'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in macro \\arg\\
',
          'type' => 'raw'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'othermacro',
              'type' => 'macro_arg_name'
            },
            {
              'parent' => {},
              'text' => '',
              'type' => 'macro_arg_args'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'other macro
',
              'type' => 'raw'
            }
          ],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '@macro
',
          'type' => 'raw'
        }
      ],
      'parent' => {}
    }
  ]
};
$result_trees{'nested macros'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'nested macros'}{'contents'}[0];
$result_trees{'nested macros'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'nested macros'}{'contents'}[0];
$result_trees{'nested macros'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested macros'}{'contents'}[0];
$result_trees{'nested macros'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'nested macros'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested macros'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'nested macros'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested macros'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested macros'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested macros'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested macros'}{'contents'}[0];
$result_trees{'nested macros'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested macros'}{'contents'}[0];
$result_trees{'nested macros'}{'contents'}[0]{'parent'} = $result_trees{'nested macros'};

$result_texts{'nested macros'} = '@macro truc { arg,  ex}
in macro \arg\
@macro othermacro 
other macro
@end macro
@macro
@end macro
';

$result_errors{'nested macros'} = [];


################ misc raw
$result_trees{'misc raw'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'cmdname' => 'html',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in html ',
          'type' => 'raw'
        }
      ],
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'cmdname' => 'tex',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in tex
',
          'type' => 'raw'
        }
      ],
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'cmdname' => 'verbatim',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in verbatim
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => 'in verbatim2
',
          'type' => 'raw'
        }
      ],
      'parent' => {}
    }
  ]
};
$result_trees{'misc raw'}{'contents'}[0]{'parent'} = $result_trees{'misc raw'};
$result_trees{'misc raw'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'misc raw'}{'contents'}[1];
$result_trees{'misc raw'}{'contents'}[1]{'parent'} = $result_trees{'misc raw'};
$result_trees{'misc raw'}{'contents'}[2]{'parent'} = $result_trees{'misc raw'};
$result_trees{'misc raw'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'misc raw'}{'contents'}[3];
$result_trees{'misc raw'}{'contents'}[3]{'parent'} = $result_trees{'misc raw'};
$result_trees{'misc raw'}{'contents'}[4]{'parent'} = $result_trees{'misc raw'};
$result_trees{'misc raw'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'misc raw'}{'contents'}[5];
$result_trees{'misc raw'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'misc raw'}{'contents'}[5];
$result_trees{'misc raw'}{'contents'}[5]{'parent'} = $result_trees{'misc raw'};

$result_texts{'misc raw'} = '
@html
in html @end html

@tex
in tex
@end tex

@verbatim
in verbatim
in verbatim2
@end verbatim
';

$result_errors{'misc raw'} = [];


################ misc raw comments
$result_trees{'misc raw comments'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'cmdname' => 'html',
      'contents' => [
        {
          'parent' => {},
          'text' => '@c comment space
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => 'in html ',
          'type' => 'raw'
        }
      ],
      'parent' => {}
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => ' comment no space
',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'c',
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'cmdname' => 'tex',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in tex
',
          'type' => 'raw'
        }
      ],
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '    '
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => ' comment after end tex
',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'c',
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'cmdname' => 'verbatim',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in verbatim @c in verbatim
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => 'in verbatim2
',
          'type' => 'raw'
        }
      ],
      'parent' => {}
    }
  ]
};
$result_trees{'misc raw comments'}{'contents'}[0]{'parent'} = $result_trees{'misc raw comments'};
$result_trees{'misc raw comments'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'misc raw comments'}{'contents'}[1];
$result_trees{'misc raw comments'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'misc raw comments'}{'contents'}[1];
$result_trees{'misc raw comments'}{'contents'}[1]{'parent'} = $result_trees{'misc raw comments'};
$result_trees{'misc raw comments'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'misc raw comments'}{'contents'}[2];
$result_trees{'misc raw comments'}{'contents'}[2]{'parent'} = $result_trees{'misc raw comments'};
$result_trees{'misc raw comments'}{'contents'}[3]{'parent'} = $result_trees{'misc raw comments'};
$result_trees{'misc raw comments'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'misc raw comments'}{'contents'}[4];
$result_trees{'misc raw comments'}{'contents'}[4]{'parent'} = $result_trees{'misc raw comments'};
$result_trees{'misc raw comments'}{'contents'}[5]{'parent'} = $result_trees{'misc raw comments'};
$result_trees{'misc raw comments'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'misc raw comments'}{'contents'}[6];
$result_trees{'misc raw comments'}{'contents'}[6]{'parent'} = $result_trees{'misc raw comments'};
$result_trees{'misc raw comments'}{'contents'}[7]{'parent'} = $result_trees{'misc raw comments'};
$result_trees{'misc raw comments'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'misc raw comments'}{'contents'}[8];
$result_trees{'misc raw comments'}{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'misc raw comments'}{'contents'}[8];
$result_trees{'misc raw comments'}{'contents'}[8]{'parent'} = $result_trees{'misc raw comments'};

$result_texts{'misc raw comments'} = '
@html
@c comment space
in html @end html
@c comment no space

@tex
in tex
@end tex
    @c comment after end tex

@verbatim
in verbatim @c in verbatim
in verbatim2
@end verbatim
';

$result_errors{'misc raw comments'} = [];



1;
