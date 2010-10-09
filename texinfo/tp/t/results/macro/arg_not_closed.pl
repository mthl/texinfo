use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'arg_not_closed'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'foo',
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
          'text' => 'foo
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'args_index' => {
          'arg' => 0
        },
        'macro_line' => ' foo {arg}
',
        'macrobody' => 'foo
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'call foo
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'arg_not_closed'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'arg_not_closed'}{'contents'}[0];
$result_trees{'arg_not_closed'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'arg_not_closed'}{'contents'}[0];
$result_trees{'arg_not_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'arg_not_closed'}{'contents'}[0];
$result_trees{'arg_not_closed'}{'contents'}[0]{'parent'} = $result_trees{'arg_not_closed'};
$result_trees{'arg_not_closed'}{'contents'}[1]{'parent'} = $result_trees{'arg_not_closed'};
$result_trees{'arg_not_closed'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'arg_not_closed'}{'contents'}[2];
$result_trees{'arg_not_closed'}{'contents'}[2]{'parent'} = $result_trees{'arg_not_closed'};

$result_texts{'arg_not_closed'} = '@macro foo {arg}
foo
@end macro

call foo
';

$result_errors{'arg_not_closed'} = [
  {
    'error_line' => ':5: @foo missing close brace
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@foo missing close brace',
    'type' => 'error'
  }
];


