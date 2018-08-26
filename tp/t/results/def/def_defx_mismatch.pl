use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'def_defx_mismatch'} = {
  'contents' => [
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'my def'
                    }
                  ],
                  'extra' => {
                    'def_role' => 'name'
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 1,
                    'macro' => ''
                  },
                  'parent' => {},
                  'type' => 'bracketed_def_content'
                },
                {
                  'extra' => {
                    'def_role' => 'spaces'
                  },
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'extra' => {
                    'def_role' => 'arg'
                  },
                  'text' => 'args'
                },
                {
                  'extra' => {
                    'def_role' => 'spaces'
                  },
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'arg'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'extra' => {
                    'def_role' => 'arg'
                  },
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'extra' => {
                    'def_role' => 'spaces'
                  },
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'args' => [
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'dots',
                  'contents' => [],
                  'extra' => {
                    'def_role' => 'arg'
                  },
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'extra' => {
                    'def_role' => 'spaces'
                  },
                  'text' => '
',
                  'type' => 'spaces_at_end'
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
                      'parent' => {},
                      'text' => 'Function'
                    }
                  ],
                  'extra' => {
                    'def_role' => 'category'
                  },
                  'type' => 'bracketed_def_content'
                }
              ],
              [
                'spaces',
                {
                  'extra' => {
                    'def_role' => 'spaces'
                  },
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
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {}
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'defun',
              'index_name' => 'fn',
              'index_type_command' => 'defun',
              'key' => 'my def',
              'number' => 1
            },
            'original_def_cmdname' => 'defun'
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'type'
                    }
                  ],
                  'extra' => {
                    'def_role' => 'category'
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 2,
                    'macro' => ''
                  },
                  'parent' => {},
                  'type' => 'bracketed_def_content'
                },
                {
                  'extra' => {
                    'def_role' => 'spaces'
                  },
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'name'
                    }
                  ],
                  'extra' => {
                    'def_role' => 'name'
                  },
                  'line_nr' => {},
                  'parent' => {},
                  'type' => 'bracketed_def_content'
                },
                {
                  'extra' => {
                    'def_role' => 'spaces'
                  },
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'extra' => {
                    'def_role' => 'arg'
                  },
                  'text' => 'and'
                },
                {
                  'extra' => {
                    'def_role' => 'spaces'
                  },
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'extra' => {
                    'def_role' => 'arg'
                  },
                  'text' => 'now'
                },
                {
                  'extra' => {
                    'def_role' => 'spaces'
                  },
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'extra' => {
                    'def_role' => 'arg'
                  },
                  'text' => 'the'
                },
                {
                  'extra' => {
                    'def_role' => 'spaces'
                  },
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'extra' => {
                    'def_role' => 'arg'
                  },
                  'text' => 'args'
                },
                {
                  'extra' => {
                    'def_role' => 'spaces'
                  },
                  'text' => '
',
                  'type' => 'spaces_at_end'
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
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'name',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffnx',
              'index_name' => 'fn',
              'index_type_command' => 'deffn',
              'key' => 'name',
              'number' => 2
            },
            'not_after_command' => 1,
            'original_def_cmdname' => 'deffnx',
            'spaces_after_command' => {}
          },
          'line_nr' => {},
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
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
                  'text' => 'In defun.
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
            'command_argument' => 'defun',
            'spaces_after_command' => {},
            'text_arg' => 'defun'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 6,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {},
        'spaces_after_command' => {}
      },
      'line_nr' => {},
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[3][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[5][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[7][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[9][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[8];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'line_nr'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'line_nr'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[0][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[1][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[2][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[3][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[4][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[5];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[5][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[6];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[6][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[7];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[7][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[8];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[8][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[9];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[9][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[10];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[10][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[11];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[11][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[12];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'spaces_after_command'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'line_nr'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[2];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[2];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[2];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[3];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[3]{'extra'}{'spaces_after_command'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[3];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'extra'}{'spaces_after_command'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'line_nr'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'};

$result_texis{'def_defx_mismatch'} = '@defun {my def} args @var{arg} @dots{}
@deffnx {type} {name} and now the args

In defun.

@end defun
';


$result_texts{'def_defx_mismatch'} = 'Function: my def args arg ...
type: name and now the args

In defun.

';

$result_errors{'def_defx_mismatch'} = [
  {
    'error_line' => ':1: warning: entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'entry for index `fn\' outside of any node',
    'type' => 'warning'
  },
  {
    'error_line' => ':2: must be after `@deffn\' to use `@deffnx\'
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'must be after `@deffn\' to use `@deffnx\'',
    'type' => 'error'
  },
  {
    'error_line' => ':2: warning: entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'entry for index `fn\' outside of any node',
    'type' => 'warning'
  }
];


1;
