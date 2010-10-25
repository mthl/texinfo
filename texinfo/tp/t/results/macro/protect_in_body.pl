use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'protect_in_body'} = {
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
      'extra' => {
        'arg_line' => ' macro1 { arg1 , arg2 }
',
        'args_index' => {
          'arg1' => 0,
          'arg2' => 1
        },
        'macrobody' => 'result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}
'
      },
      'parent' => {}
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
          'text' => 'the result: '
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
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'emph',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' protected \\ -> \\arg1\\ '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'second arg '
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'emph',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' after macro.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'protect_in_body'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'protect_in_body'}{'contents'}[0];
$result_trees{'protect_in_body'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'protect_in_body'}{'contents'}[0];
$result_trees{'protect_in_body'}{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'protect_in_body'}{'contents'}[0];
$result_trees{'protect_in_body'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body'}{'contents'}[0];
$result_trees{'protect_in_body'}{'contents'}[0]{'parent'} = $result_trees{'protect_in_body'};
$result_trees{'protect_in_body'}{'contents'}[1]{'parent'} = $result_trees{'protect_in_body'};
$result_trees{'protect_in_body'}{'contents'}[2]{'parent'} = $result_trees{'protect_in_body'};
$result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body'}{'contents'}[3];
$result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[1];
$result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'protect_in_body'}{'contents'}[3];
$result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'protect_in_body'}{'contents'}[3];
$result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[3]{'args'}[0];
$result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[3];
$result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[3]{'parent'} = $result_trees{'protect_in_body'}{'contents'}[3];
$result_trees{'protect_in_body'}{'contents'}[3]{'contents'}[4]{'parent'} = $result_trees{'protect_in_body'}{'contents'}[3];
$result_trees{'protect_in_body'}{'contents'}[3]{'parent'} = $result_trees{'protect_in_body'};

$result_texis{'protect_in_body'} = '@macro macro1 { arg1 , arg2 }
result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}
@end macro

the result: @emph{@samp{f\\irst arg}} protected \\ -> \\arg1\\ @emph{second arg } after macro.
';


$result_texts{'protect_in_body'} = '
the result: f\\irst arg protected \\ -> \\arg1\\ second arg  after macro.
';

$result_errors{'protect_in_body'} = [];


$result_indices{'protect_in_body'} = undef;


1;
