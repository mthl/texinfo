use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'empty_item_itemx'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'cmdname' => 'asis',
              'parent' => {},
              'type' => 'command_as_argument'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'space_at_end_block_command'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'vtable',
      'contents' => [
        {
          'contents' => [
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
                  'text' => 'VTable
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
            }
          ],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'first item'
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
          'cmdname' => 'item',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'vtable',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'key' => 'first item',
              'number' => 1
            },
            'misc_content' => []
          },
          'parent' => {}
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'itemx',
          'extra' => {
            'missing_argument' => 1
          },
          'parent' => {}
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'after an empty itemx, before an empty item'
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
          'cmdname' => 'itemx',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'vtable',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'key' => 'after an empty itemx, before an empty item',
              'number' => 2
            },
            'misc_content' => []
          },
          'parent' => {}
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' 
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'item',
          'extra' => {
            'missing_argument' => 1
          },
          'parent' => {}
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'in item before end table'
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
          'cmdname' => 'item',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'vtable',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'key' => 'in item before end table',
              'number' => 3
            },
            'misc_content' => []
          },
          'parent' => {}
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'vtable'
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
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'vtable',
            'text_arg' => 'vtable'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 10,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'command_as_argument' => {},
        'end_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'empty_item_itemx'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'empty_item_itemx'}{'contents'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1]{'extra'}{'misc_content'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'content'};
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[2];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[2];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3]{'extra'}{'misc_content'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'content'};
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[4];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[4];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5]{'extra'}{'misc_content'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5]{'extra'}{'index_entry'}{'content'};
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[6];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[6];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[6]{'extra'}{'command'} = $result_trees{'empty_item_itemx'}{'contents'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'empty_item_itemx'}{'contents'}[0];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'empty_item_itemx'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'extra'}{'command_as_argument'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'empty_item_itemx'}{'contents'}[0]{'contents'}[6];
$result_trees{'empty_item_itemx'}{'contents'}[0]{'parent'} = $result_trees{'empty_item_itemx'};

$result_texis{'empty_item_itemx'} = '@vtable @asis

VTable

@item first item
@itemx
@itemx after an empty itemx, before an empty item
@item 
@item in item before end table
@end vtable
';


$result_texts{'empty_item_itemx'} = '
VTable

first item

after an empty itemx, before an empty item

in item before end table
';

$result_errors{'empty_item_itemx'} = [
  {
    'error_line' => ':5: Entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'Entry for index `vr\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':6: @itemx missing argument
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => '@itemx missing argument',
    'type' => 'error'
  },
  {
    'error_line' => ':7: Entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'Entry for index `vr\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':8: @item missing argument
',
    'file_name' => '',
    'line_nr' => 8,
    'macro' => '',
    'text' => '@item missing argument',
    'type' => 'error'
  },
  {
    'error_line' => ':9: Entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 9,
    'macro' => '',
    'text' => 'Entry for index `vr\' outside of any node',
    'type' => 'error'
  }
];



$result_converted{'plaintext'}->{'empty_item_itemx'} = '     VTable

first item
after an empty itemx, before an empty item
in item before end table
';

1;
