use vars qw(%result_texis %result_trees %result_errors);

$result_trees{'nested'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'type the characters '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'l o g o u t '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'RET'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'key',
                  'contents' => [],
                  'parent' => {},
                  'remaining_args' => 0
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'kbd',
          'contents' => [],
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
$result_trees{'nested'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested'}{'contents'}[0];
$result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested'}{'contents'}[0];
$result_trees{'nested'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested'}{'contents'}[0];
$result_trees{'nested'}{'contents'}[0]{'parent'} = $result_trees{'nested'};

$result_texis{'nested'} = 'type the characters @kbd{l o g o u t @key{RET}}.';

$result_errors{'nested'} = [];


