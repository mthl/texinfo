use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'menu_no_closed_after_empty_line'} = {
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
                  'text' => '(manual_in_menu)'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => ':: ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'desc2
'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'extra' => {
            'menu_entry_node' => {
              'manual_content' => [
                {
                  'parent' => {},
                  'text' => 'manual_in_menu'
                }
              ]
            }
          },
          'parent' => {},
          'type' => 'menu_entry'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'after_description_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
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
$result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0];
$result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0];
$result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0];
$result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0];
$result_trees{'menu_no_closed_after_empty_line'}{'contents'}[0]{'parent'} = $result_trees{'menu_no_closed_after_empty_line'};

$result_texis{'menu_no_closed_after_empty_line'} = '@menu
* (manual_in_menu):: desc2


@end menu';


$result_texts{'menu_no_closed_after_empty_line'} = '* (manual_in_menu):: desc2


';

$result_errors{'menu_no_closed_after_empty_line'} = [
  {
    'error_line' => ':4: No matching `@end menu\'
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'No matching `@end menu\'',
    'type' => 'error'
  }
];


$result_indices{'menu_no_closed_after_empty_line'} = undef;


1;
