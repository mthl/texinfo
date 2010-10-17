use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'macro_in_ifset'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'macro1',
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
          'text' => '@end ifset
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' macro1 {arg}
',
        'args_index' => {
          'arg' => 0
        },
        'macrobody' => '@end ifset
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
    }
  ]
};
$result_trees{'macro_in_ifset'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_ifset'}{'contents'}[0];
$result_trees{'macro_in_ifset'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'macro_in_ifset'}{'contents'}[0];
$result_trees{'macro_in_ifset'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_ifset'}{'contents'}[0];
$result_trees{'macro_in_ifset'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_ifset'};
$result_trees{'macro_in_ifset'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_ifset'};
$result_trees{'macro_in_ifset'}{'contents'}[2]{'parent'} = $result_trees{'macro_in_ifset'};

$result_texis{'macro_in_ifset'} = '@macro macro1 {arg}
@end ifset
@end macro

';

$result_errors{'macro_in_ifset'} = [];


