use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'bad_enumerate_arguments'} = {
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
              'text' => 'a b'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'space_at_end_block_command'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'enumerate',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'enumerate_specification' => 0
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
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
              'text' => '!'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'space_at_end_block_command'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'enumerate',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'enumerate_specification' => 0
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'a'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'space_at_end_block_command'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'enumerate',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'enumerate_specification' => 0
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
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
              'text' => 'a'
            },
            {
              'cmdname' => '@',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'space_at_end_block_command'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'enumerate',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {},
            {}
          ]
        ],
        'enumerate_specification' => 'a'
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
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
              'text' => 'a0'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'space_at_end_block_command'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'enumerate',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'enumerate_specification' => 0
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
$result_trees{'bad_enumerate_arguments'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[0]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[0]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[0]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'bad_enumerate_arguments'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'bad_enumerate_arguments'}{'contents'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'};
$result_trees{'bad_enumerate_arguments'}{'contents'}[1]{'parent'} = $result_trees{'bad_enumerate_arguments'};
$result_trees{'bad_enumerate_arguments'}{'contents'}[2]{'parent'} = $result_trees{'bad_enumerate_arguments'};
$result_trees{'bad_enumerate_arguments'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[3]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[3]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[3]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[3];
$result_trees{'bad_enumerate_arguments'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[3];
$result_trees{'bad_enumerate_arguments'}{'contents'}[3]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'bad_enumerate_arguments'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'bad_enumerate_arguments'}{'contents'}[3]{'parent'} = $result_trees{'bad_enumerate_arguments'};
$result_trees{'bad_enumerate_arguments'}{'contents'}[4]{'parent'} = $result_trees{'bad_enumerate_arguments'};
$result_trees{'bad_enumerate_arguments'}{'contents'}[5]{'parent'} = $result_trees{'bad_enumerate_arguments'};
$result_trees{'bad_enumerate_arguments'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[6]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'bad_enumerate_arguments'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[6]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[6]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[6];
$result_trees{'bad_enumerate_arguments'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[6];
$result_trees{'bad_enumerate_arguments'}{'contents'}[6]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'bad_enumerate_arguments'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'bad_enumerate_arguments'}{'contents'}[6]{'parent'} = $result_trees{'bad_enumerate_arguments'};
$result_trees{'bad_enumerate_arguments'}{'contents'}[7]{'parent'} = $result_trees{'bad_enumerate_arguments'};
$result_trees{'bad_enumerate_arguments'}{'contents'}[8]{'parent'} = $result_trees{'bad_enumerate_arguments'};
$result_trees{'bad_enumerate_arguments'}{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[9]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[9]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[9]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[9]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[9]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[9];
$result_trees{'bad_enumerate_arguments'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[9];
$result_trees{'bad_enumerate_arguments'}{'contents'}[9]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'bad_enumerate_arguments'}{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'bad_enumerate_arguments'}{'contents'}[9]{'extra'}{'block_command_line_contents'}[0][1] = $result_trees{'bad_enumerate_arguments'}{'contents'}[9]{'args'}[0]{'contents'}[2];
$result_trees{'bad_enumerate_arguments'}{'contents'}[9]{'parent'} = $result_trees{'bad_enumerate_arguments'};
$result_trees{'bad_enumerate_arguments'}{'contents'}[10]{'parent'} = $result_trees{'bad_enumerate_arguments'};
$result_trees{'bad_enumerate_arguments'}{'contents'}[11]{'parent'} = $result_trees{'bad_enumerate_arguments'};
$result_trees{'bad_enumerate_arguments'}{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[12]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[12]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[12]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[12]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[12]{'args'}[0];
$result_trees{'bad_enumerate_arguments'}{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[12];
$result_trees{'bad_enumerate_arguments'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'bad_enumerate_arguments'}{'contents'}[12];
$result_trees{'bad_enumerate_arguments'}{'contents'}[12]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'bad_enumerate_arguments'}{'contents'}[12]{'args'}[0]{'contents'}[1];
$result_trees{'bad_enumerate_arguments'}{'contents'}[12]{'parent'} = $result_trees{'bad_enumerate_arguments'};
$result_trees{'bad_enumerate_arguments'}{'contents'}[13]{'parent'} = $result_trees{'bad_enumerate_arguments'};

$result_texis{'bad_enumerate_arguments'} = '@enumerate a b
@end enumerate

@enumerate !
@end enumerate

@enumerate @code{a}
@end enumerate

@enumerate a@@
@end enumerate

@enumerate a0
@end enumerate
';


$result_texts{'bad_enumerate_arguments'} = '



';

$result_errors{'bad_enumerate_arguments'} = [
  {
    'error_line' => ':1: Bad argument to @enumerate
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Bad argument to @enumerate',
    'type' => 'error'
  },
  {
    'error_line' => ':4: Bad argument to @enumerate
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'Bad argument to @enumerate',
    'type' => 'error'
  },
  {
    'error_line' => ':7: Bad argument to @enumerate
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'Bad argument to @enumerate',
    'type' => 'error'
  },
  {
    'error_line' => ':10: Superfluous argument to @enumerate
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => 'Superfluous argument to @enumerate',
    'type' => 'error'
  },
  {
    'error_line' => ':13: Bad argument to @enumerate
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => 'Bad argument to @enumerate',
    'type' => 'error'
  }
];


1;
