use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'empty_ifset'} = {
  'contents' => [],
  'type' => 'text_root'
};

$result_texis{'empty_ifset'} = '';


$result_texts{'empty_ifset'} = '';

$result_errors{'empty_ifset'} = [
  {
    'error_line' => ':1: @ifset requires a name
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@ifset requires a name',
    'type' => 'error'
  }
];


1;
