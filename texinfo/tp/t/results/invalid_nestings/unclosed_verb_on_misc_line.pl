use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices %result_sectioning %result_nodes);

$result_trees{'unclosed_verb_on_misc_line'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'name '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'ile.texi',
                      'type' => 'raw'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'verb',
              'contents' => [],
              'parent' => {},
              'type' => 'f'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'setfilename',
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'unclosed_verb_on_misc_line'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'unclosed_verb_on_misc_line'}{'contents'}[0]{'args'}[0];
$result_trees{'unclosed_verb_on_misc_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'unclosed_verb_on_misc_line'}{'contents'}[0]{'args'}[0];
$result_trees{'unclosed_verb_on_misc_line'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'unclosed_verb_on_misc_line'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'unclosed_verb_on_misc_line'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'unclosed_verb_on_misc_line'}{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'unclosed_verb_on_misc_line'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'unclosed_verb_on_misc_line'}{'contents'}[0]{'args'}[0];
$result_trees{'unclosed_verb_on_misc_line'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'unclosed_verb_on_misc_line'}{'contents'}[0];
$result_trees{'unclosed_verb_on_misc_line'}{'contents'}[0]{'parent'} = $result_trees{'unclosed_verb_on_misc_line'};

$result_texis{'unclosed_verb_on_misc_line'} = '@setfilename name @verb{file.texif}';


$result_texts{'unclosed_verb_on_misc_line'} = '';

$result_errors{'unclosed_verb_on_misc_line'} = [
  {
    'error_line' => ':1: @verb missing closing delimiter sequence: f}
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@verb missing closing delimiter sequence: f}',
    'type' => 'error'
  }
];


1;
