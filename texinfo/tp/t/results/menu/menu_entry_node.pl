use vars qw(%result_texts %result_trees %result_errors);

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
  ]
};
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[3];
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
$result_trees{'menu_entry_node'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'menu_entry_node'}{'contents'}[0];
$result_trees{'menu_entry_node'}{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node'};
$result_trees{'menu_entry_node'}{'contents'}[1]{'parent'} = $result_trees{'menu_entry_node'};

$result_texts{'menu_entry_node'} = '@menu
* (f)a1::
* (f)a2::  
* (f)a3::         d
* (f)@@a@::: 
@end menu
';

$result_errors{'menu_entry_node'} = [];


