use vars qw(%result_texis %result_trees %result_errors);

$result_trees{'sections'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
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
$result_trees{'sections'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'sections'}{'contents'}[0]{'args'}[0];
$result_trees{'sections'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'sections'}{'contents'}[0];
$result_trees{'sections'}{'contents'}[0]{'parent'} = $result_trees{'sections'};

$result_texis{'sections'} = '@chapter a chapter
';

$result_errors{'sections'} = [];


