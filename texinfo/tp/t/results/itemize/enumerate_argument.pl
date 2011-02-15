use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'enumerate_argument'} = {
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
              'text' => '1'
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
      'cmdname' => 'enumerate',
      'contents' => [],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'enumerate_specification' => '1'
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
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'A'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' comment
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
      'cmdname' => 'enumerate',
      'contents' => [],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'enumerate_specification' => 'A'
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
              'parent' => {},
              'text' => 'z'
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'space_at_end_block_command'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' comment
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
      'cmdname' => 'enumerate',
      'contents' => [],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'enumerate_specification' => 'z'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 7,
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
$result_trees{'enumerate_argument'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'enumerate_argument'}{'contents'}[0]{'args'}[0];
$result_trees{'enumerate_argument'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'enumerate_argument'}{'contents'}[0]{'args'}[0];
$result_trees{'enumerate_argument'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'enumerate_argument'}{'contents'}[0]{'args'}[0];
$result_trees{'enumerate_argument'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'enumerate_argument'}{'contents'}[0];
$result_trees{'enumerate_argument'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'enumerate_argument'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'enumerate_argument'}{'contents'}[0]{'parent'} = $result_trees{'enumerate_argument'};
$result_trees{'enumerate_argument'}{'contents'}[1]{'parent'} = $result_trees{'enumerate_argument'};
$result_trees{'enumerate_argument'}{'contents'}[2]{'parent'} = $result_trees{'enumerate_argument'};
$result_trees{'enumerate_argument'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'enumerate_argument'}{'contents'}[3]{'args'}[0];
$result_trees{'enumerate_argument'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'enumerate_argument'}{'contents'}[3]{'args'}[0];
$result_trees{'enumerate_argument'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'enumerate_argument'}{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'enumerate_argument'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'enumerate_argument'}{'contents'}[3]{'args'}[0];
$result_trees{'enumerate_argument'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'enumerate_argument'}{'contents'}[3];
$result_trees{'enumerate_argument'}{'contents'}[3]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'enumerate_argument'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'enumerate_argument'}{'contents'}[3]{'parent'} = $result_trees{'enumerate_argument'};
$result_trees{'enumerate_argument'}{'contents'}[4]{'parent'} = $result_trees{'enumerate_argument'};
$result_trees{'enumerate_argument'}{'contents'}[5]{'parent'} = $result_trees{'enumerate_argument'};
$result_trees{'enumerate_argument'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'enumerate_argument'}{'contents'}[6]{'args'}[0];
$result_trees{'enumerate_argument'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'enumerate_argument'}{'contents'}[6]{'args'}[0];
$result_trees{'enumerate_argument'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'enumerate_argument'}{'contents'}[6]{'args'}[0];
$result_trees{'enumerate_argument'}{'contents'}[6]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'enumerate_argument'}{'contents'}[6]{'args'}[0]{'contents'}[3];
$result_trees{'enumerate_argument'}{'contents'}[6]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'enumerate_argument'}{'contents'}[6]{'args'}[0];
$result_trees{'enumerate_argument'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'enumerate_argument'}{'contents'}[6];
$result_trees{'enumerate_argument'}{'contents'}[6]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'enumerate_argument'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'enumerate_argument'}{'contents'}[6]{'parent'} = $result_trees{'enumerate_argument'};
$result_trees{'enumerate_argument'}{'contents'}[7]{'parent'} = $result_trees{'enumerate_argument'};

$result_texis{'enumerate_argument'} = '@enumerate 1
@end enumerate

@enumerate A@c comment
@end enumerate

@enumerate z @c comment
@end enumerate
';


$result_texts{'enumerate_argument'} = '

';

$result_errors{'enumerate_argument'} = [];



$result_converted{'plaintext'}->{'enumerate_argument'} = '
';

1;
