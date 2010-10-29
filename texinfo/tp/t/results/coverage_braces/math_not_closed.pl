use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'math_not_closed'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '\\delta + 2'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'math',
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
$result_trees{'math_not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'math_not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'math_not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'math_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'math_not_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'math_not_closed'}{'contents'}[0];
$result_trees{'math_not_closed'}{'contents'}[0]{'parent'} = $result_trees{'math_not_closed'};

$result_texis{'math_not_closed'} = '@math{\\delta + 2}';


$result_texts{'math_not_closed'} = '\\delta + 2';

$result_errors{'math_not_closed'} = [
  {
    'error_line' => ':1: @math missing close brace
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@math missing close brace',
    'type' => 'error'
  }
];


1;
