use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'formats_only_titles'} = {
  'contents' => [
    {
      'cmdname' => 'itemize',
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'before first itemize
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {},
          'type' => 'before_item'
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {
              'cmdname' => 'bullet',
              'parent' => {},
              'type' => 'command_as_argument'
            }
          ]
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'enumerate',
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'before first enumerate
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {},
          'type' => 'before_item'
        }
      ],
      'extra' => {
        'enumerate_specification' => 0
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
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'before first table
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {},
          'type' => 'before_item'
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
      'cmdname' => 'vtable',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'before first vtable
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {},
          'type' => 'before_item'
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
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
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
                      'text' => '0.5 0.5'
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
              'cmdname' => 'columnfractions',
              'extra' => {
                'misc_args' => [
                  '0.5',
                  '0.5'
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 17,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'multitable',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'before first multitable
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {},
          'type' => 'before_item'
        }
      ],
      'extra' => {
        'columnfractions' => [],
        'max_columns' => 2
      },
      'line_nr' => {},
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
$result_trees{'formats_only_titles'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[0];
$result_trees{'formats_only_titles'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'formats_only_titles'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[0]{'contents'}[1];
$result_trees{'formats_only_titles'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[0];
$result_trees{'formats_only_titles'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[0];
$result_trees{'formats_only_titles'}{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'};
$result_trees{'formats_only_titles'}{'contents'}[1]{'parent'} = $result_trees{'formats_only_titles'};
$result_trees{'formats_only_titles'}{'contents'}[2]{'parent'} = $result_trees{'formats_only_titles'};
$result_trees{'formats_only_titles'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[3];
$result_trees{'formats_only_titles'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'formats_only_titles'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[3]{'contents'}[1];
$result_trees{'formats_only_titles'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[3];
$result_trees{'formats_only_titles'}{'contents'}[3]{'parent'} = $result_trees{'formats_only_titles'};
$result_trees{'formats_only_titles'}{'contents'}[4]{'parent'} = $result_trees{'formats_only_titles'};
$result_trees{'formats_only_titles'}{'contents'}[5]{'parent'} = $result_trees{'formats_only_titles'};
$result_trees{'formats_only_titles'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[6]{'args'}[0];
$result_trees{'formats_only_titles'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[6]{'args'}[0];
$result_trees{'formats_only_titles'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[6]{'args'}[0];
$result_trees{'formats_only_titles'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[6];
$result_trees{'formats_only_titles'}{'contents'}[6]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[6]{'contents'}[0]{'contents'}[0];
$result_trees{'formats_only_titles'}{'contents'}[6]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[6]{'contents'}[0];
$result_trees{'formats_only_titles'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[6];
$result_trees{'formats_only_titles'}{'contents'}[6]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'formats_only_titles'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'formats_only_titles'}{'contents'}[6]{'extra'}{'command_as_argument'} = $result_trees{'formats_only_titles'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'formats_only_titles'}{'contents'}[6]{'parent'} = $result_trees{'formats_only_titles'};
$result_trees{'formats_only_titles'}{'contents'}[7]{'parent'} = $result_trees{'formats_only_titles'};
$result_trees{'formats_only_titles'}{'contents'}[8]{'parent'} = $result_trees{'formats_only_titles'};
$result_trees{'formats_only_titles'}{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[9]{'args'}[0];
$result_trees{'formats_only_titles'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[9]{'args'}[0];
$result_trees{'formats_only_titles'}{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[9]{'args'}[0];
$result_trees{'formats_only_titles'}{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[9];
$result_trees{'formats_only_titles'}{'contents'}[9]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[9]{'contents'}[0]{'contents'}[0];
$result_trees{'formats_only_titles'}{'contents'}[9]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[9]{'contents'}[0];
$result_trees{'formats_only_titles'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[9];
$result_trees{'formats_only_titles'}{'contents'}[9]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'formats_only_titles'}{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'formats_only_titles'}{'contents'}[9]{'extra'}{'command_as_argument'} = $result_trees{'formats_only_titles'}{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'formats_only_titles'}{'contents'}[9]{'parent'} = $result_trees{'formats_only_titles'};
$result_trees{'formats_only_titles'}{'contents'}[10]{'parent'} = $result_trees{'formats_only_titles'};
$result_trees{'formats_only_titles'}{'contents'}[11]{'parent'} = $result_trees{'formats_only_titles'};
$result_trees{'formats_only_titles'}{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[12]{'args'}[0];
$result_trees{'formats_only_titles'}{'contents'}[12]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[12]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'formats_only_titles'}{'contents'}[12]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[12]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'formats_only_titles'}{'contents'}[12]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[12]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'formats_only_titles'}{'contents'}[12]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[12]{'args'}[0]{'contents'}[1];
$result_trees{'formats_only_titles'}{'contents'}[12]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[12]{'args'}[0];
$result_trees{'formats_only_titles'}{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[12];
$result_trees{'formats_only_titles'}{'contents'}[12]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[12]{'contents'}[0]{'contents'}[0];
$result_trees{'formats_only_titles'}{'contents'}[12]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[12]{'contents'}[0];
$result_trees{'formats_only_titles'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'formats_only_titles'}{'contents'}[12];
$result_trees{'formats_only_titles'}{'contents'}[12]{'extra'}{'columnfractions'} = $result_trees{'formats_only_titles'}{'contents'}[12]{'args'}[0]{'contents'}[1]{'extra'}{'misc_args'};
$result_trees{'formats_only_titles'}{'contents'}[12]{'line_nr'} = $result_trees{'formats_only_titles'}{'contents'}[12]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'formats_only_titles'}{'contents'}[12]{'parent'} = $result_trees{'formats_only_titles'};
$result_trees{'formats_only_titles'}{'contents'}[13]{'parent'} = $result_trees{'formats_only_titles'};

$result_texis{'formats_only_titles'} = '@itemize
before first itemize
@end itemize

@enumerate
before first enumerate
@end enumerate

@table @emph
before first table
@end table

@vtable @asis
before first vtable
@end vtable

@multitable @columnfractions 0.5 0.5
before first multitable
@end multitable
';


$result_texts{'formats_only_titles'} = 'before first itemize

before first enumerate

before first table

before first vtable

before first multitable
';

$result_errors{'formats_only_titles'} = [
  {
    'error_line' => ':1: warning: @itemize has text but no @item
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@itemize has text but no @item',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @enumerate has text but no @item
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@enumerate has text but no @item',
    'type' => 'warning'
  },
  {
    'error_line' => ':9: warning: @table has text but no @item
',
    'file_name' => '',
    'line_nr' => 9,
    'macro' => '',
    'text' => '@table has text but no @item',
    'type' => 'warning'
  },
  {
    'error_line' => ':13: warning: @vtable has text but no @item
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => '@vtable has text but no @item',
    'type' => 'warning'
  },
  {
    'error_line' => ':17: warning: @multitable has text but no @item
',
    'file_name' => '',
    'line_nr' => 17,
    'macro' => '',
    'text' => '@multitable has text but no @item',
    'type' => 'warning'
  }
];


1;
