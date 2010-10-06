use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'complex_argument'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'macro2',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'arg',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'coucou \\arg\\ after arg
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'args_index' => {
          'arg' => 0
        },
        'macro_line' => ' macro2{arg}
',
        'macrobody' => 'coucou \\arg\\ after arg
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'macro4',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '1
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '2
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '3
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '4
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'macro_line' => ' macro4 {}
',
        'macrobody' => '1
2
3
4
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'macro3',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'text',
          'type' => 'macro_arg'
        },
        {
          'parent' => {},
          'text' => 'arg',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '\\text\\
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '&&&& \\arg\\
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'args_index' => {
          'arg' => 1,
          'text' => 0
        },
        'macro_line' => ' macro3{text, arg}
',
        'macrobody' => '\\text\\
&&&& \\arg\\
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' @macro2 ',
                  'type' => 'raw'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'verb',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0,
          'type' => '%'
        },
        {
          'parent' => {},
          'text' => '
'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' @macro4
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
                  'text' => '4 1
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'pagesizes',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '2
'
        },
        {
          'parent' => {},
          'text' => '3
'
        },
        {
          'parent' => {},
          'text' => '4
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'doubleafter 1
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'headings',
          'parent' => {},
          'special' => {
            'misc_args' => [
              'doubleafter'
            ]
          }
        },
        {
          'parent' => {},
          'text' => '2
'
        },
        {
          'parent' => {},
          'text' => '3
'
        },
        {
          'parent' => {},
          'text' => '4
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'verbatim',
      'contents' => [
        {
          'parent' => {},
          'text' => '@macro2
',
          'type' => 'raw'
        }
      ],
      'parent' => {}
    },
    {
      'cmdname' => 'ignore',
      'contents' => [
        {
          'parent' => {},
          'text' => '@macro4
',
          'type' => 'raw'
        }
      ],
      'parent' => {}
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'macro7',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'truc',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@emph{\\truc\\}
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'args_index' => {
          'truc' => 0
        },
        'macro_line' => ' macro7 {truc}
',
        'macrobody' => '@emph{\\truc\\}
'
      }
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'macro7 defined
'
        },
        {
          'parent' => {},
          'text' => '1
'
        },
        {
          'parent' => {},
          'text' => '2
'
        },
        {
          'parent' => {},
          'text' => '3
'
        },
        {
          'parent' => {},
          'text' => '4
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
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '&&&& 
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
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Call macro7
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'aaa'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'emph',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0
        },
        {
          'parent' => {},
          'text' => '
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
      'type' => 'normal_line'
    }
  ]
};
$result_trees{'complex_argument'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[0];
$result_trees{'complex_argument'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[0];
$result_trees{'complex_argument'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[0];
$result_trees{'complex_argument'}{'contents'}[0]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[1]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[2];
$result_trees{'complex_argument'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[2];
$result_trees{'complex_argument'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[2];
$result_trees{'complex_argument'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'complex_argument'}{'contents'}[2];
$result_trees{'complex_argument'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'complex_argument'}{'contents'}[2];
$result_trees{'complex_argument'}{'contents'}[2]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[3]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[4];
$result_trees{'complex_argument'}{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[4];
$result_trees{'complex_argument'}{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'complex_argument'}{'contents'}[4];
$result_trees{'complex_argument'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[4];
$result_trees{'complex_argument'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[4];
$result_trees{'complex_argument'}{'contents'}[4]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[5]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6]{'contents'}[0];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6]{'contents'}[2];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6]{'contents'}[3]{'args'}[0];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6]{'contents'}[3];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[4]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[5]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[6]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6]{'contents'}[7]{'args'}[0];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6]{'contents'}[7];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[7]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[8]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[9]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[10]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[7];
$result_trees{'complex_argument'}{'contents'}[7]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[8];
$result_trees{'complex_argument'}{'contents'}[8]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9];
$result_trees{'complex_argument'}{'contents'}[9]{'args'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9];
$result_trees{'complex_argument'}{'contents'}[9]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[10];
$result_trees{'complex_argument'}{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[10];
$result_trees{'complex_argument'}{'contents'}[10]{'contents'}[2]{'parent'} = $result_trees{'complex_argument'}{'contents'}[10];
$result_trees{'complex_argument'}{'contents'}[10]{'contents'}[3]{'parent'} = $result_trees{'complex_argument'}{'contents'}[10];
$result_trees{'complex_argument'}{'contents'}[10]{'contents'}[4]{'parent'} = $result_trees{'complex_argument'}{'contents'}[10];
$result_trees{'complex_argument'}{'contents'}[10]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[11]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[12];
$result_trees{'complex_argument'}{'contents'}[12]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[13]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[14]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[14];
$result_trees{'complex_argument'}{'contents'}[14]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[14]{'contents'}[1]{'args'}[0];
$result_trees{'complex_argument'}{'contents'}[14]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[14]{'contents'}[1];
$result_trees{'complex_argument'}{'contents'}[14]{'contents'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[14];
$result_trees{'complex_argument'}{'contents'}[14]{'contents'}[2]{'parent'} = $result_trees{'complex_argument'}{'contents'}[14];
$result_trees{'complex_argument'}{'contents'}[14]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[15]{'parent'} = $result_trees{'complex_argument'};

$result_texts{'complex_argument'} = '@macro macro2{arg}
coucou \\arg\\ after arg
@end macro

@macro macro4 {}
1
2
3
4
@end macro

@macro macro3{text, arg}
\\text\\
&&&& \\arg\\
@end macro

@verb{% @macro2 %}
@c @macro4
@pagesizes 4 1
2
3
4
@headings doubleafter 1
2
3
4
@verbatim
@macro2
@end verbatim
@ignore
@macro4
@end ignore
@macro macro7 {truc}
@emph{\\truc\\}
@end macro
macro7 defined
1
2
3
4

&&&& 

Call macro7
@emph{aaa}

';

$result_errors{'complex_argument'} = [];


