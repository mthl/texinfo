use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'zero_argument'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'foo',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in foo
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'macro_line' => ' foo {}
',
        'macrobody' => 'in foo
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'bar',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in bar
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'macro_line' => ' bar
',
        'macrobody' => 'in bar
'
      }
    }
  ]
};
$result_trees{'zero_argument'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'zero_argument'}{'contents'}[0];
$result_trees{'zero_argument'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'zero_argument'}{'contents'}[0];
$result_trees{'zero_argument'}{'contents'}[0]{'parent'} = $result_trees{'zero_argument'};
$result_trees{'zero_argument'}{'contents'}[1]{'parent'} = $result_trees{'zero_argument'};
$result_trees{'zero_argument'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'zero_argument'}{'contents'}[2];
$result_trees{'zero_argument'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'zero_argument'}{'contents'}[2];
$result_trees{'zero_argument'}{'contents'}[2]{'parent'} = $result_trees{'zero_argument'};

$result_texts{'zero_argument'} = '@macro foo {}
in foo
@end macro

@macro bar
in bar
@end macro
';

$result_errors{'zero_argument'} = [];


