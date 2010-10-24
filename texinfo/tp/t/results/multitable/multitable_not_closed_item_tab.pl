use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'multitable_not_closed_item_tab'} = {
  'contents' => [
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'r'
                }
              ],
              'parent' => {},
              'type' => 'bracketed'
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 't'
                }
              ],
              'parent' => {},
              'type' => 'bracketed'
            },
            {
              'parent' => {},
              'text' => '
'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'multitable',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'contents' => [
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
                      'text' => 'rt '
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {}
            },
            {
              'cmdname' => 'tab',
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
                      'text' => 'ds
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
          'parent' => {},
          'special' => {
            'cell_number' => 2
          },
          'type' => 'row'
        }
      ],
      'parent' => {},
      'special' => {
        'max_columns' => 2,
        'prototypes' => [
          {},
          {}
        ]
      }
    }
  ],
  'type' => 'text_root'
};
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item_tab'};
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'special'}{'prototypes'}[0] = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'special'}{'prototypes'}[1] = $result_trees{'multitable_not_closed_item_tab'}{'contents'}[0]{'args'}[0]{'contents'}[3];

$result_texis{'multitable_not_closed_item_tab'} = '@multitable {r} {t}
@item rt @tab ds
@end multitable';


$result_texts{'multitable_not_closed_item_tab'} = 'rt ds
';

$result_errors{'multitable_not_closed_item_tab'} = [
  {
    'error_line' => ':2: No matching `@end multitable\'
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'No matching `@end multitable\'',
    'type' => 'error'
  }
];


$result_indices{'multitable_not_closed_item_tab'} = undef;


1;
