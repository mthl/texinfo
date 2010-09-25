use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'nested_macros'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'truc',
          'type' => 'macro_arg_name'
        },
        {
          'parent' => {},
          'text' => '{ arg,  ex}',
          'type' => 'macro_arg_args'
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
          'args' => [
            {
              'parent' => {},
              'text' => 'othermacro',
              'type' => 'macro_arg_name'
            },
            {
              'parent' => {},
              'text' => '',
              'type' => 'macro_arg_args'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'other macro
',
              'type' => 'raw'
            }
          ],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '@macro
',
          'type' => 'raw'
        }
      ],
      'parent' => {}
    }
  ]
};
$result_trees{'nested_macros'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested_macros'}{'contents'}[0];
$result_trees{'nested_macros'}{'contents'}[0]{'parent'} = $result_trees{'nested_macros'};

$result_texts{'nested_macros'} = '@macro truc { arg,  ex}
in macro \arg\
@macro othermacro 
other macro
@end macro
@macro
@end macro
';

$result_errors{'nested_macros'} = [];


