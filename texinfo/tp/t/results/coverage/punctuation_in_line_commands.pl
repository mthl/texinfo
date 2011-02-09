use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'punctuation_in_line_commands'} = {
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
              'text' => 'node! After punc'
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
            'normalized' => 'node_0021-After-punc'
          }
        ],
        'normalized' => 'node_0021-After-punc'
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
              'text' => 'top! After punc'
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
          'args' => [
            {
              'contents' => [
                {
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
                      'text' => 'item! After punc'
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
            }
          ],
          'extra' => {
            'block_command_line_contents' => [
              [
                {}
              ]
            ],
            'command_as_argument' => {}
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
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'quotation arg! After punc'
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
          'cmdname' => 'quotation',
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'In quotation
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
                      'text' => 'exdent quotation! After punc'
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
                'misc_content' => [
                  {}
                ]
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
            'block_command_line_contents' => [
              [
                {}
              ]
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
                  'text' => 'float type! After punc'
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
                  'text' => 'float label! After punc'
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
                  'text' => 'In float
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'shortcaption! After punc'
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
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 16,
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
          'extra' => {
            'block_command_line_contents' => [
              [
                {}
              ],
              [
                {}
              ]
            ],
            'node_content' => [
              {}
            ],
            'normalized' => 'float-label_0021-After-punc',
            'shortcaption' => {},
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'float-type_0021-After-punc'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 14,
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
                  'text' => 'float type! After punc'
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
                  'text' => 'label with caption'
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
                  'text' => 'In float with caption.
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'caption! After punc'
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
            'normalized' => 'label-with-caption',
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'float-type_0021-After-punc'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 19,
            'macro' => ''
          },
          'number' => 2,
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
                  'text' => 'float type! After punc'
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
              'normalized' => 'float-type_0021-After-punc'
            }
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
                  'text' => 'index! After punc'
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
              'node' => {},
              'number' => 1
            },
            'misc_content' => []
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 26,
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'heading! After punc'
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
          'cmdname' => 'heading',
          'extra' => {
            'misc_content' => [
              {}
            ]
          },
          'level' => 2,
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 28,
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
                  'parent' => {},
                  'text' => 'titlefont! After punc'
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
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 30,
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'center! After punc'
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
          'cmdname' => 'center',
          'extra' => {
            'misc_content' => [
              {}
            ]
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
            'line_nr' => 34,
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
          'cmdname' => 'contents',
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
        'line_nr' => 3,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'punctuation_in_line_commands'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'};
$result_trees{'punctuation_in_line_commands'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[1]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[1]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[1]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'punctuation_in_line_commands'}{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'};
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'extra'}{'command_as_argument'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[6]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'args'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'args'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'args'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'contents'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'contents'}[1]{'extra'}{'float'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'args'}[1]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'extra'}{'node_content'}[0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'args'}[1]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'extra'}{'shortcaption'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'extra'}{'type'}{'content'}[0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'float_section'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[7]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[8]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[9]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'args'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'args'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'args'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'contents'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'contents'}[1]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'contents'}[1]{'extra'}{'float'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'args'}[1]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'extra'}{'caption'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'extra'}{'node_content'}[0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'args'}[1]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'extra'}{'type'}{'content'}[0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'float_section'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[10]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[11]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[12]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[13]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[13]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[13]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[13]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[13]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[13];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[13]{'extra'}{'type'}{'content'}[0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[13]{'args'}[0]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[13]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[14]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15]{'extra'}{'index_entry'}{'command'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15]{'args'}[0]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15]{'extra'}{'index_entry'}{'node'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15]{'extra'}{'misc_content'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15]{'extra'}{'index_entry'}{'content'};
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[15]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[16]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[17]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[17]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[17]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[17]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[17]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[17]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[17]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[17];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[17]{'extra'}{'misc_content'}[0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[17]{'args'}[0]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[17]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[18]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[19]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[19]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[19]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[19];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[19]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[19]{'args'}[0]{'contents'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[19]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[20]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[21]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[22]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[22]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[22]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[22]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[22]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[22]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[22]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[22];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[22]{'extra'}{'misc_content'}[0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[22]{'args'}[0]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[22]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[23]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[24]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[24]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[24]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[24]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[24]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[24]{'args'}[0];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[24]{'args'}[0]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[24];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[24]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[25]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[26]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'contents'}[27]{'parent'} = $result_trees{'punctuation_in_line_commands'}{'contents'}[2];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'punctuation_in_line_commands'}{'contents'}[2]{'parent'} = $result_trees{'punctuation_in_line_commands'};

$result_texis{'punctuation_in_line_commands'} = '
@node node! After punc
@top top! After punc

@table @asis
@item item! After punc
@end table

@quotation quotation arg! After punc
In quotation
@exdent exdent quotation! After punc
@end quotation

@float float type! After punc, float label! After punc
In float
@shortcaption{shortcaption! After punc}
@end float

@float float type! After punc, label with caption
In float with caption.
@caption{caption! After punc}
@end float

@listoffloats float type! After punc

@cindex index! After punc

@heading heading! After punc

@titlefont{titlefont! After punc}

@center center! After punc

@printindex cp

@contents

';


$result_texts{'punctuation_in_line_commands'} = '
top! After punc
***************

item! After punc

quotation arg! After punc

In quotation
exdent quotation! After punc

In float


In float with caption.




heading! After punc
===================

titlefont! After punc

center! After punc



';

$result_sectioning{'punctuation_in_line_commands'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'top',
      'extra' => {
        'associated_node' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'node_0021-After-punc'
          }
        }
      },
      'level' => 0,
      'section_up' => {}
    }
  ]
};
$result_sectioning{'punctuation_in_line_commands'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'punctuation_in_line_commands'};

