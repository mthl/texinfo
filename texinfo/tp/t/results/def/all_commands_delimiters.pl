use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'all_commands_delimiters'} = {
  'contents' => [
    {
      'cmdname' => 'deffn',
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
                  'text' => 'Command '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'forward--char'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 1,
                    'macro' => ''
                  },
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
                          'text' => 'nchars'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'argument2'
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
                      'text' => 'argument3'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => '         (arg in brace, [something '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in v--ar'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 2,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ', '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in, b'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'b',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ', comma'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' a'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'pref'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' p]) last
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
                  'text' => 'Command'
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
                {}
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
                {}
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
                  'contents' => [],
                  'parent' => {},
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
                'arg',
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed_def_content'
                }
              ],
              [
                'spaces',
                {
                  'text' => '         ',
                  'type' => 'spaces'
                }
              ],
              [
                'delimiter',
                {
                  'text' => '(',
                  'type' => 'delimiter'
                }
              ],
              [
                'arg',
                {
                  'text' => 'arg'
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
                  'text' => 'in'
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
                  'text' => 'brace'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                'delimiter',
                {
                  'text' => '[',
                  'type' => 'delimiter'
                }
              ],
              [
                'arg',
                {
                  'text' => 'something'
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
                {}
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                {}
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
                  'contents' => [],
                  'parent' => {},
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
                'arg',
                {
                  'text' => 'a'
                }
              ],
              [
                'arg',
                {}
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
                  'text' => 'p'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ']',
                  'type' => 'delimiter'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
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
                  'text' => 'last'
                }
              ]
            ],
            'def_command' => 'deffn',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 1
            },
            'original_def_cmdname' => 'deffn'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'defvr',
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
                  'text' => 'Variable fill-column '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'argument1'
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
                      'text' => 'argument2'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => '         (arg in brace, [something '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in v--ar'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
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
                  'text' => ', '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in, b'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'b',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ', comma'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' a'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'pref'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' p]) last
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
                  'text' => 'Variable'
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
                  'text' => 'fill-column'
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
                  'contents' => [],
                  'parent' => {},
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
                'arg',
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed_def_content'
                }
              ],
              [
                'spaces',
                {
                  'text' => '         ',
                  'type' => 'spaces'
                }
              ],
              [
                'delimiter',
                {
                  'text' => '(',
                  'type' => 'delimiter'
                }
              ],
              [
                'arg',
                {
                  'text' => 'arg'
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
                  'text' => 'in'
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
                  'text' => 'brace'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                'delimiter',
                {
                  'text' => '[',
                  'type' => 'delimiter'
                }
              ],
              [
                'arg',
                {
                  'text' => 'something'
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
                {}
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                {}
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
                  'contents' => [],
                  'parent' => {},
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
                'arg',
                {
                  'text' => 'a'
                }
              ],
              [
                'arg',
                {}
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
                  'text' => 'p'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ']',
                  'type' => 'delimiter'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
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
                  'text' => 'last'
                }
              ]
            ],
            'def_command' => 'defvr',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'defvr',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 1
            },
            'original_def_cmdname' => 'defvr'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'deftypefn',
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Library Function'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' int foobar (int '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'foo'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 9,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ', float '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'bar'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ')
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
                  'parent' => {},
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
                'type',
                {
                  'text' => 'int'
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
                  'text' => 'foobar'
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
                'delimiter',
                {
                  'text' => '(',
                  'type' => 'delimiter'
                }
              ],
              [
                'typearg',
                {
                  'text' => 'int'
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
                {}
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                'typearg',
                {
                  'text' => 'float'
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
                {}
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
                }
              ]
            ],
            'def_command' => 'deftypefn',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {},
              'type' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deftypefn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 2
            },
            'original_def_cmdname' => 'deftypefn'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypefn',
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Library Function'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' int foobar (int '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'foo'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 12,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ', float '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'bar'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ')         (arg in brace, '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '[something'
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in v--ar'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 13,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ', '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in, b'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'b',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ', comma'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' a'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'pref'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' p]) ct'
                },
                {
                  'cmdname' => '*',
                  'parent' => {}
                },
                {
                  'cmdname' => '*',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' last
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
                  'parent' => {},
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
                'type',
                {
                  'text' => 'int'
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
                  'text' => 'foobar'
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
                'delimiter',
                {
                  'text' => '(',
                  'type' => 'delimiter'
                }
              ],
              [
                'typearg',
                {
                  'text' => 'int'
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
                {}
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                'typearg',
                {
                  'text' => 'float'
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
                {}
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
                }
              ],
              [
                'spaces',
                {
                  'text' => '         ',
                  'type' => 'spaces'
                }
              ],
              [
                'delimiter',
                {
                  'text' => '(',
                  'type' => 'delimiter'
                }
              ],
              [
                'typearg',
                {
                  'text' => 'arg'
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
                  'text' => 'in'
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
                'typearg',
                {
                  'text' => 'brace'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                'typearg',
                {
                  'contents' => [],
                  'parent' => {},
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
                'arg',
                {}
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {
                  'contents' => [],
                  'parent' => {},
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
                'arg',
                {
                  'text' => 'a'
                }
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {
                  'text' => 'p'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ']',
                  'type' => 'delimiter'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
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
                'typearg',
                {
                  'text' => 'ct'
                }
              ],
              [
                'arg',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {
                  'text' => 'last'
                }
              ]
            ],
            'def_command' => 'deftypefn',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {},
              'type' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deftypefn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 3
            },
            'original_def_cmdname' => 'deftypefn'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypefn',
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Library Function'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' int foobug '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '[something'
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {
                  'contents' => [],
                  'parent' => {},
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
                'type',
                {
                  'text' => 'int'
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
                  'text' => 'foobug'
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
                'typearg',
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed_def_content'
                }
              ]
            ],
            'def_command' => 'deftypefn',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {},
              'type' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deftypefn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 4
            },
            'original_def_cmdname' => 'deftypefn'
          },
          'parent' => {},
          'type' => 'def_line'
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
      'cmdname' => 'deftypefn',
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
                  'text' => 'stacks private push ('
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 's'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 19,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ':in out stack;                  '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'n'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 20,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ':in integer) ; ;barg aarg; ; end
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
                  'text' => 'stacks'
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
                'type',
                {
                  'text' => 'private'
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
                  'text' => 'push'
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
                'delimiter',
                {
                  'text' => '(',
                  'type' => 'delimiter'
                }
              ],
              [
                'arg',
                {}
              ],
              [
                'typearg',
                {
                  'text' => ':in'
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
                  'text' => 'out'
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
                'typearg',
                {
                  'text' => 'stack;'
                }
              ],
              [
                'spaces',
                {
                  'text' => '                  ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {}
              ],
              [
                'typearg',
                {
                  'text' => ':in'
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
                  'text' => 'integer'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
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
                'typearg',
                {
                  'text' => ';'
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
                  'text' => ';barg'
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
                'typearg',
                {
                  'text' => 'aarg;'
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
                  'text' => ';'
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
                'typearg',
                {
                  'text' => 'end'
                }
              ]
            ],
            'def_command' => 'deftypefn',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {},
              'type' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deftypefn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 5
            },
            'original_def_cmdname' => 'deftypefn'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypevr',
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Global Flag'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' int enable         (arg in brace, [something '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in v--ar'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 24,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ', '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in, b'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'b',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ', comma'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' a'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'pref'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' p]) last
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
                  'parent' => {},
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
                'type',
                {
                  'text' => 'int'
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
                  'text' => 'enable'
                }
              ],
              [
                'spaces',
                {
                  'text' => '         ',
                  'type' => 'spaces'
                }
              ],
              [
                'delimiter',
                {
                  'text' => '(',
                  'type' => 'delimiter'
                }
              ],
              [
                'arg',
                {
                  'text' => 'arg'
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
                  'text' => 'in'
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
                  'text' => 'brace'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                'delimiter',
                {
                  'text' => '[',
                  'type' => 'delimiter'
                }
              ],
              [
                'arg',
                {
                  'text' => 'something'
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
                {}
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                {}
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
                  'contents' => [],
                  'parent' => {},
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
                'arg',
                {
                  'text' => 'a'
                }
              ],
              [
                'arg',
                {}
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
                  'text' => 'p'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ']',
                  'type' => 'delimiter'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
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
                  'text' => 'last'
                }
              ]
            ],
            'def_command' => 'deftypevr',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {},
              'type' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deftypevr',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 2
            },
            'original_def_cmdname' => 'deftypevr'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 23,
        'macro' => ''
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
      'cmdname' => 'deftp',
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Data type'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' pair car cdr         (arg in brace, [something '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in v--ar'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 28,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ', '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in, b'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'b',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ', comma'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' a'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'pref'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' p]) last
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
                  'parent' => {},
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
                'name',
                {
                  'text' => 'pair'
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
                'typearg',
                {
                  'text' => 'car'
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
                  'text' => 'cdr'
                }
              ],
              [
                'spaces',
                {
                  'text' => '         ',
                  'type' => 'spaces'
                }
              ],
              [
                'delimiter',
                {
                  'text' => '(',
                  'type' => 'delimiter'
                }
              ],
              [
                'typearg',
                {
                  'text' => 'arg'
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
                  'text' => 'in'
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
                'typearg',
                {
                  'text' => 'brace'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                'delimiter',
                {
                  'text' => '[',
                  'type' => 'delimiter'
                }
              ],
              [
                'typearg',
                {
                  'text' => 'something'
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
                {}
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {
                  'contents' => [],
                  'parent' => {},
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
                'arg',
                {
                  'text' => 'a'
                }
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {
                  'text' => 'p'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ']',
                  'type' => 'delimiter'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
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
                'typearg',
                {
                  'text' => 'last'
                }
              ]
            ],
            'def_command' => 'deftp',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deftp',
              'index_name' => 'tp',
              'index_prefix' => 't',
              'number' => 1
            },
            'original_def_cmdname' => 'deftp'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 27,
        'macro' => ''
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
      'cmdname' => 'defcv',
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Class Option'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' Window border-pattern         (arg in brace, [something '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in v--ar'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 32,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ', '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in, b'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'b',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ', comma'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' a'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'pref'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' p]) last
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
                  'parent' => {},
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
                  'text' => 'Window'
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
                  'text' => 'border-pattern'
                }
              ],
              [
                'spaces',
                {
                  'text' => '         ',
                  'type' => 'spaces'
                }
              ],
              [
                'delimiter',
                {
                  'text' => '(',
                  'type' => 'delimiter'
                }
              ],
              [
                'arg',
                {
                  'text' => 'arg'
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
                  'text' => 'in'
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
                  'text' => 'brace'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                'delimiter',
                {
                  'text' => '[',
                  'type' => 'delimiter'
                }
              ],
              [
                'arg',
                {
                  'text' => 'something'
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
                {}
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                {}
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
                  'contents' => [],
                  'parent' => {},
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
                'arg',
                {
                  'text' => 'a'
                }
              ],
              [
                'arg',
                {}
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
                  'text' => 'p'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ']',
                  'type' => 'delimiter'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
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
                  'text' => 'last'
                }
              ]
            ],
            'def_command' => 'defcv',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'defcv',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 3
            },
            'original_def_cmdname' => 'defcv'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'deftypecv',
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Class Option2'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' Window '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'int'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 35,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' border-pattern         (arg in brace, [something '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in v--ar'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 36,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ', '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in, b'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'b',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ', comma'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' a'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'pref'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' p]) last
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
                  'parent' => {},
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
                  'text' => 'Window'
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
                'type',
                {}
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
                  'text' => 'border-pattern'
                }
              ],
              [
                'spaces',
                {
                  'text' => '         ',
                  'type' => 'spaces'
                }
              ],
              [
                'delimiter',
                {
                  'text' => '(',
                  'type' => 'delimiter'
                }
              ],
              [
                'arg',
                {
                  'text' => 'arg'
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
                  'text' => 'in'
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
                  'text' => 'brace'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                'delimiter',
                {
                  'text' => '[',
                  'type' => 'delimiter'
                }
              ],
              [
                'arg',
                {
                  'text' => 'something'
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
                {}
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                {}
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
                  'contents' => [],
                  'parent' => {},
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
                'arg',
                {
                  'text' => 'a'
                }
              ],
              [
                'arg',
                {}
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
                  'text' => 'p'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ']',
                  'type' => 'delimiter'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
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
                  'text' => 'last'
                }
              ]
            ],
            'def_command' => 'deftypecv',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' of '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypecv',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 4
            },
            'original_def_cmdname' => 'deftypecv'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'defop',
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
                  'text' => 'Operation windows expose         (arg in brace, [something '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in v--ar'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 40,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ', '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in, b'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'b',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ', comma'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' a'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'pref'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' p]) last
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
                  'text' => 'Operation'
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
                  'text' => 'windows'
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
                  'text' => 'expose'
                }
              ],
              [
                'spaces',
                {
                  'text' => '         ',
                  'type' => 'spaces'
                }
              ],
              [
                'delimiter',
                {
                  'text' => '(',
                  'type' => 'delimiter'
                }
              ],
              [
                'arg',
                {
                  'text' => 'arg'
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
                  'text' => 'in'
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
                  'text' => 'brace'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                'delimiter',
                {
                  'text' => '[',
                  'type' => 'delimiter'
                }
              ],
              [
                'arg',
                {
                  'text' => 'something'
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
                {}
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                {}
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
                  'contents' => [],
                  'parent' => {},
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
                'arg',
                {
                  'text' => 'a'
                }
              ],
              [
                'arg',
                {}
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
                  'text' => 'p'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ']',
                  'type' => 'delimiter'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
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
                  'text' => 'last'
                }
              ]
            ],
            'def_command' => 'defop',
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'defop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 6
            },
            'original_def_cmdname' => 'defop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'deftypeop',
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
                  'text' => 'Operation2 W,indow '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'int'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 43,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' expose         (arg in brace, [something '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in v--ar'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 44,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ', '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in, b'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'b',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ', comma'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' a'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'pref'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' p]) last
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
                  'text' => 'Operation2'
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
                  'text' => 'W,indow'
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
                'type',
                {}
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
                  'text' => 'expose'
                }
              ],
              [
                'spaces',
                {
                  'text' => '         ',
                  'type' => 'spaces'
                }
              ],
              [
                'delimiter',
                {
                  'text' => '(',
                  'type' => 'delimiter'
                }
              ],
              [
                'typearg',
                {
                  'text' => 'arg'
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
                  'text' => 'in'
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
                'typearg',
                {
                  'text' => 'brace'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                'delimiter',
                {
                  'text' => '[',
                  'type' => 'delimiter'
                }
              ],
              [
                'typearg',
                {
                  'text' => 'something'
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
                {}
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
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
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {
                  'contents' => [],
                  'parent' => {},
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
                'arg',
                {
                  'text' => 'a'
                }
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {
                  'text' => 'p'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ']',
                  'type' => 'delimiter'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
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
                'typearg',
                {
                  'text' => 'last'
                }
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 7
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'text' => 'Operation5 Window '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'int'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
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
                  'text' => ' expose type arg
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
                  'text' => 'Operation5'
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
                  'text' => 'Window'
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
                'type',
                {}
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
                  'text' => 'expose'
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
                'typearg',
                {
                  'text' => 'type'
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
                  'text' => 'arg'
                }
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 8
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'text' => 'Operation3 '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'W,indow'
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'int'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 50,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'e,xpose'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' type arg
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
                  'text' => 'Operation3'
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
                  'contents' => [],
                  'parent' => {},
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
                'type',
                {}
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
                  'contents' => [],
                  'parent' => {},
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
                'typearg',
                {
                  'text' => 'type'
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
                  'text' => 'arg'
                }
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 9
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'text' => 'Operation4 '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ',Window'
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'int'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 53,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ',expose'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' type arg
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
                  'text' => 'Operation4'
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
                  'contents' => [],
                  'parent' => {},
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
                'type',
                {}
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
                  'contents' => [],
                  'parent' => {},
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
                'typearg',
                {
                  'text' => 'type'
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
                  'text' => 'arg'
                }
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 10
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'text' => 'Operation6 W,indow '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'int'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 56,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' e,xpose type arg
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
                  'text' => 'Operation6'
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
                  'text' => 'W,indow'
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
                'type',
                {}
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
                  'text' => 'e,xpose'
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
                'typearg',
                {
                  'text' => 'type'
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
                  'text' => 'arg'
                }
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 11
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'text' => 'Operation7 ,Window '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'int'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 59,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' ,expose type arg
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
                  'text' => 'Operation7'
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
                  'text' => ',Window'
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
                'type',
                {}
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
                  'text' => ',expose'
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
                'typearg',
                {
                  'text' => 'type'
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
                  'text' => 'arg'
                }
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 12
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'text' => 'Operation13 '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'W)indow'
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'int'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 62,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'e)xpose'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' type arg
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
                  'text' => 'Operation13'
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
                  'contents' => [],
                  'parent' => {},
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
                'type',
                {}
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
                  'contents' => [],
                  'parent' => {},
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
                'typearg',
                {
                  'text' => 'type'
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
                  'text' => 'arg'
                }
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 13
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'text' => 'Operation14 '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ')Window'
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'int'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 65,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ')expose'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' type arg
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
                  'text' => 'Operation14'
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
                  'contents' => [],
                  'parent' => {},
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
                'type',
                {}
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
                  'contents' => [],
                  'parent' => {},
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
                'typearg',
                {
                  'text' => 'type'
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
                  'text' => 'arg'
                }
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 14
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'text' => 'Operation16 W)indow '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'int'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 68,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' e)xpose type arg
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
                  'text' => 'Operation16'
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
                  'text' => 'W)indow'
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
                'type',
                {}
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
                  'text' => 'e)xpose'
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
                'typearg',
                {
                  'text' => 'type'
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
                  'text' => 'arg'
                }
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 15
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'text' => 'Operation17 )Window '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'int'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 71,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' )expose type arg
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
                  'text' => 'Operation17'
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
                  'text' => ')Window'
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
                'type',
                {}
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
                  'text' => ')expose'
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
                'typearg',
                {
                  'text' => 'type'
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
                  'text' => 'arg'
                }
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 16
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'text' => 'Operation18 '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'W;indow'
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'int'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 74,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'e;xpose'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' type arg
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
                  'text' => 'Operation18'
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
                  'contents' => [],
                  'parent' => {},
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
                'type',
                {}
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
                  'contents' => [],
                  'parent' => {},
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
                'typearg',
                {
                  'text' => 'type'
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
                  'text' => 'arg'
                }
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 17
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'text' => 'Operation19 '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ';Window'
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'int'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 77,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ';expose'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' type arg
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
                  'text' => 'Operation19'
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
                  'contents' => [],
                  'parent' => {},
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
                'type',
                {}
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
                  'contents' => [],
                  'parent' => {},
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
                'typearg',
                {
                  'text' => 'type'
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
                  'text' => 'arg'
                }
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 18
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'text' => 'Operation20 W;indow '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'int'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 80,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' e;xpose type arg
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
                  'text' => 'Operation20'
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
                  'text' => 'W;indow'
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
                'type',
                {}
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
                  'text' => 'e;xpose'
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
                'typearg',
                {
                  'text' => 'type'
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
                  'text' => 'arg'
                }
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 19
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'text' => 'Operation21 ;Window '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'int'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 83,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' ;expose type arg
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
                  'text' => 'Operation21'
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
                  'text' => ';Window'
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
                'type',
                {}
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
                  'text' => ';expose'
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
                'typearg',
                {
                  'text' => 'type'
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
                  'text' => 'arg'
                }
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 20
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'text' => 'Command'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'com'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 86,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Window'
                    },
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'int'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'code',
                      'contents' => [],
                      'line_nr' => {},
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' expose'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'exp'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' name
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
                  'text' => 'Command'
                }
              ],
              [
                'class',
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'type',
                {
                  'contents' => [],
                  'parent' => {},
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
                'name',
                {
                  'text' => 'expose'
                }
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {
                  'text' => 'name'
                }
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 21
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'defun',
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
                  'text' => 'apply function &rest arguments
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
                  'text' => 'Function'
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
                  'text' => 'apply'
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
                  'text' => 'function'
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
                  'text' => '&rest'
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
                  'text' => 'arguments'
                }
              ]
            ],
            'def_command' => 'defun',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'defun',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 22
            },
            'original_def_cmdname' => 'defun'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 89,
        'macro' => ''
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
      'cmdname' => 'deffn',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 92,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
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
                {}
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'deffn',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 23
            },
            'original_def_cmdname' => 'deffn'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deffn',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 95,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
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
                {}
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'deffn',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 24
            },
            'original_def_cmdname' => 'deffn'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'defvr',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 98,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
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
                {}
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'defvr',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'defvr',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 5
            },
            'original_def_cmdname' => 'defvr'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'defvr',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 101,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
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
                {}
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'defvr',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'defvr',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 6
            },
            'original_def_cmdname' => 'defvr'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypefn',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 104,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A5'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'type',
                {}
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
                {}
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'deftypefn',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {},
              'type' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deftypefn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 25
            },
            'original_def_cmdname' => 'deftypefn'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypefn',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 107,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A5'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'type',
                {}
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
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {}
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
                {}
              ]
            ],
            'def_command' => 'deftypefn',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {},
              'type' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deftypefn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 26
            },
            'original_def_cmdname' => 'deftypefn'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypevr',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 110,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A5'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'type',
                {}
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
                {}
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'deftypevr',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {},
              'type' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deftypevr',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 7
            },
            'original_def_cmdname' => 'deftypevr'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypevr',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 113,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 't',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A5'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'type',
                {}
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
                {}
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'deftypevr',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {},
              'type' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deftypevr',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 8
            },
            'original_def_cmdname' => 'deftypevr'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftp',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 116,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
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
                {}
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'deftp',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deftp',
              'index_name' => 'tp',
              'index_prefix' => 't',
              'number' => 2
            },
            'original_def_cmdname' => 'deftp'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftp',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 119,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
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
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {}
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
                {}
              ]
            ],
            'def_command' => 'deftp',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deftp',
              'index_name' => 'tp',
              'index_prefix' => 't',
              'number' => 3
            },
            'original_def_cmdname' => 'deftp'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'defcv',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 122,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A5'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
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
                {}
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
                {}
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'defcv',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'defcv',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 9
            },
            'original_def_cmdname' => 'defcv'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftp',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 125,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A5'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
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
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {}
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
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {}
              ]
            ],
            'def_command' => 'deftp',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deftp',
              'index_name' => 'tp',
              'index_prefix' => 't',
              'number' => 4
            },
            'original_def_cmdname' => 'deftp'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypecv',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 128,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A5'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A6'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
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
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'type',
                {}
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
                {}
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'deftypecv',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' of '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypecv',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 10
            },
            'original_def_cmdname' => 'deftypecv'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypecv',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 131,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'option',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A5'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A6'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
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
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'type',
                {}
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
                {}
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'deftypecv',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' of '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypecv',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 11
            },
            'original_def_cmdname' => 'deftypecv'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'defop',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 134,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A5'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
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
                {}
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
                {}
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'defop',
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'defop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 27
            },
            'original_def_cmdname' => 'defop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'defop',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 137,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A5'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
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
                {}
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
                {}
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'defop',
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'defop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 28
            },
            'original_def_cmdname' => 'defop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 140,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A5'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A6'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
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
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'type',
                {}
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
                {}
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 29
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypeop',
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 143,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A5'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A6'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
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
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'type',
                {}
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
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {}
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
                {}
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
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
                  'text' => ' on '
                },
                {},
                {}
              ],
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 30
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypefn',
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'code then var'
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
                      'text' => 'ret_type'
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
                      'text' => 'fun_name'
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 146,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {
                  'contents' => [],
                  'parent' => {},
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
                'type',
                {
                  'contents' => [],
                  'parent' => {},
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
                'name',
                {
                  'contents' => [],
                  'parent' => {},
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
                'typearg',
                {}
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
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {}
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
                {}
              ]
            ],
            'def_command' => 'deftypefn',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {},
              'type' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deftypefn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 31
            },
            'original_def_cmdname' => 'deftypefn'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
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
      'cmdname' => 'deftypefn',
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'var then code'
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
                      'text' => 'ret_type1'
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
                      'text' => 'fun_name1'
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 149,
                    'macro' => ''
                  },
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
                          'text' => 'A2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
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
                          'text' => 'A3'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
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
                          'text' => 'A4'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
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
          'extra' => {
            'def_args' => [
              [
                'category',
                {
                  'contents' => [],
                  'parent' => {},
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
                'type',
                {
                  'contents' => [],
                  'parent' => {},
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
                'name',
                {
                  'contents' => [],
                  'parent' => {},
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
                'arg',
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {}
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
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'typearg',
                {}
              ]
            ],
            'def_command' => 'deftypefn',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {},
              'type' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deftypefn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 32
            },
            'original_def_cmdname' => 'deftypefn'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'line_nr' => {},
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[8];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[10]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[10];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[12]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[12];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[12]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[10]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[13]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[14]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[14];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[14]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[15]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[16]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[16]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[16]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[16];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[16]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[10]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[16]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[17]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[8][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[8]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[8][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[21][1] = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[10];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[24][1] = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[12];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[26][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[14]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[26][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[29][1] = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[16];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[8];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[8]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[6]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[10];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[12]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[12];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[12]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[6]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[13]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[4][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[4][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[19][1] = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[22][1] = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[8];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[24][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[10]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[24][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[27][1] = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[12];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[9][1] = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[14][1] = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[6];
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[11]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[13];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[13]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[14]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[15]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[15]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[15];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[15]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[15]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[16]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[17]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[18]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[19]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[9][1] = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[14][1] = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[25][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[25][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[27][1] = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[30][1] = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[32][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[13]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[32][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[35][1] = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[15];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[42][1] = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[17];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[43][1] = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[18];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[11]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[12];
$result_trees{'all_commands_delimiters'}{'contents'}[12]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[13]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[14]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_args'}[7][1] = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_args'}[14][1] = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[15];
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[15]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[16]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[17]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_args'}[17][1] = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_args'}[20][1] = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_args'}[22][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_args'}[22][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_args'}[25][1] = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[18];
$result_trees{'all_commands_delimiters'}{'contents'}[18]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[19]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[20]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_args'}[19][1] = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_args'}[22][1] = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_args'}[24][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_args'}[24][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_args'}[27][1] = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[21];
$result_trees{'all_commands_delimiters'}{'contents'}[21]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[22]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[23]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_args'}[17][1] = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_args'}[20][1] = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_args'}[22][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_args'}[22][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_args'}[25][1] = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[24];
$result_trees{'all_commands_delimiters'}{'contents'}[24]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[25]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[26]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[11]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[19][1] = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[22][1] = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[24][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[9]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[24][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[27][1] = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[27];
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[27]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[28]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[29]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[4]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[8];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[8]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_args'}[17][1] = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_args'}[20][1] = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_args'}[22][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_args'}[22][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_args'}[25][1] = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[8];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[30];
$result_trees{'all_commands_delimiters'}{'contents'}[30]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[31]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[32]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[6]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[4]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[8];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[10]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[10];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[10]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[4]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[19][1] = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[22][1] = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[24][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[8]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[24][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[27][1] = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[10];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[33];
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[33]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[34]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[35]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[36];
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[36]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[36]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[37]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[38]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[39];
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[4]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[39]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[40]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[41]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[42];
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[4]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[42]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[43]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[44]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[45];
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[45]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[46]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[47]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[48];
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[48]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[48]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[49]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[50]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[51];
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[4]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[51]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[52]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[53]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[54];
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[54]{'contents'}[0]{'args'}[0]{'contents'}[4]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[54]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[55]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[56]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[57];
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[57]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[57]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[58]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[59]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[60];
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[60]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[60]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[61]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[62]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[63];
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[4]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[63]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[64]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[65]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[6]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[66];
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[66]{'contents'}[0]{'args'}[0]{'contents'}[4]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[66]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[67]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[68]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[69];
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[69]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[69]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[70]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[71]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[72];
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[72]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[72]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[73]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[74]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'}[1]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[6]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'def_args'}[1][1] = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'def_args'}[3][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'def_args'}[3][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'def_args'}[5][1];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'def_args'}[3][1];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'def_args'}[5][1];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[75];
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[75]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[75]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[76]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[77]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[78]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[78]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[78]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[78]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[78]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[78]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[78]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[78]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[78]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[78]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[78]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[78]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[78]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[78]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[78]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[78];
$result_trees{'all_commands_delimiters'}{'contents'}[78]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[79]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[80]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[81];
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[81]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[81]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[82]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[83]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[84];
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[84]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[84]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[85]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[86]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[87];
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[87]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[87]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[88]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[89]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[90];
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[90]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[90]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[91]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[92]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[93];
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[93]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[93]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[94]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[95]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[96];
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[96]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[96]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[97]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[98]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[99];
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[99]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[99]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[100]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[101]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[102];
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[102]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[102]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[103]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[104]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[105];
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[105]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[105]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[106]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[107]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[108];
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[108]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[108]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[109]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[110]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[111];
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[111]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[111]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[112]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[113]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[114];
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[114]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[114]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[115]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[116]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[11]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'extra'}{'def_args'}[10][1] = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[117];
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[117]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[117]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[118]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[119]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[11]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'extra'}{'def_args'}[10][1] = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[120];
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[120]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[120]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[121]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[122]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[123];
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[123]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[123]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[124]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[125]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[126];
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[126]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[126]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[127]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[128]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[11]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'extra'}{'def_args'}[10][1] = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[129];
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[129]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[129]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[130]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[131]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[11]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'extra'}{'def_args'}[10][1] = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[132];
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[132]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[132]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[133]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[134]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[11]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[13]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[13];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[13]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[13]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[14]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_args'}[4][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[5]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_args'}[4][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_args'}[10][1] = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_args'}[12][1] = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[13];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[135];
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[135]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[135]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[136]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[137]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[11]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[13]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[13];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[13]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[13]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[14]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_args'}[4][1]{'contents'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[5]{'contents'};
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_args'}[4][1]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_args'}[10][1] = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_args'}[12][1] = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[13];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'parent'} = $result_trees{'all_commands_delimiters'}{'contents'}[138];
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'line_nr'} = $result_trees{'all_commands_delimiters'}{'contents'}[138]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'};
$result_trees{'all_commands_delimiters'}{'contents'}[138]{'parent'} = $result_trees{'all_commands_delimiters'};
$result_trees{'all_commands_delimiters'}{'contents'}[139]{'parent'} = $result_trees{'all_commands_delimiters'};

$result_texis{'all_commands_delimiters'} = '@deffn Command @var{forward--char} @var{nchars} {argument2} {argument3}         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end deffn

@defvr Variable fill-column {argument1} {argument2}         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end defvr

@deftypefn {Library Function} int foobar (int @var{foo}, float @var{bar})
@end deftypefn

@deftypefn {Library Function} int foobar (int @var{foo}, float @var{bar})         (arg in brace, {[something} @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) ct@*@* last
@end deftypefn

@deftypefn {Library Function} int foobug {[something}
@end deftypefn

@deftypefn stacks private push (@var{s}:in out stack;                  @var{n}:in integer) ; ;barg aarg; ; end
@end deftypefn

@deftypevr {Global Flag} int enable         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end deftypevr

@deftp {Data type} pair car cdr         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end deftp

@defcv {Class Option} Window border-pattern         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end defcv

@deftypecv {Class Option2} Window @code{int} border-pattern         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end deftypecv

@defop Operation windows expose         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end defop

@deftypeop Operation2 W,indow @code{int} expose         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end deftypeop

@deftypeop Operation5 Window @code{int} expose type arg
@end deftypeop

@deftypeop Operation3 {W,indow} @code{int} {e,xpose} type arg
@end deftypeop

@deftypeop Operation4 {,Window} @code{int} {,expose} type arg
@end deftypeop

@deftypeop Operation6 W,indow @code{int} e,xpose type arg
@end deftypeop

@deftypeop Operation7 ,Window @code{int} ,expose type arg
@end deftypeop

@deftypeop Operation13 {W)indow} @code{int} {e)xpose} type arg
@end deftypeop

@deftypeop Operation14 {)Window} @code{int} {)expose} type arg
@end deftypeop

@deftypeop Operation16 W)indow @code{int} e)xpose type arg
@end deftypeop

@deftypeop Operation17 )Window @code{int} )expose type arg
@end deftypeop

@deftypeop Operation18 {W;indow} @code{int} {e;xpose} type arg
@end deftypeop

@deftypeop Operation19 {;Window} @code{int} {;expose} type arg
@end deftypeop

@deftypeop Operation20 W;indow @code{int} e;xpose type arg
@end deftypeop

@deftypeop Operation21 ;Window @code{int} ;expose type arg
@end deftypeop

@deftypeop Command@code{com} {Window@code{int}} expose@var{exp} name
@end deftypeop

@defun apply function &rest arguments
@end defun

@deffn @var{A1} @var{A2} @var{A3} @var{A4}
@end deffn

@deffn @code{A1} @code{A2} @code{A3} @code{A4}
@end deffn

@defvr @var{A1} @var{A2} @var{A3} @var{A4}
@end defvr

@defvr @code{A1} @code{A2} @code{A3} @code{A4}
@end defvr

@deftypefn @var{A1} @var{A2} @var{A3} @var{A4} @var{A5}
@end deftypefn

@deftypefn @code{A1} @code{A2} @code{A3} @code{A4} @code{A5}
@end deftypefn

@deftypevr @var{A1} @var{A2} @var{A3} @var{A4} @var{A5}
@end deftypevr

@deftypevr @code{A1} @t{A2} @code{A3} @code{A4} @code{A5}
@end deftypevr

@deftp @var{A1} @var{A2} @var{A3} @var{A4}
@end deftp

@deftp @code{A1} @code{A2} @code{A3} @code{A4}
@end deftp

@defcv @var{A1} @var{A2} @var{A3} @var{A4} @var{A5}
@end defcv

@deftp @code{A1} @code{A2} @code{A3} @code{A4} @code{A5}
@end deftp

@deftypecv @var{A1} @var{A2} @var{A3} @var{A4} @var{A5} @var{A6}
@end deftypecv

@deftypecv @code{A1} @code{A2} @option{A3} @code{A4} @code{A5} @code{A6}
@end deftypecv

@defop @var{A1} @var{A2} @var{A3} @var{A4} @var{A5}
@end defop

@defop @code{A1} @code{A2} @code{A3} @code{A4} @code{A5}
@end defop

@deftypeop @var{A1} @var{A2} @var{A3} @var{A4} @var{A5} @var{A6}
@end deftypeop

@deftypeop @code{A1} @code{A2} @code{A3} @code{A4} @code{A5} @code{A6}
@end deftypeop

@deftypefn {code then var} {ret_type} {fun_name} @code{A1} @var{A2} @code{A3} @var{A4}
@end deftypefn

@deftypefn {var then code} {ret_type1} {fun_name1} @var{A1} @code{A2} @var{A3} @code{A4}
@end deftypefn
';


$result_texts{'all_commands_delimiters'} = 'Command forward--char nchars argument2 argument3         (arg in brace, [something in v--ar, in, b , comma apref p]) last

Variable fill-column argument1 argument2         (arg in brace, [something in v--ar, in, b , comma apref p]) last

Library Function int foobar (int foo, float bar)

Library Function int foobar (int foo, float bar)         (arg in brace, [something in v--ar, in, b , comma apref p]) ct

 last

Library Function int foobug [something

stacks private push (s:in out stack;                  n:in integer) ; ;barg aarg; ; end

Global Flag int enable         (arg in brace, [something in v--ar, in, b , comma apref p]) last

Data type pair car cdr         (arg in brace, [something in v--ar, in, b , comma apref p]) last

Class Option Window border-pattern         (arg in brace, [something in v--ar, in, b , comma apref p]) last

Class Option2 Window int border-pattern         (arg in brace, [something in v--ar, in, b , comma apref p]) last

Operation windows expose         (arg in brace, [something in v--ar, in, b , comma apref p]) last

Operation2 W,indow int expose         (arg in brace, [something in v--ar, in, b , comma apref p]) last

Operation5 Window int expose type arg

Operation3 W,indow int e,xpose type arg

Operation4 ,Window int ,expose type arg

Operation6 W,indow int e,xpose type arg

Operation7 ,Window int ,expose type arg

Operation13 W)indow int e)xpose type arg

