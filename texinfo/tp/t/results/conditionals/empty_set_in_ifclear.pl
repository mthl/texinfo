use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'empty_set_in_ifclear'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'a',
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
        'arg_line' => ' a
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
$result_trees{'empty_set_in_ifclear'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_set_in_ifclear'}{'contents'}[0];
$result_trees{'empty_set_in_ifclear'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'empty_set_in_ifclear'}{'contents'}[0];
$result_trees{'empty_set_in_ifclear'}{'contents'}[0]{'parent'} = $result_trees{'empty_set_in_ifclear'};
$result_trees{'empty_set_in_ifclear'}{'contents'}[1]{'parent'} = $result_trees{'empty_set_in_ifclear'};

$result_texts{'empty_set_in_ifclear'} = '@set a

';

$result_errors{'empty_set_in_ifclear'} = [];


