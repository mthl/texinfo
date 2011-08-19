use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'part_node_chapter_after_top'} = [
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
                        'text' => 'a node after part'
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
                        'contents' => [
                          {
                            'parent' => {},
                            'text' => '
'
                          }
                        ],
                        'parent' => {},
                        'type' => 'preformatted'
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
                    'normalized' => 'a-node-after-part'
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
                        'text' => 'chapter'
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
                        'contents' => [
                          {
                            'parent' => {},
                            'text' => '
'
                          }
                        ],
                        'parent' => {},
                        'type' => 'preformatted'
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
                    'normalized' => 'chapter'
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
                'text' => 'a node after part'
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
                'text' => 'chapter'
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
        'contents' => [
          {
            'contents' => [
              {
                'parent' => {},
                'text' => 'After a node after part
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
          'node_content' => [
            {}
          ],
          'nodes_manuals' => [
            {
              'node_content' => [],
              'normalized' => 'a-node-after-part'
            },
            {
              'node_content' => [
                {}
              ],
              'normalized' => 'chapter'
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
          'normalized' => 'a-node-after-part'
        },
        'line_nr' => {
          'file_name' => '',
          'line_nr' => 11,
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
        'cmdname' => 'node',
        'contents' => [],
        'extra' => {
          'node_content' => [
            {}
          ],
          'nodes_manuals' => [
            {
              'node_content' => [],
              'normalized' => 'chapter'
            }
          ],
          'normalized' => 'chapter'
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
        'contents' => [],
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
    'element_prev' => {},
    'extra' => {
      'element_command' => {},
      'node' => {},
      'section' => {}
    },
    'type' => 'element'
  }
];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_description'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'extra'}{'command'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[3];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3]{'extra'}{'misc_content'}[0] = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[2];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[3];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[3];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'extra'}{'node_content'}[0] = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'extra'}{'node_content'};
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[1]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[2]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'args'}[3]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[4]{'parent'} = $result_trees{'part_node_chapter_after_top'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'extra'}{'element_command'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2];
$result_trees{'part_node_chapter_after_top'}[0]{'extra'}{'node'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[0]{'extra'}{'section'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0]{'extra'}{'node_content'}[0] = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0]{'extra'}{'node_content'};
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[1];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'extra'}{'associated_part'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[3];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'parent'} = $result_trees{'part_node_chapter_after_top'}[1];
$result_trees{'part_node_chapter_after_top'}[1]{'element_prev'} = $result_trees{'part_node_chapter_after_top'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'extra'}{'element_command'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1];
$result_trees{'part_node_chapter_after_top'}[1]{'extra'}{'node'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'extra'}{'section'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1];

$result_texis{'part_node_chapter_after_top'} = '@node Top
@top top

@menu
* a node after part::
* chapter::
@end menu

@part part

@node a node after part, chapter, Top, Top
After a node after part

@node chapter
@chapter chapter 
';


$result_texts{'part_node_chapter_after_top'} = 'top
***

* a node after part::
* chapter::

part
****

After a node after part

1 chapter
*********
';

$result_sectioning{'part_node_chapter_after_top'} = {
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
                'normalized' => 'chapter'
              }
            },
            'associated_part' => {}
          },
          'level' => 1,
          'number' => 1,
          'section_up' => {},
          'toplevel_prev' => {}
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
$result_sectioning{'part_node_chapter_after_top'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'part_node_chapter_after_top'};
$result_sectioning{'part_node_chapter_after_top'}{'section_childs'}[1]{'extra'}{'part_associated_section'}{'extra'}{'associated_part'} = $result_sectioning{'part_node_chapter_after_top'}{'section_childs'}[1];
$result_sectioning{'part_node_chapter_after_top'}{'section_childs'}[1]{'extra'}{'part_associated_section'}{'section_up'} = $result_sectioning{'part_node_chapter_after_top'}{'section_childs'}[1];
$result_sectioning{'part_node_chapter_after_top'}{'section_childs'}[1]{'extra'}{'part_associated_section'}{'toplevel_prev'} = $result_sectioning{'part_node_chapter_after_top'}{'section_childs'}[0];
$result_sectioning{'part_node_chapter_after_top'}{'section_childs'}[1]{'section_childs'}[0] = $result_sectioning{'part_node_chapter_after_top'}{'section_childs'}[1]{'extra'}{'part_associated_section'};
$result_sectioning{'part_node_chapter_after_top'}{'section_childs'}[1]{'section_prev'} = $result_sectioning{'part_node_chapter_after_top'}{'section_childs'}[0];
$result_sectioning{'part_node_chapter_after_top'}{'section_childs'}[1]{'section_up'} = $result_sectioning{'part_node_chapter_after_top'};

$result_nodes{'part_node_chapter_after_top'} = {
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
      'normalized' => 'a-node-after-part'
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
          'number' => 1
        },
        'normalized' => 'chapter'
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
$result_nodes{'part_node_chapter_after_top'}{'menu_child'}{'node_next'}{'node_prev'} = $result_nodes{'part_node_chapter_after_top'}{'menu_child'};
$result_nodes{'part_node_chapter_after_top'}{'menu_child'}{'node_next'}{'node_up'} = $result_nodes{'part_node_chapter_after_top'};
$result_nodes{'part_node_chapter_after_top'}{'menu_child'}{'node_prev'} = $result_nodes{'part_node_chapter_after_top'};
$result_nodes{'part_node_chapter_after_top'}{'menu_child'}{'node_up'} = $result_nodes{'part_node_chapter_after_top'};
$result_nodes{'part_node_chapter_after_top'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'part_node_chapter_after_top'}{'menus'}[0];
$result_nodes{'part_node_chapter_after_top'}{'node_next'} = $result_nodes{'part_node_chapter_after_top'}{'menu_child'};

$result_menus{'part_node_chapter_after_top'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'a-node-after-part'
    },
    'menu_next' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'chapter'
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
$result_menus{'part_node_chapter_after_top'}{'menu_child'}{'menu_next'}{'menu_prev'} = $result_menus{'part_node_chapter_after_top'}{'menu_child'};
$result_menus{'part_node_chapter_after_top'}{'menu_child'}{'menu_next'}{'menu_up'} = $result_menus{'part_node_chapter_after_top'};
$result_menus{'part_node_chapter_after_top'}{'menu_child'}{'menu_up'} = $result_menus{'part_node_chapter_after_top'};

$result_errors{'part_node_chapter_after_top'} = [];


$result_elements{'part_node_chapter_after_top'} = [
  {
    'extra' => {
      'directions' => {
        'FastForward' => {
          'extra' => {
            'directions' => {
              'Back' => {},
              'FastBack' => {},
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
              'number' => 1
            },
            'node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'chapter'
              },
              'menu_prev' => {
                'cmdname' => 'node',
                'extra' => {
                  'normalized' => 'a-node-after-part'
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
        'Forward' => {},
        'Next' => {},
        'NodeBack' => {},
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
  {}
];
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Back'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'FastBack'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'NodePrev'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'NodeUp'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'This'} = $result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Up'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'node'}{'menu_prev'}{'menu_next'} = $result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'node'};
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'node'}{'menu_prev'}{'menu_up'}{'menu_child'} = $result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'node'}{'menu_prev'};
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'node'}{'menu_up'} = $result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'node'}{'menu_prev'}{'menu_up'};
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'section'} = $result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'element_command'};
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'Forward'} = $result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'Next'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'NodeBack'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'NodeForward'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'NodeNext'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'This'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'node'} = $result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'node'}{'menu_prev'}{'menu_up'};
$result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'section'} = $result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'element_command'};
$result_elements{'part_node_chapter_after_top'}[1] = $result_elements{'part_node_chapter_after_top'}[0]{'extra'}{'directions'}{'FastForward'};



