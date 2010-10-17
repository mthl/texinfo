use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'macro_in_misc_commands'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'text',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'atext
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' text 
',
        'macrobody' => 'atext
'
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
          'parent' => {},
          'text' => 'Top',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'Top
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' Top
',
        'macrobody' => 'Top
'
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
              'parent' => {},
              'text' => 'Top
'
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
              'text' => 'top atext
'
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
              'text' => 'Comment like: atext
'
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
              'text' => ' comment @text{}
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
              'text' => ' comment @text{}
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
          'text' => 'pagesizes-arg',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '200mm,150mm
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' pagesizes-arg
',
        'macrobody' => '200mm,150mm
'
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
          'parent' => {},
          'text' => 'afourpaper-macro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@afourpaper
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' afourpaper-macro 
',
        'macrobody' => '@afourpaper
'
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
              'parent' => {},
              'text' => '200mm,150mm
'
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
              'text' => 'on line following headings atext
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'headings',
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
          'parent' => {},
          'text' => ' some text ignored @text{}
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
          'text' => ' on line following everyheading @text{}
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
          'text' => 'need-arg',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '0.1
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' need-arg
',
        'macrobody' => '0.1
'
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
              'parent' => {},
              'text' => '0.1
'
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
          'text' => 'raisesections-macro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@raisesections
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' raisesections-macro 
',
        'macrobody' => '@raisesections
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'cmdname' => 'raisesections',
      'parent' => {}
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'lowersections-macro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@lowersections
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' lowersections-macro 
',
        'macrobody' => '@lowersections
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
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
                  'text' => 'phoo,//,\\\\
'
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
          'text' => 'definfoenclose-name',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'phi
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' definfoenclose-name 
',
        'macrobody' => 'phi
'
      }
    },
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'phi,:,:
'
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
          'text' => 'strong-macro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@strong
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' strong-macro 
',
        'macrobody' => '@strong
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'strong-name',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'strong
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' strong-name 
',
        'macrobody' => 'strong
'
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
              'text' => 'strong,(strong:,:)
'
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
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'is it really strong? '
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
          'text' => 'kbdinputstyle-arg',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'code
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' kbdinputstyle-arg 
',
        'macrobody' => 'code
'
      }
    },
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'code
'
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
          'text' => 'asis-arg',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'asis
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' asis-arg 
',
        'macrobody' => 'asis
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'zero',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '0
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' zero 
',
        'macrobody' => '0
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'none-arg',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'none
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' none-arg 
',
        'macrobody' => 'none
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'four',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '4
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' four 
',
        'macrobody' => '4
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'six',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '6
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' six 
',
        'macrobody' => '6
'
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
              'parent' => {},
              'text' => 'asis
'
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
              'text' => '0
'
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
              'text' => 'none
'
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
              'text' => '4
'
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
              'text' => 'none
'
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
              'text' => '6
'
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
          'text' => 'end-arg',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'end
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' end-arg 
',
        'macrobody' => 'end
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'separate-arg',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'separate 
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' separate-arg 
',
        'macrobody' => 'separate 
'
      }
    },
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'end
'
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
              'text' => 'separate 
'
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
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'ISO-8859-1
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' latin1 
',
        'macrobody' => 'ISO-8859-1
'
      }
    },
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'ISO-8859-1
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'documentencoding',
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
          'text' => 'on-arg',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'on
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' on-arg 
',
        'macrobody' => 'on
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'off-arg',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'off
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' off-arg 
',
        'macrobody' => 'off
'
      }
    },
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'on
'
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
              'text' => 'off
'
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
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '10
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' ten 
',
        'macrobody' => '10
'
      }
    },
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => '10
'
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
          'text' => 'false-arg',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'false
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' false-arg 
',
        'macrobody' => 'false
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'true-arg',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'true
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' true-arg
',
        'macrobody' => 'true
'
      }
    },
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'false
'
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
              'text' => 'true
'
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
          'text' => 'page-macro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@page
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' page-macro 
',
        'macrobody' => '@page
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'noindent-macro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@noindent
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' noindent-macro 
',
        'macrobody' => '@noindent
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'refill-macro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@refill
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' refill-macro 
',
        'macrobody' => '@refill
