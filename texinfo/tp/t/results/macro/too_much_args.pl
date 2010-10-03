use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'too_much_args'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'twoargs',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'first',
          'type' => 'macro_arg'
        },
        {
          'parent' => {},
          'text' => 'second',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'first arg: \\first\\
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => 'second arg: \\second\\
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'args_index' => {
          'first' => 0,
          'second' => 1
        },
        'macro_line' => ' twoargs {first, second}
',
        'macrobody' => 'first arg: \\first\\
second arg: \\second\\
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
          'text' => 'first arg: one
'
        },
        {
          'parent' => {},
          'text' => 'second arg: two, three.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'too_much_args'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'too_much_args'}{'contents'}[0];
$result_trees{'too_much_args'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'too_much_args'}{'contents'}[0];
$result_trees{'too_much_args'}{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'too_much_args'}{'contents'}[0];
$result_trees{'too_much_args'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'too_much_args'}{'contents'}[0];
$result_trees{'too_much_args'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'too_much_args'}{'contents'}[0];
$result_trees{'too_much_args'}{'contents'}[0]{'parent'} = $result_trees{'too_much_args'};
$result_trees{'too_much_args'}{'contents'}[1]{'parent'} = $result_trees{'too_much_args'};
$result_trees{'too_much_args'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'too_much_args'}{'contents'}[2];
$result_trees{'too_much_args'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'too_much_args'}{'contents'}[2];
$result_trees{'too_much_args'}{'contents'}[2]{'parent'} = $result_trees{'too_much_args'};

$result_texts{'too_much_args'} = '@macro twoargs {first, second}
first arg: \\first\\
second arg: \\second\\
@end macro

first arg: one
second arg: two, three.
';

$result_errors{'too_much_args'} = [];


