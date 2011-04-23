use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'detailmenu_on_subnodes'} = {
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
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'chapter 2'
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
                  'normalized' => 'chapter-2'
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
              'parent' => {},
              'text' => '
',
              'type' => 'after_description_line'
            },
            {
              'cmdname' => 'detailmenu',
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
                'line_nr' => 7,
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
              'cmdname' => 'detailmenu',
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'Chap 2
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
                          'text' => 'section chap 2'
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
                      'normalized' => 'section-chap-2'
                    }
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 14,
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
                          'text' => 'unnumberedsec'
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
                      'normalized' => 'unnumberedsec'
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
                'line_nr' => 23,
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
                'line_nr' => 24,
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
            'line_nr' => 22,
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
        'line_nr' => 20,
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
        'line_nr' => 26,
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
        'line_nr' => 27,
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
              'text' => 'chapter 2'
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
            'normalized' => 'chapter-2'
          }
        ],
        'normalized' => 'chapter-2'
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
              'text' => 'chapter 2'
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
                      'text' => 'section chap 2'
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
                  'normalized' => 'section-chap-2'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 33,
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
                      'text' => 'unnumberedsec'
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
                  'normalized' => 'unnumberedsec'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 34,
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
                'line_nr' => 35,
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
            'line_nr' => 32,
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
        'line_nr' => 30,
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
              'text' => 'section chap 2'
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
            'normalized' => 'section-chap-2'
          }
        ],
        'normalized' => 'section-chap-2'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 37,
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
              'text' => 'section chap 2'
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
        'line_nr' => 38,
        'macro' => ''
      },
      'number' => '2.1',
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
              'text' => 'unnumberedsec'
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
            'normalized' => 'unnumberedsec'
          }
        ],
        'normalized' => 'unnumberedsec'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 40,
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
              'text' => 'unnumberedsec'
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
      'contents' => [],
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 2,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 41,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_description'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1]{'args'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[2]{'extra'}{'command'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'extra'}{'end_command'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2]{'args'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2]{'extra'}{'menu_entry_description'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3]{'args'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3]{'extra'}{'menu_entry_description'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3]{'args'}[1]{'contents'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[4]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[4]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[4]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[4];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[4]{'extra'}{'command'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[4]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'extra'}{'end_command'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[4];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[7];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'extra'}{'command'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'contents'}[7];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[2]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[2]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[2]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[2]{'extra'}{'node_content'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'extra'}{'misc_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[3]{'parent'} = $result_trees{'detailmenu_on_subnodes'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[4]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[4]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[4]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[4];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[4]{'extra'}{'node_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[4]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[4]{'extra'}{'node_content'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[4]{'parent'} = $result_trees{'detailmenu_on_subnodes'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[5]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[5]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[5]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[5];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[5];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[5]{'extra'}{'misc_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[5]{'parent'} = $result_trees{'detailmenu_on_subnodes'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[6]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[6]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[6]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[6];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[6]{'extra'}{'node_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[6]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[6]{'extra'}{'node_content'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[6]{'parent'} = $result_trees{'detailmenu_on_subnodes'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2]{'args'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_description'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[3]{'extra'}{'command'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'contents'}[3];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'extra'}{'misc_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[7]{'parent'} = $result_trees{'detailmenu_on_subnodes'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[8]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[8]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[8]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[8];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[8]{'extra'}{'node_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[8]{'args'}[0]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[8]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[8]{'extra'}{'node_content'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[8]{'parent'} = $result_trees{'detailmenu_on_subnodes'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[9]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[9]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[9]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[9];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[9];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[9]{'extra'}{'misc_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[9]{'parent'} = $result_trees{'detailmenu_on_subnodes'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[10]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[10]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[10]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[10]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[10];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[10]{'extra'}{'node_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[10]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[10]{'extra'}{'node_content'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[10]{'parent'} = $result_trees{'detailmenu_on_subnodes'};
$result_trees{'detailmenu_on_subnodes'}{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[11]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[11]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[11]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[11]{'args'}[0];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'detailmenu_on_subnodes'}{'contents'}[11];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[11]{'extra'}{'misc_content'}[0] = $result_trees{'detailmenu_on_subnodes'}{'contents'}[11]{'args'}[0]{'contents'}[1];
$result_trees{'detailmenu_on_subnodes'}{'contents'}[11]{'parent'} = $result_trees{'detailmenu_on_subnodes'};

$result_texis{'detailmenu_on_subnodes'} = '@node Top

@menu
* chapter::
* chapter 2::

@detailmenu
* section::
@end detailmenu

@detailmenu
Chap 2

* section chap 2::
* unnumberedsec::
@end detailmenu
@end menu

@node chapter
@chapter chapter

@menu
* section::
@end menu

@node section
@section section

@node chapter 2
@chapter chapter 2

@menu
* section chap 2::
* unnumberedsec::
@end menu

@node section chap 2
@section section chap 2

@node unnumberedsec
@unnumberedsec unnumberedsec
';


$result_texts{'detailmenu_on_subnodes'} = '
* chapter::
* chapter 2::

* section::

Chap 2

* section chap 2::
* unnumberedsec::

1 chapter
*********

* section::

1.1 section
===========

2 chapter 2
***********

* section chap 2::
* unnumberedsec::

2.1 section chap 2
==================

unnumberedsec
=============
';

$result_sectioning{'detailmenu_on_subnodes'} = {
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
            'normalized' => 'chapter-2'
          }
        }
      },
      'level' => 1,
      'number' => 2,
      'section_childs' => [
        {
          'cmdname' => 'section',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'section-chap-2'
              }
            }
          },
          'level' => 2,
          'number' => '2.1',
          'section_up' => {}
        },
        {
          'cmdname' => 'unnumberedsec',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'unnumberedsec'
              }
            }
          },
          'level' => 2,
          'section_prev' => {},
          'section_up' => {}
        }
      ],
      'section_prev' => {},
      'section_up' => {}
    }
  ]
};
$result_sectioning{'detailmenu_on_subnodes'}{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'detailmenu_on_subnodes'}{'section_childs'}[0];
$result_sectioning{'detailmenu_on_subnodes'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'detailmenu_on_subnodes'};
$result_sectioning{'detailmenu_on_subnodes'}{'section_childs'}[1]{'section_childs'}[0]{'section_up'} = $result_sectioning{'detailmenu_on_subnodes'}{'section_childs'}[1];
$result_sectioning{'detailmenu_on_subnodes'}{'section_childs'}[1]{'section_childs'}[1]{'section_prev'} = $result_sectioning{'detailmenu_on_subnodes'}{'section_childs'}[1]{'section_childs'}[0];
$result_sectioning{'detailmenu_on_subnodes'}{'section_childs'}[1]{'section_childs'}[1]{'section_up'} = $result_sectioning{'detailmenu_on_subnodes'}{'section_childs'}[1];
$result_sectioning{'detailmenu_on_subnodes'}{'section_childs'}[1]{'section_prev'} = $result_sectioning{'detailmenu_on_subnodes'}{'section_childs'}[0];
$result_sectioning{'detailmenu_on_subnodes'}{'section_childs'}[1]{'section_up'} = $result_sectioning{'detailmenu_on_subnodes'};

