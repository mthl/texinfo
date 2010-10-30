use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'invalid_command_and_brace_in_table'} = {
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
          'contents' => [
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ',, title
'
                },
                {
                  'parent' => {},
                  'text' => 'long title
'
                },
                {
                  'parent' => {},
                  'text' => 'Item line
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {},
          'type' => 'before_item'
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
$result_trees{'invalid_command_and_brace_in_table'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'invalid_command_and_brace_in_table'}{'contents'}[0];
$result_trees{'invalid_command_and_brace_in_table'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'invalid_command_and_brace_in_table'}{'contents'}[0]{'contents'}[1];
$result_trees{'invalid_command_and_brace_in_table'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'invalid_command_and_brace_in_table'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'invalid_command_and_brace_in_table'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'invalid_command_and_brace_in_table'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'invalid_command_and_brace_in_table'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'invalid_command_and_brace_in_table'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'invalid_command_and_brace_in_table'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'invalid_command_and_brace_in_table'}{'contents'}[0]{'contents'}[1];
$result_trees{'invalid_command_and_brace_in_table'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'invalid_command_and_brace_in_table'}{'contents'}[0];
$result_trees{'invalid_command_and_brace_in_table'}{'contents'}[0]{'parent'} = $result_trees{'invalid_command_and_brace_in_table'};
$result_trees{'invalid_command_and_brace_in_table'}{'contents'}[1]{'parent'} = $result_trees{'invalid_command_and_brace_in_table'};

$result_texis{'invalid_command_and_brace_in_table'} = '@table
 ,, title
long title
Item line
@end table
';


$result_texts{'invalid_command_and_brace_in_table'} = ' ,, title
long title
Item line
';

$result_errors{'invalid_command_and_brace_in_table'} = [
  {
    'error_line' => ':2: Misplaced {
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Misplaced {',
    'type' => 'error'
  },
  {
    'error_line' => ':2: Unknown command `itemTop\'
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Unknown command `itemTop\'',
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
  }
];


1;
