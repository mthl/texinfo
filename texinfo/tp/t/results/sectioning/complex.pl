use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'complex'} = {
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
              'parent' => {},
              'text' => 'First node'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
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
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'Top'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'First-node'
          },
          {
            'manual_content' => [
              {
                'parent' => {},
                'text' => 'dir'
              }
            ]
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
              'text' => '
',
              'type' => 'empty_line_after_command'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'top',
      'contents' => [
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
                      'text' => 'First node'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => ':: ',
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
                  'normalized' => 'First-node'
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
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'between node'
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
                  'normalized' => 'between-node'
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
                      'text' => 'Second node'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::   ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'node 2
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
                  'normalized' => 'Second-node'
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
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Third node unnumbered'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'unnumbered in Top menu
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
                  'normalized' => 'Third-node-unnumbered'
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
                      'text' => 'Last node no description'
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
                  'normalized' => 'Last-node-no-description'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 8,
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
      'extra' => {},
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
              'text' => 'First node'
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
              'text' => 'Top'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
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
            'normalized' => 'First-node'
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
        ],
        'normalized' => 'First-node'
      },
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
              'text' => 'first node chapter'
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'first node chapter text
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
                      'text' => 'unnumbered'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'un
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
                  'normalized' => 'unnumbered'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 16,
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
                      'text' => 'unnumbered2'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'un2
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
                  'normalized' => 'unnumbered2'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 17,
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
                      'text' => 'numbered'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'nu
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
                  'normalized' => 'numbered'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 18,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'menu_entry'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'after_description_line'
            },
            {
              'contents' => [],
              'parent' => {},
              'type' => 'menu_comment'
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
        'line_nr' => 12,
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
              'text' => 'unnumbered'
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
            'normalized' => 'unnumbered'
          }
        ],
        'normalized' => 'unnumbered'
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'unnumbered section'
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
      'cmdname' => 'unnumberedsec',
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
                      'text' => 'unnumbered sub'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'un
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
                  'normalized' => 'unnumbered-sub'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 26,
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
                      'text' => 'numbered sub'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'nu
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
                  'normalized' => 'numbered-sub'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 27,
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
                      'text' => 'unnumbered sub2'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'un2
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
                  'normalized' => 'unnumbered-sub2'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 28,
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
                      'text' => 'numbered sub2'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'nu2
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
                  'normalized' => 'numbered-sub2'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 29,
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
      'level' => 2,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 23,
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
              'text' => 'unnumbered sub'
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
            'normalized' => 'unnumbered-sub'
          }
        ],
        'normalized' => 'unnumbered-sub'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 32,
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
              'text' => 'unnumbered subsection'
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
      'cmdname' => 'unnumberedsubsec',
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
      'level' => 3,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 33,
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
              'text' => 'numbered sub'
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
            'normalized' => 'numbered-sub'
          }
        ],
        'normalized' => 'numbered-sub'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 35,
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
              'text' => 'numbered subsection'
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
      'level' => 3,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 36,
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
              'text' => 'unnumbered sub2'
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
            'normalized' => 'unnumbered-sub2'
          }
        ],
        'normalized' => 'unnumbered-sub2'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 38,
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
              'text' => 'unnumbered subsection2'
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
      'cmdname' => 'unnumberedsubsec',
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
      'level' => 3,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 39,
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
              'text' => 'numbered sub2'
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
            'normalized' => 'numbered-sub2'
          }
        ],
        'normalized' => 'numbered-sub2'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 41,
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
              'text' => 'numbered subsection2'
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
      'level' => 3,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 42,
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
              'text' => 'unnumbered2'
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
            'normalized' => 'unnumbered2'
          }
        ],
        'normalized' => 'unnumbered2'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 44,
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
              'text' => 'unnumbered section2'
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
      'cmdname' => 'unnumberedsec',
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
                  'text' => '*  ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'numbered sub3'
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
                  'normalized' => 'numbered-sub3'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 48,
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
      'level' => 2,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 45,
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
              'text' => 'numbered sub3'
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
            'normalized' => 'numbered-sub3'
          }
        ],
        'normalized' => 'numbered-sub3'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 51,
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
              'text' => 'numbered subsection3'
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
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
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
      'level' => 3,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 52,
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
              'text' => 'numbered'
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
            'normalized' => 'numbered'
          }
        ],
        'normalized' => 'numbered'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 55,
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
              'text' => 'numbered section'
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
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 56,
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'between node'
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
          'contents' => [],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'between node, node without sectioning node
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
            'normalized' => 'between-node'
          },
          undef,
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'between-node'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 58,
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
              'text' => 'Second node'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Third node unnumbered'
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'Second node text
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
            'normalized' => 'Second-node'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Third-node-unnumbered'
          },
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Second-node'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 62,
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
              'text' => 'second node chapter'
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'second node chapter text.
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
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 66,
        'macro' => ''
      },
      'number' => 2,
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
              'text' => 'Third node unnumbered'
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
            'normalized' => 'Third-node-unnumbered'
          }
        ],
        'normalized' => 'Third-node-unnumbered'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 70,
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
              'text' => 'unnumbered chapter'
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
      'cmdname' => 'unnumbered',
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
              'text' => 'unnumbered chapter text.
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
        'line_nr' => 71,
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
              'text' => 'Last node no description'
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
              'text' => 'Third node unnumbered'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
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
          'cmdname' => 'contents',
          'parent' => {}
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'Last-node-no-description'
          },
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Third-node-unnumbered'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Last-node-no-description'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 76,
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
$result_trees{'complex'}{'contents'}[0]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[1]{'args'}[0];
$result_trees{'complex'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[1]{'args'}[0];
$result_trees{'complex'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[1];
$result_trees{'complex'}{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[1]{'args'}[1];
$result_trees{'complex'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[1];
$result_trees{'complex'}{'contents'}[1]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[1]{'args'}[2];
$result_trees{'complex'}{'contents'}[1]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[1]{'args'}[2];
$result_trees{'complex'}{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[1];
$result_trees{'complex'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'complex'}{'contents'}[1]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'complex'}{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'complex'}{'contents'}[1]{'extra'}{'nodes_manuals'}[2]{'manual_content'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[1]{'args'}[2];
$result_trees{'complex'}{'contents'}[1]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'args'}[0];
$result_trees{'complex'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[2];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[2];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[2];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[2];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[3];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[3];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[3];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[3];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[3]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[3]{'args'}[1]{'contents'}[0];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[4];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[4];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[4];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[4]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[4]{'args'}[3];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[4];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[4]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[0];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[5];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[5]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[5]{'args'}[1];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[5];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[5];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[5]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[5]{'args'}[3];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[5];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[5]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[5]{'args'}[1]{'contents'}[0];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'complex'}{'contents'}[2]{'contents'}[0];
$result_trees{'complex'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[2];
$result_trees{'complex'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[2];
$result_trees{'complex'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[2];
$result_trees{'complex'}{'contents'}[2]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[3]{'args'}[0];
$result_trees{'complex'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[3]{'args'}[0];
$result_trees{'complex'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[3];
$result_trees{'complex'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[3];
$result_trees{'complex'}{'contents'}[3]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[3]{'args'}[2];
$result_trees{'complex'}{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[3];
$result_trees{'complex'}{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[3]{'args'}[3];
$result_trees{'complex'}{'contents'}[3]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[3]{'args'}[3];
$result_trees{'complex'}{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[3];
$result_trees{'complex'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex'}{'contents'}[3]{'extra'}{'node_content'};
$result_trees{'complex'}{'contents'}[3]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'complex'}{'contents'}[3]{'args'}[2]{'contents'}[0];
$result_trees{'complex'}{'contents'}[3]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'complex'}{'contents'}[3]{'args'}[3]{'contents'}[0];
$result_trees{'complex'}{'contents'}[3]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'args'}[0];
$result_trees{'complex'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'args'}[0];
$result_trees{'complex'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'args'}[0];
$result_trees{'complex'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[4];
$result_trees{'complex'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[4];
$result_trees{'complex'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[1];
$result_trees{'complex'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[4];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[1];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[1]{'args'}[1];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[1];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[1];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[1]{'args'}[3];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[1];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[2];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[2]{'args'}[1];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[2];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[2];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[2]{'args'}[3];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[2];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[3];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[3]{'args'}[1];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[3];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[3];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[3]{'args'}[3];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[3];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[3]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[3]{'args'}[1]{'contents'}[0];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'complex'}{'contents'}[4]{'contents'}[2];
$result_trees{'complex'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[4];
$result_trees{'complex'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[4];
$result_trees{'complex'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'complex'}{'contents'}[4];
$result_trees{'complex'}{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'complex'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[4]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[5]{'args'}[0];
$result_trees{'complex'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[5]{'args'}[0];
$result_trees{'complex'}{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[5]{'args'}[0];
$result_trees{'complex'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[5];
$result_trees{'complex'}{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex'}{'contents'}[5]{'extra'}{'node_content'};
$result_trees{'complex'}{'contents'}[5]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'args'}[0];
$result_trees{'complex'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'args'}[0];
$result_trees{'complex'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'args'}[0];
$result_trees{'complex'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6];
$result_trees{'complex'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[2];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[1];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[2];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[2];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[2];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[3];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[3]{'args'}[1];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[3];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[3];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[3]{'args'}[3];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[3];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[3]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[0];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[4];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[4]{'args'}[1];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[4];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[4];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[4]{'args'}[3];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[4];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[4]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[4]{'args'}[1]{'contents'}[0];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'complex'}{'contents'}[6]{'contents'}[1];
$result_trees{'complex'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[6];
$result_trees{'complex'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[6];
$result_trees{'complex'}{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[6];
$result_trees{'complex'}{'contents'}[6]{'extra'}{'misc_content'}[0] = $result_trees{'complex'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[6]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[7]{'args'}[0];
$result_trees{'complex'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[7]{'args'}[0];
$result_trees{'complex'}{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[7]{'args'}[0];
$result_trees{'complex'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[7];
$result_trees{'complex'}{'contents'}[7]{'extra'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[7]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex'}{'contents'}[7]{'extra'}{'node_content'};
$result_trees{'complex'}{'contents'}[7]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[8]{'args'}[0];
$result_trees{'complex'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[8]{'args'}[0];
$result_trees{'complex'}{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[8]{'args'}[0];
$result_trees{'complex'}{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[8];
$result_trees{'complex'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[8];
$result_trees{'complex'}{'contents'}[8]{'extra'}{'misc_content'}[0] = $result_trees{'complex'}{'contents'}[8]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[8]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[9]{'args'}[0];
$result_trees{'complex'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[9]{'args'}[0];
$result_trees{'complex'}{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[9]{'args'}[0];
$result_trees{'complex'}{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[9];
$result_trees{'complex'}{'contents'}[9]{'extra'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[9]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex'}{'contents'}[9]{'extra'}{'node_content'};
$result_trees{'complex'}{'contents'}[9]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[10]{'args'}[0];
$result_trees{'complex'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[10]{'args'}[0];
$result_trees{'complex'}{'contents'}[10]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[10]{'args'}[0];
$result_trees{'complex'}{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[10];
$result_trees{'complex'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[10];
$result_trees{'complex'}{'contents'}[10]{'extra'}{'misc_content'}[0] = $result_trees{'complex'}{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[10]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[11]{'args'}[0];
$result_trees{'complex'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[11]{'args'}[0];
$result_trees{'complex'}{'contents'}[11]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[11]{'args'}[0];
$result_trees{'complex'}{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[11];
$result_trees{'complex'}{'contents'}[11]{'extra'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[11]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[11]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex'}{'contents'}[11]{'extra'}{'node_content'};
$result_trees{'complex'}{'contents'}[11]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[12]{'args'}[0];
$result_trees{'complex'}{'contents'}[12]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[12]{'args'}[0];
$result_trees{'complex'}{'contents'}[12]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[12]{'args'}[0];
$result_trees{'complex'}{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[12];
$result_trees{'complex'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[12];
$result_trees{'complex'}{'contents'}[12]{'extra'}{'misc_content'}[0] = $result_trees{'complex'}{'contents'}[12]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[12]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[13]{'args'}[0];
$result_trees{'complex'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[13]{'args'}[0];
$result_trees{'complex'}{'contents'}[13]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[13]{'args'}[0];
$result_trees{'complex'}{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[13];
$result_trees{'complex'}{'contents'}[13]{'extra'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[13]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[13]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex'}{'contents'}[13]{'extra'}{'node_content'};
$result_trees{'complex'}{'contents'}[13]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[14]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[14]{'args'}[0];
$result_trees{'complex'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[14]{'args'}[0];
$result_trees{'complex'}{'contents'}[14]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[14]{'args'}[0];
$result_trees{'complex'}{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[14];
$result_trees{'complex'}{'contents'}[14]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[14];
$result_trees{'complex'}{'contents'}[14]{'extra'}{'misc_content'}[0] = $result_trees{'complex'}{'contents'}[14]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[14]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[15]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[15]{'args'}[0];
$result_trees{'complex'}{'contents'}[15]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[15]{'args'}[0];
$result_trees{'complex'}{'contents'}[15]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[15]{'args'}[0];
$result_trees{'complex'}{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[15];
$result_trees{'complex'}{'contents'}[15]{'extra'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[15]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[15]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex'}{'contents'}[15]{'extra'}{'node_content'};
$result_trees{'complex'}{'contents'}[15]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[16]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[16]{'args'}[0];
$result_trees{'complex'}{'contents'}[16]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[16]{'args'}[0];
$result_trees{'complex'}{'contents'}[16]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[16]{'args'}[0];
$result_trees{'complex'}{'contents'}[16]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[16];
$result_trees{'complex'}{'contents'}[16]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[16];
$result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[16]{'contents'}[1];
$result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[1];
$result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[1];
$result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[1];
$result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[1];
$result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[16]{'contents'}[1];
$result_trees{'complex'}{'contents'}[16]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[16];
$result_trees{'complex'}{'contents'}[16]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[16];
$result_trees{'complex'}{'contents'}[16]{'contents'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[16];
$result_trees{'complex'}{'contents'}[16]{'extra'}{'misc_content'}[0] = $result_trees{'complex'}{'contents'}[16]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[16]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[17]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[17]{'args'}[0];
$result_trees{'complex'}{'contents'}[17]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[17]{'args'}[0];
$result_trees{'complex'}{'contents'}[17]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[17]{'args'}[0];
$result_trees{'complex'}{'contents'}[17]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[17];
$result_trees{'complex'}{'contents'}[17]{'extra'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[17]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[17]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex'}{'contents'}[17]{'extra'}{'node_content'};
$result_trees{'complex'}{'contents'}[17]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[18]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[18]{'args'}[0];
$result_trees{'complex'}{'contents'}[18]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[18]{'args'}[0];
$result_trees{'complex'}{'contents'}[18]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[18]{'args'}[0];
$result_trees{'complex'}{'contents'}[18]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[18];
$result_trees{'complex'}{'contents'}[18]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[18];
$result_trees{'complex'}{'contents'}[18]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[18];
$result_trees{'complex'}{'contents'}[18]{'extra'}{'misc_content'}[0] = $result_trees{'complex'}{'contents'}[18]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[18]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[19]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[19]{'args'}[0];
$result_trees{'complex'}{'contents'}[19]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[19]{'args'}[0];
$result_trees{'complex'}{'contents'}[19]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[19]{'args'}[0];
$result_trees{'complex'}{'contents'}[19]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[19];
$result_trees{'complex'}{'contents'}[19]{'extra'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[19]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[19]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex'}{'contents'}[19]{'extra'}{'node_content'};
$result_trees{'complex'}{'contents'}[19]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[20]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[20]{'args'}[0];
$result_trees{'complex'}{'contents'}[20]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[20]{'args'}[0];
$result_trees{'complex'}{'contents'}[20]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[20]{'args'}[0];
$result_trees{'complex'}{'contents'}[20]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[20];
$result_trees{'complex'}{'contents'}[20]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[20];
$result_trees{'complex'}{'contents'}[20]{'extra'}{'misc_content'}[0] = $result_trees{'complex'}{'contents'}[20]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[20]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[21]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[21]{'args'}[0];
$result_trees{'complex'}{'contents'}[21]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[21]{'args'}[0];
$result_trees{'complex'}{'contents'}[21]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[21];
$result_trees{'complex'}{'contents'}[21]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[21];
$result_trees{'complex'}{'contents'}[21]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[21];
$result_trees{'complex'}{'contents'}[21]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[21]{'args'}[3];
$result_trees{'complex'}{'contents'}[21]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[21]{'args'}[3];
$result_trees{'complex'}{'contents'}[21]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[21];
$result_trees{'complex'}{'contents'}[21]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[21];
$result_trees{'complex'}{'contents'}[21]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[21]{'contents'}[1];
$result_trees{'complex'}{'contents'}[21]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[21];
$result_trees{'complex'}{'contents'}[21]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[21];
$result_trees{'complex'}{'contents'}[21]{'extra'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[21]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[21]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex'}{'contents'}[21]{'extra'}{'node_content'};
$result_trees{'complex'}{'contents'}[21]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'complex'}{'contents'}[21]{'args'}[3]{'contents'}[0];
$result_trees{'complex'}{'contents'}[21]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[22]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[22]{'args'}[0];
$result_trees{'complex'}{'contents'}[22]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[22]{'args'}[0];
$result_trees{'complex'}{'contents'}[22]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[22];
$result_trees{'complex'}{'contents'}[22]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[22]{'args'}[1];
$result_trees{'complex'}{'contents'}[22]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[22];
$result_trees{'complex'}{'contents'}[22]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[22];
$result_trees{'complex'}{'contents'}[22]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[22]{'args'}[3];
$result_trees{'complex'}{'contents'}[22]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[22]{'args'}[3];
$result_trees{'complex'}{'contents'}[22]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[22];
$result_trees{'complex'}{'contents'}[22]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[22];
$result_trees{'complex'}{'contents'}[22]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[22]{'contents'}[1];
$result_trees{'complex'}{'contents'}[22]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[22];
$result_trees{'complex'}{'contents'}[22]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[22];
$result_trees{'complex'}{'contents'}[22]{'extra'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[22]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[22]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex'}{'contents'}[22]{'extra'}{'node_content'};
$result_trees{'complex'}{'contents'}[22]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'complex'}{'contents'}[22]{'args'}[1]{'contents'}[0];
$result_trees{'complex'}{'contents'}[22]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'complex'}{'contents'}[22]{'args'}[3]{'contents'}[0];
$result_trees{'complex'}{'contents'}[22]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[23]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[23]{'args'}[0];
$result_trees{'complex'}{'contents'}[23]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[23]{'args'}[0];
$result_trees{'complex'}{'contents'}[23]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[23]{'args'}[0];
$result_trees{'complex'}{'contents'}[23]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[23];
$result_trees{'complex'}{'contents'}[23]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[23];
$result_trees{'complex'}{'contents'}[23]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[23]{'contents'}[1];
$result_trees{'complex'}{'contents'}[23]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[23];
$result_trees{'complex'}{'contents'}[23]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[23];
$result_trees{'complex'}{'contents'}[23]{'extra'}{'misc_content'}[0] = $result_trees{'complex'}{'contents'}[23]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[23]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[24]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[24]{'args'}[0];
$result_trees{'complex'}{'contents'}[24]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[24]{'args'}[0];
$result_trees{'complex'}{'contents'}[24]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[24]{'args'}[0];
$result_trees{'complex'}{'contents'}[24]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[24];
$result_trees{'complex'}{'contents'}[24]{'extra'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[24]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[24]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex'}{'contents'}[24]{'extra'}{'node_content'};
$result_trees{'complex'}{'contents'}[24]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[25]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[25]{'args'}[0];
$result_trees{'complex'}{'contents'}[25]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[25]{'args'}[0];
$result_trees{'complex'}{'contents'}[25]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[25]{'args'}[0];
$result_trees{'complex'}{'contents'}[25]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[25];
$result_trees{'complex'}{'contents'}[25]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[25];
$result_trees{'complex'}{'contents'}[25]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[25]{'contents'}[1];
$result_trees{'complex'}{'contents'}[25]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[25];
$result_trees{'complex'}{'contents'}[25]{'contents'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[25];
$result_trees{'complex'}{'contents'}[25]{'contents'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[25];
$result_trees{'complex'}{'contents'}[25]{'extra'}{'misc_content'}[0] = $result_trees{'complex'}{'contents'}[25]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[25]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[26]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[26]{'args'}[0];
$result_trees{'complex'}{'contents'}[26]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[26]{'args'}[0];
$result_trees{'complex'}{'contents'}[26]{'args'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[26];
$result_trees{'complex'}{'contents'}[26]{'args'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[26];
$result_trees{'complex'}{'contents'}[26]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[26]{'args'}[2];
$result_trees{'complex'}{'contents'}[26]{'args'}[2]{'parent'} = $result_trees{'complex'}{'contents'}[26];
$result_trees{'complex'}{'contents'}[26]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[26]{'args'}[3];
$result_trees{'complex'}{'contents'}[26]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[26]{'args'}[3];
$result_trees{'complex'}{'contents'}[26]{'args'}[3]{'parent'} = $result_trees{'complex'}{'contents'}[26];
$result_trees{'complex'}{'contents'}[26]{'contents'}[0]{'parent'} = $result_trees{'complex'}{'contents'}[26];
$result_trees{'complex'}{'contents'}[26]{'contents'}[1]{'parent'} = $result_trees{'complex'}{'contents'}[26];
$result_trees{'complex'}{'contents'}[26]{'extra'}{'node_content'}[0] = $result_trees{'complex'}{'contents'}[26]{'args'}[0]{'contents'}[1];
$result_trees{'complex'}{'contents'}[26]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex'}{'contents'}[26]{'extra'}{'node_content'};
$result_trees{'complex'}{'contents'}[26]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'complex'}{'contents'}[26]{'args'}[2]{'contents'}[0];
$result_trees{'complex'}{'contents'}[26]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'complex'}{'contents'}[26]{'args'}[3]{'contents'}[0];
$result_trees{'complex'}{'contents'}[26]{'parent'} = $result_trees{'complex'};
$result_trees{'complex'}{'contents'}[27]{'parent'} = $result_trees{'complex'};

$result_texis{'complex'} = '@node Top,First node,(dir)
@top
@menu
* First node:: 
* between node::
* Second node::   node 2
* Third node unnumbered:: unnumbered in Top menu
* Last node no description::
@end menu

@node First node,,Top,Top
@chapter first node chapter

first node chapter text
@menu
* unnumbered:: un
* unnumbered2:: un2
* numbered:: nu

@end menu

@node unnumbered
@unnumberedsec unnumbered section

@menu
* unnumbered sub:: un
* numbered sub:: nu
* unnumbered sub2:: un2
* numbered sub2:: nu2
@end menu

@node unnumbered sub
@unnumberedsubsec unnumbered subsection

@node numbered sub
@subsection numbered subsection

@node unnumbered sub2
@unnumberedsubsec unnumbered subsection2

@node numbered sub2
@subsection numbered subsection2

@node unnumbered2
@unnumberedsec unnumbered section2

@menu
*  numbered sub3::
@end menu

@node numbered sub3
@subsection numbered subsection3


@node numbered
@section  numbered section

@node between node,,,Top

between node, node without sectioning node

@node Second node,Third node unnumbered,,Top

Second node text

@chapter second node chapter

second node chapter text.

@node Third node unnumbered
@unnumbered unnumbered chapter

unnumbered chapter text.


@node Last node no description,,Third node unnumbered,Top

@contents
@bye
';


$result_texts{'complex'} = '* First node:: 
* between node::
* Second node::   node 2
* Third node unnumbered:: unnumbered in Top menu
* Last node no description::

1 first node chapter
********************

first node chapter text
* unnumbered:: un
* unnumbered2:: un2
* numbered:: nu


unnumbered section
==================

* unnumbered sub:: un
* numbered sub:: nu
* unnumbered sub2:: un2
* numbered sub2:: nu2

unnumbered subsection
---------------------

numbered subsection
-------------------

unnumbered subsection2
----------------------

numbered subsection2
--------------------

unnumbered section2
===================

*  numbered sub3::

numbered subsection3
--------------------


1.1 numbered section
====================


between node, node without sectioning node


Second node text

2 second node chapter
*********************

second node chapter text.

unnumbered chapter
******************

unnumbered chapter text.



';

$result_sectioning{'complex'} = {
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
                'normalized' => 'First-node'
              }
            }
          },
          'level' => 1,
          'number' => 1,
          'section_childs' => [
            {
              'cmdname' => 'unnumberedsec',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'unnumbered'
                  }
                }
              },
              'level' => 2,
              'section_childs' => [
                {
                  'cmdname' => 'unnumberedsubsec',
                  'extra' => {
                    'associated_node' => {
                      'cmdname' => 'node',
                      'extra' => {
                        'normalized' => 'unnumbered-sub'
                      }
                    }
                  },
                  'level' => 3,
                  'section_up' => {}
                },
                {
                  'cmdname' => 'subsection',
                  'extra' => {
                    'associated_node' => {
                      'cmdname' => 'node',
                      'extra' => {
                        'normalized' => 'numbered-sub'
                      }
                    }
                  },
                  'level' => 3,
                  'section_prev' => {},
                  'section_up' => {}
                },
                {
                  'cmdname' => 'unnumberedsubsec',
                  'extra' => {
                    'associated_node' => {
                      'cmdname' => 'node',
                      'extra' => {
                        'normalized' => 'unnumbered-sub2'
                      }
                    }
                  },
                  'level' => 3,
                  'section_prev' => {},
                  'section_up' => {}
                },
                {
                  'cmdname' => 'subsection',
                  'extra' => {
                    'associated_node' => {
                      'cmdname' => 'node',
                      'extra' => {
                        'normalized' => 'numbered-sub2'
                      }
                    }
                  },
                  'level' => 3,
                  'section_prev' => {},
                  'section_up' => {}
                }
              ],
              'section_up' => {}
            },
            {
              'cmdname' => 'unnumberedsec',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'unnumbered2'
                  }
                }
              },
              'level' => 2,
              'section_childs' => [
                {
                  'cmdname' => 'subsection',
                  'extra' => {
                    'associated_node' => {
                      'cmdname' => 'node',
                      'extra' => {
                        'normalized' => 'numbered-sub3'
                      }
                    }
                  },
                  'level' => 3,
                  'section_up' => {}
                }
              ],
              'section_prev' => {},
              'section_up' => {}
            },
            {
              'cmdname' => 'section',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'numbered'
                  }
                }
              },
              'level' => 2,
              'number' => '1.1',
              'section_prev' => {},
              'section_up' => {}
            }
          ],
          'section_up' => {}
        },
        {
          'cmdname' => 'chapter',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'Second-node'
              }
            }
          },
          'level' => 1,
          'number' => 2,
          'section_prev' => {},
          'section_up' => {}
        },
        {
          'cmdname' => 'unnumbered',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'Third-node-unnumbered'
              }
            }
          },
          'level' => 1,
          'section_prev' => {},
          'section_up' => {}
        }
      ],
      'section_up' => {}
    }
  ]
};
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[1]{'section_prev'} = $result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[1]{'section_up'} = $result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[2]{'section_prev'} = $result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[1];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[2]{'section_up'} = $result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[3]{'section_prev'} = $result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[2];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[3]{'section_up'} = $result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[0]{'section_up'} = $result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[1];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[1]{'section_prev'} = $result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[1]{'section_up'} = $result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[2]{'section_prev'} = $result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[1];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[2]{'section_up'} = $result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'complex'}{'section_childs'}[0];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[1]{'section_prev'} = $result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[1]{'section_up'} = $result_sectioning{'complex'}{'section_childs'}[0];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[2]{'section_prev'} = $result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[1];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_childs'}[2]{'section_up'} = $result_sectioning{'complex'}{'section_childs'}[0];
$result_sectioning{'complex'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'complex'};

$result_nodes{'complex'} = {
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
      'normalized' => 'First-node'
    },
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'associated_section' => {
          'cmdname' => 'unnumberedsec',
          'extra' => {},
          'level' => 2
        },
        'normalized' => 'unnumbered'
      },
      'menu_child' => {
        'cmdname' => 'node',
        'extra' => {
          'associated_section' => {
            'cmdname' => 'unnumberedsubsec',
            'extra' => {},
            'level' => 3
          },
          'normalized' => 'unnumbered-sub'
        },
        'node_next' => {
          'cmdname' => 'node',
          'extra' => {
            'associated_section' => {
              'cmdname' => 'subsection',
              'extra' => {},
              'level' => 3
            },
            'normalized' => 'numbered-sub'
          },
          'node_next' => {
            'cmdname' => 'node',
            'extra' => {
              'associated_section' => {
                'cmdname' => 'unnumberedsubsec',
                'extra' => {},
                'level' => 3
              },
              'normalized' => 'unnumbered-sub2'
            },
            'node_next' => {
              'cmdname' => 'node',
              'extra' => {
                'associated_section' => {
                  'cmdname' => 'subsection',
                  'extra' => {},
                  'level' => 3
                },
                'normalized' => 'numbered-sub2'
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
        'node_up' => {}
      },
      'menus' => [
        {
          'cmdname' => 'menu'
        }
      ],
      'node_next' => {
        'cmdname' => 'node',
        'extra' => {
          'associated_section' => {
            'cmdname' => 'unnumberedsec',
            'extra' => {},
            'level' => 2
          },
          'normalized' => 'unnumbered2'
        },
        'menu_child' => {
          'cmdname' => 'node',
          'extra' => {
            'associated_section' => {
              'cmdname' => 'subsection',
              'extra' => {},
              'level' => 3
            },
            'normalized' => 'numbered-sub3'
          },
          'node_up' => {}
        },
        'menus' => [
          {
            'cmdname' => 'menu'
          }
        ],
        'node_next' => {
          'cmdname' => 'node',
          'extra' => {
            'associated_section' => {
              'cmdname' => 'section',
              'extra' => {},
              'level' => 2,
              'number' => '1.1'
            },
            'normalized' => 'numbered'
          },
          'node_prev' => {},
          'node_up' => {}
        },
        'node_prev' => {},
        'node_up' => {}
      },
      'node_up' => {}
    },
    'menus' => [
      {
        'cmdname' => 'menu'
      }
    ],
    'node_prev' => {},
    'node_up' => {}
  },
  'menus' => [
    {
      'cmdname' => 'menu'
    }
  ],
  'node_next' => {},
  'node_prev' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'dir'
        }
      ]
    }
  }
};
$result_nodes{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'node_next'}{'node_next'}{'node_next'}{'node_prev'} = $result_nodes{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'node_next'}{'node_next'};
$result_nodes{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'node_next'}{'node_next'}{'node_next'}{'node_up'} = $result_nodes{'complex'}{'menu_child'}{'menu_child'};
$result_nodes{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'node_next'}{'node_next'}{'node_prev'} = $result_nodes{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'node_next'};
$result_nodes{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'node_next'}{'node_next'}{'node_up'} = $result_nodes{'complex'}{'menu_child'}{'menu_child'};
$result_nodes{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'node_next'}{'node_prev'} = $result_nodes{'complex'}{'menu_child'}{'menu_child'}{'menu_child'};
$result_nodes{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'node_next'}{'node_up'} = $result_nodes{'complex'}{'menu_child'}{'menu_child'};
$result_nodes{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'node_up'} = $result_nodes{'complex'}{'menu_child'}{'menu_child'};
$result_nodes{'complex'}{'menu_child'}{'menu_child'}{'node_next'}{'menu_child'}{'node_up'} = $result_nodes{'complex'}{'menu_child'}{'menu_child'}{'node_next'};
$result_nodes{'complex'}{'menu_child'}{'menu_child'}{'node_next'}{'node_next'}{'node_prev'} = $result_nodes{'complex'}{'menu_child'}{'menu_child'}{'node_next'};
$result_nodes{'complex'}{'menu_child'}{'menu_child'}{'node_next'}{'node_next'}{'node_up'} = $result_nodes{'complex'}{'menu_child'};
$result_nodes{'complex'}{'menu_child'}{'menu_child'}{'node_next'}{'node_prev'} = $result_nodes{'complex'}{'menu_child'}{'menu_child'};
$result_nodes{'complex'}{'menu_child'}{'menu_child'}{'node_next'}{'node_up'} = $result_nodes{'complex'}{'menu_child'};
$result_nodes{'complex'}{'menu_child'}{'menu_child'}{'node_up'} = $result_nodes{'complex'}{'menu_child'};
$result_nodes{'complex'}{'menu_child'}{'node_prev'} = $result_nodes{'complex'};
$result_nodes{'complex'}{'menu_child'}{'node_up'} = $result_nodes{'complex'};
$result_nodes{'complex'}{'node_next'} = $result_nodes{'complex'}{'menu_child'};

$result_menus{'complex'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'First-node'
    },
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'unnumbered'
      },
      'menu_child' => {
        'cmdname' => 'node',
        'extra' => {
          'normalized' => 'unnumbered-sub'
        },
        'menu_next' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'numbered-sub'
          },
          'menu_next' => {
            'cmdname' => 'node',
            'extra' => {
              'normalized' => 'unnumbered-sub2'
            },
            'menu_next' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'numbered-sub2'
              },
              'menu_prev' => {},
              'menu_up' => {},
              'menu_up_hash' => {
                'unnumbered' => 1
              }
            },
            'menu_prev' => {},
            'menu_up' => {},
            'menu_up_hash' => {
              'unnumbered' => 1
            }
          },
          'menu_prev' => {},
          'menu_up' => {},
          'menu_up_hash' => {
            'unnumbered' => 1
          }
        },
        'menu_up' => {},
        'menu_up_hash' => {
          'unnumbered' => 1
        }
      },
      'menu_next' => {
        'cmdname' => 'node',
        'extra' => {
          'normalized' => 'unnumbered2'
        },
        'menu_child' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'numbered-sub3'
          },
          'menu_up' => {},
          'menu_up_hash' => {
            'unnumbered2' => 1
          }
        },
        'menu_next' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'numbered'
          },
          'menu_prev' => {},
          'menu_up' => {},
          'menu_up_hash' => {
            'First-node' => 1
          }
        },
        'menu_prev' => {},
        'menu_up' => {},
        'menu_up_hash' => {
          'First-node' => 1
        }
      },
      'menu_up' => {},
      'menu_up_hash' => {
        'First-node' => 1
      }
    },
    'menu_next' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'between-node'
      },
      'menu_next' => {
        'cmdname' => 'node',
        'extra' => {
          'normalized' => 'Second-node'
        },
        'menu_next' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'Third-node-unnumbered'
          },
          'menu_next' => {
            'cmdname' => 'node',
            'extra' => {
              'normalized' => 'Last-node-no-description'
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
$result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_next'}{'menu_prev'} = $result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_next'};
$result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_next'}{'menu_up'} = $result_menus{'complex'}{'menu_child'}{'menu_child'};
$result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_prev'} = $result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'menu_next'};
$result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_up'} = $result_menus{'complex'}{'menu_child'}{'menu_child'};
$result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_prev'} = $result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_child'};
$result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_up'} = $result_menus{'complex'}{'menu_child'}{'menu_child'};
$result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_child'}{'menu_up'} = $result_menus{'complex'}{'menu_child'}{'menu_child'};
$result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_child'}{'menu_up'} = $result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_next'};
$result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_prev'} = $result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_next'};
$result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_up'} = $result_menus{'complex'}{'menu_child'};
$result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_prev'} = $result_menus{'complex'}{'menu_child'}{'menu_child'};
$result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_next'}{'menu_up'} = $result_menus{'complex'}{'menu_child'};
$result_menus{'complex'}{'menu_child'}{'menu_child'}{'menu_up'} = $result_menus{'complex'}{'menu_child'};
$result_menus{'complex'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_next'}{'menu_next'}{'menu_prev'} = $result_menus{'complex'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_next'};
$result_menus{'complex'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_next'}{'menu_next'}{'menu_up'} = $result_menus{'complex'};
$result_menus{'complex'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_next'}{'menu_prev'} = $result_menus{'complex'}{'menu_child'}{'menu_next'}{'menu_next'};
$result_menus{'complex'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_next'}{'menu_up'} = $result_menus{'complex'};
$result_menus{'complex'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_prev'} = $result_menus{'complex'}{'menu_child'}{'menu_next'};
$result_menus{'complex'}{'menu_child'}{'menu_next'}{'menu_next'}{'menu_up'} = $result_menus{'complex'};
$result_menus{'complex'}{'menu_child'}{'menu_next'}{'menu_prev'} = $result_menus{'complex'}{'menu_child'};
$result_menus{'complex'}{'menu_child'}{'menu_next'}{'menu_up'} = $result_menus{'complex'};
$result_menus{'complex'}{'menu_child'}{'menu_up'} = $result_menus{'complex'};

$result_errors{'complex'} = [
  {
    'error_line' => ':2: @top missing argument
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@top missing argument',
    'type' => 'error'
  }
];


1;
