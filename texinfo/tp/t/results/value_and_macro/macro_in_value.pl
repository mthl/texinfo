use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'macro_in_value'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'ab',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'a
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => 'b
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'macro_line' => ' ab
',
        'macrobody' => 'a

b
'
      }
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
          'text' => 'flagab',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@ab',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'flagab: a
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
      'type' => 'empty_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'b
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'macro_in_value'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_value'}{'contents'}[0];
$result_trees{'macro_in_value'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_value'}{'contents'}[0];
$result_trees{'macro_in_value'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_value'}{'contents'}[0];
$result_trees{'macro_in_value'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_value'}{'contents'}[0];
$result_trees{'macro_in_value'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_value'};
$result_trees{'macro_in_value'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_value'};
$result_trees{'macro_in_value'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'macro_in_value'}{'contents'}[2];
$result_trees{'macro_in_value'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'macro_in_value'}{'contents'}[2];
$result_trees{'macro_in_value'}{'contents'}[2]{'parent'} = $result_trees{'macro_in_value'};
$result_trees{'macro_in_value'}{'contents'}[3]{'parent'} = $result_trees{'macro_in_value'};
$result_trees{'macro_in_value'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'macro_in_value'}{'contents'}[4];
$result_trees{'macro_in_value'}{'contents'}[4]{'parent'} = $result_trees{'macro_in_value'};
$result_trees{'macro_in_value'}{'contents'}[5]{'parent'} = $result_trees{'macro_in_value'};
$result_trees{'macro_in_value'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'macro_in_value'}{'contents'}[6];
$result_trees{'macro_in_value'}{'contents'}[6]{'parent'} = $result_trees{'macro_in_value'};

$result_texts{'macro_in_value'} = '@macro ab
a

b
@end macro

@set flagab @ab

flagab: a

b
';

$result_errors{'macro_in_value'} = [
  {
    'error_line' => ':9: warning: @ab defined with zero or more than one argument should be invoked with {}
',
    'file_name' => '',
    'line_nr' => 9,
    'macro' => '',
    'text' => '@ab defined with zero or more than one argument should be invoked with {}',
    'type' => 'warning'
  }
];


