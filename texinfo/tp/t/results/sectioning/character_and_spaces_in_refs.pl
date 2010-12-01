use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'character_and_spaces_in_refs'} = {
  'contents' => [
    {
      'contents' => [],
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'Test refs'
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
                      'text' => 'other nodes'
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
                  'normalized' => 'other-nodes'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
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
                  'text' => 'Testing distant nodes'
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
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 8,
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
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'a  node'
                    },
                    {
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'spaces_at_end'
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
                  [
                    {}
                  ]
                ]
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ':'
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
                  [
                    {}
                  ]
                ]
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'top'
                    },
                    {
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'spaces_at_end'
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
                  [
                    {}
                  ]
                ]
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '(texinfo)Cross References'
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
                ]
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
'
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
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => '../manual/doc.texi'
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
                ]
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '!_"#$%&\'()*+-.'
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
                ]
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '/;<=>?[\\]^_`|~'
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
                ]
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
'
            },
            {
              'args' => [
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
                ]
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => '  ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'local   node'
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
                ]
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'other nodes'
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
              'text' => '!_"#$%&\'()*+-.'
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
      'contents' => [],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'other-nodes'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => '_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e'
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
        'normalized' => 'other-nodes'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 20,
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
              'text' => 'Chapter with nodes'
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
                      'text' => '!_"#$%&\'()*+-.'
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
                  'normalized' => '_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 24,
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
                      'text' => '/;<=>?[\\]^_`|~'
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
                  'normalized' => '_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e'
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
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'local node'
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
                  'normalized' => 'local-node'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 26,
                'macro' => ''
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
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 21,
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => '!_"#$%&\'()*+-.'
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
              'text' => '/;<=>?[\\]^_`|~'
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
              'text' => 'other nodes'
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
              'text' => 'other nodes'
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
            'normalized' => '_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => '_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'other-nodes'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'other-nodes'
          }
        ],
        'normalized' => '_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 29,
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
              'text' => '/;<=>?[\\]^_`|~'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'local   node'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '!_"#$%&\'()*+-.'
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
              'text' => 'other nodes'
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
            'normalized' => '_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'local-node'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => '_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'other-nodes'
          }
        ],
        'normalized' => '_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 31,
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
              'text' => 'local   node'
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
              'parent' => {},
              'text' => '/;<=>?[\\]^_`|~'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'other nodes'
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
            'normalized' => 'local-node'
          },
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => '_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'other-nodes'
          }
        ],
        'normalized' => 'local-node'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 33,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'cmdname' => 'bye',
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'character_and_spaces_in_refs'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[1]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[1]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[1]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'character_and_spaces_in_refs'}{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'};
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[4];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'args'}[3]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2]{'args'}[3]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4]{'args'}[3]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[4]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[5]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[6]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[6]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[6]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[7]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8]{'args'}[0]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8]{'args'}[3]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[8]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[9]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[10]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[10];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[10]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[10]{'args'}[0]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[10]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[11]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[12]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[12];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[12]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[12]{'args'}[0]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[12]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[13]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[14]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[14]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[14];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[14]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[14]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[14]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[15]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[16]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[16]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[16]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[16];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[16]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[16]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[16]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'contents'}[17]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[6]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'contents'}[7]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'};
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'extra'}{'node_content'};
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[1]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[2]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'args'}[3]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'};
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[4]{'parent'} = $result_trees{'character_and_spaces_in_refs'};
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'extra'}{'node_content'};
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[1]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[2]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'args'}[3]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[5]{'parent'} = $result_trees{'character_and_spaces_in_refs'};
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'extra'}{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'extra'}{'node_content'};
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[1]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[2]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'args'}[3]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[6]{'parent'} = $result_trees{'character_and_spaces_in_refs'};
$result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[7];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[7];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[2];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[2]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[7];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[3];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[3]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[7];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[7];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'extra'}{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'extra'}{'node_content'};
$result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[2]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'args'}[3]{'contents'}[0];
$result_trees{'character_and_spaces_in_refs'}{'contents'}[7]{'parent'} = $result_trees{'character_and_spaces_in_refs'};
$result_trees{'character_and_spaces_in_refs'}{'contents'}[8]{'parent'} = $result_trees{'character_and_spaces_in_refs'};

$result_texis{'character_and_spaces_in_refs'} = '@node Top
@top Test refs

@menu
* other nodes::
@end menu

@subheading Testing distant nodes

