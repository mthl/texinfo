use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'raw_expanded_in_style'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
'
                },
                {
                  'cmdname' => 'html',
                  'contents' => [
                    {
                      'extra' => {
                        'command' => {}
                      },
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'in html',
                      'type' => 'raw'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'last_raw_newline'
                    }
                  ],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 2,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'code',
          'contents' => [],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0];
$result_trees{'raw_expanded_in_style'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'raw_expanded_in_style'}{'contents'}[0];
$result_trees{'raw_expanded_in_style'}{'contents'}[0]{'parent'} = $result_trees{'raw_expanded_in_style'};

$result_texis{'raw_expanded_in_style'} = '@code{
@html
in html
@end html
}';


$result_texts{'raw_expanded_in_style'} = '
';

$result_errors{'raw_expanded_in_style'} = [];



$result_converted{'plaintext'}->{'raw_expanded_in_style'} = '` 
in html
\'
';


$result_converted{'html_text'}->{'raw_expanded_in_style'} = '<p><code>
in html</code></p>';

1;
