use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'syncode_index_print_both'} = {
  'contents' => [
    {
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
                  'text' => 'fn cp'
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
          'cmdname' => 'syncodeindex',
          'extra' => {
            'misc_args' => [
              'fn',
              'cp'
            ]
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
        }
      ],
      'parent' => {},
      'type' => 'text_root'
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
              'text' => 'Top'
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
      'cmdname' => 'node',
      'contents' => [
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
                  'parent' => {},
                  'text' => 'c---oncept'
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
          'cmdname' => 'cindex',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'cindex',
              'index_name' => 'cp',
              'index_prefix' => 'c',
              'key' => 'c---oncept',
              'node' => {},
              'number' => 1
            },
            'misc_content' => []
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
            'macro' => ''
          },
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
                  'text' => 'f---un'
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
          'cmdname' => 'findex',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'findex',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'key' => 'f---un',
              'node' => {},
              'number' => 1
            },
            'misc_content' => []
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Print fn
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
                  'text' => 'fn'
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
          'cmdname' => 'printindex',
          'extra' => {
            'misc_args' => [
              'fn'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 11,
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'Print vr
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
                  'text' => 'cp'
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
          'cmdname' => 'printindex',
          'extra' => {
            'misc_args' => [
              'cp'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 15,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Top'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 3,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'syncode_index_print_both'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[0]{'contents'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[0]{'parent'} = $result_trees{'syncode_index_print_both'};
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'node'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1]{'extra'}{'misc_content'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'content'};
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2]{'extra'}{'index_entry'}{'command'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2]{'extra'}{'index_entry'}{'node'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2]{'extra'}{'misc_content'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2]{'extra'}{'index_entry'}{'content'};
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[5];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[7];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[9];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[11]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[11]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[11]{'args'}[0];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[11];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[11]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'contents'}[12]{'parent'} = $result_trees{'syncode_index_print_both'}{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'syncode_index_print_both'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'syncode_index_print_both'}{'contents'}[1]{'parent'} = $result_trees{'syncode_index_print_both'};

$result_texis{'syncode_index_print_both'} = '@syncodeindex fn cp

@node Top

@cindex c---oncept
@findex f---un


Print fn

@printindex fn

Print vr

@printindex cp

';


$result_texts{'syncode_index_print_both'} = '



Print fn


Print vr


';

$result_sectioning{'syncode_index_print_both'} = {};

$result_nodes{'syncode_index_print_both'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'node_up' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'dir'
        }
      ]
    }
  }
};

$result_menus{'syncode_index_print_both'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'syncode_index_print_both'} = [
  {
    'error_line' => ':11: warning: Printing an index `fn\' merged in another one `cp\'
',
    'file_name' => '',
    'line_nr' => 11,
    'macro' => '',
    'text' => 'Printing an index `fn\' merged in another one `cp\'',
    'type' => 'warning'
  }
];


$result_indices{'syncode_index_print_both'} = {
  'merged_indices' => {
    'fn' => 'cp'
  }
};



$result_converted{'info'}->{'syncode_index_print_both'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)

Print fn

   Print vr

 [index ]
* Menu:

* c--oncept:                             Top.                   (line 3)
* f---un:                                Top.                   (line 3)



Tag Table:
Node: Top52

End Tag Table
';

1;
