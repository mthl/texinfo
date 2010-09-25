use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'good'} = {
  'contents' => [
    {
      'args' => [
        {
          'args' => [
            {
              'parent' => {},
              'text' => '0.4',
              'type' => 'fraction'
            },
            {
              'parent' => {},
              'text' => '.6',
              'type' => 'fraction'
            },
            {
              'parent' => {},
              'text' => '5.',
              'type' => 'fraction'
            }
          ],
          'cmdname' => 'columnfractions',
          'parent' => {}
        }
      ],
      'cmdname' => 'multitable',
      'parent' => {}
    }
  ]
};
$result_trees{'good'}{'contents'}[0]{'args'}[0]{'args'}[0]{'parent'} = $result_trees{'good'}{'contents'}[0]{'args'}[0];
$result_trees{'good'}{'contents'}[0]{'args'}[0]{'args'}[1]{'parent'} = $result_trees{'good'}{'contents'}[0]{'args'}[0];
$result_trees{'good'}{'contents'}[0]{'args'}[0]{'args'}[2]{'parent'} = $result_trees{'good'}{'contents'}[0]{'args'}[0];
$result_trees{'good'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'good'}{'contents'}[0];
$result_trees{'good'}{'contents'}[0]{'parent'} = $result_trees{'good'};

$result_texts{'good'} = '@multitable @columnfractions 0.4 .6 5.
@end multitable
';

$result_errors{'good'} = [];


