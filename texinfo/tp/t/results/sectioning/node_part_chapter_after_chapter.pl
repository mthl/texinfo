use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'node_part_chapter_after_chapter'} = [
  {
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
                  'line_nr' => 5,
                  'macro' => ''
                },
                'parent' => {},
                'type' => 'menu_entry'
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
                        'text' => 'part chapter node'
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
                    'normalized' => 'part-chapter-node'
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
      }
    ],
    'extra' => {
      'element_command' => {},
      'node' => {},
      'section' => {}
    },
    'type' => 'element'
  },
  {
    'contents' => [
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
              'normalized' => 'chapter-node'
            }
          ],
          'normalized' => 'chapter-node'
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
          'misc_content' => [
            {}
          ]
        },
        'level' => 1,
        'line_nr' => {
          'file_name' => '',
          'line_nr' => 11,
          'macro' => ''
        },
        'number' => 1,
        'parent' => {}
      }
    ],
    'element_prev' => {},
    'extra' => {
      'element_command' => {},
      'node' => {},
      'section' => {}
    },
    'type' => 'element'
  },
  {
    'contents' => [
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
                'text' => 'part chapter node'
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
              'normalized' => 'part-chapter-node'
            }
          ],
          'normalized' => 'part-chapter-node'
        },
        'line_nr' => {
          'file_name' => '',
          'line_nr' => 13,
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
                'text' => 'chapter with part node'
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
          'associated_part' => {},
          'misc_content' => [
            {}
          ]
        },
        'level' => 1,
        'line_nr' => {
          'file_name' => '',
          'line_nr' => 16,
          'macro' => ''
        },
        'number' => 2,
        'parent' => {}
      }
    ],
    'element_prev' => {},
    'extra' => {
      'element_command' => {},
      'node' => {},
      'section' => {}
    },
    'type' => 'element'
  }
];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_description'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'extra'}{'command'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[0];
$result_trees{'node_part_chapter_after_chapter'}[0]{'extra'}{'element_command'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[0]{'extra'}{'node'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[0]{'extra'}{'section'} = $result_trees{'node_part_chapter_after_chapter'}[0]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0]{'extra'}{'node_content'}[0] = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0]{'extra'}{'node_content'};
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[1];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[1];
$result_trees{'node_part_chapter_after_chapter'}[1]{'element_prev'} = $result_trees{'node_part_chapter_after_chapter'}[0];
$result_trees{'node_part_chapter_after_chapter'}[1]{'extra'}{'element_command'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[1]{'extra'}{'node'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[0];
$result_trees{'node_part_chapter_after_chapter'}[1]{'extra'}{'section'} = $result_trees{'node_part_chapter_after_chapter'}[1]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0]{'extra'}{'node_content'}[0] = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0]{'extra'}{'node_content'};
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2]{'extra'}{'associated_part'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2]{'parent'} = $result_trees{'node_part_chapter_after_chapter'}[2];
$result_trees{'node_part_chapter_after_chapter'}[2]{'element_prev'} = $result_trees{'node_part_chapter_after_chapter'}[1];
$result_trees{'node_part_chapter_after_chapter'}[2]{'extra'}{'element_command'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2];
$result_trees{'node_part_chapter_after_chapter'}[2]{'extra'}{'node'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[0];
$result_trees{'node_part_chapter_after_chapter'}[2]{'extra'}{'section'} = $result_trees{'node_part_chapter_after_chapter'}[2]{'contents'}[2];

$result_texis{'node_part_chapter_after_chapter'} = '@node Top
@top top

@menu
* chapter node::
* part chapter node::
@end menu

@node chapter node

@chapter chapter node

@node part chapter node
@part part

@chapter chapter with part node

@contents
';


$result_texts{'node_part_chapter_after_chapter'} = 'top
***

* chapter node::
* part chapter node::


1 chapter node
**************

part
****

2 chapter with part node
************************

';

$result_sectioning{'node_part_chapter_after_chapter'} = {
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
      'section_childs' => [
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
          'level' => 1,
          'number' => 1,
          'section_up' => {}
        }
      ],
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
                'normalized' => 'part-chapter-node'
              }
            },
            'associated_part' => {}
          },
          'level' => 1,
          'number' => 2,
          'section_up' => {}
        }
      },
      'level' => 0,
      'section_childs' => [
        {}
      ],
      'section_prev' => {},
      'section_up' => {}
    }
  ]
};
$result_sectioning{'node_part_chapter_after_chapter'}{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'node_part_chapter_after_chapter'}{'section_childs'}[0];
$result_sectioning{'node_part_chapter_after_chapter'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'node_part_chapter_after_chapter'};
$result_sectioning{'node_part_chapter_after_chapter'}{'section_childs'}[1]{'extra'}{'part_associated_section'}{'extra'}{'associated_part'} = $result_sectioning{'node_part_chapter_after_chapter'}{'section_childs'}[1];
$result_sectioning{'node_part_chapter_after_chapter'}{'section_childs'}[1]{'extra'}{'part_associated_section'}{'section_up'} = $result_sectioning{'node_part_chapter_after_chapter'}{'section_childs'}[1];
$result_sectioning{'node_part_chapter_after_chapter'}{'section_childs'}[1]{'section_childs'}[0] = $result_sectioning{'node_part_chapter_after_chapter'}{'section_childs'}[1]{'extra'}{'part_associated_section'};
$result_sectioning{'node_part_chapter_after_chapter'}{'section_childs'}[1]{'section_prev'} = $result_sectioning{'node_part_chapter_after_chapter'}{'section_childs'}[0];
$result_sectioning{'node_part_chapter_after_chapter'}{'section_childs'}[1]{'section_up'} = $result_sectioning{'node_part_chapter_after_chapter'};

