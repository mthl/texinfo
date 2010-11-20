use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

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
      'extra' => {
        'arg_line' => ' macro2{arg}
',
        'args_index' => {
          'arg' => 0
        },
        'macrobody' => 'coucou \\arg\\ after arg
'
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
      'extra' => {
        'arg_line' => ' macro4 {}
',
        'macrobody' => '1
2
3
4
'
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
      'extra' => {
        'arg_line' => ' macro3{text, arg}
',
        'args_index' => {
          'arg' => 1,
          'text' => 0
        },
        'macrobody' => '\\text\\
&&&& \\arg\\
'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 12,
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
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => '4 1'
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
          'cmdname' => 'pagesizes',
          'extra' => {
            'misc_content' => [
              {}
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 38,
            'macro' => 'macro3'
          },
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
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'doubleafter 1'
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
          'cmdname' => 'headings',
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 38,
            'macro' => 'macro3'
          },
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
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'cmdname' => 'ignore',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
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
      'extra' => {
        'arg_line' => ' macro7 {truc}
',
        'args_index' => {
          'truc' => 0
        },
        'macrobody' => '@emph{\\truc\\}
'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 38,
        'macro' => 'macro3'
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
      'type' => 'empty_line'
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
      'type' => 'empty_line'
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
          'parent' => {}
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
      'type' => 'empty_line'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'complex_argument'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[0];
$result_trees{'complex_argument'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[0];
$result_trees{'complex_argument'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[0];
$result_trees{'complex_argument'}{'contents'}[0]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[1]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[2]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[3];
$result_trees{'complex_argument'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[3];
$result_trees{'complex_argument'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[3];
$result_trees{'complex_argument'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'complex_argument'}{'contents'}[3];
$result_trees{'complex_argument'}{'contents'}[3]{'contents'}[3]{'parent'} = $result_trees{'complex_argument'}{'contents'}[3];
$result_trees{'complex_argument'}{'contents'}[3]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[4]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[5]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'args'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'args'}[2]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[6];
$result_trees{'complex_argument'}{'contents'}[6]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[7]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[8]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9]{'contents'}[0];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9]{'contents'}[2];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[2]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9]{'contents'}[3]{'args'}[0];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9]{'contents'}[3]{'args'}[0];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9]{'contents'}[3]{'args'}[0];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9]{'contents'}[3];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[3]{'extra'}{'misc_content'}[0] = $result_trees{'complex_argument'}{'contents'}[9]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[3]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[4]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[5]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[6]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9]{'contents'}[7]{'args'}[0];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9]{'contents'}[7]{'args'}[0];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9]{'contents'}[7]{'args'}[0];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9]{'contents'}[7];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[7]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[8]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[9]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9];
$result_trees{'complex_argument'}{'contents'}[9]{'contents'}[10]{'parent'} = $result_trees{'complex_argument'}{'contents'}[9];
$result_trees{'complex_argument'}{'contents'}[9]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[10];
$result_trees{'complex_argument'}{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[10];
$result_trees{'complex_argument'}{'contents'}[10]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[11]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[12];
$result_trees{'complex_argument'}{'contents'}[12]{'contents'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[12];
$result_trees{'complex_argument'}{'contents'}[12]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[13]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[14];
$result_trees{'complex_argument'}{'contents'}[14]{'args'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[14];
$result_trees{'complex_argument'}{'contents'}[14]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[14];
$result_trees{'complex_argument'}{'contents'}[14]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[15]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[16]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[16];
$result_trees{'complex_argument'}{'contents'}[16]{'contents'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[16];
$result_trees{'complex_argument'}{'contents'}[16]{'contents'}[2]{'parent'} = $result_trees{'complex_argument'}{'contents'}[16];
$result_trees{'complex_argument'}{'contents'}[16]{'contents'}[3]{'parent'} = $result_trees{'complex_argument'}{'contents'}[16];
$result_trees{'complex_argument'}{'contents'}[16]{'contents'}[4]{'parent'} = $result_trees{'complex_argument'}{'contents'}[16];
$result_trees{'complex_argument'}{'contents'}[16]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[17]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[18]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[18];
$result_trees{'complex_argument'}{'contents'}[18]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[19]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[20]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[20];
$result_trees{'complex_argument'}{'contents'}[20]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[20]{'contents'}[1]{'args'}[0];
$result_trees{'complex_argument'}{'contents'}[20]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'complex_argument'}{'contents'}[20]{'contents'}[1];
$result_trees{'complex_argument'}{'contents'}[20]{'contents'}[1]{'parent'} = $result_trees{'complex_argument'}{'contents'}[20];
$result_trees{'complex_argument'}{'contents'}[20]{'contents'}[2]{'parent'} = $result_trees{'complex_argument'}{'contents'}[20];
$result_trees{'complex_argument'}{'contents'}[20]{'parent'} = $result_trees{'complex_argument'};
$result_trees{'complex_argument'}{'contents'}[21]{'parent'} = $result_trees{'complex_argument'};

$result_texis{'complex_argument'} = '@macro macro2{arg}
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


$result_texts{'complex_argument'} = '


 @macro2 
2
3
4
2
3
4
@macro2
macro7 defined
1
2
3
4

&&&& 

Call macro7
aaa

';

$result_errors{'complex_argument'} = [
  {
    'error_line' => ':38: Bad argument to @headings: doubleafter 1 (possibly involving @macro4)
',
    'file_name' => '',
    'line_nr' => 38,
    'macro' => 'macro4',
    'text' => 'Bad argument to @headings: doubleafter 1',
    'type' => 'error'
  }
];


1;
