use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'inlineraw_with_empty_line'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'A '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'plaintext'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'plaintext ``
'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'inlineraw',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ]
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          },
          'parent' => {},
          'remaining_args' => 0
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'lbracechar',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '  a.  Now html
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'html'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'in 
'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'inlineraw',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ]
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 4,
            'macro' => ''
          },
          'parent' => {},
          'remaining_args' => 0
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '<i>'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'HTML'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'acronym',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ]
            ],
            'normalized' => 'HTML'
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
          'text' => '</i>.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'inlineraw_with_empty_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[0];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'inlineraw_with_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[0];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[0]{'parent'} = $result_trees{'inlineraw_with_empty_line'};
$result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[0];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[1];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[1];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[2];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[2]{'args'}[1];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[2]{'args'}[1];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[2];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[2]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[1];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[1]{'parent'} = $result_trees{'inlineraw_with_empty_line'};
$result_trees{'inlineraw_with_empty_line'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[2];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[2]{'contents'}[1];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[2]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'inlineraw_with_empty_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[2];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'inlineraw_with_empty_line'}{'contents'}[2];
$result_trees{'inlineraw_with_empty_line'}{'contents'}[2]{'parent'} = $result_trees{'inlineraw_with_empty_line'};

$result_texis{'inlineraw_with_empty_line'} = 'A @inlineraw{plaintext, plaintext ``

}@lbracechar{}  a.  Now html
@inlineraw{html, in 

}<i>@acronym{HTML}</i>.
';


$result_texts{'inlineraw_with_empty_line'} = 'A {  a.  Now html
<i>HTML</i>.
';

$result_errors{'inlineraw_with_empty_line'} = [
  {
    'error_line' => ':1: @inlineraw missing close brace
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@inlineraw missing close brace',
    'type' => 'error'
  },
  {
    'error_line' => ':3: Misplaced }
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  },
  {
    'error_line' => ':4: @inlineraw missing close brace
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => '@inlineraw missing close brace',
    'type' => 'error'
  },
  {
    'error_line' => ':6: Misplaced }
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  }
];


1;
