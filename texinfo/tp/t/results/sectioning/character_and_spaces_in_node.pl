use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

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
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {},
      'special' => {
        'node_content' => [],
        'normalized' => 'Top'
      }
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
        'nodes_manuals' => [
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
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 3,
        'macro' => ''
      },
      'parent' => {},
      'special' => {
        'node_content' => [],
        'normalized' => 'other-nodes'
      }
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
        'nodes_manuals' => [
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
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 4,
        'macro' => ''
      },
      'parent' => {},
      'special' => {
        'node_content' => [],
        'normalized' => '_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e'
      }
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
        'nodes_manuals' => [
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
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 5,
        'macro' => ''
      },
      'parent' => {},
      'special' => {
        'node_content' => [],
        'normalized' => '_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e'
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
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
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
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
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 6,
        'macro' => ''
      },
      'parent' => {},
      'special' => {
        'node_content' => [],
        'normalized' => 'local-node'
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'character_and_spaces_in_node'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'special'}{'node_content'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'};
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
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[1]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[2]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'args'}[3]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_node'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'special'}{'node_content'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'};
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
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[1]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[2]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'args'}[3]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'parent'} = $result_trees{'character_and_spaces_in_node'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'special'}{'node_content'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'};
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
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[1]{'contents'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[2]{'contents'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'args'}[3]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'parent'} = $result_trees{'character_and_spaces_in_node'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'special'}{'node_content'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[4]{'extra'}{'nodes_manuals'}[0]{'node_content'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[2];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[3];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[3];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[2]{'contents'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'args'}[3]{'contents'}[0];
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'parent'} = $result_trees{'character_and_spaces_in_node'};
$result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'special'}{'node_content'} = $result_trees{'character_and_spaces_in_node'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'};

$result_texis{'character_and_spaces_in_node'} = '
@node Top
@node other nodes, !_"#$%&\'()*+-., Top, Top
@node !_"#$%&\'()*+-., /;<=>?[\\]^_`|~, other nodes, other nodes
@node /;<=>?[\\]^_`|~,local   node,!_"#$%&\'()*+-., other nodes
@node  local   node,,/;<=>?[\\]^_`|~,other nodes
';


$result_texts{'character_and_spaces_in_node'} = '
';

$result_sectioning{'character_and_spaces_in_node'} = {
  'text' => '_ROOT'
};
$result_errors{'character_and_spaces_in_node'} = [];


1;
