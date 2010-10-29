use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'brace_opened_no_command'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'anchortruc'
        },
        {
          'cmdname' => '}',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'truc'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'anchor',
          'contents' => [],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          },
          'parent' => {},
          'special' => {
            'node_content' => [
              {}
            ],
            'normalized' => 'truc'
          }
        },
        {
          'parent' => {},
          'text' => '.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'brace_opened_no_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'brace_opened_no_command'}{'contents'}[0];
$result_trees{'brace_opened_no_command'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'brace_opened_no_command'}{'contents'}[0];
$result_trees{'brace_opened_no_command'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'brace_opened_no_command'}{'contents'}[0];
$result_trees{'brace_opened_no_command'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'brace_opened_no_command'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'brace_opened_no_command'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'brace_opened_no_command'}{'contents'}[0]{'contents'}[3];
$result_trees{'brace_opened_no_command'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'brace_opened_no_command'}{'contents'}[0];
$result_trees{'brace_opened_no_command'}{'contents'}[0]{'contents'}[3]{'special'}{'node_content'}[0] = $result_trees{'brace_opened_no_command'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'brace_opened_no_command'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'brace_opened_no_command'}{'contents'}[0];
$result_trees{'brace_opened_no_command'}{'contents'}[0]{'parent'} = $result_trees{'brace_opened_no_command'};

$result_texis{'brace_opened_no_command'} = 'anchortruc@} @anchor{truc}.
';


$result_texts{'brace_opened_no_command'} = 'anchortruc} .
';

$result_errors{'brace_opened_no_command'} = [
  {
    'error_line' => ':1: Misplaced {
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Misplaced {',
    'type' => 'error'
  }
];


1;
