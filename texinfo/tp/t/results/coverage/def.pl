use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'def'} = {
  'contents' => [
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'c--ategory'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' d--effn_name a--rguments...
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
                  'text' => 'd--effn_name'
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
                  'text' => 'a--rguments...'
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
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--effn
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
            'line_nr' => 4,
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
        'line_nr' => 2,
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
                  'text' => 'cate--gory de--ffn_name ar--guments    more args '
                },
                {
                  'cmdname' => '*',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' even more so
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
                  'text' => 'cate--gory'
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
                  'text' => 'de--ffn_name'
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
                  'text' => 'ar--guments'
                }
              ],
              [
                'spaces',
                {
                  'text' => '    ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {
                  'text' => 'more'
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
                  'text' => 'args'
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
                  'text' => 'even'
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
                  'text' => 'more'
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
                  'text' => 'so'
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
              'number' => 2
            },
            'original_def_cmdname' => 'deffn'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'def--fn
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
            'line_nr' => 9,
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
                  'text' => 'fset '
                },
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
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 11,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' a g
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
                  'text' => 'fset'
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
                  'text' => 'g'
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
              'number' => 3
            },
            'original_def_cmdname' => 'deffn'
          },
          'parent' => {},
          'type' => 'def_line'
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'cmde'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' truc '
                },
                {
                  'contents' => [],
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
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
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
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 4
            },
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 12,
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'Command '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'log trap'
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
                  'contents' => [],
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
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
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
              'number' => 5
            },
            'original_def_cmdname' => 'deffnx'
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'Command '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' log trap1'
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
                  'contents' => [],
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
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'Command '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'log trap2 '
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
                  'contents' => [],
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
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'cmde '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'id ule'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'b',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 16,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' truc
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
                  'text' => 'cmde'
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
                {
                  'text' => 'truc'
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
              'number' => 8
            },
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {},
          'parent' => {},
          'type' => 'def_line'
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
                  'text' => 'cmde2 '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'id '
                        },
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
                          'cmdname' => 'samp',
                          'contents' => [],
                          'line_nr' => {
                            'file_name' => '',
                            'line_nr' => 17,
                            'macro' => ''
                          },
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' ule'
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
                  'text' => ' truc
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
                  'text' => 'cmde2'
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
                {
                  'text' => 'truc'
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
              'number' => 9
            },
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {},
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' machin
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
                  'text' => 'machin'
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
              'number' => 10
            },
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 18,
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
                  'contents' => [],
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
                      'text' => 'bidule machin'
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
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
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
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 11
            },
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 19,
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
                  'text' => ' machin
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
                  'text' => 'machin'
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
              'number' => 12
            },
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 20,
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
                  'text' => ' followed by a comment
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
                  'text' => 'followed'
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
                  'text' => 'by'
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
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {
                  'text' => 'comment'
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
              'number' => 13
            },
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 21,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' comment
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
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
                  'text' => ' after a deff item
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
                  'text' => 'after'
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
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {
                  'text' => 'deff'
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
                  'text' => 'item'
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
              'number' => 14
            },
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 23,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' comment
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
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
                  'text' => ' deffnx before end deffn
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
                  'text' => 'deffnx'
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
                  'text' => 'before'
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
                  'text' => 'end'
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
                  'text' => 'deffn'
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
              'number' => 15
            },
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 25,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Various deff lines
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
            'line_nr' => 27,
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
$result_trees{'def'}{'contents'}[0]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[2];
$result_trees{'def'}{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'def'}{'contents'}[1]{'contents'}[2];
$result_trees{'def'}{'contents'}[1]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[2]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[0];
$result_trees{'def'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[10][1] = $result_trees{'def'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'def'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[3]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'def'}{'contents'}[3]{'contents'}[0];
$result_trees{'def'}{'contents'}[3]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[3];
$result_trees{'def'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[1];
$result_trees{'def'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[3];
$result_trees{'def'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[2];
$result_trees{'def'}{'contents'}[3]{'contents'}[2]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[3];
$result_trees{'def'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[3];
$result_trees{'def'}{'contents'}[3]{'extra'}{'end_command'} = $result_trees{'def'}{'contents'}[3]{'contents'}[2];
$result_trees{'def'}{'contents'}[3]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[4]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def'}{'contents'}[5]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[1];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'extra'}{'def_args'}[4][1]{'contents'} = $result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[3]{'contents'};
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'extra'}{'def_args'}[4][1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def'}{'contents'}[5]{'contents'}[1]{'extra'}{'def_args'}[0][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def'}{'contents'}[5]{'contents'}[1]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[1];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[1]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'extra'}{'def_args'}[2][1]{'contents'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'extra'}{'def_args'}[2][1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'extra'}{'def_args'}[4][1]{'contents'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[4]{'contents'};
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'extra'}{'def_args'}[4][1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2]{'extra'}{'def_args'}[0][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'extra'}{'index_entry'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[2]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'extra'}{'def_args'}[2][1]{'contents'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'extra'}{'def_args'}[2][1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'extra'}{'def_args'}[4][1]{'contents'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[4]{'contents'};
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'extra'}{'def_args'}[4][1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'extra'}{'def_args'}[0][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'extra'}{'def_args'}[2][1]{'contents'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'extra'}{'def_args'}[2][1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'extra'}{'def_args'}[4][1]{'contents'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[4]{'contents'};
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'extra'}{'def_args'}[4][1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'extra'}{'def_args'}[0][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'extra'}{'index_entry'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'extra'}{'def_args'}[2][1] = $result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def'}{'contents'}[5]{'contents'}[5]{'extra'}{'def_args'}[0][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'extra'}{'index_entry'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'line_nr'} = $result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2]{'line_nr'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'extra'}{'def_args'}[2][1] = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'extra'}{'def_args'}[0][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'extra'}{'index_entry'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'line_nr'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[7]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[7]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[7];
$result_trees{'def'}{'contents'}[5]{'contents'}[7]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'def'}{'contents'}[5]{'contents'}[7]{'args'}[0]{'contents'}[0]{'contents'};
$result_trees{'def'}{'contents'}[5]{'contents'}[7]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[7]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[7]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def'}{'contents'}[5]{'contents'}[7]{'extra'}{'def_args'}[0][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[7]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def'}{'contents'}[5]{'contents'}[7]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[7]{'extra'}{'index_entry'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[7];
$result_trees{'def'}{'contents'}[5]{'contents'}[7]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[7]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[7]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[8]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[8]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[8]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[8]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[8]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[8];
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'def'}{'contents'}[5]{'contents'}[8]{'args'}[0]{'contents'}[0]{'contents'};
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[8]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'extra'}{'def_args'}[2][1]{'contents'} = $result_trees{'def'}{'contents'}[5]{'contents'}[8]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'extra'}{'def_args'}[2][1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[8]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def'}{'contents'}[5]{'contents'}[8]{'extra'}{'def_args'}[0][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def'}{'contents'}[5]{'contents'}[8]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'extra'}{'index_entry'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[8];
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[8]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[9]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[9]{'args'}[0]{'contents'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[9]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[9]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[9];
$result_trees{'def'}{'contents'}[5]{'contents'}[9]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'def'}{'contents'}[5]{'contents'}[9]{'args'}[0]{'contents'}[0]{'contents'};
$result_trees{'def'}{'contents'}[5]{'contents'}[9]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[9]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[9]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def'}{'contents'}[5]{'contents'}[9]{'extra'}{'def_args'}[0][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[9]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def'}{'contents'}[5]{'contents'}[9]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[9]{'extra'}{'index_entry'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[9];
$result_trees{'def'}{'contents'}[5]{'contents'}[9]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[9]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[9]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[10]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[10]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[5]{'contents'}[10]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[10]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[10]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[10]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[10];
$result_trees{'def'}{'contents'}[5]{'contents'}[10]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'def'}{'contents'}[5]{'contents'}[10]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'def'}{'contents'}[5]{'contents'}[10]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[10]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[10]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def'}{'contents'}[5]{'contents'}[10]{'extra'}{'def_args'}[0][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[10]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def'}{'contents'}[5]{'contents'}[10]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[10]{'extra'}{'index_entry'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[10];
$result_trees{'def'}{'contents'}[5]{'contents'}[10]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[10]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[10]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[11];
$result_trees{'def'}{'contents'}[5]{'contents'}[11]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[12]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[12]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[12]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[5]{'contents'}[12]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[12]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[12]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[12]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[12];
$result_trees{'def'}{'contents'}[5]{'contents'}[12]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'def'}{'contents'}[5]{'contents'}[12]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'def'}{'contents'}[5]{'contents'}[12]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[12]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[12]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def'}{'contents'}[5]{'contents'}[12]{'extra'}{'def_args'}[0][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[12]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def'}{'contents'}[5]{'contents'}[12]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[12]{'extra'}{'index_entry'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[12];
$result_trees{'def'}{'contents'}[5]{'contents'}[12]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[12]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[12]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[13];
$result_trees{'def'}{'contents'}[5]{'contents'}[13]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[14]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[14]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[14]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[14]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[5]{'contents'}[14]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[14]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[14]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[14]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[14];
$result_trees{'def'}{'contents'}[5]{'contents'}[14]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'def'}{'contents'}[5]{'contents'}[14]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'def'}{'contents'}[5]{'contents'}[14]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[14]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[14]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def'}{'contents'}[5]{'contents'}[14]{'extra'}{'def_args'}[0][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[14]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def'}{'contents'}[5]{'contents'}[14]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[14]{'extra'}{'index_entry'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[14];
$result_trees{'def'}{'contents'}[5]{'contents'}[14]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[14]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[14]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[15];
$result_trees{'def'}{'contents'}[5]{'contents'}[15]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[16]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[16]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[16]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[16]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[16]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[16]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[16]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[16];
$result_trees{'def'}{'contents'}[5]{'contents'}[16]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[16]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'extra'}{'end_command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[16];
$result_trees{'def'}{'contents'}[5]{'line_nr'} = $result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'def'}{'contents'}[5]{'parent'} = $result_trees{'def'};

