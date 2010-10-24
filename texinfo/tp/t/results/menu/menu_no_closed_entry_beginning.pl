use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'menu_no_closed_entry_beginning'} = {
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
              'text' => '* node'
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
$result_trees{'menu_no_closed_entry_beginning'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_no_closed_entry_beginning'}{'contents'}[0];
$result_trees{'menu_no_closed_entry_beginning'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_no_closed_entry_beginning'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_no_closed_entry_beginning'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_no_closed_entry_beginning'}{'contents'}[0];
$result_trees{'menu_no_closed_entry_beginning'}{'contents'}[0]{'parent'} = $result_trees{'menu_no_closed_entry_beginning'};

$result_texis{'menu_no_closed_entry_beginning'} = '@menu
* node@end menu';


$result_texts{'menu_no_closed_entry_beginning'} = '* node';

$result_errors{'menu_no_closed_entry_beginning'} = [
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


$result_indices{'menu_no_closed_entry_beginning'} = undef;


1;
