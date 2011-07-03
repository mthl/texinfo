use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'menu_entry_no_entry_location'} = {
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
                  'text' => '(manual)'
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
                  'text' => 'begin description
'
                },
                {
                  'parent' => {},
                  'text' => '* not an entry ?
'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'extra' => {
            'menu_entry_description' => {},
            'menu_entry_node' => {
              'manual_content' => [
                {
                  'parent' => {},
                  'text' => 'manual'
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
                  'text' => '(manual)'
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
                  'text' => 'an entry
'
                },
                {
                  'parent' => {},
                  'text' => '  in description
'
                },
                {
                  'parent' => {},
                  'text' => '* and here ?
'
                },
                {
                  'parent' => {},
                  'text' => 'with text.
'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'extra' => {
            'menu_entry_description' => {},
            'menu_entry_node' => {
              'manual_content' => [
                {
                  'parent' => {},
                  'text' => 'manual'
                }
              ]
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
                  'text' => '(last manual)'
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
            'menu_entry_description' => {},
            'menu_entry_node' => {
              'manual_content' => [
                {
                  'parent' => {},
                  'text' => 'last manual'
                }
              ]
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
            'line_nr' => 9,
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
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[3]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'extra'}{'menu_entry_description'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3]{'extra'}{'menu_entry_description'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[4]{'extra'}{'command'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_no_entry_location'}{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry_location'};

$result_texis{'menu_entry_no_entry_location'} = '@menu
* (manual):: begin description
* not an entry ?
* (manual):: an entry
  in description
* and here ?
with text.
* (last manual)::
@end menu
';


$result_texts{'menu_entry_no_entry_location'} = '* (manual):: begin description
* not an entry ?
* (manual):: an entry
  in description
* and here ?
with text.
* (last manual)::
';

$result_errors{'menu_entry_no_entry_location'} = [
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



$result_converted{'plaintext'}->{'menu_entry_no_entry_location'} = '* Menu:

* (manual):: begin description
* not an entry ?
* (manual):: an entry
  in description
* and here ?
with text.
* (last manual)::
';

1;
