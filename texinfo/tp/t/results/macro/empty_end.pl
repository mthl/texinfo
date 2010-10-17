use vars qw(%result_texis %result_trees %result_errors);

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
        'arg_line' => ' foo {aaa, }
',
        'args_index' => {
          'aaa' => 0
        },
        'macrobody' => 'in foo
'
      }
    },
    {
      'parent' => {},
      'text' => '',
      'type' => 'empty_line_after_command'
    }
  ]
};
$result_trees{'empty_end'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_end'}{'contents'}[0];
$result_trees{'empty_end'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'empty_end'}{'contents'}[0];
$result_trees{'empty_end'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_end'}{'contents'}[0];
$result_trees{'empty_end'}{'contents'}[0]{'parent'} = $result_trees{'empty_end'};
$result_trees{'empty_end'}{'contents'}[1]{'parent'} = $result_trees{'empty_end'};

$result_texis{'empty_end'} = '@macro foo {aaa, }
in foo
@end macro';

$result_errors{'empty_end'} = [];


