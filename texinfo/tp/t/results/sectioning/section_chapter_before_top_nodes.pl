use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements);

use utf8;

$result_trees{'section_chapter_before_top_nodes'} = {
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
              'text' => 'section node'
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
            'normalized' => 'section-node'
          }
        ],
        'normalized' => 'section-node'
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
              'text' => 'section'
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
      'cmdname' => 'section',
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
      'level' => 2,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
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
              'text' => 'chapter node'
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
            'normalized' => 'chapter-node'
          }
        ],
        'normalized' => 'chapter-node'
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
                      'text' => 'section node'
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
                  'normalized' => 'section-node'
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
      'level' => 2,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 5,
        'macro' => ''
      },
      'number' => 2,
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
                      'text' => 'chapter node'
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
                  'normalized' => 'chapter-node'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 15,
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
                'line_nr' => 16,
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
            'line_nr' => 14,
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
      'level' => 2,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 12,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'};
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[1]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[1]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[1]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[1]{'parent'} = $result_trees{'section_chapter_before_top_nodes'};
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[2];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[2]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[2]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[2]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[2];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[2];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[2]{'parent'} = $result_trees{'section_chapter_before_top_nodes'};
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[3];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[3];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[3]{'extra'}{'node_content'};
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[3]{'parent'} = $result_trees{'section_chapter_before_top_nodes'};
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[2];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[2];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[2];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[4]{'parent'} = $result_trees{'section_chapter_before_top_nodes'};
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[5];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[5]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[5]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[5]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[5];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[5]{'extra'}{'node_content'};
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[5]{'parent'} = $result_trees{'section_chapter_before_top_nodes'};
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[2];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[2];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'contents'}[2];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'extra'}{'misc_content'}[0] = $result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'section_chapter_before_top_nodes'}{'contents'}[6]{'parent'} = $result_trees{'section_chapter_before_top_nodes'};

$result_texis{'section_chapter_before_top_nodes'} = '@node section node
@section section 

@node chapter node
@chapter chapter

@menu
* section node::
@end menu

@node Top
@top top

@menu
* chapter node::
@end menu

';


$result_texts{'section_chapter_before_top_nodes'} = '1 section
=========

2 chapter
=========

* section node::

top
===

* chapter node::

';

$result_sectioning{'section_chapter_before_top_nodes'} = {
  'level' => 1,
  'section_childs' => [
    {
      'cmdname' => 'section',
      'extra' => {
        'associated_node' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'section-node'
          }
        }
      },
      'level' => 2,
      'number' => 1,
      'section_up' => {}
    },
    {
      'cmdname' => 'chapter',
      'extra' => {
        'associated_node' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'chapter-node'
          }
        }
      },
      'level' => 2,
      'number' => 2,
      'section_prev' => {},
      'section_up' => {}
    },
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
      'level' => 2,
      'section_prev' => {},
      'section_up' => {}
    }
  ]
};
$result_sectioning{'section_chapter_before_top_nodes'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'section_chapter_before_top_nodes'};
$result_sectioning{'section_chapter_before_top_nodes'}{'section_childs'}[1]{'section_prev'} = $result_sectioning{'section_chapter_before_top_nodes'}{'section_childs'}[0];
$result_sectioning{'section_chapter_before_top_nodes'}{'section_childs'}[1]{'section_up'} = $result_sectioning{'section_chapter_before_top_nodes'};
$result_sectioning{'section_chapter_before_top_nodes'}{'section_childs'}[2]{'section_prev'} = $result_sectioning{'section_chapter_before_top_nodes'}{'section_childs'}[1];
$result_sectioning{'section_chapter_before_top_nodes'}{'section_childs'}[2]{'section_up'} = $result_sectioning{'section_chapter_before_top_nodes'};

$result_nodes{'section_chapter_before_top_nodes'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'level' => 2
    },
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'associated_section' => {
        'cmdname' => 'chapter',
        'extra' => {},
        'level' => 2,
        'number' => 2
      },
      'normalized' => 'chapter-node'
    },
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'associated_section' => {
          'cmdname' => 'section',
          'extra' => {},
          'level' => 2,
          'number' => 1
        },
        'normalized' => 'section-node'
      },
      'node_next' => {},
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
$result_nodes{'section_chapter_before_top_nodes'}{'menu_child'}{'menu_child'}{'node_next'} = $result_nodes{'section_chapter_before_top_nodes'}{'menu_child'};
$result_nodes{'section_chapter_before_top_nodes'}{'menu_child'}{'menu_child'}{'node_up'} = $result_nodes{'section_chapter_before_top_nodes'}{'menu_child'};
$result_nodes{'section_chapter_before_top_nodes'}{'menu_child'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'section_chapter_before_top_nodes'}{'menu_child'}{'menus'}[0];
$result_nodes{'section_chapter_before_top_nodes'}{'menu_child'}{'node_next'} = $result_nodes{'section_chapter_before_top_nodes'};
$result_nodes{'section_chapter_before_top_nodes'}{'menu_child'}{'node_prev'} = $result_nodes{'section_chapter_before_top_nodes'};
$result_nodes{'section_chapter_before_top_nodes'}{'menu_child'}{'node_up'} = $result_nodes{'section_chapter_before_top_nodes'};
$result_nodes{'section_chapter_before_top_nodes'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'section_chapter_before_top_nodes'}{'menus'}[0];
$result_nodes{'section_chapter_before_top_nodes'}{'node_next'} = $result_nodes{'section_chapter_before_top_nodes'}{'menu_child'};

$result_menus{'section_chapter_before_top_nodes'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'chapter-node'
    },
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'section-node'
      },
      'menu_up' => {},
      'menu_up_hash' => {
        'chapter-node' => 1
      }
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'section_chapter_before_top_nodes'}{'menu_child'}{'menu_child'}{'menu_up'} = $result_menus{'section_chapter_before_top_nodes'}{'menu_child'};
$result_menus{'section_chapter_before_top_nodes'}{'menu_child'}{'menu_up'} = $result_menus{'section_chapter_before_top_nodes'};

$result_errors{'section_chapter_before_top_nodes'} = [
  {
    'error_line' => ':5: Lowering the section level of @chapter appearing after a lower element
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'Lowering the section level of @chapter appearing after a lower element',
    'type' => 'error'
  },
  {
    'error_line' => ':12: Lowering the section level of @top appearing after a lower element
',
    'file_name' => '',
    'line_nr' => 12,
    'macro' => '',
    'text' => 'Lowering the section level of @top appearing after a lower element',
    'type' => 'error'
  },
  {
    'error_line' => ':1: warning: No node following `section node\' in menu, but `chapter node\' follows in sectioning
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'No node following `section node\' in menu, but `chapter node\' follows in sectioning',
    'type' => 'warning'
  },
  {
    'error_line' => ':4: warning: No node following `chapter node\' in menu, but `Top\' follows in sectioning
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'No node following `chapter node\' in menu, but `Top\' follows in sectioning',
    'type' => 'warning'
  }
];



$result_converted{'info'}->{'section_chapter_before_top_nodes'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: section node,  Next: chapter node,  Up: chapter node

1 section
=========


File: ,  Node: chapter node,  Next: Top,  Prev: Top,  Up: Top

2 chapter
=========

* Menu:

* section node::


File: ,  Node: Top,  Next: chapter node,  Up: (dir)

top
===

* Menu:

* chapter node::



Tag Table:
Node: section node52
Node: chapter node144
Node: Top257

End Tag Table
';

1;
