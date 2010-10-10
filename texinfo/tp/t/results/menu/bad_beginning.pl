use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'bad_beginning'} = {
  'contents' => [
    {
      'cmdname' => 'menu',
      'contents' => [
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
              'parent' => {},
              'remaining_args' => 0
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
    }
  ]
};
$result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[0];
$result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[0];
$result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[0];
$result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[0];
$result_trees{'bad_beginning'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_beginning'}{'contents'}[0];
$result_trees{'bad_beginning'}{'contents'}[0]{'parent'} = $result_trees{'bad_beginning'};

$result_texts{'bad_beginning'} = '@menu
*   
*
*something::
*@code{in code}::
@end menu
';

$result_errors{'bad_beginning'} = [];


