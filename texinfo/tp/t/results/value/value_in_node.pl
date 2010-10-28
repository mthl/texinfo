use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'value_in_node'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'node1',
              'type' => 'misc_arg'
            },
            {
              'parent' => {},
              'text' => 'Node 1',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'set',
          'extra' => {
            'arg_line' => ' node1 Node 1
'
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
              'text' => '(dir)'
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
              'text' => '(dir)'
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
              'text' => '(dir)'
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
          },
          {
            'manual_content' => [
              {
                'parent' => {},
                'text' => 'dir'
              }
            ]
          },
          {
            'manual_content' => [
              {
                'parent' => {},
                'text' => 'dir'
              }
            ]
          },
          {
            'manual_content' => [
              {
                'parent' => {},
                'text' => 'dir'
              }
            ]
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
              'text' => 'Expansion in Node Names'
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
                      'text' => 'Node 1'
                    },
                    {
                      'parent' => {},
                      'text' => '  ',
                      'type' => 'space_at_end_menu_node'
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
                'menu_entry_node' => {
                  'node_content' => [
                    {},
                    {}
                  ],
                  'normalized' => 'Node-1'
                }
              },
              'parent' => {},
              'type' => 'menu_entry'
            }
          ],
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'Node 1'
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
            'normalized' => 'Node-1'
          },
          undef,
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
        'line_nr' => 10,
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
              'text' => 'Chapter 1'
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
          'args' => [
            {
              'parent' => {},
              'text' => 'sec1',
              'type' => 'misc_arg'
            },
            {
              'parent' => {},
              'text' => 'Section 1.1',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'set',
          'extra' => {
            'arg_line' => ' sec1 Section 1.1
'
          },
          'parent' => {}
        },
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
                      'text' => 'Section 1.1'
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
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'Section-1_002e1'
                }
              },
              'parent' => {},
              'type' => 'menu_entry'
            }
          ],
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'Section 1.1'
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
              'text' => 'Node 1'
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
              'text' => 'Node 1'
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
                      'text' => 'Node 1'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'xref',
              'contents' => [],
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Section-1_002e1'
          },
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Node-1'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Node-1'
          }
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 19,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'value_in_node'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[0]{'contents'}[0];
$result_trees{'value_in_node'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[0]{'contents'}[0];
$result_trees{'value_in_node'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[0];
$result_trees{'value_in_node'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[0];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[1];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[2];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[1]{'manual_content'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[1];
$result_trees{'value_in_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[2]{'manual_content'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[2];
$result_trees{'value_in_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[3]{'manual_content'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[1]{'parent'} = $result_trees{'value_in_node'};
$result_trees{'value_in_node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[1] = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2];
$result_trees{'value_in_node'}{'contents'}[2]{'parent'} = $result_trees{'value_in_node'};
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3]{'args'}[2];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3];
$result_trees{'value_in_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'value_in_node'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'value_in_node'}{'contents'}[3]{'args'}[2]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'value_in_node'}{'contents'}[3]{'args'}[3]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[3]{'parent'} = $result_trees{'value_in_node'};
$result_trees{'value_in_node'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[1];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4];
$result_trees{'value_in_node'}{'contents'}[4]{'parent'} = $result_trees{'value_in_node'};
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'args'}[2];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5];
$result_trees{'value_in_node'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5];
$result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1]{'contents'}[0];
$result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5];
$result_trees{'value_in_node'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'value_in_node'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[5]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'value_in_node'}{'contents'}[5]{'args'}[2]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[5]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'value_in_node'}{'contents'}[5]{'args'}[3]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[5]{'parent'} = $result_trees{'value_in_node'};

$result_texis{'value_in_node'} = '@set node1 Node 1

@node Top, (dir), (dir), (dir)
@top Expansion in Node Names

@menu
* Node 1  ::
@end menu

@node Node 1,, Top, Top
@chapter Chapter 1

@set sec1 Section 1.1

@menu
* Section 1.1::
@end menu

@node Section 1.1, , Node 1, Node 1

@xref{Node 1}.
';


$result_texts{'value_in_node'} = '
Expansion in Node Names

* Node 1  ::

Chapter 1


* Section 1.1::


.
';

$result_errors{'value_in_node'} = [];


$result_indices{'value_in_node'} = undef;


1;