'
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
      'contents' => [
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'noindent '
        },
        {
          'cmdname' => 'noindent',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' ',
          'type' => 'empty_spaces_after_command'
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'refill '
        },
        {
          'cmdname' => 'refill',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' something
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
          'text' => 'After page on its own line.
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'two spaces   '
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'noindent '
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
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'refill '
        },
        {
          'cmdname' => 'refill',
          'parent' => {}
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
          'text' => 'contents-macro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@contents
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' contents-macro 
',
        'macrobody' => '@contents
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
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
          'text' => ' @atext{}
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
          'text' => 'cropmarks-macro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@cropmarks
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' cropmarks-macro
',
        'macrobody' => '@cropmarks
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
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
          'text' => 'exdent-macro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@exdent
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' exdent-macro 
',
        'macrobody' => '@exdent
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
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
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '2
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' two 
',
        'macrobody' => '2
'
      }
    },
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => '2
'
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
          'text' => 'result-macro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@result
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' result-macro 
',
        'macrobody' => '@result
'
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
          'parent' => {},
          'text' => '@result-macro',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'clickstyle',
      'parent' => {},
      'special' => {
        'arg_line' => ' @result-macro{}
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
      'cmdname' => 'menu',
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
              'parent' => {},
              'text' => '* ',
              'type' => 'menu_entry_leading_text'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'node atext'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '::',
              'type' => 'menu_entry_separator'
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
              'type' => 'menu_entry_description'
            }
          ],
          'parent' => {},
          'type' => 'menu_entry'
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
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'node atext
'
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
              'text' => 'chapter
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'chapter',
      'parent' => {}
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
          'text' => 'shortcontents-macro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@shortcontents
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' shortcontents-macro 
',
        'macrobody' => '@shortcontents
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
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
          'text' => 'bye-macro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@bye
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' bye-macro
',
        'macrobody' => '@bye
