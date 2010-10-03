use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'sections'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'a chapter
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'chapter',
      'parent' => {}
    }
  ]
};
$result_trees{'sections'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sections'}{'contents'}[0]{'args'}[0];
$result_trees{'sections'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'sections'}{'contents'}[0];
$result_trees{'sections'}{'contents'}[0]{'parent'} = $result_trees{'sections'};

$result_texts{'sections'} = '@chapter a chapter
';

$result_errors{'sections'} = [];


