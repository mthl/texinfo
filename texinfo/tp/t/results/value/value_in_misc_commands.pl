use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'value_in_misc_commands'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'text',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'atext',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' text atext
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'Top'
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
      'cmdname' => 'node',
      'parent' => {},
      'remaining_args' => 4
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
              'text' => 'top atext'
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
      'cmdname' => 'top',
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
              'parent' => {},
              'text' => 'Comment like: atext'
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
      'cmdname' => 'subheading',
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
          'text' => 'Text line followed by a comment on the same line and another below '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' comment @value{text}
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
              'parent' => {},
              'text' => ' comment @value{text}
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
          'text' => 'pagesizes_arg',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '200mm,150mm',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' pagesizes_arg 200mm,150mm
'
      }
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'afourpaper_macro',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@afourpaper',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' afourpaper_macro @afourpaper
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => '200mm,150mm'
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
      'cmdname' => 'pagesizes',
      'parent' => {}
    },
    {
      'cmdname' => 'afourpaper',
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
              'parent' => {},
              'text' => 'on line following headings atext'
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
      'cmdname' => 'headings',
      'parent' => {}
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => ' some text ignored @value{text}
',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'oddfooting',
      'parent' => {}
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => ' on line following everyheading @value{text}
',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'everyheading',
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
          'text' => 'need_arg',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '0.1',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' need_arg 0.1
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => '0.1'
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
      'cmdname' => 'need',
      'parent' => {},
      'special' => {
        'misc_args' => [
          '0.1'
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
          'text' => 'raisesections_macro',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@raisesections',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' raisesections_macro @raisesections
'
      }
    },
    {
      'cmdname' => 'raisesections',
      'parent' => {}
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'lowersections_macro',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@lowersections',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' lowersections_macro @lowersections
'
      }
    },
    {
      'cmdname' => 'lowersections',
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
          'text' => ' tex error: Use of \\ doesn\'t match its definition.
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
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'definfoenclose phoo,//,\\\\  '
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
                  'text' => 'phoo,//,\\\\'
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
          'cmdname' => 'definfoenclose',
          'parent' => {},
          'special' => {
            'misc_args' => [
              'phoo',
              '//',
              '\\\\'
            ]
          }
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
                  'text' => 'bar'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'phoo',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0,
          'special' => {
            'begin' => '//',
            'end' => '\\\\'
          },
          'type' => 'definfoenclose_command'
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
      'args' => [
        {
          'parent' => {},
          'text' => 'definfoenclose_name',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'phi',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' definfoenclose_name phi
'
      }
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
              'text' => 'phi,:,:'
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
      'cmdname' => 'definfoenclose',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'phi',
          ':',
          ':'
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
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'bar'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'phi',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0,
          'special' => {
            'begin' => ':',
            'end' => ':'
          },
          'type' => 'definfoenclose_command'
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
      'args' => [
        {
          'parent' => {},
          'text' => 'strong_macro',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@strong',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' strong_macro @strong
'
      }
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'strong_name',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'strong',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' strong_name strong
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
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'very strong'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'strong',
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
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'strong,(strong:,:)'
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
      'cmdname' => 'definfoenclose',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'strong',
          '(strong:',
          ':)'
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
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' is it really strong? '
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'strong',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0,
          'special' => {
            'begin' => '(strong:',
            'end' => ':)'
          },
          'type' => 'definfoenclose_command'
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
                  'text' => 'something before kbdinputstyle'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'kbd',
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
          'text' => 'kbdinputstyle_arg',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'code',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' kbdinputstyle_arg code
'
      }
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
              'text' => 'code'
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
      'cmdname' => 'kbdinputstyle',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'code'
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
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'truc'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'kbd',
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
      'type' => 'paragraph'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'example',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'example'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'kbd',
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
          'parent' => {},
          'text' => 'asis_arg',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'asis',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' asis_arg asis
'
      }
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'zero',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '0',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' zero 0
'
      }
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'none_arg',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'none',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' none_arg none
'
      }
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'four',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '4',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' four 4
'
      }
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'six',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '6',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' six 6
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'asis'
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
      'cmdname' => 'paragraphindent',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'asis'
        ]
      }
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
              'text' => '0'
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
      'cmdname' => 'paragraphindent',
      'parent' => {},
      'special' => {
        'misc_args' => [
          '0'
        ]
      }
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
              'text' => 'none'
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
      'cmdname' => 'paragraphindent',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'none'
        ]
      }
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
              'text' => '4'
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
      'cmdname' => 'paragraphindent',
      'parent' => {},
      'special' => {
        'misc_args' => [
          '4'
        ]
      }
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
              'text' => 'none'
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
      'cmdname' => 'firstparagraphindent',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'none'
        ]
      }
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
              'text' => '6'
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
      'cmdname' => 'exampleindent',
      'parent' => {},
      'special' => {
        'misc_args' => [
          '6'
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
          'text' => 'end_arg',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'end',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' end_arg end
'
      }
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'separate_arg',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'separate',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' separate_arg separate 
'
      }
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
              'text' => 'end'
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
      'cmdname' => 'footnotestyle',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'end'
        ]
      }
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
              'text' => 'separate'
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
      'cmdname' => 'footnotestyle',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'separate'
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
          'text' => 'latin1',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'ISO-8859-1',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' latin1 ISO-8859-1
