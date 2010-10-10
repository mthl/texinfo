use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'text_space_comment'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => ' '
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text  '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' space comment',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'text_space_comment'}{'contents'}[0]{'parent'} = $result_trees{'text_space_comment'};
$result_trees{'text_space_comment'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'text_space_comment'}{'contents'}[1];
$result_trees{'text_space_comment'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'text_space_comment'}{'contents'}[1]{'contents'}[1];
$result_trees{'text_space_comment'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'text_space_comment'}{'contents'}[1];
$result_trees{'text_space_comment'}{'contents'}[1]{'parent'} = $result_trees{'text_space_comment'};

$result_texts{'text_space_comment'} = ' text  @c space comment';

$result_errors{'text_space_comment'} = [];


