use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'empty_deftype'} = {
  'contents' => [
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
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' f (const type& x)
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
                  'text' => 'f'
                }
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
                  'text' => 'const'
                }
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
                  'text' => 'type&'
                }
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
                  'text' => 'x'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
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
              'number' => 1
            },
            'original_def_cmdname' => 'deftypefun'
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
                  'text' => 'Deftypefun.
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'deftypefun'
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
            'command_argument' => 'deftypefun',
            'text_arg' => 'deftypefun'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
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
        'line_nr' => 1,
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
                  'text' => 'f (const type& x)
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
                  'text' => 'f'
                }
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
                {
                  'text' => 'const'
                }
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
                  'text' => 'type&'
                }
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
                  'text' => 'x'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
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
              'number' => 2
            },
            'original_def_cmdname' => 'defun'
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
                  'text' => 'Defun.
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'defun'
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
            'command_argument' => 'defun',
            'text_arg' => 'defun'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 7,
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
        'line_nr' => 5,
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
                  'text' => 'c '
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' f (const type& x)
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
                  'text' => 'f'
                }
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
                  'text' => 'const'
                }
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
                  'text' => 'type&'
                }
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
                  'text' => 'x'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
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
              'number' => 3
            },
            'original_def_cmdname' => 'deftypemethod'
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
                  'text' => 'Deftypemethod.
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'deftypemethod'
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
            'command_argument' => 'deftypemethod',
            'text_arg' => 'deftypemethod'
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
                  'text' => 'c f (const type& x)
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
                'name',
                {
                  'text' => 'f'
                }
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
                {
                  'text' => 'const'
                }
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
                  'text' => 'type&'
                }
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
                  'text' => 'x'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
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
              'number' => 4
            },
            'original_def_cmdname' => 'defmethod'
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
                  'text' => 'Defmethod.
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'defmethod'
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
            'command_argument' => 'defmethod',
            'text_arg' => 'defmethod'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 15,
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
        'line_nr' => 13,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'contents'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[1];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[2];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'empty_deftype'}{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[2];
$result_trees{'empty_deftype'}{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[2];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[1];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[2];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[2];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[2]{'extra'}{'command'} = $result_trees{'empty_deftype'}{'contents'}[2];
$result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[2];
$result_trees{'empty_deftype'}{'contents'}[2]{'extra'}{'end_command'} = $result_trees{'empty_deftype'}{'contents'}[2]{'contents'}[2];
$result_trees{'empty_deftype'}{'contents'}[2]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[3]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[4][1]{'contents'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[4][1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[6][1];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[4];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[1]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[1];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[4];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[2];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[2]{'extra'}{'command'} = $result_trees{'empty_deftype'}{'contents'}[4];
$result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[4];
$result_trees{'empty_deftype'}{'contents'}[4]{'extra'}{'end_command'} = $result_trees{'empty_deftype'}{'contents'}[4]{'contents'}[2];
$result_trees{'empty_deftype'}{'contents'}[4]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[5]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[4][1];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2]{'parent'}{'contents'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3] = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[1]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[1];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[2];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[2]{'extra'}{'command'} = $result_trees{'empty_deftype'}{'contents'}[6];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6];
$result_trees{'empty_deftype'}{'contents'}[6]{'extra'}{'end_command'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[2];
$result_trees{'empty_deftype'}{'contents'}[6]{'parent'} = $result_trees{'empty_deftype'};

$result_texis{'empty_deftype'} = '@deftypefun {} f (const type& x)
Deftypefun.
@end deftypefun

@defun f (const type& x)
Defun.
@end defun

@deftypemethod c {} f (const type& x)
Deftypemethod.
@end deftypemethod

@defmethod c f (const type& x)
Defmethod.
@end defmethod
';


$result_texts{'empty_deftype'} = ' f (const type& x)
Deftypefun.

f (const type& x)
Defun.

c  f (const type& x)
Deftypemethod.

c f (const type& x)
Defmethod.
';

$result_errors{'empty_deftype'} = [
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
    'error_line' => ':13: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  }
];


1;
