use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'node_in_copying'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'copying',
          'contents' => [
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            }
          ],
          'parent' => {}
        }
      ],
      'type' => 'text_root'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'node'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [
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
          'type' => 'empty_line_after_command'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'node_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'node_in_copying'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying'}{'contents'}[0];
$result_trees{'node_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'node_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node_in_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'node_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node_in_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'node_in_copying'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'node_in_copying'}{'contents'}[1];
$result_trees{'node_in_copying'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying'}{'contents'}[1];
$result_trees{'node_in_copying'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'node_in_copying'}{'contents'}[1];
$result_trees{'node_in_copying'}{'contents'}[1]{'parent'} = $result_trees{'node_in_copying'};

$result_texis{'node_in_copying'} = '@copying
@end copying@node node


';


$result_texts{'node_in_copying'} = '
';

$result_errors{'node_in_copying'} = [
  {
    'error_line' => ':2: No matching `@end copying\'
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'No matching `@end copying\'',
    'type' => 'error'
  },
  {
    'error_line' => ':4: Unmatched `@end copying\'
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'Unmatched `@end copying\'',
    'type' => 'error'
  }
];


$result_indices{'node_in_copying'} = undef;


1;
