use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'all_commands'} = {
  'contents' => [
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
                  'text' => 'c--ategory d--efvr_name
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
                  'text' => 'c--ategory'
                }
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
                  'text' => 'd--efvr_name'
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
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--efvr
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
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
                  'text' => 'c--ategory t--ype d--eftypefn_name a--rguments...
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
                  'text' => 'c--ategory'
                }
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
                  'text' => 't--ype'
                }
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
                  'text' => 'd--eftypefn_name'
                }
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
                  'text' => 'a--rguments...'
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
              'number' => 1
            },
            'original_def_cmdname' => 'deftypefn'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--eftypefn
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
                  'text' => 'c--ategory c--lass t--ype d--eftypeop_name a--rguments...
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
                  'text' => 'c--ategory'
                }
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
                  'text' => 'c--lass'
                }
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
                  'text' => 't--ype'
                }
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
                  'text' => 'd--eftypeop_name'
                }
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
                  'text' => 'a--rguments...'
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
              'number' => 2
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--eftypeop
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 9,
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
                  'parent' => {},
                  'text' => 'c--ategory t--ype d--eftypevr_name
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
                  'text' => 'c--ategory'
                }
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
                  'text' => 't--ype'
                }
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
                  'text' => 'd--eftypevr_name'
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
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--eftypevr
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 13,
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
                  'parent' => {},
                  'text' => 'c--ategory c--lass d--efcv_name
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
                  'text' => 'c--ategory'
                }
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
                  'text' => 'c--lass'
                }
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
                  'text' => 'd--efcv_name'
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
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--efcv
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 17,
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
                  'text' => 'c--ategory c--lass d--efop_name a--rguments...
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
                  'text' => 'c--ategory'
                }
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
                  'text' => 'c--lass'
                }
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
                  'text' => 'd--efop_name'
                }
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
              'number' => 3
            },
            'original_def_cmdname' => 'defop'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--efop
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
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
                  'parent' => {},
                  'text' => 'c--ategory d--eftp_name a--ttributes...
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
                  'text' => 'c--ategory'
                }
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
                  'text' => 'd--eftp_name'
                }
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
                  'text' => 'a--ttributes...'
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
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--eftp
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 25,
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
                  'text' => 'd--efun_name a--rguments...
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
                  'text' => 'd--efun_name'
                }
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
              'number' => 4
            },
            'original_def_cmdname' => 'defun'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--efun
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 29,
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
      'cmdname' => 'defmac',
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
                  'text' => 'd--efmac_name a--rguments...
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
                  'text' => 'Macro'
                }
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
                  'text' => 'd--efmac_name'
                }
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
            'def_command' => 'defmac',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'defmac',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 5
            },
            'original_def_cmdname' => 'defmac'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--efmac
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'defspec',
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
                  'text' => 'd--efspec_name a--rguments...
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
                  'contents' => [
                    {
                      'parent' => {
                        'contents' => [],
                        'type' => 'bracketed'
                      },
                      'text' => 'Special Form'
                    }
                  ],
                  'parent' => undef,
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
                  'text' => 'd--efspec_name'
                }
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
            'def_command' => 'defspec',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'defspec',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 6
            },
            'original_def_cmdname' => 'defspec'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--efspec
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 37,
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
      'cmdname' => 'defvar',
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
                  'text' => 'd--efvar_name
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
                  'text' => 'd--efvar_name'
                }
              ]
            ],
            'def_command' => 'defvar',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'defvar',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 4
            },
            'original_def_cmdname' => 'defvar'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--efvar
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'defopt',
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
                  'text' => 'd--efopt_name
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
                  'contents' => [
                    {
                      'parent' => {
                        'contents' => [],
                        'type' => 'bracketed'
                      },
                      'text' => 'User Option'
                    }
                  ],
                  'parent' => undef,
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
                  'text' => 'd--efopt_name'
                }
              ]
            ],
            'def_command' => 'defopt',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'defopt',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 5
            },
            'original_def_cmdname' => 'defopt'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--efopt
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'deftypefun',
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
                  'text' => 't--ype d--eftypefun_name a--rguments...
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
                'type',
                {
                  'text' => 't--ype'
                }
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
                  'text' => 'd--eftypefun_name'
                }
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
                  'text' => 'a--rguments...'
                }
              ]
            ],
            'def_command' => 'deftypefun',
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
              'index_at_command' => 'deftypefun',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 7
            },
            'original_def_cmdname' => 'deftypefun'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--eftypefun
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'deftypevar',
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
                  'text' => 't--ype d--eftypevar_name
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
                'type',
                {
                  'text' => 't--ype'
                }
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
                  'text' => 'd--eftypevar_name'
                }
              ]
            ],
            'def_command' => 'deftypevar',
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
              'index_at_command' => 'deftypevar',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 6
            },
            'original_def_cmdname' => 'deftypevar'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--eftypevar
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'defivar',
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
                  'text' => 'c--lass d--efivar_name
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
                  'contents' => [
                    {
                      'parent' => {
                        'contents' => [],
                        'type' => 'bracketed'
                      },
                      'text' => 'Instance Variable'
                    }
                  ],
                  'parent' => undef,
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
                  'text' => 'c--lass'
                }
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
                  'text' => 'd--efivar_name'
                }
              ]
            ],
            'def_command' => 'defivar',
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
                  'text' => ' of '
                },
                {},
                {}
              ],
              'index_at_command' => 'defivar',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 7
            },
            'original_def_cmdname' => 'defivar'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--efivar
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'deftypeivar',
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
                  'text' => 'c--lass t--ype d--eftypeivar_name
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
                  'contents' => [
                    {
                      'parent' => {
                        'contents' => [],
                        'type' => 'bracketed'
                      },
                      'text' => 'Instance Variable'
                    }
                  ],
                  'parent' => undef,
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
                  'text' => 'c--lass'
                }
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
                  'text' => 't--ype'
                }
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
                  'text' => 'd--eftypeivar_name'
                }
              ]
            ],
            'def_command' => 'deftypeivar',
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
              'index_at_command' => 'deftypeivar',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 8
            },
            'original_def_cmdname' => 'deftypeivar'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--eftypeivar
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'defmethod',
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
                  'text' => 'c--lass d--efmethod_name a--rguments...
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
                  'text' => 'Method'
                }
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
                  'text' => 'c--lass'
                }
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
                  'text' => 'd--efmethod_name'
                }
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
            'def_command' => 'defmethod',
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
              'index_at_command' => 'defmethod',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 8
            },
            'original_def_cmdname' => 'defmethod'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--efmethod
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'deftypemethod',
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
                  'text' => 'c--lass t--ype d--eftypemethod_name a--rguments...
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
                  'text' => 'Method'
                }
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
                  'text' => 'c--lass'
                }
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
                  'text' => 't--ype'
                }
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
                  'text' => 'd--eftypemethod_name'
                }
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
                  'text' => 'a--rguments...'
                }
              ]
            ],
            'def_command' => 'deftypemethod',
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
              'index_at_command' => 'deftypemethod',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 9
            },
            'original_def_cmdname' => 'deftypemethod'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--eftypemethod
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
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
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'all_commands'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[0]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[0]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[0]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[0]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[1]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[2]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[3]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[3]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[3]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[3]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[3];
$result_trees{'all_commands'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[3]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[3];
$result_trees{'all_commands'}{'contents'}[3]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[4]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[5]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[6]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[6]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[6];
$result_trees{'all_commands'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[6]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[6];
$result_trees{'all_commands'}{'contents'}[6]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[7]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[8]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[9]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[9]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[9]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[9]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[9];
$result_trees{'all_commands'}{'contents'}[9]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[9]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[9];
$result_trees{'all_commands'}{'contents'}[9]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[10]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[11]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[12]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[12]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[12]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[12]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[12]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[12]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[12];
$result_trees{'all_commands'}{'contents'}[12]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[12]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[12]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[12];
$result_trees{'all_commands'}{'contents'}[12]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[13]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[14]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[15]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[15]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[15];
$result_trees{'all_commands'}{'contents'}[15]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[15]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[15]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[15];
$result_trees{'all_commands'}{'contents'}[15]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[16]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[17]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[18]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[18]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[18]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[18]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[18]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[18]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[18];
$result_trees{'all_commands'}{'contents'}[18]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[18]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[18]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[18];
$result_trees{'all_commands'}{'contents'}[18]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[19]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[20]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[21]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[21]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[21]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[21]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[21]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[21]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[21];
$result_trees{'all_commands'}{'contents'}[21]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[21]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[21]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[21];
$result_trees{'all_commands'}{'contents'}[21]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[22]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[23]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[24]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[24]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[24]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[24]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[24]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[24]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[24];
$result_trees{'all_commands'}{'contents'}[24]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[24]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[24]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[24];
$result_trees{'all_commands'}{'contents'}[24]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[25]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[26]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[27]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[27]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[27]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'}[0]{'parent'}{'contents'} = $result_trees{'all_commands'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'};
$result_trees{'all_commands'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[27]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[27]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[27]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[27]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[27]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[27];
$result_trees{'all_commands'}{'contents'}[27]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[27]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[27]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[27];
$result_trees{'all_commands'}{'contents'}[27]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[28]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[29]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[30]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[30]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[30]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[30]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[30]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[30]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[30]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[30]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[30]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[30];
$result_trees{'all_commands'}{'contents'}[30]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[30]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[30]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[30];
$result_trees{'all_commands'}{'contents'}[30]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[31]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[32]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[33]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[33]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[33]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[33]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'}[0]{'parent'}{'contents'} = $result_trees{'all_commands'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'};
$result_trees{'all_commands'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[33]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[33]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[33]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[33]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[33]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[33];
$result_trees{'all_commands'}{'contents'}[33]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[33]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[33]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[33];
$result_trees{'all_commands'}{'contents'}[33]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[34]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[35]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[36]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[36]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[36]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[36]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[36]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[36]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[36]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[36]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[36]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[36]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[36]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[36];
$result_trees{'all_commands'}{'contents'}[36]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[36]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[36]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[36];
$result_trees{'all_commands'}{'contents'}[36]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[37]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[38]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[39]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[39]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[39]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[39]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[39]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[39]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[39]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[39]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[39];
$result_trees{'all_commands'}{'contents'}[39]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[39]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[39]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[39];
$result_trees{'all_commands'}{'contents'}[39]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[40]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[41]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[42]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'}[0]{'parent'}{'contents'} = $result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'};
$result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[42]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[42]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[42];
$result_trees{'all_commands'}{'contents'}[42]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[42]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[42]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[42];
$result_trees{'all_commands'}{'contents'}[42]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[43]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[44]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[45]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'}[0]{'parent'}{'contents'} = $result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'};
$result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[45]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[45]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[45];
$result_trees{'all_commands'}{'contents'}[45]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[45]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[45]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[45];
$result_trees{'all_commands'}{'contents'}[45]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[46]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[47]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[48]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[48]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[48]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[48];
$result_trees{'all_commands'}{'contents'}[48]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[48]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[48]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[48];
$result_trees{'all_commands'}{'contents'}[48]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[49]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[50]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'args'}[0];
$result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[51]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'all_commands'}{'contents'}[51]{'contents'}[0];
$result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'all_commands'}{'contents'}[51]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[51];
$result_trees{'all_commands'}{'contents'}[51]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_commands'}{'contents'}[51]{'contents'}[1];
$result_trees{'all_commands'}{'contents'}[51]{'contents'}[1]{'parent'} = $result_trees{'all_commands'}{'contents'}[51];
$result_trees{'all_commands'}{'contents'}[51]{'parent'} = $result_trees{'all_commands'};
$result_trees{'all_commands'}{'contents'}[52]{'parent'} = $result_trees{'all_commands'};

