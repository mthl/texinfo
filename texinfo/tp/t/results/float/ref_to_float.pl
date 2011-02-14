use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'ref_to_float'} = {
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
              'text' => 'Text'
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
              'text' => 'Label1'
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
              'text' => 'Float
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
          ],
          [
            {}
          ]
        ],
        'node_content' => [
          {}
        ],
        'normalized' => 'Label1',
        'type' => {
          'content' => [
            {}
          ],
          'normalized' => 'Text'
        }
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'number' => 1,
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
              'text' => 'Label2'
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
              'text' => 'In foat 2.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          undef,
          [
            {}
          ]
        ],
        'node_content' => [
          {}
        ],
        'normalized' => 'Label2',
        'type' => {
          'normalized' => ''
        }
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 5,
        'macro' => ''
      },
      'number' => 1,
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
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'Label1'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'ref',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ]
            ],
            'node_argument' => {
              'node_content' => [
                {}
              ],
              'normalized' => 'Label1'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 9,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
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
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'Label2'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'ref',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ]
            ],
            'node_argument' => {
              'node_content' => [
                {}
              ],
              'normalized' => 'Label2'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 11,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'ref_to_float'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[0]{'args'}[0];
$result_trees{'ref_to_float'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[0]{'args'}[0];
$result_trees{'ref_to_float'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[0];
$result_trees{'ref_to_float'}{'contents'}[0]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[0]{'args'}[1];
$result_trees{'ref_to_float'}{'contents'}[0]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[0]{'args'}[1];
$result_trees{'ref_to_float'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[0];
$result_trees{'ref_to_float'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[0]{'contents'}[0];
$result_trees{'ref_to_float'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[0];
$result_trees{'ref_to_float'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'ref_to_float'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'ref_to_float'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'ref_to_float'}{'contents'}[0]{'args'}[1]{'contents'}[1];
$result_trees{'ref_to_float'}{'contents'}[0]{'extra'}{'node_content'}[0] = $result_trees{'ref_to_float'}{'contents'}[0]{'args'}[1]{'contents'}[1];
$result_trees{'ref_to_float'}{'contents'}[0]{'extra'}{'type'}{'content'}[0] = $result_trees{'ref_to_float'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'ref_to_float'}{'contents'}[0]{'parent'} = $result_trees{'ref_to_float'};
$result_trees{'ref_to_float'}{'contents'}[1]{'parent'} = $result_trees{'ref_to_float'};
$result_trees{'ref_to_float'}{'contents'}[2]{'parent'} = $result_trees{'ref_to_float'};
$result_trees{'ref_to_float'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[3]{'args'}[0];
$result_trees{'ref_to_float'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[3];
$result_trees{'ref_to_float'}{'contents'}[3]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[3]{'args'}[1];
$result_trees{'ref_to_float'}{'contents'}[3]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[3]{'args'}[1];
$result_trees{'ref_to_float'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[3];
$result_trees{'ref_to_float'}{'contents'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[3]{'contents'}[0];
$result_trees{'ref_to_float'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[3];
$result_trees{'ref_to_float'}{'contents'}[3]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'ref_to_float'}{'contents'}[3]{'args'}[1]{'contents'}[1];
$result_trees{'ref_to_float'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'ref_to_float'}{'contents'}[3]{'args'}[1]{'contents'}[1];
$result_trees{'ref_to_float'}{'contents'}[3]{'parent'} = $result_trees{'ref_to_float'};
$result_trees{'ref_to_float'}{'contents'}[4]{'parent'} = $result_trees{'ref_to_float'};
$result_trees{'ref_to_float'}{'contents'}[5]{'parent'} = $result_trees{'ref_to_float'};
$result_trees{'ref_to_float'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'ref_to_float'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[6]{'contents'}[0];
$result_trees{'ref_to_float'}{'contents'}[6]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ref_to_float'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'ref_to_float'}{'contents'}[6]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_to_float'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'ref_to_float'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[6];
$result_trees{'ref_to_float'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[6];
$result_trees{'ref_to_float'}{'contents'}[6]{'parent'} = $result_trees{'ref_to_float'};
$result_trees{'ref_to_float'}{'contents'}[7]{'parent'} = $result_trees{'ref_to_float'};
$result_trees{'ref_to_float'}{'contents'}[8]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[8]{'contents'}[0]{'args'}[0];
$result_trees{'ref_to_float'}{'contents'}[8]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[8]{'contents'}[0];
$result_trees{'ref_to_float'}{'contents'}[8]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ref_to_float'}{'contents'}[8]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'ref_to_float'}{'contents'}[8]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_to_float'}{'contents'}[8]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'ref_to_float'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[8];
$result_trees{'ref_to_float'}{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'ref_to_float'}{'contents'}[8];
$result_trees{'ref_to_float'}{'contents'}[8]{'parent'} = $result_trees{'ref_to_float'};

$result_texis{'ref_to_float'} = '@float Text, Label1
Float
@end float

@float , Label2
In foat 2.
@end float

@ref{Label1}

@ref{Label2}
';


$result_texts{'ref_to_float'} = 'Float

In foat 2.




';

$result_errors{'ref_to_float'} = [];


$result_floats{'ref_to_float'} = {
  '' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'normalized' => 'Label2',
        'type' => {
          'normalized' => ''
        }
      },
      'number' => 1
    }
  ],
  'Text' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'normalized' => 'Label1',
        'type' => {
          'content' => [
            {
              'text' => 'Text'
            }
          ],
          'normalized' => 'Text'
        }
      },
      'number' => 1
    }
  ]
};



$result_converted{'plaintext'}->{'ref_to_float'} = 'Float

Text 1

In foat 2.

1

*note Text 1: Label1.

   *note 1: Label2.
';

1;
