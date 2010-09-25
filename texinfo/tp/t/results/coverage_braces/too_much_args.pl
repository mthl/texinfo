use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'too_much_args'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'AZE'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'A truc Z b, E eep'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'abbr',
          'parent' => {},
          'remaining_args' => 0
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'too_much_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'too_much_args'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'too_much_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'too_much_args'}{'contents'}[0]{'contents'}[0];
$result_trees{'too_much_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'too_much_args'}{'contents'}[0]{'contents'}[0]{'args'}[1];
$result_trees{'too_much_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'too_much_args'}{'contents'}[0]{'contents'}[0];
$result_trees{'too_much_args'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'too_much_args'}{'contents'}[0];
$result_trees{'too_much_args'}{'contents'}[0]{'parent'} = $result_trees{'too_much_args'};

$result_texts{'too_much_args'} = '@abbr{AZE, A truc Z b, E eep}';

$result_errors{'too_much_args'} = [];