$result_nodes{'node_part_chapter_after_chapter'} = {
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
        'extra' => {},
        'level' => 1,
        'number' => 1
      },
      'normalized' => 'chapter-node'
    },
    'node_next' => {
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
          'number' => 2
        },
        'normalized' => 'part-chapter-node'
      },
      'node_prev' => {},
      'node_up' => {}
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
$result_nodes{'node_part_chapter_after_chapter'}{'menu_child'}{'node_next'}{'node_prev'} = $result_nodes{'node_part_chapter_after_chapter'}{'menu_child'};
$result_nodes{'node_part_chapter_after_chapter'}{'menu_child'}{'node_next'}{'node_up'} = $result_nodes{'node_part_chapter_after_chapter'};
$result_nodes{'node_part_chapter_after_chapter'}{'menu_child'}{'node_prev'} = $result_nodes{'node_part_chapter_after_chapter'};
$result_nodes{'node_part_chapter_after_chapter'}{'menu_child'}{'node_up'} = $result_nodes{'node_part_chapter_after_chapter'};
$result_nodes{'node_part_chapter_after_chapter'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'node_part_chapter_after_chapter'}{'menus'}[0];
$result_nodes{'node_part_chapter_after_chapter'}{'node_next'} = $result_nodes{'node_part_chapter_after_chapter'}{'menu_child'};

$result_menus{'node_part_chapter_after_chapter'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'chapter-node'
    },
    'menu_next' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'part-chapter-node'
      },
      'menu_prev' => {},
      'menu_up' => {},
      'menu_up_hash' => {
        'Top' => 1
      }
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'node_part_chapter_after_chapter'}{'menu_child'}{'menu_next'}{'menu_prev'} = $result_menus{'node_part_chapter_after_chapter'}{'menu_child'};
$result_menus{'node_part_chapter_after_chapter'}{'menu_child'}{'menu_next'}{'menu_up'} = $result_menus{'node_part_chapter_after_chapter'};
$result_menus{'node_part_chapter_after_chapter'}{'menu_child'}{'menu_up'} = $result_menus{'node_part_chapter_after_chapter'};

$result_errors{'node_part_chapter_after_chapter'} = [];


