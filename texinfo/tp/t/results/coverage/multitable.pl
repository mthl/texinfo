use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'multitable'} = {
  'contents' => [
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
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => '6 7'
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
              'cmdname' => 'columnfractions',
              'parent' => {},
              'special' => {
                'misc_args' => [
                  '6',
                  '7'
                ]
              }
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
              'cmdname' => 'headitem',
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
                      'text' => 'mu--ltitable headitem '
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {}
            },
            {
              'cmdname' => 'tab',
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
                      'text' => 'another tab
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {}
            }
          ],
          'parent' => {},
          'special' => {
            'cell_number' => 2
          },
          'type' => 'row'
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'mu--ltitable item '
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {}
            },
            {
              'cmdname' => 'tab',
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
                      'text' => 'multitable tab
'
                    },
                    {
                      'args' => [
                        {
                          'parent' => {},
                          'text' => ' comment in multitable
',
                          'type' => 'misc_arg'
                        }
                      ],
                      'cmdname' => 'c',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {}
            }
          ],
          'parent' => {},
          'special' => {
            'cell_number' => 2
          },
          'type' => 'row'
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'mu--ltitable item 2 '
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {}
            },
            {
              'cmdname' => 'tab',
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
                      'text' => 'multitable tab 2
'
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
                              'text' => 'index entry within multitable'
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
                  'type' => 'paragraph'
                }
              ],
              'parent' => {}
            }
          ],
          'parent' => {},
          'special' => {
            'cell_number' => 2
          },
          'type' => 'row'
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'lone mu--ltitable item
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {}
            }
          ],
          'parent' => {},
          'special' => {
            'cell_number' => 1
          },
          'type' => 'row'
        }
      ],
      'parent' => {},
      'special' => {
        'max_columns' => 2
      }
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
              'text' => ' '
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'bidule'
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'truc '
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {}
            },
            {
              'cmdname' => 'tab',
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
                      'text' => 'bidule
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {}
            }
          ],
          'parent' => {},
          'special' => {
            'cell_number' => 2
          },
          'type' => 'row'
        }
      ],
      'parent' => {},
      'special' => {
        'max_columns' => 2,
        'prototypes' => [
          {},
          {}
        ]
      }
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
$result_trees{'multitable'}{'contents'}[0]{'parent'} = $result_trees{'multitable'};
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'multitable'}{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[3];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[3];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'multitable'}{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[4]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[4]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[4];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'multitable'}{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'parent'} = $result_trees{'multitable'};
$result_trees{'multitable'}{'contents'}[2]{'parent'} = $result_trees{'multitable'};
$result_trees{'multitable'}{'contents'}[3]{'parent'} = $result_trees{'multitable'};
$result_trees{'multitable'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[4]{'args'}[0];
$result_trees{'multitable'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[4]{'args'}[0];
$result_trees{'multitable'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable'}{'contents'}[4]{'args'}[0];
$result_trees{'multitable'}{'contents'}[4]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[4]{'args'}[0]{'contents'}[3];
$result_trees{'multitable'}{'contents'}[4]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'multitable'}{'contents'}[4]{'args'}[0];
$result_trees{'multitable'}{'contents'}[4]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'multitable'}{'contents'}[4]{'args'}[0];
$result_trees{'multitable'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[4];
$result_trees{'multitable'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[4];
$result_trees{'multitable'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[4]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[4]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[4]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[4]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[4];
$result_trees{'multitable'}{'contents'}[4]{'parent'} = $result_trees{'multitable'};
$result_trees{'multitable'}{'contents'}[4]{'special'}{'prototypes'}[0] = $result_trees{'multitable'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[4]{'special'}{'prototypes'}[1] = $result_trees{'multitable'}{'contents'}[4]{'args'}[0]{'contents'}[3];
$result_trees{'multitable'}{'contents'}[5]{'parent'} = $result_trees{'multitable'};

$result_texis{'multitable'} = '
@multitable @columnfractions 6 7
@headitem mu--ltitable headitem @tab another tab
@item mu--ltitable item @tab multitable tab
@c comment in multitable
@item mu--ltitable item 2 @tab multitable tab 2
@cindex index entry within multitable
@item lone mu--ltitable item
@end multitable

@multitable {truc} {bidule}
@item truc @tab bidule
@end multitable
';


$result_texts{'multitable'} = '
mu--ltitable headitem another tab
mu--ltitable item multitable tab
mu--ltitable item 2 multitable tab 2
lone mu--ltitable item

truc bidule
';

$result_errors{'multitable'} = [];


