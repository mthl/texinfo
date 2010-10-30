use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices %result_sectioning %result_nodes);

$result_trees{'include_with_setfilename'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'In included file.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'include_with_setfilename'}{'contents'}[0]{'parent'} = $result_trees{'include_with_setfilename'};
$result_trees{'include_with_setfilename'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'include_with_setfilename'}{'contents'}[1];
$result_trees{'include_with_setfilename'}{'contents'}[1]{'parent'} = $result_trees{'include_with_setfilename'};

$result_texis{'include_with_setfilename'} = '
In included file.
';


$result_texts{'include_with_setfilename'} = '
In included file.
';

$result_errors{'include_with_setfilename'} = [];


1;
