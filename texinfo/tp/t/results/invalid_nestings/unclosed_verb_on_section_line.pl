use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'unclosed_verb_on_section_line'} = {
  'contents' => [
    {
      'contents' => [],
      'type' => 'text_root'
    },
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
              'text' => 'in section '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'ruc
',
                      'type' => 'raw'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'raw'
                    },
                    {
                      'parent' => {},
                      'text' => 'Now text.
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
              'type' => 'T'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'section',
      'level' => 2,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'number' => 1,
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'unclosed_verb_on_section_line'}{'contents'}[1];
$result_trees{'unclosed_verb_on_section_line'}{'contents'}[1]{'parent'} = $result_trees{'unclosed_verb_on_section_line'};

$result_texis{'unclosed_verb_on_section_line'} = '@section in section @verb{Truc

Now text.
T}';


$result_texts{'unclosed_verb_on_section_line'} = 'in section ruc

Now text.
';

$result_sectioning{'unclosed_verb_on_section_line'} = {
  'level' => 1,
  'section_childs' => [
    {
      'cmdname' => 'section',
      'level' => 2,
      'number' => 1,
      'section_up' => {}
    }
  ]
};
$result_sectioning{'unclosed_verb_on_section_line'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'unclosed_verb_on_section_line'};

$result_errors{'unclosed_verb_on_section_line'} = [
  {
    'error_line' => ':3: @verb missing closing delimiter sequence: T}
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@verb missing closing delimiter sequence: T}',
    'type' => 'error'
  }
];


1;
