use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'table_in_code'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
'
                },
                {
                  'parent' => {},
                  'text' => 'in code
'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'code',
          'contents' => [],
          'parent' => {}
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
                  'text' => 'line'
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
              'text' => 'text
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'command_as_argument' => 'emph',
        'invalid_nesting' => 1
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
'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'table_in_code'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table_in_code'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'table_in_code'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table_in_code'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'table_in_code'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'table_in_code'}{'contents'}[0]{'contents'}[0];
$result_trees{'table_in_code'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'table_in_code'}{'contents'}[0];
$result_trees{'table_in_code'}{'contents'}[0]{'parent'} = $result_trees{'table_in_code'};
$result_trees{'table_in_code'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table_in_code'}{'contents'}[1]{'args'}[0];
$result_trees{'table_in_code'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table_in_code'}{'contents'}[1]{'args'}[0];
$result_trees{'table_in_code'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table_in_code'}{'contents'}[1]{'args'}[0];
$result_trees{'table_in_code'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table_in_code'}{'contents'}[1];
$result_trees{'table_in_code'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'table_in_code'}{'contents'}[1];
$result_trees{'table_in_code'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table_in_code'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'table_in_code'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table_in_code'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'table_in_code'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table_in_code'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'table_in_code'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table_in_code'}{'contents'}[1]{'contents'}[1];
$result_trees{'table_in_code'}{'contents'}[1]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'table_in_code'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'table_in_code'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'table_in_code'}{'contents'}[1];
$result_trees{'table_in_code'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'table_in_code'}{'contents'}[1]{'contents'}[2];
$result_trees{'table_in_code'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'table_in_code'}{'contents'}[1];
$result_trees{'table_in_code'}{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'table_in_code'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'table_in_code'}{'contents'}[1]{'parent'} = $result_trees{'table_in_code'};
$result_trees{'table_in_code'}{'contents'}[2]{'parent'} = $result_trees{'table_in_code'};
$result_trees{'table_in_code'}{'contents'}[3]{'parent'} = $result_trees{'table_in_code'};

$result_texis{'table_in_code'} = '@code{
in code
}@table @emph
@item line
text
@end table

';


$result_texts{'table_in_code'} = '
in code
line
text

';

$result_errors{'table_in_code'} = [
  {
    'error_line' => ':3: warning: @table should not appear in @code
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@table should not appear in @code',
    'type' => 'warning'
  },
  {
    'error_line' => ':3: @code missing close brace
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@code missing close brace',
    'type' => 'error'
  },
  {
    'error_line' => ':7: Misplaced }
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  }
];



$result_converted{'plaintext'}->{'table_in_code'} = '` in code \'
';

1;