$result_texis{'def'} = '
@deffn {c--ategory} d--effn_name a--rguments...
d--effn
@end deffn

@deffn cate--gory de--ffn_name ar--guments    more args @* even more so
def--fn
@end deffn

@deffn fset @var{i} a g
@deffnx {cmde} truc {}
@deffnx Command {log trap} {}
@deffnx Command { log trap1} {}  
@deffnx Command {log trap2 } {}
@deffnx cmde @b{id ule} truc
@deffnx cmde2 @b{id @samp{i} ule} truc
@deffnx{} machin
@deffnx{} {bidule machin}
@deffnx{truc} machin
@deffnx {truc} followed by a comment
@c comment
@deffnx {truc} after a deff item
@c comment
@deffnx {truc} deffnx before end deffn
Various deff lines
@end deffn
';


$result_texts{'def'} = '
c--ategory d--effn_name a--rguments...
d--effn

cate--gory de--ffn_name ar--guments    more args 
 even more so
def--fn

fset i a g
cmde truc 
Command log trap 
Command  log trap1   
Command log trap2  
cmde id ule truc
cmde2 id i ule truc
 machin
 bidule machin
truc machin
truc followed by a comment
truc after a deff item
truc deffnx before end deffn
Various deff lines
';

$result_errors{'def'} = [
  {
    'error_line' => ':2: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
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
    'error_line' => ':11: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 11,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':12: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 12,
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
    'error_line' => ':14: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 14,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
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
    'error_line' => ':16: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 16,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
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
  },
  {
    'error_line' => ':18: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 18,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':19: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 19,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':20: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 20,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':21: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 21,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':23: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 23,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':25: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 25,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  }
];



$result_converted{'plaintext'}->{'def'} = '
 -- c--ategory: d--effn_name a--rguments...
     d-effn

 -- cate--gory: de--ffn_name ar--guments more args
          even more so
     def-fn

 -- fset: I a g
 -- cmde: truc
 -- Command: log trap
 -- Command: log trap1
 -- Command: log trap2
 -- cmde: id ule truc
 -- cmde2: id `i\' ule truc
 -- : machin
 -- : bidule machin
 -- truc: machin
 -- truc: followed by a comment
 -- truc: after a deff item
 -- truc: deffnx before end deffn
     Various deff lines
';

1;