$result_texis{'all_commands'} = '@defvr c--ategory d--efvr_name
d--efvr
@end defvr

@deftypefn c--ategory t--ype d--eftypefn_name a--rguments...
d--eftypefn
@end deftypefn

@deftypeop c--ategory c--lass t--ype d--eftypeop_name a--rguments...
d--eftypeop
@end deftypeop

@deftypevr c--ategory t--ype d--eftypevr_name
d--eftypevr
@end deftypevr

@defcv c--ategory c--lass d--efcv_name
d--efcv
@end defcv

@defop c--ategory c--lass d--efop_name a--rguments...
d--efop
@end defop

@deftp c--ategory d--eftp_name a--ttributes...
d--eftp
@end deftp

@defun d--efun_name a--rguments...
d--efun
@end defun

@defmac d--efmac_name a--rguments...
d--efmac
@end defmac

@defspec d--efspec_name a--rguments...
d--efspec
@end defspec

@defvar d--efvar_name
d--efvar
@end defvar

@defopt d--efopt_name
d--efopt
@end defopt

@deftypefun t--ype d--eftypefun_name a--rguments...
d--eftypefun
@end deftypefun

@deftypevar t--ype d--eftypevar_name
d--eftypevar
@end deftypevar

@defivar c--lass d--efivar_name
d--efivar
@end defivar

