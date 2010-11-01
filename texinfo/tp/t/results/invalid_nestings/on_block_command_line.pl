use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats);

$result_trees{'on_block_command_line'} = {
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
              'contents' => [
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
                  'extra' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'in-anchor'
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 1,
                    'macro' => ''
                  },
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'bracketed'
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
                      'text' => 'in titlefont'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'titlefont',
              'contents' => [],
              'extra' => {
                'invalid_nesting' => 1
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'multitable',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'contents' => [
            {
              'cmdname' => 'item',
              'contents' => [
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
                  'text' => '
'
                }
              ],
              'parent' => {}
            }
          ],
          'extra' => {
            'cell_number' => 1
          },
          'parent' => {},
          'type' => 'row'
        }
      ],
      'extra' => {
        'max_columns' => 2,
        'prototypes' => [
          {},
          {}
        ]
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
              'cmdname' => 'indent',
              'extra' => {
                'invalid_nesting' => 1
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 5,
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
              'extra' => {
                'invalid_nesting' => 1
              },
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
                      'text' => 'in quotation anchor'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'anchor',
              'contents' => [],
              'extra' => {
                'invalid_nesting' => 1,
                'node_content' => [
                  {}
                ],
                'normalized' => 'in-quotation-anchor'
              },
              'line_nr' => {},
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
                  'parent' => {},
                  'type' => 'brace_command_context'
                }
              ],
              'cmdname' => 'footnote',
              'contents' => [],
              'extra' => {
                'invalid_nesting' => 1
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'cmdname' => 'exdent',
              'extra' => {
                'invalid_nesting' => 1
              },
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
              'type' => 'space_at_end_block_command'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'quotation',
      'contents' => [],
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
$result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'node_content'}[0] = $result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'on_block_command_line'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'on_block_command_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[0];
$result_trees{'on_block_command_line'}{'contents'}[0]{'extra'}{'prototypes'}[0] = $result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'on_block_command_line'}{'contents'}[0]{'extra'}{'prototypes'}[1] = $result_trees{'on_block_command_line'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'on_block_command_line'}{'contents'}[0]{'parent'} = $result_trees{'on_block_command_line'};
$result_trees{'on_block_command_line'}{'contents'}[1]{'parent'} = $result_trees{'on_block_command_line'};
$result_trees{'on_block_command_line'}{'contents'}[2]{'parent'} = $result_trees{'on_block_command_line'};
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[3];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[5];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[6];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[8]{'line_nr'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0];
$result_trees{'on_block_command_line'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'on_block_command_line'}{'contents'}[3];
$result_trees{'on_block_command_line'}{'contents'}[3]{'parent'} = $result_trees{'on_block_command_line'};
$result_trees{'on_block_command_line'}{'contents'}[4]{'parent'} = $result_trees{'on_block_command_line'};

$result_texis{'on_block_command_line'} = '@multitable {@anchor{in anchor}} @titlefont{in titlefont}
@item @titlefont{in titlefont}
@end multitable

@quotation @indent @titlefont{in titlefont} @anchor{in quotation anchor}@footnote{footnote} @exdent exdent
@end quotation
';


$result_texts{'on_block_command_line'} = 'in titlefont

in titlefont  exdent

';

$result_errors{'on_block_command_line'} = [
  {
    'error_line' => ':1: warning: @titlefont should not appear in @multitable
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@titlefont should not appear in @multitable',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @indent should not appear in @quotation
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@indent should not appear in @quotation',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @titlefont should not appear in @quotation
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@titlefont should not appear in @quotation',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @anchor should not appear in @quotation
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@anchor should not appear in @quotation',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @footnote should not appear in @quotation
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@footnote should not appear in @quotation',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @exdent should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@exdent should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @exdent should not appear in @quotation
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@exdent should not appear in @quotation',
    'type' => 'warning'
  }
];


1;
