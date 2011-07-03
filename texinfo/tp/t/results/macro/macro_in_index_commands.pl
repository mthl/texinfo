use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'macro_in_index_commands'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'cp',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'cp
',
              'type' => 'raw'
            }
          ],
          'extra' => {
            'arg_line' => ' cp
',
            'macrobody' => 'cp
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 1,
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
          'args' => [
            {
              'parent' => {},
              'text' => 'fn',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'fn
',
              'type' => 'raw'
            }
          ],
          'extra' => {
            'arg_line' => ' fn 
',
            'macrobody' => 'fn
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 4,
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
          'args' => [
            {
              'parent' => {},
              'text' => 'syncodeindex-command',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@syncodeindex
',
              'type' => 'raw'
            }
          ],
          'extra' => {
            'arg_line' => ' syncodeindex-command 
',
            'macrobody' => '@syncodeindex
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 7,
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
            'line_nr' => 11,
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
            'line_nr' => 12,
            'macro' => 'syncodeindex-command'
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
              'text' => 'en',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'en
',
              'type' => 'raw'
            }
          ],
          'extra' => {
            'arg_line' => ' en 
',
            'macrobody' => 'en
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 14,
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
          'args' => [
            {
              'parent' => {},
              'text' => 'documentlanguage-command',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@documentlanguage
',
              'type' => 'raw'
            }
          ],
          'extra' => {
            'arg_line' => ' documentlanguage-command 
',
            'macrobody' => '@documentlanguage
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 17,
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'documentlanguage '
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
                      'text' => '  ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'en'
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
                'text_arg' => 'en'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 21,
                'macro' => ''
              },
              'parent' => {}
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
              'parent' => {},
              'text' => 'documentlanguage on its line
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
                      'text' => '  ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'en'
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
                'text_arg' => 'en'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 24,
                'macro' => 'documentlanguage-command'
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'line following documentlanguage
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
              'text' => 'truc',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'truc
',
              'type' => 'raw'
            }
          ],
          'extra' => {
            'arg_line' => ' truc 
',
            'macrobody' => 'truc
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 27,
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
                'line_nr' => 32,
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
              'text' => 'trucindex-command',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@trucindex
',
              'type' => 'raw'
            }
          ],
          'extra' => {
            'arg_line' => ' trucindex-command 
',
            'macrobody' => '@trucindex
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 35,
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'codeidx',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'codeidx
',
              'type' => 'raw'
            }
          ],
          'extra' => {
            'arg_line' => ' codeidx 
',
            'macrobody' => 'codeidx
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 39,
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
              'parent' => {},
              'text' => 'defcodeindex-entry',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'a @var{index entry} t@\'e @^{@dotless{i}}
',
              'type' => 'raw'
            }
          ],
          'extra' => {
            'arg_line' => ' defcodeindex-entry 
',
            'macrobody' => 'a @var{index entry} t@\'e @^{@dotless{i}}
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 45,
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
            'line_nr' => 51,
            'macro' => 'trucindex-command'
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
                    'line_nr' => 53,
                    'macro' => 'defcodeindex-entry'
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
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 53,
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
            'line_nr' => 59,
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
            'line_nr' => 62,
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
            'line_nr' => 64,
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
            'line_nr' => 65,
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
            'line_nr' => 67,
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
            'line_nr' => 68,
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
            'line_nr' => 70,
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
            'line_nr' => 72,
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
            'line_nr' => 75,
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
            'line_nr' => 78,
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
            'line_nr' => 81,
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
            'line_nr' => 84,
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
            'line_nr' => 87,
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
            'line_nr' => 90,
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
            'line_nr' => 93,
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
            'line_nr' => 96,
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
            'line_nr' => 99,
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
        'line_nr' => 49,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[1]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[2];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[2];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[3]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[2];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[4];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[4];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[5]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[4];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[7];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[7];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[8];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[8];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[10];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[10];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[11]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[10];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[11]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[12];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[12];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[12]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[13]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[12];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[13]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[14]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[15];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[15]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[15]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[15]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[15]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[15];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[15]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[16]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[17]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[18]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[19]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[19];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[19]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[19];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[19]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[20]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[19];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[20]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[21]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[22]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[23]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[24]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[24];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[24]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[24];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[24]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[25]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[24];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[25]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[26]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[27]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[27];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[27]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[27];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[27]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[28]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[27];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[28]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[29]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[30]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[30];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[30]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[30]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[30]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[30]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[30]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[30]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[30]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[30];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[30]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[31]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[32]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[32];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[32]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[32];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[32]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[33]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[32];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[33]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'contents'}[34]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'};
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'node'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1]{'extra'}{'misc_content'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'content'};
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[4];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'line_nr'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'line_nr'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[1] = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[2] = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[3];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[4];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[4] = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[5];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[5] = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[6];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'node'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'misc_content'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'};
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5]{'extra'}{'index_entry'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5]{'extra'}{'index_entry'}{'node'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5]{'extra'}{'misc_content'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5]{'extra'}{'index_entry'}{'content'};
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[7];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[7];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9]{'extra'}{'index_entry'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9]{'extra'}{'index_entry'}{'node'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9]{'extra'}{'misc_content'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9]{'extra'}{'index_entry'}{'content'};
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10]{'extra'}{'index_entry'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10]{'extra'}{'index_entry'}{'node'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10]{'extra'}{'misc_content'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10]{'extra'}{'index_entry'}{'content'};
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[11]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[12];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[12];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[12]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[13]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[14];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[14];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[14]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[15];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[15];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[15]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[16]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[17];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[17]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[17];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[17]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[18];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[18]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[18];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[18]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[19]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20]{'extra'}{'index_entry'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20]{'extra'}{'index_entry'}{'node'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20]{'extra'}{'misc_content'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20]{'extra'}{'index_entry'}{'content'};
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[20]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[21]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22]{'extra'}{'index_entry'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22]{'extra'}{'index_entry'}{'node'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22]{'extra'}{'misc_content'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22]{'extra'}{'index_entry'}{'content'};
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[22]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[23]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[24]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[24];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[24]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[25];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[25]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[25];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[25]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[26]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[27]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[27];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[27]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[28];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[28]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[28];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[28]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[29]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[30]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[30];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[30]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[31];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[31]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[31];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[31]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[32]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[33]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[33];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[33]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[34];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[34]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[34];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[34]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[35]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[36]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[36];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[36]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[37];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[37]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[37];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[37]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[38]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[39]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[39];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[39]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[40];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[40]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[40];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[40]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[41]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[42]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[42];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[42]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[43];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[43]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[43];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[43]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[44]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[45]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[45];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[45]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[46];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[46]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[46];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[46]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[47]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[48]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[48];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[48]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[49];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[49]{'args'}[0]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[49];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'contents'}[49]{'parent'} = $result_trees{'macro_in_index_commands'}{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'macro_in_index_commands'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'macro_in_index_commands'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_index_commands'};

$result_texis{'macro_in_index_commands'} = '@macro cp
cp
@end macro
@macro fn 
fn
@end macro
@macro syncodeindex-command 
@syncodeindex
@end macro

@syncodeindex cp fn
@syncodeindex cp fn

@macro en 
en
@end macro
@macro documentlanguage-command 
@documentlanguage
@end macro

documentlanguage @documentlanguage  en

documentlanguage on its line
@documentlanguage  en
line following documentlanguage

@macro truc 
truc
@end macro

definedx truc
@defindex truc
after

@macro trucindex-command 
@trucindex
@end macro

@macro codeidx 
codeidx
@end macro

@defcodeindex codeidx

@macro defcodeindex-entry 
a @var{index entry} t@\'e @^{@dotless{i}}
@end macro

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


$result_texts{'macro_in_index_commands'} = '


documentlanguage 
documentlanguage on its line
line following documentlanguage


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

$result_sectioning{'macro_in_index_commands'} = {};

$result_nodes{'macro_in_index_commands'} = {
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

$result_menus{'macro_in_index_commands'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'macro_in_index_commands'} = [
  {
    'error_line' => ':21: warning: @documentlanguage should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 21,
    'macro' => '',
    'text' => '@documentlanguage should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':78: warning: Printing an index `ky\' merged in another one `pg\'
',
    'file_name' => '',
    'line_nr' => 78,
    'macro' => '',
    'text' => 'Printing an index `ky\' merged in another one `pg\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':81: warning: Printing an index `truc\' merged in another one `fn\'
',
    'file_name' => '',
    'line_nr' => 81,
    'macro' => '',
    'text' => 'Printing an index `truc\' merged in another one `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':84: warning: Printing an index `truc\' merged in another one `fn\'
',
    'file_name' => '',
    'line_nr' => 84,
    'macro' => '',
    'text' => 'Printing an index `truc\' merged in another one `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':87: warning: Printing an index `cp\' merged in another one `fn\'
',
    'file_name' => '',
    'line_nr' => 87,
    'macro' => '',
    'text' => 'Printing an index `cp\' merged in another one `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':90: warning: Printing an index `cp\' merged in another one `fn\'
',
    'file_name' => '',
    'line_nr' => 90,
    'macro' => '',
    'text' => 'Printing an index `cp\' merged in another one `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':93: warning: Printing an index `defg\' merged in another one `pg\'
',
    'file_name' => '',
    'line_nr' => 93,
    'macro' => '',
    'text' => 'Printing an index `defg\' merged in another one `pg\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':96: warning: Printing an index `abc\' merged in another one `defg\'
',
    'file_name' => '',
    'line_nr' => 96,
    'macro' => '',
    'text' => 'Printing an index `abc\' merged in another one `defg\'',
    'type' => 'warning'
  }
];


$result_indices{'macro_in_index_commands'} = {
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
