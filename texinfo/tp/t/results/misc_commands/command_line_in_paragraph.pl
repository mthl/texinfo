use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

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
                  'text' => '  ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'en'
                },
                {
                  'parent' => {},
                  'text' => '  
',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'documentlanguage',
          'parent' => {},
          'special' => {
            'text_arg' => 'en'
          }
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
  ],
  'type' => 'text_root'
};
$result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'command_line_in_paragraph'}{'contents'}[0];
$result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[1];
$result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'command_line_in_paragraph'}{'contents'}[0];
$result_trees{'command_line_in_paragraph'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'command_line_in_paragraph'}{'contents'}[0];
$result_trees{'command_line_in_paragraph'}{'contents'}[0]{'parent'} = $result_trees{'command_line_in_paragraph'};

$result_texis{'command_line_in_paragraph'} = 'documentlanguage on its line
@documentlanguage  en  
line following documentlanguage
';


$result_texts{'command_line_in_paragraph'} = 'documentlanguage on its line
line following documentlanguage
';

$result_errors{'command_line_in_paragraph'} = [];


$result_indices{'command_line_in_paragraph'} = undef;


1;
