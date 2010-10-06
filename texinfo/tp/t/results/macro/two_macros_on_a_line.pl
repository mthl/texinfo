use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'two_macros_on_a_line'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'mymacro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in mymacro
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'macro_line' => ' mymacro
',
        'macrobody' => 'in mymacro
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'mymacro_with_args',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'arg',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in with args
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => 'now the arg \\arg\\
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => 'after
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'args_index' => {
          'arg' => 0
        },
        'macro_line' => ' mymacro_with_args{arg}
',
        'macrobody' => 'in with args
now the arg \\arg\\
after
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'mymacro'
        },
        {
          'cmdname' => '{',
          'parent' => {}
        },
        {
          'cmdname' => '}',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' '
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'mymacro'
        },
        {
          'cmdname' => '{',
          'parent' => {}
        },
        {
          'cmdname' => '}',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        },
        {
          'parent' => {},
          'text' => 'in mymacro in mymacro
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'mymacro '
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'mymacro'
        },
        {
          'cmdname' => '{',
          'parent' => {}
        },
        {
          'cmdname' => '}',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        },
        {
          'parent' => {},
          'text' => 'in mymacro in mymacro
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'mymacro'
        },
        {
          'cmdname' => '{',
          'parent' => {}
        },
        {
          'cmdname' => '}',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' '
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'mymacro
'
        },
        {
          'parent' => {},
          'text' => 'in mymacro in mymacro
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'with args
'
        },
        {
          'parent' => {},
          'text' => 'in with args
'
        },
        {
          'parent' => {},
          'text' => 'now the arg an
'
        },
        {
          'parent' => {},
          'text' => 'arg
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'in macro
'
        },
        {
          'parent' => {},
          'text' => 'after in mymacro
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'two_macros_on_a_line'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[0];
$result_trees{'two_macros_on_a_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[0];
$result_trees{'two_macros_on_a_line'}{'contents'}[0]{'parent'} = $result_trees{'two_macros_on_a_line'};
$result_trees{'two_macros_on_a_line'}{'contents'}[1]{'parent'} = $result_trees{'two_macros_on_a_line'};
$result_trees{'two_macros_on_a_line'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[2];
$result_trees{'two_macros_on_a_line'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[2];
$result_trees{'two_macros_on_a_line'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[2];
$result_trees{'two_macros_on_a_line'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[2];
$result_trees{'two_macros_on_a_line'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[2];
$result_trees{'two_macros_on_a_line'}{'contents'}[2]{'parent'} = $result_trees{'two_macros_on_a_line'};
$result_trees{'two_macros_on_a_line'}{'contents'}[3]{'parent'} = $result_trees{'two_macros_on_a_line'};
$result_trees{'two_macros_on_a_line'}{'contents'}[4]{'parent'} = $result_trees{'two_macros_on_a_line'};
$result_trees{'two_macros_on_a_line'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[5];
$result_trees{'two_macros_on_a_line'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[5];
$result_trees{'two_macros_on_a_line'}{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[5];
$result_trees{'two_macros_on_a_line'}{'contents'}[5]{'contents'}[3]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[5];
$result_trees{'two_macros_on_a_line'}{'contents'}[5]{'contents'}[4]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[5];
$result_trees{'two_macros_on_a_line'}{'contents'}[5]{'contents'}[5]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[5];
$result_trees{'two_macros_on_a_line'}{'contents'}[5]{'contents'}[6]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[5];
$result_trees{'two_macros_on_a_line'}{'contents'}[5]{'contents'}[7]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[5];
$result_trees{'two_macros_on_a_line'}{'contents'}[5]{'contents'}[8]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[5];
$result_trees{'two_macros_on_a_line'}{'contents'}[5]{'contents'}[9]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[5];
$result_trees{'two_macros_on_a_line'}{'contents'}[5]{'contents'}[10]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[5];
$result_trees{'two_macros_on_a_line'}{'contents'}[5]{'parent'} = $result_trees{'two_macros_on_a_line'};
$result_trees{'two_macros_on_a_line'}{'contents'}[6]{'parent'} = $result_trees{'two_macros_on_a_line'};
$result_trees{'two_macros_on_a_line'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[7];
$result_trees{'two_macros_on_a_line'}{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[7];
$result_trees{'two_macros_on_a_line'}{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[7];
$result_trees{'two_macros_on_a_line'}{'contents'}[7]{'contents'}[3]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[7];
$result_trees{'two_macros_on_a_line'}{'contents'}[7]{'contents'}[4]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[7];
$result_trees{'two_macros_on_a_line'}{'contents'}[7]{'contents'}[5]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[7];
$result_trees{'two_macros_on_a_line'}{'contents'}[7]{'contents'}[6]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[7];
$result_trees{'two_macros_on_a_line'}{'contents'}[7]{'contents'}[7]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[7];
$result_trees{'two_macros_on_a_line'}{'contents'}[7]{'parent'} = $result_trees{'two_macros_on_a_line'};
$result_trees{'two_macros_on_a_line'}{'contents'}[8]{'parent'} = $result_trees{'two_macros_on_a_line'};
$result_trees{'two_macros_on_a_line'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[9];
$result_trees{'two_macros_on_a_line'}{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[9];
$result_trees{'two_macros_on_a_line'}{'contents'}[9]{'contents'}[2]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[9];
$result_trees{'two_macros_on_a_line'}{'contents'}[9]{'contents'}[3]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[9];
$result_trees{'two_macros_on_a_line'}{'contents'}[9]{'contents'}[4]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[9];
$result_trees{'two_macros_on_a_line'}{'contents'}[9]{'contents'}[5]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[9];
$result_trees{'two_macros_on_a_line'}{'contents'}[9]{'contents'}[6]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[9];
$result_trees{'two_macros_on_a_line'}{'contents'}[9]{'contents'}[7]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[9];
$result_trees{'two_macros_on_a_line'}{'contents'}[9]{'parent'} = $result_trees{'two_macros_on_a_line'};
$result_trees{'two_macros_on_a_line'}{'contents'}[10]{'parent'} = $result_trees{'two_macros_on_a_line'};
$result_trees{'two_macros_on_a_line'}{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[11];
$result_trees{'two_macros_on_a_line'}{'contents'}[11]{'contents'}[1]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[11];
$result_trees{'two_macros_on_a_line'}{'contents'}[11]{'contents'}[2]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[11];
$result_trees{'two_macros_on_a_line'}{'contents'}[11]{'contents'}[3]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[11];
$result_trees{'two_macros_on_a_line'}{'contents'}[11]{'parent'} = $result_trees{'two_macros_on_a_line'};
$result_trees{'two_macros_on_a_line'}{'contents'}[12]{'parent'} = $result_trees{'two_macros_on_a_line'};
$result_trees{'two_macros_on_a_line'}{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[13];
$result_trees{'two_macros_on_a_line'}{'contents'}[13]{'contents'}[1]{'parent'} = $result_trees{'two_macros_on_a_line'}{'contents'}[13];
$result_trees{'two_macros_on_a_line'}{'contents'}[13]{'parent'} = $result_trees{'two_macros_on_a_line'};

$result_texts{'two_macros_on_a_line'} = '@macro mymacro
in mymacro
@end macro

@macro mymacro_with_args{arg}
in with args
now the arg \\arg\\
after
@end macro


@@mymacro@{@} @@mymacro@{@}
in mymacro in mymacro

@@mymacro @@mymacro@{@}
in mymacro in mymacro

@@mymacro@{@} @@mymacro
in mymacro in mymacro

with args
in with args
now the arg an
arg

in macro
after in mymacro
';

$result_errors{'two_macros_on_a_line'} = [
  {
    'error_line' => ':16: warning: @mymacro defined with zero or more than one argument should be invoked with {}
',
    'file_name' => '',
    'line_nr' => 16,
    'macro' => '',
    'text' => '@mymacro defined with zero or more than one argument should be invoked with {}',
    'type' => 'warning'
  },
  {
    'error_line' => ':19: warning: @mymacro defined with zero or more than one argument should be invoked with {}
',
    'file_name' => '',
    'line_nr' => 19,
    'macro' => '',
    'text' => '@mymacro defined with zero or more than one argument should be invoked with {}',
    'type' => 'warning'
  }
];


