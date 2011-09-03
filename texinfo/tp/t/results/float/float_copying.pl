use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'float_copying'} = {
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
                      'text' => 'Copyright notice'
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
                      'text' => 'public domain'
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
                      'text' => 'Public domain is not really a licence, as it means than
'
                    },
                    {
                      'parent' => {},
                      'text' => 'the author abandon his copyright.
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
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'The Public Domain notice'
                            },
                            {
                              'args' => [
                                {
                                  'contents' => [
                                    {
                                      'parent' => {},
                                      'text' => '
',
                                      'type' => 'empty_spaces_before_argument'
                                    },
                                    {
                                      'contents' => [
                                        {
                                          'parent' => {},
                                          'text' => 'The caption copying footnote
'
                                        },
                                        {
                                          'args' => [
                                            {
                                              'contents' => [
                                                {
                                                  'parent' => {},
                                                  'text' => 'caption copying footnote anchor'
                                                }
                                              ],
                                              'extra' => {
                                                'region' => {}
                                              },
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
                                            'normalized' => 'caption-copying-footnote-anchor'
                                          },
                                          'line_nr' => {
                                            'file_name' => '',
                                            'line_nr' => 10,
                                            'macro' => ''
                                          },
                                          'parent' => {}
                                        },
                                        {
                                          'text' => '
',
                                          'type' => 'empty_spaces_after_close_brace'
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
                                              'extra' => {
                                                'command' => {}
                                              },
                                              'parent' => {},
                                              'text' => ' ',
                                              'type' => 'empty_spaces_after_command'
                                            },
                                            {
                                              'parent' => {},
                                              'text' => 'indexed caption copying footnote'
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
                                          'content_normalized' => [],
                                          'in_code' => 0,
                                          'index_at_command' => 'cindex',
                                          'index_name' => 'cp',
                                          'index_prefix' => 'c',
                                          'key' => 'indexed caption copying footnote',
                                          'number' => 1,
                                          'region' => {}
                                        },
                                        'misc_content' => []
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
                                              'extra' => {
                                                'command' => {}
                                              },
                                              'parent' => {},
                                              'text' => ' ',
                                              'type' => 'empty_spaces_after_command'
                                            },
                                            {
                                              'parent' => {},
                                              'text' => 'public domain function'
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
                                          'content_normalized' => [],
                                          'in_code' => 1,
                                          'index_at_command' => 'findex',
                                          'index_name' => 'fn',
                                          'index_prefix' => 'f',
                                          'key' => 'public domain function',
                                          'number' => 1,
                                          'region' => {}
                                        },
                                        'misc_content' => []
                                      },
                                      'line_nr' => {
                                        'file_name' => '',
                                        'line_nr' => 13,
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
                                          'text' => 'see '
                                        },
                                        {
                                          'args' => [
                                            {
                                              'contents' => [
                                                {
                                                  'parent' => {},
                                                  'text' => 'Copying and floats'
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
                                                      'text' => 'Copying and floats'
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
                                                    'normalized' => 'Copying-and-floats'
                                                  }
                                                ],
                                                'normalized' => 'Copying-and-floats'
                                              },
                                              'line_nr' => {
                                                'file_name' => '',
                                                'line_nr' => 35,
                                                'macro' => ''
                                              },
                                              'parent' => {}
                                            },
                                            'node_argument' => {
                                              'node_content' => [
                                                {}
                                              ],
                                              'normalized' => 'Copying-and-floats'
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
                                  'parent' => {},
                                  'type' => 'brace_command_context'
                                }
                              ],
                              'cmdname' => 'footnote',
                              'contents' => [],
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
                                  'text' => 'public domain anchor'
                                }
                              ],
                              'extra' => {
                                'region' => {}
                              },
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
                            'normalized' => 'public-domain-anchor'
                          },
                          'line_nr' => {
                            'file_name' => '',
                            'line_nr' => 19,
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
                                  'text' => 'indexed caption'
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
                              'content_normalized' => [],
                              'in_code' => 0,
                              'index_at_command' => 'cindex',
                              'index_name' => 'cp',
                              'index_prefix' => 'c',
                              'key' => 'indexed caption',
                              'number' => 2,
                              'region' => {}
                            },
                            'misc_content' => []
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
                                  'extra' => {
                                    'command' => {}
                                  },
                                  'parent' => {},
                                  'text' => ' ',
                                  'type' => 'empty_spaces_after_command'
                                },
                                {
                                  'parent' => {},
                                  'text' => 'indexed caption function'
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
                              'content_normalized' => [],
                              'in_code' => 1,
                              'index_at_command' => 'findex',
                              'index_name' => 'fn',
                              'index_prefix' => 'f',
                              'key' => 'indexed caption function',
                              'number' => 2,
                              'region' => {}
                            },
                            'misc_content' => []
                          },
                          'line_nr' => {
                            'file_name' => '',
                            'line_nr' => 21,
                            'macro' => ''
                          },
                          'parent' => {}
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
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'text' => '
',
                  'type' => 'empty_spaces_after_close_brace'
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
                    'line_nr' => 23,
                    'macro' => ''
                  },
                  'parent' => {}
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
                'end_command' => {},
                'node_content' => [
                  {}
                ],
                'normalized' => 'public-domain',
                'type' => {
                  'content' => [
                    {}
                  ],
                  'normalized' => 'Copyright-notice'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 3,
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
      'cmdname' => 'top',
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
                      'text' => 'Copying and floats'
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
                  'normalized' => 'Copying-and-floats'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 32,
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
                'line_nr' => 33,
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
            'line_nr' => 31,
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
      'level' => 0,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 27,
        'macro' => ''
      },
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
              'parent' => {},
              'text' => 'Copying and floats'
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
      'cmdname' => 'appendix',
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
                  'text' => 'Copyright notice'
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
              'normalized' => 'Copyright-notice'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 41,
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
                  'text' => 'cp'
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
              'cp'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 43,
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
            'line_nr' => 44,
            'macro' => ''
          },
          'parent' => {}
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
        'line_nr' => 36,
        'macro' => ''
      },
      'number' => 'A',
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'extra'}{'region'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'content'};
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'region'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'extra'}{'misc_content'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'content'};
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'extra'}{'index_entry'}{'command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'extra'}{'index_entry'}{'content'};
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'extra'}{'index_entry'}{'region'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'extra'}{'misc_content'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'extra'}{'index_entry'}{'content'};
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'};
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'};
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'extra'}{'node_content'}[0] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'extra'}{'node_content'};
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'} = $result_trees{'float_copying'};
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0]{'extra'}{'region'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[2]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'extra'}{'index_entry'}{'command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'extra'}{'index_entry'}{'content'};
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'extra'}{'index_entry'}{'region'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'extra'}{'misc_content'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'extra'}{'index_entry'}{'content'};
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'extra'}{'index_entry'}{'command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'extra'}{'index_entry'}{'content'};
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'extra'}{'index_entry'}{'region'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'extra'}{'misc_content'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'extra'}{'index_entry'}{'content'};
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'extra'}{'float'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'line_nr'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[5];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[5]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[5]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[5]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[5];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[5]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'caption'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'end_command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[5];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'type'}{'content'}[0] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[0]{'parent'} = $result_trees{'float_copying'};
$result_trees{'float_copying'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'float_copying'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'float_copying'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'float_copying'}{'contents'}[1]{'parent'} = $result_trees{'float_copying'};
$result_trees{'float_copying'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'float_copying'}{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[1];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[3];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[3];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'extra'}{'end_command'} = $result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'float_copying'}{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'float_copying'}{'contents'}[2];
$result_trees{'float_copying'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'float_copying'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[2]{'parent'} = $result_trees{'float_copying'};
$result_trees{'float_copying'}{'contents'}[3] = $result_trees{'float_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'};
$result_trees{'float_copying'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[4]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[4]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[4]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'float_copying'}{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'float_copying'}{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'float_copying'}{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[6]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[6];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[6]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[6]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[6]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[6];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[6]{'extra'}{'type'}{'content'}[0] = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[6]{'parent'} = $result_trees{'float_copying'}{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[7]{'parent'} = $result_trees{'float_copying'}{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[8]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[8];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[8]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[8]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[8]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[8];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[8]{'parent'} = $result_trees{'float_copying'}{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[9]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[9];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[9]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[9]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[9]{'args'}[0];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'float_copying'}{'contents'}[4]{'contents'}[9];
$result_trees{'float_copying'}{'contents'}[4]{'contents'}[9]{'parent'} = $result_trees{'float_copying'}{'contents'}[4];
$result_trees{'float_copying'}{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'float_copying'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'float_copying'}{'contents'}[4]{'parent'} = $result_trees{'float_copying'};

$result_texis{'float_copying'} = '@copying

@float Copyright notice, public domain

Public domain is not really a licence, as it means than
the author abandon his copyright.

@caption{The Public Domain notice@footnote{
The caption copying footnote
@anchor{caption copying footnote anchor}

@cindex indexed caption copying footnote
@findex public domain function

see @ref{Copying and floats}.

}

@anchor{public domain anchor}
@cindex indexed caption
@findex indexed caption function
}
@end float
@end copying

@node Top
@top Top

@insertcopying

@menu
* Copying and floats::
@end menu

@node Copying and floats
@appendix Copying and floats

@insertcopying
@insertcopying

@listoffloats Copyright notice

@printindex cp
@printindex fn
';


$result_texts{'float_copying'} = '
Top
***



* Copying and floats::

Appendix A Copying and floats
*****************************





';

$result_sectioning{'float_copying'} = {
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
          'cmdname' => 'appendix',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'Copying-and-floats'
              }
            }
          },
          'level' => 1,
          'number' => 'A',
          'section_up' => {},
          'toplevel_prev' => {}
        }
      ],
      'section_up' => {}
    }
  ]
};
$result_sectioning{'float_copying'}{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'float_copying'}{'section_childs'}[0];
$result_sectioning{'float_copying'}{'section_childs'}[0]{'section_childs'}[0]{'toplevel_prev'} = $result_sectioning{'float_copying'}{'section_childs'}[0];
$result_sectioning{'float_copying'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'float_copying'};

