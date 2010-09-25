use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'good_space_comment'} = {
  'contents' => [
    {
      'args' => [
        {
          'args' => [
            {
              'parent' => {},
              'text' => '0',
              'type' => 'fraction'
            },
            {
              'parent' => {},
              'text' => '1',
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
              'text' => ' space comment
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
        }
      ],
      'cmdname' => 'multitable',
      'parent' => {},
      'special' => {
        'max_columns' => 2
      }
    }
  ]
};
$result_trees{'good_space_comment'}{'contents'}[0]{'args'}[0]{'args'}[0]{'parent'} = $result_trees{'good_space_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'good_space_comment'}{'contents'}[0]{'args'}[0]{'args'}[1]{'parent'} = $result_trees{'good_space_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'good_space_comment'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'good_space_comment'}{'contents'}[0];
$result_trees{'good_space_comment'}{'contents'}[0]{'args'}[1]{'args'}[0]{'parent'} = $result_trees{'good_space_comment'}{'contents'}[0]{'args'}[1];
$result_trees{'good_space_comment'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'good_space_comment'}{'contents'}[0];
$result_trees{'good_space_comment'}{'contents'}[0]{'parent'} = $result_trees{'good_space_comment'};

$result_texts{'good_space_comment'} = '@multitable @columnfractions 0 1 @c space comment
@end multitable
';

$result_errors{'good_space_comment'} = [];


