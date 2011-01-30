use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'titlefont_in_example'} = {
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
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'Title'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'titlefont',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ]
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '
'
            },
            {
              'parent' => {},
              'text' => 'Text.
'
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
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
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'parent'} = $result_trees{'titlefont_in_example'};
$result_trees{'titlefont_in_example'}{'contents'}[1]{'parent'} = $result_trees{'titlefont_in_example'};

$result_texis{'titlefont_in_example'} = '@example
@titlefont{Title}
Text.
@end example
';


$result_texts{'titlefont_in_example'} = 'Title
Text.
';

$result_errors{'titlefont_in_example'} = [];



$result_converted{'plaintext'}->{'titlefont_in_example'} = '     Title
**********

     Text.
';

1;
