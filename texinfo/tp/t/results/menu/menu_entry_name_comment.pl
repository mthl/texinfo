use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'menu_entry_name_comment'} = {
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
                  'text' => 'a'
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
                  'text' => '(f)b'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
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
                  'text' => 'a'
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
                  'text' => '(f)b '
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
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
                  'text' => 'a'
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
                  'text' => '(f)b1c.c'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => ',',
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
                  'text' => 'a'
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
                  'text' => '(f)b2c.c'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => ',     ',
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
                  'text' => 'a'
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
                  'text' => '(f)b3c.c'
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
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[4]{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[4]{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[5]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[5]{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[5]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[5]{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[3];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[5]{'contents'}[1];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[5]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'menu_entry_name_comment'}{'contents'}[0];
$result_trees{'menu_entry_name_comment'}{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name_comment'};
$result_trees{'menu_entry_name_comment'}{'contents'}[1]{'parent'} = $result_trees{'menu_entry_name_comment'};

$result_texis{'menu_entry_name_comment'} = '@menu
* a: (f)b@c c
* a: (f)b @c c
* a: (f)b1c.c,@c c
* a: (f)b2c.c,     @c c
* a: (f)b3c.c,    d@c c
@end menu
';


$result_texts{'menu_entry_name_comment'} = '* a: (f)b* a: (f)b * a: (f)b1c.c,* a: (f)b2c.c,     * a: (f)b3c.c,    d';

$result_errors{'menu_entry_name_comment'} = [];


