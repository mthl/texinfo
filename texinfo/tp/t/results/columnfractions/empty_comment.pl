use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'empty_comment'} = {
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
              'parent' => {},
              'text' => '
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
        }
      ],
      'cmdname' => 'multitable',
      'contents' => [],
      'parent' => {},
      'special' => {
        'max_columns' => 0
      }
    }
  ]
};
$result_trees{'empty_comment'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_comment'}{'contents'}[0];
$result_trees{'empty_comment'}{'contents'}[0]{'args'}[1]{'args'}[0]{'parent'} = $result_trees{'empty_comment'}{'contents'}[0]{'args'}[1];
$result_trees{'empty_comment'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'empty_comment'}{'contents'}[0];
$result_trees{'empty_comment'}{'contents'}[0]{'parent'} = $result_trees{'empty_comment'};

$result_texts{'empty_comment'} = '@multitable @columnfractions @c
@end multitable
';

$result_errors{'empty_comment'} = [
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