$result_nodes{'detailmenu_on_subnodes'} = {
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
    'node_next' => {
      'cmdname' => 'node',
      'extra' => {
        'associated_section' => {
          'cmdname' => 'chapter',
          'extra' => {},
          'level' => 1,
          'number' => 2
        },
        'normalized' => 'chapter-2'
      },
      'menu_child' => {
        'cmdname' => 'node',
        'extra' => {
          'associated_section' => {
            'cmdname' => 'section',
            'extra' => {},
            'level' => 2,
            'number' => '2.1'
          },
          'normalized' => 'section-chap-2'
        },
        'node_next' => {
          'cmdname' => 'node',
          'extra' => {
            'associated_section' => {
              'cmdname' => 'unnumberedsec',
              'extra' => {},
              'level' => 2
            },
            'normalized' => 'unnumberedsec'
          },
          'node_prev' => {},
          'node_up' => {}
        },
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
$result_nodes{'detailmenu_on_subnodes'}{'menu_child'}{'menu_child'}{'node_up'} = $result_nodes{'detailmenu_on_subnodes'}{'menu_child'};
$result_nodes{'detailmenu_on_subnodes'}{'menu_child'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'detailmenu_on_subnodes'}{'menu_child'}{'menus'}[0];
$result_nodes{'detailmenu_on_subnodes'}{'menu_child'}{'node_next'}{'menu_child'}{'node_next'}{'node_prev'} = $result_nodes{'detailmenu_on_subnodes'}{'menu_child'}{'node_next'}{'menu_child'};
$result_nodes{'detailmenu_on_subnodes'}{'menu_child'}{'node_next'}{'menu_child'}{'node_next'}{'node_up'} = $result_nodes{'detailmenu_on_subnodes'}{'menu_child'}{'node_next'};
$result_nodes{'detailmenu_on_subnodes'}{'menu_child'}{'node_next'}{'menu_child'}{'node_up'} = $result_nodes{'detailmenu_on_subnodes'}{'menu_child'}{'node_next'};
$result_nodes{'detailmenu_on_subnodes'}{'menu_child'}{'node_next'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'detailmenu_on_subnodes'}{'menu_child'}{'node_next'}{'menus'}[0];
$result_nodes{'detailmenu_on_subnodes'}{'menu_child'}{'node_next'}{'node_prev'} = $result_nodes{'detailmenu_on_subnodes'}{'menu_child'};
$result_nodes{'detailmenu_on_subnodes'}{'menu_child'}{'node_next'}{'node_up'} = $result_nodes{'detailmenu_on_subnodes'};
$result_nodes{'detailmenu_on_subnodes'}{'menu_child'}{'node_prev'} = $result_nodes{'detailmenu_on_subnodes'};
$result_nodes{'detailmenu_on_subnodes'}{'menu_child'}{'node_up'} = $result_nodes{'detailmenu_on_subnodes'};
$result_nodes{'detailmenu_on_subnodes'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'detailmenu_on_subnodes'}{'menus'}[0];
$result_nodes{'detailmenu_on_subnodes'}{'node_next'} = $result_nodes{'detailmenu_on_subnodes'}{'menu_child'};

$result_menus{'detailmenu_on_subnodes'} = {
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
      'menu_up' => {},
      'menu_up_hash' => {
        'chapter' => 1
      }
    },
    'menu_next' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'chapter-2'
      },
      'menu_child' => {
        'cmdname' => 'node',
        'extra' => {
          'normalized' => 'section-chap-2'
        },
        'menu_next' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'unnumberedsec'
          },
          'menu_prev' => {},
          'menu_up' => {},
          'menu_up_hash' => {
            'chapter-2' => 1
          }
        },
        'menu_up' => {},
        'menu_up_hash' => {
          'chapter-2' => 1
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
$result_menus{'detailmenu_on_subnodes'}{'menu_child'}{'menu_child'}{'menu_up'} = $result_menus{'detailmenu_on_subnodes'}{'menu_child'};
$result_menus{'detailmenu_on_subnodes'}{'menu_child'}{'menu_next'}{'menu_child'}{'menu_next'}{'menu_prev'} = $result_menus{'detailmenu_on_subnodes'}{'menu_child'}{'menu_next'}{'menu_child'};
$result_menus{'detailmenu_on_subnodes'}{'menu_child'}{'menu_next'}{'menu_child'}{'menu_next'}{'menu_up'} = $result_menus{'detailmenu_on_subnodes'}{'menu_child'}{'menu_next'};
$result_menus{'detailmenu_on_subnodes'}{'menu_child'}{'menu_next'}{'menu_child'}{'menu_up'} = $result_menus{'detailmenu_on_subnodes'}{'menu_child'}{'menu_next'};
$result_menus{'detailmenu_on_subnodes'}{'menu_child'}{'menu_next'}{'menu_prev'} = $result_menus{'detailmenu_on_subnodes'}{'menu_child'};
$result_menus{'detailmenu_on_subnodes'}{'menu_child'}{'menu_next'}{'menu_up'} = $result_menus{'detailmenu_on_subnodes'};
$result_menus{'detailmenu_on_subnodes'}{'menu_child'}{'menu_up'} = $result_menus{'detailmenu_on_subnodes'};

$result_errors{'detailmenu_on_subnodes'} = [];



$result_converted{'plaintext'}->{'detailmenu_on_subnodes'} = '* Menu:

* chapter::
* chapter 2::

* section::

Chap 2

* section chap 2::
* unnumberedsec::

1 chapter
*********

* Menu:

* section::

1.1 section
===========

2 chapter 2
***********

* Menu:

* section chap 2::
* unnumberedsec::

2.1 section chap 2
==================

unnumberedsec
=============

';

1;
