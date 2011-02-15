use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'example_in_menu_comment'} = {
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
                  'text' => 'entry'
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
              'node_content' => [
                {}
              ],
              'normalized' => 'entry'
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
          'parent' => {},
          'text' => '
',
          'type' => 'after_description_line'
        },
        {
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in 
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
                      'text' => 'example
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 4,
                'macro' => ''
              },
              'parent' => {}
            },
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
                },
                {
                  'parent' => {},
                  'text' => 'menu comment.
'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
            }
          ],
          'parent' => {},
          'type' => 'menu_comment'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
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
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[0];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'contents'}[1];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'contents'}[1];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'contents'}[1];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[0];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[2];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[2];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[2];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'example_in_menu_comment'}{'contents'}[0];
$result_trees{'example_in_menu_comment'}{'contents'}[0]{'parent'} = $result_trees{'example_in_menu_comment'};
$result_trees{'example_in_menu_comment'}{'contents'}[1]{'parent'} = $result_trees{'example_in_menu_comment'};

$result_texis{'example_in_menu_comment'} = '@menu
* entry::

@example
in 

example
@end example

menu comment.

@end menu
';


$result_texts{'example_in_menu_comment'} = '* entry::

in 

example

menu comment.

';

$result_errors{'example_in_menu_comment'} = [
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



$result_converted{'plaintext'}->{'example_in_menu_comment'} = '* Menu:

* entry::

     in

     example

menu comment.

';

1;