$result_nodes{'float_copying'} = {
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
        'cmdname' => 'appendix',
        'extra' => {},
        'level' => 1,
        'number' => 'A'
      },
      'normalized' => 'Copying-and-floats'
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
$result_nodes{'float_copying'}{'menu_child'}{'node_prev'} = $result_nodes{'float_copying'};
$result_nodes{'float_copying'}{'menu_child'}{'node_up'} = $result_nodes{'float_copying'};
$result_nodes{'float_copying'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'float_copying'}{'menus'}[0];
$result_nodes{'float_copying'}{'node_next'} = $result_nodes{'float_copying'}{'menu_child'};
$result_nodes{'float_copying'}{'node_up'}{'extra'}{'top_node_up'} = $result_nodes{'float_copying'};

$result_menus{'float_copying'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'Copying-and-floats'
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'float_copying'}{'menu_child'}{'menu_up'} = $result_menus{'float_copying'};

$result_errors{'float_copying'} = [];


$result_floats{'float_copying'} = {
  'Copyright-notice' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'end_command' => {
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'float',
            'text_arg' => 'float'
          }
        },
        'normalized' => 'public-domain',
        'type' => {
          'content' => [
            {
              'text' => 'Copyright notice'
            }
          ],
          'normalized' => 'Copyright-notice'
        }
      },
      'number' => 1
    }
  ]
};
$result_floats{'float_copying'}{'Copyright-notice'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'float_copying'}{'Copyright-notice'}[0];
$result_floats{'float_copying'}{'Copyright-notice'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_floats{'float_copying'}{'Copyright-notice'}[0];



$result_converted{'plaintext'}->{'float_copying'} = 'Top
***

Public domain is not really a licence, as it means than the author
abandon his copyright.

Copyright notice 1: The Public Domain notice(1)

* Menu:

* Copying and floats::

   ---------- Footnotes ----------

   (1) The caption copying footnote

   see *note Copying and floats::.

Appendix A Copying and floats
*****************************

Public domain is not really a licence, as it means than the author
abandon his copyright.

Copyright notice 1: The Public Domain notice(1)

Public domain is not really a licence, as it means than the author
abandon his copyright.

Copyright notice 1: The Public Domain notice(2)

* Menu:

* Copyright notice 1: public domain.     The Public Domain notice(2)

   ---------- Footnotes ----------

   (1) The caption copying footnote

   see *note Copying and floats::.

   (2) The caption copying footnote

   see *note Copying and floats::.

';


$result_converted{'info'}->{'float_copying'} = 'This is , produced by makeinfo version 4.13 from .

Public domain is not really a licence, as it means than the author
abandon his copyright.

Copyright notice 1: The Public Domain notice(1)

   ---------- Footnotes ----------

   (1) The caption copying footnote

   see *note Copying and floats::.


File: ,  Node: Top,  Next: Copying and floats,  Up: (dir)

Top
***

Public domain is not really a licence, as it means than the author
abandon his copyright.

Copyright notice 1: The Public Domain notice(1)

* Menu:

* Copying and floats::

   ---------- Footnotes ----------

   (1) The caption copying footnote

   see *note Copying and floats::.


File: ,  Node: Copying and floats,  Prev: Top,  Up: Top

Appendix A Copying and floats
*****************************

Public domain is not really a licence, as it means than the author
abandon his copyright.

Copyright notice 1: The Public Domain notice(1)

Public domain is not really a licence, as it means than the author
abandon his copyright.

Copyright notice 1: The Public Domain notice(2)

* Menu:

* Copyright notice 1: public domain.     The Public Domain notice(2)

 [index ]
* Menu:

* indexed caption:                       Copying and floats.   (line 16)
* indexed caption copying footnote:      Top.                  (line 19)

 [index ]
* Menu:

* indexed caption function:              Copying and floats.   (line 16)
* public domain function:                Top.                  (line 19)

   ---------- Footnotes ----------

   (1) The caption copying footnote

   see *note Copying and floats::.

   (2) The caption copying footnote

   see *note Copying and floats::.



Tag Table:
Node: Top301
Ref: public domain371
Ref: public domain anchor511
Ref: Top-Footnote-1580
Ref: caption copying footnote anchor615
Node: Copying and floats653
Ref: Copying and floats-Footnote-11504
Ref: Copying and floats-Footnote-21577

End Tag Table
';

$result_converted_errors{'info'}->{'float_copying'} = [
  {
    'file_name' => '',
    'error_line' => ':3: @float `public domain\' output more than once
',
    'text' => '@float `public domain\' output more than once',
    'type' => 'error',
    'macro' => '',
    'line_nr' => 3
  },
  {
    'file_name' => '',
    'error_line' => ':19: @anchor `public domain anchor\' output more than once
',
    'text' => '@anchor `public domain anchor\' output more than once',
    'type' => 'error',
    'macro' => '',
    'line_nr' => 19
  },
  {
    'file_name' => '',
    'error_line' => ':3: @float `public domain\' output more than once
',
    'text' => '@float `public domain\' output more than once',
    'type' => 'error',
    'macro' => '',
    'line_nr' => 3
  },
  {
    'file_name' => '',
    'error_line' => ':19: @anchor `public domain anchor\' output more than once
',
    'text' => '@anchor `public domain anchor\' output more than once',
    'type' => 'error',
    'macro' => '',
    'line_nr' => 19
  },
  {
    'file_name' => '',
    'error_line' => ':10: @anchor `caption copying footnote anchor\' output more than once
',
    'text' => '@anchor `caption copying footnote anchor\' output more than once',
    'type' => 'error',
    'macro' => '',
    'line_nr' => 10
  },
  {
    'file_name' => '',
    'error_line' => ':10: @anchor `caption copying footnote anchor\' output more than once
',
    'text' => '@anchor `caption copying footnote anchor\' output more than once',
    'type' => 'error',
    'macro' => '',
    'line_nr' => 10
  }
];


1;
