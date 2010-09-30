use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'empty_end'} = {
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
          'text' => 'aaa',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in foo
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'args_index' => {
          'aaa' => 0
        },
        'macro_line' => ' foo {aaa, }
',
        'macrobody' => 'in foo
'
      }
    }
  ]
};
$result_trees{'empty_end'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_end'}{'contents'}[0];
$result_trees{'empty_end'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'empty_end'}{'contents'}[0];
$result_trees{'empty_end'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_end'}{'contents'}[0];
$result_trees{'empty_end'}{'contents'}[0]{'parent'} = $result_trees{'empty_end'};

$result_texts{'empty_end'} = '@macro foo {aaa, }
in foo
@end macro
';

$result_errors{'empty_end'} = [];


