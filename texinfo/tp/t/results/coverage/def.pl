use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'def'} = {
  'contents' => [
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'c--ategory'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' d--effn_name a--rguments...
'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'parent' => {},
          'special' => {
            'def_args' => [
              [
                'category',
                {}
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
                  'text' => 'd--effn_name'
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
                  'text' => 'a--rguments...'
                }
              ]
            ],
            'def_command' => 'deffn'
          },
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'd--effn
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
                  'text' => 'cate--gory de--ffn_name ar--guments    more args '
                },
                {
                  'cmdname' => '*',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' even more so
'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'parent' => {},
          'special' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'cate--gory'
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
                  'text' => 'de--ffn_name'
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
                  'text' => 'ar--guments'
                }
              ],
              [
                'spaces',
                {
                  'text' => '    ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {
                  'text' => 'more'
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
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {}
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
                  'text' => 'even'
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
                  'text' => 'more'
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
                  'text' => 'so'
                }
              ]
            ],
            'def_command' => 'deffn'
          },
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'def--fn
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
                  'text' => 'fset '
                },
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
                  'cmdname' => 'var',
                  'contents' => [],
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' a g
'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'parent' => {},
          'special' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'fset'
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
                {}
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
                'arg',
                {
                  'text' => 'g'
                }
              ]
            ],
            'def_command' => 'deffn'
          },
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'cmde'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' truc '
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed'
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
          'cmdname' => 'deffnx',
          'parent' => {},
          'special' => {
            'def_args' => [
              [
                'category',
                {}
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
                'arg',
                {}
              ]
            ],
            'def_command' => 'deffn'
          },
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
                  'text' => 'Command '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'log trap'
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
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed'
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
          'cmdname' => 'deffnx',
          'parent' => {},
          'special' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'Command'
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
                {}
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
                  'text' => 'Command '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' log trap1'
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
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed'
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
          'cmdname' => 'deffnx',
          'parent' => {},
          'special' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'Command'
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
                {}
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
                  'text' => 'Command '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'log trap2 '
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
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed'
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
          'cmdname' => 'deffnx',
          'parent' => {},
          'special' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'Command'
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
                {}
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
                  'text' => 'cmde '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'id ule'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'b',
                  'contents' => [],
                  'parent' => {}
                },
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
          'cmdname' => 'deffnx',
          'parent' => {},
          'special' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'cmde'
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
                {}
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
                  'text' => 'truc'
                }
              ]
            ],
            'def_command' => 'deffn'
          },
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
                  'text' => 'cmde2 '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'id '
                        },
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
                          'cmdname' => 'samp',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' ule'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'b',
                  'contents' => [],
                  'parent' => {}
                },
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
          'cmdname' => 'deffnx',
          'parent' => {},
          'special' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'cmde2'
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
                {}
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
                  'text' => 'truc'
                }
              ]
            ],
            'def_command' => 'deffn'
          },
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' machin
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
          'parent' => {},
          'special' => {
            'def_args' => [
              [
                'category',
                {}
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
              ]
            ],
            'def_command' => 'deffn'
          },
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'bidule machin'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
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
          'cmdname' => 'deffnx',
          'parent' => {},
          'special' => {
            'def_args' => [
              [
                'category',
                {}
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
                {}
              ]
            ],
            'def_command' => 'deffn'
          },
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'truc'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' machin
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
          'parent' => {},
          'special' => {
            'def_args' => [
              [
                'category',
                {}
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
              ]
            ],
            'def_command' => 'deffn'
          },
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'truc'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' followed by a comment
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
          'parent' => {},
          'special' => {
            'def_args' => [
              [
                'category',
                {}
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
                  'text' => 'followed'
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
                  'text' => 'by'
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
                'arg',
                {
                  'text' => 'comment'
                }
              ]
            ],
            'def_command' => 'deffn'
          },
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' comment
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'truc'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' after a deff item
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
          'parent' => {},
          'special' => {
            'def_args' => [
              [
                'category',
                {}
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
                  'text' => 'after'
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
                'arg',
                {
                  'text' => 'deff'
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
                  'text' => 'item'
                }
              ]
            ],
            'def_command' => 'deffn'
          },
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' comment
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'truc'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' deffnx before end deffn
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
          'parent' => {},
          'special' => {
            'def_args' => [
              [
                'category',
                {}
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
                  'text' => 'deffnx'
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
                  'text' => 'before'
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
                  'text' => 'end'
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
                  'text' => 'deffn'
                }
              ]
            ],
            'def_command' => 'deffn'
          },
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Various deff lines
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
$result_trees{'def'}{'contents'}[0]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'special'}{'def_args'}[0][1] = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[2]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[3]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[4]{'contents'}[0];
$result_trees{'def'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[4];
$result_trees{'def'}{'contents'}[4]{'contents'}[0]{'special'}{'def_args'}[10][1] = $result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[4]{'contents'}[1];
$result_trees{'def'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[4];
$result_trees{'def'}{'contents'}[4]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[5]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[6]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'special'}{'def_args'}[2][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'special'}{'def_args'}[0][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'special'}{'def_args'}[4][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'special'}{'def_args'}[2][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'special'}{'def_args'}[4][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[4];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'special'}{'def_args'}[2][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'special'}{'def_args'}[4][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[4];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'special'}{'def_args'}[2][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'special'}{'def_args'}[4][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[4];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[5];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'special'}{'def_args'}[2][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[6];
$result_trees{'def'}{'contents'}[7]{'contents'}[6]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[6]{'special'}{'def_args'}[2][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[6]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[7]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[7]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[7]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[7]{'special'}{'def_args'}[0][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[8];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'special'}{'def_args'}[0][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'special'}{'def_args'}[2][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0]{'contents'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[9];
$result_trees{'def'}{'contents'}[7]{'contents'}[9]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[9]{'special'}{'def_args'}[0][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0]{'contents'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[10];
$result_trees{'def'}{'contents'}[7]{'contents'}[10]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[10]{'special'}{'def_args'}[0][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[11];
$result_trees{'def'}{'contents'}[7]{'contents'}[11]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'special'}{'def_args'}[0][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[13];
$result_trees{'def'}{'contents'}[7]{'contents'}[13]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[14]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[14]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[14]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[14]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[14]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[14]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[14]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[14]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[14];
$result_trees{'def'}{'contents'}[7]{'contents'}[14]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[14]{'special'}{'def_args'}[0][1] = $result_trees{'def'}{'contents'}[7]{'contents'}[14]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[15];
$result_trees{'def'}{'contents'}[7]{'contents'}[15]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[8]{'parent'} = $result_trees{'def'};

$result_texis{'def'} = '
@deffn {c--ategory} d--effn_name a--rguments...
d--effn
@end deffn

@deffn cate--gory de--ffn_name ar--guments    more args @* even more so
def--fn
@end deffn

@deffn fset @var{i} a g
@deffnx {cmde} truc {}
@deffnx Command {log trap} {}
@deffnx Command { log trap1} {}  
@deffnx Command {log trap2 } {}
@deffnx cmde @b{id ule} truc
@deffnx cmde2 @b{id @samp{i} ule} truc
@deffnx{} machin
@deffnx{} {bidule machin}
@deffnx{truc} machin
@deffnx {truc} followed by a comment
@c comment
@deffnx {truc} after a deff item
@c comment
@deffnx {truc} deffnx before end deffn
Various deff lines
@end deffn
';


$result_texts{'def'} = '
c--ategory d--effn_name a--rguments...
d--effn

cate--gory de--ffn_name ar--guments    more args 
 even more so
def--fn

fset i a g
cmde truc 
Command log trap 
Command  log trap1   
Command log trap2  
cmde id ule truc
cmde2 id i ule truc
 machin
 bidule machin
truc machin
truc followed by a comment
truc after a deff item
truc deffnx before end deffn
Various deff lines
';

$result_errors{'def'} = [];


$result_indices{'def'} = undef;


1;