Operation14 )Window int )expose type arg

Operation16 W)indow int e)xpose type arg

Operation17 )Window int )expose type arg

Operation18 W;indow int e;xpose type arg

Operation19 ;Window int ;expose type arg

Operation20 W;indow int e;xpose type arg

Operation21 ;Window int ;expose type arg

Commandcom Windowint exposeexp name

apply function &rest arguments

A1 A2 A3 A4

A1 A2 A3 A4

A1 A2 A3 A4

A1 A2 A3 A4

A1 A2 A3 A4 A5

A1 A2 A3 A4 A5

A1 A2 A3 A4 A5

A1 A2 A3 A4 A5

A1 A2 A3 A4

A1 A2 A3 A4

A1 A2 A3 A4 A5

A1 A2 A3 A4 A5

A1 A2 A3 A4 A5 A6

A1 A2 A3 A4 A5 A6

A1 A2 A3 A4 A5

A1 A2 A3 A4 A5

A1 A2 A3 A4 A5 A6

A1 A2 A3 A4 A5 A6

code then var ret_type fun_name A1 A2 A3 A4

var then code ret_type1 fun_name1 A1 A2 A3 A4
';

$result_errors{'all_commands_delimiters'} = [];



$result_converted{'plaintext'}->{'all_commands_delimiters'} = ' -- Command: FORWARD--CHAR NCHARS argument2 argument3 (arg in brace,
          [something IN V--AR, in, b , comma aPREF p]) last

 -- Variable: fill-column argument1 argument2 (arg in brace, [something
          IN V--AR, in, b , comma aPREF p]) last

 -- Library Function: int foobar (int FOO, float BAR)

 -- Library Function: int foobar (int FOO, float BAR) (arg in brace,
          [something IN V--AR, in, b , comma aPREF p]) ct

          last

 -- Library Function: int foobug [something

 -- stacks: private push (S:in out stack; N:in integer) ; ;barg aarg; ;
          end

 -- Global Flag: int enable (arg in brace, [something IN V--AR, in, b ,
          comma aPREF p]) last

 -- Data type: pair car cdr (arg in brace, [something IN V--AR, in, b ,
          comma aPREF p]) last

 -- Class Option of Window: border-pattern (arg in brace, [something IN
          V--AR, in, b , comma aPREF p]) last

 -- Class Option2 of Window: `int\' border-pattern (arg in brace,
          [something IN V--AR, in, b , comma aPREF p]) last

 -- Operation on windows: expose (arg in brace, [something IN V--AR, in,
          b , comma aPREF p]) last

 -- Operation2 on W,indow: `int\' expose (arg in brace, [something IN
          V--AR, in, b , comma aPREF p]) last

 -- Operation5 on Window: `int\' expose type arg

 -- Operation3 on W,indow: `int\' e,xpose type arg

 -- Operation4 on ,Window: `int\' ,expose type arg

 -- Operation6 on W,indow: `int\' e,xpose type arg

 -- Operation7 on ,Window: `int\' ,expose type arg

 -- Operation13 on W)indow: `int\' e)xpose type arg

 -- Operation14 on )Window: `int\' )expose type arg

 -- Operation16 on W)indow: `int\' e)xpose type arg

 -- Operation17 on )Window: `int\' )expose type arg

 -- Operation18 on W;indow: `int\' e;xpose type arg

 -- Operation19 on ;Window: `int\' ;expose type arg

 -- Operation20 on W;indow: `int\' e;xpose type arg

 -- Operation21 on ;Window: `int\' ;expose type arg

 -- Command on `com\': Window`int\' expose EXP name

 -- Function: apply function &rest arguments

 -- A1: A2 A3 A4

 -- `A1\': `A2\' `A3\' `A4\'

 -- A1: A2 A3 A4

 -- `A1\': `A2\' `A3\' `A4\'

 -- A1: A2 A3 A4 A5

 -- `A1\': `A2\' `A3\' `A4\' `A5\'

 -- A1: A2 A3 A4 A5

 -- `A1\': A2 `A3\' `A4\' `A5\'

 -- A1: A2 A3 A4

 -- `A1\': `A2\' `A3\' `A4\'

 -- A1 of A2: A3 A4 A5

 -- `A1\': `A2\' `A3\' `A4\' `A5\'

 -- A1 of A2: A3 A4 A5 A6

 -- `A1\' of `A2\': `A3\' `A4\' `A5\' `A6\'

 -- A1 on A2: A3 A4 A5

 -- `A1\' on `A2\': `A3\' `A4\' `A5\'

 -- A1 on A2: A3 A4 A5 A6

 -- `A1\' on `A2\': `A3\' `A4\' `A5\' `A6\'

 -- code then var: ret_type fun_name `A1\' A2 `A3\' A4

 -- var then code: ret_type1 fun_name1 A1 `A2\' A3 `A4\'
';

1;
