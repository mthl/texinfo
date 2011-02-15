use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'table'} = {
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
              'cmdname' => 'asis',
              'parent' => {},
              'type' => 'command_as_argument'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'space_at_end_block_command'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'table',
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
                  'text' => 'table item'
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
          'extra' => {
            'misc_content' => [
              {}
            ]
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
                  'text' => 'table itemx'
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
          'cmdname' => 'itemx',
          'extra' => {
            'misc_content' => [
              {}
            ]
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
              'text' => 'In table
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'command_as_argument' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
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
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'cmdname' => 'samp',
              'parent' => {},
              'type' => 'command_as_argument'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' samp
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'vtable',
      'contents' => [
        {
          'contents' => [
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' after vtable
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
                      'text' => 'index entry'
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
                  'number' => 1
                },
                'misc_content' => []
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
            }
          ],
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
                  'text' => 'vtable item'
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
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'vtable',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 1
            },
            'misc_content' => []
          },
          'parent' => {}
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' after item
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
                  'text' => 'key'
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
          'cmdname' => 'kindex',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'kindex',
              'index_name' => 'ky',
              'index_prefix' => 'k',
              'number' => 1
            },
            'misc_content' => []
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 15,
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
                  'text' => 'itemx vtable'
                },
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                },
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => ' comment in itemx line
',
                      'type' => 'misc_arg'
                    }
                  ],
                  'cmdname' => 'comment',
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'itemx',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'vtable',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 2
            },
            'misc_content' => []
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
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'command_as_argument' => {}
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
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'table'}{'contents'}[0]{'parent'} = $result_trees{'table'};
$result_trees{'table'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[0];
$result_trees{'table'}{'contents'}[1]{'contents'}[0]{'extra'}{'misc_content'}[0] = $result_trees{'table'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[3];
$result_trees{'table'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'table'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'extra'}{'command_as_argument'} = $result_trees{'table'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'parent'} = $result_trees{'table'};
$result_trees{'table'}{'contents'}[2]{'parent'} = $result_trees{'table'};
$result_trees{'table'}{'contents'}[3]{'parent'} = $result_trees{'table'};
$result_trees{'table'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'table'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'extra'}{'misc_content'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'content'};
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[1];
$result_trees{'table'}{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'table'}{'contents'}[4]{'contents'}[1];
$result_trees{'table'}{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'table'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[4]{'contents'}[1]{'extra'}{'misc_content'} = $result_trees{'table'}{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'content'};
$result_trees{'table'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[2];
$result_trees{'table'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[3]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[3]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[3]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[3];
$result_trees{'table'}{'contents'}[4]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'table'}{'contents'}[4]{'contents'}[3];
$result_trees{'table'}{'contents'}[4]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'table'}{'contents'}[4]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[4]{'contents'}[3]{'extra'}{'misc_content'} = $result_trees{'table'}{'contents'}[4]{'contents'}[3]{'extra'}{'index_entry'}{'content'};
$result_trees{'table'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'table'}{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[3];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'extra'}{'index_entry'}{'command'} = $result_trees{'table'}{'contents'}[4]{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'extra'}{'misc_content'} = $result_trees{'table'}{'contents'}[4]{'contents'}[4]{'extra'}{'index_entry'}{'content'};
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'table'}{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'table'}{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'table'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[4]{'extra'}{'command_as_argument'} = $result_trees{'table'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[4]{'parent'} = $result_trees{'table'};
$result_trees{'table'}{'contents'}[5]{'parent'} = $result_trees{'table'};

$result_texis{'table'} = '
@table @asis
@item table item
@itemx table itemx

In table
@end table

@vtable @samp@c samp
@c after vtable
@cindex index entry

@item vtable item
@c after item
@kindex key
@itemx itemx vtable @comment comment in itemx line

@end vtable
';


$result_texts{'table'} = '
table item
table itemx

In table


vtable item
itemx vtable

';

$result_errors{'table'} = [];



$result_converted{'plaintext'}->{'table'} = '
table item
table itemx

     In table

`vtable item\'
`itemx vtable\'

';

1;
