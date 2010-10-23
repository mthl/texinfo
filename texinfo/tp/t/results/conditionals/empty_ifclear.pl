use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'empty_ifclear'} = {
  'contents' => [],
  'type' => 'text_root'
};

$result_texis{'empty_ifclear'} = '';


$result_texts{'empty_ifclear'} = '';

$result_errors{'empty_ifclear'} = [
  {
    'error_line' => ':1: @ifclear requires a name
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@ifclear requires a name',
    'type' => 'error'
  }
];


