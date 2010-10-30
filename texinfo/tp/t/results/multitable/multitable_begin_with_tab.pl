use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'multitable_begin_with_tab'} = {
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
                  'text' => 'a'
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
                  'text' => 'b'
                }
              ],
              'parent' => {},
              'type' => 'bracketed'
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
      'cmdname' => 'multitable',
      'contents' => [
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
                  'text' => 't
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
        'max_columns' => 2,
        'prototypes' => [
          {},
          {}
        ]
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'c'
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
                  'text' => 'd'
                }
              ],
              'parent' => {},
              'type' => 'bracketed'
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
      'cmdname' => 'multitable',
      'contents' => [
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
                  'text' => 't2
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'contents' => [
            {
              'cmdname' => 'item',
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
                      'text' => 'it
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {}
            }
          ],
          'extra' => {
            'cell_number' => 1
          },
          'parent' => {},
          'type' => 'row'
        }
      ],
      'extra' => {
        'max_columns' => 2,
        'prototypes' => [
          {},
          {}
        ]
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
$result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'extra'}{'prototypes'}[0] = $result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'extra'}{'prototypes'}[1] = $result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'multitable_begin_with_tab'}{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'};
$result_trees{'multitable_begin_with_tab'}{'contents'}[1]{'parent'} = $result_trees{'multitable_begin_with_tab'};
$result_trees{'multitable_begin_with_tab'}{'contents'}[2]{'parent'} = $result_trees{'multitable_begin_with_tab'};
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0]{'contents'}[3];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[0]{'contents'}[1];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[1];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'multitable_begin_with_tab'}{'contents'}[3];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'extra'}{'prototypes'}[0] = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'extra'}{'prototypes'}[1] = $result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'args'}[0]{'contents'}[3];
$result_trees{'multitable_begin_with_tab'}{'contents'}[3]{'parent'} = $result_trees{'multitable_begin_with_tab'};
$result_trees{'multitable_begin_with_tab'}{'contents'}[4]{'parent'} = $result_trees{'multitable_begin_with_tab'};

$result_texis{'multitable_begin_with_tab'} = '@multitable {a} {b}
 t
@end multitable

@multitable {c} {d}
 t2
@item it
@end multitable
';


$result_texts{'multitable_begin_with_tab'} = 't

t2
it
';

$result_errors{'multitable_begin_with_tab'} = [
  {
    'error_line' => ':2: @tab before @item
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@tab before @item',
    'type' => 'error'
  },
  {
    'error_line' => ':6: @tab before @item
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => '@tab before @item',
    'type' => 'error'
  }
];


1;
