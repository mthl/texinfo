use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'double_node_anchor_float'} = {
  'contents' => [
    {
      'contents' => [],
      'type' => 'text_root'
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
              'text' => 'node1'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'node1'
          }
        ],
        'normalized' => 'node1'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
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
              'text' => 'node1'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [
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
                      'text' => 'node1'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'anchor',
              'contents' => [],
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
                      'text' => 'anchor1'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'anchor',
              'contents' => [],
              'extra' => {
                'node_content' => [
                  {}
                ],
                'normalized' => 'anchor1'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 7,
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
        }
      ],
      'extra' => {
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'node1'
          }
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 3,
        'macro' => ''
      },
      'parent' => {}
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
              'text' => 'anchor1'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [
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
                  'text' => 'node1'
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
          'contents' => [],
          'extra' => {
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
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
                  'text' => 'anchor1'
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
          'contents' => [],
          'extra' => {
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 14,
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
                  'text' => 'float1'
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
          'contents' => [],
          'extra' => {
            'node_content' => [
              {}
            ],
            'normalized' => 'float1',
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 17,
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
        }
      ],
      'extra' => {
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'anchor1'
          }
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 9,
        'macro' => ''
      },
      'parent' => {}
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
              'text' => 'float1'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [],
      'extra' => {
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'float1'
          }
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 20,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'double_node_anchor_float'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[1]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[1]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[1]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'double_node_anchor_float'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'double_node_anchor_float'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'double_node_anchor_float'}{'contents'}[1]{'parent'} = $result_trees{'double_node_anchor_float'};
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[3]{'contents'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'extra'}{'node_content'}[0] = $result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[3];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[3];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[2];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'double_node_anchor_float'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[2]{'parent'} = $result_trees{'double_node_anchor_float'};
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[1]{'args'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[1]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[1]{'args'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[1]{'extra'}{'type'}{'content'}[0] = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[3]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[4]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[4]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[4];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[4]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[4]{'args'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[4]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[4]{'args'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[4];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[4]{'extra'}{'type'}{'content'}[0] = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[4]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[5]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[6]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7]{'args'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7]{'args'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7]{'args'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7]{'extra'}{'node_content'}[0] = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7]{'args'}[1]{'contents'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7]{'extra'}{'type'}{'content'}[0] = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[7]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[8]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'contents'}[9]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[3];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'double_node_anchor_float'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[3]{'parent'} = $result_trees{'double_node_anchor_float'};
$result_trees{'double_node_anchor_float'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[4]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[4]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[4]{'args'}[0];
$result_trees{'double_node_anchor_float'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'double_node_anchor_float'}{'contents'}[4];
$result_trees{'double_node_anchor_float'}{'contents'}[4]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'double_node_anchor_float'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'double_node_anchor_float'}{'contents'}[4]{'parent'} = $result_trees{'double_node_anchor_float'};

$result_texis{'double_node_anchor_float'} = '@node node1

@node node1

@anchor{node1}

@anchor{anchor1}

@node anchor1

@float Text, node1
@end float

@float Text, anchor1
@end float

@float Text, float1
@end float

@node float1
';


$result_texts{'double_node_anchor_float'} = '









';

$result_sectioning{'double_node_anchor_float'} = {};

$result_errors{'double_node_anchor_float'} = [
  {
    'error_line' => ':3: @node `node1\' previously defined
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@node `node1\' previously defined',
    'type' => 'error'
  },
  {
    'error_line' => ':1: here is the previous definition as @node
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'here is the previous definition as @node',
    'type' => 'error continuation'
  },
  {
    'error_line' => ':5: @anchor `node1\' previously defined
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@anchor `node1\' previously defined',
    'type' => 'error'
  },
  {
    'error_line' => ':1: here is the previous definition as @node
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'here is the previous definition as @node',
    'type' => 'error continuation'
  },
  {
    'error_line' => ':9: @node `anchor1\' previously defined
',
    'file_name' => '',
    'line_nr' => 9,
    'macro' => '',
    'text' => '@node `anchor1\' previously defined',
    'type' => 'error'
  },
  {
    'error_line' => ':7: here is the previous definition as @anchor
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'here is the previous definition as @anchor',
    'type' => 'error continuation'
  },
  {
    'error_line' => ':11: @float `node1\' previously defined
',
    'file_name' => '',
    'line_nr' => 11,
    'macro' => '',
    'text' => '@float `node1\' previously defined',
    'type' => 'error'
  },
  {
    'error_line' => ':1: here is the previous definition as @node
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'here is the previous definition as @node',
    'type' => 'error continuation'
  },
  {
    'error_line' => ':14: @float `anchor1\' previously defined
',
    'file_name' => '',
    'line_nr' => 14,
    'macro' => '',
    'text' => '@float `anchor1\' previously defined',
    'type' => 'error'
  },
  {
    'error_line' => ':7: here is the previous definition as @anchor
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'here is the previous definition as @anchor',
    'type' => 'error continuation'
  },
  {
    'error_line' => ':20: @node `float1\' previously defined
',
    'file_name' => '',
    'line_nr' => 20,
    'macro' => '',
    'text' => '@node `float1\' previously defined',
    'type' => 'error'
  },
  {
    'error_line' => ':17: here is the previous definition as @float
',
    'file_name' => '',
    'line_nr' => 17,
    'macro' => '',
    'text' => 'here is the previous definition as @float',
    'type' => 'error continuation'
  }
];


1;
