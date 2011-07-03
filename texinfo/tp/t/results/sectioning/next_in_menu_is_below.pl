use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'next_in_menu_is_below'} = {
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
                  'normalized' => 'chapter'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 4,
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
                'line_nr' => 5,
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
            'line_nr' => 3,
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
        'line_nr' => 7,
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
                      'text' => 'section'
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
                  'normalized' => 'section'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 11,
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
                      'text' => 'subsection'
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
                  'normalized' => 'subsection'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 12,
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
                'line_nr' => 13,
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
            'line_nr' => 10,
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
        'line_nr' => 8,
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
      'cmdname' => 'node',
      'contents' => [],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'section'
          }
        ],
        'normalized' => 'section'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 15,
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
                      'text' => 'subsection'
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
                  'normalized' => 'subsection'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 19,
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
                'line_nr' => 20,
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
            'line_nr' => 18,
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
        'line_nr' => 16,
        'macro' => ''
      },
      'number' => '1.1',
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
              'text' => 'subsection'
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
            'normalized' => 'subsection'
          }
        ],
        'normalized' => 'subsection'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 22,
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
              'text' => 'subsection'
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
      'cmdname' => 'subsection',
      'contents' => [],
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 3,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 23,
        'macro' => ''
      },
      'number' => '1.1.1',
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'next_in_menu_is_below'}{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'};
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'next_in_menu_is_below'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'next_in_menu_is_below'}{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'};
$result_trees{'next_in_menu_is_below'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[2];
$result_trees{'next_in_menu_is_below'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[2]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[2]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[2]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[2];
$result_trees{'next_in_menu_is_below'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'next_in_menu_is_below'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'next_in_menu_is_below'}{'contents'}[2]{'extra'}{'node_content'};
$result_trees{'next_in_menu_is_below'}{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'};
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_description'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[3]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'contents'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'extra'}{'misc_content'}[0] = $result_trees{'next_in_menu_is_below'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[3]{'parent'} = $result_trees{'next_in_menu_is_below'};
$result_trees{'next_in_menu_is_below'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[4];
$result_trees{'next_in_menu_is_below'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[4]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[4]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[4]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[4];
$result_trees{'next_in_menu_is_below'}{'contents'}[4]{'extra'}{'node_content'}[0] = $result_trees{'next_in_menu_is_below'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[4]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'next_in_menu_is_below'}{'contents'}[4]{'extra'}{'node_content'};
$result_trees{'next_in_menu_is_below'}{'contents'}[4]{'parent'} = $result_trees{'next_in_menu_is_below'};
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[2];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[2];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'contents'}[2];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[5];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'extra'}{'misc_content'}[0] = $result_trees{'next_in_menu_is_below'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[5]{'parent'} = $result_trees{'next_in_menu_is_below'};
$result_trees{'next_in_menu_is_below'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[6];
$result_trees{'next_in_menu_is_below'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[6]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[6]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[6]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[6];
$result_trees{'next_in_menu_is_below'}{'contents'}[6]{'extra'}{'node_content'}[0] = $result_trees{'next_in_menu_is_below'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[6]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'next_in_menu_is_below'}{'contents'}[6]{'extra'}{'node_content'};
$result_trees{'next_in_menu_is_below'}{'contents'}[6]{'parent'} = $result_trees{'next_in_menu_is_below'};
$result_trees{'next_in_menu_is_below'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'next_in_menu_is_below'}{'contents'}[7];
$result_trees{'next_in_menu_is_below'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[7]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[7]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[7]{'args'}[0];
$result_trees{'next_in_menu_is_below'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'next_in_menu_is_below'}{'contents'}[7];
$result_trees{'next_in_menu_is_below'}{'contents'}[7]{'extra'}{'misc_content'}[0] = $result_trees{'next_in_menu_is_below'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'next_in_menu_is_below'}{'contents'}[7]{'parent'} = $result_trees{'next_in_menu_is_below'};

$result_texis{'next_in_menu_is_below'} = '@node Top

@menu
* chapter::
@end menu

@node chapter
@chapter chapter

@menu
* section::
* subsection::
@end menu

@node section
@section section

@menu
* subsection::
@end menu

@node subsection
@subsection subsection
';


$result_texts{'next_in_menu_is_below'} = '
* chapter::

1 chapter
*********

* section::
* subsection::

1.1 section
===========

* subsection::

1.1.1 subsection
----------------
';

$result_sectioning{'next_in_menu_is_below'} = {
  'level' => 0,
  'section_childs' => [
    {
      'cmdname' => 'chapter',
      'extra' => {
        'associated_node' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'chapter'
          }
        }
      },
      'level' => 1,
      'number' => 1,
      'section_childs' => [
        {
          'cmdname' => 'section',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'section'
              }
            }
          },
          'level' => 2,
          'number' => '1.1',
          'section_childs' => [
            {
              'cmdname' => 'subsection',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'subsection'
                  }
                }
              },
              'level' => 3,
              'number' => '1.1.1',
              'section_up' => {}
            }
          ],
          'section_up' => {}
        }
      ],
      'section_up' => {}
    }
  ]
};
$result_sectioning{'next_in_menu_is_below'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'next_in_menu_is_below'}{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'next_in_menu_is_below'}{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'next_in_menu_is_below'}{'section_childs'}[0];
$result_sectioning{'next_in_menu_is_below'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'next_in_menu_is_below'};