@deftypeivar c--lass t--ype d--eftypeivar_name
d--eftypeivar
@end deftypeivar

@defmethod c--lass d--efmethod_name a--rguments...
d--efmethod
@end defmethod

@deftypemethod c--lass t--ype d--eftypemethod_name a--rguments...
d--eftypemethod
@end deftypemethod
';


$result_texts{'all_commands'} = 'c--ategory d--efvr_name
d--efvr

c--ategory t--ype d--eftypefn_name a--rguments...
d--eftypefn

c--ategory c--lass t--ype d--eftypeop_name a--rguments...
d--eftypeop

c--ategory t--ype d--eftypevr_name
d--eftypevr

c--ategory c--lass d--efcv_name
d--efcv

c--ategory c--lass d--efop_name a--rguments...
d--efop

c--ategory d--eftp_name a--ttributes...
d--eftp

d--efun_name a--rguments...
d--efun

d--efmac_name a--rguments...
d--efmac

d--efspec_name a--rguments...
d--efspec

d--efvar_name
d--efvar

d--efopt_name
d--efopt

t--ype d--eftypefun_name a--rguments...
d--eftypefun

t--ype d--eftypevar_name
d--eftypevar

c--lass d--efivar_name
d--efivar

c--lass t--ype d--eftypeivar_name
d--eftypeivar

