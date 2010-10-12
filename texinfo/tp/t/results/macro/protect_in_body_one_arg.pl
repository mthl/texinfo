use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'protect_in_body_one_arg'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'macro1',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'arg1',
          'type' => 'macro_arg'
        },
        {
          'parent' => {},
          'text' => 'arg2',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' macro1 { arg1 , arg2 }
',
        'args_index' => {
          'arg1' => 0,
          'arg2' => 1
        },
        'macrobody' => 'result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'result: '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'f\\irst arg'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'samp',
                  'contents' => [],
                  'parent' => {},
                  'remaining_args' => 0
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'emph',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0
        },
        {
          'parent' => {},
          'text' => ' protected \\ -> \\arg1\\ '
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'emph',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0
        },
        {
          'parent' => {},
          'text' => '
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'};
$result_trees{'protect_in_body_one_arg'}{'contents'}[1]{'parent'} = $result_trees{'protect_in_body_one_arg'};
$result_trees{'protect_in_body_one_arg'}{'contents'}[2]{'parent'} = $result_trees{'protect_in_body_one_arg'};
$result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[3];
$result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'contents'}[1];
$result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[3];
$result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[3];
$result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'contents'}[3];
$result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'contents'}[3]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[3];
$result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'contents'}[4]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[3];
$result_trees{'protect_in_body_one_arg'}{'contents'}[3]{'parent'} = $result_trees{'protect_in_body_one_arg'};

$result_texts{'protect_in_body_one_arg'} = '@macro macro1 { arg1 , arg2 }
result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}
@end macro

result: @emph{@samp{f\\irst arg}} protected \\ -> \\arg1\\ @emph{}
';

$result_errors{'protect_in_body_one_arg'} = [];


