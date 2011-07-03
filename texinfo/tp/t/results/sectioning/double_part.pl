use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'double_part'} = {
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
                      'text' => 'node chapter'
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
                  'normalized' => 'node-chapter'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 5,
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
                'line_nr' => 6,
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
            'line_nr' => 4,
            'macro' => ''
          },
          'parent' => {}
        },
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
              'text' => 'part first'
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
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Text part first.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
        'line_nr' => 8,
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
              'text' => 'part second'
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'Text part second.
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
        'misc_content' => [
          {}
        ]
      },
      'level' => 0,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 11,
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
              'text' => 'node chapter'
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
            'normalized' => 'node-chapter'
          }
        ],
        'normalized' => 'node-chapter'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 14,
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
              'text' => 'chapter after 2 parts'
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
      'cmdname' => 'chapter',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'associated_part' => {},
        'misc_content' => [
          {}
        ]
      },
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 15,
        'macro' => ''
      },
      'number' => 1,
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'double_part'}{'contents'}[0]{'parent'} = $result_trees{'double_part'};
$result_trees{'double_part'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'double_part'}{'contents'}[1];
$result_trees{'double_part'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[1]{'args'}[0];
$result_trees{'double_part'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_part'}{'contents'}[1]{'args'}[0];
$result_trees{'double_part'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_part'}{'contents'}[1]{'args'}[0];
$result_trees{'double_part'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[1];
$result_trees{'double_part'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'double_part'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'double_part'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'double_part'}{'contents'}[1]{'parent'} = $result_trees{'double_part'};
$result_trees{'double_part'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'double_part'}{'contents'}[2];
$result_trees{'double_part'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'args'}[0];
$result_trees{'double_part'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'args'}[0];
$result_trees{'double_part'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'args'}[0];
$result_trees{'double_part'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[2];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[2];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'double_part'}{'contents'}[2];
$result_trees{'double_part'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'double_part'}{'contents'}[2];
$result_trees{'double_part'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'double_part'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[2]{'parent'} = $result_trees{'double_part'};
$result_trees{'double_part'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'double_part'}{'contents'}[3];
$result_trees{'double_part'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[3]{'args'}[0];
$result_trees{'double_part'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_part'}{'contents'}[3]{'args'}[0];
$result_trees{'double_part'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_part'}{'contents'}[3]{'args'}[0];
$result_trees{'double_part'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[3];
$result_trees{'double_part'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[3];
$result_trees{'double_part'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[3]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'double_part'}{'contents'}[3];
$result_trees{'double_part'}{'contents'}[3]{'extra'}{'misc_content'}[0] = $result_trees{'double_part'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[3]{'parent'} = $result_trees{'double_part'};
$result_trees{'double_part'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'double_part'}{'contents'}[4];
$result_trees{'double_part'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[4]{'args'}[0];
$result_trees{'double_part'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_part'}{'contents'}[4]{'args'}[0];
$result_trees{'double_part'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_part'}{'contents'}[4]{'args'}[0];
$result_trees{'double_part'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[4];
$result_trees{'double_part'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[4]{'contents'}[0];
$result_trees{'double_part'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[4];
$result_trees{'double_part'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'double_part'}{'contents'}[4];
$result_trees{'double_part'}{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'double_part'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[4]{'parent'} = $result_trees{'double_part'};
$result_trees{'double_part'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'double_part'}{'contents'}[5];
$result_trees{'double_part'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[5]{'args'}[0];
$result_trees{'double_part'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_part'}{'contents'}[5]{'args'}[0];
$result_trees{'double_part'}{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_part'}{'contents'}[5]{'args'}[0];
$result_trees{'double_part'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[5];
$result_trees{'double_part'}{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'double_part'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'double_part'}{'contents'}[5]{'extra'}{'node_content'};
$result_trees{'double_part'}{'contents'}[5]{'parent'} = $result_trees{'double_part'};
$result_trees{'double_part'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'double_part'}{'contents'}[6];
$result_trees{'double_part'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[6]{'args'}[0];
$result_trees{'double_part'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_part'}{'contents'}[6]{'args'}[0];
$result_trees{'double_part'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_part'}{'contents'}[6]{'args'}[0];
$result_trees{'double_part'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[6];
$result_trees{'double_part'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'double_part'}{'contents'}[6];
$result_trees{'double_part'}{'contents'}[6]{'extra'}{'associated_part'} = $result_trees{'double_part'}{'contents'}[4];
$result_trees{'double_part'}{'contents'}[6]{'extra'}{'misc_content'}[0] = $result_trees{'double_part'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'double_part'}{'contents'}[6]{'parent'} = $result_trees{'double_part'};

$result_texis{'double_part'} = '@node Top
@top top

@menu
* node chapter::
@end menu

@part part first

Text part first.
@part part second
Text part second.

@node node chapter
@chapter chapter after 2 parts

';


$result_texts{'double_part'} = 'top
***

* node chapter::

part first
**********

Text part first.
part second
***********
Text part second.

1 chapter after 2 parts
***********************

';

$result_sectioning{'double_part'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'top',
      'extra' => {
        'associated_node' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'Top'
          }
        }
      },
      'level' => 0,
      'section_up' => {}
    },
    {
      'cmdname' => 'part',
      'extra' => {
        'part_associated_section' => {
          'cmdname' => 'chapter',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'node-chapter'
              }
            },
            'associated_part' => {
              'cmdname' => 'part',
              'extra' => {
                'part_associated_section' => {}
              },
              'level' => 0,
              'section_childs' => [
                {}
              ],
              'section_prev' => {},
              'section_up' => {}
            }
          },
          'level' => 1,
          'number' => 1,
          'section_up' => {}
        }
      },
      'level' => 0,
      'section_prev' => {},
      'section_up' => {}
    },
    {}
  ]
};
$result_sectioning{'double_part'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'double_part'};
$result_sectioning{'double_part'}{'section_childs'}[1]{'extra'}{'part_associated_section'}{'extra'}{'associated_part'}{'extra'}{'part_associated_section'} = $result_sectioning{'double_part'}{'section_childs'}[1]{'extra'}{'part_associated_section'};
$result_sectioning{'double_part'}{'section_childs'}[1]{'extra'}{'part_associated_section'}{'extra'}{'associated_part'}{'section_childs'}[0] = $result_sectioning{'double_part'}{'section_childs'}[1]{'extra'}{'part_associated_section'};
$result_sectioning{'double_part'}{'section_childs'}[1]{'extra'}{'part_associated_section'}{'extra'}{'associated_part'}{'section_prev'} = $result_sectioning{'double_part'}{'section_childs'}[1];
$result_sectioning{'double_part'}{'section_childs'}[1]{'extra'}{'part_associated_section'}{'extra'}{'associated_part'}{'section_up'} = $result_sectioning{'double_part'};
$result_sectioning{'double_part'}{'section_childs'}[1]{'extra'}{'part_associated_section'}{'section_up'} = $result_sectioning{'double_part'}{'section_childs'}[1]{'extra'}{'part_associated_section'}{'extra'}{'associated_part'};
$result_sectioning{'double_part'}{'section_childs'}[1]{'section_prev'} = $result_sectioning{'double_part'}{'section_childs'}[0];
$result_sectioning{'double_part'}{'section_childs'}[1]{'section_up'} = $result_sectioning{'double_part'};
$result_sectioning{'double_part'}{'section_childs'}[2] = $result_sectioning{'double_part'}{'section_childs'}[1]{'extra'}{'part_associated_section'}{'extra'}{'associated_part'};

$result_nodes{'double_part'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'level' => 0
    },
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'associated_section' => {
        'cmdname' => 'chapter',
        'extra' => {
          'associated_part' => {
            'cmdname' => 'part',
            'extra' => {},
            'level' => 0
          }
        },
        'level' => 1,
        'number' => 1
      },
      'normalized' => 'node-chapter'
    },
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
$result_nodes{'double_part'}{'menu_child'}{'node_prev'} = $result_nodes{'double_part'};
$result_nodes{'double_part'}{'menu_child'}{'node_up'} = $result_nodes{'double_part'};
$result_nodes{'double_part'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'double_part'}{'menus'}[0];
$result_nodes{'double_part'}{'node_next'} = $result_nodes{'double_part'}{'menu_child'};

$result_menus{'double_part'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'node-chapter'
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'double_part'}{'menu_child'}{'menu_up'} = $result_menus{'double_part'};

$result_errors{'double_part'} = [];



$result_converted{'plaintext'}->{'double_part'} = 'top
***

* Menu:

* node chapter::

Text part first.
Text part second.

1 chapter after 2 parts
***********************

';

1;
