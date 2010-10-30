use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices %result_sectioning %result_nodes);

$result_trees{'value_in_index_commands'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'cp',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'cp',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'extra' => {
        'arg_line' => ' cp cp
'
      },
      'parent' => {}
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'fn',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'fn',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'extra' => {
        'arg_line' => ' fn fn
'
      },
      'parent' => {}
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'syncodeindex_command',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@syncodeindex',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'extra' => {
        'arg_line' => ' syncodeindex_command @syncodeindex
'
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
              'text' => 'cp fn'
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
      'cmdname' => 'syncodeindex',
      'extra' => {
        'misc_args' => [
          'cp',
          'fn'
        ]
      },
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'cp fn'
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
      'cmdname' => 'syncodeindex',
      'extra' => {
        'misc_args' => [
          'cp',
          'fn'
        ]
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
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'truc',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'truc',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'extra' => {
        'arg_line' => ' truc truc
'
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
          'text' => 'definedx truc
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
          'cmdname' => 'defindex',
          'extra' => {
            'misc_args' => [
              'truc'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 11,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'after
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
          'text' => 'trucindex_command',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@trucindex',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'extra' => {
        'arg_line' => ' trucindex_command @trucindex
'
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
              'text' => 'index truc'
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
      'cmdname' => 'trucindex',
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
',
      'type' => 'empty_line'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'codeidx',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'codeidx',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'extra' => {
        'arg_line' => ' codeidx codeidx
'
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
              'text' => 'codeidx'
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
      'cmdname' => 'defcodeindex',
      'extra' => {
        'misc_args' => [
          'codeidx'
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 20,
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
          'parent' => {},
          'text' => 'defcodeindex_entry',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'a @var{index entry} t@\'e @^{@dotless{i}}',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'extra' => {
        'arg_line' => ' defcodeindex_entry a @var{index entry} t@\'e @^{@dotless{i}}
'
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
              'text' => 'a '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'index entry'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'var',
              'contents' => [],
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' t'
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
              'cmdname' => '^',
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
      'cmdname' => 'codeidxindex',
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
              'text' => 'cindex entry'
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
              'text' => 'ky pg'
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
      'cmdname' => 'syncodeindex',
      'extra' => {
        'misc_args' => [
          'ky',
          'pg'
        ]
      },
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'truc kindex'
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
      'cmdname' => 'kindex',
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 30,
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
              'text' => 'pindex codeidx'
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
      'cmdname' => 'pindex',
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
              'text' => 'truc cp'
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
      'cmdname' => 'synindex',
      'extra' => {
        'misc_args' => [
          'truc',
          'cp'
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 33,
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
              'text' => 'abc'
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
      'cmdname' => 'defindex',
      'extra' => {
        'misc_args' => [
          'abc'
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 35,
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
              'text' => 'defg'
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
      'cmdname' => 'defindex',
      'extra' => {
        'misc_args' => [
          'defg'
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 36,
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
              'text' => 'abc defg'
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
      'cmdname' => 'synindex',
      'extra' => {
        'misc_args' => [
          'abc',
          'defg'
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 38,
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
              'text' => 'defg ky'
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
      'cmdname' => 'synindex',
      'extra' => {
        'misc_args' => [
          'defg',
          'ky'
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 39,
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
              'text' => 'defg index entry'
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
      'cmdname' => 'defgindex',
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'abc index entry'
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
      'cmdname' => 'abcindex',
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 43,
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
          'text' => 'pg
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
              'text' => 'pg'
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
          'pg'
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 46,
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
          'text' => 'ky
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
              'text' => 'ky'
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
          'ky'
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 49,
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
          'text' => 'truc
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
      'cmdname' => 'printindex',
      'extra' => {
        'misc_args' => [
          'truc'
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 52,
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
          'text' => 'value truc
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
      'cmdname' => 'printindex',
      'extra' => {
        'misc_args' => [
          'truc'
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 55,
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
          'text' => 'cp
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
        'line_nr' => 58,
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
          'text' => 'value cp
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
        'line_nr' => 61,
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
          'text' => 'defg
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
              'text' => 'defg'
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
          'defg'
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 64,
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
          'text' => 'abc
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
              'text' => 'abc'
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
          'abc'
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 67,
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
          'text' => 'fn
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
        'line_nr' => 70,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'value_in_index_commands'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[2];
$result_trees{'value_in_index_commands'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[2];
$result_trees{'value_in_index_commands'}{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[3]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[4]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[4]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[4]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[4];
$result_trees{'value_in_index_commands'}{'contents'}[4]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[5]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[5]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[5]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[5];
$result_trees{'value_in_index_commands'}{'contents'}[5]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[6]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[7];
$result_trees{'value_in_index_commands'}{'contents'}[7]{'args'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[7];
$result_trees{'value_in_index_commands'}{'contents'}[7]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[8]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[9];
$result_trees{'value_in_index_commands'}{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[9]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[9]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[9];
$result_trees{'value_in_index_commands'}{'contents'}[9]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[9];
$result_trees{'value_in_index_commands'}{'contents'}[9]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[10]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[11];
$result_trees{'value_in_index_commands'}{'contents'}[11]{'args'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[11];
$result_trees{'value_in_index_commands'}{'contents'}[11]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[12]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[13]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[13]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[13]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[13]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[13];
$result_trees{'value_in_index_commands'}{'contents'}[13]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[14]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[15];
$result_trees{'value_in_index_commands'}{'contents'}[15]{'args'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[15];
$result_trees{'value_in_index_commands'}{'contents'}[15]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[16]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[17]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[17]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[17]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[17]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[17]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[17]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[17]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[17];
$result_trees{'value_in_index_commands'}{'contents'}[17]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[18]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[19]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[19];
$result_trees{'value_in_index_commands'}{'contents'}[19]{'args'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[19];
$result_trees{'value_in_index_commands'}{'contents'}[19]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[20]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[2];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[4];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[6];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[21];
$result_trees{'value_in_index_commands'}{'contents'}[21]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[22]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[23]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[23]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[23]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[23]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[23]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[23]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[23]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[23];
$result_trees{'value_in_index_commands'}{'contents'}[23]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[24]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[25]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[25]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[25]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[25]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[25]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[25]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[25]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[25];
$result_trees{'value_in_index_commands'}{'contents'}[25]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[26]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[27]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[27]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[27]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[27]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[27]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[27]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[27]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[27];
$result_trees{'value_in_index_commands'}{'contents'}[27]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[28]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[28]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[28]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[28]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[28]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[28]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[28]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[28];
$result_trees{'value_in_index_commands'}{'contents'}[28]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[29]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[30]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[30]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[30]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[30]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[30]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[30]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[30]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[30];
$result_trees{'value_in_index_commands'}{'contents'}[30]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[31]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[32]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[32]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[32]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[32]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[32]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[32]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[32]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[32];
$result_trees{'value_in_index_commands'}{'contents'}[32]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[33]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[33]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[33]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[33]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[33]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[33]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[33]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[33];
$result_trees{'value_in_index_commands'}{'contents'}[33]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[34]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[35]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[35]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[35]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[35]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[35]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[35]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[35]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[35];
$result_trees{'value_in_index_commands'}{'contents'}[35]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[36]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[36]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[36]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[36]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[36]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[36]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[36]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[36];
$result_trees{'value_in_index_commands'}{'contents'}[36]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[37]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[38]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[38]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[38]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[38]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[38]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[38]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[38]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[38];
$result_trees{'value_in_index_commands'}{'contents'}[38]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[39]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[40]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[40]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[40]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[40]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[40]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[40]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[40]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[40];
$result_trees{'value_in_index_commands'}{'contents'}[40]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[41]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[42]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[42];
$result_trees{'value_in_index_commands'}{'contents'}[42]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[43]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[43]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[43]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[43]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[43]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[43]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[43]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[43];
$result_trees{'value_in_index_commands'}{'contents'}[43]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[44]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[45]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[45];
$result_trees{'value_in_index_commands'}{'contents'}[45]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[46]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[46]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[46]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[46]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[46]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[46]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[46]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[46];
$result_trees{'value_in_index_commands'}{'contents'}[46]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[47]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[48]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[48];
$result_trees{'value_in_index_commands'}{'contents'}[48]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[49]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[49]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[49]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[49]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[49]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[49]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[49]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[49];
$result_trees{'value_in_index_commands'}{'contents'}[49]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[50]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[51]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[51];
$result_trees{'value_in_index_commands'}{'contents'}[51]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[52]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[52]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[52]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[52]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[52]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[52]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[52]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[52];
$result_trees{'value_in_index_commands'}{'contents'}[52]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[53]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[54]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[54];
$result_trees{'value_in_index_commands'}{'contents'}[54]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[55]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[55]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[55]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[55]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[55]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[55]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[55]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[55];
$result_trees{'value_in_index_commands'}{'contents'}[55]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[56]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[57]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[57];
$result_trees{'value_in_index_commands'}{'contents'}[57]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[58]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[58]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[58]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[58]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[58]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[58]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[58]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[58];
$result_trees{'value_in_index_commands'}{'contents'}[58]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[59]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[60]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[60];
$result_trees{'value_in_index_commands'}{'contents'}[60]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[61]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[61]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[61]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[61]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[61]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[61]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[61]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[61];
$result_trees{'value_in_index_commands'}{'contents'}[61]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[62]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[63]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[63];
$result_trees{'value_in_index_commands'}{'contents'}[63]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[64]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[64]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[64]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[64]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[64]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[64]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[64]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[64];
$result_trees{'value_in_index_commands'}{'contents'}[64]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[65]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[66]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[66];
$result_trees{'value_in_index_commands'}{'contents'}[66]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[67]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[67]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[67]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[67]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[67]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[67]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[67]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[67];
$result_trees{'value_in_index_commands'}{'contents'}[67]{'parent'} = $result_trees{'value_in_index_commands'};

$result_texis{'value_in_index_commands'} = '@set cp cp
@set fn fn
@set syncodeindex_command @syncodeindex

@syncodeindex cp fn
@syncodeindex cp fn

@set truc truc

definedx truc
@defindex truc
after

@set trucindex_command @trucindex

@trucindex index truc

@set codeidx codeidx

@defcodeindex codeidx

@set defcodeindex_entry a @var{index entry} t@\'e @^{@dotless{i}}

@codeidxindex a @var{index entry} t@\'e @^{@dotless{i}}

@cindex cindex entry

@syncodeindex ky pg

@kindex truc kindex
@pindex pindex codeidx

@synindex truc cp

@defindex abc
@defindex defg

@synindex abc defg
@synindex defg ky

@defgindex defg index entry

@abcindex abc index entry

pg
@printindex pg

ky
@printindex ky

truc
@printindex truc

value truc
@printindex truc

cp
@printindex cp

value cp
@printindex cp

defg
@printindex defg

abc
@printindex abc

fn
@printindex fn
';


$result_texts{'value_in_index_commands'} = '


definedx truc
after















pg

ky

truc

value truc

cp

value cp

defg

abc

fn
';

$result_errors{'value_in_index_commands'} = [
  {
    'error_line' => ':49: warning: Printing an index `ky\' merged in another one `pg\'
',
    'file_name' => '',
    'line_nr' => 49,
    'macro' => '',
    'text' => 'Printing an index `ky\' merged in another one `pg\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':52: warning: Printing an index `truc\' merged in another one `fn\'
',
    'file_name' => '',
    'line_nr' => 52,
    'macro' => '',
    'text' => 'Printing an index `truc\' merged in another one `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':55: warning: Printing an index `truc\' merged in another one `fn\'
',
    'file_name' => '',
    'line_nr' => 55,
    'macro' => '',
    'text' => 'Printing an index `truc\' merged in another one `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':58: warning: Printing an index `cp\' merged in another one `fn\'
',
    'file_name' => '',
    'line_nr' => 58,
    'macro' => '',
    'text' => 'Printing an index `cp\' merged in another one `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':61: warning: Printing an index `cp\' merged in another one `fn\'
',
    'file_name' => '',
    'line_nr' => 61,
    'macro' => '',
    'text' => 'Printing an index `cp\' merged in another one `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':64: warning: Printing an index `defg\' merged in another one `pg\'
',
    'file_name' => '',
    'line_nr' => 64,
    'macro' => '',
    'text' => 'Printing an index `defg\' merged in another one `pg\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':67: warning: Printing an index `abc\' merged in another one `defg\'
',
    'file_name' => '',
    'line_nr' => 67,
    'macro' => '',
    'text' => 'Printing an index `abc\' merged in another one `defg\'',
    'type' => 'warning'
  }
];


$result_indices{'value_in_index_commands'} = {
  'index_names' => {
    'abc' => {
      'abc' => 0
    },
    'codeidx' => {
      'codeidx' => 1
    },
    'cp' => {
      'c' => 0,
      'cp' => 0
    },
    'defg' => {
      'abc' => 0,
      'defg' => 0
    },
    'fn' => {
      'c' => 1,
      'cp' => 1,
      'f' => 1,
      'fn' => 1,
      'truc' => 0
    },
    'ky' => {
      'k' => 1,
      'ky' => 1
    },
    'pg' => {
      'abc' => 0,
      'defg' => 0,
      'k' => 1,
      'ky' => 1,
      'p' => 1,
      'pg' => 1
    },
    'tp' => {
      't' => 1,
      'tp' => 1
    },
    'truc' => {
      'truc' => 0
    },
    'vr' => {
      'v' => 1,
      'vr' => 1
    }
  },
  'merged_indices' => {
    'abc' => 'defg',
    'cp' => 'fn',
    'defg' => 'pg',
    'ky' => 'pg',
    'truc' => 'fn'
  }
};


1;
