use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'no_argument_for_table'} = {
  'contents' => [
    {
      'cmdname' => 'table',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [],
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
                  'text' => 'item'
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'In item.
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
            'line_nr' => 4,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {
              'cmdname' => 'asis',
              'parent' => {},
              'type' => 'command_as_argument'
            }
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
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_argument_for_table'}{'contents'}[0];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_argument_for_table'}{'contents'}[0];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[2];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_argument_for_table'}{'contents'}[0];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[3];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'no_argument_for_table'}{'contents'}[0];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[4];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[4]{'extra'}{'command'} = $result_trees{'no_argument_for_table'}{'contents'}[0];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'no_argument_for_table'}{'contents'}[0];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0]{'parent'} = $result_trees{'no_argument_for_table'}{'contents'}[0];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'extra'}{'command_as_argument'} = $result_trees{'no_argument_for_table'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'no_argument_for_table'}{'contents'}[0]{'contents'}[4];
$result_trees{'no_argument_for_table'}{'contents'}[0]{'parent'} = $result_trees{'no_argument_for_table'};

$result_texis{'no_argument_for_table'} = '@table
@item item
In item.
@end table
';


$result_texts{'no_argument_for_table'} = 'item
In item.
';

$result_errors{'no_argument_for_table'} = [
  {
    'error_line' => ':1: table requires an argument: the formatter for @item
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'table requires an argument: the formatter for @item',
    'type' => 'error'
  }
];


1;
