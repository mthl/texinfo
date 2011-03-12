use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'in_table'} = {
  'contents' => [
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
              'cmdname' => 'xref',
              'extra' => {
                'invalid_nesting' => 1
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 1,
                'macro' => ''
              },
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
            'line_nr' => 2,
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
      'line_nr' => {},
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'cmdname' => 'code',
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'cmdname' => 'indent',
                  'extra' => {
                    'invalid_nesting' => 1
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
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in titlefont'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'titlefont',
                  'contents' => [],
                  'extra' => {
                    'brace_command_contents' => [
                      [
                        {}
                      ]
                    ],
                    'invalid_nesting' => 1
                  },
                  'line_nr' => {},
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
                          'text' => 'in anchor'
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
                    'invalid_nesting' => 1,
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'in-anchor'
                  },
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'footnote'
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
                  'extra' => {
                    'invalid_nesting' => 1
                  },
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'spaces_at_end'
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
                          'text' => 'exdent'
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
                  'cmdname' => 'exdent',
                  'extra' => {
                    'invalid_nesting' => 1,
                    'misc_content' => [
                      {}
                    ]
                  },
                  'line_nr' => {},
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'item',
          'extra' => {
            'misc_content' => [
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
          'parent' => {}
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'in item'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'footnote in item'
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
                'line_nr' => 6,
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
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
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
                          'text' => 'title
'
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
                      undef
                    ],
                    'invalid_nesting' => 1
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 7,
                    'macro' => ''
                  },
                  'parent' => {},
                  'remaining_args' => 2
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
              'text' => 'long title
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
            'line_nr' => 9,
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
        'line_nr' => 4,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'in_table'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[0]{'args'}[0];
$result_trees{'in_table'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'in_table'}{'contents'}[0]{'args'}[0];
$result_trees{'in_table'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'in_table'}{'contents'}[0]{'args'}[0];
$result_trees{'in_table'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[0];
$result_trees{'in_table'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'in_table'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'in_table'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'in_table'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'in_table'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'in_table'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[0]{'contents'}[0];
$result_trees{'in_table'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'in_table'}{'contents'}[0];
$result_trees{'in_table'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[0];
$result_trees{'in_table'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'in_table'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'in_table'}{'contents'}[0]{'extra'}{'command_as_argument'} = $result_trees{'in_table'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'in_table'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'in_table'}{'contents'}[0]{'contents'}[0];
$result_trees{'in_table'}{'contents'}[0]{'line_nr'} = $result_trees{'in_table'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'in_table'}{'contents'}[0]{'parent'} = $result_trees{'in_table'};
$result_trees{'in_table'}{'contents'}[1]{'parent'} = $result_trees{'in_table'};
$result_trees{'in_table'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[3]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[5]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[6]{'line_nr'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[8];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[8]{'extra'}{'misc_content'}[0] = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[8]{'args'}[0]{'contents'}[1];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[8]{'line_nr'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'extra'}{'misc_content'}[0] = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'extra'}{'misc_content'}[1] = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'extra'}{'misc_content'}[2] = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'extra'}{'misc_content'}[3] = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'extra'}{'misc_content'}[4] = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'extra'}{'misc_content'}[5] = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'extra'}{'misc_content'}[6] = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'extra'}{'misc_content'}[7] = $result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[8];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[1];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[1];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[1];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'in_table'}{'contents'}[2];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[2];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[2];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'in_table'}{'contents'}[2];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[3];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'in_table'}{'contents'}[2];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[4];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[4]{'extra'}{'command'} = $result_trees{'in_table'}{'contents'}[2];
$result_trees{'in_table'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'in_table'}{'contents'}[2];
$result_trees{'in_table'}{'contents'}[2]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'in_table'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'in_table'}{'contents'}[2]{'extra'}{'command_as_argument'} = $result_trees{'in_table'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'in_table'}{'contents'}[2]{'extra'}{'end_command'} = $result_trees{'in_table'}{'contents'}[2]{'contents'}[4];
$result_trees{'in_table'}{'contents'}[2]{'parent'} = $result_trees{'in_table'};

$result_texis{'in_table'} = '@table @xref
@end table

@table @code
@item @indent @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
in item@footnote{footnote in item}
@item @ref{Top,, title
}long title
@end table
';


$result_texts{'in_table'} = '
in titlefont exdent
in item

long title
';

$result_errors{'in_table'} = [
  {
    'error_line' => ':1: warning: @xref should not appear in @table
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@xref should not appear in @table',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @indent should not appear in @item
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@indent should not appear in @item',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @titlefont should not appear in @item
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@titlefont should not appear in @item',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @anchor should not appear in @item
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@anchor should not appear in @item',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @footnote should not appear in @item
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@footnote should not appear in @item',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @exdent should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@exdent should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @exdent should not appear in @item
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@exdent should not appear in @item',
    'type' => 'warning'
  },
  {
    'error_line' => ':7: warning: @ref should not appear in @item
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => '@ref should not appear in @item',
    'type' => 'warning'
  },
  {
    'error_line' => ':7: @ref missing close brace
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => '@ref missing close brace',
    'type' => 'error'
  },
  {
    'error_line' => ':8: Misplaced }
',
    'file_name' => '',
    'line_nr' => 8,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  }
];


1;