$result_directions_text{'part_node_chapter_after_top'} = 'element: @top top
  FastForward: @chapter chapter
  Forward: @chapter chapter
  Next: @top top
  NodeBack: @top top
  NodeForward: @top top
  NodeNext: @top top
  NodeUp: (dir)
  This: @top top
element: @chapter chapter
  Back: @top top
  FastBack: @top top
  NodePrev: @top top
  NodeUp: @top top
  This: @chapter chapter
  Up: @top top
';


$result_converted{'info'}->{'part_node_chapter_after_top'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Next: a node after part,  Up: (dir)

top
***

* Menu:

* a node after part::
* chapter::


File: ,  Node: a node after part,  Next: chapter,  Prev: Top,  Up: Top

After a node after part


File: ,  Node: chapter,  Prev: a node after part,  Up: Top

1 chapter
*********



Tag Table:
Node: Top52
Node: a node after part165
Node: chapter264

End Tag Table
';


$result_converted{'html'}->{'part_node_chapter_after_top'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Created by texi2html, http://www.gnu.org/software/texinfo/ -->
<head>
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="Generator" content="texi2html">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="#Top" rel="start" title="Top">
<style type="text/css">
<!--
a.summary-letter {text-decoration: none}
blockquote.smallquotation {font-size: smaller}
div.display {margin-left: 3.2em}
div.example {margin-left: 3.2em}
div.lisp {margin-left: 3.2em}
div.smalldisplay {margin-left: 3.2em}
div.smallexample {margin-left: 3.2em}
div.smalllisp {margin-left: 3.2em}
pre.display {font-family: serif}
pre.format {font-family: serif}
pre.menu-comment {font-family: serif}
pre.menu-preformatted {font-family: serif}
pre.smalldisplay {font-family: serif; font-size: smaller}
pre.smallexample {font-size: smaller}
pre.smallformat {font-family: serif; font-size: smaller}
pre.smalllisp {font-size: smaller}
span.nocodebreak {white-space:pre}
span.nolinebreak {white-space:pre}
span.roman {font-family:serif; font-weight:normal}
span.sansserif {font-family:sans-serif; font-weight:normal}
ul.no-bullet {list-style: none}
-->
</style>


</head>

<body lang="en" bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000">

<a name="Top"></a>
<div class="header">
<p>
Next: <a href="#a-node-after-part" accesskey="n" rel="next">a node after part</a>, Up: <a href="dir.html#Top" accesskey="u" rel="up">(dir)</a> &nbsp; </p>
</div>
<a name="top"></a>
<h1 class="top">top</h1>

<table class="menu" border="0" cellspacing="0">
<tr><td align="left" valign="top">&bull; <a href="#a-node-after-part" accesskey="1">a node after part</a>:</td><td>&nbsp;&nbsp;</td><td align="left" valign="top">
</td></tr>
<tr><td align="left" valign="top">&bull; <a href="#chapter" accesskey="2">chapter</a>:</td><td>&nbsp;&nbsp;</td><td align="left" valign="top">
</td></tr>
</table>

<hr>
<a name="part"></a>
<div class="header">
<p>
Next: <a href="#chapter" accesskey="n" rel="next">chapter</a>, Previous: <a href="#Top" accesskey="p" rel="previous">Top</a>, Up: <a href="#Top" accesskey="u" rel="up">Top</a> &nbsp; </p>
</div>
<h1 class="part">part</h1>
<hr>

<a name="a-node-after-part"></a>
<h3 class="node-heading">a node after part</h3>
<p>After a node after part
</p>
<hr>
<a name="chapter"></a>
<div class="header">
<p>
Previous: <a href="#a-node-after-part" accesskey="p" rel="previous">a node after part</a>, Up: <a href="#Top" accesskey="u" rel="up">Top</a> &nbsp; </p>
</div>
<a name="chapter-1"></a>
<h1 class="chapter">1 chapter</h1>
<hr>
<p>


</p>
</body>
</html>
';

1;
