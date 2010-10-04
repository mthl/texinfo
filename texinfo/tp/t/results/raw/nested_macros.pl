use vars qw(%result_texts %result_trees %result_errors);

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
          'parent' => {},
          'special' => {
            'macro_line' => ' othermacro 
'
          }
        },
        {
          'cmdname' => 'macro',
          'contents' => [],
          'parent' => {},
          'special' => {
            'macro_line' => '
'
          }
        }
      ],
      'parent' => {},
      'special' => {
        'args_index' => {
          'arg' => 0,
          'ex' => 1
        },
        'macro_line' => ' truc   { arg,  ex}
',
        'macrobody' => 'in macro \\arg\\
@macro othermacro 
other macro
@end macro
@macro
@end macro
'
      }
    }
  ]
};
$result_trees{'nested_macros'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'parent'} = $result_trees{'nested_macros'};

$result_texts{'nested_macros'} = '@macro truc   { arg,  ex}
in macro \\arg\\
@macro othermacro 
other macro
@end macro
@macro
@end macro
@end macro
';

$result_errors{'nested_macros'} = [];


