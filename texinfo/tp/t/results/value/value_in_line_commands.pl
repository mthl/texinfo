use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'value_in_line_commands'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'cp',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'cp',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' cp cp
'
      }
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'fn',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'fn',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' fn fn
'
      }
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'syncodeindex_command',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@syncodeindex',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' syncodeindex_command @syncodeindex
'
      }
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
              'text' => ' cp fn
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'syncodeindex',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'cp',
          'fn'
        ]
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' cp fn
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'syncodeindex',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'cp',
          'fn'
        ]
      }
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
          'parent' => {},
          'text' => 'en',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'en',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' en en
'
      }
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'documentlanguage_command',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@documentlanguage',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' documentlanguage_command @documentlanguage
'
      }
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
          'parent' => {},
          'text' => 'documentlanguage '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '  en
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'documentlanguage',
          'parent' => {}
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
          'parent' => {},
          'text' => 'documentlanguage on its line
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '  en
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'documentlanguage',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'line following documentlanguage
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
      'args' => [
        {
          'parent' => {},
          'text' => 'truc',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'truc',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' truc truc
'
      }
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
          'parent' => {},
          'text' => 'definedx truc
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' truc
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'defindex',
          'parent' => {},
          'special' => {
            'misc_args' => [
              'truc'
            ]
          }
        },
        {
          'parent' => {},
          'text' => 'after
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
      'args' => [
        {
          'parent' => {},
          'text' => 'trucindex_command',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@trucindex',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' trucindex_command @trucindex
'
      }
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
              'text' => ' index truc
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'trucindex',
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
          'parent' => {},
          'text' => 'codeidx',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'codeidx',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' codeidx codeidx
'
      }
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
              'text' => ' codeidx
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'defcodeindex',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'codeidx'
        ]
      }
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
          'parent' => {},
          'text' => 'defcodeindex_entry',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'a @var{index entry} t@\'e @^{@dotless{i}}',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' defcodeindex_entry a @var{index entry} t@\'e @^{@dotless{i}}