$result_nodes{'punctuation_in_line_commands'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'level' => 0
    },
    'normalized' => 'node_0021-After-punc'
  }
};

$result_menus{'punctuation_in_line_commands'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'node_0021-After-punc'
  }
};

$result_errors{'punctuation_in_line_commands'} = [];


$result_floats{'punctuation_in_line_commands'} = {
  'float-type_0021-After-punc' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'normalized' => 'float-label_0021-After-punc',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        },
        'type' => {
          'content' => [
            {
              'text' => 'float type! After punc'
            }
          ],
          'normalized' => 'float-type_0021-After-punc'
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
        'normalized' => 'label-with-caption',
        'type' => {
          'content' => [
            {
              'text' => 'float type! After punc'
            }
          ],
          'normalized' => 'float-type_0021-After-punc'
        }
      },
      'float_section' => {},
      'number' => 2
    }
  ]
};
$result_floats{'punctuation_in_line_commands'}{'float-type_0021-After-punc'}[0]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'punctuation_in_line_commands'}{'float-type_0021-After-punc'}[0];
$result_floats{'punctuation_in_line_commands'}{'float-type_0021-After-punc'}[1]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'punctuation_in_line_commands'}{'float-type_0021-After-punc'}[1];
$result_floats{'punctuation_in_line_commands'}{'float-type_0021-After-punc'}[1]{'float_section'} = $result_floats{'punctuation_in_line_commands'}{'float-type_0021-After-punc'}[0]{'float_section'};



$result_converted{'plaintext'}->{'punctuation_in_line_commands'} = '
top! After punc
***************

item! After punc

     quotation arg! After punc: In quotation
exdent quotation!  After punc

In float

float type! After punc 1: shortcaption!  After punc

In float with caption.

float type! After punc 2: caption!  After punc

* Menu:

* float type! After punc 1: float label! After punc.
                                         shortcaption!  After punc
* float type! After punc 2: label with caption.
                                         caption!  After punc

heading! After punc
===================

titlefont! After punc
*********************

                          center! After punc

top! After punc
';

1;
