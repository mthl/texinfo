use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'simple'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'a-_5b',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'the value @b{b} @c comment',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {}
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
          'parent' => {},
          'text' => 'the value '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'b'
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
          'text' => ' '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' comment After value.
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'simple'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'parent'} = $result_trees{'simple'};
$result_trees{'simple'}{'contents'}[1]{'parent'} = $result_trees{'simple'};
$result_trees{'simple'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[2];
$result_trees{'simple'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'simple'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[2]{'contents'}[1];
$result_trees{'simple'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[2];
$result_trees{'simple'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'simple'}{'contents'}[2];
$result_trees{'simple'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[2]{'contents'}[3];
$result_trees{'simple'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'simple'}{'contents'}[2];
$result_trees{'simple'}{'contents'}[2]{'parent'} = $result_trees{'simple'};

$result_texts{'simple'} = '@set a-_5b the value @b{b} @c comment

the value @b{b} @c comment After value.
';

$result_errors{'simple'} = [];


