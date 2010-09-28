use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'bad_syntax'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg' => '
'
      }
    },
    {
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg' => ' 
'
      }
    },
    {
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg' => ' ?
'
      }
    },
    {
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg' => ' :-/ hey!
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'gurgl
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
      'cmdname' => 'value',
      'type' => 'unknown'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'bad_syntax'}{'contents'}[0]{'parent'} = $result_trees{'bad_syntax'};
$result_trees{'bad_syntax'}{'contents'}[1]{'parent'} = $result_trees{'bad_syntax'};
$result_trees{'bad_syntax'}{'contents'}[2]{'parent'} = $result_trees{'bad_syntax'};
$result_trees{'bad_syntax'}{'contents'}[3]{'parent'} = $result_trees{'bad_syntax'};
$result_trees{'bad_syntax'}{'contents'}[4]{'parent'} = $result_trees{'bad_syntax'};
$result_trees{'bad_syntax'}{'contents'}[5]{'parent'} = $result_trees{'bad_syntax'};
$result_trees{'bad_syntax'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'bad_syntax'}{'contents'}[6];
$result_trees{'bad_syntax'}{'contents'}[6]{'parent'} = $result_trees{'bad_syntax'};
$result_trees{'bad_syntax'}{'contents'}[7]{'parent'} = $result_trees{'bad_syntax'};
$result_trees{'bad_syntax'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'bad_syntax'}{'contents'}[9];
$result_trees{'bad_syntax'}{'contents'}[9]{'parent'} = $result_trees{'bad_syntax'};

$result_texts{'bad_syntax'} = '
@set
@set
@set
@set

gurgl

@value{unknown}
';

$result_errors{'bad_syntax'} = [
  {
    'error_line' => ':2: @set requires a name
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@set requires a name',
    'type' => 'error'
  },
  {
    'error_line' => ':3: @set requires a name
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@set requires a name',
    'type' => 'error'
  },
  {
    'error_line' => ':4: @set requires a name
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => '@set requires a name',
    'type' => 'error'
  },
  {
    'error_line' => ':5: @set requires a name
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@set requires a name',
    'type' => 'error'
  },
  {
    'error_line' => ':7: Bad syntax for @value
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'Bad syntax for @value',
    'type' => 'error'
  },
  {
    'error_line' => ':9: warning: undefined flag: unknown
',
    'file_name' => '',
    'line_nr' => 9,
    'macro' => '',
    'text' => 'undefined flag: unknown',
    'type' => 'warning'
  }
];


