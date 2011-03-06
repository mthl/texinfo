use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'menu_entry_name'} = {
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
                  'text' => '
',
                  'type' => 'space_at_end_menu_node'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'contents' => [],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'extra' => {
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
                  'text' => '(f)b1.c'
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
                  'parent' => {},
                  'text' => '
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
                  'text' => 'f'
                }
              ],
              'node_content' => [
                {
                  'parent' => {},
                  'text' => 'b1.c'
                }
              ],
              'normalized' => 'b1_002ec'
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
                  'text' => '(f)b2.c'
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
                  'parent' => {},
                  'text' => '
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
                  'text' => 'f'
                }
              ],
              'node_content' => [
                {
                  'parent' => {},
                  'text' => 'b2.c'
                }
              ],
              'normalized' => 'b2_002ec'
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
                  'text' => '(f)b3.c'
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
                  'text' => 'd
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
                  'text' => 'f'
                }
              ],
              'node_content' => [
                {
                  'parent' => {},
                  'text' => 'b3.c'
                }
              ],
              'normalized' => 'b3_002ec'
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
                  'text' => '(f)b1.'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '. ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
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
                  'text' => 'f'
                }
              ],
              'node_content' => [
                {
                  'parent' => {},
                  'text' => 'b1.'
                }
              ],
              'normalized' => 'b1_002e'
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
              'parent' => {},
              'text' => '* ',
              'type' => 'menu_entry_leading_text'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a '
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
                  'text' => '(f) b2 .'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '.',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
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
                  'text' => 'f'
                }
              ],
              'node_content' => [
                {
                  'parent' => {},
                  'text' => ' b2 .'
                }
              ],
              'normalized' => '-b2-_002e'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 7,
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
                  'text' => 'a.n'
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
                  'text' => '(f)b3.'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '.         ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'd
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
                  'text' => 'f'
                }
              ],
              'node_content' => [
                {
                  'parent' => {},
                  'text' => 'b3.'
                }
              ],
              'normalized' => 'b3_002e'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 8,
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
                  'text' => '(f)b1.c'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '.',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
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
                  'text' => 'f'
                }
              ],
              'node_content' => [
                {
                  'parent' => {},
                  'text' => 'b1.c'
                }
              ],
              'normalized' => 'b1_002ec'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 9,
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
                  'text' => '(f)b2.c'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '.  ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
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
                  'text' => 'f'
                }
              ],
              'node_content' => [
                {
                  'parent' => {},
                  'text' => 'b2.c'
                }
              ],
              'normalized' => 'b2_002ec'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 10,
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
                  'text' => '(f)b3.c'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '. ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'd
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
                  'text' => 'f'
                }
              ],
              'node_content' => [
                {
                  'parent' => {},
                  'text' => 'b3.c'
                }
              ],
              'normalized' => 'b3_002ec'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 11,
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
            'line_nr' => 12,
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
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[1] = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[11]{'args'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[11]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[11]{'args'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[11]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[11]{'args'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[11];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[11]{'extra'}{'command'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[11]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[11];
$result_trees{'menu_entry_name'}{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'};

$result_texis{'menu_entry_name'} = '@menu
* a: (f)b
* a: (f)b1.c,
* a: (f)b2.c,     
* a: (f)b3.c,    d
* a: (f)b1.. 
* a : (f) b2 ..
* a.n: (f)b3..         d
* a: (f)b1.c.
* a: (f)b2.c.  
* a: (f)b3.c. d
@end menu
';


$result_texts{'menu_entry_name'} = '* a: (f)b
* a: (f)b1.c,
* a: (f)b2.c,     
* a: (f)b3.c,    d
* a: (f)b1.. 
* a : (f) b2 ..
* a.n: (f)b3..         d
* a: (f)b1.c.
* a: (f)b2.c.  
* a: (f)b3.c. d
';

$result_errors{'menu_entry_name'} = [
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



$result_converted{'plaintext'}->{'menu_entry_name'} = '* Menu:

* a: (f)b
* a: (f)b1.c,
* a: (f)b2.c,     
* a: (f)b3.c,    d
* a: (f)b1.. 
* a : (f) b2 ..
* a.n: (f)b3..         d
* a: (f)b1.c.
* a: (f)b2.c.  
* a: (f)b3.c. d
';

1;
