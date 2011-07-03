use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements);

use utf8;

$result_trees{'value_in_index_commands'} = {
  'contents' => [
    {
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
                  'extra' => {
                    'command' => {}
                  },
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
                  'extra' => {
                    'command' => {}
                  },
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
                      'extra' => {
                        'command' => {}
                      },
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
                  'extra' => {
                    'command' => {}
                  },
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
            'line_nr' => 18,
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
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'trucindex',
              'index_name' => 'truc',
              'index_prefix' => 'truc',
              'node' => {},
              'number' => 1
            },
            'misc_content' => []
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
                  'extra' => {
                    'command' => {}
                  },
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
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 26,
                    'macro' => ''
                  },
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
                          'line_nr' => {},
                          'parent' => {}
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => '^',
                  'contents' => [],
                  'line_nr' => {},
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
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {},
                {},
                {},
                {},
                {},
                {}
              ],
              'index_at_command' => 'codeidxindex',
              'index_name' => 'codeidx',
              'index_prefix' => 'codeidx',
              'node' => {},
              'number' => 1
            },
            'misc_content' => []
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
                  'extra' => {
                    'command' => {}
                  },
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
                  'extra' => {
                    'command' => {}
                  },
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
            'line_nr' => 30,
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
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'kindex',
              'index_name' => 'ky',
              'index_prefix' => 'k',
              'node' => {},
              'number' => 1
            },
            'misc_content' => []
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 32,
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
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'pindex',
              'index_name' => 'pg',
              'index_prefix' => 'p',
              'node' => {},
              'number' => 1
            },
            'misc_content' => []
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
                  'extra' => {
                    'command' => {}
                  },
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
            'line_nr' => 35,
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
            'line_nr' => 37,
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
            'line_nr' => 38,
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
            'line_nr' => 40,
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
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'defgindex',
              'index_name' => 'defg',
              'index_prefix' => 'defg',
              'node' => {},
              'number' => 1
            },
            'misc_content' => []
          },
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
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'abcindex',
              'index_name' => 'abc',
              'index_prefix' => 'abc',
              'node' => {},
              'number' => 1
            },
            'misc_content' => []
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 45,
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
                  'extra' => {
                    'command' => {}
                  },
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
            'line_nr' => 48,
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
                  'extra' => {
                    'command' => {}
                  },
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
            'line_nr' => 51,
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
                  'extra' => {
                    'command' => {}
                  },
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
            'line_nr' => 54,
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
                  'extra' => {
                    'command' => {}
                  },
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
            'line_nr' => 57,
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
            'line_nr' => 60,
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
            'line_nr' => 63,
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
                  'extra' => {
                    'command' => {}
                  },
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
            'line_nr' => 66,
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
                  'extra' => {
                    'command' => {}
                  },
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
            'line_nr' => 69,
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
            'line_nr' => 72,
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
        'line_nr' => 22,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[2];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[2];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[4];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[4];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[5];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[5];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[7];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[7]{'args'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[7];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[11];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[11]{'args'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[11];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[11]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[12]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[13];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[13]{'args'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[13];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[13]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[14]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[15];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[15]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[15]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[15]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[15];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[15]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[16]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[17]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[17];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[17]{'args'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[17];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[17]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'contents'}[18]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'node'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'extra'}{'misc_content'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'content'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[4];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'line_nr'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'line_nr'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[1] = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[2] = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[3];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[4];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[4] = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[5];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[5] = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'node'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'misc_content'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'line_nr'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'extra'}{'index_entry'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'extra'}{'index_entry'}{'node'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'extra'}{'misc_content'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'extra'}{'index_entry'}{'content'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[7];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[7];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9]{'extra'}{'index_entry'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9]{'extra'}{'index_entry'}{'node'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9]{'extra'}{'misc_content'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9]{'extra'}{'index_entry'}{'content'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10]{'extra'}{'index_entry'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10]{'extra'}{'index_entry'}{'node'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10]{'extra'}{'misc_content'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10]{'extra'}{'index_entry'}{'content'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[11]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[12];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[12];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[12]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[13]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[14];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[14];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[14]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[15];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[15];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[15]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[16]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[17];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[17];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[17]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[18];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[18];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[18]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[19]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20]{'extra'}{'index_entry'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20]{'extra'}{'index_entry'}{'node'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20]{'extra'}{'misc_content'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20]{'extra'}{'index_entry'}{'content'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[20]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[21]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22]{'extra'}{'index_entry'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22]{'extra'}{'index_entry'}{'node'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22]{'extra'}{'misc_content'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22]{'extra'}{'index_entry'}{'content'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[22]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[23]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[24]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[24];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[24]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[25];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[25];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[25]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[26]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[27]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[27];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[27]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[28];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[28];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[28]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[29]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[30]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[30];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[30]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[31];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[31];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[31]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[32]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[33]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[33];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[33]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[34];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[34];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[34]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[35]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[36]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[36];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[36]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[37];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[37];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[37]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[38]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[39]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[39];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[39]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[40];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[40];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[40]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[41]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[42]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[42];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[42]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[43];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[43];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[43]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[44]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[45]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[45];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[45]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[46];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[46];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[46]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[47]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[48]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[48];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[48]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[49];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[49];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[49]{'parent'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'value_in_index_commands'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'parent'} = $result_trees{'value_in_index_commands'};

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

@set codeidx codeidx

@defcodeindex codeidx

@set defcodeindex_entry a @var{index entry} t@\'e @^{@dotless{i}}

@node Top

@trucindex index truc

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

$result_sectioning{'value_in_index_commands'} = {};

$result_nodes{'value_in_index_commands'} = {
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

$result_menus{'value_in_index_commands'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'value_in_index_commands'} = [
  {
    'error_line' => ':51: warning: Printing an index `ky\' merged in another one `pg\'
',
    'file_name' => '',
    'line_nr' => 51,
    'macro' => '',
    'text' => 'Printing an index `ky\' merged in another one `pg\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':54: warning: Printing an index `truc\' merged in another one `fn\'
',
    'file_name' => '',
    'line_nr' => 54,
    'macro' => '',
    'text' => 'Printing an index `truc\' merged in another one `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':57: warning: Printing an index `truc\' merged in another one `fn\'
',
    'file_name' => '',
    'line_nr' => 57,
    'macro' => '',
    'text' => 'Printing an index `truc\' merged in another one `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':60: warning: Printing an index `cp\' merged in another one `fn\'
',
    'file_name' => '',
    'line_nr' => 60,
    'macro' => '',
    'text' => 'Printing an index `cp\' merged in another one `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':63: warning: Printing an index `cp\' merged in another one `fn\'
',
    'file_name' => '',
    'line_nr' => 63,
    'macro' => '',
    'text' => 'Printing an index `cp\' merged in another one `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':66: warning: Printing an index `defg\' merged in another one `pg\'
',
    'file_name' => '',
    'line_nr' => 66,
    'macro' => '',
    'text' => 'Printing an index `defg\' merged in another one `pg\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':69: warning: Printing an index `abc\' merged in another one `defg\'
',
    'file_name' => '',
    'line_nr' => 69,
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
