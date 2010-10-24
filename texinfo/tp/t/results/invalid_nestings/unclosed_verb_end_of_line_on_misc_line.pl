use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'unclosed_verb_end_of_line_on_misc_line'} = {
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
                      'text' => '
',
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
              'type' => ''
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'setfilename',
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'unclosed_verb_end_of_line_on_misc_line'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'unclosed_verb_end_of_line_on_misc_line'}{'contents'}[0]{'args'}[0];
$result_trees{'unclosed_verb_end_of_line_on_misc_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'unclosed_verb_end_of_line_on_misc_line'}{'contents'}[0]{'args'}[0];
$result_trees{'unclosed_verb_end_of_line_on_misc_line'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'unclosed_verb_end_of_line_on_misc_line'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'unclosed_verb_end_of_line_on_misc_line'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'unclosed_verb_end_of_line_on_misc_line'}{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'unclosed_verb_end_of_line_on_misc_line'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'unclosed_verb_end_of_line_on_misc_line'}{'contents'}[0]{'args'}[0];
$result_trees{'unclosed_verb_end_of_line_on_misc_line'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'unclosed_verb_end_of_line_on_misc_line'}{'contents'}[0];
$result_trees{'unclosed_verb_end_of_line_on_misc_line'}{'contents'}[0]{'parent'} = $result_trees{'unclosed_verb_end_of_line_on_misc_line'};

$result_texis{'unclosed_verb_end_of_line_on_misc_line'} = '@setfilename name @verb{
}';


$result_texts{'unclosed_verb_end_of_line_on_misc_line'} = '';

$result_errors{'unclosed_verb_end_of_line_on_misc_line'} = [
  {
    'error_line' => ':1: @verb without associated character
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@verb without associated character',
    'type' => 'error'
  },
  {
    'error_line' => ':1: @verb missing close brace
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@verb missing close brace',
    'type' => 'error'
  }
];


$result_indices{'unclosed_verb_end_of_line_on_misc_line'} = undef;


1;
