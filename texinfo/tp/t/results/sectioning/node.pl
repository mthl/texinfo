use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'node'} = {
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
              'text' => 'one arg'
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
            'normalized' => 'one-arg'
          }
        ]
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'one arg'
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
              'text' => 'two arg'
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
            'normalized' => 'one-arg'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'two-arg'
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
              'text' => 'one arg'
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
              'text' => 'two arg'
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
              'text' => 'three arg'
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
            'normalized' => 'one-arg'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'two-arg'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'three-arg'
          }
        ]
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'one arg'
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
              'text' => 'two arg'
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
              'text' => 'three arg'
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
              'text' => 'four arg'
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
            'normalized' => 'one-arg'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'two-arg'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'three-arg'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'four-arg'
          }
        ]
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'one arg'
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
              'text' => 'two arg'
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
              'text' => 'three arg'
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
              'text' => 'four arg five arg'
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
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'one-arg'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'two-arg'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'three-arg'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'four-arg-five-arg'
          }
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 6,
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
              'text' => 'comment'
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'spaces_at_end'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'comment',
              'parent' => {}
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
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'comment'
          }
        ]
      },
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'arg1 '
            },
            {
              'args' => [
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'comma',
              'contents' => [],
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' arg2'
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
              'args' => [
                {
                  'parent' => {},
                  'text' => 'c'
                }
              ],
              'cmdname' => ',',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'edilla'
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'comma in strong,'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'strong',
              'contents' => [],
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'spaces_at_end'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' comma , end
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
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
              {},
              {},
              {}
            ],
            'normalized' => 'arg1-_002c-arg2'
          },
          {
            'node_content' => [
              {},
              {}
            ],
            'normalized' => '_00e7edilla'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'comma-in-strong_002c'
          }
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 10,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'node'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[0];
$result_trees{'node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[1]{'args'}[0];
$result_trees{'node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[1]{'args'}[0];
$result_trees{'node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node'}{'contents'}[1]{'args'}[0];
$result_trees{'node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[1];
$result_trees{'node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'node'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'node'}{'contents'}[1]{'parent'} = $result_trees{'node'};
$result_trees{'node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[2]{'args'}[0];
$result_trees{'node'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[2]{'args'}[0];
$result_trees{'node'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[2];
$result_trees{'node'}{'contents'}[2]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[2]{'args'}[1];
$result_trees{'node'}{'contents'}[2]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'node'}{'contents'}[2]{'args'}[1];
$result_trees{'node'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'node'}{'contents'}[2];
$result_trees{'node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'node'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'node'}{'contents'}[2]{'args'}[1]{'contents'}[1];
$result_trees{'node'}{'contents'}[2]{'parent'} = $result_trees{'node'};
$result_trees{'node'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[3]{'args'}[0];
$result_trees{'node'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[3]{'args'}[0];
$result_trees{'node'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[3];
$result_trees{'node'}{'contents'}[3]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[3]{'args'}[1];
$result_trees{'node'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'node'}{'contents'}[3];
$result_trees{'node'}{'contents'}[3]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[3]{'args'}[2];
$result_trees{'node'}{'contents'}[3]{'args'}[2]{'contents'}[2]{'parent'} = $result_trees{'node'}{'contents'}[3]{'args'}[2];
$result_trees{'node'}{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'node'}{'contents'}[3];
$result_trees{'node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'node'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'node'}{'contents'}[3]{'args'}[1]{'contents'}[1];
$result_trees{'node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'node'}{'contents'}[3]{'args'}[2]{'contents'}[1];
$result_trees{'node'}{'contents'}[3]{'parent'} = $result_trees{'node'};
$result_trees{'node'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[4]{'args'}[0];
$result_trees{'node'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[4]{'args'}[0];
$result_trees{'node'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[4];
$result_trees{'node'}{'contents'}[4]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[4]{'args'}[1];
$result_trees{'node'}{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'node'}{'contents'}[4];
$result_trees{'node'}{'contents'}[4]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[4]{'args'}[2];
$result_trees{'node'}{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'node'}{'contents'}[4];
$result_trees{'node'}{'contents'}[4]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[4]{'args'}[3];
$result_trees{'node'}{'contents'}[4]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'node'}{'contents'}[4]{'args'}[3];
$result_trees{'node'}{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'node'}{'contents'}[4];
$result_trees{'node'}{'contents'}[4]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'node'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'node'}{'contents'}[4]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'node'}{'contents'}[4]{'args'}[1]{'contents'}[1];
$result_trees{'node'}{'contents'}[4]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'node'}{'contents'}[4]{'args'}[2]{'contents'}[1];
$result_trees{'node'}{'contents'}[4]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'node'}{'contents'}[4]{'args'}[3]{'contents'}[1];
$result_trees{'node'}{'contents'}[4]{'parent'} = $result_trees{'node'};
$result_trees{'node'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[5]{'args'}[0];
$result_trees{'node'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[5]{'args'}[0];
$result_trees{'node'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[5];
$result_trees{'node'}{'contents'}[5]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[5]{'args'}[1];
$result_trees{'node'}{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'node'}{'contents'}[5];
$result_trees{'node'}{'contents'}[5]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[5]{'args'}[2];
$result_trees{'node'}{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'node'}{'contents'}[5];
$result_trees{'node'}{'contents'}[5]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[5]{'args'}[3];
$result_trees{'node'}{'contents'}[5]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'node'}{'contents'}[5]{'args'}[3];
$result_trees{'node'}{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'node'}{'contents'}[5];
$result_trees{'node'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[5];
$result_trees{'node'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'node'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'node'}{'contents'}[5]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'node'}{'contents'}[5]{'args'}[1]{'contents'}[1];
$result_trees{'node'}{'contents'}[5]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'node'}{'contents'}[5]{'args'}[2]{'contents'}[1];
$result_trees{'node'}{'contents'}[5]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'node'}{'contents'}[5]{'args'}[3]{'contents'}[1];
$result_trees{'node'}{'contents'}[5]{'parent'} = $result_trees{'node'};
$result_trees{'node'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[6]{'args'}[0];
$result_trees{'node'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[6]{'args'}[0];
$result_trees{'node'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node'}{'contents'}[6]{'args'}[0];
$result_trees{'node'}{'contents'}[6]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[6]{'args'}[0]{'contents'}[3];
$result_trees{'node'}{'contents'}[6]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'node'}{'contents'}[6]{'args'}[0];
$result_trees{'node'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[6];
$result_trees{'node'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[6];
$result_trees{'node'}{'contents'}[6]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'node'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'node'}{'contents'}[6]{'parent'} = $result_trees{'node'};
$result_trees{'node'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[0];
$result_trees{'node'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[0];
$result_trees{'node'}{'contents'}[7]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[0]{'contents'}[2];
$result_trees{'node'}{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[0];
$result_trees{'node'}{'contents'}[7]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[0];
$result_trees{'node'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[7];
$result_trees{'node'}{'contents'}[7]{'args'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[1]{'contents'}[1];
$result_trees{'node'}{'contents'}[7]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[1];
$result_trees{'node'}{'contents'}[7]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[1];
$result_trees{'node'}{'contents'}[7]{'args'}[1]{'parent'} = $result_trees{'node'}{'contents'}[7];
$result_trees{'node'}{'contents'}[7]{'args'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'node'}{'contents'}[7]{'args'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[2]{'contents'}[1];
$result_trees{'node'}{'contents'}[7]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[2];
$result_trees{'node'}{'contents'}[7]{'args'}[2]{'contents'}[2]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[2];
$result_trees{'node'}{'contents'}[7]{'args'}[2]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[2]{'contents'}[3];
$result_trees{'node'}{'contents'}[7]{'args'}[2]{'contents'}[3]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[2];
$result_trees{'node'}{'contents'}[7]{'args'}[2]{'parent'} = $result_trees{'node'}{'contents'}[7];
$result_trees{'node'}{'contents'}[7]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'node'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'node'}{'contents'}[7]{'extra'}{'nodes_manuals'}[0]{'node_content'}[1] = $result_trees{'node'}{'contents'}[7]{'args'}[0]{'contents'}[2];
$result_trees{'node'}{'contents'}[7]{'extra'}{'nodes_manuals'}[0]{'node_content'}[2] = $result_trees{'node'}{'contents'}[7]{'args'}[0]{'contents'}[3];
$result_trees{'node'}{'contents'}[7]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'node'}{'contents'}[7]{'args'}[1]{'contents'}[1];
$result_trees{'node'}{'contents'}[7]{'extra'}{'nodes_manuals'}[1]{'node_content'}[1] = $result_trees{'node'}{'contents'}[7]{'args'}[1]{'contents'}[2];
$result_trees{'node'}{'contents'}[7]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'node'}{'contents'}[7]{'args'}[2]{'contents'}[1];
$result_trees{'node'}{'contents'}[7]{'parent'} = $result_trees{'node'};

$result_texis{'node'} = '
@node one arg 
@node one arg, two arg
@node one arg, two arg, three arg
@node one arg, two arg, three arg, four arg
@node one arg, two arg, three arg, four arg five arg

@node comment @comment

@node arg1 @comma{} arg2, @,cedilla, @strong{comma in strong,} @c comma , end
';


$result_texts{'node'} = '


';

$result_errors{'node'} = [
  {
    'error_line' => ':6: warning: Superfluous arguments for node
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => 'Superfluous arguments for node',
    'type' => 'warning'
  }
];


$result_indices{'node'} = undef;


1;
