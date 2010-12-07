use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'menu_entry_node_comments'} = {
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
                  'text' => '(f)a1c'
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
                  'text' => 'a1c'
                }
              ],
              'normalized' => 'a1c'
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
                  'text' => '(f)a2c'
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
                  'text' => 'a2c'
                }
              ],
              'normalized' => 'a2c'
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
                  'text' => '(f)a3c'
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
                  'text' => 'a3c'
                }
              ],
              'normalized' => 'a3c'
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
                  'text' => '(f) a4'
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
              'parent' => {},
              'text' => '::   ',
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
                  'text' => ' a4'
                },
                {}
              ],
              'normalized' => '-a4'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
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
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'extra'}{'menu_entry_node'}{'node_content'}[1] = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'};
$result_trees{'menu_entry_node_comments'}{'contents'}[1]{'parent'} = $result_trees{'menu_entry_node_comments'};

$result_texis{'menu_entry_node_comments'} = '@menu
* (f)a1c::@c c
* (f)a2c::  @c c
* (f)a3c::         d@c c
* (f) a4 ::   @c c
@end menu
';


$result_texts{'menu_entry_node_comments'} = '* (f)a1c::* (f)a2c::  * (f)a3c::         d* (f) a4 ::   ';

$result_errors{'menu_entry_node_comments'} = [
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



$result_converted{'plaintext'}->{'menu_entry_node_comments'} = '* Menu:

* (f)a1c::
* (f)a2c::  
* (f)a3c::         d
* (f) a4 ::   
';

1;
