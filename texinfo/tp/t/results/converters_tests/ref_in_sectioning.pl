use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'ref_in_sectioning'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'contents',
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 1,
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
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'for example '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'node'
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
                          'extra' => {
                            'command' => {}
                          },
                          'parent' => {},
                          'text' => ' ',
                          'type' => 'empty_spaces_after_command'
                        },
                        {
                          'parent' => {},
                          'text' => 'node'
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
                        'normalized' => 'node'
                      }
                    ],
                    'normalized' => 'node'
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 11,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'node'
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
              'text' => ' ('
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'node'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'pxref',
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
                  'normalized' => 'node'
                }
              },
              'line_nr' => {},
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ') ('
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Top'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'file'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'manual'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'pxref',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  [
                    {}
                  ],
                  undef,
                  undef,
                  [
                    {}
                  ],
                  [
                    {}
                  ]
                ],
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'Top'
                }
              },
              'line_nr' => {},
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ')'
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
                      'text' => 'node'
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
                  'normalized' => 'node'
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
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'chap'
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
                  'normalized' => 'chap'
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
            'line_nr' => 6,
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
          {},
          {},
          {},
          {},
          {},
          {},
          {}
        ]
      },
      'level' => 0,
      'line_nr' => {},
      'parent' => {}
    },
    {},
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'node'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'title'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'file name'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'manual'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'xref',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  [
                    {}
                  ],
                  undef,
                  [
                    {}
                  ],
                  [
                    {}
                  ],
                  [
                    {}
                  ]
                ],
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'node'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 12,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '.'
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
          {},
          {}
        ]
      },
      'level' => 1,
      'line_nr' => {},
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
              'text' => 'chap'
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
            'normalized' => 'chap'
          }
        ],
        'normalized' => 'chap'
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'node'
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
                  'normalized' => 'node'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 15,
                'macro' => ''
              },
              'parent' => {}
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
      'line_nr' => {},
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'node'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'cross ref name'
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
                  ],
                  [
                    {}
                  ]
                ],
                'label' => {},
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'node'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 17,
                'macro' => ''
              },
              'parent' => {}
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
      'line_nr' => {},
      'number' => '2.1',
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
              'args' => [
                {
                  'contents' => [
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'node'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'code',
                      'contents' => [],
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 19,
                        'macro' => ''
                      },
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
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
                              'text' => 'title'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'samp',
                      'contents' => [],
                      'line_nr' => {},
                      'parent' => {}
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
                  ],
                  undef,
                  [
                    {}
                  ]
                ],
                'label' => {},
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'node'
                }
              },
              'line_nr' => {},
              'parent' => {}
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
      'line_nr' => {},
      'number' => '2.2',
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
              'args' => [
                {
                  'contents' => [
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'node'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'code',
                      'contents' => [],
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 21,
                        'macro' => ''
                      },
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'file name'
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
                  ],
                  undef,
                  undef,
                  [
                    {}
                  ]
                ],
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'node'
                }
              },
              'line_nr' => {},
              'parent' => {}
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
      'line_nr' => {},
      'number' => '2.3',
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'node'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'manual'
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
                  ],
                  undef,
                  undef,
                  undef,
                  [
                    {}
                  ]
                ],
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'node'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 23,
                'macro' => ''
              },
              'parent' => {}
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
      'line_nr' => {},
      'number' => '2.4',
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
              'args' => [
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'manual'
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
                  undef,
                  undef,
                  undef,
                  undef,
                  [
                    {}
                  ]
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 25,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' no node but manual'
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
          {},
          {}
        ]
      },
      'level' => 2,
      'line_nr' => {},
      'number' => '2.5',
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
              'text' => '('
            },
            {
              'args' => [
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'file name'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'pxref',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  undef,
                  undef,
                  undef,
                  [
                    {}
                  ]
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 27,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ') no node but file name'
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
          {},
          {},
          {}
        ]
      },
      'level' => 2,
      'line_nr' => {},
      'number' => '2.6',
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'a'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'b'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'c'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'inforef',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  [
                    {}
                  ],
                  [
                    {}
                  ],
                  [
                    {}
                  ]
                ],
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'a'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 29,
                'macro' => ''
              },
              'parent' => {}
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'node'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => ' ',
                          'type' => 'empty_spaces_before_argument'
                        },
                        {
                          'parent' => {},
                          'text' => 'cross ref name in heading'
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
                      ],
                      [
                        {}
                      ]
                    ],
                    'label' => {},
                    'node_argument' => {
                      'node_content' => [
                        {}
                      ],
                      'normalized' => 'node'
                    }
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 31,
                    'macro' => ''
                  },
                  'parent' => {}
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
          'cmdname' => 'heading',
          'extra' => {
            'misc_content' => [
              {}
            ]
          },
          'level' => 2,
          'line_nr' => {},
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'args' => [
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'node'
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'code',
                          'contents' => [],
                          'line_nr' => {
                            'file_name' => '',
                            'line_nr' => 33,
                            'macro' => ''
                          },
                          'parent' => {}
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => ' ',
                          'type' => 'empty_spaces_before_argument'
                        },
                        {
                          'parent' => {},
                          'text' => 'file name'
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
                      ],
                      undef,
                      undef,
                      [
                        {}
                      ]
                    ],
                    'node_argument' => {
                      'node_content' => [
                        {}
                      ],
                      'normalized' => 'node'
                    }
                  },
                  'line_nr' => {},
                  'parent' => {}
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
          'cmdname' => 'subheading',
          'extra' => {
            'misc_content' => [
              {}
            ]
          },
          'level' => 3,
          'line_nr' => {},
          'parent' => {}
        }
      ],
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 2,
      'line_nr' => {},
      'number' => '2.7',
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'ref_in_sectioning'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'};
$result_trees{'ref_in_sectioning'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'ref_in_sectioning'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'ref_in_sectioning'}{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'};
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'}{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'};
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'}{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'}{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'}{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'}{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'}{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'}{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'}{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'};
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'}{'extra'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'}{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'}{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'}{'extra'}{'node_content'};
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'}{'parent'} = $result_trees{'ref_in_sectioning'};
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[4];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[4]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[4]{'extra'}{'label'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'};
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[4]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[4]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'args'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'args'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'args'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'args'}[3]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'args'}[4]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'args'}[4];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'args'}[4]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'args'}[3]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'extra'}{'brace_command_contents'}[4][0] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'args'}[4]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_description'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'contents'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'extra'}{'misc_content'}[1] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'extra'}{'misc_content'}[2] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'extra'}{'misc_content'}[3] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[4];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'extra'}{'misc_content'}[4] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[5];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'extra'}{'misc_content'}[5] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[6];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'extra'}{'misc_content'}[6] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[7];
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'};
$result_trees{'ref_in_sectioning'}{'contents'}[3] = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'};
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[4];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[4]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[4];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[4]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[2]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[4][0] = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[4]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[4];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[4];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'extra'}{'misc_content'}[1] = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[4]{'parent'} = $result_trees{'ref_in_sectioning'};
$result_trees{'ref_in_sectioning'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[5];
$result_trees{'ref_in_sectioning'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[5]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[5]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[5]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[5];
$result_trees{'ref_in_sectioning'}{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'ref_in_sectioning'}{'contents'}[5]{'extra'}{'node_content'};
$result_trees{'ref_in_sectioning'}{'contents'}[5]{'parent'} = $result_trees{'ref_in_sectioning'};
$result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[6];
$result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'extra'}{'label'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'};
$result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[6];
$result_trees{'ref_in_sectioning'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[6];
$result_trees{'ref_in_sectioning'}{'contents'}[6]{'extra'}{'misc_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[6]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[6]{'parent'} = $result_trees{'ref_in_sectioning'};
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[7];
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'extra'}{'label'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'};
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[7];
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[7];
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'extra'}{'misc_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[7]{'parent'} = $result_trees{'ref_in_sectioning'};
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[8];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[2]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[2]{'contents'}[1]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[2]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'extra'}{'label'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'};
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[8];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[8];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'extra'}{'misc_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[8]{'parent'} = $result_trees{'ref_in_sectioning'};
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[9];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[9];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[9];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'extra'}{'misc_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[9]{'parent'} = $result_trees{'ref_in_sectioning'};
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[10];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'args'}[4]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'args'}[4];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'args'}[4]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[4][0] = $result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'args'}[4]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[10];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[10];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'extra'}{'misc_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[10]{'parent'} = $result_trees{'ref_in_sectioning'};
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[11];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[4]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[4];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[4]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[4][0] = $result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[4]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[11];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[11];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'extra'}{'misc_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'extra'}{'misc_content'}[1] = $result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[11]{'parent'} = $result_trees{'ref_in_sectioning'};
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[12];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[2]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[2]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[2]{'args'}[3]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[12];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[12];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'extra'}{'misc_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'extra'}{'misc_content'}[1] = $result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'extra'}{'misc_content'}[2] = $result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[12]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[12]{'parent'} = $result_trees{'ref_in_sectioning'};
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[13];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'args'}[2];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'args'}[2]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1]{'extra'}{'label'} = $result_trees{'ref_in_sectioning'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'extra'}{'label'};
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'extra'}{'misc_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'contents'}[3]{'parent'} = $result_trees{'ref_in_sectioning'}{'contents'}[13];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'extra'}{'misc_content'}[0] = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'line_nr'} = $result_trees{'ref_in_sectioning'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'ref_in_sectioning'}{'contents'}[13]{'parent'} = $result_trees{'ref_in_sectioning'};

$result_texis{'ref_in_sectioning'} = '@contents

@node Top
@top for example @ref{node} (@pxref{node}) (@pxref{Top,,, file, manual})

@menu
* node::
* chap::
@end menu

@node node
@chapter @xref{node,,title, file name, manual}.

@node chap
@chapter @ref{node}

@section @ref{node, cross ref name}

@section @ref{@code{node},, @samp{title}}

@section @ref{@code{node},,, file name}

@section @ref{node,,,, manual}

@section @ref{,,,, manual} no node but manual

@section (@pxref{,,, file name}) no node but file name

@section @inforef{a, b, c}

@heading @ref{node, cross ref name in heading}

@subheading @ref{@code{node},,, file name}
';


$result_texts{'ref_in_sectioning'} = '
for example  () ()
******************

* node::
* chap::

1 .
***

2 
**

2.1 
====

2.2 
====

2.3 
====

2.4 
====

2.5  no node but manual
=======================

2.6 () no node but file name
============================

2.7 
====


';

$result_sectioning{'ref_in_sectioning'} = {
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
                'normalized' => 'node'
              }
            }
          },
          'level' => 1,
          'number' => 1,
          'section_up' => {},
          'toplevel_prev' => {},
          'toplevel_up' => {}
        },
        {
          'cmdname' => 'chapter',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'chap'
              }
            }
          },
          'level' => 1,
          'number' => 2,
          'section_childs' => [
            {
              'cmdname' => 'section',
              'extra' => {},
              'level' => 2,
              'number' => '2.1',
              'section_up' => {}
            },
            {
              'cmdname' => 'section',
              'extra' => {},
              'level' => 2,
              'number' => '2.2',
              'section_prev' => {},
              'section_up' => {}
            },
            {
              'cmdname' => 'section',
              'extra' => {},
              'level' => 2,
              'number' => '2.3',
              'section_prev' => {},
              'section_up' => {}
            },
            {
              'cmdname' => 'section',
              'extra' => {},
              'level' => 2,
              'number' => '2.4',
              'section_prev' => {},
              'section_up' => {}
            },
            {
              'cmdname' => 'section',
              'extra' => {},
              'level' => 2,
              'number' => '2.5',
              'section_prev' => {},
              'section_up' => {}
            },
            {
              'cmdname' => 'section',
              'extra' => {},
              'level' => 2,
              'number' => '2.6',
              'section_prev' => {},
              'section_up' => {}
            },
            {
              'cmdname' => 'section',
              'extra' => {},
              'level' => 2,
              'number' => '2.7',
              'section_prev' => {},
              'section_up' => {}
            }
          ],
          'section_prev' => {},
          'section_up' => {},
          'toplevel_prev' => {},
          'toplevel_up' => {}
        }
      ],
      'section_up' => {}
    }
  ]
};
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[0]{'toplevel_prev'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[0]{'toplevel_up'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[0]{'section_up'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[1]{'section_prev'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[0];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[1]{'section_up'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[2]{'section_prev'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[1];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[2]{'section_up'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[3]{'section_prev'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[2];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[3]{'section_up'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[4]{'section_prev'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[3];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[4]{'section_up'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[5]{'section_prev'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[4];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[5]{'section_up'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[6]{'section_prev'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[5];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[6]{'section_up'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_prev'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'section_up'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'toplevel_prev'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_childs'}[1]{'toplevel_up'} = $result_sectioning{'ref_in_sectioning'}{'section_childs'}[0];
$result_sectioning{'ref_in_sectioning'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'ref_in_sectioning'};

$result_nodes{'ref_in_sectioning'} = {
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
      'normalized' => 'node'
    },
    'node_next' => {
      'cmdname' => 'node',
      'extra' => {
        'associated_section' => {
          'cmdname' => 'chapter',
          'extra' => {},
          'level' => 1,
          'number' => 2
        },
        'normalized' => 'chap'
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
      ],
      'top_node_up' => {}
    },
    'type' => 'top_node_up'
  }
};
$result_nodes{'ref_in_sectioning'}{'menu_child'}{'node_next'}{'node_prev'} = $result_nodes{'ref_in_sectioning'}{'menu_child'};
$result_nodes{'ref_in_sectioning'}{'menu_child'}{'node_next'}{'node_up'} = $result_nodes{'ref_in_sectioning'};
$result_nodes{'ref_in_sectioning'}{'menu_child'}{'node_prev'} = $result_nodes{'ref_in_sectioning'};
$result_nodes{'ref_in_sectioning'}{'menu_child'}{'node_up'} = $result_nodes{'ref_in_sectioning'};
$result_nodes{'ref_in_sectioning'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'ref_in_sectioning'}{'menus'}[0];
$result_nodes{'ref_in_sectioning'}{'node_next'} = $result_nodes{'ref_in_sectioning'}{'menu_child'};
$result_nodes{'ref_in_sectioning'}{'node_up'}{'extra'}{'top_node_up'} = $result_nodes{'ref_in_sectioning'};

$result_menus{'ref_in_sectioning'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'node'
    },
    'menu_next' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'chap'
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
$result_menus{'ref_in_sectioning'}{'menu_child'}{'menu_next'}{'menu_prev'} = $result_menus{'ref_in_sectioning'}{'menu_child'};
$result_menus{'ref_in_sectioning'}{'menu_child'}{'menu_next'}{'menu_up'} = $result_menus{'ref_in_sectioning'};
$result_menus{'ref_in_sectioning'}{'menu_child'}{'menu_up'} = $result_menus{'ref_in_sectioning'};

$result_errors{'ref_in_sectioning'} = [];



$result_converted{'plaintext'}->{'ref_in_sectioning'} = 'for example *note node:: (*note node::) (*note (file)Top::)
1 *Note title: (file name)node.
2 *note node::
  2.1 *note cross ref name: node.
  2.2 *note \'title\': node.
  2.3 *note (file name)\'node\'::
  2.4 *note ()node::
  2.5 *note ():: no node but manual
  2.6 (*note (file name)::) no node but file name
  2.7 *note b: (c)a.
for example *note node:: (*note node::) (*note (file)Top::)
***********************************************************

* Menu:

* node::
* chap::

1 *Note title: (file name)node.
*******************************

2 *note node::
**************

2.1 *note cross ref name: node.
===============================

2.2 *note \'title\': node.
========================

2.3 *note (file name)\'node\'::
=============================

2.4 *note ()node::
==================

2.5 *note ():: no node but manual
=================================

2.6 (*note (file name)::) no node but file name
===============================================

2.7 *note b: (c)a.
==================

*note cross ref name in heading: node.
======================================

*note (file name)\'node\'::
-------------------------

';


$result_converted{'html_text'}->{'ref_in_sectioning'} = '<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">

<ul class="no-bullet">
  <li><a name="toc-node_002e" href="#node">1 See <a href="file name.html#node">title</a> in <cite>manual</cite>.</a></li>
  <li><a name="toc-node-1" href="#chap">2 <a href="#node">node</a></a>
  <ul class="no-bullet">
    <li><a name="toc-node-2" href="#node-2">2.1 <a href="#node">cross ref name</a></a></li>
    <li><a name="toc-node-3" href="#node-3">2.2 <a href="#node">&lsquo;<samp>title</samp>&rsquo;</a></a></li>
    <li><a name="toc-node-4" href="#node-4">2.3 <a href="file name.html#node">(file name)<code>node</code></a></a></li>
    <li><a name="toc-node-5" href="#node-5">2.4 &lsquo;node&rsquo; in <cite>manual</cite></a></li>
    <li><a name="toc-manual-no-node-but-manual" href="#manual-no-node-but-manual">2.5 <cite>manual</cite> no node but manual</a></li>
    <li><a name="toc-_0028file-name_0029-no-node-but-file-name" href="#g_t_0028file-name_0029-no-node-but-file-name">2.6 (see <a href="file name.html#Top">(file name)</a>) no node but file name</a></li>
    <li><a name="toc-a" href="#a">2.7 See <a href="c.html#a">(c)b</a></a></li>
  </ul></li>
</ul>
</div>


<a name="Top"></a>
<div class="header">
<p>
 &nbsp; </p>
</div>
<a name="for-example-node-_0028node_0029-_0028Top_0029"></a>
<h1 class="top">for example <a href="#node">node</a> (see <a href="#node">node</a>) (see <cite><a href="file.html#Top">manual</a></cite>)</h1>

<table class="menu" border="0" cellspacing="0">
<tr><td align="left" valign="top">&bull; <a href="#node" accesskey="1">node</a>:</td><td>&nbsp;&nbsp;</td><td align="left" valign="top">
</td></tr>
<tr><td align="left" valign="top">&bull; <a href="#chap" accesskey="2">chap</a>:</td><td>&nbsp;&nbsp;</td><td align="left" valign="top">
</td></tr>
</table>

<hr>
<a name="node"></a>
<div class="header">
<p>
 &nbsp; </p>
</div>
<a name="node_002e"></a>
<h2 class="chapter">1 See <a href="file name.html#node">title</a> in <cite>manual</cite>.</h2>

<hr>
<a name="chap"></a>
<div class="header">
<p>
 &nbsp; </p>
</div>
<a name="node-1"></a>
<h2 class="chapter">2 <a href="#node">node</a></h2>

<a name="node-2"></a>
<h3 class="section">2.1 <a href="#node">cross ref name</a></h3>

<a name="node-3"></a>
<h3 class="section">2.2 <a href="#node">&lsquo;<samp>title</samp>&rsquo;</a></h3>

<a name="node-4"></a>
<h3 class="section">2.3 <a href="file name.html#node">(file name)<code>node</code></a></h3>

<a name="node-5"></a>
<h3 class="section">2.4 &lsquo;node&rsquo; in <cite>manual</cite></h3>

<a name="manual-no-node-but-manual"></a>
<h3 class="section">2.5 <cite>manual</cite> no node but manual</h3>

<a name="g_t_0028file-name_0029-no-node-but-file-name"></a>
<h3 class="section">2.6 (see <a href="file name.html#Top">(file name)</a>) no node but file name</h3>

<a name="a"></a>
<h3 class="section">2.7 See <a href="c.html#a">(c)b</a></h3>

<a name="node-6"></a>
<h3 class="heading"><a href="#node">cross ref name in heading</a></h3>

<a name="node-7"></a>
<h4 class="subheading"><a href="file name.html#node">(file name)<code>node</code></a></h4>
<hr>
';


$result_converted{'xml'}->{'ref_in_sectioning'} = '<contents></contents>

<node name="Top"><nodename>Top</nodename><nodenext automatic="on">node</nodenext><nodeup automatic="on">(dir)</nodeup></node>
<top><sectiontitle>for example <ref><xrefnodename>node</xrefnodename></ref> (<pxref><xrefnodename>node</xrefnodename></pxref>) (<pxref><xrefnodename>Top</xrefnodename><xrefinfofile>file</xrefinfofile><xrefprintedname>manual</xrefprintedname></pxref>)</sectiontitle>

<menu>
<menuentry><menunode>node</menunode><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menunode>chap</menunode><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node name="node"><nodename>node</nodename><nodenext automatic="on">chap</nodenext><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter><sectiontitle><xref><xrefnodename>node</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile><xrefprintedname>manual</xrefprintedname></xref>.</sectiontitle>

</chapter>
<node name="chap"><nodename>chap</nodename><nodeprev automatic="on">node</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter><sectiontitle><ref><xrefnodename>node</xrefnodename></ref></sectiontitle>

<section><sectiontitle><ref><xrefnodename>node</xrefnodename><xrefinfoname>cross ref name</xrefinfoname></ref></sectiontitle>

</section>
<section><sectiontitle><ref><xrefnodename><code>node</code></xrefnodename><xrefprinteddesc><samp>title</samp></xrefprinteddesc></ref></sectiontitle>

</section>
<section><sectiontitle><ref><xrefnodename><code>node</code></xrefnodename><xrefinfofile>file name</xrefinfofile></ref></sectiontitle>

</section>
<section><sectiontitle><ref><xrefnodename>node</xrefnodename><xrefprintedname>manual</xrefprintedname></ref></sectiontitle>

</section>
<section><sectiontitle><ref><xrefprintedname>manual</xrefprintedname></ref> no node but manual</sectiontitle>

</section>
<section><sectiontitle>(<pxref><xrefinfofile>file name</xrefinfofile></pxref>) no node but file name</sectiontitle>

</section>
<section><sectiontitle><inforef><inforefnodename>a</inforefnodename><inforefrefname>b</inforefrefname><inforefinfoname>c</inforefinfoname></inforef></sectiontitle>

<heading><ref><xrefnodename>node</xrefnodename><xrefinfoname>cross ref name in heading</xrefinfoname></ref></heading>

<subheading><ref><xrefnodename><code>node</code></xrefnodename><xrefinfofile>file name</xrefinfofile></ref></subheading>
</section>
</chapter>
';


$result_converted{'docbook'}->{'ref_in_sectioning'} = '
<chapter label="" id="Top">
<title>for example <link linkend="node">node</link> (see <link linkend="node">node</link>) (see <citetitle>manual</citetitle>)</title>


</chapter>
<chapter label="1" id="node">
<title>See section &#8220;title&#8221; in <citetitle>manual</citetitle>.</title>

</chapter>
<chapter label="2" id="chap">
<title><link linkend="node">node</link></title>

<sect1 label="2.1">
<title><link linkend="node">cross ref name</link></title>

</sect1>
<sect1 label="2.2">
<title><link linkend="node">&#8216;<literal>title</literal>&#8217;</link></title>

</sect1>
<sect1 label="2.3">
<title></title>

</sect1>
<sect1 label="2.4">
<title>section &#8220;node&#8221; in <citetitle>manual</citetitle></title>

</sect1>
<sect1 label="2.5">
<title><citetitle>manual</citetitle> no node but manual</title>

</sect1>
<sect1 label="2.6">
<title>() no node but file name</title>

</sect1>
<sect1 label="2.7">
<title>See Info file <filename>c</filename>, node &#8216;<literal>a</literal>&#8217;</title>

<bridgehead renderas="sect1"><link linkend="node">cross ref name in heading</link></bridgehead>

<bridgehead renderas="sect2"></bridgehead>
</sect1>
</chapter>
';

1;
