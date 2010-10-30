use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'empty_line_style_command'} = {
  'contents' => [
    {
      'cmdname' => 'example',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'example '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'in samp
'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'parent' => {},
                  'text' => 'after empty'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'samp',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' line
'
        }
      ],
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'empty_line_style_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_line_style_command'}{'contents'}[0];
$result_trees{'empty_line_style_command'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_line_style_command'}{'contents'}[0];
$result_trees{'empty_line_style_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_line_style_command'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'empty_line_style_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_line_style_command'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'empty_line_style_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_line_style_command'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'empty_line_style_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'empty_line_style_command'}{'contents'}[0]{'contents'}[2];
$result_trees{'empty_line_style_command'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_line_style_command'}{'contents'}[0];
$result_trees{'empty_line_style_command'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'empty_line_style_command'}{'contents'}[0];
$result_trees{'empty_line_style_command'}{'contents'}[0]{'parent'} = $result_trees{'empty_line_style_command'};
$result_trees{'empty_line_style_command'}{'contents'}[1]{'parent'} = $result_trees{'empty_line_style_command'};

$result_texis{'empty_line_style_command'} = '@example
example @samp{in samp

after empty} line
@end example
';


$result_texts{'empty_line_style_command'} = 'example in samp

after empty line
';

$result_errors{'empty_line_style_command'} = [];


1;
