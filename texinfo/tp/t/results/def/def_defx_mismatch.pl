use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats);

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
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' args '
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
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
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
                {}
              ]
            ],
            'def_command' => 'defun',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'defun',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
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
                      'text' => 'type'
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
                      'text' => 'name'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' and now the args
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
                  'text' => 'now'
                }
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
                  'text' => 'the'
                }
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
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
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
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'};
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[0][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[2][1] = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'content'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'};
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[3];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'def_defx_mismatch'}{'contents'}[0];
$result_trees{'def_defx_mismatch'}{'contents'}[0]{'parent'} = $result_trees{'def_defx_mismatch'};
$result_trees{'def_defx_mismatch'}{'contents'}[1]{'parent'} = $result_trees{'def_defx_mismatch'};

$result_texis{'def_defx_mismatch'} = '@defun {my def} args @var{arg} @dots{}
@deffnx {type} {name} and now the args

In defun.

@end defun
';


$result_texts{'def_defx_mismatch'} = 'my def args arg ...
type name and now the args

In defun.

';

$result_errors{'def_defx_mismatch'} = [
  {
    'error_line' => ':2: Must be after `@deffn\' to use `@deffnx\'
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Must be after `@deffn\' to use `@deffnx\'',
    'type' => 'error'
  }
];


1;