@ref{ a  node ,,, manual}
@ref{:,,,manual}
@ref{ top ,,, manual}
@ref{(texinfo)Cross References}
@ref{node,,, ../manual/doc.texi}
@ref{!_"#$%&\'()*+-.}
@ref{/;<=>?[\\]^_`|~}
@ref{ Top}
@ref{  local   node}

@node other nodes, !_"#$%&\'()*+-., Top, Top
@chapter Chapter with nodes

@menu
* !_"#$%&\'()*+-.::
* /;<=>?[\\]^_`|~::
* local node::
@end menu

@node !_"#$%&\'()*+-., /;<=>?[\\]^_`|~, other nodes, other nodes

@node /;<=>?[\\]^_`|~,local   node,!_"#$%&\'()*+-., other nodes

@node  local   node,,/;<=>?[\\]^_`|~,other nodes

@bye
';


$result_texts{'character_and_spaces_in_refs'} = 'Test refs
*********

* other nodes::

Testing distant nodes
---------------------











Chapter with nodes
******************

* !_"#$%&\'()*+-.::
* /;<=>?[\\]^_`|~::
* local node::




';

$result_sectioning{'character_and_spaces_in_refs'} = {
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
                'normalized' => 'other-nodes'
              }
            }
          },
          'level' => 1,
          'number' => 1,
          'section_up' => {}
        }
      ],
      'section_up' => {}
    }
  ]
};
$result_sectioning{'character_and_spaces_in_refs'}{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'character_and_spaces_in_refs'}{'section_childs'}[0];
$result_sectioning{'character_and_spaces_in_refs'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'character_and_spaces_in_refs'};

$result_nodes{'character_and_spaces_in_refs'} = {
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
      'normalized' => 'other-nodes'
    },
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => '_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e'
      },
      'node_next' => {
        'cmdname' => 'node',
        'extra' => {
          'normalized' => '_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e'
        },
        'node_next' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'local-node'
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
        'cmdname' => 'menu'
      }
    ],
    'node_next' => {},
    'node_prev' => {},
    'node_up' => {}
  },
  'menus' => [
    {
      'cmdname' => 'menu'
    }
  ],
  'node_next' => {},
  'node_up' => {
    'extra' => {},
    'manual_content' => [
      {
        'text' => 'dir'
      }
    ]
  }
};
$result_nodes{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'}{'node_next'}{'node_next'}{'node_prev'} = $result_nodes{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'}{'node_next'};
$result_nodes{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'}{'node_next'}{'node_next'}{'node_up'} = $result_nodes{'character_and_spaces_in_refs'}{'menu_child'};
$result_nodes{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'}{'node_next'}{'node_prev'} = $result_nodes{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'};
$result_nodes{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'}{'node_next'}{'node_up'} = $result_nodes{'character_and_spaces_in_refs'}{'menu_child'};
$result_nodes{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'}{'node_prev'} = $result_nodes{'character_and_spaces_in_refs'}{'menu_child'};
$result_nodes{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'}{'node_up'} = $result_nodes{'character_and_spaces_in_refs'}{'menu_child'};
$result_nodes{'character_and_spaces_in_refs'}{'menu_child'}{'node_next'} = $result_nodes{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'};
$result_nodes{'character_and_spaces_in_refs'}{'menu_child'}{'node_prev'} = $result_nodes{'character_and_spaces_in_refs'};
$result_nodes{'character_and_spaces_in_refs'}{'menu_child'}{'node_up'} = $result_nodes{'character_and_spaces_in_refs'};
$result_nodes{'character_and_spaces_in_refs'}{'node_next'} = $result_nodes{'character_and_spaces_in_refs'}{'menu_child'};

$result_menus{'character_and_spaces_in_refs'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'other-nodes'
    },
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => '_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e'
      },
      'menu_next' => {
        'cmdname' => 'node',
        'extra' => {
          'normalized' => '_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e'
        },
        'menu_next' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'local-node'
          },
          'menu_prev' => {},
          'menu_up' => {},
          'menu_up_hash' => {
            'other-nodes' => 1
          }
        },
        'menu_prev' => {},
        'menu_up' => {},
        'menu_up_hash' => {
          'other-nodes' => 1
        }
      },
      'menu_up' => {},
      'menu_up_hash' => {
        'other-nodes' => 1
      }
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_prev'} = $result_menus{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'}{'menu_next'};
$result_menus{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_up'} = $result_menus{'character_and_spaces_in_refs'}{'menu_child'};
$result_menus{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_prev'} = $result_menus{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'};
$result_menus{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_up'} = $result_menus{'character_and_spaces_in_refs'}{'menu_child'};
$result_menus{'character_and_spaces_in_refs'}{'menu_child'}{'menu_child'}{'menu_up'} = $result_menus{'character_and_spaces_in_refs'}{'menu_child'};
$result_menus{'character_and_spaces_in_refs'}{'menu_child'}{'menu_up'} = $result_menus{'character_and_spaces_in_refs'};

$result_errors{'character_and_spaces_in_refs'} = [];


1;
