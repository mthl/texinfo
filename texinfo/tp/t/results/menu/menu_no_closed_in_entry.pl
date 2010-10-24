use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'menu_no_closed_in_entry'} = {
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
          'args' => [
            {
              'parent' => {},
              'text' => '* ',
              'type' => 'menu_entry_leading_text'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a1'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ':',
              'type' => 'menu_entry_separator'
            }
          ],
          'parent' => {},
          'type' => 'menu_entry'
        }
      ],
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'menu_no_closed_in_entry'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_no_closed_in_entry'}{'contents'}[0];
$result_trees{'menu_no_closed_in_entry'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_no_closed_in_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_no_closed_in_entry'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_no_closed_in_entry'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_no_closed_in_entry'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'menu_no_closed_in_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_no_closed_in_entry'}{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'menu_no_closed_in_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_no_closed_in_entry'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_no_closed_in_entry'}{'contents'}[0];
$result_trees{'menu_no_closed_in_entry'}{'contents'}[0]{'parent'} = $result_trees{'menu_no_closed_in_entry'};

$result_texis{'menu_no_closed_in_entry'} = '@menu
* a1:@end menu';


$result_texts{'menu_no_closed_in_entry'} = '* a1:';

$result_errors{'menu_no_closed_in_entry'} = [
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


$result_indices{'menu_no_closed_in_entry'} = undef;


1;
