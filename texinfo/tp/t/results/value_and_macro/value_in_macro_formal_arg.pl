use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

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
      'extra' => {
        'arg_line' => ' argument arg 
'
      },
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
      'extra' => {
        'arg_line' => ' testvalue { arg , the@value{argument} }
',
        'args_index' => {
          'arg' => 0,
          'the@value{argument' => 1
        },
        'macrobody' => 'result: @emph{\\arg\\} the \\the\\ thearg \\thearg\\ with value \\the@value{argument}\\
'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 3,
        'macro' => ''
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
          'parent' => {}
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
  ],
  'type' => 'text_root'
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
$result_trees{'value_in_macro_formal_arg'}{'contents'}[4]{'parent'} = $result_trees{'value_in_macro_formal_arg'};
$result_trees{'value_in_macro_formal_arg'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[5];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[5]{'contents'}[1];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[5];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'value_in_macro_formal_arg'}{'contents'}[5];
$result_trees{'value_in_macro_formal_arg'}{'contents'}[5]{'parent'} = $result_trees{'value_in_macro_formal_arg'};

$result_texis{'value_in_macro_formal_arg'} = '@set argument arg 

@macro testvalue { arg , the@value{argument} }
result: @emph{\\arg\\} the \\the\\ thearg \\thearg\\ with value \\the@value{argument}\\
@end macro

result: @emph{macro_arg1} the \\the thearg \\thearg with value \\thearg
';


$result_texts{'value_in_macro_formal_arg'} = '

result: macro_arg1 the \\the thearg \\thearg with value \\thearg
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


1;
