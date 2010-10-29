use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'multitable_not_closed_item'} = {
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
                      'text' => 'rt 
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
          'extra' => {
            'cell_number' => 1
          },
          'parent' => {},
          'type' => 'row'
        }
      ],
      'extra' => {
        'max_columns' => 2,
        'prototypes' => [
          {},
          {}
        ]
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'multitable_not_closed_item'}{'contents'}[0];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item'}{'contents'}[0];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_not_closed_item'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item'}{'contents'}[0]{'contents'}[1];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_not_closed_item'}{'contents'}[0];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'extra'}{'prototypes'}[0] = $result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'extra'}{'prototypes'}[1] = $result_trees{'multitable_not_closed_item'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'multitable_not_closed_item'}{'contents'}[0]{'parent'} = $result_trees{'multitable_not_closed_item'};

$result_texis{'multitable_not_closed_item'} = '@multitable {r} {t}
@item rt 
@end multitable';


$result_texts{'multitable_not_closed_item'} = 'rt 
';

$result_errors{'multitable_not_closed_item'} = [
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


1;
