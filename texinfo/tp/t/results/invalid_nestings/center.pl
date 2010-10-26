use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

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
      'line_nr' => {},
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
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'center',
      'line_nr' => {},
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
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 5,
        'macro' => ''
      },
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
                      'text' => 'second center'
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
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 9,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'center',
      'line_nr' => {},
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in code in center
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'center',
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 11,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'parent' => {},
      'text' => '
'
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in code in center '
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
                              'text' => 'center in code in center'
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
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 15,
                        'macro' => ''
                      },
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'center',
      'line_nr' => {},
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'parent' => {},
      'text' => '
'
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
$result_trees{'center'}{'contents'}[0]{'line_nr'} = $result_trees{'center'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
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
$result_trees{'center'}{'contents'}[2]{'line_nr'} = $result_trees{'center'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'line_nr'};
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
$result_trees{'center'}{'contents'}[7]{'parent'} = $result_trees{'center'};
$result_trees{'center'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[8]{'args'}[0];
$result_trees{'center'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'center'}{'contents'}[8]{'args'}[0];
$result_trees{'center'}{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'center'}{'contents'}[8]{'args'}[0];
$result_trees{'center'}{'contents'}[8]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[8]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'center'}{'contents'}[8]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'center'}{'contents'}[8]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'center'}{'contents'}[8]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'center'}{'contents'}[8]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'center'}{'contents'}[8]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'center'}{'contents'}[8]{'args'}[0]{'contents'}[3];
$result_trees{'center'}{'contents'}[8]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'center'}{'contents'}[8]{'args'}[0];
$result_trees{'center'}{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'center'}{'contents'}[8];
$result_trees{'center'}{'contents'}[8]{'line_nr'} = $result_trees{'center'}{'contents'}[8]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'center'}{'contents'}[8]{'parent'} = $result_trees{'center'};
$result_trees{'center'}{'contents'}[9]{'parent'} = $result_trees{'center'};
$result_trees{'center'}{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[10]{'args'}[0];
$result_trees{'center'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'center'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'center'}{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'center'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'center'}{'contents'}[10]{'args'}[0];
$result_trees{'center'}{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'center'}{'contents'}[10];
$result_trees{'center'}{'contents'}[10]{'parent'} = $result_trees{'center'};
$result_trees{'center'}{'contents'}[11]{'parent'} = $result_trees{'center'};
$result_trees{'center'}{'contents'}[12]{'parent'} = $result_trees{'center'};
$result_trees{'center'}{'contents'}[13]{'parent'} = $result_trees{'center'};
$result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[14]{'args'}[0];
$result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1];
$result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'center'}{'contents'}[14]{'args'}[0];
$result_trees{'center'}{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'center'}{'contents'}[14];
$result_trees{'center'}{'contents'}[14]{'line_nr'} = $result_trees{'center'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'center'}{'contents'}[14]{'parent'} = $result_trees{'center'};
$result_trees{'center'}{'contents'}[15]{'parent'} = $result_trees{'center'};
$result_trees{'center'}{'contents'}[16]{'parent'} = $result_trees{'center'};

$result_texis{'center'} = '@center @indent @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote}

@center center @cindex cindex

@center @quotation
@end quotationin quotation


@center center @center second center

@center @code{in code in center
}


@center @code{in code in center @center center in code in center
}

';


$result_texts{'center'} = 'in titlefont 

center


in quotation

centersecond center

in code in center



in code in center center in code in center


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
    'error_line' => ':5: No matching `@end quotation\'
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'No matching `@end quotation\'',
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
  },
  {
    'error_line' => ':9: warning: @center should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 9,
    'macro' => '',
    'text' => '@center should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':9: warning: @center should not appear in @center
',
    'file_name' => '',
    'line_nr' => 9,
    'macro' => '',
    'text' => '@center should not appear in @center',
    'type' => 'warning'
  },
  {
    'error_line' => ':11: @code missing close brace
',
    'file_name' => '',
    'line_nr' => 11,
    'macro' => '',
    'text' => '@code missing close brace',
    'type' => 'error'
  },
  {
    'error_line' => ':13: Misplaced }
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  },
  {
    'error_line' => ':15: warning: @center should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 15,
    'macro' => '',
    'text' => '@center should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':15: warning: @center should not appear in @code
',
    'file_name' => '',
    'line_nr' => 15,
    'macro' => '',
    'text' => '@center should not appear in @code',
    'type' => 'warning'
  },
  {
    'error_line' => ':15: @code missing close brace
',
    'file_name' => '',
    'line_nr' => 15,
    'macro' => '',
    'text' => '@code missing close brace',
    'type' => 'error'
  },
  {
    'error_line' => ':17: Misplaced }
',
    'file_name' => '',
    'line_nr' => 17,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  }
];


$result_indices{'center'} = undef;


1;
