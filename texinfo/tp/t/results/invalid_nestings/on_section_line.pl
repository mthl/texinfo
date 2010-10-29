use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'on_section_line'} = {
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
              'cmdname' => 'noindent',
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 1,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'Text '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in titlefont'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'titlefont',
              'contents' => [],
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
                      'text' => 'in anchor'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'anchor',
              'contents' => [],
              'parent' => {},
              'special' => {
                'normalized' => 'in-anchor'
              }
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'footnote'
                        }
                      ],
                      'parent' => {},
                      'type' => 'paragraph'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_context'
                }
              ],
              'cmdname' => 'footnote',
              'contents' => [],
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'cmdname' => 'exdent',
              'line_nr' => {},
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'exdent'
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
      'cmdname' => 'section',
      'contents' => [],
      'line_nr' => {},
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[4];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[6];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[7];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[9]{'line_nr'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0];
$result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'on_section_line'}{'contents'}[1];
$result_trees{'on_section_line'}{'contents'}[1]{'line_nr'} = $result_trees{'on_section_line'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'on_section_line'}{'contents'}[1]{'parent'} = $result_trees{'on_section_line'};

$result_texis{'on_section_line'} = '@section @noindent Text @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
';


$result_texts{'on_section_line'} = 'Text in titlefont  exdent
';

$result_errors{'on_section_line'} = [
  {
    'error_line' => ':1: warning: @noindent should not appear in @section
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@noindent should not appear in @section',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: warning: @titlefont should not appear in @section
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@titlefont should not appear in @section',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: warning: @anchor should not appear in @section
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@anchor should not appear in @section',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: warning: @footnote should not appear in @section
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@footnote should not appear in @section',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: warning: @exdent should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@exdent should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: warning: @exdent should not appear in @section
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@exdent should not appear in @section',
    'type' => 'warning'
  }
];


1;
