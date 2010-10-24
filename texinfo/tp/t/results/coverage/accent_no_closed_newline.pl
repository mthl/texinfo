use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'accent_no_closed_newline'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'e
'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => '~',
          'contents' => [],
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'accent_no_closed_newline'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'accent_no_closed_newline'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'accent_no_closed_newline'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'accent_no_closed_newline'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'accent_no_closed_newline'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'accent_no_closed_newline'}{'contents'}[0]{'contents'}[0];
$result_trees{'accent_no_closed_newline'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'accent_no_closed_newline'}{'contents'}[0];
$result_trees{'accent_no_closed_newline'}{'contents'}[0]{'parent'} = $result_trees{'accent_no_closed_newline'};

$result_texis{'accent_no_closed_newline'} = '@~{e

}';


$result_texts{'accent_no_closed_newline'} = 'e

~';

$result_errors{'accent_no_closed_newline'} = [
  {
    'error_line' => ':2: @~ missing close brace
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@~ missing close brace',
    'type' => 'error'
  }
];


$result_indices{'accent_no_closed_newline'} = undef;


1;
