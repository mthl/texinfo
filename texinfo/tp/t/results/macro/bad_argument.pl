use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'bad_argument'} = {
  'contents' => [
    {
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in macro
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'macro_line' => '
',
        'macrobody' => 'in macro
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
          'text' => 'bar',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'rmacro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'macro_line' => ' bar aaa
',
        'macrobody' => 'in
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
          'text' => 'after-name',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'ggg',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in macro
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'args_index' => {
          'ggg' => 0
        },
        'macro_line' => ' after-name {ggg} more
',
        'macrobody' => 'in macro
'
      }
    }
  ]
};
$result_trees{'bad_argument'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_argument'}{'contents'}[0];
$result_trees{'bad_argument'}{'contents'}[0]{'parent'} = $result_trees{'bad_argument'};
$result_trees{'bad_argument'}{'contents'}[1]{'parent'} = $result_trees{'bad_argument'};
$result_trees{'bad_argument'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'bad_argument'}{'contents'}[2];
$result_trees{'bad_argument'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'bad_argument'}{'contents'}[2];
$result_trees{'bad_argument'}{'contents'}[2]{'parent'} = $result_trees{'bad_argument'};
$result_trees{'bad_argument'}{'contents'}[3]{'parent'} = $result_trees{'bad_argument'};
$result_trees{'bad_argument'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'bad_argument'}{'contents'}[4];
$result_trees{'bad_argument'}{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'bad_argument'}{'contents'}[4];
$result_trees{'bad_argument'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'bad_argument'}{'contents'}[4];
$result_trees{'bad_argument'}{'contents'}[4]{'parent'} = $result_trees{'bad_argument'};

$result_texts{'bad_argument'} = '@macro
in macro
@end macro

@rmacro bar aaa
in
@end rmacro

@macro after-name {ggg} more
in macro
@end macro
';

$result_errors{'bad_argument'} = [
  {
    'error_line' => ':1: @macro requires a name
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@macro requires a name',
    'type' => 'error'
  },
  {
    'error_line' => ':5: Bad syntax for @rmacro
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'Bad syntax for @rmacro',
    'type' => 'error'
  },
  {
    'error_line' => ':9: Bad syntax for @macro
',
    'file_name' => '',
    'line_nr' => 9,
    'macro' => '',
    'text' => 'Bad syntax for @macro',
    'type' => 'error'
  }
];


