use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'multiline'} = {
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
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => 'qdsqsddqsdsq
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'raw'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'verb',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0,
          'type' => '@'
        },
        {
          'parent' => {},
          'text' => 'after verb.'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'multiline'}{'contents'}[0]{'contents'}[0];
$result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multiline'}{'contents'}[0];
$result_trees{'multiline'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multiline'}{'contents'}[0];
$result_trees{'multiline'}{'contents'}[0]{'parent'} = $result_trees{'multiline'};

$result_texts{'multiline'} = '@verb{@
qdsqsddqsdsq

@}after verb.';

$result_errors{'multiline'} = [];


