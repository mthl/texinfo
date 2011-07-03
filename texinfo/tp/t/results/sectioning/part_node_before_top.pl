use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements);

use utf8;

$result_trees{'part_node_before_top'} = {
  'contents' => [
    {
      'contents' => [],
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
              'text' => 'part node before top'
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
          'contents' => [],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
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
            'normalized' => 'part-node-before-top'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          },
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'part-node-before-top'
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
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'part'
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
      'cmdname' => 'part',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 0,
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
              'text' => 'top'
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
      'cmdname' => 'top',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'menu',
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
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
                      'text' => 'part node before top'
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
                      'parent' => {},
                      'text' => '
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'part-node-before-top'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 8,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'menu_entry'
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
                      'text' => 'menu'
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
              'cmdname' => 'end',
              'extra' => {
                'command' => {},
                'command_argument' => 'menu',
                'text_arg' => 'menu'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 9,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'end_command' => {}
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 7,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'associated_part' => {},
        'misc_content' => [
          {}
        ]
      },
      'level' => 0,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 5,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'part_node_before_top'}{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'};
$result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_before_top'}{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[0];
$result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[0];
$result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[1];
$result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[3];
$result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[3];
$result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'part_node_before_top'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'part_node_before_top'}{'contents'}[1]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[1]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'part_node_before_top'}{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'part_node_before_top'}{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'};
$result_trees{'part_node_before_top'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_before_top'}{'contents'}[2];
$result_trees{'part_node_before_top'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[2]{'args'}[0];
$result_trees{'part_node_before_top'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[2]{'args'}[0];
$result_trees{'part_node_before_top'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[2]{'args'}[0];
$result_trees{'part_node_before_top'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[2];
$result_trees{'part_node_before_top'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[2];
$result_trees{'part_node_before_top'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'part_node_before_top'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[2]{'parent'} = $result_trees{'part_node_before_top'};
$result_trees{'part_node_before_top'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_before_top'}{'contents'}[3];
$result_trees{'part_node_before_top'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[3]{'args'}[0];
$result_trees{'part_node_before_top'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[3]{'args'}[0];
$result_trees{'part_node_before_top'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[3]{'args'}[0];
$result_trees{'part_node_before_top'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[3];
$result_trees{'part_node_before_top'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'part_node_before_top'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'part_node_before_top'}{'contents'}[3]{'extra'}{'node_content'};
$result_trees{'part_node_before_top'}{'contents'}[3]{'parent'} = $result_trees{'part_node_before_top'};
$result_trees{'part_node_before_top'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_before_top'}{'contents'}[4];
$result_trees{'part_node_before_top'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'args'}[0];
$result_trees{'part_node_before_top'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'args'}[0];
$result_trees{'part_node_before_top'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'args'}[0];
$result_trees{'part_node_before_top'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[2];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[2];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'contents'}[2];
$result_trees{'part_node_before_top'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}{'contents'}[4];
$result_trees{'part_node_before_top'}{'contents'}[4]{'extra'}{'associated_part'} = $result_trees{'part_node_before_top'}{'contents'}[2];
$result_trees{'part_node_before_top'}{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'part_node_before_top'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'part_node_before_top'}{'contents'}[4]{'parent'} = $result_trees{'part_node_before_top'};

$result_texis{'part_node_before_top'} = '@node part node before top, Top,,Top
@part part

@node Top
@top top

@menu
* part node before top::
@end menu
';


$result_texts{'part_node_before_top'} = 'part
****

top
***

* part node before top::
';

$result_sectioning{'part_node_before_top'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'part',
      'extra' => {
        'part_associated_section' => {
          'cmdname' => 'top',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'Top'
              }
            },
            'associated_part' => {}
          },
          'level' => 0,
          'section_prev' => {},
          'section_up' => {}
        }
      },
      'level' => 0,
      'section_up' => {}
    },
    {}
  ]
};
$result_sectioning{'part_node_before_top'}{'section_childs'}[0]{'extra'}{'part_associated_section'}{'extra'}{'associated_part'} = $result_sectioning{'part_node_before_top'}{'section_childs'}[0];
$result_sectioning{'part_node_before_top'}{'section_childs'}[0]{'extra'}{'part_associated_section'}{'section_prev'} = $result_sectioning{'part_node_before_top'}{'section_childs'}[0];
$result_sectioning{'part_node_before_top'}{'section_childs'}[0]{'extra'}{'part_associated_section'}{'section_up'} = $result_sectioning{'part_node_before_top'};
$result_sectioning{'part_node_before_top'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'part_node_before_top'};
$result_sectioning{'part_node_before_top'}{'section_childs'}[1] = $result_sectioning{'part_node_before_top'}{'section_childs'}[0]{'extra'}{'part_associated_section'};

$result_nodes{'part_node_before_top'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {
        'associated_part' => {
          'cmdname' => 'part',
          'extra' => {},
          'level' => 0
        }
      },
      'level' => 0
    },
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'part-node-before-top'
    },
    'node_next' => {},
    'node_prev' => {},
    'node_up' => {}
  },
  'menus' => [
    {
      'cmdname' => 'menu',
      'extra' => {
        'end_command' => {
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'menu',
            'text_arg' => 'menu'
          }
        }
      }
    }
  ],
  'node_next' => {},
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
$result_nodes{'part_node_before_top'}{'menu_child'}{'node_next'} = $result_nodes{'part_node_before_top'};
$result_nodes{'part_node_before_top'}{'menu_child'}{'node_prev'} = $result_nodes{'part_node_before_top'};
$result_nodes{'part_node_before_top'}{'menu_child'}{'node_up'} = $result_nodes{'part_node_before_top'};
$result_nodes{'part_node_before_top'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'part_node_before_top'}{'menus'}[0];
$result_nodes{'part_node_before_top'}{'node_next'} = $result_nodes{'part_node_before_top'}{'menu_child'};

$result_menus{'part_node_before_top'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'part-node-before-top'
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'part_node_before_top'}{'menu_child'}{'menu_up'} = $result_menus{'part_node_before_top'};

$result_errors{'part_node_before_top'} = [];



$result_converted{'info'}->{'part_node_before_top'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: part node before top,  Next: Top,  Prev: Top,  Up: Top


File: ,  Node: Top,  Next: part node before top,  Up: (dir)

top
***

* Menu:

* part node before top::


Tag Table:
Node: part node before top52
Node: Top125

End Tag Table
';

1;
