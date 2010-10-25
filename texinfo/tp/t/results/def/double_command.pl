use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'double_command'} = {
  'contents' => [
    {
      'cmdname' => 'deffn',
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
                  'text' => 'func plot (a, b, c, ...) '
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
                          'text' => 'func plot2 (a, b, c, ..., d)
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'misc_line_arg'
                    }
                  ],
                  'cmdname' => 'deffnx',
                  'extra' => {
                    'def_args' => [
                      [
                        'category',
                        {
                          'text' => 'func'
                        }
                      ],
                      [
                        'spaces',
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        }
                      ],
                      [
                        'name',
                        {
                          'text' => 'plot2'
                        }
                      ],
                      [
                        'spaces',
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        }
                      ],
                      [
                        'delimiter',
                        {
                          'text' => '(',
                          'type' => 'delimiter'
                        }
                      ],
                      [
                        'arg',
                        {
                          'text' => 'a'
                        }
                      ],
                      [
                        'delimiter',
                        {
                          'text' => ',',
                          'type' => 'delimiter'
                        }
                      ],
                      [
                        'spaces',
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        }
                      ],
                      [
                        'arg',
                        {
                          'text' => 'b'
                        }
                      ],
                      [
                        'delimiter',
                        {
                          'text' => ',',
                          'type' => 'delimiter'
                        }
                      ],
                      [
                        'spaces',
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        }
                      ],
                      [
                        'arg',
                        {
                          'text' => 'c'
                        }
                      ],
                      [
                        'delimiter',
                        {
                          'text' => ',',
                          'type' => 'delimiter'
                        }
                      ],
                      [
                        'spaces',
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        }
                      ],
                      [
                        'arg',
                        {
                          'text' => '...'
                        }
                      ],
                      [
                        'delimiter',
                        {
                          'text' => ',',
                          'type' => 'delimiter'
                        }
                      ],
                      [
                        'spaces',
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        }
                      ],
                      [
                        'arg',
                        {
                          'text' => 'd'
                        }
                      ],
                      [
                        'delimiter',
                        {
                          'text' => ')',
                          'type' => 'delimiter'
                        }
                      ]
                    ],
                    'def_command' => 'deffn'
                  },
                  'parent' => {},
                  'type' => 'def_line'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'extra' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'func'
                }
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'name',
                {
                  'text' => 'plot'
                }
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'delimiter',
                {
                  'text' => '(',
                  'type' => 'delimiter'
                }
              ],
              [
                'arg',
                {
                  'text' => 'a'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
                }
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {
                  'text' => 'b'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
                }
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {
                  'text' => 'c'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ',',
                  'type' => 'delimiter'
                }
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {
                  'text' => '...'
                }
              ],
              [
                'delimiter',
                {
                  'text' => ')',
                  'type' => 'delimiter'
                }
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {}
              ]
            ],
            'def_command' => 'deffn'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'aaa
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
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
      'cmdname' => 'deffn',
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
                  'text' => 'func aaaa args  '
                },
                {
                  'cmdname' => 'defvr',
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
                              'text' => 'c--ategory d--efvr_name
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'block_line_arg'
                        }
                      ],
                      'extra' => {
                        'def_args' => [
                          [
                            'category',
                            {
                              'text' => 'c--ategory'
                            }
                          ],
                          [
                            'spaces',
                            {
                              'text' => ' ',
                              'type' => 'spaces'
                            }
                          ],
                          [
                            'name',
                            {
                              'text' => 'd--efvr_name'
                            }
                          ]
                        ],
                        'def_command' => 'defvr'
                      },
                      'parent' => {},
                      'type' => 'def_line'
                    }
                  ],
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'extra' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'func'
                }
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'name',
                {
                  'text' => 'aaaa'
                }
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {
                  'text' => 'args'
                }
              ],
              [
                'spaces',
                {
                  'text' => '  ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {}
              ]
            ],
            'def_command' => 'deffn'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'bbb
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
  'type' => 'text_root'
};
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[17][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[1];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_command'}{'contents'}[0];
$result_trees{'double_command'}{'contents'}[0]{'parent'} = $result_trees{'double_command'};
$result_trees{'double_command'}{'contents'}[1]{'parent'} = $result_trees{'double_command'};
$result_trees{'double_command'}{'contents'}[2]{'parent'} = $result_trees{'double_command'};
$result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[3]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'double_command'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[3];
$result_trees{'double_command'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[3]{'contents'}[1];
$result_trees{'double_command'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'double_command'}{'contents'}[3];
$result_trees{'double_command'}{'contents'}[3]{'parent'} = $result_trees{'double_command'};
$result_trees{'double_command'}{'contents'}[4]{'parent'} = $result_trees{'double_command'};

$result_texis{'double_command'} = '@deffn func plot (a, b, c, ...) @deffnx func plot2 (a, b, c, ..., d)
aaa
@end deffn

@deffn func aaaa args  @defvr c--ategory d--efvr_name
@end defvrbbb
@end deffn
';


$result_texts{'double_command'} = 'func plot (a, b, c, ...) func plot2 (a, b, c, ..., d)
aaa

func aaaa args  c--ategory d--efvr_name
bbb
';

$result_errors{'double_command'} = [
  {
    'error_line' => ':1: warning: @deffnx should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@deffnx should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: warning: @deffnx should not appear in @deffn
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@deffnx should not appear in @deffn',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: Must be after `@deffn\' to use `@deffnx\'
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Must be after `@deffn\' to use `@deffnx\'',
    'type' => 'error'
  },
  {
    'error_line' => ':5: warning: @defvr should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@defvr should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @defvr should not appear in @deffn
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@defvr should not appear in @deffn',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: No matching `@end defvr\'
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'No matching `@end defvr\'',
    'type' => 'error'
  }
];


$result_indices{'double_command'} = undef;


1;
