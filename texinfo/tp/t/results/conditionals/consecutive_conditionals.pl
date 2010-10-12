use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'consecutive_conditionals'} = {
  'contents' => [
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
          'text' => 'b',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' b
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    }
  ]
};
$result_trees{'consecutive_conditionals'}{'contents'}[0]{'parent'} = $result_trees{'consecutive_conditionals'};
$result_trees{'consecutive_conditionals'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'consecutive_conditionals'}{'contents'}[1];
$result_trees{'consecutive_conditionals'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'consecutive_conditionals'}{'contents'}[1];
$result_trees{'consecutive_conditionals'}{'contents'}[1]{'parent'} = $result_trees{'consecutive_conditionals'};
$result_trees{'consecutive_conditionals'}{'contents'}[2]{'parent'} = $result_trees{'consecutive_conditionals'};

$result_texts{'consecutive_conditionals'} = '
@set b

';

$result_errors{'consecutive_conditionals'} = [];


