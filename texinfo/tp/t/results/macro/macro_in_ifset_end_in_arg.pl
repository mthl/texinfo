use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'macro_in_ifset_end_in_arg'} = {
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
        'args_index' => {
          'arg' => 0
        },
        'macro_line' => ' macro1 {arg}
',
        'macrobody' => '@end ifset
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
      'parent' => {},
      'text' => '
'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'in ifset
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'macro_in_ifset_end_in_arg'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_ifset_end_in_arg'}{'contents'}[0];
$result_trees{'macro_in_ifset_end_in_arg'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'macro_in_ifset_end_in_arg'}{'contents'}[0];
$result_trees{'macro_in_ifset_end_in_arg'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_ifset_end_in_arg'}{'contents'}[0];
$result_trees{'macro_in_ifset_end_in_arg'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_ifset_end_in_arg'};
$result_trees{'macro_in_ifset_end_in_arg'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_ifset_end_in_arg'};
$result_trees{'macro_in_ifset_end_in_arg'}{'contents'}[2]{'parent'} = $result_trees{'macro_in_ifset_end_in_arg'};
$result_trees{'macro_in_ifset_end_in_arg'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'macro_in_ifset_end_in_arg'}{'contents'}[3];
$result_trees{'macro_in_ifset_end_in_arg'}{'contents'}[3]{'parent'} = $result_trees{'macro_in_ifset_end_in_arg'};

$result_texts{'macro_in_ifset_end_in_arg'} = '@macro macro1 {arg}
@end ifset
@end macro


in ifset
';

$result_errors{'macro_in_ifset_end_in_arg'} = [
  {
    'error_line' => ':8: Misplaced }
',
    'file_name' => '',
    'line_nr' => 8,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  },
  {
    'error_line' => ':10: Unmatched `@end\'
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => 'Unmatched `@end\'',
    'type' => 'error'
  }
];


