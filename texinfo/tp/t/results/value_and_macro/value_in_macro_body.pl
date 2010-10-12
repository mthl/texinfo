use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'value_in_macro_body'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'bodyarg',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '\\arg\\',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' bodyarg \\arg\\ 
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'testvaluebody',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'arg',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'result: @emph{\\@value{bodyarg}\\  }
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' testvaluebody { arg }
',
        'args_index' => {
          'arg' => 0
        },
        'macrobody' => 'result: @emph{\\@value{bodyarg}\\  }
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
                  'parent' => {},
                  'text' => '\\\\arg\\  '
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
          'text' => '
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'value_in_macro_body'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_macro_body'}{'contents'}[0];
$result_trees{'value_in_macro_body'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'value_in_macro_body'}{'contents'}[0];
$result_trees{'value_in_macro_body'}{'contents'}[0]{'parent'} = $result_trees{'value_in_macro_body'};
$result_trees{'value_in_macro_body'}{'contents'}[1]{'parent'} = $result_trees{'value_in_macro_body'};
$result_trees{'value_in_macro_body'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'value_in_macro_body'}{'contents'}[2];
$result_trees{'value_in_macro_body'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'value_in_macro_body'}{'contents'}[2];
$result_trees{'value_in_macro_body'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'value_in_macro_body'}{'contents'}[2];
$result_trees{'value_in_macro_body'}{'contents'}[2]{'parent'} = $result_trees{'value_in_macro_body'};
$result_trees{'value_in_macro_body'}{'contents'}[3]{'parent'} = $result_trees{'value_in_macro_body'};
$result_trees{'value_in_macro_body'}{'contents'}[4]{'parent'} = $result_trees{'value_in_macro_body'};
$result_trees{'value_in_macro_body'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'value_in_macro_body'}{'contents'}[5];
$result_trees{'value_in_macro_body'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_macro_body'}{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_macro_body'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_macro_body'}{'contents'}[5]{'contents'}[1];
$result_trees{'value_in_macro_body'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'value_in_macro_body'}{'contents'}[5];
$result_trees{'value_in_macro_body'}{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'value_in_macro_body'}{'contents'}[5];
$result_trees{'value_in_macro_body'}{'contents'}[5]{'parent'} = $result_trees{'value_in_macro_body'};

$result_texts{'value_in_macro_body'} = '@set bodyarg \\arg\\ 

@macro testvaluebody { arg }
result: @emph{\\@value{bodyarg}\\  }
@end macro

result: @emph{\\\\arg\\  }
';

$result_errors{'value_in_macro_body'} = [
  {
    'error_line' => ':7: \\ in macro expansion followed `@value{bodyarg}\' instead of parameter name or \\
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => '\\ in macro expansion followed `@value{bodyarg}\' instead of parameter name or \\',
    'type' => 'error'
  }
];


