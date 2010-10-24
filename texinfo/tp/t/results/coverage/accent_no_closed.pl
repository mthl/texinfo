use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'accent_no_closed'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'e'
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
$result_trees{'accent_no_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'accent_no_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'accent_no_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'accent_no_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'accent_no_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'accent_no_closed'}{'contents'}[0];
$result_trees{'accent_no_closed'}{'contents'}[0]{'parent'} = $result_trees{'accent_no_closed'};

$result_texis{'accent_no_closed'} = '@~{e}';


$result_texts{'accent_no_closed'} = 'e~';

$result_errors{'accent_no_closed'} = [
  {
    'error_line' => ':1: @~ missing close brace
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@~ missing close brace',
    'type' => 'error'
  }
];


$result_indices{'accent_no_closed'} = undef;


1;
