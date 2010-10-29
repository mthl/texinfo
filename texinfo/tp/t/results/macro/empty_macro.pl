use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'empty_macro'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'foo',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [],
      'extra' => {
        'arg_line' => ' foo
',
        'macrobody' => ''
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'empty_macro'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_macro'}{'contents'}[0];
$result_trees{'empty_macro'}{'contents'}[0]{'parent'} = $result_trees{'empty_macro'};
$result_trees{'empty_macro'}{'contents'}[1]{'parent'} = $result_trees{'empty_macro'};
$result_trees{'empty_macro'}{'contents'}[2]{'parent'} = $result_trees{'empty_macro'};
$result_trees{'empty_macro'}{'contents'}[3]{'parent'} = $result_trees{'empty_macro'};
$result_trees{'empty_macro'}{'contents'}[4]{'parent'} = $result_trees{'empty_macro'};
$result_trees{'empty_macro'}{'contents'}[5]{'parent'} = $result_trees{'empty_macro'};

$result_texis{'empty_macro'} = '@macro foo
@end macro




';


$result_texts{'empty_macro'} = '



';

$result_errors{'empty_macro'} = [
  {
    'error_line' => ':4: warning: @foo defined with zero or more than one argument should be invoked with {}
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => '@foo defined with zero or more than one argument should be invoked with {}',
    'type' => 'warning'
  }
];


1;
