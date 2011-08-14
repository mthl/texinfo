use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'multiple'} = {
  'contents' => [
    {
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
                  'text' => 'fr'
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
          'cmdname' => 'documentlanguage',
          'extra' => {
            'text_arg' => 'fr'
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
        },
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
              'cmdname' => 'defivar',
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
                          'text' => 'copying a b
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
                          'contents' => [
                            {
                              'parent' => {
                                'contents' => [],
                                'type' => 'bracketed'
                              },
                              'text' => 'Instance Variable'
                            }
                          ],
                          'parent' => undef,
                          'type' => 'bracketed_def_content'
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
                        'class',
                        {
                          'text' => 'copying'
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
                          'text' => 'a'
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
                          'text' => 'b'
                        }
                      ]
                    ],
                    'def_command' => 'defivar',
                    'def_parsed_hash' => {
                      'category' => {},
                      'class' => {},
                      'name' => {}
                    },
                    'index_entry' => {
                      'command' => {},
                      'content' => [
                        {},
                        {},
                        {
                          'parent' => {
                            'contents' => [],
                            'type' => 'root_line'
                          },
                          'text' => ' de '
                        },
                        {},
                        {}
                      ],
                      'in_code' => 1,
                      'index_at_command' => 'defivar',
                      'index_name' => 'vr',
                      'index_prefix' => 'v',
                      'key' => 'a de copying',
                      'number' => 1,
                      'region' => {}
                    },
                    'original_def_cmdname' => 'defivar'
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
                          'text' => 'defivar'
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
                    'command_argument' => 'defivar',
                    'text_arg' => 'defivar'
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 5,
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
                'line_nr' => 4,
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
                'line_nr' => 6,
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
          'cmdname' => 'defivar',
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
                      'text' => 'fr BBB CCC
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
                      'contents' => [],
                      'parent' => undef,
                      'type' => 'bracketed_def_content'
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
                    'class',
                    {
                      'text' => 'fr'
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
                      'text' => 'BBB'
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
                      'text' => 'CCC'
                    }
                  ]
                ],
                'def_command' => 'defivar',
                'def_parsed_hash' => {
                  'category' => {},
                  'class' => {},
                  'name' => {}
                },
                'index_entry' => {
                  'command' => {},
                  'content' => [
                    {},
                    {},
                    {
                      'parent' => {
                        'contents' => [],
                        'type' => 'root_line'
                      },
                      'text' => ' de '
                    },
                    {},
                    {}
                  ],
                  'in_code' => 1,
                  'index_at_command' => 'defivar',
                  'index_name' => 'vr',
                  'index_prefix' => 'v',
                  'key' => 'BBB de fr',
                  'node' => {},
                  'number' => 2
                },
                'original_def_cmdname' => 'defivar'
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
                      'text' => 'defivar'
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
                'command_argument' => 'defivar',
                'text_arg' => 'defivar'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 11,
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
                  'text' => 'pt'
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
          'cmdname' => 'documentlanguage',
          'extra' => {
            'text_arg' => 'pt'
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
          'cmdname' => 'defivar',
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
                      'text' => 'pt BBB CCC
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
                      'contents' => [],
                      'parent' => undef,
                      'type' => 'bracketed_def_content'
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
                    'class',
                    {
                      'text' => 'pt'
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
                      'text' => 'BBB'
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
                      'text' => 'CCC'
                    }
                  ]
                ],
                'def_command' => 'defivar',
                'def_parsed_hash' => {
                  'category' => {},
                  'class' => {},
                  'name' => {}
                },
                'index_entry' => {
                  'command' => {},
                  'content' => [
                    {},
                    {},
                    {
                      'parent' => {
                        'contents' => [],
                        'type' => 'root_line'
                      },
                      'text' => ' da '
                    },
                    {},
                    {}
                  ],
                  'in_code' => 1,
                  'index_at_command' => 'defivar',
                  'index_name' => 'vr',
                  'index_prefix' => 'v',
                  'key' => 'BBB da pt',
                  'node' => {},
                  'number' => 3
                },
                'original_def_cmdname' => 'defivar'
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
                      'text' => 'defivar'
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
                'command_argument' => 'defivar',
                'text_arg' => 'defivar'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 18,
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
            'line_nr' => 17,
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
          'cmdname' => 'insertcopying',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
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
        'line_nr' => 8,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'multiple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'extra'}{'command'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'}[0]{'parent'}{'contents'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'};
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'region'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'command'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[2];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[2];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'extra'}{'command'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'extra'}{'end_command'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[2];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'multiple'}{'contents'}[0];
$result_trees{'multiple'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'multiple'}{'contents'}[0];
$result_trees{'multiple'}{'contents'}[0]{'parent'} = $result_trees{'multiple'};
$result_trees{'multiple'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'};
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'node'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'command'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[6];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[6]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[6]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[6]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[6];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'multiple'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'};
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'extra'}{'index_entry'}{'node'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[0];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'extra'}{'command'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'extra'}{'end_command'} = $result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'contents'}[11]{'parent'} = $result_trees{'multiple'}{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'multiple'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'multiple'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'multiple'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'multiple'}{'contents'}[1]{'parent'} = $result_trees{'multiple'};

$result_texis{'multiple'} = '@documentlanguage fr

@copying
@defivar copying a b
@end defivar
@end copying

@node Top

@defivar fr BBB CCC
@end defivar

@insertcopying

@documentlanguage pt

@defivar pt BBB CCC
@end defivar

@insertcopying
';


$result_texts{'multiple'} = '


Instance Variable of fr: BBB CCC




Instance Variable of pt: BBB CCC


';

$result_sectioning{'multiple'} = {};

$result_nodes{'multiple'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
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

$result_menus{'multiple'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'multiple'} = [];



$result_converted{'plaintext'}->{'multiple'} = ' -- Instance Variable de fr: BBB CCC

 -- Instance Variable de copying: a b

 -- Instance Variable da pt: BBB CCC

 -- Instance Variable da copying: a b
';


$result_converted{'info'}->{'multiple'} = 'This is , produced by makeinfo version 4.13 from .

 -- Instance Variable de copying: a b


File: ,  Node: Top,  Up: (dir)

 -- Instance Variable de fr: BBB CCC

 -- Instance Variable de copying: a b

 -- Instance Variable da pt: BBB CCC

 -- Instance Variable da copying: a b


Tag Table:
Node: Top91

End Tag Table
';

1;
