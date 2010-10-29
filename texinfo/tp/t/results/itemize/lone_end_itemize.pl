use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'lone_end_itemize'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'lone_end_itemize'}{'contents'}[0]{'parent'} = $result_trees{'lone_end_itemize'};

$result_texis{'lone_end_itemize'} = '
';


$result_texts{'lone_end_itemize'} = '';

$result_errors{'lone_end_itemize'} = [
  {
    'error_line' => ':1: Unmatched `@end itemize\'
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Unmatched `@end itemize\'',
    'type' => 'error'
  }
];


1;
