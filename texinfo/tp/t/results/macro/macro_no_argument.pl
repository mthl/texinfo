use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'macro_no_argument'} = {
  'contents' => [
    {
      'cmdname' => 'macro',
      'contents' => [],
      'parent' => {},
      'special' => {
        'arg_line' => ''
      }
    }
  ],
  'type' => 'text_root'
};
$result_trees{'macro_no_argument'}{'contents'}[0]{'parent'} = $result_trees{'macro_no_argument'};

$result_texis{'macro_no_argument'} = '@macro@end macro';


$result_texts{'macro_no_argument'} = '';

$result_errors{'macro_no_argument'} = [
  {
    'error_line' => ':1: @macro requires a name
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@macro requires a name',
    'type' => 'error'
  },
  {
    'error_line' => ':1: No matching `@end macro\'
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'No matching `@end macro\'',
    'type' => 'error'
  }
];


$result_indices{'macro_no_argument'} = undef;


1;
