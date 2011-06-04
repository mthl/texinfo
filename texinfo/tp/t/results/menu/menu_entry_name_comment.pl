use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'menu_entry_name_comment'} = {
  'contents' => [
    {
      'cmdname' => 'menu',
      'contents' => [
        {
          'extra' => {
            'command' => {}
          },
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
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ': ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '(f)b'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'contents' => [
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => ' c
',
                      'type' => 'misc_arg'
                    }
                  ],
                  'cmdname' => 'c',
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'extra' => {
            'menu_entry_description' => {},
            'menu_entry_name' => {},
            'menu_entry_node' => {
              'manual_content' => [
                {
                  'parent' => {},
                  'text' => 'f'
                }
              ],
              'node_content' => [
                {
                  'parent' => {},
                  'text' => 'b'
                }
              ],
              'normalized' => 'b'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'menu_entry'
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
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ': ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '(f)b'
                },
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'space_at_end_menu_node'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'contents' => [
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => ' c
',
                      'type' => 'misc_arg'
                    }
                  ],
                  'cmdname' => 'c',
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'extra' => {
            'menu_entry_description' => {},
            'menu_entry_name' => {},
            'menu_entry_node' => {
              'manual_content' => [
                {
                  'parent' => {},
                  'text' => 'f'
                }
              ],
              'node_content' => [
                {
                  'parent' => {},
                  'text' => 'b'
                },
                {}
              ],
              'normalized' => 'b'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'menu_entry'
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
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ': ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '(f)b1c.c'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => ',',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => ' c
',
                      'type' => 'misc_arg'
                    }
                  ],
                  'cmdname' => 'c',
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'extra' => {
            'menu_entry_description' => {},
            'menu_entry_name' => {},
            'menu_entry_node' => {
              'manual_content' => [
                {
                  'parent' => {},
                  'text' => 'f'
                }
              ],
              'node_content' => [
                {
                  'parent' => {},
                  'text' => 'b1c.c'
                }
              ],
              'normalized' => 'b1c_002ec'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 4,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'menu_entry'
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
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ': ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '(f)b2c.c'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => ',     ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => ' c
',
                      'type' => 'misc_arg'
                    }
                  ],
                  'cmdname' => 'c',
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'extra' => {
            'menu_entry_description' => {},
            'menu_entry_name' => {},
            'menu_entry_node' => {
              'manual_content' => [
                {
                  'parent' => {},
                  'text' => 'f'
                }
              ],
              'node_content' => [
                {
                  'parent' => {},
                  'text' => 'b2c.c'
                }
              ],
              'normalized' => 'b2c_002ec'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'menu_entry'
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
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ': ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '(f)b3c.c'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => ',    ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'd'
                },
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => ' c
',
                      'type' => 'misc_arg'
                    }
                  ],
                  'cmdname' => 'c',
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'extra' => {
            'menu_entry_description' => {},
            'menu_entry_name' => {},
            'menu_entry_node' => {
              'manual_content' => [
                {
                  'parent' => {},
                  'text' => 'f'
                }
              ],
              'node_content' => [
                {
                  'parent' => {},
                  'text' => 'b3c.c'
                }
              ],
              'normalized' => 'b3c_002ec'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 6,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'menu_entry'
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
                  'text' => 'menu'
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
            'command_argument' => 'menu',
            'text_arg' => 'menu'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 7,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
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
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[4]{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_name'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[4]{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'extra'}{'menu_entry_description'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'extra'}{'menu_entry_name'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[1] = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[5]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[5]{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'extra'}{'menu_entry_description'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'extra'}{'menu_entry_name'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[5]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[5]{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'extra'}{'menu_entry_description'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'extra'}{'menu_entry_name'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[5]{'contents'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[5]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'extra'}{'menu_entry_description'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'extra'}{'menu_entry_name'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[6];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[6];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[6]{'extra'}{'command'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[6];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'};

$result_texis{'menu_entry_name_comment'} = '@menu
* a: (f)b@c c
* a: (f)b @c c
* a: (f)b1c.c,@c c
* a: (f)b2c.c,     @c c
* a: (f)b3c.c,    d@c c
@end menu
';


$result_texts{'menu_entry_name_comment'} = '* a: (f)b* a: (f)b * a: (f)b1c.c,* a: (f)b2c.c,     * a: (f)b3c.c,    d';

$result_errors{'menu_entry_name_comment'} = [
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
  }
];



$result_converted{'plaintext'}->{'menu_entry_name_comment'} = '* Menu:

* a: (f)b
* a: (f)b 
* a: (f)b1c.c,
* a: (f)b2c.c,     
* a: (f)b3c.c,    d
';

1;
