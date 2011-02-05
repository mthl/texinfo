use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'dash_in_menu'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
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
                  'text' => 'entry---in'
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
                  'text' => '(manual)n---ode'
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
                  'text' => 'description --- in.
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
                  'text' => 'manual'
                }
              ],
              'node_content' => [
                {
                  'parent' => {},
                  'text' => 'n---ode'
                }
              ],
              'normalized' => 'n_002d_002d_002dode'
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
          'parent' => {},
          'text' => '
',
          'type' => 'after_description_line'
        },
        {
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'comment --- in.
'
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
$result_trees{'dash_in_menu'}{'contents'}[0]{'parent'} = $result_trees{'dash_in_menu'};
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'args'}[4]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'args'}[5];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'args'}[5]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[3]{'contents'}[0];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[3];
$result_trees{'dash_in_menu'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'dash_in_menu'}{'contents'}[1];
$result_trees{'dash_in_menu'}{'contents'}[1]{'parent'} = $result_trees{'dash_in_menu'};
$result_trees{'dash_in_menu'}{'contents'}[2]{'parent'} = $result_trees{'dash_in_menu'};

$result_texis{'dash_in_menu'} = '
@menu
* entry---in: (manual)n---ode.         description --- in.

comment --- in.
@end menu
';


$result_texts{'dash_in_menu'} = '
* entry---in: (manual)n---ode.         description --- in.

comment --- in.
';

$result_errors{'dash_in_menu'} = [
  {
    'error_line' => ':2: @menu seen before first @node
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@menu seen before first @node',
    'type' => 'error'
  },
  {
    'error_line' => ':2: perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?',
    'type' => 'error continuation'
  }
];



$result_converted{'plaintext'}->{'dash_in_menu'} = '
* Menu:

* entry--in: (manual)n---ode.         description -- in.

comment -- in.
';

1;
