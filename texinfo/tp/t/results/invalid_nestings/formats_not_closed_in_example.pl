use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'formats_not_closed_in_example'} = {
  'contents' => [
    {
      'cmdname' => 'example',
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
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'cmdname' => 'minus',
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
          'cmdname' => 'table',
          'contents' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'before_item'
            },
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
                      'text' => 'item'
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
                'misc_content' => [
                  {}
                ]
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'table line
'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'parent' => {},
              'text' => 'Some text.
'
            },
            {
              'cmdname' => 'enumerate',
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
                      'text' => '
',
                      'type' => 'empty_line'
                    }
                  ],
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
                      'parent' => {},
                      'text' => 'first item
'
                    }
                  ],
                  'extra' => {
                    'item_number' => 1
                  },
                  'parent' => {}
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
                      'parent' => {},
                      'text' => 'an item
'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line'
                    }
                  ],
                  'extra' => {
                    'item_number' => 2
                  },
                  'parent' => {}
                }
              ],
              'extra' => {
                'enumerate_specification' => 0
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'block_command_line_contents' => [
              [
                {}
              ]
            ]
          },
          'parent' => {}
        }
      ],
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
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[1];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[2];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[2];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[3];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[3];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[3];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[3]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'formats_not_closed_in_example'}{'contents'}[0];
$result_trees{'formats_not_closed_in_example'}{'contents'}[0]{'parent'} = $result_trees{'formats_not_closed_in_example'};
$result_trees{'formats_not_closed_in_example'}{'contents'}[1]{'parent'} = $result_trees{'formats_not_closed_in_example'};

$result_texis{'formats_not_closed_in_example'} = '@example

@table @minus
@item item
table line

Some text.
@enumerate

@item first item
@item an item

@end enumerate@end table@end example
';


$result_texts{'formats_not_closed_in_example'} = '
item
table line

Some text.

1. first item
2. an item

';

$result_errors{'formats_not_closed_in_example'} = [
  {
    'error_line' => ':13: `@end\' expected `enumerate\', but saw `example\'
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => '`@end\' expected `enumerate\', but saw `example\'',
    'type' => 'error'
  },
  {
    'error_line' => ':13: `@end\' expected `table\', but saw `example\'
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => '`@end\' expected `table\', but saw `example\'',
    'type' => 'error'
  }
];


1;
