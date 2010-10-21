use vars qw(%result_texis %result_texts %result_trees %result_errors);

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


