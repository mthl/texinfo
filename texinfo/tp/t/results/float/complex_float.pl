use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'complex_float'} = {
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
              'text' => 'Test floats'
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'A list of floats at the beginning.
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'Text'
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
          'cmdname' => 'listoffloats',
          'extra' => {
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'After the listoffloats.
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
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'chapter'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 9,
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
                  'text' => 'Text'
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
                  'text' => 'text with a lot of features'
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
                  'text' => 'An example of float '
                },
                {
                  'args' => [
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'enddots',
                  'contents' => [],
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
              'args' => [
                {
                  'parent' => {},
                  'text' => ' makeinfo --docbook segfaults
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
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
                  'text' => 'An index entry
'
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
                          'text' => 'float example'
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
                      'node' => {}
                    },
                    'misc_content' => []
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 30,
                    'macro' => ''
                  },
                  'parent' => {}
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
                  'text' => 'A table.
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
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'cmdname' => 'emph',
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
              'cmdname' => 'table',
              'contents' => [
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'before_item'
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
                          'text' => 'truc'
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
                    'misc_content' => [
                      {}
                    ]
                  },
                  'parent' => {}
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'line
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'block_command_line_contents' => [
                  [
                    {}
                  ]
                ],
                'command_as_argument' => 'emph'
              },
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'An itemize.
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
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'cmdname' => 'minus',
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
              'cmdname' => 'itemize',
              'contents' => [
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'before_item'
                },
                {
                  'cmdname' => 'item',
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'truc 
'
                        },
                        {
                          'parent' => {},
                          'text' => 'line
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'paragraph'
                    }
                  ],
                  'extra' => {
                    'item_number' => 1
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
                'command_as_argument' => 'minus'
              },
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'A ref.
'
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'xref Text with features'
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
                      [
                        {}
                      ]
                    ]
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 45,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => '.
'
                },
                {
                  'parent' => {},
                  'text' => 'A footnote.
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'footnote Text with features'
                            }
                          ],
                          'parent' => {},
                          'type' => 'paragraph'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_context'
                    }
                  ],
                  'cmdname' => 'footnote',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 47,
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
              'contents' => [
                {
                  'args' => [
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'TeX',
                  'contents' => [],
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' and '
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
                                  'text' => 't'
                                },
                                {
                                  'args' => [
                                    {
                                      'parent' => {},
                                      'text' => 'e'
                                    }
                                  ],
                                  'cmdname' => '\'',
                                  'parent' => {}
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
                                                  'text' => 'i'
                                                }
                                              ],
                                              'parent' => {},
                                              'type' => 'brace_command_arg'
                                            }
                                          ],
                                          'cmdname' => 'dotless',
                                          'contents' => [],
                                          'parent' => {}
                                        }
                                      ],
                                      'parent' => {},
                                      'type' => 'brace_command_arg'
                                    }
                                  ],
                                  'cmdname' => '^',
                                  'contents' => [],
                                  'parent' => {}
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'b',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'args' => [
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'an_url'
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'url',
                          'contents' => [],
                          'extra' => {
                            'brace_command_contents' => [
                              [
                                {}
                              ]
                            ]
                          },
                          'line_nr' => {
                            'file_name' => '',
                            'line_nr' => 49,
                            'macro' => ''
                          },
                          'parent' => {}
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'emph',
                  'contents' => [],
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'and'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'sc',
                  'contents' => [],
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'it is @verb',
                          'type' => 'raw'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'verb',
                  'contents' => [],
                  'parent' => {},
                  'type' => '!'
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'cmdname' => ' ',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'a wo'
                },
                {
                  'cmdname' => '-',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'rd '
                },
                {
                  'cmdname' => '!',
                  'parent' => {}
                },
                {
                  'cmdname' => '@',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'args' => [
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'AE',
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
                      'type' => 'empty_spaces_before_paragraph'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'An example of float caption'
                        },
                        {
                          'args' => [
                            {
                              'contents' => [],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'enddots',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => '
'
                        },
                        {
                          'parent' => {},
                          'text' => 'An example.
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'paragraph'
                    },
                    {
                      'cmdname' => 'example',
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
                              'parent' => {},
                              'text' => 'example
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'preformatted'
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
                              'text' => 'Anchor in caption'
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
                        'normalized' => 'Anchor-in-caption'
                      },
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 57,
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
                          'text' => 'A table.
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
                              'parent' => {},
                              'text' => ' ',
                              'type' => 'empty_spaces_after_command'
                            },
                            {
                              'cmdname' => 'emph',
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
                      'cmdname' => 'table',
                      'contents' => [
                        {
                          'contents' => [],
                          'parent' => {},
                          'type' => 'before_item'
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
                                  'text' => 'truc'
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
                            'misc_content' => [
                              {}
                            ]
                          },
                          'parent' => {}
                        },
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'line
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'block_command_line_contents' => [
                          [
                            {}
                          ]
                        ],
                        'command_as_argument' => 'emph'
                      },
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A multitable.
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
                              'parent' => {},
                              'text' => ' ',
                              'type' => 'empty_spaces_after_command'
                            },
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'truc'
                                }
                              ],
                              'parent' => {},
                              'type' => 'bracketed'
                            },
                            {
                              'parent' => {},
                              'text' => ' '
                            },
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'bidule'
                                }
                              ],
                              'parent' => {},
                              'type' => 'bracketed'
                            },
                            {
                              'parent' => {},
                              'text' => '
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'block_line_arg'
                        }
                      ],
                      'cmdname' => 'multitable',
                      'contents' => [
                        {
                          'contents' => [],
                          'parent' => {},
                          'type' => 'before_item'
                        },
                        {
                          'contents' => [
                            {
                              'cmdname' => 'item',
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => ' ',
                                  'type' => 'empty_spaces_after_command'
                                },
                                {
                                  'contents' => [
                                    {
                                      'parent' => {},
                                      'text' => 'truc '
                                    }
                                  ],
                                  'parent' => {},
                                  'type' => 'paragraph'
                                }
                              ],
                              'extra' => {
                                'cell_number' => 1
                              },
                              'parent' => {}
                            },
                            {
                              'cmdname' => 'tab',
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => ' ',
                                  'type' => 'empty_spaces_after_command'
                                },
                                {
                                  'contents' => [
                                    {
                                      'parent' => {},
                                      'text' => 'bidule
'
                                    }
                                  ],
                                  'parent' => {},
                                  'type' => 'paragraph'
                                }
                              ],
                              'extra' => {
                                'cell_number' => 2
                              },
                              'parent' => {}
                            }
                          ],
                          'extra' => {
                            'row_number' => 1
                          },
                          'parent' => {},
                          'type' => 'row'
                        },
                        {
                          'contents' => [
                            {
                              'cmdname' => 'item',
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => ' ',
                                  'type' => 'empty_spaces_after_command'
                                },
                                {
                                  'contents' => [
                                    {
                                      'parent' => {},
                                      'text' => 'truc '
                                    }
                                  ],
                                  'parent' => {},
                                  'type' => 'paragraph'
                                }
                              ],
                              'extra' => {
                                'cell_number' => 1
                              },
                              'parent' => {}
                            },
                            {
                              'cmdname' => 'tab',
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => ' ',
                                  'type' => 'empty_spaces_after_command'
                                },
                                {
                                  'contents' => [
                                    {
                                      'parent' => {},
                                      'text' => 'bidule
'
                                    }
                                  ],
                                  'parent' => {},
                                  'type' => 'paragraph'
                                }
                              ],
                              'extra' => {
                                'cell_number' => 2
                              },
                              'parent' => {}
                            }
                          ],
                          'extra' => {
                            'row_number' => 2
                          },
                          'parent' => {},
                          'type' => 'row'
                        }
                      ],
                      'extra' => {
                        'max_columns' => 2,
                        'prototypes' => [
                          {
                            'contents' => [],
                            'parent' => {},
                            'type' => 'bracketed_multitable_prototype'
                          },
                          {
                            'contents' => [],
                            'parent' => {},
                            'type' => 'bracketed_multitable_prototype'
                          }
                        ]
                      },
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line_after_command'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'An index entry
'
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
                                  'text' => 'float example in caption'
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
                              'node' => {}
                            },
                            'misc_content' => []
                          },
                          'line_nr' => {
                            'file_name' => '',
                            'line_nr' => 71,
                            'macro' => ''
                          },
                          'parent' => {}
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
                          'text' => 'An itemize.
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
                              'parent' => {},
                              'text' => ' ',
                              'type' => 'empty_spaces_after_command'
                            },
                            {
                              'cmdname' => 'minus',
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
                      'cmdname' => 'itemize',
                      'contents' => [
                        {
                          'contents' => [],
                          'parent' => {},
                          'type' => 'before_item'
                        },
                        {
                          'cmdname' => 'item',
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => ' ',
                              'type' => 'empty_spaces_after_command'
                            },
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'truc 
'
                                },
                                {
                                  'parent' => {},
                                  'text' => 'line
'
                                }
                              ],
                              'parent' => {},
                              'type' => 'paragraph'
                            }
                          ],
                          'extra' => {
                            'item_number' => 1
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
                        'command_as_argument' => 'minus'
                      },
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A ref.
'
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
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'xref Text with features caption'
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
                              [
                                {}
                              ]
                            ]
                          },
                          'line_nr' => {
                            'file_name' => '',
                            'line_nr' => 80,
                            'macro' => ''
                          },
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => '.
'
                        },
                        {
                          'parent' => {},
                          'text' => 'A footnote.
'
                        },
                        {
                          'args' => [
                            {
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'parent' => {},
                                      'text' => 'footnote Text with features caption'
                                    }
                                  ],
                                  'parent' => {},
                                  'type' => 'paragraph'
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_context'
                            }
                          ],
                          'cmdname' => 'footnote',
                          'contents' => [],
                          'line_nr' => {
                            'file_name' => '',
                            'line_nr' => 82,
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
                      'contents' => [
                        {
                          'args' => [
                            {
                              'contents' => [],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'TeX',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' and '
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
                                          'text' => 't'
                                        },
                                        {
                                          'args' => [
                                            {
                                              'parent' => {},
                                              'text' => 'e'
                                            }
                                          ],
                                          'cmdname' => '\'',
                                          'parent' => {}
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
                                                          'text' => 'i'
                                                        }
                                                      ],
                                                      'parent' => {},
                                                      'type' => 'brace_command_arg'
                                                    }
                                                  ],
                                                  'cmdname' => 'dotless',
                                                  'contents' => [],
                                                  'parent' => {}
                                                }
                                              ],
                                              'parent' => {},
                                              'type' => 'brace_command_arg'
                                            }
                                          ],
                                          'cmdname' => '^',
                                          'contents' => [],
                                          'parent' => {}
                                        }
                                      ],
                                      'parent' => {},
                                      'type' => 'brace_command_arg'
                                    }
                                  ],
                                  'cmdname' => 'b',
                                  'contents' => [],
                                  'parent' => {}
                                },
                                {
                                  'args' => [
                                    {
                                      'contents' => [
                                        {
                                          'parent' => {},
                                          'text' => 'an_url'
                                        }
                                      ],
                                      'parent' => {},
                                      'type' => 'brace_command_arg'
                                    }
                                  ],
                                  'cmdname' => 'url',
                                  'contents' => [],
                                  'extra' => {
                                    'brace_command_contents' => [
                                      [
                                        {}
                                      ]
                                    ]
                                  },
                                  'line_nr' => {
                                    'file_name' => '',
                                    'line_nr' => 84,
                                    'macro' => ''
                                  },
                                  'parent' => {}
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'emph',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' '
                        },
                        {
                          'args' => [
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'and'
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'sc',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' '
                        },
                        {
                          'args' => [
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'it is @verb',
                                  'type' => 'raw'
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'verb',
                          'contents' => [],
                          'parent' => {},
                          'type' => '!'
                        },
                        {
                          'parent' => {},
                          'text' => ' '
                        },
                        {
                          'cmdname' => ' ',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'a wo'
                        },
                        {
                          'cmdname' => '-',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'rd '
                        },
                        {
                          'cmdname' => '!',
                          'parent' => {}
                        },
                        {
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' '
                        },
                        {
                          'args' => [
                            {
                              'contents' => [],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'AE',
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
                  'parent' => {},
                  'type' => 'brace_command_context'
                }
              ],
              'cmdname' => 'caption',
              'contents' => [],
              'extra' => {
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 51,
                'macro' => ''
              },
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
                      'contents' => [
                        {
                          'args' => [
                            {
                              'contents' => [],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'TeX',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' and '
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
                                          'text' => 't'
                                        },
                                        {
                                          'args' => [
                                            {
                                              'parent' => {},
                                              'text' => 'e'
                                            }
                                          ],
                                          'cmdname' => '\'',
                                          'parent' => {}
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
                                                          'text' => 'i'
                                                        }
                                                      ],
                                                      'parent' => {},
                                                      'type' => 'brace_command_arg'
                                                    }
                                                  ],
                                                  'cmdname' => 'dotless',
                                                  'contents' => [],
                                                  'parent' => {}
                                                }
                                              ],
                                              'parent' => {},
                                              'type' => 'brace_command_arg'
                                            }
                                          ],
                                          'cmdname' => '^',
                                          'contents' => [],
                                          'parent' => {}
                                        }
                                      ],
                                      'parent' => {},
                                      'type' => 'brace_command_arg'
                                    }
                                  ],
                                  'cmdname' => 'b',
                                  'contents' => [],
                                  'parent' => {}
                                },
                                {
                                  'args' => [
                                    {
                                      'contents' => [
                                        {
                                          'parent' => {},
                                          'text' => 'an_url'
                                        }
                                      ],
                                      'parent' => {},
                                      'type' => 'brace_command_arg'
                                    }
                                  ],
                                  'cmdname' => 'url',
                                  'contents' => [],
                                  'extra' => {
                                    'brace_command_contents' => [
                                      [
                                        {}
                                      ]
                                    ]
                                  },
                                  'line_nr' => {
                                    'file_name' => '',
                                    'line_nr' => 87,
                                    'macro' => ''
                                  },
                                  'parent' => {}
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'emph',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' '
                        },
                        {
                          'args' => [
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'and'
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'sc',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' '
                        },
                        {
                          'args' => [
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'it is @verb',
                                  'type' => 'raw'
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'verb',
                          'contents' => [],
                          'parent' => {},
                          'type' => '!'
                        },
                        {
                          'parent' => {},
                          'text' => ' '
                        },
                        {
                          'cmdname' => ' ',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'a wo'
                        },
                        {
                          'cmdname' => '-',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'rd '
                        },
                        {
                          'cmdname' => '!',
                          'parent' => {}
                        },
                        {
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' '
                        },
                        {
                          'args' => [
                            {
                              'contents' => [],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'AE',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => '.'
                        }
                      ],
                      'parent' => {},
                      'type' => 'paragraph'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_context'
                }
              ],
              'cmdname' => 'shortcaption',
              'contents' => [],
              'extra' => {
                'float' => {}
              },
              'line_nr' => {},
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
            }
          ],
          'extra' => {
            'block_command_line_contents' => [
              [
                {}
              ],
              [
                {}
              ]
            ],
            'caption' => {},
            'node_content' => [
              {}
            ],
            'normalized' => 'text-with-a-lot-of-features',
            'shortcaption' => {},
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 12,
            'macro' => ''
          },
          'number' => 1,
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
        'line_nr' => 91,
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
              'text' => 'A chapter'
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'Text'
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
                  'text' => 'float with a lot of features and no shortcaption'
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
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'Float text of a float with a lot of features.
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_before_paragraph'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'An example of float caption'
                        },
                        {
                          'args' => [
                            {
                              'contents' => [],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'enddots',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' 2
'
                        },
                        {
                          'parent' => {},
                          'text' => 'An example 2.
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'paragraph'
                    },
                    {
                      'cmdname' => 'example',
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
                              'parent' => {},
                              'text' => 'example 2
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'preformatted'
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A table 2.
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
                              'parent' => {},
                              'text' => ' ',
                              'type' => 'empty_spaces_after_command'
                            },
                            {
                              'cmdname' => 'emph',
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
                      'cmdname' => 'table',
                      'contents' => [
                        {
                          'contents' => [],
                          'parent' => {},
                          'type' => 'before_item'
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
                                  'text' => 'truc 2'
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
                            'misc_content' => [
                              {}
                            ]
                          },
                          'parent' => {}
                        },
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'line 2
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'block_command_line_contents' => [
                          [
                            {}
                          ]
                        ],
                        'command_as_argument' => 'emph'
                      },
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A multitable 2.
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
                              'parent' => {},
                              'text' => ' ',
                              'type' => 'empty_spaces_after_command'
                            },
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'truc'
                                }
                              ],
                              'parent' => {},
                              'type' => 'bracketed'
                            },
                            {
                              'parent' => {},
                              'text' => ' '
                            },
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'bidule'
                                }
                              ],
                              'parent' => {},
                              'type' => 'bracketed'
                            },
                            {
                              'parent' => {},
                              'text' => '
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'block_line_arg'
                        }
                      ],
                      'cmdname' => 'multitable',
                      'contents' => [
                        {
                          'contents' => [],
                          'parent' => {},
                          'type' => 'before_item'
                        },
                        {
                          'contents' => [
                            {
                              'cmdname' => 'item',
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => ' ',
                                  'type' => 'empty_spaces_after_command'
                                },
                                {
                                  'contents' => [
                                    {
                                      'parent' => {},
                                      'text' => 'truc 2 '
                                    }
                                  ],
                                  'parent' => {},
                                  'type' => 'paragraph'
                                }
                              ],
                              'extra' => {
                                'cell_number' => 1
                              },
                              'parent' => {}
                            },
                            {
                              'cmdname' => 'tab',
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => ' ',
                                  'type' => 'empty_spaces_after_command'
                                },
                                {
                                  'contents' => [
                                    {
                                      'parent' => {},
                                      'text' => 'bidule
'
                                    }
                                  ],
                                  'parent' => {},
                                  'type' => 'paragraph'
                                }
                              ],
                              'extra' => {
                                'cell_number' => 2
                              },
                              'parent' => {}
                            }
                          ],
                          'extra' => {
                            'row_number' => 1
                          },
                          'parent' => {},
                          'type' => 'row'
                        },
                        {
                          'contents' => [
                            {
                              'cmdname' => 'item',
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => ' ',
                                  'type' => 'empty_spaces_after_command'
                                },
                                {
                                  'contents' => [
                                    {
                                      'parent' => {},
                                      'text' => 'truc 2 '
                                    }
                                  ],
                                  'parent' => {},
                                  'type' => 'paragraph'
                                }
                              ],
                              'extra' => {
                                'cell_number' => 1
                              },
                              'parent' => {}
                            },
                            {
                              'cmdname' => 'tab',
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => ' ',
                                  'type' => 'empty_spaces_after_command'
                                },
                                {
                                  'contents' => [
                                    {
                                      'parent' => {},
                                      'text' => 'bidule
'
                                    }
                                  ],
                                  'parent' => {},
                                  'type' => 'paragraph'
                                }
                              ],
                              'extra' => {
                                'cell_number' => 2
                              },
                              'parent' => {}
                            }
                          ],
                          'extra' => {
                            'row_number' => 2
                          },
                          'parent' => {},
                          'type' => 'row'
                        }
                      ],
                      'extra' => {
                        'max_columns' => 2,
                        'prototypes' => [
                          {
                            'contents' => [],
                            'parent' => {},
                            'type' => 'bracketed_multitable_prototype'
                          },
                          {
                            'contents' => [],
                            'parent' => {},
                            'type' => 'bracketed_multitable_prototype'
                          }
                        ]
                      },
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line_after_command'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'An index entry 2
'
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
                                  'text' => 'float example in caption 2'
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
                              'node' => {}
                            },
                            'misc_content' => []
                          },
                          'line_nr' => {
                            'file_name' => '',
                            'line_nr' => 116,
                            'macro' => ''
                          },
                          'parent' => {}
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
                          'text' => 'An itemize 2.
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
                              'parent' => {},
                              'text' => ' ',
                              'type' => 'empty_spaces_after_command'
                            },
                            {
                              'cmdname' => 'minus',
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
                      'cmdname' => 'itemize',
                      'contents' => [
                        {
                          'contents' => [],
                          'parent' => {},
                          'type' => 'before_item'
                        },
                        {
                          'cmdname' => 'item',
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => ' ',
                              'type' => 'empty_spaces_after_command'
                            },
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'truc 2
'
                                },
                                {
                                  'parent' => {},
                                  'text' => 'line
'
                                }
                              ],
                              'parent' => {},
                              'type' => 'paragraph'
                            }
                          ],
                          'extra' => {
                            'item_number' => 1
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
                        'command_as_argument' => 'minus'
                      },
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
                              'text' => 'Anchor in caption 2'
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
                        'normalized' => 'Anchor-in-caption-2'
                      },
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 124,
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
                          'text' => 'A ref 2.
