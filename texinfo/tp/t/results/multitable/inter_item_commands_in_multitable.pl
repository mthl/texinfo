use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'inter_item_commands_in_multitable'} = {
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
          'contents' => [
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' comment before first item
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
            }
          ],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'contents' => [
            {
              'cmdname' => 'item',
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'truc
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
                          'extra' => {
                            'command' => {}
                          },
                          'parent' => {},
                          'text' => ' ',
                          'type' => 'empty_spaces_after_command'
                        },
                        {
                          'parent' => {},
                          'text' => 'index entry between empty lines'
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
                      'key' => 'index entry between empty lines',
                      'number' => 1
                    },
                    'misc_content' => []
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
                'cell_number' => 1
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
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'trouc
'
                    },
                    {
                      'args' => [
                        {
                          'parent' => {},
                          'text' => ' last comment
',
                          'type' => 'misc_arg'
                        }
                      ],
                      'cmdname' => 'c',
                      'parent' => {}
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
            }
          ],
          'extra' => {
            'row_number' => 2
          },
          'parent' => {},
          'type' => 'row'
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
                  'text' => 'multitable'
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
            'command_argument' => 'multitable',
            'text_arg' => 'multitable'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 10,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {},
        'max_columns' => 1,
        'prototypes' => [
          {
            'contents' => [],
            'parent' => {},
            'type' => 'bracketed_multitable_prototype'
          }
        ]
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
                      'extra' => {
                        'command' => {}
                      },
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => '0.6 0.4'
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
              'cmdname' => 'columnfractions',
              'extra' => {
                'misc_args' => [
                  '0.6',
                  '0.4'
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 12,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'multitable',
      'contents' => [
        {
          'contents' => [
            {
              'cmdname' => 'headitem',
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'mu--ltitable headitem '
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
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'another tab
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
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'mu--ltitable item '
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
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'multitable tab
'
                    },
                    {
                      'args' => [
                        {
                          'parent' => {},
                          'text' => ' comment in multitable
',
                          'type' => 'misc_arg'
                        }
                      ],
                      'cmdname' => 'c',
                      'parent' => {}
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
        },
        {
          'contents' => [
            {
              'cmdname' => 'item',
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'mu--ltitable item 2 '
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
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'multitable tab 2
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
                              'parent' => {},
                              'text' => 'index entry within multitable'
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
                          'key' => 'index entry within multitable',
                          'number' => 2
                        },
                        'misc_content' => []
                      },
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 17,
                        'macro' => ''
                      },
                      'parent' => {}
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
            'row_number' => 3
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
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'lone mu--ltitable item
'
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
            }
          ],
          'extra' => {
            'row_number' => 4
          },
          'parent' => {},
          'type' => 'row'
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
                  'text' => 'multitable'
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
            'command_argument' => 'multitable',
            'text_arg' => 'multitable'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 19,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'columnfractions' => [],
        'end_command' => {},
        'max_columns' => 2
      },
      'line_nr' => {},
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'extra'}{'misc_content'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'content'};
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[2];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[3];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[3];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[3]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'contents'}[3];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'extra'}{'prototypes'}[0]{'contents'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'extra'}{'prototypes'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'};
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'};
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'misc_content'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'content'};
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[3]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[3]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[3]{'contents'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[3];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[4];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[4];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[4]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'extra'}{'columnfractions'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'extra'}{'misc_args'};
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'extra'}{'end_command'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'contents'}[4];
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'line_nr'} = $result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'inter_item_commands_in_multitable'}{'contents'}[2]{'parent'} = $result_trees{'inter_item_commands_in_multitable'};

$result_texis{'inter_item_commands_in_multitable'} = '@multitable {truc}
@c comment before first item

@item truc

@cindex index entry between empty lines

@item trouc
@c last comment
@end multitable

@multitable @columnfractions 0.6 0.4
@headitem mu--ltitable headitem @tab another tab
@item mu--ltitable item @tab multitable tab
@c comment in multitable
@item mu--ltitable item 2 @tab multitable tab 2
@cindex index entry within multitable
@item lone mu--ltitable item
@end multitable
';


$result_texts{'inter_item_commands_in_multitable'} = '
truc


trouc

mu--ltitable headitem another tab
mu--ltitable item multitable tab
mu--ltitable item 2 multitable tab 2
lone mu--ltitable item
';

$result_errors{'inter_item_commands_in_multitable'} = [
  {
    'error_line' => ':6: Entry for index `cp\' outside of any node
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => 'Entry for index `cp\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':17: Entry for index `cp\' outside of any node
',
    'file_name' => '',
    'line_nr' => 17,
    'macro' => '',
    'text' => 'Entry for index `cp\' outside of any node',
    'type' => 'error'
  }
];



$result_converted{'plaintext'}->{'inter_item_commands_in_multitable'} = 'truc

trouc

mu-ltitable headitem                        another tab
--------------------------------------------------------------------------
mu-ltitable item                            multitable tab
mu-ltitable item 2                          multitable tab 2
lone mu-ltitable item
';

1;
