use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'style_not_closed_in_table_line'} = {
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
                  'text' => 'first item'
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
          'parent' => {}
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'line
'
            },
            {
              'parent' => {},
              'text' => 'line '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in code '
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
                  'parent' => {},
                  'text' => 'in item'
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
          'parent' => {}
        }
      ],
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
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'args'}[0];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'args'}[0];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'args'}[0];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[2];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[2];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[2];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[2];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[3];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'style_not_closed_in_table_line'}{'contents'}[0];
$result_trees{'style_not_closed_in_table_line'}{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_in_table_line'};
$result_trees{'style_not_closed_in_table_line'}{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_in_table_line'};

$result_texis{'style_not_closed_in_table_line'} = '@table @asis
@item first item
line
line @code{in code }@item in item
@end table
';


$result_texts{'style_not_closed_in_table_line'} = 'first item
line
line in code in item
';

$result_errors{'style_not_closed_in_table_line'} = [
  {
    'error_line' => ':4: warning: @item should not appear in @code
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => '@item should not appear in @code',
    'type' => 'warning'
  },
  {
    'error_line' => ':4: @code missing close brace
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => '@code missing close brace',
    'type' => 'error'
  }
];


1;
