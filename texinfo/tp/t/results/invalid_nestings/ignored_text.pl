use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'ignored_text'} = {
  'contents' => [
    {
      'contents' => [],
      'type' => 'text_root'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'before ignore '
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'node',
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {},
      'remaining_args' => 3
    }
  ],
  'type' => 'document_root'
};
$result_trees{'ignored_text'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ignored_text'}{'contents'}[1]{'args'}[0];
$result_trees{'ignored_text'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ignored_text'}{'contents'}[1]{'args'}[0];
$result_trees{'ignored_text'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ignored_text'}{'contents'}[1];
$result_trees{'ignored_text'}{'contents'}[1]{'parent'} = $result_trees{'ignored_text'};

$result_texis{'ignored_text'} = '@node before ignore ';


$result_texts{'ignored_text'} = '';

$result_sectioning{'ignored_text'} = {
  'text' => '_ROOT'
};
$result_errors{'ignored_text'} = [
  {
    'error_line' => ':1: warning: @ifinfo should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@ifinfo should only appear at a line beginning',
    'type' => 'warning'
  }
];


1;
