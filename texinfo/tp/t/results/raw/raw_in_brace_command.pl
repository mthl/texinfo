use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'raw_in_brace_command'} = {
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
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'in html
',
                      'type' => 'raw'
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
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'code',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
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
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'samp',
          'contents' => [],
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'verbatim',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'in verbatim
',
          'type' => 'raw'
        }
      ],
      'extra' => {
        'invalid_nesting' => 1
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'raw_in_brace_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'raw_in_brace_command'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'raw_in_brace_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_in_brace_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'raw_in_brace_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_in_brace_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'raw_in_brace_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'raw_in_brace_command'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'raw_in_brace_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'raw_in_brace_command'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'raw_in_brace_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'raw_in_brace_command'}{'contents'}[0]{'contents'}[0];
$result_trees{'raw_in_brace_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'raw_in_brace_command'}{'contents'}[0];
$result_trees{'raw_in_brace_command'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'raw_in_brace_command'}{'contents'}[0];
$result_trees{'raw_in_brace_command'}{'contents'}[0]{'parent'} = $result_trees{'raw_in_brace_command'};
$result_trees{'raw_in_brace_command'}{'contents'}[1]{'parent'} = $result_trees{'raw_in_brace_command'};
$result_trees{'raw_in_brace_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'raw_in_brace_command'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'raw_in_brace_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'raw_in_brace_command'}{'contents'}[2]{'contents'}[0];
$result_trees{'raw_in_brace_command'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'raw_in_brace_command'}{'contents'}[2];
$result_trees{'raw_in_brace_command'}{'contents'}[2]{'parent'} = $result_trees{'raw_in_brace_command'};
$result_trees{'raw_in_brace_command'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'raw_in_brace_command'}{'contents'}[3];
$result_trees{'raw_in_brace_command'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'raw_in_brace_command'}{'contents'}[3];
$result_trees{'raw_in_brace_command'}{'contents'}[3]{'parent'} = $result_trees{'raw_in_brace_command'};
$result_trees{'raw_in_brace_command'}{'contents'}[4]{'parent'} = $result_trees{'raw_in_brace_command'};
$result_trees{'raw_in_brace_command'}{'contents'}[5]{'parent'} = $result_trees{'raw_in_brace_command'};

$result_texis{'raw_in_brace_command'} = '@code{
@html
in html
@end html
}

@samp{
}@verbatim
in verbatim
@end verbatim

';


$result_texts{'raw_in_brace_command'} = '



in verbatim

';

$result_errors{'raw_in_brace_command'} = [
  {
    'error_line' => ':8: warning: @verbatim should not appear in @samp
',
    'file_name' => '',
    'line_nr' => 8,
    'macro' => '',
    'text' => '@verbatim should not appear in @samp',
    'type' => 'warning'
  },
  {
    'error_line' => ':8: @samp missing close brace
',
    'file_name' => '',
    'line_nr' => 8,
    'macro' => '',
    'text' => '@samp missing close brace',
    'type' => 'error'
  },
  {
    'error_line' => ':11: Misplaced }
',
    'file_name' => '',
    'line_nr' => 11,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  }
];


1;
