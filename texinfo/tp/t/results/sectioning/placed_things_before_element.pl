use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'placed_things_before_element'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'An anchor'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'anchor',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ]
            ],
            'node_content' => [
              {}
            ],
            'normalized' => 'An-anchor'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'text' => '
',
          'type' => 'empty_spaces_after_close_brace'
        },
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
              'text' => 'Ref to the anchor:
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'An anchor'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  [
                    {}
                  ]
                ],
                'label' => {},
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'An-anchor'
                }
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
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Ref to the anchor in footnote:
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Anchor in footnote'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  [
                    {}
                  ]
                ],
                'label' => {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'Anchor in footnote'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'anchor',
                  'contents' => [],
                  'extra' => {
                    'brace_command_contents' => [
                      [
                        {}
                      ]
                    ],
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'Anchor-in-footnote'
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 11,
                    'macro' => ''
                  },
                  'parent' => {
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'parent' => {},
                            'text' => 'In footnote.
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
                      },
                      {},
                      {
                        'text' => '
',
                        'type' => 'empty_spaces_after_close_brace'
                      },
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
                            'text' => 'Ref to main text anchor
'
                          },
                          {
                            'args' => [
                              {
                                'contents' => [
                                  {
                                    'parent' => {},
                                    'text' => 'An anchor'
                                  }
                                ],
                                'parent' => {},
                                'type' => 'brace_command_arg'
                              }
                            ],
                            'cmdname' => 'ref',
                            'contents' => [],
                            'extra' => {
                              'brace_command_contents' => [
                                [
                                  {}
                                ]
                              ],
                              'label' => {},
                              'node_argument' => {
                                'node_content' => [
                                  {}
                                ],
                                'normalized' => 'An-anchor'
                              }
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
'
                          }
                        ],
                        'parent' => {},
                        'type' => 'paragraph'
                      }
                    ],
                    'parent' => {
                      'args' => [
                        {}
                      ],
                      'cmdname' => 'footnote',
                      'contents' => [],
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 9,
                        'macro' => ''
                      },
                      'parent' => {
                        'contents' => [
                          {},
                          {
                            'parent' => {},
                            'text' => '
'
                          }
                        ],
                        'parent' => {},
                        'type' => 'paragraph'
                      }
                    },
                    'type' => 'brace_command_context'
                  }
                },
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'Anchor-in-footnote'
                }
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
              'text' => '.
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
        },
        {},
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
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
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            },
            {
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'float anchor'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'space_at_end_block_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'In float
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
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
                      'text' => 'float'
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
                'command_argument' => 'float',
                'text_arg' => 'float'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 19,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'block_command_line_contents' => [
              undef,
              [
                {}
              ]
            ],
            'end_command' => {},
            'node_content' => [
              {}
            ],
            'normalized' => 'float-anchor',
            'type' => {
              'normalized' => ''
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 17,
            'macro' => ''
          },
          'number' => 1,
          'parent' => {}
        },
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
              'text' => 'Ref to float
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'float anchor'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  [
                    {}
                  ]
                ],
                'label' => {},
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'float-anchor'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 22,
                'macro' => ''
              },
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
                      'text' => 'An anchor'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::                ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'menu entry pointing to the anchor.
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
                  'normalized' => 'An-anchor'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 25,
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
                'line_nr' => 26,
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
            'line_nr' => 24,
            'macro' => ''
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
                  'text' => 'index entry'
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
          'cmdname' => 'cindex',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'cindex',
              'index_name' => 'cp',
              'index_prefix' => 'c',
              'key' => 'index entry',
              'number' => 1
            },
            'misc_content' => []
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 28,
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'Ref to anchor
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'An anchor'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  [
                    {}
                  ]
                ],
                'label' => {},
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'An-anchor'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 33,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
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
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Ref to footnote anchor
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Anchor in footnote'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  [
                    {}
                  ]
                ],
                'label' => {},
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'Anchor-in-footnote'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 36,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
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
      'level' => 2,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 30,
        'macro' => ''
      },
      'number' => 1,
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[0]{'extra'}{'node_content'}[0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'extra'}{'label'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'};
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'extra'}{'node_content'}[0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[2] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'};
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[4]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'extra'}{'label'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'args'}[0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'parent'}{'contents'}[0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'};
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'parent'}{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'parent'};
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'parent'}{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[7] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'parent'};
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'args'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'args'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'args'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'extra'}{'command'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'args'}[1]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'extra'}{'end_command'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'extra'}{'node_content'}[0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'args'}[1]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'extra'}{'label'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[9];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[11]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[12]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[0]{'extra'}{'command'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[3];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[3];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[2];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[2];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'extra'}{'command'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'extra'}{'end_command'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'contents'}[2];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[13]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[14]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15]{'extra'}{'index_entry'}{'command'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15]{'extra'}{'misc_content'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15]{'extra'}{'index_entry'}{'content'};
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[15]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[16]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'};
$result_trees{'placed_things_before_element'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'placed_things_before_element'}{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'label'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'extra'}{'label'} = $result_trees{'placed_things_before_element'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'extra'}{'label'};
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'placed_things_before_element'}{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'placed_things_before_element'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'placed_things_before_element'}{'contents'}[1]{'parent'} = $result_trees{'placed_things_before_element'};

