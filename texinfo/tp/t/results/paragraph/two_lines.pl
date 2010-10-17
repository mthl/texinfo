use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'two_lines'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text l 1
'
        },
        {
          'parent' => {},
          'text' => 'text l 2
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'two_lines'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'two_lines'}{'contents'}[0];
$result_trees{'two_lines'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'two_lines'}{'contents'}[0];
$result_trees{'two_lines'}{'contents'}[0]{'parent'} = $result_trees{'two_lines'};

$result_texis{'two_lines'} = 'text l 1
text l 2
';

$result_errors{'two_lines'} = [];


