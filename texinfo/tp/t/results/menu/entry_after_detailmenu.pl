use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'entry_after_detailmenu'} = {
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
              'cmdname' => 'detailmenu',
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
                          'text' => 'second'
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
                      'normalized' => 'second'
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
                          'text' => 'detailmenu'
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
                    'command_argument' => 'detailmenu',
                    'text_arg' => 'detailmenu'
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
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line'
                    },
                    {
                      'parent' => {},
                      'text' => 'Menu comment
'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
              'parent' => {},
              'type' => 'menu_comment'
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
                      'text' => 'first'
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
                  'normalized' => 'first'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 10,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'menu_entry'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'after_description_line'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
              'parent' => {},
              'type' => 'menu_comment'
            },
            {
              'cmdname' => 'detailmenu',
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
                          'text' => 'second'
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
                      'normalized' => 'second'
                    }
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 13,
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
                          'text' => 'detailmenu'
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
                    'command_argument' => 'detailmenu',
                    'text_arg' => 'detailmenu'
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 14,
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
                'line_nr' => 12,
                'macro' => ''
              },
              'parent' => {}
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
                      'text' => 'second'
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
                  'normalized' => 'second'
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
              'text' => 'first'
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
            'normalized' => 'first'
          }
        ],
        'normalized' => 'first'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 18,
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
              'text' => 'second'
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
            'normalized' => 'second'
          }
        ],
        'normalized' => 'second'
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
$result_trees{'entry_after_detailmenu'}{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'};
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'extra'}{'menu_entry_description'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[4];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[0]{'extra'}{'command'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[3];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[3];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[2];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[2];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[2]{'extra'}{'command'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'extra'}{'end_command'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'contents'}[2];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[3];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[3]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'extra'}{'menu_entry_description'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[3];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[1]{'contents'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[7];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[7];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'extra'}{'command'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'contents'}[7];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'entry_after_detailmenu'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'entry_after_detailmenu'}{'contents'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'};
$result_trees{'entry_after_detailmenu'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'entry_after_detailmenu'}{'contents'}[2];
$result_trees{'entry_after_detailmenu'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[2]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[2]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[2]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[2];
$result_trees{'entry_after_detailmenu'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'entry_after_detailmenu'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'entry_after_detailmenu'}{'contents'}[2]{'extra'}{'node_content'};
$result_trees{'entry_after_detailmenu'}{'contents'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'};
$result_trees{'entry_after_detailmenu'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'entry_after_detailmenu'}{'contents'}[3];
$result_trees{'entry_after_detailmenu'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[3]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[3]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[3]{'args'}[0];
$result_trees{'entry_after_detailmenu'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'entry_after_detailmenu'}{'contents'}[3];
$result_trees{'entry_after_detailmenu'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'entry_after_detailmenu'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'entry_after_detailmenu'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'entry_after_detailmenu'}{'contents'}[3]{'extra'}{'node_content'};
$result_trees{'entry_after_detailmenu'}{'contents'}[3]{'parent'} = $result_trees{'entry_after_detailmenu'};

$result_texis{'entry_after_detailmenu'} = '@node Top

@menu
@detailmenu
* second::
@end detailmenu

Menu comment

* first::

@detailmenu
* second::
@end detailmenu
* second::
@end menu

@node first
@node second
';


$result_texts{'entry_after_detailmenu'} = '
* second::

Menu comment

* first::

* second::
* second::

';

$result_sectioning{'entry_after_detailmenu'} = {};

$result_nodes{'entry_after_detailmenu'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'first'
    },
    'node_next' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'second'
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
$result_nodes{'entry_after_detailmenu'}{'menu_child'}{'node_next'}{'node_prev'} = $result_nodes{'entry_after_detailmenu'}{'menu_child'};
$result_nodes{'entry_after_detailmenu'}{'menu_child'}{'node_next'}{'node_up'} = $result_nodes{'entry_after_detailmenu'};
$result_nodes{'entry_after_detailmenu'}{'menu_child'}{'node_prev'} = $result_nodes{'entry_after_detailmenu'};
$result_nodes{'entry_after_detailmenu'}{'menu_child'}{'node_up'} = $result_nodes{'entry_after_detailmenu'};
$result_nodes{'entry_after_detailmenu'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'entry_after_detailmenu'}{'menus'}[0];
$result_nodes{'entry_after_detailmenu'}{'node_next'} = $result_nodes{'entry_after_detailmenu'}{'menu_child'};

$result_menus{'entry_after_detailmenu'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'first'
    },
    'menu_next' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'second'
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
$result_menus{'entry_after_detailmenu'}{'menu_child'}{'menu_next'}{'menu_prev'} = $result_menus{'entry_after_detailmenu'}{'menu_child'};
$result_menus{'entry_after_detailmenu'}{'menu_child'}{'menu_next'}{'menu_up'} = $result_menus{'entry_after_detailmenu'};
$result_menus{'entry_after_detailmenu'}{'menu_child'}{'menu_up'} = $result_menus{'entry_after_detailmenu'};

$result_errors{'entry_after_detailmenu'} = [];



$result_converted{'plaintext'}->{'entry_after_detailmenu'} = '* Menu:

* second::

Menu comment

* first::

* second::
* second::

';

1;
