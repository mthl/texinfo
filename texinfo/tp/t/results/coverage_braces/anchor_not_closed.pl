use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'anchor_not_closed'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'my anchor
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
          'cmdname' => 'anchor',
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
$result_trees{'anchor_not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'anchor_not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'anchor_not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'anchor_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'anchor_not_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_not_closed'}{'contents'}[0];
$result_trees{'anchor_not_closed'}{'contents'}[0]{'parent'} = $result_trees{'anchor_not_closed'};

$result_texis{'anchor_not_closed'} = '@anchor{my anchor

}';


$result_texts{'anchor_not_closed'} = '';

$result_errors{'anchor_not_closed'} = [
  {
    'error_line' => ':2: @anchor missing close brace
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@anchor missing close brace',
    'type' => 'error'
  }
];


1;
