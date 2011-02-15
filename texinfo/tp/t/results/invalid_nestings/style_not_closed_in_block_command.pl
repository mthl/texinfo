use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'style_not_closed_in_block_command'} = {
  'contents' => [
    {
      'cmdname' => 'cartouche',
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
              'text' => 'cartouche '
            },
            {
              'args' => [
                {
                  'contents' => [
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
        }
      ],
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
    }
  ],
  'type' => 'text_root'
};
$result_trees{'style_not_closed_in_block_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_in_block_command'}{'contents'}[0];
$result_trees{'style_not_closed_in_block_command'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_in_block_command'}{'contents'}[0]{'contents'}[1];
$result_trees{'style_not_closed_in_block_command'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_in_block_command'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'style_not_closed_in_block_command'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'style_not_closed_in_block_command'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'style_not_closed_in_block_command'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_in_block_command'}{'contents'}[0]{'contents'}[1];
$result_trees{'style_not_closed_in_block_command'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_in_block_command'}{'contents'}[0];
$result_trees{'style_not_closed_in_block_command'}{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_in_block_command'};
$result_trees{'style_not_closed_in_block_command'}{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_in_block_command'};

$result_texis{'style_not_closed_in_block_command'} = '@cartouche
cartouche @code{in code 
}@end cartouche
';


$result_texts{'style_not_closed_in_block_command'} = 'cartouche in code 
';

$result_errors{'style_not_closed_in_block_command'} = [
  {
    'error_line' => ':3: warning: @end should not appear in @code
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@end should not appear in @code',
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
  }
];


1;
