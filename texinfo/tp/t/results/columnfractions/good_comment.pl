use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'good_comment'} = {
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
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' comment
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
        }
      ],
      'cmdname' => 'multitable',
      'parent' => {}
    }
  ]
};
$result_trees{'good_comment'}{'contents'}[0]{'args'}[0]{'args'}[0]{'parent'} = $result_trees{'good_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'good_comment'}{'contents'}[0]{'args'}[0]{'args'}[1]{'parent'} = $result_trees{'good_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'good_comment'}{'contents'}[0]{'args'}[0]{'args'}[2]{'parent'} = $result_trees{'good_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'good_comment'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'good_comment'}{'contents'}[0];
$result_trees{'good_comment'}{'contents'}[0]{'args'}[1]{'args'}[0]{'parent'} = $result_trees{'good_comment'}{'contents'}[0]{'args'}[1];
$result_trees{'good_comment'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'good_comment'}{'contents'}[0];
$result_trees{'good_comment'}{'contents'}[0]{'parent'} = $result_trees{'good_comment'};

$result_texts{'good_comment'} = '@multitable @columnfractions 0.4 .6 5. @c comment
@end multitable
';

$result_errors{'good_comment'} = [];


