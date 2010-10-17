use vars qw(%result_texis %result_trees %result_errors);

$result_trees{'bad_formal_arg'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'bad',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => '',
          'type' => 'macro_arg'
        },
        {
          'parent' => {},
          'text' => 'not_empty',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in bad macro
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' bad  { , not_empty}
',
        'args_index' => {
          '' => 0,
          'not_empty' => 1
        },
        'macrobody' => 'in bad macro
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'bad-space',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'first',
          'type' => 'macro_arg'
        },
        {
          'parent' => {},
          'text' => 'in 2arg',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'bad space
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' bad-space{first, in 2arg}
',
        'args_index' => {
          'first' => 0,
          'in 2arg' => 1
        },
        'macrobody' => 'bad space
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'bar',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => ':::',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in bar
',
          'type' => 'raw'
        },
        {
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'in macro foo
',
              'type' => 'raw'
            }
          ],
          'parent' => {},
          'special' => {
            'arg_line' => ' foo {? aaa}
'
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' bar {:::}
',
        'args_index' => {
          ':::' => 0
        },
        'macrobody' => 'in bar
@macro foo {? aaa}
in macro foo
@end macro
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ]
};
$result_trees{'bad_formal_arg'}{'contents'}[0]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[1];
$result_trees{'bad_formal_arg'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[1];
$result_trees{'bad_formal_arg'}{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[1];
$result_trees{'bad_formal_arg'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[1];
$result_trees{'bad_formal_arg'}{'contents'}[1]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[2]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[3]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[4];
$result_trees{'bad_formal_arg'}{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[4];
$result_trees{'bad_formal_arg'}{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[4];
$result_trees{'bad_formal_arg'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[4];
$result_trees{'bad_formal_arg'}{'contents'}[4]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[5]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[6]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[7];
$result_trees{'bad_formal_arg'}{'contents'}[7]{'args'}[1]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[7];
$result_trees{'bad_formal_arg'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[7];
$result_trees{'bad_formal_arg'}{'contents'}[7]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[7]{'contents'}[1];
$result_trees{'bad_formal_arg'}{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[7];
$result_trees{'bad_formal_arg'}{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[7];
$result_trees{'bad_formal_arg'}{'contents'}[7]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[8]{'parent'} = $result_trees{'bad_formal_arg'};

$result_texis{'bad_formal_arg'} = '
@macro bad  { , not_empty}
in bad macro
@end macro

@macro bad-space{first, in 2arg}
bad space
@end macro

@macro bar {:::}
in bar
@macro foo {? aaa}
in macro foo
@end macro
@end macro
';

$result_errors{'bad_formal_arg'} = [
  {
    'error_line' => ':2: Bad or empty @macro formal argument: 
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Bad or empty @macro formal argument: ',
    'type' => 'error'
  },
  {
    'error_line' => ':6: Bad or empty @macro formal argument: in 2arg
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => 'Bad or empty @macro formal argument: in 2arg',
    'type' => 'error'
  },
  {
    'error_line' => ':10: Bad or empty @macro formal argument: :::
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => 'Bad or empty @macro formal argument: :::',
    'type' => 'error'
  }
];


