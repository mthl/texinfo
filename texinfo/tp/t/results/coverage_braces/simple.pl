use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'simple'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'in  b'
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
          'text' => '.'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'simple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'parent'} = $result_trees{'simple'};

$result_texts{'simple'} = '@b{in  b}.';

$result_errors{'simple'} = [];


