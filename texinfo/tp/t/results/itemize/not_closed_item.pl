use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'not_closed_item'} = {
  'contents' => [
    {
      'cmdname' => 'itemize',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'cmdname' => 'item',
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'in item
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {}
        }
      ],
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'not_closed_item'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'not_closed_item'}{'contents'}[0];
$result_trees{'not_closed_item'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'not_closed_item'}{'contents'}[0];
$result_trees{'not_closed_item'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'not_closed_item'}{'contents'}[0]{'contents'}[2];
$result_trees{'not_closed_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'not_closed_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'not_closed_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'not_closed_item'}{'contents'}[0]{'contents'}[2];
$result_trees{'not_closed_item'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'not_closed_item'}{'contents'}[0];
$result_trees{'not_closed_item'}{'contents'}[0]{'parent'} = $result_trees{'not_closed_item'};

$result_texis{'not_closed_item'} = '@itemize
@item in item
@end itemize';


$result_texts{'not_closed_item'} = 'in item
';

$result_errors{'not_closed_item'} = [
  {
    'error_line' => ':2: No matching `@end itemize\'
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'No matching `@end itemize\'',
    'type' => 'error'
  }
];


1;
