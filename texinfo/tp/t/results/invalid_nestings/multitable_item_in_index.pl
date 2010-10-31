use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'multitable_item_in_index'} = {
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
                  'text' => 'aaa'
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
                  'text' => 'bbb'
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
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'on item line'
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
              'cmdname' => 'vindex',
              'extra' => {
                'misc_content' => [
                  {},
                  {}
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 2,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'before_item'
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
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'misc_content'}[0] = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'misc_content'}[1] = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'extra'}{'prototypes'}[0] = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'extra'}{'prototypes'}[1] = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'parent'} = $result_trees{'multitable_item_in_index'};
$result_trees{'multitable_item_in_index'}{'contents'}[1]{'parent'} = $result_trees{'multitable_item_in_index'};

$result_texis{'multitable_item_in_index'} = '@multitable {aaa} {bbb}
@vindex  on item line
@end multitable
';


$result_texts{'multitable_item_in_index'} = '';

$result_errors{'multitable_item_in_index'} = [
  {
    'error_line' => ':2: warning: @item should not appear in @vindex
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@item should not appear in @vindex',
    'type' => 'warning'
  },
  {
    'error_line' => ':2: @item outside of table or list
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@item outside of table or list',
    'type' => 'error'
  }
];


1;
