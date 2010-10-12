use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'simple'} = {
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'comment
'
            }
          ],
          'parent' => {},
          'type' => 'menu_comment'
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
                  'text' => 'menu entry name '
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
                  'text' => 'node'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '.    ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'description
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
                  'text' => 'node name'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '::                ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'description new
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
                  'text' => 'other entry'
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
                  'text' => 'node'
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
                  'text' => 'last'
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
                },
                {
                  'parent' => {},
                  'text' => '                 description next line
'
                },
                {
                  'parent' => {},
                  'text' => '                 still description
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
          'parent' => {},
          'text' => '
',
          'type' => 'after_description_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'new comment
'
            }
          ],
          'parent' => {},
          'type' => 'menu_comment'
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
                  'text' => 'last node entry '
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
$result_trees{'simple'}{'contents'}[0]{'parent'} = $result_trees{'simple'};
$result_trees{'simple'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1];
$result_trees{'simple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[1];
$result_trees{'simple'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[1];
$result_trees{'simple'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[2];
$result_trees{'simple'}{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[2]{'args'}[1];
$result_trees{'simple'}{'contents'}[1]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[2];
$result_trees{'simple'}{'contents'}[1]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[2];
$result_trees{'simple'}{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'simple'}{'contents'}[1]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[2];
$result_trees{'simple'}{'contents'}[1]{'contents'}[2]{'args'}[4]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[2];
$result_trees{'simple'}{'contents'}[1]{'contents'}[2]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[2]{'args'}[5];
$result_trees{'simple'}{'contents'}[1]{'contents'}[2]{'args'}[5]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[2];
$result_trees{'simple'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'simple'}{'contents'}[1];
$result_trees{'simple'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[3];
$result_trees{'simple'}{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[3]{'args'}[1];
$result_trees{'simple'}{'contents'}[1]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[3];
$result_trees{'simple'}{'contents'}[1]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[3];
$result_trees{'simple'}{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[3]{'args'}[3];
$result_trees{'simple'}{'contents'}[1]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[3];
$result_trees{'simple'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'simple'}{'contents'}[1];
$result_trees{'simple'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[4];
$result_trees{'simple'}{'contents'}[1]{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[4]{'args'}[1];
$result_trees{'simple'}{'contents'}[1]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[4];
$result_trees{'simple'}{'contents'}[1]{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[4];
$result_trees{'simple'}{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[4]{'args'}[3];
$result_trees{'simple'}{'contents'}[1]{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[4];
$result_trees{'simple'}{'contents'}[1]{'contents'}[4]{'args'}[4]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[4];
$result_trees{'simple'}{'contents'}[1]{'contents'}[4]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[4]{'args'}[5];
$result_trees{'simple'}{'contents'}[1]{'contents'}[4]{'args'}[5]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[4];
$result_trees{'simple'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'simple'}{'contents'}[1];
$result_trees{'simple'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[5];
$result_trees{'simple'}{'contents'}[1]{'contents'}[5]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[5]{'args'}[1];
$result_trees{'simple'}{'contents'}[1]{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[5];
$result_trees{'simple'}{'contents'}[1]{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[5];
$result_trees{'simple'}{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[5]{'args'}[3];
$result_trees{'simple'}{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[5]{'args'}[3];
$result_trees{'simple'}{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[5]{'args'}[3];
$result_trees{'simple'}{'contents'}[1]{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[5];
$result_trees{'simple'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'simple'}{'contents'}[1];
$result_trees{'simple'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'simple'}{'contents'}[1];
$result_trees{'simple'}{'contents'}[1]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[7];
$result_trees{'simple'}{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'simple'}{'contents'}[1];
$result_trees{'simple'}{'contents'}[1]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[8];
$result_trees{'simple'}{'contents'}[1]{'contents'}[8]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[8]{'args'}[1];
$result_trees{'simple'}{'contents'}[1]{'contents'}[8]{'args'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[8];
$result_trees{'simple'}{'contents'}[1]{'contents'}[8]{'args'}[2]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[8];
$result_trees{'simple'}{'contents'}[1]{'contents'}[8]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[8]{'args'}[3];
$result_trees{'simple'}{'contents'}[1]{'contents'}[8]{'args'}[3]{'parent'} = $result_trees{'simple'}{'contents'}[1]{'contents'}[8];
$result_trees{'simple'}{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'simple'}{'contents'}[1];
$result_trees{'simple'}{'contents'}[1]{'parent'} = $result_trees{'simple'};
$result_trees{'simple'}{'contents'}[2]{'parent'} = $result_trees{'simple'};

$result_texts{'simple'} = '
@menu
comment
* menu entry name : node.    description
* node name::                description new
* other entry: node,    
* last::
                 description next line
                 still description

new comment
* last node entry ::
@end menu
';

$result_errors{'simple'} = [];


