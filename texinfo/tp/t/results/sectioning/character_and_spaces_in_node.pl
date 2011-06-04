use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'character_and_spaces_in_node'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'parent' => {},
      'type' => 'text_root'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'Top'
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
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Top'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'other nodes'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => '!_"#$%&\'()*+-.'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'Top'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'Top'
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
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'other-nodes'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => '_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'other-nodes'
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
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => '!_"#$%&\'()*+-.'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => '/;<=>?[\\]^_`|~'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'other nodes'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'other nodes'
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
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => '_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => '_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'other-nodes'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'other-nodes'
          }
        ],
        'normalized' => '_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 4,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => '/;<=>?[\\]^_`|~'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'local   node'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '!_"#$%&\'()*+-.'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'other nodes'
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
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => '_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'local-node'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => '_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'other-nodes'
          }
        ],
        'normalized' => '_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 5,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => '  ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'local   node'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '/;<=>?[\\]^_`|~'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'other nodes'
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
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'local-node'
          },
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => '_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'other-nodes'
          }
        ],
        'normalized' => 'local-node'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 6,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'character_and_spaces_in_node'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[2];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[2];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[2];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[2];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[2];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[3];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[3];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[2];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'extra'}{'node_content'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[1]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[2]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[3]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_node'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[3];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[3];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[3];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[2];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[3];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[3];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[3];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[3];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'extra'}{'node_content'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[1]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[2]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[3]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'parent'} = $result_trees{'character_and_spaces_in_node'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[4];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[4];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[4];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[2];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[4];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[3];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[3];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[4];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'extra'}{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'extra'}{'node_content'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[1]{'contents'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[2]{'contents'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[3]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'parent'} = $result_trees{'character_and_spaces_in_node'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[2];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[3];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[3];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'extra'}{'node_content'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[2]{'contents'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[3]{'contents'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'parent'} = $result_trees{'character_and_spaces_in_node'};

$result_texis{'character_and_spaces_in_node'} = '
@node Top
@node other nodes, !_"#$%&\'()*+-., Top, Top
@node !_"#$%&\'()*+-., /;<=>?[\\]^_`|~, other nodes, other nodes
@node /;<=>?[\\]^_`|~,local   node,!_"#$%&\'()*+-., other nodes
@node  local   node,,/;<=>?[\\]^_`|~,other nodes
';


$result_texts{'character_and_spaces_in_node'} = '
';

$result_sectioning{'character_and_spaces_in_node'} = {};

$result_nodes{'character_and_spaces_in_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'node_up' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'dir'
        }
      ]
    }
  }
};

$result_menus{'character_and_spaces_in_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'character_and_spaces_in_node'} = [
  {
    'error_line' => ':3: warning: unreferenced node `other nodes\'
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'unreferenced node `other nodes\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':2: Node `Top\' lacks menu item for `other nodes\' despite being its Up target
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Node `Top\' lacks menu item for `other nodes\' despite being its Up target',
    'type' => 'error'
  },
  {
    'error_line' => ':4: warning: unreferenced node `!_"#$%&\'()*+-.\'
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'unreferenced node `!_"#$%&\'()*+-.\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':3: Node `other nodes\' lacks menu item for `!_"#$%&\'()*+-.\' despite being its Up target
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'Node `other nodes\' lacks menu item for `!_"#$%&\'()*+-.\' despite being its Up target',
    'type' => 'error'
  },
  {
    'error_line' => ':5: warning: unreferenced node `/;<=>?[\\]^_`|~\'
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'unreferenced node `/;<=>?[\\]^_`|~\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':3: Node `other nodes\' lacks menu item for `/;<=>?[\\]^_`|~\' despite being its Up target
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'Node `other nodes\' lacks menu item for `/;<=>?[\\]^_`|~\' despite being its Up target',
    'type' => 'error'
  },
  {
    'error_line' => ':6: warning: unreferenced node `local   node\'
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => 'unreferenced node `local   node\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':3: Node `other nodes\' lacks menu item for `local   node\' despite being its Up target
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'Node `other nodes\' lacks menu item for `local   node\' despite being its Up target',
    'type' => 'error'
  }
];



$result_converted{'info'}->{'character_and_spaces_in_node'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)


File: ,  Node: other nodes,  Next: !_"#$%&\'()*+-.,  Prev: Top,  Up: Top


File: ,  Node: !_"#$%&\'()*+-.,  Next: /;<=>?[\\]^_`|~,  Prev: other nodes,  Up: other nodes


File: ,  Node: /;<=>?[\\]^_`|~,  Next: local node,  Prev: !_"#$%&\'()*+-.,  Up: other nodes


File: ,  Node: local node,  Prev: /;<=>?[\\]^_`|~,  Up: other nodes



Tag Table:
Node: Top52
Node: other nodes86
Node: !_"#$%&\'()*+-.161
Node: /;<=>?[\\]^_`|~255
Node: local node348

End Tag Table
';

1;
