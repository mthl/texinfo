use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'table_not_closed_in_menu_description'} = {
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
                  'text' => '(gcc)'
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
                  'text' => 'text '
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
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'table line
'
                    }
                  ],
                  'parent' => {}
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
                  'text' => 'gcc'
                }
              ]
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'menu_entry'
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
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'table_not_closed_in_menu_description'}{'contents'}[0];
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[0]{'parent'} = $result_trees{'table_not_closed_in_menu_description'};
$result_trees{'table_not_closed_in_menu_description'}{'contents'}[1]{'parent'} = $result_trees{'table_not_closed_in_menu_description'};

$result_texis{'table_not_closed_in_menu_description'} = '@menu
* (gcc):: text @table @minus
@item item
table line
@end table@end menu
';


$result_texts{'table_not_closed_in_menu_description'} = '* (gcc):: text item
table line
';

$result_errors{'table_not_closed_in_menu_description'} = [
  {
    'error_line' => ':1: @menu seen before first @node
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@menu seen before first @node',
    'type' => 'error'
  },
  {
    'error_line' => ':1: perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?',
    'type' => 'error continuation'
  },
  {
    'error_line' => ':2: warning: @table should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@table should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: `@end\' expected `table\', but saw `menu\'
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '`@end\' expected `table\', but saw `menu\'',
    'type' => 'error'
  }
];


1;
