use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'on_index_entry_line'} = {
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
              'cmdname' => 'indent',
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
      'cmdname' => 'cindex',
      'line_nr' => {},
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[8]{'line_nr'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'on_index_entry_line'}{'contents'}[0];
$result_trees{'on_index_entry_line'}{'contents'}[0]{'line_nr'} = $result_trees{'on_index_entry_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'on_index_entry_line'}{'contents'}[0]{'parent'} = $result_trees{'on_index_entry_line'};

$result_texis{'on_index_entry_line'} = '@cindex @indent @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
';


$result_texts{'on_index_entry_line'} = '';

$result_errors{'on_index_entry_line'} = [
  {
    'error_line' => ':1: warning: @indent should not appear in @cindex
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@indent should not appear in @cindex',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: warning: @titlefont should not appear in @cindex
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@titlefont should not appear in @cindex',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: warning: @anchor should not appear in @cindex
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@anchor should not appear in @cindex',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: warning: @footnote should not appear in @cindex
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@footnote should not appear in @cindex',
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
    'error_line' => ':1: warning: @exdent should not appear in @cindex
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@exdent should not appear in @cindex',
    'type' => 'warning'
  }
];


1;
