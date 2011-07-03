use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'printindex_index_entry_in_copying'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'copying',
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
                      'text' => 'Copying this document'
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
              'cmdname' => 'findex',
              'extra' => {
                'index_entry' => {
                  'command' => {},
                  'content' => [
                    {}
                  ],
                  'index_at_command' => 'findex',
                  'index_name' => 'fn',
                  'index_prefix' => 'f',
                  'key' => 'Copying this document',
                  'number' => 1,
                  'region' => {}
                },
                'misc_content' => []
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
            },
            {
              'cmdname' => 'defun',
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
                          'text' => 'fun arg
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'block_line_arg'
                    }
                  ],
                  'extra' => {
                    'def_args' => [
                      [
                        'category',
                        {
                          'text' => 'Function'
                        }
                      ],
                      [
                        'spaces',
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        }
                      ],
                      [
                        'name',
                        {
                          'text' => 'fun'
                        }
                      ],
                      [
                        'spaces',
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        }
                      ],
                      [
                        'arg',
                        {
                          'text' => 'arg'
                        }
                      ]
                    ],
                    'def_command' => 'defun',
                    'def_parsed_hash' => {
                      'category' => {},
                      'name' => {}
                    },
                    'index_entry' => {
                      'command' => {},
                      'content' => [
                        {}
                      ],
                      'index_at_command' => 'defun',
                      'index_name' => 'fn',
                      'index_prefix' => 'f',
                      'key' => 'fun',
                      'number' => 2,
                      'region' => {}
                    },
                    'original_def_cmdname' => 'defun'
                  },
                  'parent' => {},
                  'type' => 'def_line'
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
                          'text' => 'xf arg
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'misc_line_arg'
                    }
                  ],
                  'cmdname' => 'defunx',
                  'extra' => {
                    'def_args' => [
                      [
                        'category',
                        {
                          'text' => 'Function'
                        }
                      ],
                      [
                        'spaces',
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        }
                      ],
                      [
                        'name',
                        {
                          'text' => 'xf'
                        }
                      ],
                      [
                        'spaces',
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        }
                      ],
                      [
                        'arg',
                        {
                          'text' => 'arg'
                        }
                      ]
                    ],
                    'def_command' => 'defun',
                    'def_parsed_hash' => {
                      'category' => {},
                      'name' => {}
                    },
                    'index_entry' => {
                      'command' => {},
                      'content' => [
                        {}
                      ],
                      'index_at_command' => 'defun',
                      'index_name' => 'fn',
                      'index_prefix' => 'f',
                      'key' => 'xf',
                      'number' => 3,
                      'region' => {}
                    },
                    'original_def_cmdname' => 'defunx'
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 6,
                    'macro' => ''
                  },
                  'parent' => {},
                  'type' => 'def_line'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'Defun
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'paragraph'
                    }
                  ],
                  'parent' => {},
                  'type' => 'def_item'
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
                          'text' => 'defun'
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
                    'command_argument' => 'defun',
                    'text_arg' => 'defun'
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
                'line_nr' => 5,
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
                      'cmdname' => 'asis',
                      'parent' => {},
                      'type' => 'command_as_argument'
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
              'cmdname' => 'ftable',
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
                          'text' => 'ftable item'
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
                  'cmdname' => 'item',
                  'extra' => {
                    'index_entry' => {
                      'command' => {},
                      'content' => [
                        {}
                      ],
                      'index_at_command' => 'ftable',
                      'index_name' => 'fn',
                      'index_prefix' => 'f',
                      'key' => 'ftable item',
                      'number' => 4,
                      'region' => {}
                    },
                    'misc_content' => []
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
                          'text' => 'xftable xitem'
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
                  'cmdname' => 'itemx',
                  'extra' => {
                    'index_entry' => {
                      'command' => {},
                      'content' => [
                        {}
                      ],
                      'index_at_command' => 'ftable',
                      'index_name' => 'fn',
                      'index_prefix' => 'f',
                      'key' => 'xftable xitem',
                      'number' => 5,
                      'region' => {}
                    },
                    'misc_content' => []
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
                          'text' => 'ftable'
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
                    'command_argument' => 'ftable',
                    'text_arg' => 'ftable'
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
                'block_command_line_contents' => [
                  [
                    {}
                  ]
                ],
                'command_as_argument' => {},
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
                      'text' => 'fn'
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
              'cmdname' => 'printindex',
              'extra' => {
                'misc_args' => [
                  'fn'
                ]
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
                      'text' => 'copying'
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
                'command_argument' => 'copying',
                'text_arg' => 'copying'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 17,
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
              'text' => 'Top.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'insertcopying',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
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
        'line_nr' => 19,
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
        'line_nr' => 28,
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
              'text' => 'Chapter'
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
          'cmdname' => 'insertcopying',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
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
                  'text' => 'fn'
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
          'cmdname' => 'printindex',
          'extra' => {
            'misc_args' => [
              'fn'
            ]
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
        'line_nr' => 29,
        'macro' => ''
      },
      'number' => 1,
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'index_entry'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'index_entry'}{'region'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'index_entry'}{'content'};
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'extra'}{'index_entry'}{'region'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'extra'}{'def_args'}[0][1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'extra'}{'def_args'}[2][1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'extra'}{'def_args'}[2][1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'region'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[2]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[2];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[3];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[3]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[3]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[3]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[3];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[3]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'extra'}{'end_command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[3];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'region'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'extra'}{'misc_content'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'index_entry'}{'region'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'misc_content'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'index_entry'}{'content'};
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[2];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[2];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[2]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'extra'}{'command_as_argument'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'extra'}{'end_command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[2];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[8];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[8];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[10];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[10];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[10];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'};
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[3];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[3];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[2];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[2];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[2]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'extra'}{'end_command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'contents'}[2];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'};
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[2];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[2]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[2]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[2]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[2];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[2]{'extra'}{'node_content'};
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'};
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[3]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[4];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[4]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[4]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[4]{'args'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[4];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[4]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'contents'}[5]{'parent'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'extra'}{'misc_content'}[0] = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[3]{'parent'} = $result_trees{'printindex_index_entry_in_copying'};

