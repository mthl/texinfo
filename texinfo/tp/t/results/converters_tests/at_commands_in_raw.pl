use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'at_commands_in_raw'} = {
  'contents' => [
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
          'contents' => [
            {
              'parent' => {},
              'text' => '<b>in b'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in footnote'
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
                'spaces_before_argument' => {
                  'parent' => {},
                  'text' => '',
                  'type' => 'empty_spaces_before_argument'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 2,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '.</b>
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'anchor in html'
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
                'normalized' => 'anchor-in-html',
                'spaces_before_argument' => {
                  'text' => '',
                  'type' => 'empty_spaces_before_argument'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 3,
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
          'type' => 'rawpreformatted'
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
                  'text' => 'html'
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
            'command_argument' => 'html',
            'spaces_after_command' => {},
            'text_arg' => 'html'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 4,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {},
        'spaces_after_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'in kbd before tex'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'kbd',
          'contents' => [],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
            'macro' => ''
          },
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
                      'text' => 'second footnote'
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
            'spaces_before_argument' => {
              'parent' => {},
              'text' => '',
              'type' => 'empty_spaces_before_argument'
            }
          },
          'line_nr' => {},
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
      'cmdname' => 'tex',
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
                      'text' => 'code'
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
              'cmdname' => 'kbdinputstyle',
              'extra' => {
                'misc_args' => [
                  'code'
                ],
                'spaces_after_command' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 8,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'in tex
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'anchor in tex'
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
                'normalized' => 'anchor-in-tex',
                'spaces_before_argument' => {
                  'text' => '',
                  'type' => 'empty_spaces_before_argument'
                }
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
          'type' => 'rawpreformatted'
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
                  'text' => 'tex'
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
            'command_argument' => 'tex',
            'spaces_after_command' => {},
            'text_arg' => 'tex'
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
        'end_command' => {},
        'spaces_after_command' => {}
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
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'in kbd after tex'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'kbd',
          'contents' => [],
          'extra' => {
            'code' => 1
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'anchor in html'
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
            'label' => {},
            'node_argument' => {
              'node_content' => [
                {}
              ],
              'normalized' => 'anchor-in-html'
            },
            'spaces_before_argument' => {
              'text' => '',
              'type' => 'empty_spaces_before_argument'
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
    },
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'anchor in tex'
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
            'label' => {},
            'node_argument' => {
              'node_content' => [
                {}
              ],
              'normalized' => 'anchor-in-tex'
            },
            'spaces_before_argument' => {
              'text' => '',
              'type' => 'empty_spaces_before_argument'
            }
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
          'text' => '.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'at_commands_in_raw'}{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'extra'}{'spaces_before_argument'}{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[3];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[2];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[2];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'at_commands_in_raw'}{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[2]{'extra'}{'spaces_after_command'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[2];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'extra'}{'spaces_after_command'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'};
$result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[1];
$result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[1];
$result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[1]{'extra'}{'spaces_before_argument'}{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[1]{'line_nr'} = $result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[0]{'line_nr'};
$result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[1];
$result_trees{'at_commands_in_raw'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[1];
$result_trees{'at_commands_in_raw'}{'contents'}[1]{'parent'} = $result_trees{'at_commands_in_raw'};
$result_trees{'at_commands_in_raw'}{'contents'}[2]{'parent'} = $result_trees{'at_commands_in_raw'};
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[0]{'extra'}{'command'} = $result_trees{'at_commands_in_raw'}{'contents'}[3];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'extra'}{'spaces_after_command'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[2];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[2];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[2]{'extra'}{'command'} = $result_trees{'at_commands_in_raw'}{'contents'}[3];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[2]{'extra'}{'spaces_after_command'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[3];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'extra'}{'end_command'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[2];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'extra'}{'spaces_after_command'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[3]{'parent'} = $result_trees{'at_commands_in_raw'};
$result_trees{'at_commands_in_raw'}{'contents'}[4]{'parent'} = $result_trees{'at_commands_in_raw'};
$result_trees{'at_commands_in_raw'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[5]{'contents'}[0]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[5]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[5];
$result_trees{'at_commands_in_raw'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[5];
$result_trees{'at_commands_in_raw'}{'contents'}[5]{'parent'} = $result_trees{'at_commands_in_raw'};
$result_trees{'at_commands_in_raw'}{'contents'}[6]{'parent'} = $result_trees{'at_commands_in_raw'};
$result_trees{'at_commands_in_raw'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[7]{'contents'}[0]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[7]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[7]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'at_commands_in_raw'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[7]{'contents'}[0]{'extra'}{'label'} = $result_trees{'at_commands_in_raw'}{'contents'}[0]{'contents'}[1]{'contents'}[3];
$result_trees{'at_commands_in_raw'}{'contents'}[7]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'at_commands_in_raw'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[7];
$result_trees{'at_commands_in_raw'}{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[7];
$result_trees{'at_commands_in_raw'}{'contents'}[7]{'parent'} = $result_trees{'at_commands_in_raw'};
$result_trees{'at_commands_in_raw'}{'contents'}[8]{'parent'} = $result_trees{'at_commands_in_raw'};
$result_trees{'at_commands_in_raw'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[9]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[9]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'at_commands_in_raw'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[9]{'contents'}[0]{'extra'}{'label'} = $result_trees{'at_commands_in_raw'}{'contents'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'at_commands_in_raw'}{'contents'}[9]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'at_commands_in_raw'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_raw'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[9];
$result_trees{'at_commands_in_raw'}{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'at_commands_in_raw'}{'contents'}[9];
$result_trees{'at_commands_in_raw'}{'contents'}[9]{'parent'} = $result_trees{'at_commands_in_raw'};

$result_texis{'at_commands_in_raw'} = '@html
<b>in b@footnote{in footnote}.</b>
@anchor{anchor in html}
@end html
@kbd{in kbd before tex}@footnote{second footnote}.

@tex
@kbdinputstyle code
in tex
@anchor{anchor in tex}
@end tex

@kbd{in kbd after tex}.

@ref{anchor in html}.

@ref{anchor in tex}.
';


$result_texts{'at_commands_in_raw'} = 'in kbd before tex.


in kbd after tex.

anchor in html.

anchor in tex.
';

$result_errors{'at_commands_in_raw'} = [];



$result_converted{'plaintext'}->{'at_commands_in_raw'} = '\'in kbd before tex\'(1).

   \'in kbd after tex\'.

   *note anchor in html::.

   *note anchor in tex::.

   ---------- Footnotes ----------

   (1) second footnote

';


$result_converted{'html_text'}->{'at_commands_in_raw'} = '<b>in b<a name="DOCF1" href="#FOOT1"><sup>1</sup></a>.</b>
<a name="anchor-in-html"></a><p><kbd>in kbd before tex</kbd><a name="DOCF2" href="#FOOT2"><sup>2</sup></a>.
</p>

<p><code>in kbd after tex</code>.
</p>
<p><a href="#anchor-in-html">anchor in html</a>.
</p>
<p><a href="#anchor-in-tex">anchor in tex</a>.
</p><div class="footnote">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h3><a name="FOOT1" href="#DOCF1">(1)</a></h3>
<p>in footnote</p>
<h3><a name="FOOT2" href="#DOCF2">(2)</a></h3>
<p>second footnote</p>
</div>
';


$result_converted{'xml'}->{'at_commands_in_raw'} = '<html endspaces=" ">
&lt;b&gt;in b<footnote><para>in footnote</para></footnote>.&lt;/b&gt;
<anchor name="anchor-in-html">anchor in html</anchor>
</html>
<para><kbd>in kbd before tex</kbd><footnote><para>second footnote</para></footnote>.
</para>
<tex endspaces=" ">
<kbdinputstyle value="code" line=" code"></kbdinputstyle>
in tex
<anchor name="anchor-in-tex">anchor in tex</anchor>
</tex>

<para><kbd>in kbd after tex</kbd>.
</para>
<para><ref label="anchor-in-html"><xrefnodename>anchor in html</xrefnodename></ref>.
</para>
<para><ref label="anchor-in-tex"><xrefnodename>anchor in tex</xrefnodename></ref>.
</para>';


$result_converted{'docbook'}->{'at_commands_in_raw'} = '<para><userinput>in kbd before tex</userinput><footnote><para>second footnote</para></footnote>.
</para>

<para><userinput>in kbd after tex</userinput>.
</para>
<para><link linkend="anchor-in-html">anchor in html</link>.
</para>
<para><link linkend="anchor-in-tex">anchor in tex</link>.
</para>';

1;
