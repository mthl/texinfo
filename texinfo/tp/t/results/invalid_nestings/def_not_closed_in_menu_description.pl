use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'def_not_closed_in_menu_description'} = {
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
                  'text' => '(info)'
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
                  'text' => 'before deff '
                },
                {
                  'cmdname' => 'deffn',
                  'contents' => [
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => ' ',
                              'type' => 'empty_spaces_after_command'
                            },
                            {
                              'parent' => {},
                              'text' => 'bidule truc chose
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'block_line_arg'
                        }
                      ],
                      'extra' => {
                        'def_args' => [
                          [
                            'category',
                            {
                              'text' => 'bidule'
                            }
                          ],
                          [
                            'spaces',
                            {
                              'text' => ' ',
                              'type' => 'spaces'
                            }
                          ],
                          [
                            'name',
                            {
                              'text' => 'truc'
                            }
                          ],
                          [
                            'spaces',
                            {
                              'text' => ' ',
                              'type' => 'spaces'
                            }
                          ],
                          [
                            'arg',
                            {
                              'text' => 'chose'
                            }
                          ]
                        ],
                        'def_command' => 'deffn'
                      },
                      'parent' => {},
                      'type' => 'def_line'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line'
                    },
                    {
                      'parent' => {},
                      'text' => 'deffn text
'
                    }
                  ],
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
  ],
  'type' => 'text_root'
};
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'def_not_closed_in_menu_description'}{'contents'}[0];
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1];
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1];
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1];
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1];
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'def_not_closed_in_menu_description'}{'contents'}[0];
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[0]{'parent'} = $result_trees{'def_not_closed_in_menu_description'};
$result_trees{'def_not_closed_in_menu_description'}{'contents'}[1]{'parent'} = $result_trees{'def_not_closed_in_menu_description'};

$result_texis{'def_not_closed_in_menu_description'} = '@menu
* (info):: before deff @deffn bidule truc chose

deffn text
@end deffn@end menu
';


$result_texts{'def_not_closed_in_menu_description'} = '* (info):: before deff bidule truc chose

deffn text
';

$result_errors{'def_not_closed_in_menu_description'} = [
  {
    'error_line' => ':2: warning: @deffn should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@deffn should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: `@end\' expected `deffn\', but saw `menu\'
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '`@end\' expected `deffn\', but saw `menu\'',
    'type' => 'error'
  }
];


$result_indices{'def_not_closed_in_menu_description'} = undef;


1;