'
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
      'cmdname' => 'bye',
      'parent' => {}
    }
  ]
};
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[3]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[5]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[6]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[6]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[6];
$result_trees{'macro_in_misc_commands'}{'contents'}[6]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[7]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[7]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[7];
$result_trees{'macro_in_misc_commands'}{'contents'}[7]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[8]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[8]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[8];
$result_trees{'macro_in_misc_commands'}{'contents'}[8]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[9]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[10];
$result_trees{'macro_in_misc_commands'}{'contents'}[10]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[10]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[10];
$result_trees{'macro_in_misc_commands'}{'contents'}[10]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[10]{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[10]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[10];
$result_trees{'macro_in_misc_commands'}{'contents'}[10]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[11]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[12];
$result_trees{'macro_in_misc_commands'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[12];
$result_trees{'macro_in_misc_commands'}{'contents'}[12]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[13]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[14]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[15];
$result_trees{'macro_in_misc_commands'}{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[15];
$result_trees{'macro_in_misc_commands'}{'contents'}[15]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[16]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[17]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[18]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[18]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[18]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[18]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[18]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[18];
$result_trees{'macro_in_misc_commands'}{'contents'}[18]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[19]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[20]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[20]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[20]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[20]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[20]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[20];
$result_trees{'macro_in_misc_commands'}{'contents'}[20]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[21]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[21];
$result_trees{'macro_in_misc_commands'}{'contents'}[21]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[22]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[22];
$result_trees{'macro_in_misc_commands'}{'contents'}[22]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[23]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[24]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[24];
$result_trees{'macro_in_misc_commands'}{'contents'}[24]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[24];
$result_trees{'macro_in_misc_commands'}{'contents'}[24]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[25]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[26]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[27]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[27]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[27]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[27]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[27]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[27];
$result_trees{'macro_in_misc_commands'}{'contents'}[27]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[28]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[29]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[29];
$result_trees{'macro_in_misc_commands'}{'contents'}[29]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[29];
$result_trees{'macro_in_misc_commands'}{'contents'}[29]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[30]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[31]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[32]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[32];
$result_trees{'macro_in_misc_commands'}{'contents'}[32]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[32];
$result_trees{'macro_in_misc_commands'}{'contents'}[32]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[33]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[34]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[35]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[36]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[36];
$result_trees{'macro_in_misc_commands'}{'contents'}[36]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[36];
$result_trees{'macro_in_misc_commands'}{'contents'}[36]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[36]{'contents'}[2]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[36]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[36]{'contents'}[2]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[36]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[36]{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[36]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[36];
$result_trees{'macro_in_misc_commands'}{'contents'}[36]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[37]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[38]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[38]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[38]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[38]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[38]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[38];
$result_trees{'macro_in_misc_commands'}{'contents'}[38]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[38];
$result_trees{'macro_in_misc_commands'}{'contents'}[38]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[39]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[40]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[40];
$result_trees{'macro_in_misc_commands'}{'contents'}[40]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[40];
$result_trees{'macro_in_misc_commands'}{'contents'}[40]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[41]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[42]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[42]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[42]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[42]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[42]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[42];
$result_trees{'macro_in_misc_commands'}{'contents'}[42]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[43]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[44]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[44]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[44]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[44]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[44]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[44];
$result_trees{'macro_in_misc_commands'}{'contents'}[44]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[44];
$result_trees{'macro_in_misc_commands'}{'contents'}[44]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[45]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[46]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[46];
$result_trees{'macro_in_misc_commands'}{'contents'}[46]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[46];
$result_trees{'macro_in_misc_commands'}{'contents'}[46]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[47]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[48]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[48];
$result_trees{'macro_in_misc_commands'}{'contents'}[48]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[48];
$result_trees{'macro_in_misc_commands'}{'contents'}[48]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[49]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[50]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[51]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[51]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[51]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[51]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[51];
$result_trees{'macro_in_misc_commands'}{'contents'}[51]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[51];
$result_trees{'macro_in_misc_commands'}{'contents'}[51]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[52]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[53]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[53]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[53]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[53]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[53]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[53];
$result_trees{'macro_in_misc_commands'}{'contents'}[53]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[54]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[55]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[55]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[55]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[55]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[55]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[55];
$result_trees{'macro_in_misc_commands'}{'contents'}[55]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[55];
$result_trees{'macro_in_misc_commands'}{'contents'}[55]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[56]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[57]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[57]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[57]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[57]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[57]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[57];
$result_trees{'macro_in_misc_commands'}{'contents'}[57]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[57];
$result_trees{'macro_in_misc_commands'}{'contents'}[57]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[58]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[59]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[59];
$result_trees{'macro_in_misc_commands'}{'contents'}[59]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[59];
$result_trees{'macro_in_misc_commands'}{'contents'}[59]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[60]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[61]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[61]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[61]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[61]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[61]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[61];
$result_trees{'macro_in_misc_commands'}{'contents'}[61]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[62]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[63]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[63]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[63]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[63]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[63];
$result_trees{'macro_in_misc_commands'}{'contents'}[63]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[63];
$result_trees{'macro_in_misc_commands'}{'contents'}[63]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[64]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[65]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[65];
$result_trees{'macro_in_misc_commands'}{'contents'}[65]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[65]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[65]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[65]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[65]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[65];
$result_trees{'macro_in_misc_commands'}{'contents'}[65]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[65];
$result_trees{'macro_in_misc_commands'}{'contents'}[65]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[66]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[67]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[68]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[68];
$result_trees{'macro_in_misc_commands'}{'contents'}[68]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[68];
$result_trees{'macro_in_misc_commands'}{'contents'}[68]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[69]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[70]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[70];
$result_trees{'macro_in_misc_commands'}{'contents'}[70]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[70];
$result_trees{'macro_in_misc_commands'}{'contents'}[70]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[71]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[72]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[72];
$result_trees{'macro_in_misc_commands'}{'contents'}[72]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[72];
$result_trees{'macro_in_misc_commands'}{'contents'}[72]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[73]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[74]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[74];
$result_trees{'macro_in_misc_commands'}{'contents'}[74]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[74];
$result_trees{'macro_in_misc_commands'}{'contents'}[74]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[75]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[76]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[76];
$result_trees{'macro_in_misc_commands'}{'contents'}[76]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[76];
$result_trees{'macro_in_misc_commands'}{'contents'}[76]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[77]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[78]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[79]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[79]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[79]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[79]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[79]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[79];
$result_trees{'macro_in_misc_commands'}{'contents'}[79]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[80]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[80]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[80]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[80]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[80]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[80];
$result_trees{'macro_in_misc_commands'}{'contents'}[80]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[81]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[81]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[81]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[81]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[81]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[81];
$result_trees{'macro_in_misc_commands'}{'contents'}[81]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[82]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[82]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[82]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[82]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[82]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[82];
$result_trees{'macro_in_misc_commands'}{'contents'}[82]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[83]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[83]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[83]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[83]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[83]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[83];
$result_trees{'macro_in_misc_commands'}{'contents'}[83]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[84]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[84]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[84]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[84]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[84]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[84];
$result_trees{'macro_in_misc_commands'}{'contents'}[84]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[85]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[86]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[86];
$result_trees{'macro_in_misc_commands'}{'contents'}[86]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[86];
$result_trees{'macro_in_misc_commands'}{'contents'}[86]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[87]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[88]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[88];
$result_trees{'macro_in_misc_commands'}{'contents'}[88]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[88];
$result_trees{'macro_in_misc_commands'}{'contents'}[88]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[89]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[90]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[90]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[90]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[90]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[90]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[90];
$result_trees{'macro_in_misc_commands'}{'contents'}[90]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[91]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[91]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[91]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[91]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[91]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[91];
$result_trees{'macro_in_misc_commands'}{'contents'}[91]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[92]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[93]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[93];
$result_trees{'macro_in_misc_commands'}{'contents'}[93]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[93];
$result_trees{'macro_in_misc_commands'}{'contents'}[93]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[94]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[95]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[95]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[95]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[95]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[95]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[95];
$result_trees{'macro_in_misc_commands'}{'contents'}[95]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[96]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[97]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[97];
$result_trees{'macro_in_misc_commands'}{'contents'}[97]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[97];
$result_trees{'macro_in_misc_commands'}{'contents'}[97]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[98]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[99]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[99];
$result_trees{'macro_in_misc_commands'}{'contents'}[99]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[99];
$result_trees{'macro_in_misc_commands'}{'contents'}[99]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[100]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[101]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[101]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[101]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[101]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[101]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[101];
$result_trees{'macro_in_misc_commands'}{'contents'}[101]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[102]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[102]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[102]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[102]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[102]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[102];
$result_trees{'macro_in_misc_commands'}{'contents'}[102]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[103]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[104]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[104];
$result_trees{'macro_in_misc_commands'}{'contents'}[104]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[105]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[105];
$result_trees{'macro_in_misc_commands'}{'contents'}[105]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[105];
$result_trees{'macro_in_misc_commands'}{'contents'}[105]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[106]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[107]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[107]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[107]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[107]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[107]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[107];
$result_trees{'macro_in_misc_commands'}{'contents'}[107]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[108]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[108];
$result_trees{'macro_in_misc_commands'}{'contents'}[108]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[109]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[109];
$result_trees{'macro_in_misc_commands'}{'contents'}[109]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[109];
$result_trees{'macro_in_misc_commands'}{'contents'}[109]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[110]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[111]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[111];
$result_trees{'macro_in_misc_commands'}{'contents'}[111]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[111];
$result_trees{'macro_in_misc_commands'}{'contents'}[111]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[112]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[113]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[113]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[113]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[113]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[113]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[113];
$result_trees{'macro_in_misc_commands'}{'contents'}[113]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[114]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[115]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[115]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[115]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[115]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[115]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[115];
$result_trees{'macro_in_misc_commands'}{'contents'}[115]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[116]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[117]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[117];
$result_trees{'macro_in_misc_commands'}{'contents'}[117]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[117];
$result_trees{'macro_in_misc_commands'}{'contents'}[117]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[118]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[119]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[119];
$result_trees{'macro_in_misc_commands'}{'contents'}[119]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[119];
$result_trees{'macro_in_misc_commands'}{'contents'}[119]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[120]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[121]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[121];
$result_trees{'macro_in_misc_commands'}{'contents'}[121]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[121];
$result_trees{'macro_in_misc_commands'}{'contents'}[121]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[122]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[123]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[124]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[124];
$result_trees{'macro_in_misc_commands'}{'contents'}[124]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[124];
$result_trees{'macro_in_misc_commands'}{'contents'}[124]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[125]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[126]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[126]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[126]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[126]{'contents'}[3]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[126]{'contents'}[4]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[126]{'contents'}[5]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[126]{'contents'}[6]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[126]{'contents'}[7]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[126]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[127]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[128]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[129]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[130]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[130];
$result_trees{'macro_in_misc_commands'}{'contents'}[130]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[130];
$result_trees{'macro_in_misc_commands'}{'contents'}[130]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[130];
$result_trees{'macro_in_misc_commands'}{'contents'}[130]{'contents'}[3]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[130];
$result_trees{'macro_in_misc_commands'}{'contents'}[130]{'contents'}[4]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[130];
$result_trees{'macro_in_misc_commands'}{'contents'}[130]{'contents'}[5]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[130];
$result_trees{'macro_in_misc_commands'}{'contents'}[130]{'contents'}[6]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[130];
$result_trees{'macro_in_misc_commands'}{'contents'}[130]{'contents'}[7]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[130];
$result_trees{'macro_in_misc_commands'}{'contents'}[130]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[131]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[132]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[133]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[133];
$result_trees{'macro_in_misc_commands'}{'contents'}[133]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[134]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[135]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[135];
$result_trees{'macro_in_misc_commands'}{'contents'}[135]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[135];
$result_trees{'macro_in_misc_commands'}{'contents'}[135]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[136]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[137]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[137];
$result_trees{'macro_in_misc_commands'}{'contents'}[137]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[137];
$result_trees{'macro_in_misc_commands'}{'contents'}[137]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[137];
$result_trees{'macro_in_misc_commands'}{'contents'}[137]{'contents'}[3]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[137];
$result_trees{'macro_in_misc_commands'}{'contents'}[137]{'contents'}[4]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[137];
$result_trees{'macro_in_misc_commands'}{'contents'}[137]{'contents'}[5]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[137];
$result_trees{'macro_in_misc_commands'}{'contents'}[137]{'contents'}[6]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[137];
$result_trees{'macro_in_misc_commands'}{'contents'}[137]{'contents'}[7]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[137];
$result_trees{'macro_in_misc_commands'}{'contents'}[137]{'contents'}[8]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[137];
$result_trees{'macro_in_misc_commands'}{'contents'}[137]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[138]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[139]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[139];
$result_trees{'macro_in_misc_commands'}{'contents'}[139]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[139];
$result_trees{'macro_in_misc_commands'}{'contents'}[139]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[140]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[141]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[142]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[143]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[144]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[144];
$result_trees{'macro_in_misc_commands'}{'contents'}[144]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[145]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[146]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[146];
$result_trees{'macro_in_misc_commands'}{'contents'}[146]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[146];
$result_trees{'macro_in_misc_commands'}{'contents'}[146]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[147]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[148]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[149]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[150]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[150];
$result_trees{'macro_in_misc_commands'}{'contents'}[150]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[150];
$result_trees{'macro_in_misc_commands'}{'contents'}[150]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[151]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[152]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[153]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[154]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[154];
$result_trees{'macro_in_misc_commands'}{'contents'}[154]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[155]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[156]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[156];
$result_trees{'macro_in_misc_commands'}{'contents'}[156]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[156];
$result_trees{'macro_in_misc_commands'}{'contents'}[156]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[157]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[158]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[158]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[158]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[158]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[158]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[158];
$result_trees{'macro_in_misc_commands'}{'contents'}[158]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[159]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[160]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[160];
$result_trees{'macro_in_misc_commands'}{'contents'}[160]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[160];
$result_trees{'macro_in_misc_commands'}{'contents'}[160]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[161]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[162]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[163]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[163];
$result_trees{'macro_in_misc_commands'}{'contents'}[163]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[164]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[165]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[165];
$result_trees{'macro_in_misc_commands'}{'contents'}[165]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[165]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[165]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[165]{'contents'}[1]{'args'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[165]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[165]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[165]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[165]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[165]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[165]{'contents'}[1]{'args'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[165]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[165]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[165]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[165];
$result_trees{'macro_in_misc_commands'}{'contents'}[165]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[166]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[167]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[168]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[168]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[168]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[168]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[168]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[168];
$result_trees{'macro_in_misc_commands'}{'contents'}[168]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[169]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[169]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[169]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[169]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[169]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[169];
$result_trees{'macro_in_misc_commands'}{'contents'}[169]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[170]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[171]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[172]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[173]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[174]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[174];
$result_trees{'macro_in_misc_commands'}{'contents'}[174]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[174];
$result_trees{'macro_in_misc_commands'}{'contents'}[174]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[175]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[176]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[177]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[178]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[179]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[179];
$result_trees{'macro_in_misc_commands'}{'contents'}[179]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[179];
$result_trees{'macro_in_misc_commands'}{'contents'}[179]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[180]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[181]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[182]{'parent'} = $result_trees{'macro_in_misc_commands'};

$result_texis{'macro_in_misc_commands'} = '@macro text 
atext
@end macro

@macro Top
Top
@end macro

@node Top
@top top atext
@subheading Comment like: atext

Text line followed by a comment on the same line and another below @c comment @text{}
@c comment @text{}

@macro pagesizes-arg
200mm,150mm
@end macro

@macro afourpaper-macro 
@afourpaper
@end macro

@pagesizes 200mm,150mm
@afourpaper
@headings on line following headings atext
@oddfooting some text ignored @text{}
@everyheading on line following everyheading @text{}

@macro need-arg
0.1
@end macro

@need 0.1

@macro raisesections-macro 
@raisesections
@end macro
@raisesections
@macro lowersections-macro 
@lowersections
@end macro
@lowersections

@@definfoenclose phoo,//,\\\\  @definfoenclose phoo,//,\\\\

@phoo{bar}

@macro definfoenclose-name 
phi
@end macro
@definfoenclose phi,:,:

@phi{bar}

@macro strong-macro 
@strong
@end macro
@macro strong-name 
strong
@end macro

@strong{very strong}

@definfoenclose strong,(strong:,:)

@strong{ is it really strong? }

@kbd{something before kbdinputstyle}

@macro kbdinputstyle-arg 
code
@end macro
@kbdinputstyle code

@kbd{truc}

@example
@kbd{example}
@end example

@macro asis-arg 
asis
@end macro
@macro zero 
0
@end macro
@macro none-arg 
none
@end macro
@macro four 
4
@end macro
@macro six 
6
@end macro

@paragraphindent asis
@paragraphindent 0
@paragraphindent none
@paragraphindent 4
@firstparagraphindent none
@exampleindent 6

@macro end-arg 
end
@end macro
@macro separate-arg 
separate 
@end macro
@footnotestyle end
@footnotestyle separate 

@macro latin1 
ISO-8859-1
@end macro
@documentencoding ISO-8859-1

@macro on-arg 
on
@end macro
@macro off-arg 
off
@end macro
@frenchspacing on
@frenchspacing off

@c accepts 10 or 11
@macro ten 
10
@end macro
@fonttextsize 10
@c accept false or true
@macro false-arg 
false
@end macro
@macro true-arg
true
@end macro
@allowcodebreaks false

@allowcodebreaks true

@macro page-macro 
@page
@end macro
@macro noindent-macro 
@noindent
@end macro
@macro refill-macro 
@refill
@end macro

@@page @page
@@noindent @noindent @@refill @refill something

@noindent     noindent at beginning of line
@noindent
noindent on the preceding line
  @noindent    noindent after space at beginning of line
@page
@page
After page on its own line.

@@page @page
two spaces   @@noindent @noindent    @@refill @refill

@macro contents-macro 
@contents
@end macro
@contents

@vskip @atext{}

@macro cropmarks-macro
@cropmarks
@end macro
@cropmarks

@macro exdent-macro 
@exdent
@end macro
@exdent line after exdent

@macro two 
2
@end macro
@sp 2

@macro result-macro 
@result
@end macro

@clickstyle @result-macro{}

@menu
* node atext::
@end menu

@node node atext
@chapter chapter

@contents

@macro shortcontents-macro 
@shortcontents
@end macro
@shortcontents

@macro bye-macro
@bye
@end macro

@bye
';


$result_texts{'macro_in_misc_commands'} = '

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









@page @noindent @refill  something

noindent at beginning of line
noindent on the preceding line
  noindent after space at beginning of line
After page on its own line.

@page two spaces   @noindent @refill 





line after exdent






* node atext::

chapter






';

$result_errors{'macro_in_misc_commands'} = [];


