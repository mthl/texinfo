use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'menu_entry_node'} = {
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
                  'text' => '(f)a1'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '::',
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
                  'text' => 'a1'
                }
              ],
              'normalized' => 'a1'
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
                  'text' => '(f)a2'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '::  ',
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
                  'text' => 'a2'
                }
              ],
              'normalized' => 'a2'
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
                  'text' => '(f)a3'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '::         ',
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
                  'text' => 'a3'
                }
              ],
              'normalized' => 'a3'
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
                  'text' => '(f)'
                },
                {
                  'cmdname' => '@',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'a'
                },
                {
                  'cmdname' => ':',
                  'parent' => {}
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
                {},
                {},
                {}
              ],
              'normalized' => '_0040a'
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
            'line_nr' => 6,
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
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[3]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[3];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'extra'}{'menu_entry_node'}{'node_content'}[1] = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[2];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'extra'}{'menu_entry_node'}{'node_content'}[2] = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[3];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[5]{'extra'}{'command'} = $result_trees{'menu_entry_node'}{'contents'}[0];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0];
$result_trees{'menu_entry_node'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_node'}{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'};

$result_texis{'menu_entry_node'} = '@menu
* (f)a1::
* (f)a2::  
* (f)a3::         d
* (f)@@a@::: 
@end menu
';


$result_texts{'menu_entry_node'} = '* (f)a1::
* (f)a2::  
* (f)a3::         d
* (f)@a:: 
';

$result_errors{'menu_entry_node'} = [
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



$result_converted{'plaintext'}->{'menu_entry_node'} = '* Menu:

* (f)a1::
* (f)a2::  
* (f)a3::         d
* (f)@a:: 
';

1;
