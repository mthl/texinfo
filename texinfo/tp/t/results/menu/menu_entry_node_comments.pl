use vars qw(%result_texts %result_trees %result_errors);

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
                  'text' => '(f) a4 '
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
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[3];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'menu_entry_node_comments'}{'contents'}[0];
$result_trees{'menu_entry_node_comments'}{'contents'}[0]{'parent'} = $result_trees{'menu_entry_node_comments'};
$result_trees{'menu_entry_node_comments'}{'contents'}[1]{'parent'} = $result_trees{'menu_entry_node_comments'};

$result_texts{'menu_entry_node_comments'} = '@menu
* (f)a1c::@c c
* (f)a2c::  @c c
* (f)a3c::         d@c c
* (f) a4 ::   @c c
@end menu
';

$result_errors{'menu_entry_node_comments'} = [];


