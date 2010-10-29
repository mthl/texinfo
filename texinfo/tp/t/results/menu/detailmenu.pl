use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

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

$result_errors{'detailmenu'} = [];


1;
