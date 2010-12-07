use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'some_at_commands_in_ref_nodes'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
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
                      'text' => 'A '
                    },
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'sc'
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
                      'text' => ' node '
                    },
                    {
                      'args' => [
                        {
                          'parent' => {},
                          'text' => 'i'
                        }
                      ],
                      'cmdname' => '"',
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
                      'cmdname' => '"',
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
                              'args' => [
                                {
                                  'parent' => {},
                                  'text' => 'E'
                                }
                              ],
                              'cmdname' => '=',
                              'parent' => {}
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => '`',
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
                          'contents' => [],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'l',
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
                              'args' => [
                                {
                                  'parent' => {},
                                  'text' => 'C'
                                }
                              ],
                              'cmdname' => '\'',
                              'parent' => {}
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => ',',
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
                          'contents' => [],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'exclamdown',
                      'contents' => [],
                      'parent' => {}
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
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {}
                  ],
                  'normalized' => 'A-SC-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 6,
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
      'level' => 0,
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'A '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'sc'
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
              'text' => ' node '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => 'i'
                }
              ],
              'cmdname' => '"',
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
              'cmdname' => '"',
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
                      'args' => [
                        {
                          'parent' => {},
                          'text' => 'E'
                        }
                      ],
                      'cmdname' => '=',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => '`',
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
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'l',
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
                      'args' => [
                        {
                          'parent' => {},
                          'text' => 'C'
                        }
                      ],
                      'cmdname' => '\'',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => ',',
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
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'exclamdown',
              'contents' => [],
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
      'cmdname' => 'node',
      'contents' => [],
      'extra' => {
        'node_content' => [
          {},
          {},
          {},
          {},
          {},
          {},
          {},
          {},
          {},
          {},
          {},
          {},
          {},
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'A-SC-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1'
          }
        ],
        'normalized' => 'A-SC-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 9,
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
              'text' => 'A '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'sc'
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
              'text' => ' node '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => 'i'
                }
              ],
              'cmdname' => '"',
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
              'cmdname' => '"',
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
                      'args' => [
                        {
                          'parent' => {},
                          'text' => 'E'
                        }
                      ],
                      'cmdname' => '=',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => '`',
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
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'l',
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
                      'args' => [
                        {
                          'parent' => {},
                          'text' => 'C'
                        }
                      ],
                      'cmdname' => '\'',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => ',',
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
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'exclamdown',
              'contents' => [],
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
                      'text' => 'a '
                    },
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'strong'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'strong',
                      'contents' => [],
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => ' ref with '
                    },
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'sc'
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
                      'args' => [
                        {
                          'contents' => [],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'comma',
                      'contents' => [],
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => ' a i trema '
                    },
                    {
                      'args' => [
                        {
                          'parent' => {},
                          'text' => 'i'
                        }
                      ],
                      'cmdname' => '"',
                      'parent' => {}
                    },
                    {
                      'args' => [
                        {
                          'contents' => [],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'comma',
                      'contents' => [],
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => ' a dotless i trema '
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
                      'cmdname' => '"',
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
                              'args' => [
                                {
                                  'parent' => {},
                                  'text' => 'E'
                                }
                              ],
                              'cmdname' => '=',
                              'parent' => {}
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => '`',
                      'contents' => [],
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => ' and exclamdown '
                    },
                    {
                      'args' => [
                        {
                          'contents' => [],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'exclamdown',
                      'contents' => [],
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
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {}
                  ],
                  undef,
                  undef,
                  [
                    {}
                  ]
                ]
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
              'text' => '.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
          {},
          {},
          {},
          {},
          {},
          {},
          {},
          {}
        ]
      },
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 10,
        'macro' => ''
      },
      'number' => 1,
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[1]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'};
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[3];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[3]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[4]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[5]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[5]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[5]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[5]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[5];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[5]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[6]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[7];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[7]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[8]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[9];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[9]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[10]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[11]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[11]{'args'}[0]{'contents'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[11]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[11];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[11]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[12]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[13];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[13]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[1] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[2] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[2];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[3] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[3];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[4] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[4];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[5] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[5];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[6] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[6];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[7] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[7];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[8] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[8];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[9] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[9];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[10] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[10];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[11] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[11];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[12] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[12];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[13] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[13];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[2]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'};
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[4];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[6];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[8];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[10];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[12]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[12]{'args'}[0]{'contents'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[12]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[12];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[13]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[14];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[14]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[15]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'node_content'}[1] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'node_content'}[2] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[3];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'node_content'}[3] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[4];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'node_content'}[4] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[5];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'node_content'}[5] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[6];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'node_content'}[6] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[7];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'node_content'}[7] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[8];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'node_content'}[8] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[9];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'node_content'}[9] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[10];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'node_content'}[10] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[11];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'node_content'}[11] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[12];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'node_content'}[12] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[13];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'node_content'}[13] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[14];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'extra'}{'node_content'};
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[3]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'};
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[4];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[6];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[8];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[10];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[12]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[12]{'args'}[0]{'contents'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[12]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[12];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[13]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[14];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[14]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[15]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[4];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[6];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[7];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[9];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[11]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[11]{'args'}[0]{'contents'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[11]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[11];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[13];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[13]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][1] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][2] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][3] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][4] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[4];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][5] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[5];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][6] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[6];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][7] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[7];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][8] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[8];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][9] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[9];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][10] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[10];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][11] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[11];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][12] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[12];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][13] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[13];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'extra'}{'misc_content'}[1] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'extra'}{'misc_content'}[2] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[3];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'extra'}{'misc_content'}[3] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[4];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'extra'}{'misc_content'}[4] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[5];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'extra'}{'misc_content'}[5] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[6];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'extra'}{'misc_content'}[6] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[7];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'extra'}{'misc_content'}[7] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[8];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'extra'}{'misc_content'}[8] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[9];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'extra'}{'misc_content'}[9] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[10];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'extra'}{'misc_content'}[10] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[11];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'extra'}{'misc_content'}[11] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[12];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'extra'}{'misc_content'}[12] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[13];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'extra'}{'misc_content'}[13] = $result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[14];
$result_trees{'some_at_commands_in_ref_nodes'}{'contents'}[4]{'parent'} = $result_trees{'some_at_commands_in_ref_nodes'};

