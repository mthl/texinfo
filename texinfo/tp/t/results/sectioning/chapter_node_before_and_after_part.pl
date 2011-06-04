use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'chapter_node_before_and_after_part'} = {
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
              'text' => 'chapter'
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
                      'text' => 'after'
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
                  'normalized' => 'after'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 6,
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
                'line_nr' => 7,
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
            'line_nr' => 5,
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
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 3,
        'macro' => ''
      },
      'number' => 1,
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
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'after'
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
            'normalized' => 'after'
          }
        ],
        'normalized' => 'after'
      },
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
              'text' => 'chapter 2'
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
        },
        {
          'cmdname' => 'contents',
          'parent' => {}
        }
      ],
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 12,
        'macro' => ''
      },
      'number' => 2,
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'};
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[1]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[1]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[1]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[1]{'parent'} = $result_trees{'chapter_node_before_and_after_part'};
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[2]{'parent'} = $result_trees{'chapter_node_before_and_after_part'};
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[3];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[3]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[3]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[3]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[3];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[3];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[3]{'extra'}{'misc_content'}[0] = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[3]{'parent'} = $result_trees{'chapter_node_before_and_after_part'};
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[4];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[4]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[4]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[4]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[4];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[4]{'extra'}{'node_content'}[0] = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[4]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[4]{'extra'}{'node_content'};
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[4]{'parent'} = $result_trees{'chapter_node_before_and_after_part'};
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[5];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[5]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[5]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[5]{'args'}[0];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[5];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[5];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[5];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[5]{'extra'}{'misc_content'}[0] = $result_trees{'chapter_node_before_and_after_part'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'chapter_node_before_and_after_part'}{'contents'}[5]{'parent'} = $result_trees{'chapter_node_before_and_after_part'};

$result_texis{'chapter_node_before_and_after_part'} = '
@node Top
@chapter chapter

@menu
* after::
@end menu

@part part

@node after
@chapter chapter 2

@contents
';


$result_texts{'chapter_node_before_and_after_part'} = '
1 chapter
*********

* after::

part
****

2 chapter 2
***********

';

$result_sectioning{'chapter_node_before_and_after_part'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'chapter',
      'extra' => {
        'associated_node' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'Top'
          }
        }
      },
      'level' => 1,
      'number' => 1,
      'section_up' => {}
    },
    {
      'cmdname' => 'part',
      'extra' => {},
      'level' => 0,
      'section_childs' => [
        {
          'cmdname' => 'chapter',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'after'
              }
            }
          },
          'level' => 1,
          'number' => 2,
          'section_up' => {}
        }
      ],
      'section_up' => {}
    }
  ]
};
$result_sectioning{'chapter_node_before_and_after_part'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'chapter_node_before_and_after_part'};
$result_sectioning{'chapter_node_before_and_after_part'}{'section_childs'}[1]{'section_childs'}[0]{'section_up'} = $result_sectioning{'chapter_node_before_and_after_part'}{'section_childs'}[1];
$result_sectioning{'chapter_node_before_and_after_part'}{'section_childs'}[1]{'section_up'} = $result_sectioning{'chapter_node_before_and_after_part'};

$result_nodes{'chapter_node_before_and_after_part'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'chapter',
      'extra' => {},
      'level' => 1,
      'number' => 1
    },
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'associated_section' => {
        'cmdname' => 'chapter',
        'extra' => {},
        'level' => 1,
        'number' => 2
      },
      'normalized' => 'after'
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
$result_nodes{'chapter_node_before_and_after_part'}{'menu_child'}{'node_prev'} = $result_nodes{'chapter_node_before_and_after_part'};
$result_nodes{'chapter_node_before_and_after_part'}{'menu_child'}{'node_up'} = $result_nodes{'chapter_node_before_and_after_part'};
$result_nodes{'chapter_node_before_and_after_part'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'chapter_node_before_and_after_part'}{'menus'}[0];
$result_nodes{'chapter_node_before_and_after_part'}{'node_next'} = $result_nodes{'chapter_node_before_and_after_part'}{'menu_child'};

$result_menus{'chapter_node_before_and_after_part'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'after'
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'chapter_node_before_and_after_part'}{'menu_child'}{'menu_up'} = $result_menus{'chapter_node_before_and_after_part'};

$result_errors{'chapter_node_before_and_after_part'} = [];



$result_converted{'plaintext'}->{'chapter_node_before_and_after_part'} = '1 chapter
*********

* Menu:

* after::

2 chapter 2
***********

1 chapter
part
2 chapter 2
';


$result_converted{'info'}->{'chapter_node_before_and_after_part'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Next: after,  Up: (dir)

1 chapter
*********

* Menu:

* after::


File: ,  Node: after,  Prev: Top,  Up: Top

2 chapter 2
***********



Tag Table:
Node: Top52
Node: after141

End Tag Table
';

1;
