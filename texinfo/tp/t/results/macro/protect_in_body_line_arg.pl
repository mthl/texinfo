use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'protect_in_body_line_arg'} = {
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
        'args_index' => {
          'arg1' => 0,
          'arg2' => 1
        },
        'macro_line' => ' macro1 { arg1 , arg2 }
',
        'macrobody' => 'result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}
'
      }
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
          'text' => 'result: '
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
          'parent' => {},
          'remaining_args' => 0
        },
        {
          'parent' => {},
          'text' => ', second arg
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'protect_in_body_line_arg'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'protect_in_body_line_arg'}{'contents'}[0];
$result_trees{'protect_in_body_line_arg'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'protect_in_body_line_arg'}{'contents'}[0];
$result_trees{'protect_in_body_line_arg'}{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'protect_in_body_line_arg'}{'contents'}[0];
$result_trees{'protect_in_body_line_arg'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_line_arg'}{'contents'}[0];
$result_trees{'protect_in_body_line_arg'}{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_line_arg'};
$result_trees{'protect_in_body_line_arg'}{'contents'}[1]{'parent'} = $result_trees{'protect_in_body_line_arg'};
$result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_line_arg'}{'contents'}[2];
$result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'contents'}[1];
$result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'protect_in_body_line_arg'}{'contents'}[2];
$result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'protect_in_body_line_arg'}{'contents'}[2];
$result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'contents'}[3];
$result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'protect_in_body_line_arg'}{'contents'}[2];
$result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'protect_in_body_line_arg'}{'contents'}[2];
$result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'contents'}[5]{'args'}[0];
$result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'contents'}[5];
$result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'protect_in_body_line_arg'}{'contents'}[2];
$result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'contents'}[6]{'parent'} = $result_trees{'protect_in_body_line_arg'}{'contents'}[2];
$result_trees{'protect_in_body_line_arg'}{'contents'}[2]{'parent'} = $result_trees{'protect_in_body_line_arg'};

$result_texts{'protect_in_body_line_arg'} = '@macro macro1 { arg1 , arg2 }
result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}
@end macro

result: @emph{} protected \\ -> \\arg1\\ @emph{} @samp{f\\irst arg}, second arg
';

$result_errors{'protect_in_body_line_arg'} = [
  {
    'error_line' => ':5: warning: @macro1 defined with zero or more than one argument should be invoked with {}
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@macro1 defined with zero or more than one argument should be invoked with {}',
    'type' => 'warning'
  }
];


