use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'd--effn_name',
              'number' => 1
            },
            'original_def_cmdname' => 'deffn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
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
            }
          ],
          'parent' => {},
          'type' => 'def_item'
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
            'line_nr' => 4,
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'de--ffn_name',
              'number' => 2
            },
            'original_def_cmdname' => 'deffn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 6,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
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
            }
          ],
          'parent' => {},
          'type' => 'def_item'
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
            'line_nr' => 9,
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'i',
              'number' => 3
            },
            'original_def_cmdname' => 'deffn'
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'truc',
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
                  'extra' => {
                    'command' => {}
                  },
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'log trap',
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
                  'extra' => {
                    'command' => {}
                  },
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
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'log trap1'
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'log trap1',
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
                  'text' => 'Command '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'log trap2'
                    },
                    {
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_space_at_end_def_bracketed'
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'log trap2',
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'id ule',
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
                  'extra' => {
                    'command' => {}
                  },
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'id i ule',
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'machin',
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'bidule machin',
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'machin',
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'followed',
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
          'contents' => [
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
            }
          ],
          'parent' => {},
          'type' => 'inter_def_item'
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'after',
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
          'contents' => [
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
            }
          ],
          'parent' => {},
          'type' => 'inter_def_item'
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'deffnx',
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'Various deff lines
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {},
          'type' => 'def_item'
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
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[1];
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
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[1]{'contents'}[2];
$result_trees{'def'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[2];
$result_trees{'def'}{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'def'}{'contents'}[1]{'contents'}[2];
$result_trees{'def'}{'contents'}[1]{'line_nr'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'line_nr'};
$result_trees{'def'}{'contents'}[1]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[2]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[3];
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
$result_trees{'def'}{'contents'}[3]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[3];
$result_trees{'def'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'def'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[1];
$result_trees{'def'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[3];
$result_trees{'def'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[3]{'contents'}[2];
$result_trees{'def'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[3]{'contents'}[2];
$result_trees{'def'}{'contents'}[3]{'contents'}[2]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[3];
$result_trees{'def'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[3];
$result_trees{'def'}{'contents'}[3]{'extra'}{'end_command'} = $result_trees{'def'}{'contents'}[3]{'contents'}[2];
$result_trees{'def'}{'contents'}[3]{'line_nr'} = $result_trees{'def'}{'contents'}[3]{'contents'}[0]{'line_nr'};
$result_trees{'def'}{'contents'}[3]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[4]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[5];
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
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'line_nr'} = $result_trees{'def'}{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'def'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[1];
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
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[1]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[2];
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
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[2]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[2];
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
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[3]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[2];
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
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[4]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[5];
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
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'line_nr'} = $result_trees{'def'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'def'}{'contents'}[5]{'contents'}[5]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[6];
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
$result_trees{'def'}{'contents'}[5]{'contents'}[6]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[6]{'args'}[0]{'contents'}[2];
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
$result_trees{'def'}{'contents'}[5]{'contents'}[7]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[7]{'extra'}{'def_args'}[2][1];
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
$result_trees{'def'}{'contents'}[5]{'contents'}[8]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[8]{'extra'}{'def_args'}[2][1];
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
$result_trees{'def'}{'contents'}[5]{'contents'}[9]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[9]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[9]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[10]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[10];
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
$result_trees{'def'}{'contents'}[5]{'contents'}[10]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[10]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[10]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[11]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[11]{'contents'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[11];
$result_trees{'def'}{'contents'}[5]{'contents'}[11]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[12]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[12];
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
$result_trees{'def'}{'contents'}[5]{'contents'}[12]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[12]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[12]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[13]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[13]{'contents'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[13];
$result_trees{'def'}{'contents'}[5]{'contents'}[13]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[14]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[14];
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
$result_trees{'def'}{'contents'}[5]{'contents'}[14]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def'}{'contents'}[5]{'contents'}[14]{'extra'}{'def_args'}[2][1];
$result_trees{'def'}{'contents'}[5]{'contents'}[14]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[15]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[15]{'contents'}[0];
$result_trees{'def'}{'contents'}[5]{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[5]{'contents'}[15];
$result_trees{'def'}{'contents'}[5]{'contents'}[15]{'parent'} = $result_trees{'def'}{'contents'}[5];
$result_trees{'def'}{'contents'}[5]{'contents'}[16]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'def'}{'contents'}[5]{'contents'}[16];
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
c--ategory: d--effn_name a--rguments...
d-effn

cate--gory: de--ffn_name ar--guments    more args 
 even more so
def-fn

fset: i a g
cmde: truc 
Command: log trap 
Command: log trap1 
Command: log trap2 
cmde: id ule truc
cmde2: id i ule truc
: machin
: bidule machin
truc: machin
truc: followed by a comment
truc: after a deff item
truc: deffnx before end deffn
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



$result_converted{'plaintext'}->{'def'} = ' -- c--ategory: d--effn_name a--rguments...
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


$result_converted{'html_text'}->{'def'} = '
<dl>
<dt><a name="index-d_002d_002deffn_005fname"></a>c--ategory: <strong>d--effn_name</strong><em> a--rguments...</em></dt>
<dd><p>d&ndash;effn
</p></dd></dl>

<dl>
<dt><a name="index-de_002d_002dffn_005fname"></a>cate--gory: <strong>de--ffn_name</strong><em> ar--guments    more args <br> even more so</em></dt>
<dd><p>def&ndash;fn
</p></dd></dl>

<dl>
<dt><a name="index-i"></a>fset: <strong><var>i</var></strong><em> a g</em></dt>
<dt><a name="index-truc"></a>cmde: <strong>truc</strong></dt>
<dt><a name="index-log-trap"></a>Command: <strong>log trap</strong></dt>
<dt><a name="index-log-trap1"></a>Command: <strong>log trap1</strong></dt>
<dt><a name="index-log-trap2"></a>Command: <strong>log trap2</strong></dt>
<dt><a name="index-id-ule"></a>cmde: <strong><b>id ule</b></strong><em> truc</em></dt>
<dt><a name="index-id-i-ule"></a>cmde2: <strong><b>id &lsquo;<samp>i</samp>&rsquo; ule</b></strong><em> truc</em></dt>
<dt><a name="index-machin"></a>: <strong>machin</strong></dt>
<dt><a name="index-bidule-machin"></a>: <strong>bidule machin</strong></dt>
<dt><a name="index-machin-1"></a>truc: <strong>machin</strong></dt>
<dt><a name="index-followed"></a>truc: <strong>followed</strong><em> by a comment</em></dt>
<dt><a name="index-after"></a>truc: <strong>after</strong><em> a deff item</em></dt>
<dt><a name="index-deffnx"></a>truc: <strong>deffnx</strong><em> before end deffn</em></dt>
<dd><p>Various deff lines
</p></dd></dl>
';


$result_converted{'xml'}->{'def'} = '
<deffn><definitionterm><indexterm index="fn">d--effn_name</indexterm><defcategory>c--ategory</defcategory> <deffunction>d--effn_name</deffunction> <defparam>a--rguments...</defparam></definitionterm>
<definitionitem><para>d&textndash;effn
</para></definitionitem></deffn>

<deffn><definitionterm><indexterm index="fn">de--ffn_name</indexterm><defcategory>cate--gory</defcategory> <deffunction>de--ffn_name</deffunction> <defparam>ar--guments</defparam>    <defparam>more</defparam> <defparam>args</defparam> <defparam>&linebreak;</defparam> <defparam>even</defparam> <defparam>more</defparam> <defparam>so</defparam></definitionterm>
<definitionitem><para>def&textndash;fn
</para></definitionitem></deffn>

<deffn><definitionterm><indexterm index="fn"><var>i</var></indexterm><defcategory>fset</defcategory> <deffunction><var>i</var></deffunction> <defparam>a</defparam> <defparam>g</defparam></definitionterm>
<deffnx><definitionterm><indexterm index="fn">truc</indexterm><defcategory>cmde</defcategory> <deffunction>truc</deffunction> <defparam></defparam></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn">log trap</indexterm><defcategory>Command</defcategory> <deffunction>log trap</deffunction> <defparam></defparam></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn">log trap1</indexterm><defcategory>Command</defcategory> <deffunction>log trap1</deffunction> <defparam></defparam></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn">log trap2</indexterm><defcategory>Command</defcategory> <deffunction>log trap2</deffunction> <defparam></defparam></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn"><b>id ule</b></indexterm><defcategory>cmde</defcategory> <deffunction><b>id ule</b></deffunction> <defparam>truc</defparam></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn"><b>id <samp>i</samp> ule</b></indexterm><defcategory>cmde2</defcategory> <deffunction><b>id <samp>i</samp> ule</b></deffunction> <defparam>truc</defparam></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn">machin</indexterm><defcategory></defcategory> <deffunction>machin</deffunction></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn">bidule machin</indexterm><defcategory></defcategory> <deffunction>bidule machin</deffunction></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn">machin</indexterm><defcategory>truc</defcategory> <deffunction>machin</deffunction></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn">followed</indexterm><defcategory>truc</defcategory> <deffunction>followed</deffunction> <defparam>by</defparam> <defparam>a</defparam> <defparam>comment</defparam></definitionterm></deffnx>
<!-- comment -->
<deffnx><definitionterm><indexterm index="fn">after</indexterm><defcategory>truc</defcategory> <deffunction>after</deffunction> <defparam>a</defparam> <defparam>deff</defparam> <defparam>item</defparam></definitionterm></deffnx>
<!-- comment -->
<deffnx><definitionterm><indexterm index="fn">deffnx</indexterm><defcategory>truc</defcategory> <deffunction>deffnx</deffunction> <defparam>before</defparam> <defparam>end</defparam> <defparam>deffn</defparam></definitionterm></deffnx>
<definitionitem><para>Various deff lines
</para></definitionitem></deffn>
';


$result_converted{'docbook'}->{'def'} = '
<synopsis><indexterm role="fn"><primary>d--effn_name</primary></indexterm><emphasis role="bold">c--ategory</emphasis>: <function>d--effn_name</function> <replaceable>a--rguments...</replaceable></synopsis>
<blockquote><para>d&#8211;effn
</para></blockquote>
<synopsis><indexterm role="fn"><primary>de--ffn_name</primary></indexterm><emphasis role="bold">cate--gory</emphasis>: <function>de--ffn_name</function> <replaceable>ar--guments</replaceable>    <replaceable>more</replaceable> <replaceable>args</replaceable> <replaceable>
</replaceable> <replaceable>even</replaceable> <replaceable>more</replaceable> <replaceable>so</replaceable></synopsis>
<blockquote><para>def&#8211;fn
</para></blockquote>
<synopsis><indexterm role="fn"><primary><replaceable>i</replaceable></primary></indexterm><emphasis role="bold">fset</emphasis>: <function><replaceable>i</replaceable></function> <replaceable>a</replaceable> <replaceable>g</replaceable></synopsis>
<synopsis><indexterm role="fn"><primary>truc</primary></indexterm><emphasis role="bold">cmde</emphasis>: <function>truc</function> <replaceable></replaceable></synopsis>
<synopsis><indexterm role="fn"><primary>log trap</primary></indexterm><emphasis role="bold">Command</emphasis>: <function>log trap</function> <replaceable></replaceable></synopsis>
<synopsis><indexterm role="fn"><primary>log trap1</primary></indexterm><emphasis role="bold">Command</emphasis>: <function>log trap1</function> <replaceable></replaceable></synopsis>
<synopsis><indexterm role="fn"><primary>log trap2</primary></indexterm><emphasis role="bold">Command</emphasis>: <function>log trap2</function> <replaceable></replaceable></synopsis>
<synopsis><indexterm role="fn"><primary><emphasis role="bold">id ule</emphasis></primary></indexterm><emphasis role="bold">cmde</emphasis>: <function><emphasis role="bold">id ule</emphasis></function> <replaceable>truc</replaceable></synopsis>
<synopsis><indexterm role="fn"><primary><emphasis role="bold">id &#8216;<literal>i</literal>&#8217; ule</emphasis></primary></indexterm><emphasis role="bold">cmde2</emphasis>: <function><emphasis role="bold">id &#8216;i&#8217; ule</emphasis></function> <replaceable>truc</replaceable></synopsis>
<synopsis><indexterm role="fn"><primary>machin</primary></indexterm><emphasis role="bold"></emphasis>: <function>machin</function></synopsis>
<synopsis><indexterm role="fn"><primary>bidule machin</primary></indexterm><emphasis role="bold"></emphasis>: <function>bidule machin</function></synopsis>
<synopsis><indexterm role="fn"><primary>machin</primary></indexterm><emphasis role="bold">truc</emphasis>: <function>machin</function></synopsis>
<synopsis><indexterm role="fn"><primary>followed</primary></indexterm><emphasis role="bold">truc</emphasis>: <function>followed</function> <replaceable>by</replaceable> <replaceable>a</replaceable> <replaceable>comment</replaceable></synopsis>
<!-- comment -->
<synopsis><indexterm role="fn"><primary>after</primary></indexterm><emphasis role="bold">truc</emphasis>: <function>after</function> <replaceable>a</replaceable> <replaceable>deff</replaceable> <replaceable>item</replaceable></synopsis>
<!-- comment -->
<synopsis><indexterm role="fn"><primary>deffnx</primary></indexterm><emphasis role="bold">truc</emphasis>: <function>deffnx</function> <replaceable>before</replaceable> <replaceable>end</replaceable> <replaceable>deffn</replaceable></synopsis>
<blockquote><para>Various deff lines
</para></blockquote>';

1;
