use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements);

use utf8;

$result_trees{'symbol_after_command'} = {
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
                  'text' => '. dot'
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
                  'text' => ', comma'
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
                  'cmdname' => '@',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'cmdname' => '@',
                  'parent' => {}
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
              {},
              {},
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
                  'cmdname' => '{',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'cmdname' => '{',
                  'parent' => {}
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
              {},
              {},
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
                  'text' => '! exclam'
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
                  'text' => '\'\' quotes'
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
                  'text' => ': colon'
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
                  'text' => 'table'
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
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'table',
            'text_arg' => 'table'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 9,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'command_as_argument' => {},
        'end_command' => {}
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
    },
    {
      'contents' => [
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '. '
        },
        {
          'cmdname' => '{',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ', '
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' '
        },
        {
          'cmdname' => '?',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ', '
        },
        {
          'cmdname' => '!',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ': '
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'cmdname' => '{',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' '
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '\'\' '
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ':
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'symbol_after_command'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'symbol_after_command'}{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'misc_content'}[0] = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[1];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'}[1] = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'}[2] = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'extra'}{'misc_content'}[0] = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'extra'}{'misc_content'}[1] = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'extra'}{'misc_content'}[2] = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[4];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[5];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[5]{'extra'}{'misc_content'}[0] = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[6];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[6]{'extra'}{'misc_content'}[0] = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[7];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[7];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[7]{'extra'}{'command'} = $result_trees{'symbol_after_command'}{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[0];
$result_trees{'symbol_after_command'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'symbol_after_command'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'symbol_after_command'}{'contents'}[0]{'extra'}{'command_as_argument'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'symbol_after_command'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'symbol_after_command'}{'contents'}[0]{'contents'}[7];
$result_trees{'symbol_after_command'}{'contents'}[0]{'parent'} = $result_trees{'symbol_after_command'};
$result_trees{'symbol_after_command'}{'contents'}[1]{'parent'} = $result_trees{'symbol_after_command'};
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[6]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[7]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[8]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[9]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[10]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[11]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[12]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[13]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[14]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[15]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[16]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'contents'}[17]{'parent'} = $result_trees{'symbol_after_command'}{'contents'}[2];
$result_trees{'symbol_after_command'}{'contents'}[2]{'parent'} = $result_trees{'symbol_after_command'};

$result_texis{'symbol_after_command'} = '@table @asis
@item. dot
@item, comma
@item@@ @@
@item@{ @{
@item! exclam
@item\'\' quotes
@item: colon
@end table

@@. @{, @@@@ @?, @!: @@@{ @@\'\' @@:
';


$result_texts{'symbol_after_command'} = '. dot
, comma
@ @
{ {
! exclam
\'\' quotes
: colon

@. {, @@ ?, !: @{ @\'\' @:
';

$result_errors{'symbol_after_command'} = [];



$result_converted{'plaintext'}->{'symbol_after_command'} = '. dot
, comma
@ @
{ {
! exclam
" quotes
: colon

   @.  {, @@ ?, !: @{ @" @:
';

1;
