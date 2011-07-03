use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements);

use utf8;

$result_trees{'formats_in_menu'} = {
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
                      'text' => '(gcc)'
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
                      'text' => 'text
'
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
                      'cmdname' => 'table',
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
                                  'text' => 'item'
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
                              'text' => '* table line::
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'table_item'
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
                                  'text' => 'table'
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
                            'command_argument' => 'table',
                            'text_arg' => 'table'
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
                        'line_nr' => 5,
                        'macro' => ''
                      },
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'manual_content' => [
                    {
                      'parent' => {},
                      'text' => 'gcc'
                    }
                  ]
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
                      'text' => '(info)'
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
                    },
                    {
                      'cmdname' => 'verbatim',
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
                          'text' => 'some @ verb{x atim
',
                          'type' => 'raw'
                        },
                        {
                          'parent' => {},
                          'text' => '* texinfo:: in @ verbatim
',
                          'type' => 'raw'
                        }
                      ],
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 11,
                        'macro' => ''
                      },
                      'parent' => {}
                    },
                    {
                      'extra' => {
                        'command' => {}
                      },
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line_after_command'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'manual_content' => [
                    {
                      'parent' => {},
                      'text' => 'info'
                    }
                  ]
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
                      'text' => '(manual2)'
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
                      'text' => '%
'
                    },
                    {
                      'cmdname' => 'html',
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
                          'type' => 'raw'
                        },
                        {
                          'parent' => {},
                          'text' => '<i></i>
',
                          'type' => 'raw'
                        }
                      ],
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 16,
                        'macro' => ''
                      },
                      'parent' => {}
                    },
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
                      'text' => 'Log$
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
                  'manual_content' => [
                    {
                      'parent' => {},
                      'text' => 'manual2'
                    }
                  ]
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
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '(truc)'
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
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'description
'
                            },
                            {
                              'parent' => {},
                              'text' => '* acronym::'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'acronym',
                      'contents' => [],
                      'extra' => {
                        'brace_command_contents' => [
                          [
                            {},
                            {}
                          ]
                        ],
                        'normalized' => 'description-_002a-acronym_003a_003a'
                      },
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 21,
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
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'manual_content' => [
                    {
                      'parent' => {},
                      'text' => 'truc'
                    }
                  ]
                }
              },
              'line_nr' => {},
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
                },
                {
                  'cmdname' => 'example',
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '* subsubsection::
'
                        },
                        {
                          'parent' => {},
                          'text' => 'Menu comment
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
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
                              'text' => 'example'
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
                        'command_argument' => 'example',
                        'text_arg' => 'example'
                      },
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 27,
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
                  'contents' => [
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
                'line_nr' => 29,
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
    }
  ],
  'type' => 'document_root'
};
$result_trees{'formats_in_menu'}{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'};
$result_trees{'formats_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'formats_in_menu'}{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'extra'}{'misc_content'}[0] = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'extra'}{'command_as_argument'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[2]{'extra'}{'command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'extra'}{'menu_entry_description'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[2]{'extra'}{'command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[3]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'extra'}{'menu_entry_description'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][1] = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'extra'}{'menu_entry_description'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'line_nr'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[0]{'line_nr'};
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[2];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[2];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'contents'}[2];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[7];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[7];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'extra'}{'command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[7];
$result_trees{'formats_in_menu'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'}{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'formats_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'formats_in_menu'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'formats_in_menu'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'formats_in_menu'}{'contents'}[1]{'parent'} = $result_trees{'formats_in_menu'};

$result_texis{'formats_in_menu'} = '@node Top

@menu
* (gcc):: text
@table @asis
@item item
* table line::
@end table

* (info)::
@verbatim
some @ verb{x atim
* texinfo:: in @ verbatim
@end verbatim
* (manual2):: %
@html

<i></i>
@end html
Log$
* (truc):: @acronym{description
* acronym::}

@example
* subsubsection::
Menu comment
@end example

@end menu
';


$result_texts{'formats_in_menu'} = '
* (gcc):: text
item
* table line::

* (info)::
some @ verb{x atim
* texinfo:: in @ verbatim
* (manual2):: %
Log$
* (truc):: description
* acronym::

* subsubsection::
Menu comment

';

$result_sectioning{'formats_in_menu'} = {};

$result_nodes{'formats_in_menu'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'gcc'
        }
      ]
    }
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
$result_nodes{'formats_in_menu'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'formats_in_menu'}{'menus'}[0];
$result_nodes{'formats_in_menu'}{'node_next'} = $result_nodes{'formats_in_menu'}{'menu_child'};

$result_menus{'formats_in_menu'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'gcc'
        }
      ]
    }
  }
};

$result_errors{'formats_in_menu'} = [];



$result_converted{'plaintext'}->{'formats_in_menu'} = '* Menu:

* (gcc):: text
item
* table line::

* (info)::
some @ verb{x atim
* texinfo:: in @ verbatim
* (manual2):: %
Log$
* (truc):: description
* acronym::

     * subsubsection::
     Menu comment

';

1;
