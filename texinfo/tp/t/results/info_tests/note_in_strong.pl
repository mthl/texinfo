use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'note_in_strong'} = {
  'contents' => [
    {
      'contents' => [],
      'parent' => {},
      'type' => 'text_root'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'One '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Note'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'strong',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '.
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
              'text' => '3 '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Note a'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'strong',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '.
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
              'text' => '2 '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'note'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'strong',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 9,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '.
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
              'text' => '4 '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'note b'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'strong',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 11,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '.
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
              'text' => '6 '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' note'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'strong',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 13,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'note_in_strong'}{'contents'}[0]{'parent'} = $result_trees{'note_in_strong'};
$result_trees{'note_in_strong'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'note_in_strong'}{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'args'}[0];
$result_trees{'note_in_strong'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'args'}[0];
$result_trees{'note_in_strong'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'args'}[0];
$result_trees{'note_in_strong'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[3];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[3];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[3];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[7];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[7]{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[7];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[7];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[9];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[9]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[9]{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[9];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[9]{'contents'}[2]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[9];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[11];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[11]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[11]{'contents'}[1]{'args'}[0];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[11]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[11]{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[11]{'contents'}[1]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[11];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[11]{'contents'}[2]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[11];
$result_trees{'note_in_strong'}{'contents'}[1]{'contents'}[11]{'parent'} = $result_trees{'note_in_strong'}{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'note_in_strong'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'note_in_strong'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'note_in_strong'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'note_in_strong'}{'contents'}[1]{'parent'} = $result_trees{'note_in_strong'};

$result_texis{'note_in_strong'} = '@node Top

One @strong{Note}.

3 @strong{Note a}.



2 @strong{note}.

4 @strong{note b}.

6 @strong{ note}.
';


$result_texts{'note_in_strong'} = '
One Note.

3 Note a.



2 note.

4 note b.

6  note.
';

$result_sectioning{'note_in_strong'} = {};

$result_nodes{'note_in_strong'} = {
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

$result_menus{'note_in_strong'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'note_in_strong'} = [];



$result_converted{'info'}->{'note_in_strong'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)

One *Note*.

   3 *Note a*.

   2 *note*.

   4 *note b*.

   6 * note*.


Tag Table:
Node: Top52

End Tag Table
';

$result_converted_errors{'info'}->{'note_in_strong'} = [
  {
    'file_name' => '',
    'error_line' => ':3: warning: @strong{Note...} produces a spurious cross-reference in Info; reword to avoid that
',
    'text' => '@strong{Note...} produces a spurious cross-reference in Info; reword to avoid that',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 3
  },
  {
    'file_name' => '',
    'error_line' => ':5: warning: @strong{Note...} produces a spurious cross-reference in Info; reword to avoid that
',
    'text' => '@strong{Note...} produces a spurious cross-reference in Info; reword to avoid that',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 5
  },
  {
    'file_name' => '',
    'error_line' => ':9: warning: @strong{Note...} produces a spurious cross-reference in Info; reword to avoid that
',
    'text' => '@strong{Note...} produces a spurious cross-reference in Info; reword to avoid that',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 9
  },
  {
    'file_name' => '',
    'error_line' => ':11: warning: @strong{Note...} produces a spurious cross-reference in Info; reword to avoid that
',
    'text' => '@strong{Note...} produces a spurious cross-reference in Info; reword to avoid that',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 11
  }
];


1;
