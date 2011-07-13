use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'simple'} = {
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
              'text' => 'Type'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'Label'
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
      'cmdname' => 'float',
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
              'text' => 'In float.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Caption.'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'caption',
          'contents' => [],
          'extra' => {
            'float' => {}
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 4,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
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
                  'text' => 'float'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'float',
            'text_arg' => 'float'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ],
          [
            {}
          ]
        ],
        'caption' => {},
        'end_command' => {},
        'node_content' => [
          {}
        ],
        'normalized' => 'Label',
        'type' => {
          'content' => [
            {}
          ],
          'normalized' => 'Type'
        }
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'number' => 1,
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'simple'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'args'}[0];
$result_trees{'simple'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'args'}[0];
$result_trees{'simple'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'args'}[1];
$result_trees{'simple'}{'contents'}[0]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'args'}[1];
$result_trees{'simple'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[2];
$result_trees{'simple'}{'contents'}[0]{'contents'}[2]{'extra'}{'float'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[4];
$result_trees{'simple'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[4];
$result_trees{'simple'}{'contents'}[0]{'contents'}[4]{'extra'}{'command'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'simple'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'simple'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'simple'}{'contents'}[0]{'args'}[1]{'contents'}[1];
$result_trees{'simple'}{'contents'}[0]{'extra'}{'caption'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[2];
$result_trees{'simple'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[4];
$result_trees{'simple'}{'contents'}[0]{'extra'}{'node_content'}[0] = $result_trees{'simple'}{'contents'}[0]{'args'}[1]{'contents'}[1];
$result_trees{'simple'}{'contents'}[0]{'extra'}{'type'}{'content'}[0] = $result_trees{'simple'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'simple'}{'contents'}[0]{'parent'} = $result_trees{'simple'};

$result_texis{'simple'} = '@float Type, Label

In float.
@caption{Caption.}
@end float';


$result_texts{'simple'} = 'Type, Label

In float.

';

$result_errors{'simple'} = [];


$result_floats{'simple'} = {
  'Type' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'end_command' => {
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'float',
            'text_arg' => 'float'
          }
        },
        'normalized' => 'Label',
        'type' => {
          'content' => [
            {
              'text' => 'Type'
            }
          ],
          'normalized' => 'Type'
        }
      },
      'number' => 1
    }
  ]
};
$result_floats{'simple'}{'Type'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'simple'}{'Type'}[0];
$result_floats{'simple'}{'Type'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_floats{'simple'}{'Type'}[0];



$result_converted{'plaintext'}->{'simple'} = 'In float.

Type 1: Caption.
';

1;
