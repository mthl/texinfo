use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'wrong_braces_simple'} = {
  'contents' => [
    {
      'cmdname' => 'deffn',
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
                  'text' => 'truc machin bidule chose and 
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
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
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
              'in_code' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'machin',
              'number' => 1
            },
            'original_def_cmdname' => 'deffn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
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
                  'text' => 'deffn'
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
            'command_argument' => 'deffn',
            'text_arg' => 'deffn'
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
      'cmdname' => 'deffn',
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
                  'text' => 'truc machin bidule chose and  after
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
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
                }
              ],
              [
                'spaces',
                {
                  'text' => '  ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {
                  'text' => 'after'
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
              'in_code' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'machin',
              'number' => 2
            },
            'original_def_cmdname' => 'deffn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 4,
            'macro' => ''
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
                  'text' => 'deffn'
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
            'command_argument' => 'deffn',
            'text_arg' => 'deffn'
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
      'cmdname' => 'deffn',
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
                  'text' => 'truc machin bidule chose and '
                },
                {
                  'contents' => [
                    {
                      'text' => '
',
                      'type' => 'empty_spaces_before_argument'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
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
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
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
              'in_code' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'machin',
              'number' => 3
            },
            'original_def_cmdname' => 'deffn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 7,
            'macro' => ''
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
                  'text' => 'deffn'
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
            'command_argument' => 'deffn',
            'text_arg' => 'deffn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 8,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
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
      'cmdname' => 'deffn',
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
                  'text' => 'truc machin bidule chose and '
                },
                {
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'and after'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_space_at_end_def_bracketed'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
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
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
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
              'in_code' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'machin',
              'number' => 4
            },
            'original_def_cmdname' => 'deffn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 10,
            'macro' => ''
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
                  'text' => 'deffn'
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
            'command_argument' => 'deffn',
            'text_arg' => 'deffn'
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
      'cmdname' => 'deffn',
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
                  'text' => 'a b c d e
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
                'name',
                {
                  'text' => 'b'
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
                  'text' => 'c'
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
                  'text' => 'd'
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
                  'text' => 'e'
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
              'in_code' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'b',
              'number' => 5
            },
            'original_def_cmdname' => 'deffn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 13,
            'macro' => ''
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
                  'text' => 'truc machin bidule chose and 
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
          'extra' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
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
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'machin',
              'number' => 6
            },
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 14,
            'macro' => ''
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
                  'text' => 'truc machin bidule chose and  after
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
          'extra' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
                }
              ],
              [
                'spaces',
                {
                  'text' => '  ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {
                  'text' => 'after'
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
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'machin',
              'number' => 7
            },
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 15,
            'macro' => ''
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
                  'text' => 'truc machin bidule chose and '
                },
                {
                  'contents' => [
                    {
                      'text' => '
',
                      'type' => 'empty_spaces_before_argument'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
          'extra' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
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
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'machin',
              'number' => 8
            },
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 16,
            'macro' => ''
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
                  'text' => 'truc machin bidule chose and '
                },
                {
                  'contents' => [
                    {
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'and after'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_space_at_end_def_bracketed'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
          'extra' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
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
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'machin',
              'number' => 9
            },
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 17,
            'macro' => ''
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
                  'text' => 'deffn'
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
            'command_argument' => 'deffn',
            'text_arg' => 'deffn'
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
      'line_nr' => {},
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[1]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'line_nr'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[1]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'extra'}{'end_command'} = $result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'line_nr'} = $result_trees{'wrong_braces_simple'}{'contents'}[2]{'contents'}[0]{'line_nr'};
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[3]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[4];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[10][1]{'contents'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[10][1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[4];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[1]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[4];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[4];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'extra'}{'end_command'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'line_nr'} = $result_trees{'wrong_braces_simple'}{'contents'}[4]{'contents'}[0]{'line_nr'};
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[5]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[6];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[10][1]{'contents'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[10][1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[1]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[6];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'extra'}{'end_command'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'line_nr'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'line_nr'};
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[7]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[8];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1]{'extra'}{'def_args'}[0][1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2]{'extra'}{'def_args'}[0][1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'extra'}{'def_args'}[10][1]{'contents'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'extra'}{'def_args'}[10][1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'extra'}{'def_args'}[0][1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[3]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'args'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'args'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'extra'}{'def_args'}[10][1]{'contents'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'extra'}{'def_args'}[10][1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'extra'}{'def_args'}[0][1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[4]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[5];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[5]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[5]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[5]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[5];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[5]{'extra'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[8];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[5]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[8];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'extra'}{'end_command'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[5];
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'line_nr'} = $result_trees{'wrong_braces_simple'}{'contents'}[8]{'contents'}[0]{'line_nr'};
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'parent'} = $result_trees{'wrong_braces_simple'};

$result_texis{'wrong_braces_simple'} = '@deffn truc machin bidule chose and 
@end deffn

@deffn truc machin bidule chose and  after
@end deffn

@deffn truc machin bidule chose and {
}@end deffn

@deffn truc machin bidule chose and { and after
}@end deffn

@deffn a b c d e
@deffnx truc machin bidule chose and 
@deffnx truc machin bidule chose and  after
@deffnx truc machin bidule chose and {
}@deffnx truc machin bidule chose and { and after
}@end deffn
';


$result_texts{'wrong_braces_simple'} = 'truc: machin bidule chose and

truc: machin bidule chose and  after

truc: machin bidule chose and 

truc: machin bidule chose and and after

a: b c d e
truc: machin bidule chose and
truc: machin bidule chose and  after
truc: machin bidule chose and 
truc: machin bidule chose and and after
';

$result_errors{'wrong_braces_simple'} = [
  {
    'error_line' => ':1: Misplaced }
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  },
  {
    'error_line' => ':1: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':4: Misplaced }
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  },
  {
    'error_line' => ':4: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':7: Misplaced {
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'Misplaced {',
    'type' => 'error'
  },
  {
    'error_line' => ':7: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':10: Misplaced {
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => 'Misplaced {',
    'type' => 'error'
  },
  {
    'error_line' => ':10: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':13: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':14: Misplaced }
',
    'file_name' => '',
    'line_nr' => 14,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  },
  {
    'error_line' => ':14: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 14,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':15: Misplaced }
',
    'file_name' => '',
    'line_nr' => 15,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  },
  {
    'error_line' => ':15: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 15,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':16: Misplaced {
',
    'file_name' => '',
    'line_nr' => 16,
    'macro' => '',
    'text' => 'Misplaced {',
    'type' => 'error'
  },
  {
    'error_line' => ':16: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 16,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':17: Misplaced {
',
    'file_name' => '',
    'line_nr' => 17,
    'macro' => '',
    'text' => 'Misplaced {',
    'type' => 'error'
  },
  {
    'error_line' => ':17: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 17,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  }
];


1;