$result_texis{'some_at_commands_in_ref_nodes'} = '
@node Top
@top Top

@menu
* A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}::
@end menu

@node A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}
@chapter  A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}

see @ref{a @strong{strong} ref with @sc{sc}@comma{} a i trema @"i@comma{} a dotless i trema @"{@dotless{i}} @`{@=E} and exclamdown @exclamdown{},,,manual}.
';


$result_texts{'some_at_commands_in_ref_nodes'} = '
Top
***

* A sc node i" i" E=` /l C\', !::

1 A sc node i" i" E=` /l C\', !
******************************

see .
';

$result_sectioning{'some_at_commands_in_ref_nodes'} = {
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
                'normalized' => 'A-SC-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1'
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
$result_sectioning{'some_at_commands_in_ref_nodes'}{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'some_at_commands_in_ref_nodes'}{'section_childs'}[0];
$result_sectioning{'some_at_commands_in_ref_nodes'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'some_at_commands_in_ref_nodes'};

$result_nodes{'some_at_commands_in_ref_nodes'} = {
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
      'normalized' => 'A-SC-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1'
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
    'extra' => {},
    'manual_content' => [
      {
        'text' => 'dir'
      }
    ]
  }
};
$result_nodes{'some_at_commands_in_ref_nodes'}{'menu_child'}{'node_prev'} = $result_nodes{'some_at_commands_in_ref_nodes'};
$result_nodes{'some_at_commands_in_ref_nodes'}{'menu_child'}{'node_up'} = $result_nodes{'some_at_commands_in_ref_nodes'};
$result_nodes{'some_at_commands_in_ref_nodes'}{'node_next'} = $result_nodes{'some_at_commands_in_ref_nodes'}{'menu_child'};

$result_menus{'some_at_commands_in_ref_nodes'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'A-SC-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1'
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'some_at_commands_in_ref_nodes'}{'menu_child'}{'menu_up'} = $result_menus{'some_at_commands_in_ref_nodes'};

$result_errors{'some_at_commands_in_ref_nodes'} = [];


1;
