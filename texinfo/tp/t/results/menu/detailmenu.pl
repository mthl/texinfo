use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices %result_sectioning %result_nodes);

$result_trees{'detailmenu'} = {
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
                  'text' => 'Copying Conditions'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '::          ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'Your rights.
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
              'normalized' => 'Copying-Conditions'
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
          'cmdname' => 'detailmenu',
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
                      'text' => 'detailmenu'
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
                  'normalized' => 'detailmenu'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 6,
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
$result_trees{'detailmenu'}{'contents'}[0]{'parent'} = $result_trees{'detailmenu'};
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[1];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[3];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1];
$result_trees{'detailmenu'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'detailmenu'}{'contents'}[1];
$result_trees{'detailmenu'}{'contents'}[1]{'parent'} = $result_trees{'detailmenu'};
$result_trees{'detailmenu'}{'contents'}[2]{'parent'} = $result_trees{'detailmenu'};

$result_texis{'detailmenu'} = '
@menu
* Copying Conditions::          Your rights.

@detailmenu
* detailmenu::
@end detailmenu
@end menu
';


$result_texts{'detailmenu'} = '
* Copying Conditions::          Your rights.

* detailmenu::
';

$result_errors{'detailmenu'} = [
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
  },
  {
    'error_line' => ':5: @detailmenu seen before first @node
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@detailmenu seen before first @node',
    'type' => 'error'
  },
  {
    'error_line' => ':5: perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?',
    'type' => 'error continuation'
  }
];


1;