'
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
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'xref Text with features caption'
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
                              [
                                {}
                              ]
                            ]
                          },
                          'line_nr' => {
                            'file_name' => '',
                            'line_nr' => 127,
                            'macro' => ''
                          },
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => '.
'
                        },
                        {
                          'parent' => {},
                          'text' => 'A footnote 2.
'
                        },
                        {
                          'args' => [
                            {
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'parent' => {},
                                      'text' => 'footnote Text with features caption 2'
                                    }
                                  ],
                                  'parent' => {},
                                  'type' => 'paragraph'
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_context'
                            }
                          ],
                          'cmdname' => 'footnote',
                          'contents' => [],
                          'line_nr' => {
                            'file_name' => '',
                            'line_nr' => 129,
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
                      'contents' => [
                        {
                          'args' => [
                            {
                              'contents' => [],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'TeX',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' and '
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
                                          'text' => 't'
                                        },
                                        {
                                          'args' => [
                                            {
                                              'parent' => {},
                                              'text' => 'e'
                                            }
                                          ],
                                          'cmdname' => '\'',
                                          'parent' => {}
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
                                                          'text' => 'i'
                                                        }
                                                      ],
                                                      'parent' => {},
                                                      'type' => 'brace_command_arg'
                                                    }
                                                  ],
                                                  'cmdname' => 'dotless',
                                                  'contents' => [],
                                                  'parent' => {}
                                                }
                                              ],
                                              'parent' => {},
                                              'type' => 'brace_command_arg'
                                            }
                                          ],
                                          'cmdname' => '^',
                                          'contents' => [],
                                          'parent' => {}
                                        }
                                      ],
                                      'parent' => {},
                                      'type' => 'brace_command_arg'
                                    }
                                  ],
                                  'cmdname' => 'b',
                                  'contents' => [],
                                  'parent' => {}
                                },
                                {
                                  'args' => [
                                    {
                                      'contents' => [
                                        {
                                          'parent' => {},
                                          'text' => 'an_url'
                                        }
                                      ],
                                      'parent' => {},
                                      'type' => 'brace_command_arg'
                                    }
                                  ],
                                  'cmdname' => 'url',
                                  'contents' => [],
                                  'extra' => {
                                    'brace_command_contents' => [
                                      [
                                        {}
                                      ]
                                    ]
                                  },
                                  'line_nr' => {
                                    'file_name' => '',
                                    'line_nr' => 131,
                                    'macro' => ''
                                  },
                                  'parent' => {}
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'emph',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' '
                        },
                        {
                          'args' => [
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'and'
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'sc',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' '
                        },
                        {
                          'args' => [
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'it is @verb',
                                  'type' => 'raw'
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'verb',
                          'contents' => [],
                          'parent' => {},
                          'type' => '!'
                        },
                        {
                          'parent' => {},
                          'text' => ' '
                        },
                        {
                          'cmdname' => ' ',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'a wo'
                        },
                        {
                          'cmdname' => '-',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'rd '
                        },
                        {
                          'cmdname' => '!',
                          'parent' => {}
                        },
                        {
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' '
                        },
                        {
                          'args' => [
                            {
                              'contents' => [],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'AE',
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
                  'parent' => {},
                  'type' => 'brace_command_context'
                }
              ],
              'cmdname' => 'caption',
              'contents' => [],
              'extra' => {
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 98,
                'macro' => ''
              },
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
            }
          ],
          'extra' => {
            'block_command_line_contents' => [
              [
                {}
              ],
              [
                {}
              ]
            ],
            'caption' => {},
            'node_content' => [
              {}
            ],
            'normalized' => 'float-with-a-lot-of-features-and-no-shortcaption',
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 94,
            'macro' => ''
          },
          'number' => '1.1',
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
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'text with a lot of features'
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
                  ]
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 136,
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
        'line_nr' => 92,
        'macro' => ''
      },
      'number' => 1,
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'complex_float'}{'contents'}[0]{'parent'} = $result_trees{'complex_float'};
$result_trees{'complex_float'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'complex_float'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex_float'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'complex_float'}{'contents'}[1]{'parent'} = $result_trees{'complex_float'};
$result_trees{'complex_float'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[2]{'extra'}{'type'}{'content'}[0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'complex_float'}{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[5];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[1]{'args'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[1]{'args'}[3];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[5];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'complex_float'}{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[6]{'parent'} = $result_trees{'complex_float'}{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[7]{'parent'} = $result_trees{'complex_float'}{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'args'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'args'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'args'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'node'} = $result_trees{'complex_float'}{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'extra'}{'misc_content'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'content'};
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[4]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[5]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[6];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[6]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[7]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[8]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[9]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[10];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[10]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[11]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[12]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[13]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[1]{'args'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[1]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[4]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[4]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[4]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'contents'}[5]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[14]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[15]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[4]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[4]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[5]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[6]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[6];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[6]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[7]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[8]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[9]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[10]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[11]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[12]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[13]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[14]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[15];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[15]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'contents'}[16]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[16]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[17]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[5];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[5]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[12];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0]{'contents'}[3];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'extra'}{'prototypes'}[0]{'contents'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'extra'}{'prototypes'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'extra'}{'prototypes'}[1]{'contents'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0]{'contents'}[3]{'contents'};
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'extra'}{'prototypes'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[13]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[14]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1]{'extra'}{'index_entry'}{'node'} = $result_trees{'complex_float'}{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1]{'extra'}{'misc_content'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1]{'extra'}{'index_entry'}{'content'};
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[15]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[16]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[17]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[17];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[17]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[18]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[19]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[20]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[1]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[4]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[4]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[4]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'contents'}[5]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[21]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[22]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[4]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[4]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[5]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[6]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[6];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[6]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[7]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[8]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[9]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[10]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[11]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[12]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[13]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[14]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[15];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[15]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'contents'}[16]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'contents'}[23]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'extra'}{'float'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[19]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[20]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[6];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[11]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[12]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[13]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[14]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[15];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[15]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[16]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'extra'}{'float'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'line_nr'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[22]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[23]{'parent'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'args'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'extra'}{'caption'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[18];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'extra'}{'node_content'}[0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'args'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'extra'}{'shortcaption'} = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'contents'}[21];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'extra'}{'type'}{'content'}[0] = $result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'float_section'} = $result_trees{'complex_float'}{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[8]{'parent'} = $result_trees{'complex_float'}{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[9]{'parent'} = $result_trees{'complex_float'}{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'contents'}[10]{'parent'} = $result_trees{'complex_float'}{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'complex_float'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[2]{'parent'} = $result_trees{'complex_float'};
$result_trees{'complex_float'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[3];
$result_trees{'complex_float'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'complex_float'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'complex_float'}{'contents'}[3]{'extra'}{'node_content'};
$result_trees{'complex_float'}{'contents'}[3]{'parent'} = $result_trees{'complex_float'};
$result_trees{'complex_float'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'args'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'args'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[5];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[9];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0]{'contents'}[3];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'extra'}{'prototypes'}[0]{'contents'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'extra'}{'prototypes'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'extra'}{'prototypes'}[1]{'contents'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0]{'contents'}[3]{'contents'};
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'extra'}{'prototypes'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1]{'extra'}{'index_entry'}{'node'} = $result_trees{'complex_float'}{'contents'}[3];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1]{'extra'}{'misc_content'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1]{'extra'}{'index_entry'}{'content'};
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[13]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[14]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[14];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[14]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'contents'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[15]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[16]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[17]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[18]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[18]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[18];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[18]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[18]{'extra'}{'node_content'}[0] = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[18]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[20]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[1]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[4]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[4]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[4]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'contents'}[5]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[21]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[22]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[4]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[4]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[5]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[6]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[6];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[6]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[7]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[8]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[9]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[10]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[11]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[12]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[13]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[14]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[15];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[15]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'contents'}[16]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[23]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'extra'}{'float'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'extra'}{'caption'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'contents'}[3];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'extra'}{'type'}{'content'}[0] = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'float_section'} = $result_trees{'complex_float'}{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'complex_float'}{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'complex_float'}{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[4]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'complex_float'}{'contents'}[4]{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'complex_float'}{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'complex_float'}{'contents'}[4];
$result_trees{'complex_float'}{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'complex_float'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'complex_float'}{'contents'}[4]{'parent'} = $result_trees{'complex_float'};

