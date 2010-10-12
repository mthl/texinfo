use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'ifset_in_macro'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'note',
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
          'text' => '@ifset notes 
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '\\arg\\
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '@end ifset
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' note {arg}
',
        'args_index' => {
          'arg' => 0
        },
        'macrobody' => '@ifset notes 
\\arg\\
@end ifset
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
$result_trees{'ifset_in_macro'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ifset_in_macro'}{'contents'}[0];
$result_trees{'ifset_in_macro'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'ifset_in_macro'}{'contents'}[0];
$result_trees{'ifset_in_macro'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ifset_in_macro'}{'contents'}[0];
$result_trees{'ifset_in_macro'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'ifset_in_macro'}{'contents'}[0];
$result_trees{'ifset_in_macro'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'ifset_in_macro'}{'contents'}[0];
$result_trees{'ifset_in_macro'}{'contents'}[0]{'parent'} = $result_trees{'ifset_in_macro'};
$result_trees{'ifset_in_macro'}{'contents'}[1]{'parent'} = $result_trees{'ifset_in_macro'};
$result_trees{'ifset_in_macro'}{'contents'}[2]{'parent'} = $result_trees{'ifset_in_macro'};

$result_texts{'ifset_in_macro'} = '@macro note {arg}
@ifset notes 
\\arg\\
@end ifset
@end macro

';

$result_errors{'ifset_in_macro'} = [];


