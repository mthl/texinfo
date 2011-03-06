use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'space_in_node'} = {
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
                      'text' => 'Chap    first here'
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
                  'normalized' => 'Chap-first-here'
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
                      'text' => 'Test    title   '
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_name'
                },
                {
                  'parent' => {},
                  'text' => ':',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Test   title'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '.',
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
                  'normalized' => 'Test-title'
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
                  'parent' => {},
                  'text' => '*   ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Last with spaces'
                    },
                    {
                      'parent' => {},
                      'text' => '    ',
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
                  'normalized' => 'Last-with-spaces'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 7,
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
                'line_nr' => 8,
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
              'parent' => {},
              'text' => '  ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'Chap first	here'
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
            'normalized' => 'Chap-first-here'
          }
        ],
        'normalized' => 'Chap-first-here'
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
              'text' => 'Test               title'
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
            'normalized' => 'Test-title'
          }
        ],
        'normalized' => 'Test-title'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 12,
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
              'text' => '   ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'Last with spaces'
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
            'normalized' => 'Last-with-spaces'
          }
        ],
        'normalized' => 'Last-with-spaces'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 14,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'space_in_node'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[0];
$result_trees{'space_in_node'}{'contents'}[0]{'parent'} = $result_trees{'space_in_node'};
$result_trees{'space_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'space_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'space_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'space_in_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[4]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[5];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[5]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[0];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'extra'}{'menu_entry_node'}{'node_content'}[1] = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[4];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'extra'}{'command'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'contents'}[4];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'space_in_node'}{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'space_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'space_in_node'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'space_in_node'}{'contents'}[1]{'parent'} = $result_trees{'space_in_node'};
$result_trees{'space_in_node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[2]{'args'}[0];
$result_trees{'space_in_node'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_node'}{'contents'}[2]{'args'}[0];
$result_trees{'space_in_node'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'space_in_node'}{'contents'}[2]{'args'}[0];
$result_trees{'space_in_node'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[2];
$result_trees{'space_in_node'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[2];
$result_trees{'space_in_node'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'space_in_node'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'space_in_node'}{'contents'}[2]{'extra'}{'node_content'};
$result_trees{'space_in_node'}{'contents'}[2]{'parent'} = $result_trees{'space_in_node'};
$result_trees{'space_in_node'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[3]{'args'}[0];
$result_trees{'space_in_node'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_node'}{'contents'}[3]{'args'}[0];
$result_trees{'space_in_node'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'space_in_node'}{'contents'}[3]{'args'}[0];
$result_trees{'space_in_node'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[3];
$result_trees{'space_in_node'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[3];
$result_trees{'space_in_node'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'space_in_node'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'space_in_node'}{'contents'}[3]{'extra'}{'node_content'};
$result_trees{'space_in_node'}{'contents'}[3]{'parent'} = $result_trees{'space_in_node'};
$result_trees{'space_in_node'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[4]{'args'}[0];
$result_trees{'space_in_node'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_node'}{'contents'}[4]{'args'}[0];
$result_trees{'space_in_node'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'space_in_node'}{'contents'}[4]{'args'}[0];
$result_trees{'space_in_node'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'space_in_node'}{'contents'}[4];
$result_trees{'space_in_node'}{'contents'}[4]{'extra'}{'node_content'}[0] = $result_trees{'space_in_node'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'space_in_node'}{'contents'}[4]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'space_in_node'}{'contents'}[4]{'extra'}{'node_content'};
$result_trees{'space_in_node'}{'contents'}[4]{'parent'} = $result_trees{'space_in_node'};

$result_texis{'space_in_node'} = '
@node Top

@menu
* Chap    first here::
* Test    title   :Test   title.
*   Last with spaces    ::
@end menu

@node  Chap first	here

@node Test               title

@node   Last with spaces 
';


$result_texts{'space_in_node'} = '

* Chap    first here::
* Test    title   :Test   title.
*   Last with spaces    ::



';

$result_sectioning{'space_in_node'} = {};

$result_nodes{'space_in_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'Chap-first-here'
    },
    'node_next' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'Test-title'
      },
      'node_next' => {
        'cmdname' => 'node',
        'extra' => {
          'normalized' => 'Last-with-spaces'
        },
        'node_prev' => {},
        'node_up' => {}
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
$result_nodes{'space_in_node'}{'menu_child'}{'node_next'}{'node_next'}{'node_prev'} = $result_nodes{'space_in_node'}{'menu_child'}{'node_next'};
$result_nodes{'space_in_node'}{'menu_child'}{'node_next'}{'node_next'}{'node_up'} = $result_nodes{'space_in_node'};
$result_nodes{'space_in_node'}{'menu_child'}{'node_next'}{'node_prev'} = $result_nodes{'space_in_node'}{'menu_child'};
$result_nodes{'space_in_node'}{'menu_child'}{'node_next'}{'node_up'} = $result_nodes{'space_in_node'};
$result_nodes{'space_in_node'}{'menu_child'}{'node_prev'} = $result_nodes{'space_in_node'};
$result_nodes{'space_in_node'}{'menu_child'}{'node_up'} = $result_nodes{'space_in_node'};
$result_nodes{'space_in_node'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'space_in_node'}{'menus'}[0];
$result_nodes{'space_in_node'}{'node_next'} = $result_nodes{'space_in_node'}{'menu_child'};

$result_menus{'space_in_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'Chap-first-here'
    },
    'menu_next' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'Test-title'
      },
      'menu_next' => {
        'cmdname' => 'node',
        'extra' => {
          'normalized' => 'Last-with-spaces'
        },
        'menu_prev' => {},
        'menu_up' => {},
        'menu_up_hash' => {
          'Top' => 1
        }
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
$result_menus{'space_in_node'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_prev'} = $result_menus{'space_in_node'}{'menu_child'}{'menu_next'};
$result_menus{'space_in_node'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_up'} = $result_menus{'space_in_node'};
$result_menus{'space_in_node'}{'menu_child'}{'menu_next'}{'menu_prev'} = $result_menus{'space_in_node'}{'menu_child'};
$result_menus{'space_in_node'}{'menu_child'}{'menu_next'}{'menu_up'} = $result_menus{'space_in_node'};
$result_menus{'space_in_node'}{'menu_child'}{'menu_up'} = $result_menus{'space_in_node'};

$result_errors{'space_in_node'} = [];



$result_converted{'info'}->{'space_in_node'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Next: Chap first here,  Up: (dir)

* Menu:

* Chap    first here::
* Test    title   :Test   title.
*   Last with spaces    ::


File: ,  Node: Chap first here,  Next: Test title,  Prev: Top,  Up: Top


File: ,  Node: Test title,  Next: Last with spaces,  Prev: Chap first here,  Up: Top


File: ,  Node: Last with spaces,  Prev: Test title,  Up: Top



Tag Table:
Node: Top52
Node: Chap first here203
Node: Test title278
Node: Last with spaces366

End Tag Table
';

1;
