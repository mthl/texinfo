use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'nested_macros'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'truc',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'arg',
          'type' => 'macro_arg'
        },
        {
          'parent' => {},
          'text' => 'ex',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in macro \\arg\\
',
          'type' => 'raw'
        },
        {
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'other macro
',
              'type' => 'raw'
            }
          ],
          'extra' => {
            'arg_line' => ' othermacro 
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
          'cmdname' => 'macro',
          'contents' => [],
          'extra' => {
            'arg_line' => '
'
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        }
      ],
      'extra' => {
        'arg_line' => ' truc   { arg,  ex}
',
        'args_index' => {
          'arg' => 0,
          'ex' => 1
        },
        'macrobody' => 'in macro \\arg\\
@macro othermacro 
other macro
@end macro
@macro
@end macro
'
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'nested_macros'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'parent'} = $result_trees{'nested_macros'};
$result_trees{'nested_macros'}{'contents'}[1]{'parent'} = $result_trees{'nested_macros'};

$result_texis{'nested_macros'} = '@macro truc   { arg,  ex}
in macro \\arg\\
@macro othermacro 
other macro
@end macro
@macro
@end macro
@end macro
';


$result_texts{'nested_macros'} = '';

$result_errors{'nested_macros'} = [];


$result_indices{'nested_macros'} = undef;


1;
