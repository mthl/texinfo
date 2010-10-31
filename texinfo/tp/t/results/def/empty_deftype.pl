use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

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
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deftypefun',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'parent' => {},
          'type' => 'def_line'
        },
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
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deftypemethod',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'parent' => {},
          'type' => 'def_line'
        },
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
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'defmethod',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'parent' => {},
          'type' => 'def_line'
        },
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
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'};
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[1];
$result_trees{'empty_deftype'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[2]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[3]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[3]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_deftype'}{'contents'}[3]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[3]{'contents'}[0]{'extra'}{'index_entry'}{'content'} = $result_trees{'empty_deftype'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'};
$result_trees{'empty_deftype'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[3];
$result_trees{'empty_deftype'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[3]{'contents'}[1];
$result_trees{'empty_deftype'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[3];
$result_trees{'empty_deftype'}{'contents'}[3]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[4]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[5]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'content'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'};
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[1];
$result_trees{'empty_deftype'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[6];
$result_trees{'empty_deftype'}{'contents'}[6]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[7]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[8]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftype'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[9]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[9]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_deftype'}{'contents'}[9]{'contents'}[0];
$result_trees{'empty_deftype'}{'contents'}[9]{'contents'}[0]{'extra'}{'index_entry'}{'content'} = $result_trees{'empty_deftype'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'};
$result_trees{'empty_deftype'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[9];
$result_trees{'empty_deftype'}{'contents'}[9]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[9]{'contents'}[1];
$result_trees{'empty_deftype'}{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'empty_deftype'}{'contents'}[9];
$result_trees{'empty_deftype'}{'contents'}[9]{'parent'} = $result_trees{'empty_deftype'};
$result_trees{'empty_deftype'}{'contents'}[10]{'parent'} = $result_trees{'empty_deftype'};

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

$result_errors{'empty_deftype'} = [];


1;