'
      }
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
              'text' => 'ISO-8859-1'
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
      'cmdname' => 'documentencoding',
      'parent' => {},
      'special' => {
        'text_arg' => 'ISO-8859-1'
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
                  'text' => '  ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'en'
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
          'cmdname' => 'documentlanguage',
          'parent' => {},
          'special' => {
            'text_arg' => 'en'
          }
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
                  'text' => '  ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'en'
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
          'cmdname' => 'documentlanguage',
          'parent' => {},
          'special' => {
            'text_arg' => 'en'
          }
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
          'text' => 'on_arg',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'on',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' on_arg on
'
      }
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'off_arg',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'off',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' off_arg off
'
      }
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
              'text' => 'on'
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
      'cmdname' => 'frenchspacing',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'on'
        ]
      }
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
              'text' => 'off'
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
      'cmdname' => 'frenchspacing',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'off'
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
          'text' => ' accepts 10 or 11
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
          'parent' => {},
          'text' => 'ten',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '10',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' ten 10
'
      }
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
              'text' => '10'
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
      'cmdname' => 'fonttextsize',
      'parent' => {},
      'special' => {
        'misc_args' => [
          '10'
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
          'text' => ' accept false or true
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
          'parent' => {},
          'text' => ' makeinfo don\'t care about the arg and remove the remaining of the line
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
          'parent' => {},
          'text' => 'false_arg',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'false',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' false_arg false
'
      }
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'true_arg',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'true',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' true_arg true
'
      }
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
              'text' => 'false'
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
      'cmdname' => 'allowcodebreaks',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'false'
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'true'
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
      'cmdname' => 'allowcodebreaks',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'true'
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
          'text' => 'page_macro',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@page',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' page_macro @page
'
      }
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'noindent_macro',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@noindent',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' noindent_macro @noindent
'
      }
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'refill_macro',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@refill',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' refill_macro @refill
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
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'page '
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'page',
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'noindent',
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '     ',
      'type' => 'empty_spaces_after_command'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'noindent at beginning of line
