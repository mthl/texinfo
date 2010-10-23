use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'center'} = {
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
              'parent' => {}
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
                  'parent' => {}
                }
              ],
              'cmdname' => 'footnote',
              'contents' => [],
              'parent' => {}
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
      'cmdname' => 'center',
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
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
              'text' => 'center'
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'spaces_at_end'
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
                      'text' => 'cindex'
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
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'center',
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
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
              'cmdname' => 'quotation',
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'center',
      'parent' => {}
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'in quotation
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
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[0]{'args'}[0];
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'center'}{'contents'}[0]{'args'}[0];
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'center'}{'contents'}[0]{'args'}[0];
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'center'}{'contents'}[0]{'args'}[0];
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'center'}{'contents'}[0]{'args'}[0];
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'center'}{'contents'}[0]{'args'}[0];
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'center'}{'contents'}[0]{'args'}[0];
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'center'}{'contents'}[0]{'args'}[0];
$result_trees{'center'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'center'}{'contents'}[0];
$result_trees{'center'}{'contents'}[0]{'parent'} = $result_trees{'center'};
$result_trees{'center'}{'contents'}[1]{'parent'} = $result_trees{'center'};
$result_trees{'center'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[2]{'args'}[0];
$result_trees{'center'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'center'}{'contents'}[2]{'args'}[0];
$result_trees{'center'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'center'}{'contents'}[2]{'args'}[0];
$result_trees{'center'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'center'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'center'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'center'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'center'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'center'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'center'}{'contents'}[2]{'args'}[0]{'contents'}[3];
$result_trees{'center'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'center'}{'contents'}[2]{'args'}[0];
$result_trees{'center'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'center'}{'contents'}[2];
$result_trees{'center'}{'contents'}[2]{'parent'} = $result_trees{'center'};
$result_trees{'center'}{'contents'}[3]{'parent'} = $result_trees{'center'};
$result_trees{'center'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[4]{'args'}[0];
$result_trees{'center'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'center'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'center'}{'contents'}[4]{'args'}[0];
$result_trees{'center'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'center'}{'contents'}[4];
$result_trees{'center'}{'contents'}[4]{'parent'} = $result_trees{'center'};
$result_trees{'center'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[5];
$result_trees{'center'}{'contents'}[5]{'parent'} = $result_trees{'center'};
$result_trees{'center'}{'contents'}[6]{'parent'} = $result_trees{'center'};

$result_texis{'center'} = '@center @indent @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote}

@center center @cindex cindex

@center @quotation
@end quotationin quotation

';


$result_texts{'center'} = 'in titlefont 

center


in quotation
';

$result_errors{'center'} = [
  {
    'error_line' => ':3: warning: @cindex should not appear in @center
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@cindex should not appear in @center',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @quotation should not appear in @center
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@quotation should not appear in @center',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: Closing @quotation
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'Closing @quotation',
    'type' => 'error'
  },
  {
    'error_line' => ':7: Unmatched `@end quotation\'
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'Unmatched `@end quotation\'',
    'type' => 'error'
  }
];


