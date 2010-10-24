use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'text'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'text'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'text'}{'contents'}[0];
$result_trees{'text'}{'contents'}[0]{'parent'} = $result_trees{'text'};

$result_texis{'text'} = 'text';


$result_texts{'text'} = 'text';

$result_errors{'text'} = [];


$result_indices{'text'} = undef;


1;
