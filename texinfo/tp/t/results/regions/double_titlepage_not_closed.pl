use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'double_titlepage_not_closed'} = {
  'contents' => [
    {
      'cmdname' => 'titlepage',
      'contents' => [
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
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'This is in title page
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
          'type' => 'empty_line'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'titlepage',
          'contents' => [
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
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'And still in title page
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
$result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_titlepage_not_closed'}{'contents'}[0];
$result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_titlepage_not_closed'}{'contents'}[0];
$result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[2];
$result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_titlepage_not_closed'}{'contents'}[0];
$result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'double_titlepage_not_closed'}{'contents'}[0];
$result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'double_titlepage_not_closed'}{'contents'}[0];
$result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[5];
$result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[5];
$result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[5]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[5]{'contents'}[2];
$result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[5];
$result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'double_titlepage_not_closed'}{'contents'}[0];
$result_trees{'double_titlepage_not_closed'}{'contents'}[0]{'parent'} = $result_trees{'double_titlepage_not_closed'};

$result_texis{'double_titlepage_not_closed'} = '@titlepage

This is in title page


@titlepage

And still in title page
@end titlepage@end titlepage';


$result_texts{'double_titlepage_not_closed'} = '';

$result_errors{'double_titlepage_not_closed'} = [
  {
    'error_line' => ':8: No matching `@end titlepage\'
',
    'file_name' => '',
    'line_nr' => 8,
    'macro' => '',
    'text' => 'No matching `@end titlepage\'',
    'type' => 'error'
  },
  {
    'error_line' => ':8: No matching `@end titlepage\'
',
    'file_name' => '',
    'line_nr' => 8,
    'macro' => '',
    'text' => 'No matching `@end titlepage\'',
    'type' => 'error'
  }
];


1;