$result_texis{'placed_things_before_element'} = '@anchor{An anchor}

Ref to the anchor:
@ref{An anchor}

Ref to the anchor in footnote:
@ref{Anchor in footnote}.

@footnote{In footnote.

@anchor{Anchor in footnote}

Ref to main text anchor
@ref{An anchor}
}

@float , float anchor
In float
@end float

Ref to float
@ref{float anchor}.

@menu
* An anchor::                menu entry pointing to the anchor.
@end menu

@cindex index entry

@section section

Ref to anchor
@ref{An anchor}

Ref to footnote anchor
@ref{Anchor in footnote}
';


$result_texts{'placed_things_before_element'} = '
Ref to the anchor:


Ref to the anchor in footnote:
.



float anchor
In float

Ref to float
.

* An anchor::                menu entry pointing to the anchor.


1 section
=========

Ref to anchor


Ref to footnote anchor

';

$result_sectioning{'placed_things_before_element'} = {
  'level' => 1,
  'section_childs' => [
    {
      'cmdname' => 'section',
      'extra' => {},
      'level' => 2,
      'number' => 1,
      'section_up' => {}
    }
  ]
};
$result_sectioning{'placed_things_before_element'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'placed_things_before_element'};

$result_errors{'placed_things_before_element'} = [
  {
    'error_line' => ':24: @menu seen before first @node
',
    'file_name' => '',
    'line_nr' => 24,
    'macro' => '',
    'text' => '@menu seen before first @node',
    'type' => 'error'
  },
  {
    'error_line' => ':24: perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?
',
    'file_name' => '',
    'line_nr' => 24,
    'macro' => '',
    'text' => 'perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?',
    'type' => 'error continuation'
  },
  {
    'error_line' => ':28: Entry for index `cp\' outside of any node
',
    'file_name' => '',
    'line_nr' => 28,
    'macro' => '',
    'text' => 'Entry for index `cp\' outside of any node',
    'type' => 'error'
  }
];


$result_floats{'placed_things_before_element'} = {
  '' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'end_command' => {
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'float',
            'text_arg' => 'float'
          }
        },
        'normalized' => 'float-anchor',
        'type' => {
          'normalized' => ''
        }
      },
      'number' => 1
    }
  ]
};
$result_floats{'placed_things_before_element'}{''}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_floats{'placed_things_before_element'}{''}[0];



$result_converted{'info'}->{'placed_things_before_element'} = 'This is , produced by makeinfo version 4.13 from .

Ref to the anchor: *note An anchor::

   Ref to the anchor in footnote: *note Anchor in footnote::.

   (1)

In float

1

   Ref to float *note 1: float anchor.

* Menu:

* An anchor::                menu entry pointing to the anchor.

1 section
=========

Ref to anchor *note An anchor::

   Ref to footnote anchor *note Anchor in footnote::

   ---------- Footnotes ----------

   (1) In footnote.

   Ref to main text anchor *note An anchor::



Tag Table:
Ref: An anchor0
Ref: float anchor109
Ref: Anchor in footnote401

End Tag Table
';

$result_converted_errors{'info'}->{'placed_things_before_element'} = [
  {
    'error_line' => 'warning: Document without nodes.
',
    'text' => 'Document without nodes.',
    'type' => 'warning'
  },
  {
    'file_name' => '',
    'error_line' => ':1: warning: @anchor outside of any node
',
    'text' => '@anchor outside of any node',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 1
  },
  {
    'file_name' => '',
    'error_line' => ':9: warning: @footnote outside of any node
',
    'text' => '@footnote outside of any node',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 9
  },
  {
    'file_name' => '',
    'error_line' => ':17: warning: @float outside of any node
',
    'text' => '@float outside of any node',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 17
  },
  {
    'file_name' => '',
    'error_line' => ':11: warning: @anchor outside of any node
',
    'text' => '@anchor outside of any node',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 11
  }
];


1;
