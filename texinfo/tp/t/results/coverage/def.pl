use vars qw(%result_texis %result_texts %result_trees %result_errors);

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
                  'text' => ' '
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
                  'text' => ' cate--gory de--ffn_name ar--guments    more args '
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
                  'text' => ' fset '
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
                  'parent' => {},
                  'remaining_args' => 0
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
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_line_after_command'
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
                  'parent' => {},
                  'remaining_args' => 0
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
                          'parent' => {},
                          'remaining_args' => 0
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
                  'parent' => {},
                  'remaining_args' => 0
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
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '',
                  'type' => 'empty_line_after_command'
                },
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
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '',
                  'type' => 'empty_line_after_command'
                },
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
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '',
                  'type' => 'empty_line_after_command'
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
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_line_after_command'
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'Various deff lines
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_line_after_command'
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
              'parent' => {},
              'text' => 'text in def item for second def item
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_line_after_command'
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
              'type' => 'def_line'
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
  ]
};
$result_trees{'def'}{'contents'}[0]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[0];
$result_trees{'def'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[1]{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[1];
$result_trees{'def'}{'contents'}[1]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[2]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[3]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[4]{'contents'}[0];
$result_trees{'def'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[4];
$result_trees{'def'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[4]{'contents'}[1];
$result_trees{'def'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[4];
$result_trees{'def'}{'contents'}[4]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[5]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[6]{'parent'} = $result_trees{'def'};
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[3];
$result_trees{'def'}{'contents'}[7]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[4];
$result_trees{'def'}{'contents'}[7]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[5];
$result_trees{'def'}{'contents'}[7]{'contents'}[5]{'parent'} = $result_trees{'def'}{'contents'}[7];
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
$result_trees{'def'}{'contents'}[7]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[7]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[7]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[7]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[7]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[3];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[8];
$result_trees{'def'}{'contents'}[7]{'contents'}[8]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[9];
$result_trees{'def'}{'contents'}[7]{'contents'}[9]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[10];
$result_trees{'def'}{'contents'}[7]{'contents'}[10]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[11];
$result_trees{'def'}{'contents'}[7]{'contents'}[11]{'parent'} = $result_trees{'def'}{'contents'}[7];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[1]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[2];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[3]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[4]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[4]{'args'}[0];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[4];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'contents'}[4]{'parent'} = $result_trees{'def'}{'contents'}[7]{'contents'}[12];
$result_trees{'def'}{'contents'}[7]{'contents'}[12]{'parent'} = $result_trees{'def'}{'contents'}[7];
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
Various deff lines
@deffnx {truc} after a deff item
@c comment
text in def item for second def item
@deffnx {truc} deffnx before end deffn
@end deffn
';

$result_errors{'def'} = [
  {
    'error_line' => ':24: Must be in `@deffn\' environment to use `@deffnx\'
',
    'file_name' => '',
    'line_nr' => 24,
    'macro' => '',
    'text' => 'Must be in `@deffn\' environment to use `@deffnx\'',
    'type' => 'error'
  },
  {
    'error_line' => ':27: Must be in `@deffn\' environment to use `@deffnx\'
',
    'file_name' => '',
    'line_nr' => 27,
    'macro' => '',
    'text' => 'Must be in `@deffn\' environment to use `@deffnx\'',
    'type' => 'error'
  }
];


