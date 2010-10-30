use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'bad_beginning'} = {
  'contents' => [
    {
      'cmdname' => 'menu',
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
              'text' => '*   
'
            },
            {
              'parent' => {},
              'text' => '*
'
            },
            {
              'text' => '*something::
'
            },
            {
              'text' => '*'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in code'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '::
'
            }
          ],
          'parent' => {},
          'type' => 'menu_comment'
        }
      ],
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_beginning'}{'contents'}[0];
$result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[1];
$result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[1];
$result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[1]{'contents'}[4];
$result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[1];
$result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[1];
$result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'bad_beginning'}{'contents'}[0];
$result_trees{'bad_beginning'}{'contents'}[0]{'parent'} = $result_trees{'bad_beginning'};
$result_trees{'bad_beginning'}{'contents'}[1]{'parent'} = $result_trees{'bad_beginning'};

$result_texis{'bad_beginning'} = '@menu
*   
*
*something::
*@code{in code}::
@end menu';


$result_texts{'bad_beginning'} = '*   
*
*something::
*in code::
';

$result_errors{'bad_beginning'} = [
  {
    'error_line' => ':1: @menu seen before first @node
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@menu seen before first @node',
    'type' => 'error'
  },
  {
    'error_line' => ':1: perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?',
    'type' => 'error continuation'
  }
];


1;
