use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'itemx_before_item'} = {
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
                  'text' => 'in itemx'
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
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
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
            'line_nr' => 3,
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
    }
  ],
  'type' => 'text_root'
};
$result_trees{'itemx_before_item'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'itemx_before_item'}{'contents'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'itemx_before_item'}{'contents'}[0]{'args'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'itemx_before_item'}{'contents'}[0]{'args'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'itemx_before_item'}{'contents'}[0]{'args'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'itemx_before_item'}{'contents'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[0]{'extra'}{'misc_content'}[0] = $result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'itemx_before_item'}{'contents'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[1];
$result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[1];
$result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[1]{'extra'}{'command'} = $result_trees{'itemx_before_item'}{'contents'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'itemx_before_item'}{'contents'}[0];
$result_trees{'itemx_before_item'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'itemx_before_item'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'itemx_before_item'}{'contents'}[0]{'extra'}{'command_as_argument'} = $result_trees{'itemx_before_item'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'itemx_before_item'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'itemx_before_item'}{'contents'}[0]{'contents'}[1];
$result_trees{'itemx_before_item'}{'contents'}[0]{'parent'} = $result_trees{'itemx_before_item'};

$result_texis{'itemx_before_item'} = '@table @emph
@itemx in itemx
@end table
';


$result_texts{'itemx_before_item'} = 'in itemx
';

$result_errors{'itemx_before_item'} = [];


1;
