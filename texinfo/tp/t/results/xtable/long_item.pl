use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'long_item'} = {
  'contents' => [
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
                  'text' => 'first item      aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaa'
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
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'second itemx bbbbbbbbbbbbbbbbbbbbbbbbbbbbb b b b b b b b b b b b b b'
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
                  'text' => 'Text.
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {},
          'type' => 'table_item'
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
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'long_item'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'long_item'}{'contents'}[0];
$result_trees{'long_item'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'long_item'}{'contents'}[0]{'args'}[0];
$result_trees{'long_item'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'long_item'}{'contents'}[0]{'args'}[0];
$result_trees{'long_item'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'long_item'}{'contents'}[0]{'args'}[0];
$result_trees{'long_item'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'long_item'}{'contents'}[0];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'long_item'}{'contents'}[0]{'contents'}[0];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'long_item'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'long_item'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'long_item'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'long_item'}{'contents'}[0]{'contents'}[0];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[0]{'extra'}{'misc_content'}[0] = $result_trees{'long_item'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'long_item'}{'contents'}[0];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'long_item'}{'contents'}[0]{'contents'}[1];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'long_item'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'long_item'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'long_item'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'long_item'}{'contents'}[0]{'contents'}[1];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'long_item'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'long_item'}{'contents'}[0];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'long_item'}{'contents'}[0]{'contents'}[2];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'long_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'long_item'}{'contents'}[0]{'contents'}[2];
$result_trees{'long_item'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'long_item'}{'contents'}[0];
$result_trees{'long_item'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'long_item'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'long_item'}{'contents'}[0]{'extra'}{'command_as_argument'} = $result_trees{'long_item'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'long_item'}{'contents'}[0]{'parent'} = $result_trees{'long_item'};

$result_texis{'long_item'} = '@table @emph
@item first item      aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaa
@itemx second itemx bbbbbbbbbbbbbbbbbbbbbbbbbbbbb b b b b b b b b b b b b b

Text.
@end table
';


$result_texts{'long_item'} = 'first item      aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaa
second itemx bbbbbbbbbbbbbbbbbbbbbbbbbbbbb b b b b b b b b b b b b b

Text.
';

$result_errors{'long_item'} = [
  {
    'error_line' => ':5: No matching `@end table\'
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'No matching `@end table\'',
    'type' => 'error'
  }
];



$result_converted{'plaintext'}->{'long_item'} = '_first item aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaa_
_second itemx bbbbbbbbbbbbbbbbbbbbbbbbbbbbb b b b b b b b b b b b b b_

     Text.
';

1;
