use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'text_comment'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' comment',
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
  ],
  'type' => 'text_root'
};
$result_trees{'text_comment'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'text_comment'}{'contents'}[0];
$result_trees{'text_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'text_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'text_comment'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'text_comment'}{'contents'}[0];
$result_trees{'text_comment'}{'contents'}[0]{'parent'} = $result_trees{'text_comment'};

$result_texis{'text_comment'} = 'text@c comment';


$result_texts{'text_comment'} = 'text';

$result_errors{'text_comment'} = [];


$result_indices{'text_comment'} = undef;


1;
