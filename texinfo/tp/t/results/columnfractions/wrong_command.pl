use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'wrong_command'} = {
  'contents' => [
    {
      'args' => [
        {
          'cmdname' => 'columnfractions',
          'parent' => {}
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '3.4'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'b',
          'parent' => {},
          'remaining_args' => 0
        },
        {
          'parent' => {},
          'text' => ' 
'
        }
      ],
      'cmdname' => 'multitable',
      'parent' => {},
      'special' => {
        'max_columns' => 0
      }
    }
  ]
};
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0]{'args'}[1]{'args'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[1]{'args'}[0]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0]{'args'}[1];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'parent'} = $result_trees{'wrong_command'};

$result_texts{'wrong_command'} = '@multitable @columnfractions @b{3.4}  
@end multitable
';

$result_errors{'wrong_command'} = [
  {
    'error_line' => ':1: @columnfractions accepts only fractions as argument
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@columnfractions accepts only fractions as argument',
    'type' => 'error'
  }
];