$result_texis{'complex_float'} = '@node Top
@top Test floats

A list of floats at the beginning.
@listoffloats Text

After the listoffloats.
@menu
* chapter::
@end menu

@float Text, text with a lot of features
An example of float @enddots{}

@c makeinfo --docbook segfaults

An index entry
@cindex float example

A table.
@table @emph
@item truc 
line
@end table

An itemize.
@itemize @minus
@item truc 
line
@end itemize

A ref.
@xref{Top,xref Text with features}.
A footnote.
@footnote{footnote Text with features}.

@TeX{} and @emph{@b{t@\'e@^{@dotless{i}}}@url{an_url}} @sc{and} @verb{!it is @verb!} @ a wo@-rd @!@@ @AE{}.

@caption{ An example of float caption@enddots{}
An example.
@example 
example
@end example

@anchor{Anchor in caption}

A table.
@table @emph
@item truc 
line
@end table

A multitable.
@multitable {truc} {bidule}
@item truc @tab bidule
@item truc @tab bidule
@end multitable
An index entry
@cindex float example in caption

An itemize.
@itemize @minus
@item truc 
line
@end itemize

A ref.
@xref{Top,xref Text with features caption}.
A footnote.
@footnote{footnote Text with features caption}.

@TeX{} and @emph{@b{t@\'e@^{@dotless{i}}}@url{an_url}} @sc{and} @verb{!it is @verb!} @ a wo@-rd @!@@ @AE{}.
}

@shortcaption{@TeX{} and @emph{@b{t@\'e@^{@dotless{i}}}@url{an_url}} @sc{and} @verb{!it is @verb!} @ a wo@-rd @!@@ @AE{}.}

@end float

@node chapter
@chapter A chapter

@float Text, float with a lot of features and no shortcaption

Float text of a float with a lot of features.

@caption{ An example of float caption@enddots{} 2
An example 2.
@example 
example 2
@end example

A table 2.
@table @emph
@item truc 2 
line 2
@end table

A multitable 2.
@multitable {truc} {bidule}
@item truc 2 @tab bidule
@item truc 2 @tab bidule
@end multitable
An index entry 2
@cindex float example in caption 2

An itemize 2.
@itemize @minus
@item truc 2
line
@end itemize

@anchor{Anchor in caption 2}

A ref 2.
@xref{Top,xref Text with features caption}.
A footnote 2.
@footnote{footnote Text with features caption 2}.

@TeX{} and @emph{@b{t@\'e@^{@dotless{i}}}@url{an_url}} @sc{and} @verb{!it is @verb!} @ a wo@-rd @!@@ @AE{}.
}

@end float

@xref{text with a lot of features}.

';


$result_texts{'complex_float'} = 'Test floats
***********

A list of floats at the beginning.

After the listoffloats.
* chapter::

An example of float ...


An index entry

A table.
truc
line

An itemize.
truc 
line

A ref.
.
A footnote.
.

TeX and te\'i^an_url and it is @verb  a word !@ AE.






1 A chapter
***********


Float text of a float with a lot of features.




.

';

$result_sectioning{'complex_float'} = {
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
                'normalized' => 'chapter'
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
$result_sectioning{'complex_float'}{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'complex_float'}{'section_childs'}[0];
$result_sectioning{'complex_float'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'complex_float'};

$result_nodes{'complex_float'} = {
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
      'normalized' => 'chapter'
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
$result_nodes{'complex_float'}{'menu_child'}{'node_prev'} = $result_nodes{'complex_float'};
$result_nodes{'complex_float'}{'menu_child'}{'node_up'} = $result_nodes{'complex_float'};
$result_nodes{'complex_float'}{'node_next'} = $result_nodes{'complex_float'}{'menu_child'};

$result_menus{'complex_float'} = {
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
$result_menus{'complex_float'}{'menu_child'}{'menu_up'} = $result_menus{'complex_float'};

$result_errors{'complex_float'} = [];


$result_floats{'complex_float'} = {
  'Text' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'text-with-a-lot-of-features',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        },
        'type' => {
          'content' => [
            {
              'text' => 'Text'
            }
          ],
          'normalized' => 'Text'
        }
      },
      'float_section' => {
        'cmdname' => 'top',
        'extra' => {},
        'level' => 0
      },
      'number' => 1
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'float-with-a-lot-of-features-and-no-shortcaption',
        'type' => {
          'content' => [
            {
              'text' => 'Text'
            }
          ],
          'normalized' => 'Text'
        }
      },
      'float_section' => {
        'cmdname' => 'chapter',
        'extra' => {},
        'level' => 1,
        'number' => 1
      },
      'number' => '1.1'
    }
  ]
};
$result_floats{'complex_float'}{'Text'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'complex_float'}{'Text'}[0];
$result_floats{'complex_float'}{'Text'}[0]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'complex_float'}{'Text'}[0];
$result_floats{'complex_float'}{'Text'}[1]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'complex_float'}{'Text'}[1];



$result_converted{'plaintext'}->{'complex_float'} = 'Test floats
***********

A list of floats at the beginning.

* Menu:

* Text 1: text with a lot of features.   TeX and _te\'i^`an_url\'_ AND ...
* Text 1.1: float with a lot of features and no shortcaption.
                                         An example of float ...

   After the listoffloats.
* Menu:

* chapter::

An example of float ...

An index entry

A table.
_truc_
     line

An itemize.
   - truc line

A ref.  *Note xref Text with features: Top.  A footnote.  (1).

TeX and _te\'i^`an_url\'_ AND it is @verb  a word !@ AE.

Text 1: An example of float caption...  An example.
     example

A table.
_truc_
     line

A multitable.
truc   bidule
truc   bidule
An index entry

An itemize.
   - truc line

A ref.  *Note xref Text with features caption: Top.  A footnote.  (2).

TeX and _te\'i^`an_url\'_ AND it is @verb  a word !@ AE.

   ---------- Footnotes ----------

   (1) footnote Text with features

   (2) footnote Text with features caption

1 A chapter
***********

Float text of a float with a lot of features.

Text 1.1: An example of float caption...  2 An example 2.
     example 2

A table 2.
_truc 2_
     line 2

A multitable 2.
truc   bidule
2
truc   bidule
2
An index entry 2

An itemize 2.
   - truc 2 line

A ref 2.  *Note xref Text with features caption: Top.  A footnote 2.
(1).

TeX and _te\'i^`an_url\'_ AND it is @verb  a word !@ AE.

*Note text with a lot of features::.

   ---------- Footnotes ----------

   (1) footnote Text with features caption 2

';

1;