$result_elements{'node_part_chapter_after_chapter'} = [
  {
    'extra' => {
      'directions' => {
        'FastForward' => {
          'extra' => {
            'directions' => {
              'Back' => {},
              'FastBack' => {},
              'Forward' => {
                'extra' => {
                  'directions' => {
                    'Back' => {},
                    'NodeBack' => {},
                    'NodePrev' => {},
                    'NodeUp' => {},
                    'This' => {},
                    'Up' => {}
                  },
                  'element_command' => {
                    'cmdname' => 'chapter',
                    'extra' => {
                      'associated_part' => {
                        'cmdname' => 'part',
                        'extra' => {},
                        'level' => 0
                      }
                    },
                    'level' => 1,
                    'number' => 2
                  },
                  'node' => {
                    'cmdname' => 'node',
                    'extra' => {
                      'normalized' => 'part-chapter-node'
                    },
                    'menu_prev' => {
                      'cmdname' => 'node',
                      'extra' => {
                        'normalized' => 'chapter-node'
                      },
                      'menu_next' => {},
                      'menu_up' => {
                        'cmdname' => 'node',
                        'extra' => {
                          'normalized' => 'Top'
                        },
                        'menu_child' => {}
                      },
                      'menu_up_hash' => {
                        'Top' => 1
                      }
                    },
                    'menu_up' => {},
                    'menu_up_hash' => {
                      'Top' => 1
                    }
                  },
                  'section' => {}
                },
                'type' => 'element'
              },
              'NodeBack' => {},
              'NodeForward' => {},
              'NodeNext' => {},
              'NodePrev' => {},
              'NodeUp' => {},
              'This' => {},
              'Up' => {}
            },
            'element_command' => {
              'cmdname' => 'chapter',
              'extra' => {},
              'level' => 1,
              'number' => 1
            },
            'node' => {},
            'section' => {}
          },
          'type' => 'element'
        },
        'Forward' => {},
        'Next' => {},
        'NodeForward' => {},
        'NodeNext' => {},
        'NodeUp' => {
          'extra' => {
            'manual_content' => [
              {
                'text' => 'dir'
              }
            ]
          },
          'type' => 'external_node'
        },
        'This' => {}
      },
      'element_command' => {
        'cmdname' => 'top',
        'extra' => {},
        'level' => 0
      },
      'node' => {},
      'section' => {}
    },
    'type' => 'element'
  },
  {},
  {}
];
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Back'} = $result_elements{'node_part_chapter_after_chapter'}[0];
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'FastBack'} = $result_elements{'node_part_chapter_after_chapter'}[0];
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'directions'}{'Back'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'directions'}{'NodeBack'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'directions'}{'NodePrev'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'directions'}{'NodeUp'} = $result_elements{'node_part_chapter_after_chapter'}[0];
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'directions'}{'This'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'directions'}{'Up'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'node'}{'menu_prev'}{'menu_next'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'node'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'node'}{'menu_prev'}{'menu_up'}{'menu_child'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'node'}{'menu_prev'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'node'}{'menu_up'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'node'}{'menu_prev'}{'menu_up'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'section'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'element_command'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'NodeBack'} = $result_elements{'node_part_chapter_after_chapter'}[0];
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'NodeForward'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'NodeNext'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'NodePrev'} = $result_elements{'node_part_chapter_after_chapter'}[0];
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'NodeUp'} = $result_elements{'node_part_chapter_after_chapter'}[0];
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'This'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Up'} = $result_elements{'node_part_chapter_after_chapter'}[0];
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'node'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'node'}{'menu_prev'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'section'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'element_command'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'Forward'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'Next'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'NodeForward'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'NodeNext'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'This'} = $result_elements{'node_part_chapter_after_chapter'}[0];
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'node'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'}{'extra'}{'node'}{'menu_prev'}{'menu_up'};
$result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'section'} = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'element_command'};
$result_elements{'node_part_chapter_after_chapter'}[1] = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'node_part_chapter_after_chapter'}[2] = $result_elements{'node_part_chapter_after_chapter'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Forward'};



$result_directions_text{'node_part_chapter_after_chapter'} = 'element: @top top
  FastForward: @chapter chapter node
  Forward: @chapter chapter node
  Next: @chapter chapter with part node
  NodeForward: @chapter chapter node
  NodeNext: @chapter chapter node
  NodeUp: (dir)
  This: @top top
element: @chapter chapter node
  Back: @top top
  FastBack: @top top
  Forward: @chapter chapter with part node
  NodeBack: @top top
  NodeForward: @chapter chapter with part node
  NodeNext: @chapter chapter with part node
  NodePrev: @top top
  NodeUp: @top top
  This: @chapter chapter node
  Up: @top top
element: @chapter chapter with part node
  Back: @chapter chapter node
  NodeBack: @chapter chapter node
  NodePrev: @chapter chapter node
  NodeUp: @top top
  This: @chapter chapter with part node
  Up: @chapter chapter with part node
';


$result_converted{'plaintext'}->{'node_part_chapter_after_chapter'} = 'top
***

* Menu:

* chapter node::
* part chapter node::

1 chapter node
**************

2 chapter with part node
************************

top
1 chapter node
part
2 chapter with part node
';


$result_converted{'info'}->{'node_part_chapter_after_chapter'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Next: chapter node,  Up: (dir)

top
***

* Menu:

* chapter node::
* part chapter node::


File: ,  Node: chapter node,  Next: part chapter node,  Prev: Top,  Up: Top

1 chapter node
**************


File: ,  Node: part chapter node,  Prev: chapter node,  Up: Top

2 chapter with part node
************************



Tag Table:
Node: Top52
Node: chapter node165
Node: part chapter node275

End Tag Table
';

1;