$result_texis{'printindex_index_entry_in_copying'} = '@copying

@findex Copying this document

@defun fun arg
@defunx xf arg
Defun
@end defun

@ftable @asis
@item ftable item
@itemx xftable xitem
@end ftable

@printindex fn

@end copying

@node Top

Top.
@insertcopying

@menu
* chapter::
@end menu

@node chapter
@chapter Chapter

@insertcopying

@printindex fn

';


$result_texts{'printindex_index_entry_in_copying'} = '

Top.


* chapter::

1 Chapter
*********




';

$result_sectioning{'printindex_index_entry_in_copying'} = {
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
      'section_up' => {}
    }
  ]
};
$result_sectioning{'printindex_index_entry_in_copying'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'printindex_index_entry_in_copying'};

$result_nodes{'printindex_index_entry_in_copying'} = {
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
$result_nodes{'printindex_index_entry_in_copying'}{'menu_child'}{'node_prev'} = $result_nodes{'printindex_index_entry_in_copying'};
$result_nodes{'printindex_index_entry_in_copying'}{'menu_child'}{'node_up'} = $result_nodes{'printindex_index_entry_in_copying'};
$result_nodes{'printindex_index_entry_in_copying'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'printindex_index_entry_in_copying'}{'menus'}[0];
$result_nodes{'printindex_index_entry_in_copying'}{'node_next'} = $result_nodes{'printindex_index_entry_in_copying'}{'menu_child'};

$result_menus{'printindex_index_entry_in_copying'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'chapter'
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'printindex_index_entry_in_copying'}{'menu_child'}{'menu_up'} = $result_menus{'printindex_index_entry_in_copying'};

$result_errors{'printindex_index_entry_in_copying'} = [];



$result_converted{'info'}->{'printindex_index_entry_in_copying'} = 'This is , produced by makeinfo version 4.13 from .

 -- Function: fun arg
 -- Function: xf arg
     Defun

ftable item
xftable xitem

 [index ]
* Menu:



File: ,  Node: Top,  Next: chapter,  Up: (dir)

Top.

 -- Function: fun arg
 -- Function: xf arg
     Defun

ftable item
xftable xitem

 [index ]
* Menu:

* Copying this document:                 Top.                  (line  5)
* ftable item:                           Top.                  (line  9)
* fun:                                   Top.                  (line  5)
* xf:                                    Top.                  (line  6)
* xftable xitem:                         Top.                  (line 10)

* Menu:

* chapter::


File: ,  Node: chapter,  Prev: Top,  Up: Top

1 Chapter
*********

 -- Function: fun arg
 -- Function: xf arg
     Defun

ftable item
xftable xitem

 [index ]
* Menu:

* Copying this document:                 chapter.              (line  6)
* ftable item:                           chapter.              (line 10)
* fun:                                   chapter.              (line  6)
* xf:                                    chapter.              (line  7)
* xftable xitem:                         chapter.              (line 11)

 [index ]
* Menu:

* Copying this document:                 chapter.              (line  6)
* ftable item:                           chapter.              (line 10)
* fun:                                   chapter.              (line  6)
* xf:                                    chapter.              (line  7)
* xftable xitem:                         chapter.              (line 11)



Tag Table:
Node: Top156
Node: chapter703

End Tag Table
';

1;
