use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'wrong_braces_simple'} = {
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
                  'text' => 'truc machin bidule chose and 
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
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
                }
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'parent' => {},
          'type' => 'def_line'
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
                  'text' => 'truc machin bidule chose and  after
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
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
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
                {
                  'text' => 'after'
                }
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'parent' => {},
          'type' => 'def_line'
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
                  'text' => 'truc machin bidule chose and '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
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
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
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
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'parent' => {},
          'type' => 'def_line'
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
                  'text' => 'truc machin bidule chose and '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' and after
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
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
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
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
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'parent' => {},
          'type' => 'def_line'
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
                  'text' => 'a b c d e
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
                  'text' => 'a'
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
                  'text' => 'b'
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
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {
                  'text' => 'e'
                }
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'parent' => {},
          'type' => 'def_line'
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
                  'text' => 'truc machin bidule chose and 
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
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
                }
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 14,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'def_line'
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
                  'text' => 'truc machin bidule chose and  after
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
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
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
                {
                  'text' => 'after'
                }
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 15,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'def_line'
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
                  'text' => 'truc machin bidule chose and '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
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
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
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
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 16,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'def_line'
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
                  'text' => 'truc machin bidule chose and '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' and after
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
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
                  'text' => 'truc'
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
                  'text' => 'machin'
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
                  'text' => 'bidule'
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
                  'text' => 'chose'
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
                  'text' => 'and'
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
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 17,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'def_line'
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
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'} = $result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'};
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[3]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[3]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[3]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[3]{'contents'}[0]{'extra'}{'index_entry'}{'content'} = $result_trees{'wrong_braces_simple'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'};
$result_trees{'wrong_braces_simple'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[3];
$result_trees{'wrong_braces_simple'}{'contents'}[3]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[4]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[5]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[10][1] = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'content'} = $result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'};
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[6];
$result_trees{'wrong_braces_simple'}{'contents'}[6]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[7]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[8]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'}[10][1] = $result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0]{'extra'}{'index_entry'}{'content'} = $result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0]{'extra'}{'def_args'};
$result_trees{'wrong_braces_simple'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[9];
$result_trees{'wrong_braces_simple'}{'contents'}[9]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[10]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[11]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[0]{'extra'}{'index_entry'}{'content'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[0]{'extra'}{'def_args'};
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[1];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[1]{'extra'}{'index_entry'}{'content'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[1]{'extra'}{'def_args'};
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[2]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[2]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[2]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[2]{'extra'}{'index_entry'}{'content'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[2]{'extra'}{'def_args'};
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3]{'extra'}{'def_args'}[10][1] = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3]{'extra'}{'index_entry'}{'content'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3]{'extra'}{'def_args'};
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[3]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4]{'args'}[0];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4]{'extra'}{'def_args'}[10][1] = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4]{'extra'}{'index_entry'}{'content'} = $result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4]{'extra'}{'def_args'};
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'contents'}[4]{'parent'} = $result_trees{'wrong_braces_simple'}{'contents'}[12];
$result_trees{'wrong_braces_simple'}{'contents'}[12]{'parent'} = $result_trees{'wrong_braces_simple'};
$result_trees{'wrong_braces_simple'}{'contents'}[13]{'parent'} = $result_trees{'wrong_braces_simple'};

$result_texis{'wrong_braces_simple'} = '@deffn truc machin bidule chose and 
@end deffn

@deffn truc machin bidule chose and  after
@end deffn

@deffn truc machin bidule chose and {
}@end deffn

@deffn truc machin bidule chose and { and after
}@end deffn

@deffn a b c d e
@deffnx truc machin bidule chose and 
@deffnx truc machin bidule chose and  after
@deffnx truc machin bidule chose and {
}@deffnx truc machin bidule chose and { and after
}@end deffn
';


$result_texts{'wrong_braces_simple'} = 'truc machin bidule chose and 

truc machin bidule chose and  after

truc machin bidule chose and 

truc machin bidule chose and  and after

a b c d e
truc machin bidule chose and 
truc machin bidule chose and  after
truc machin bidule chose and 
truc machin bidule chose and  and after
';

$result_errors{'wrong_braces_simple'} = [
  {
    'error_line' => ':1: Misplaced }
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  },
  {
    'error_line' => ':4: Misplaced }
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  },
  {
    'error_line' => ':7: Misplaced {
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'Misplaced {',
    'type' => 'error'
  },
  {
    'error_line' => ':10: Misplaced {
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => 'Misplaced {',
    'type' => 'error'
  },
  {
    'error_line' => ':14: Misplaced }
',
    'file_name' => '',
    'line_nr' => 14,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  },
  {
    'error_line' => ':15: Misplaced }
',
    'file_name' => '',
    'line_nr' => 15,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  },
  {
    'error_line' => ':16: Misplaced {
',
    'file_name' => '',
    'line_nr' => 16,
    'macro' => '',
    'text' => 'Misplaced {',
    'type' => 'error'
  },
  {
    'error_line' => ':17: Misplaced {
',
    'file_name' => '',
    'line_nr' => 17,
    'macro' => '',
    'text' => 'Misplaced {',
    'type' => 'error'
  }
];


1;
