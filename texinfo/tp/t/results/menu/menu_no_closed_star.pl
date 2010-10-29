use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'menu_no_closed_star'} = {
  'contents' => [
    {
      'cmdname' => 'menu',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '* '
            }
          ],
          'parent' => {},
          'type' => 'menu_comment'
        }
      ],
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'menu_no_closed_star'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_no_closed_star'}{'contents'}[0];
$result_trees{'menu_no_closed_star'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_no_closed_star'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_no_closed_star'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_no_closed_star'}{'contents'}[0];
$result_trees{'menu_no_closed_star'}{'contents'}[0]{'parent'} = $result_trees{'menu_no_closed_star'};

$result_texis{'menu_no_closed_star'} = '@menu
* @end menu';


$result_texts{'menu_no_closed_star'} = '* ';

$result_errors{'menu_no_closed_star'} = [
  {
    'error_line' => ':2: No matching `@end menu\'
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'No matching `@end menu\'',
    'type' => 'error'
  }
];


1;