c--lass d--efmethod_name a--rguments...
d--efmethod

c--lass t--ype d--eftypemethod_name a--rguments...
d--eftypemethod
';

$result_errors{'all_commands'} = [
  {
    'error_line' => ':1: Entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Entry for index `vr\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':5: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':9: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 9,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':13: Entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => 'Entry for index `vr\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':17: Entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 17,
    'macro' => '',
    'text' => 'Entry for index `vr\' outside of any node',
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
    'error_line' => ':25: Entry for index `tp\' outside of any node
',
    'file_name' => '',
    'line_nr' => 25,
    'macro' => '',
    'text' => 'Entry for index `tp\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':29: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 29,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':33: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 33,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':37: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 37,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':41: Entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 41,
    'macro' => '',
    'text' => 'Entry for index `vr\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':45: Entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 45,
    'macro' => '',
    'text' => 'Entry for index `vr\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':49: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 49,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':53: Entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 53,
    'macro' => '',
    'text' => 'Entry for index `vr\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':57: Entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 57,
    'macro' => '',
    'text' => 'Entry for index `vr\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':61: Entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 61,
    'macro' => '',
    'text' => 'Entry for index `vr\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':65: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 65,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':69: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 69,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  }
];



$result_converted{'plaintext'}->{'all_commands'} = ' -- c--ategory: d--efvr_name
     d-efvr

 -- c--ategory: t--ype d--eftypefn_name a--rguments...
     d-eftypefn

 -- c--ategory on c--lass: t--ype d--eftypeop_name a--rguments...
     d-eftypeop

 -- c--ategory: t--ype d--eftypevr_name
     d-eftypevr

 -- c--ategory of c--lass: d--efcv_name
     d-efcv

 -- c--ategory on c--lass: d--efop_name a--rguments...
     d-efop

 -- c--ategory: d--eftp_name a--ttributes...
     d-eftp

 -- Function: d--efun_name a--rguments...
     d-efun

 -- Macro: d--efmac_name a--rguments...
     d-efmac

 -- Special Form: d--efspec_name a--rguments...
     d-efspec

 -- Variable: d--efvar_name
     d-efvar

 -- User Option: d--efopt_name
     d-efopt

 -- Function: t--ype d--eftypefun_name a--rguments...
     d-eftypefun

 -- Variable: t--ype d--eftypevar_name
     d-eftypevar

 -- Instance Variable of c--lass: d--efivar_name
     d-efivar

 -- Instance Variable of c--lass: t--ype d--eftypeivar_name
     d-eftypeivar

 -- Method on c--lass: d--efmethod_name a--rguments...
     d-efmethod

 -- Method on c--lass: t--ype d--eftypemethod_name a--rguments...
     d-eftypemethod
';

1;