'
        },
        {
          'cmdname' => 'noindent',
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
          'text' => 'noindent on the preceding line
'
        },
        {
          'parent' => {},
          'text' => '  '
        },
        {
          'cmdname' => 'noindent',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '    ',
          'type' => 'empty_spaces_after_command'
        },
        {
          'parent' => {},
          'text' => 'noindent after space at beginning of line
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'page',
      'parent' => {}
    },
    {
      'cmdname' => 'page',
      'parent' => {}
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'After page on it\'s own line.
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
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'page '
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'page',
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
          'text' => 'contents_macro',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@contents',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' contents_macro @contents
'
      }
    },
    {
      'cmdname' => 'contents',
      'parent' => {}
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
          'parent' => {},
          'text' => ' @value{text}
',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'vskip',
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
          'text' => 'cropmarks_command',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@cropmarks',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' cropmarks_command @cropmarks
'
      }
    },
    {
      'cmdname' => 'cropmarks',
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
          'text' => 'exdent_macro',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@exdent',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' exdent_macro @exdent
'
      }
    },
    {
      'cmdname' => 'exdent',
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => ' ',
      'type' => 'empty_spaces_after_command'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'line after exdent
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
          'text' => 'two',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '2',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' two 2
'
      }
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
              'text' => '2'
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
      'cmdname' => 'sp',
      'parent' => {},
      'special' => {
        'misc_args' => [
          '2'
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
          'text' => 'result_macro',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@result',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' result_macro @result
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
          'parent' => {},
          'text' => '@value',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'clickstyle',
      'parent' => {},
      'special' => {
        'arg_line' => ' @value{result_macro}
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
      'cmdname' => 'contents',
      'parent' => {}
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
          'parent' => {},
          'text' => 'shortcontents_macro',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@shortcontents',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' shortcontents_macro @shortcontents
'
      }
    },
    {
      'cmdname' => 'shortcontents',
      'parent' => {}
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
          'parent' => {},
          'text' => 'bye_macro',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '@bye',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' bye_macro @bye
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
      'cmdname' => 'bye',
      'parent' => {}
    }
  ]
};
$result_trees{'value_in_misc_commands'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[2]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[2]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[2]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[2];
$result_trees{'value_in_misc_commands'}{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[3];
$result_trees{'value_in_misc_commands'}{'contents'}[3]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[4]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[4]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[4]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[4];
$result_trees{'value_in_misc_commands'}{'contents'}[4]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[5]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[6];
$result_trees{'value_in_misc_commands'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[6]{'contents'}[1];
$result_trees{'value_in_misc_commands'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[6];
$result_trees{'value_in_misc_commands'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[6]{'contents'}[2];
$result_trees{'value_in_misc_commands'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[6];
$result_trees{'value_in_misc_commands'}{'contents'}[6]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[7]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[8];
$result_trees{'value_in_misc_commands'}{'contents'}[8]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[8];
$result_trees{'value_in_misc_commands'}{'contents'}[8]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[9];
$result_trees{'value_in_misc_commands'}{'contents'}[9]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[9];
$result_trees{'value_in_misc_commands'}{'contents'}[9]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[10]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[11]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[11]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[11]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[11]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[11];
$result_trees{'value_in_misc_commands'}{'contents'}[11]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[12]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[13]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[13]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[13]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[13]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[13];
$result_trees{'value_in_misc_commands'}{'contents'}[13]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[14];
$result_trees{'value_in_misc_commands'}{'contents'}[14]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[15];
$result_trees{'value_in_misc_commands'}{'contents'}[15]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[16]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[17]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[17];
$result_trees{'value_in_misc_commands'}{'contents'}[17]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[17];
$result_trees{'value_in_misc_commands'}{'contents'}[17]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[18]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[19]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[19]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[19]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[19]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[19]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[19]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[19]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[19];
$result_trees{'value_in_misc_commands'}{'contents'}[19]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[20]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[21]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[21];
$result_trees{'value_in_misc_commands'}{'contents'}[21]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[21];
$result_trees{'value_in_misc_commands'}{'contents'}[21]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[22]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[23]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[23];
$result_trees{'value_in_misc_commands'}{'contents'}[23]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[23];
$result_trees{'value_in_misc_commands'}{'contents'}[23]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[24]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[25]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[26]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[26];
$result_trees{'value_in_misc_commands'}{'contents'}[26]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[27]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[27];
$result_trees{'value_in_misc_commands'}{'contents'}[27]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[27];
$result_trees{'value_in_misc_commands'}{'contents'}[27]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[27]{'contents'}[2]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[27]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[27]{'contents'}[2]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[27]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[27]{'contents'}[2]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[27]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[27]{'contents'}[2];
$result_trees{'value_in_misc_commands'}{'contents'}[27]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[27];
$result_trees{'value_in_misc_commands'}{'contents'}[27]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[28]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[29]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[29]{'contents'}[0]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[29]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[29]{'contents'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[29]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[29];
$result_trees{'value_in_misc_commands'}{'contents'}[29]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[29];
$result_trees{'value_in_misc_commands'}{'contents'}[29]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[30]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[31]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[31];
$result_trees{'value_in_misc_commands'}{'contents'}[31]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[31];
$result_trees{'value_in_misc_commands'}{'contents'}[31]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[32]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[32]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[32]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[32]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[32]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[32]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[32]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[32];
$result_trees{'value_in_misc_commands'}{'contents'}[32]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[33]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[34]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[34]{'contents'}[0]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[34]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[34]{'contents'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[34]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[34];
$result_trees{'value_in_misc_commands'}{'contents'}[34]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[34];
$result_trees{'value_in_misc_commands'}{'contents'}[34]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[35]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[36]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[36];
$result_trees{'value_in_misc_commands'}{'contents'}[36]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[36];
$result_trees{'value_in_misc_commands'}{'contents'}[36]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[37]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[37];
$result_trees{'value_in_misc_commands'}{'contents'}[37]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[37];
$result_trees{'value_in_misc_commands'}{'contents'}[37]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[38]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[39]{'contents'}[0]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[39]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[39]{'contents'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[39]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[39];
$result_trees{'value_in_misc_commands'}{'contents'}[39]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[39];
$result_trees{'value_in_misc_commands'}{'contents'}[39]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[40]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[41]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[41]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[41]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[41]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[41]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[41]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[41]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[41];
$result_trees{'value_in_misc_commands'}{'contents'}[41]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[42]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[43]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[43]{'contents'}[0]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[43]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[43]{'contents'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[43]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[43];
$result_trees{'value_in_misc_commands'}{'contents'}[43]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[43];
$result_trees{'value_in_misc_commands'}{'contents'}[43]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[44]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[45]{'contents'}[0]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[45]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[45]{'contents'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[45]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[45];
$result_trees{'value_in_misc_commands'}{'contents'}[45]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[45];
$result_trees{'value_in_misc_commands'}{'contents'}[45]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[46]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[47]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[47];
$result_trees{'value_in_misc_commands'}{'contents'}[47]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[47];
$result_trees{'value_in_misc_commands'}{'contents'}[47]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[48]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[48]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[48]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[48]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[48]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[48]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[48]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[48];
$result_trees{'value_in_misc_commands'}{'contents'}[48]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[49]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[50]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[50]{'contents'}[0]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[50]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[50]{'contents'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[50]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[50];
$result_trees{'value_in_misc_commands'}{'contents'}[50]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[50];
$result_trees{'value_in_misc_commands'}{'contents'}[50]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[51]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[52]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[52];
$result_trees{'value_in_misc_commands'}{'contents'}[52]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[52]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[52]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[52]{'contents'}[1];
$result_trees{'value_in_misc_commands'}{'contents'}[52]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[52];
$result_trees{'value_in_misc_commands'}{'contents'}[52]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[52];
$result_trees{'value_in_misc_commands'}{'contents'}[52]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[53]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[54]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[55]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[55];
$result_trees{'value_in_misc_commands'}{'contents'}[55]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[55];
$result_trees{'value_in_misc_commands'}{'contents'}[55]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[56]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[56];
$result_trees{'value_in_misc_commands'}{'contents'}[56]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[56];
$result_trees{'value_in_misc_commands'}{'contents'}[56]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[57]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[57];
$result_trees{'value_in_misc_commands'}{'contents'}[57]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[57];
$result_trees{'value_in_misc_commands'}{'contents'}[57]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[58]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[58];
$result_trees{'value_in_misc_commands'}{'contents'}[58]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[58];
$result_trees{'value_in_misc_commands'}{'contents'}[58]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[59]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[59];
$result_trees{'value_in_misc_commands'}{'contents'}[59]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[59];
$result_trees{'value_in_misc_commands'}{'contents'}[59]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[60]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[61]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[61]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[61]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[61]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[61]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[61]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[61]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[61];
$result_trees{'value_in_misc_commands'}{'contents'}[61]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[62]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[62]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[62]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[62]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[62]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[62]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[62]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[62];
$result_trees{'value_in_misc_commands'}{'contents'}[62]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[63]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[63]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[63]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[63]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[63]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[63]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[63]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[63];
$result_trees{'value_in_misc_commands'}{'contents'}[63]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[64]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[64]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[64]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[64]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[64]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[64]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[64]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[64];
$result_trees{'value_in_misc_commands'}{'contents'}[64]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[65]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[65]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[65]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[65]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[65]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[65]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[65]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[65];
$result_trees{'value_in_misc_commands'}{'contents'}[65]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[66]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[66]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[66]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[66]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[66]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[66]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[66]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[66];
$result_trees{'value_in_misc_commands'}{'contents'}[66]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[67]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[68]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[68];
$result_trees{'value_in_misc_commands'}{'contents'}[68]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[68];
$result_trees{'value_in_misc_commands'}{'contents'}[68]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[69]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[69];
$result_trees{'value_in_misc_commands'}{'contents'}[69]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[69];
$result_trees{'value_in_misc_commands'}{'contents'}[69]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[70]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[70]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[70]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[70]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[70]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[70]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[70]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[70];
$result_trees{'value_in_misc_commands'}{'contents'}[70]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[71]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[71]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[71]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[71]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[71]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[71]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[71]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[71];
$result_trees{'value_in_misc_commands'}{'contents'}[71]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[72]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[73]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[73];
$result_trees{'value_in_misc_commands'}{'contents'}[73]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[73];
$result_trees{'value_in_misc_commands'}{'contents'}[73]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[74]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[74]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[74]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[74]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[74]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[74]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[74]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[74];
$result_trees{'value_in_misc_commands'}{'contents'}[74]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[75]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[76]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[76];
$result_trees{'value_in_misc_commands'}{'contents'}[76]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[76];
$result_trees{'value_in_misc_commands'}{'contents'}[76]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[77]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[77];
$result_trees{'value_in_misc_commands'}{'contents'}[77]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[77];
$result_trees{'value_in_misc_commands'}{'contents'}[77]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[78]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[79]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[79];
$result_trees{'value_in_misc_commands'}{'contents'}[79]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[79]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[79]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[79]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[79]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[79]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[79]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[79]{'contents'}[1];
$result_trees{'value_in_misc_commands'}{'contents'}[79]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[79];
$result_trees{'value_in_misc_commands'}{'contents'}[79]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[80]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[81]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[81];
$result_trees{'value_in_misc_commands'}{'contents'}[81]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[81]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[81]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[81]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[81]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[81]{'contents'}[1]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[81]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[81]{'contents'}[1];
$result_trees{'value_in_misc_commands'}{'contents'}[81]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[81];
$result_trees{'value_in_misc_commands'}{'contents'}[81]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[81];
$result_trees{'value_in_misc_commands'}{'contents'}[81]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[82]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[83]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[83];
$result_trees{'value_in_misc_commands'}{'contents'}[83]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[83];
$result_trees{'value_in_misc_commands'}{'contents'}[83]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[84]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[84];
$result_trees{'value_in_misc_commands'}{'contents'}[84]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[84];
$result_trees{'value_in_misc_commands'}{'contents'}[84]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[85]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[85]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[85]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[85]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[85]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[85]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[85]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[85];
$result_trees{'value_in_misc_commands'}{'contents'}[85]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[86]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[86]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[86]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[86]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[86]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[86]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[86]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[86];
$result_trees{'value_in_misc_commands'}{'contents'}[86]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[87]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[88]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[88];
$result_trees{'value_in_misc_commands'}{'contents'}[88]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[89]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[89];
$result_trees{'value_in_misc_commands'}{'contents'}[89]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[89];
$result_trees{'value_in_misc_commands'}{'contents'}[89]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[90]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[90]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[90]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[90]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[90]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[90]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[90]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[90];
$result_trees{'value_in_misc_commands'}{'contents'}[90]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[91]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[92]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[92];
$result_trees{'value_in_misc_commands'}{'contents'}[92]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[93]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[93];
$result_trees{'value_in_misc_commands'}{'contents'}[93]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[94]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[94];
$result_trees{'value_in_misc_commands'}{'contents'}[94]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[94];
$result_trees{'value_in_misc_commands'}{'contents'}[94]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[95]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[95];
$result_trees{'value_in_misc_commands'}{'contents'}[95]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[95];
$result_trees{'value_in_misc_commands'}{'contents'}[95]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[96]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[96]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[96]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[96]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[96]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[96]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[96]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[96];
$result_trees{'value_in_misc_commands'}{'contents'}[96]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[97]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[98]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[98]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[98]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[98]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[98]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[98]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[98]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[98];
$result_trees{'value_in_misc_commands'}{'contents'}[98]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[99]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[100]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[100];
$result_trees{'value_in_misc_commands'}{'contents'}[100]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[100];
$result_trees{'value_in_misc_commands'}{'contents'}[100]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[101]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[101];
$result_trees{'value_in_misc_commands'}{'contents'}[101]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[101];
$result_trees{'value_in_misc_commands'}{'contents'}[101]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[102]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[102];
$result_trees{'value_in_misc_commands'}{'contents'}[102]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[102];
$result_trees{'value_in_misc_commands'}{'contents'}[102]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[103]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[104]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[104];
$result_trees{'value_in_misc_commands'}{'contents'}[104]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[104];
$result_trees{'value_in_misc_commands'}{'contents'}[104]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[105]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[106]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[107]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[108]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[109]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[109];
$result_trees{'value_in_misc_commands'}{'contents'}[109]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[109];
$result_trees{'value_in_misc_commands'}{'contents'}[109]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[109];
$result_trees{'value_in_misc_commands'}{'contents'}[109]{'contents'}[3]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[109];
$result_trees{'value_in_misc_commands'}{'contents'}[109]{'contents'}[4]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[109];
$result_trees{'value_in_misc_commands'}{'contents'}[109]{'contents'}[5]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[109];
$result_trees{'value_in_misc_commands'}{'contents'}[109]{'contents'}[6]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[109];
$result_trees{'value_in_misc_commands'}{'contents'}[109]{'contents'}[7]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[109];
$result_trees{'value_in_misc_commands'}{'contents'}[109]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[110]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[111]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[112]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[112];
$result_trees{'value_in_misc_commands'}{'contents'}[112]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[113]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[114]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[114];
$result_trees{'value_in_misc_commands'}{'contents'}[114]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[114];
$result_trees{'value_in_misc_commands'}{'contents'}[114]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[115]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[116]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[117]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[117];
$result_trees{'value_in_misc_commands'}{'contents'}[117]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[117];
$result_trees{'value_in_misc_commands'}{'contents'}[117]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[118]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[119]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[120]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[121]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[121];
$result_trees{'value_in_misc_commands'}{'contents'}[121]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[122]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[123]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[123];
$result_trees{'value_in_misc_commands'}{'contents'}[123]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[123];
$result_trees{'value_in_misc_commands'}{'contents'}[123]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[124]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[125]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[126]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[126];
$result_trees{'value_in_misc_commands'}{'contents'}[126]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[126];
$result_trees{'value_in_misc_commands'}{'contents'}[126]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[127]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[128]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[129]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[129];
$result_trees{'value_in_misc_commands'}{'contents'}[129]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[130]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[131]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[131];
$result_trees{'value_in_misc_commands'}{'contents'}[131]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[131];
$result_trees{'value_in_misc_commands'}{'contents'}[131]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[132]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[132]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[132]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[132]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[132]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[132]{'args'}[0];
$result_trees{'value_in_misc_commands'}{'contents'}[132]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[132];
$result_trees{'value_in_misc_commands'}{'contents'}[132]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[133]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[134]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[134];
$result_trees{'value_in_misc_commands'}{'contents'}[134]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[134];
$result_trees{'value_in_misc_commands'}{'contents'}[134]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[135]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[136]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[136];
$result_trees{'value_in_misc_commands'}{'contents'}[136]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[137]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[138]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[139]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[140]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[141]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[141];
$result_trees{'value_in_misc_commands'}{'contents'}[141]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[141];
$result_trees{'value_in_misc_commands'}{'contents'}[141]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[142]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[143]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[144]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[145]{'args'}[0]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[145];
$result_trees{'value_in_misc_commands'}{'contents'}[145]{'args'}[1]{'parent'} = $result_trees{'value_in_misc_commands'}{'contents'}[145];
$result_trees{'value_in_misc_commands'}{'contents'}[145]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[146]{'parent'} = $result_trees{'value_in_misc_commands'};
$result_trees{'value_in_misc_commands'}{'contents'}[147]{'parent'} = $result_trees{'value_in_misc_commands'};

$result_texis{'value_in_misc_commands'} = '@set text atext

@node Top
@top top atext
@subheading Comment like: atext

Text line followed by a comment on the same line and another below @c comment @value{text}
@c comment @value{text}

@set pagesizes_arg 200mm,150mm
@set afourpaper_macro @afourpaper

@pagesizes 200mm,150mm
@afourpaper
@headings on line following headings atext
@oddfooting some text ignored @value{text}
@everyheading on line following everyheading @value{text}

@set need_arg 0.1

@need 0.1

@set raisesections_macro @raisesections
@raisesections
@set lowersections_macro @lowersections
@lowersections

@c tex error: Use of \\ doesn\'t match its definition.
@@definfoenclose phoo,//,\\\\  @definfoenclose phoo,//,\\\\

@phoo{bar}

@set definfoenclose_name phi
@definfoenclose phi,:,:

@phi{bar}

@set strong_macro @strong
@set strong_name strong

@strong{very strong}

@definfoenclose strong,(strong:,:)

@strong{ is it really strong? }

@kbd{something before kbdinputstyle}

@set kbdinputstyle_arg code
@kbdinputstyle code

@kbd{truc}

@example
@kbd{example}
@end example

@set asis_arg asis
@set zero 0
@set none_arg none
@set four 4
@set six 6

@paragraphindent asis
@paragraphindent 0
@paragraphindent none
@paragraphindent 4
@firstparagraphindent none
@exampleindent 6

@set end_arg end
@set separate_arg separate 
@footnotestyle end
@footnotestyle separate

@set latin1 ISO-8859-1
@documentencoding ISO-8859-1

@set en en
@set documentlanguage_command @documentlanguage

documentlanguage @documentlanguage  en

documentlanguage on its line
@documentlanguage  en
line following documentlanguage

@set on_arg on
@set off_arg off
@frenchspacing on
@frenchspacing off

@c accepts 10 or 11
@set ten 10
@fonttextsize 10

@c accept false or true
@c makeinfo don\'t care about the arg and remove the remaining of the line
@set false_arg false
@set true_arg true
@allowcodebreaks false

@allowcodebreaks true

@set page_macro @page
@set noindent_macro @noindent
@set refill_macro @refill

@@page @page

@noindent     noindent at beginning of line
@noindent
noindent on the preceding line
  @noindent    noindent after space at beginning of line
@page
@page
After page on it\'s own line.

@@page @page

@set contents_macro @contents
@contents

@vskip @value{text}

@set cropmarks_command @cropmarks
@cropmarks

@set exdent_macro @exdent
@exdent line after exdent

@set two 2
@sp 2

@set result_macro @result

@clickstyle @value{result_macro}

@contents

@set shortcontents_macro @shortcontents
@shortcontents

@set bye_macro @bye

@bye
';


$result_texts{'value_in_misc_commands'} = '
top atext
Comment like: atext

Text line followed by a comment on the same line and another below 





@definfoenclose phoo,//,\\\\  
bar


bar


very strong


 is it really strong? 

something before kbdinputstyle


truc

example






documentlanguage 
documentlanguage on its line
line following documentlanguage






@page 
noindent at beginning of line
noindent on the preceding line
  noindent after space at beginning of line
After page on it\'s own line.

@page 




line after exdent











';

$result_errors{'value_in_misc_commands'} = [
  {
    'error_line' => ':17: Bad argument to @headings: on line following headings atext
',
    'file_name' => '',
    'line_nr' => 17,
    'macro' => '',
    'text' => 'Bad argument to @headings: on line following headings atext',
    'type' => 'error'
  },
  {
    'error_line' => ':34: warning: @definfoenclose should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 34,
    'macro' => '',
    'text' => '@definfoenclose should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':88: warning: @documentlanguage should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 88,
    'macro' => '',
    'text' => '@documentlanguage should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':115: warning: @page should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 115,
    'macro' => '',
    'text' => '@page should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':125: warning: @page should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 125,
    'macro' => '',
    'text' => '@page should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':143: warning: Remaining argument on @clickstyle line: {result_macro}
',
    'file_name' => '',
    'line_nr' => 143,
    'macro' => '',
    'text' => 'Remaining argument on @clickstyle line: {result_macro}',
    'type' => 'warning'
  }
];


