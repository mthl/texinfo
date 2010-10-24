use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'block_not_matching'} = {
  'contents' => [
    {
      'cmdname' => 'quotation',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'A quotation
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
                      'text' => 'Function Reference'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' print_navigation $filehandle
'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'parent' => {},
          'special' => {
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
                {
                  'text' => 'print_navigation'
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
                  'text' => '$filehandle'
                }
              ]
            ],
            'def_command' => 'deffn'
          },
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Text
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
      'cmdname' => 'table',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
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
                  'text' => 'item'
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
          'cmdname' => 'item',
          'parent' => {}
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'line
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
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'cmdname' => 'emph',
              'parent' => {},
              'type' => 'command_as_argument'
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
      'cmdname' => 'table',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
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
                  'text' => 'ref'
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
          'cmdname' => 'item',
          'parent' => {}
        },
        {
          'cmdname' => 'example',
          'contents' => [
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            },
            {
              'parent' => {},
              'text' => 'example
'
            }
          ],
          'parent' => {}
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'group',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'in group
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
      'cmdname' => 'group',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'in group 2
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
      'cmdname' => 'cartouche',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'cartouche
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
      'cmdname' => 'cartouche',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'carouche
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
$result_trees{'block_not_matching'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[0];
$result_trees{'block_not_matching'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[0]{'contents'}[1];
$result_trees{'block_not_matching'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[0];
$result_trees{'block_not_matching'}{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[1]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[2]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[0];
$result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[3];
$result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[0]{'special'}{'def_args'}[0][1] = $result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[1];
$result_trees{'block_not_matching'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[3];
$result_trees{'block_not_matching'}{'contents'}[3]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[4]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[5]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[6];
$result_trees{'block_not_matching'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[6];
$result_trees{'block_not_matching'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'block_not_matching'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'block_not_matching'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'block_not_matching'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[6]{'contents'}[2];
$result_trees{'block_not_matching'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[6];
$result_trees{'block_not_matching'}{'contents'}[6]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[6]{'contents'}[3];
$result_trees{'block_not_matching'}{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[6];
$result_trees{'block_not_matching'}{'contents'}[6]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[7]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[8]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[9]{'args'}[0];
$result_trees{'block_not_matching'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[9]{'args'}[0];
$result_trees{'block_not_matching'}{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[9]{'args'}[0];
$result_trees{'block_not_matching'}{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[9];
$result_trees{'block_not_matching'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[9];
$result_trees{'block_not_matching'}{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'block_not_matching'}{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'block_not_matching'}{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'block_not_matching'}{'contents'}[9]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[9]{'contents'}[1];
$result_trees{'block_not_matching'}{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[9];
$result_trees{'block_not_matching'}{'contents'}[9]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[9]{'contents'}[2];
$result_trees{'block_not_matching'}{'contents'}[9]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[9]{'contents'}[2];
$result_trees{'block_not_matching'}{'contents'}[9]{'contents'}[2]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[9];
$result_trees{'block_not_matching'}{'contents'}[9]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[10]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[11]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[12]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[13];
$result_trees{'block_not_matching'}{'contents'}[13]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[13]{'contents'}[1];
$result_trees{'block_not_matching'}{'contents'}[13]{'contents'}[1]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[13];
$result_trees{'block_not_matching'}{'contents'}[13]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[14]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[15]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[16]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[16];
$result_trees{'block_not_matching'}{'contents'}[16]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[16]{'contents'}[1];
$result_trees{'block_not_matching'}{'contents'}[16]{'contents'}[1]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[16];
$result_trees{'block_not_matching'}{'contents'}[16]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[17]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[18]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[19]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[19];
$result_trees{'block_not_matching'}{'contents'}[19]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[19]{'contents'}[1];
$result_trees{'block_not_matching'}{'contents'}[19]{'contents'}[1]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[19];
$result_trees{'block_not_matching'}{'contents'}[19]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[20]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[21]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[22]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[22];
$result_trees{'block_not_matching'}{'contents'}[22]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[22]{'contents'}[1];
$result_trees{'block_not_matching'}{'contents'}[22]{'contents'}[1]{'parent'} = $result_trees{'block_not_matching'}{'contents'}[22];
$result_trees{'block_not_matching'}{'contents'}[22]{'parent'} = $result_trees{'block_not_matching'};
$result_trees{'block_not_matching'}{'contents'}[23]{'parent'} = $result_trees{'block_not_matching'};

$result_texis{'block_not_matching'} = '@quotation
A quotation
@end quotation

@deffn {Function Reference} print_navigation $filehandle
Text
@end deffn

@table
@item item
line
@end table

@table @emph
@item ref
@example
example
@end example@end table


@group
in group
@end group

@group
in group 2
@end group

@cartouche
cartouche
@end cartouche

@cartouche
carouche
@end cartouche
';


$result_texts{'block_not_matching'} = 'A quotation

Function Reference print_navigation $filehandle
Text

item
line

ref
example

in group

in group 2

cartouche

carouche
';

$result_errors{'block_not_matching'} = [
  {
    'error_line' => ':3: `@end\' expected `quotation\', but saw `cartouche\'
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '`@end\' expected `quotation\', but saw `cartouche\'',
    'type' => 'error'
  },
  {
    'error_line' => ':3: Unmatched `@end cartouche\'
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'Unmatched `@end cartouche\'',
    'type' => 'error'
  },
  {
    'error_line' => ':7: `@end\' expected `deffn\', but saw `deftypefun\'
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => '`@end\' expected `deffn\', but saw `deftypefun\'',
    'type' => 'error'
  },
  {
    'error_line' => ':7: Unmatched `@end deftypefun\'
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'Unmatched `@end deftypefun\'',
    'type' => 'error'
  },
  {
    'error_line' => ':12: `@end\' expected `table\', but saw `vtable\'
',
    'file_name' => '',
    'line_nr' => 12,
    'macro' => '',
    'text' => '`@end\' expected `table\', but saw `vtable\'',
    'type' => 'error'
  },
  {
    'error_line' => ':12: Unmatched `@end vtable\'
',
    'file_name' => '',
    'line_nr' => 12,
    'macro' => '',
    'text' => 'Unmatched `@end vtable\'',
    'type' => 'error'
  },
  {
    'error_line' => ':18: `@end\' expected `example\', but saw `display\'
',
    'file_name' => '',
    'line_nr' => 18,
    'macro' => '',
    'text' => '`@end\' expected `example\', but saw `display\'',
    'type' => 'error'
  },
  {
    'error_line' => ':18: `@end\' expected `table\', but saw `display\'
',
    'file_name' => '',
    'line_nr' => 18,
    'macro' => '',
    'text' => '`@end\' expected `table\', but saw `display\'',
    'type' => 'error'
  },
  {
    'error_line' => ':18: Unmatched `@end display\'
',
    'file_name' => '',
    'line_nr' => 18,
    'macro' => '',
    'text' => 'Unmatched `@end display\'',
    'type' => 'error'
  },
  {
    'error_line' => ':19: Unmatched `@end table\'
',
    'file_name' => '',
    'line_nr' => 19,
    'macro' => '',
    'text' => 'Unmatched `@end table\'',
    'type' => 'error'
  },
  {
    'error_line' => ':23: `@end\' expected `group\', but saw `table\'
',
    'file_name' => '',
    'line_nr' => 23,
    'macro' => '',
    'text' => '`@end\' expected `group\', but saw `table\'',
    'type' => 'error'
  },
  {
    'error_line' => ':23: Unmatched `@end table\'
',
    'file_name' => '',
    'line_nr' => 23,
    'macro' => '',
    'text' => 'Unmatched `@end table\'',
    'type' => 'error'
  },
  {
    'error_line' => ':27: `@end\' expected `group\', but saw `cartouche\'
',
    'file_name' => '',
    'line_nr' => 27,
    'macro' => '',
    'text' => '`@end\' expected `group\', but saw `cartouche\'',
    'type' => 'error'
  },
  {
    'error_line' => ':27: Unmatched `@end cartouche\'
',
    'file_name' => '',
    'line_nr' => 27,
    'macro' => '',
    'text' => 'Unmatched `@end cartouche\'',
    'type' => 'error'
  },
  {
    'error_line' => ':31: `@end\' expected `cartouche\', but saw `group\'
',
    'file_name' => '',
    'line_nr' => 31,
    'macro' => '',
    'text' => '`@end\' expected `cartouche\', but saw `group\'',
    'type' => 'error'
  },
  {
    'error_line' => ':31: Unmatched `@end group\'
',
    'file_name' => '',
    'line_nr' => 31,
    'macro' => '',
    'text' => 'Unmatched `@end group\'',
    'type' => 'error'
  },
  {
    'error_line' => ':35: `@end\' expected `cartouche\', but saw `float\'
',
    'file_name' => '',
    'line_nr' => 35,
    'macro' => '',
    'text' => '`@end\' expected `cartouche\', but saw `float\'',
    'type' => 'error'
  },
  {
    'error_line' => ':35: Unmatched `@end float\'
',
    'file_name' => '',
    'line_nr' => 35,
    'macro' => '',
    'text' => 'Unmatched `@end float\'',
    'type' => 'error'
  }
];


$result_indices{'block_not_matching'} = undef;


1;
