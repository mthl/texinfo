use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'value_in_macro_formal_arg'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'argument',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'arg',
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
      'type' => 'empty_line'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'testvalue',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'arg',
          'type' => 'macro_arg'
        },
        {
          'parent' => {},
          'text' => 'the@value{argument',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'result: @emph{\\arg\\} the \\the\\ thearg \\thearg\\ with value \\the@value{argument}\\
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'args_index' => {
          'arg' => 0,
          'the@value{argument' => 1
        },
        'macro_line' => ' testvalue { arg , the@value{argument} }
',
        'macrobody' => 'result: @emph{\\arg\\} the \\the\\ thearg \\thearg\\ with value \\the@value{argument}\\
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
                  'text' => 'macro_arg1'
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
          'text' => ' the \\the thearg \\thearg with value \\thearg
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'value_in_macro_formal_arg'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[0];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[0];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[0]{'parent'} = $result_trees{'value_in_macro_formal_arg'};
$result_trees{'value_in_macro_formal_arg'}{'contents'}[1]{'parent'} = $result_trees{'value_in_macro_formal_arg'};
$result_trees{'value_in_macro_formal_arg'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[2];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[2];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[2];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[2];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[2]{'parent'} = $result_trees{'value_in_macro_formal_arg'};
$result_trees{'value_in_macro_formal_arg'}{'contents'}[3]{'parent'} = $result_trees{'value_in_macro_formal_arg'};
$result_trees{'value_in_macro_formal_arg'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[4];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[4]{'contents'}[1];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[4];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[4];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[4]{'parent'} = $result_trees{'value_in_macro_formal_arg'};

$result_texts{'value_in_macro_formal_arg'} = '@set argument arg

@macro testvalue { arg , the@value{argument} }
result: @emph{\\arg\\} the \\the\\ thearg \\thearg\\ with value \\the@value{argument}\\
@end macro

result: @emph{macro_arg1} the \\the thearg \\thearg with value \\thearg
';

$result_errors{'value_in_macro_formal_arg'} = [
  {
    'error_line' => ':3: Bad syntax for @macro
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'Bad syntax for @macro',
    'type' => 'error'
  },
  {
    'error_line' => ':3: Bad or empty @macro formal argument: the@value{argument
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'Bad or empty @macro formal argument: the@value{argument',
    'type' => 'error'
  },
  {
    'error_line' => ':7: \\ in macro expansion followed `the\' instead of parameter name or \\
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => '\\ in macro expansion followed `the\' instead of parameter name or \\',
    'type' => 'error'
  },
  {
    'error_line' => ':7: \\ in macro expansion followed `thearg\' instead of parameter name or \\
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => '\\ in macro expansion followed `thearg\' instead of parameter name or \\',
    'type' => 'error'
  },
  {
    'error_line' => ':7: \\ in macro expansion followed `the@value{argument}\' instead of parameter name or \\
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => '\\ in macro expansion followed `the@value{argument}\' instead of parameter name or \\',
    'type' => 'error'
  }
];