'
      }
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
              'text' => ' a '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'index entry'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'var',
              'contents' => [],
              'parent' => {},
              'remaining_args' => 0
            },
            {
              'parent' => {},
              'text' => ' t'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => 'e'
                }
              ],
              'cmdname' => '\'',
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
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'i'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'dotless',
                      'contents' => [],
                      'parent' => {},
                      'remaining_args' => 0
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => '^',
              'contents' => [],
              'parent' => {},
              'remaining_args' => 0
            },
            {
              'parent' => {},
              'text' => '
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'codeidxindex',
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
              'text' => ' cindex entry
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'cindex',
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
              'text' => ' ky pg
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'syncodeindex',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'ky',
          'pg'
        ]
      }
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
              'text' => ' truc kindex
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'kindex',
      'parent' => {}
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' pindex codeidx
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'pindex',
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
              'text' => ' truc cp
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'synindex',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'truc',
          'cp'
        ]
      }
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
              'text' => ' abc
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'defindex',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'abc'
        ]
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' defg
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'defindex',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'defg'
        ]
      }
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
              'text' => ' abc defg
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'synindex',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'abc',
          'defg'
        ]
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' defg ky
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'synindex',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'defg',
          'ky'
        ]
      }
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
              'text' => ' defg index entry
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'defgindex',
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
              'text' => ' abc index entry
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'abcindex',
      'parent' => {}
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
          'parent' => {},
          'text' => 'pg
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' pg
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'printindex',
      'parent' => {}
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
          'parent' => {},
          'text' => 'ky
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ky
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'printindex',
      'parent' => {}
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
          'parent' => {},
          'text' => 'truc
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' truc
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'printindex',
      'parent' => {}
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
          'parent' => {},
          'text' => 'value truc
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' truc
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'printindex',
      'parent' => {}
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
          'parent' => {},
          'text' => 'cp
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' cp
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'printindex',
      'parent' => {}
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
          'parent' => {},
          'text' => 'value cp
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' cp
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'printindex',
      'parent' => {}
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
          'parent' => {},
          'text' => 'defg
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' defg
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'printindex',
      'parent' => {}
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
          'parent' => {},
          'text' => 'abc
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' abc
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'printindex',
      'parent' => {}
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
          'parent' => {},
          'text' => 'fn
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' fn
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'printindex',
      'parent' => {}
    }
  ]
};
$result_trees{'value_in_line_commands'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[1];
$result_trees{'value_in_line_commands'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[1];
$result_trees{'value_in_line_commands'}{'contents'}[1]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[2];
$result_trees{'value_in_line_commands'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[2];
$result_trees{'value_in_line_commands'}{'contents'}[2]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[3]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[4]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[4];
$result_trees{'value_in_line_commands'}{'contents'}[4]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[5]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[5];
$result_trees{'value_in_line_commands'}{'contents'}[5]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[6]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[7];
$result_trees{'value_in_line_commands'}{'contents'}[7]{'args'}[1]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[7];
$result_trees{'value_in_line_commands'}{'contents'}[7]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[8];
$result_trees{'value_in_line_commands'}{'contents'}[8]{'args'}[1]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[8];
$result_trees{'value_in_line_commands'}{'contents'}[8]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[9]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[10];
$result_trees{'value_in_line_commands'}{'contents'}[10]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[10]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[10]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[10]{'contents'}[1];
$result_trees{'value_in_line_commands'}{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[10];
$result_trees{'value_in_line_commands'}{'contents'}[10]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[11]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[12];
$result_trees{'value_in_line_commands'}{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[12]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[12]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[12]{'contents'}[1];
$result_trees{'value_in_line_commands'}{'contents'}[12]{'contents'}[1]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[12];
$result_trees{'value_in_line_commands'}{'contents'}[12]{'contents'}[2]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[12];
$result_trees{'value_in_line_commands'}{'contents'}[12]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[13]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[14];
$result_trees{'value_in_line_commands'}{'contents'}[14]{'args'}[1]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[14];
$result_trees{'value_in_line_commands'}{'contents'}[14]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[15]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[16]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[16];
$result_trees{'value_in_line_commands'}{'contents'}[16]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[16]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[16]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[16]{'contents'}[1];
$result_trees{'value_in_line_commands'}{'contents'}[16]{'contents'}[1]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[16];
$result_trees{'value_in_line_commands'}{'contents'}[16]{'contents'}[2]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[16];
$result_trees{'value_in_line_commands'}{'contents'}[16]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[17]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[18]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[18];
$result_trees{'value_in_line_commands'}{'contents'}[18]{'args'}[1]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[18];
$result_trees{'value_in_line_commands'}{'contents'}[18]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[19]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[20]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[20]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[20]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[20];
$result_trees{'value_in_line_commands'}{'contents'}[20]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[21]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[22]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[22];
$result_trees{'value_in_line_commands'}{'contents'}[22]{'args'}[1]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[22];
$result_trees{'value_in_line_commands'}{'contents'}[22]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[23]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[24]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[24]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[24]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[24];
$result_trees{'value_in_line_commands'}{'contents'}[24]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[25]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[26]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[26];
$result_trees{'value_in_line_commands'}{'contents'}[26]{'args'}[1]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[26];
$result_trees{'value_in_line_commands'}{'contents'}[26]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[27]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[1];
$result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[3];
$result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[5];
$result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[28]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[28];
$result_trees{'value_in_line_commands'}{'contents'}[28]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[29]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[30]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[30]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[30]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[30];
$result_trees{'value_in_line_commands'}{'contents'}[30]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[31]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[32]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[32]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[32]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[32];
$result_trees{'value_in_line_commands'}{'contents'}[32]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[33]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[34]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[34]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[34]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[34];
$result_trees{'value_in_line_commands'}{'contents'}[34]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[35]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[35]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[35]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[35];
$result_trees{'value_in_line_commands'}{'contents'}[35]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[36]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[37]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[37]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[37]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[37];
$result_trees{'value_in_line_commands'}{'contents'}[37]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[38]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[39]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[39]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[39]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[39];
$result_trees{'value_in_line_commands'}{'contents'}[39]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[40]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[40]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[40]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[40];
$result_trees{'value_in_line_commands'}{'contents'}[40]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[41]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[42]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[42]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[42]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[42];
$result_trees{'value_in_line_commands'}{'contents'}[42]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[43]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[43]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[43]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[43];
$result_trees{'value_in_line_commands'}{'contents'}[43]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[44]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[45]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[45]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[45]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[45];
$result_trees{'value_in_line_commands'}{'contents'}[45]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[46]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[47]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[47]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[47]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[47];
$result_trees{'value_in_line_commands'}{'contents'}[47]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[48]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[49]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[49];
$result_trees{'value_in_line_commands'}{'contents'}[49]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[50]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[50]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[50]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[50];
$result_trees{'value_in_line_commands'}{'contents'}[50]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[51]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[52]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[52];
$result_trees{'value_in_line_commands'}{'contents'}[52]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[53]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[53]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[53]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[53];
$result_trees{'value_in_line_commands'}{'contents'}[53]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[54]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[55]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[55];
$result_trees{'value_in_line_commands'}{'contents'}[55]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[56]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[56]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[56]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[56];
$result_trees{'value_in_line_commands'}{'contents'}[56]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[57]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[58]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[58];
$result_trees{'value_in_line_commands'}{'contents'}[58]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[59]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[59]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[59]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[59];
$result_trees{'value_in_line_commands'}{'contents'}[59]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[60]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[61]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[61];
$result_trees{'value_in_line_commands'}{'contents'}[61]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[62]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[62]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[62]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[62];
$result_trees{'value_in_line_commands'}{'contents'}[62]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[63]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[64]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[64];
$result_trees{'value_in_line_commands'}{'contents'}[64]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[65]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[65]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[65]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[65];
$result_trees{'value_in_line_commands'}{'contents'}[65]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[66]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[67]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[67];
$result_trees{'value_in_line_commands'}{'contents'}[67]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[68]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[68]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[68]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[68];
$result_trees{'value_in_line_commands'}{'contents'}[68]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[69]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[70]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[70];
$result_trees{'value_in_line_commands'}{'contents'}[70]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[71]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[71]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[71]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[71];
$result_trees{'value_in_line_commands'}{'contents'}[71]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[72]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[73]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[73];
$result_trees{'value_in_line_commands'}{'contents'}[73]{'parent'} = $result_trees{'value_in_line_commands'};
$result_trees{'value_in_line_commands'}{'contents'}[74]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[74]{'args'}[0];
$result_trees{'value_in_line_commands'}{'contents'}[74]{'args'}[0]{'parent'} = $result_trees{'value_in_line_commands'}{'contents'}[74];
$result_trees{'value_in_line_commands'}{'contents'}[74]{'parent'} = $result_trees{'value_in_line_commands'};

$result_texts{'value_in_line_commands'} = '@set cp cp
@set fn fn
@set syncodeindex_command @syncodeindex

@syncodeindex cp fn
@syncodeindex cp fn

@set en en
@set documentlanguage_command @documentlanguage

documentlanguage @documentlanguage  en

documentlanguage on its line
@documentlanguage  en
line following documentlanguage

@set truc truc

definedx truc
@defindex truc
after

@set trucindex_command @trucindex

@trucindex index truc

@set codeidx codeidx

@defcodeindex codeidx

@set defcodeindex_entry a @var{index entry} t@\'e @^{@dotless{i}}

@codeidxindex a @var{index entry} t@\'e @^{@dotless{i}}

@cindex cindex entry

@syncodeindex ky pg

@kindex truc kindex
@pindex pindex codeidx

@synindex truc cp

@defindex abc
@defindex defg

@synindex abc defg
@synindex defg ky

@defgindex defg index entry

@abcindex abc index entry

pg
@printindex pg

ky
@printindex ky

truc
@printindex truc

value truc
@printindex truc

cp
@printindex cp

value cp
@printindex cp

defg
@printindex defg

abc
@printindex abc

fn
@printindex fn
';

$result_errors{'value_in_line_commands'} = [];


