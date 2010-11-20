use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'macro_in_brace_command'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'foo',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'foo-expansion
',
          'type' => 'raw'
        }
      ],
      'extra' => {
        'arg_line' => ' foo
',
        'macrobody' => 'foo-expansion
'
      },
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
          'parent' => {},
          'text' => 'bar',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'bar-expansion
',
          'type' => 'raw'
        }
      ],
      'extra' => {
        'arg_line' => ' bar
',
        'macrobody' => 'bar-expansion
'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 5,
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
              'cmdname' => 'bullet',
              'parent' => {},
              'type' => 'command_as_argument'
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
      'cmdname' => 'itemize',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'cmdname' => 'item',
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'contents' => [
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'foo-expansion'
                        },
                        {
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'bar-expansion'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'email',
                  'contents' => [],
                  'extra' => {
                    'brace_command_contents' => [
                      [
                        {},
                        {},
                        {}
                      ]
                    ]
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ',
'
                },
                {
                  'parent' => {},
                  'text' => '  also helped.
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ]
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
$result_trees{'macro_in_brace_command'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'};
$result_trees{'macro_in_brace_command'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_brace_command'};
$result_trees{'macro_in_brace_command'}{'contents'}[2]{'parent'} = $result_trees{'macro_in_brace_command'};
$result_trees{'macro_in_brace_command'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[3];
$result_trees{'macro_in_brace_command'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[3];
$result_trees{'macro_in_brace_command'}{'contents'}[3]{'parent'} = $result_trees{'macro_in_brace_command'};
$result_trees{'macro_in_brace_command'}{'contents'}[4]{'parent'} = $result_trees{'macro_in_brace_command'};
$result_trees{'macro_in_brace_command'}{'contents'}[5]{'parent'} = $result_trees{'macro_in_brace_command'};
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'args'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'args'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'args'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][1] = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][2] = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'parent'} = $result_trees{'macro_in_brace_command'};
$result_trees{'macro_in_brace_command'}{'contents'}[7]{'parent'} = $result_trees{'macro_in_brace_command'};

$result_texis{'macro_in_brace_command'} = '@macro foo
foo-expansion
@end macro

@macro bar
bar-expansion
@end macro

@itemize @bullet
@item @email{foo-expansion@@bar-expansion},
  also helped.
@end itemize
';


$result_texts{'macro_in_brace_command'} = '

foo-expansion@bar-expansion,
  also helped.
';

$result_errors{'macro_in_brace_command'} = [];


1;
