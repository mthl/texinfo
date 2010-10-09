use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'empty_value_in_line'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'myspace',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '',
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
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '1 
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'parent' => {},
      'text' => ' 
',
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '1
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'empty_value_in_line'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_value_in_line'}{'contents'}[0];
$result_trees{'empty_value_in_line'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'empty_value_in_line'}{'contents'}[0];
$result_trees{'empty_value_in_line'}{'contents'}[0]{'parent'} = $result_trees{'empty_value_in_line'};
$result_trees{'empty_value_in_line'}{'contents'}[1]{'parent'} = $result_trees{'empty_value_in_line'};
$result_trees{'empty_value_in_line'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'empty_value_in_line'}{'contents'}[2];
$result_trees{'empty_value_in_line'}{'contents'}[2]{'parent'} = $result_trees{'empty_value_in_line'};
$result_trees{'empty_value_in_line'}{'contents'}[3]{'parent'} = $result_trees{'empty_value_in_line'};
$result_trees{'empty_value_in_line'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'empty_value_in_line'}{'contents'}[4];
$result_trees{'empty_value_in_line'}{'contents'}[4]{'parent'} = $result_trees{'empty_value_in_line'};

$result_texts{'empty_value_in_line'} = '@set myspace 

1 
 
1
';

$result_errors{'empty_value_in_line'} = [];


