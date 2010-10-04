use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'command_line_in_paragraph'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'documentlanguage on its line
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'en  
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'documentlanguage',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'line following documentlanguage
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'command_line_in_paragraph'}{'contents'}[0];
$result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[1];
$result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'command_line_in_paragraph'}{'contents'}[0];
$result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'command_line_in_paragraph'}{'contents'}[0];
$result_trees{'command_line_in_paragraph'}{'contents'}[0]{'parent'} = $result_trees{'command_line_in_paragraph'};

$result_texts{'command_line_in_paragraph'} = 'documentlanguage on its line
@documentlanguage en  
line following documentlanguage
';

$result_errors{'command_line_in_paragraph'} = [];


