use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'paragraph_command'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'aaa'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'b',
          'parent' => {},
          'remaining_args' => 0
        },
        {
          'parent' => {},
          'text' => '.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'paragraph_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[0];
$result_trees{'paragraph_command'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[0];
$result_trees{'paragraph_command'}{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'};
$result_trees{'paragraph_command'}{'contents'}[1]{'parent'} = $result_trees{'paragraph_command'};
$result_trees{'paragraph_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[2]{'contents'}[0];
$result_trees{'paragraph_command'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[2];
$result_trees{'paragraph_command'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[2];
$result_trees{'paragraph_command'}{'contents'}[2]{'parent'} = $result_trees{'paragraph_command'};

$result_texts{'paragraph_command'} = '@@

@b{aaa}.
';

$result_errors{'paragraph_command'} = [];


