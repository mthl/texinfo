use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats);

$result_trees{'block_commands'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'group',
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
              'text' => 'in group
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
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
              'text' => 'warning'
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
      'cmdname' => 'quotation',
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'in quotation
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
              'text' => 'a float'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'b float'
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
      'cmdname' => 'float',
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'In float
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in caption
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in caption'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'caption',
          'contents' => [],
          'extra' => {
            'float' => {}
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ],
          [
            {}
          ]
        ],
        'caption' => {},
        'node_content' => [
          {}
        ],
        'normalized' => 'b-float',
        'type' => {
          'content' => [
            {}
          ],
          'normalized' => 'a-float'
        }
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 10,
        'macro' => ''
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
$result_trees{'block_commands'}{'contents'}[0]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[1]{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[1]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[2]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[3]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[4]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[4]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'block_commands'}{'contents'}[4]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[4];
$result_trees{'block_commands'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[4]{'contents'}[0];
$result_trees{'block_commands'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[4];
$result_trees{'block_commands'}{'contents'}[4]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'block_commands'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[4]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[5]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[6]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[7]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[7]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[7];
$result_trees{'block_commands'}{'contents'}[7]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[7]{'args'}[1];
$result_trees{'block_commands'}{'contents'}[7]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'block_commands'}{'contents'}[7]{'args'}[1];
$result_trees{'block_commands'}{'contents'}[7]{'args'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[7];
$result_trees{'block_commands'}{'contents'}[7]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[7]{'contents'}[0];
$result_trees{'block_commands'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[7];
$result_trees{'block_commands'}{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[7];
$result_trees{'block_commands'}{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'block_commands'}{'contents'}[7];
$result_trees{'block_commands'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'block_commands'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[7]{'contents'}[3]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[7]{'contents'}[3]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'block_commands'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'block_commands'}{'contents'}[7]{'contents'}[3]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[7]{'contents'}[3];
$result_trees{'block_commands'}{'contents'}[7]{'contents'}[3]{'extra'}{'float'} = $result_trees{'block_commands'}{'contents'}[7];
$result_trees{'block_commands'}{'contents'}[7]{'contents'}[3]{'parent'} = $result_trees{'block_commands'}{'contents'}[7];
$result_trees{'block_commands'}{'contents'}[7]{'contents'}[4]{'parent'} = $result_trees{'block_commands'}{'contents'}[7];
$result_trees{'block_commands'}{'contents'}[7]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'block_commands'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[7]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'block_commands'}{'contents'}[7]{'args'}[1]{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[7]{'extra'}{'caption'} = $result_trees{'block_commands'}{'contents'}[7]{'contents'}[3];
$result_trees{'block_commands'}{'contents'}[7]{'extra'}{'node_content'}[0] = $result_trees{'block_commands'}{'contents'}[7]{'args'}[1]{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[7]{'extra'}{'type'}{'content'}[0] = $result_trees{'block_commands'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[7]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[8]{'parent'} = $result_trees{'block_commands'};

$result_texis{'block_commands'} = '
@group
in group
@end group

@quotation warning
in quotation
@end quotation

@float a float, b float
In float


@caption{in caption

in caption}
@end float
';


$result_texts{'block_commands'} = '
in group

warning

in quotation

In float



';

$result_errors{'block_commands'} = [];


$result_floats{'block_commands'} = {
  'a-float' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'b-float',
        'type' => {
          'content' => [
            {
              'text' => 'a float'
            }
          ],
          'normalized' => 'a-float'
        }
      }
    }
  ]
};
$result_floats{'block_commands'}{'a-float'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'block_commands'}{'a-float'}[0];


1;