$result_nodes{'next_in_menu_is_below'} = {
  'cmdname' => 'node',
  'extra' => {
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
      'normalized' => 'chapter'
    },
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'associated_section' => {
          'cmdname' => 'section',
          'extra' => {},
          'level' => 2,
          'number' => '1.1'
        },
        'normalized' => 'section'
      },
      'menu_child' => {
        'cmdname' => 'node',
        'extra' => {
          'associated_section' => {
            'cmdname' => 'subsection',
            'extra' => {},
            'level' => 3,
            'number' => '1.1.1'
          },
          'normalized' => 'subsection'
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
$result_nodes{'next_in_menu_is_below'}{'menu_child'}{'menu_child'}{'menu_child'}{'node_prev'} = $result_nodes{'next_in_menu_is_below'}{'menu_child'}{'menu_child'};
$result_nodes{'next_in_menu_is_below'}{'menu_child'}{'menu_child'}{'menu_child'}{'node_up'} = $result_nodes{'next_in_menu_is_below'}{'menu_child'}{'menu_child'};
$result_nodes{'next_in_menu_is_below'}{'menu_child'}{'menu_child'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'next_in_menu_is_below'}{'menu_child'}{'menu_child'}{'menus'}[0];
$result_nodes{'next_in_menu_is_below'}{'menu_child'}{'menu_child'}{'node_next'} = $result_nodes{'next_in_menu_is_below'}{'menu_child'}{'menu_child'}{'menu_child'};
$result_nodes{'next_in_menu_is_below'}{'menu_child'}{'menu_child'}{'node_up'} = $result_nodes{'next_in_menu_is_below'}{'menu_child'};
$result_nodes{'next_in_menu_is_below'}{'menu_child'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'next_in_menu_is_below'}{'menu_child'}{'menus'}[0];
$result_nodes{'next_in_menu_is_below'}{'menu_child'}{'node_prev'} = $result_nodes{'next_in_menu_is_below'};
$result_nodes{'next_in_menu_is_below'}{'menu_child'}{'node_up'} = $result_nodes{'next_in_menu_is_below'};
$result_nodes{'next_in_menu_is_below'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'next_in_menu_is_below'}{'menus'}[0];
$result_nodes{'next_in_menu_is_below'}{'node_next'} = $result_nodes{'next_in_menu_is_below'}{'menu_child'};

$result_menus{'next_in_menu_is_below'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'chapter'
    },
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'section'
      },
      'menu_child' => {
        'cmdname' => 'node',
        'extra' => {
          'normalized' => 'subsection'
        },
        'menu_prev' => {},
        'menu_up' => {},
        'menu_up_hash' => {
          'chapter' => 1,
          'section' => 1
        }
      },
      'menu_next' => {},
      'menu_up' => {},
      'menu_up_hash' => {
        'chapter' => 1
      }
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'next_in_menu_is_below'}{'menu_child'}{'menu_child'}{'menu_child'}{'menu_prev'} = $result_menus{'next_in_menu_is_below'}{'menu_child'}{'menu_child'};
$result_menus{'next_in_menu_is_below'}{'menu_child'}{'menu_child'}{'menu_child'}{'menu_up'} = $result_menus{'next_in_menu_is_below'}{'menu_child'}{'menu_child'};
$result_menus{'next_in_menu_is_below'}{'menu_child'}{'menu_child'}{'menu_next'} = $result_menus{'next_in_menu_is_below'}{'menu_child'}{'menu_child'}{'menu_child'};
$result_menus{'next_in_menu_is_below'}{'menu_child'}{'menu_child'}{'menu_up'} = $result_menus{'next_in_menu_is_below'}{'menu_child'};
$result_menus{'next_in_menu_is_below'}{'menu_child'}{'menu_up'} = $result_menus{'next_in_menu_is_below'};

$result_errors{'next_in_menu_is_below'} = [];



$result_converted{'info'}->{'next_in_menu_is_below'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Next: chapter,  Up: (dir)

* Menu:

* chapter::


File: ,  Node: chapter,  Prev: Top,  Up: Top

1 chapter
*********

* Menu:

* section::
* subsection::


File: ,  Node: section,  Next: subsection,  Up: chapter

1.1 section
===========

* Menu:

* subsection::


File: ,  Node: subsection,  Prev: section,  Up: section

1.1.1 subsection
----------------



Tag Table:
Node: Top52
Node: chapter124
Node: section230
Node: subsection339

End Tag Table
';

1;
