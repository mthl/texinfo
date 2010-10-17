use vars qw(%result_texis %result_trees %result_errors);

$result_trees{'ifnot_format_conditional'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'not tex
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
      'type' => 'empty_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'After.'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'ifnot_format_conditional'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ifnot_format_conditional'}{'contents'}[0];
$result_trees{'ifnot_format_conditional'}{'contents'}[0]{'parent'} = $result_trees{'ifnot_format_conditional'};
$result_trees{'ifnot_format_conditional'}{'contents'}[1]{'parent'} = $result_trees{'ifnot_format_conditional'};
$result_trees{'ifnot_format_conditional'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'ifnot_format_conditional'}{'contents'}[2];
$result_trees{'ifnot_format_conditional'}{'contents'}[2]{'parent'} = $result_trees{'ifnot_format_conditional'};

$result_texis{'ifnot_format_conditional'} = 'not tex

After.';

$result_errors{'ifnot_format_conditional'} = [];


