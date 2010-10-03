use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'ifset_in_macro_set'} = {
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
        'args_index' => {
          'arg' => 0
        },
        'macro_line' => ' note {arg}
',
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
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'arg
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
    }
  ]
};
$result_trees{'ifset_in_macro_set'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ifset_in_macro_set'}{'contents'}[0];
$result_trees{'ifset_in_macro_set'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'ifset_in_macro_set'}{'contents'}[0];
$result_trees{'ifset_in_macro_set'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ifset_in_macro_set'}{'contents'}[0];
$result_trees{'ifset_in_macro_set'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'ifset_in_macro_set'}{'contents'}[0];
$result_trees{'ifset_in_macro_set'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'ifset_in_macro_set'}{'contents'}[0];
$result_trees{'ifset_in_macro_set'}{'contents'}[0]{'parent'} = $result_trees{'ifset_in_macro_set'};
$result_trees{'ifset_in_macro_set'}{'contents'}[1]{'parent'} = $result_trees{'ifset_in_macro_set'};
$result_trees{'ifset_in_macro_set'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'ifset_in_macro_set'}{'contents'}[2];
$result_trees{'ifset_in_macro_set'}{'contents'}[2]{'parent'} = $result_trees{'ifset_in_macro_set'};
$result_trees{'ifset_in_macro_set'}{'contents'}[3]{'parent'} = $result_trees{'ifset_in_macro_set'};

$result_texts{'ifset_in_macro_set'} = '@macro note {arg}
@ifset notes 
\\arg\\
@end ifset
@end macro

arg

';

$result_errors{'ifset_in_macro_set'} = [];


