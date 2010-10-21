use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'many_lines'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'pagesizes '
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
                  'text' => '200mm,150mm following '
                },
                {
                  'cmdname' => '@',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'pagesizes arg'
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
          'parent' => {},
          'text' => 'afourpaper '
        },
        {
          'cmdname' => 'afourpaper',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'smallbook '
        },
        {
          'cmdname' => 'smallbook',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'headings '
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
                  'text' => 'on line following headings'
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
          'parent' => {},
          'text' => 'oddfooting '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' on line following oddfooting
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'oddfooting',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'everyheading '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' on line following everyheading
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'everyheading',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'everyfooting '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' on line following everyfooting
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'everyfooting',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'evenheading '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' on line following evenheading
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'evenheading',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'evenfooting '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' on line following evenfooting
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'evenfooting',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'oddheading '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' on line following
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'oddheading',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'need '
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
                  'text' => '0.1 on line following'
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
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'need '
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
          'text' => 'setchapternewpage '
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
                  'text' => 'on line following setchapternewpage'
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
          'cmdname' => 'setchapternewpage',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'raisesections '
        },
        {
          'cmdname' => 'raisesections',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'lowersections '
        },
        {
          'cmdname' => 'lowersections',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'kbdinputstyle code '
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
                  'text' => 'code something'
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
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'afourpaper '
        },
        {
          'cmdname' => 'afourpaper',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'afourlatex '
        },
        {
          'cmdname' => 'afourlatex',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'afourwide '
        },
        {
          'cmdname' => 'afourwide',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'paragraphindent asis '
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
          'parent' => {},
          'text' => 'paragraphindent 0 '
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
          'parent' => {},
          'text' => 'paragraphindent none '
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
          'parent' => {},
          'text' => 'paragraphindent 4 '
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
          'parent' => {},
          'text' => 'firstparagraphindent none '
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
          'parent' => {},
          'text' => 'exampleindent 6 '
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
                  'text' => '6 on line following exampleindent'
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
          'text' => 'exampleindent 6 '
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
          'text' => 'footnotestyle '
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
          'parent' => {},
          'text' => 'footnotestyle '
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
          'text' => 'documentencoding '
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
                  'text' => 'US-ascii encoding name'
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
            'text_arg' => 'US-ascii encoding name'
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
          'text' => 'frenchspacing '
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
          'parent' => {},
          'text' => 'frenchspacing '
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
          'text' => 'fonttextsize '
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
          'text' => 'everyheadingmarks '
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
                  'text' => 'bottom on line following everyheadingmarks'
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
          'cmdname' => 'everyheadingmarks',
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
          'text' => 'Text line followed by finalout on the same line and another below '
        },
        {
          'cmdname' => 'finalout',
          'parent' => {}
        },
        {
          'cmdname' => 'finalout',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'Text line after the finalout followed by a fianlout '
        },
        {
          'cmdname' => 'finalout',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'Text line after the text line followed by the finalout.
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
          'parent' => {},
          'text' => 'Test text after finalout
'
        },
        {
          'cmdname' => 'finalout',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'Line after finalout
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[1];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[7];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[9];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[11];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[11]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[12]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[13];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[13]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[14]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[15];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[15]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[16]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[17]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[17];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[17]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[18]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[19]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[19];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[19]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[20]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[21]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[21]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[21]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[21]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[21]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[21]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[21]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[21];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[21]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[22]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[23]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[23]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[23]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[23]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[23]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[23]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[23]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[23];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[23]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[24]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[25]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[25]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[25]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[25]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[25]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[25]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[25]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[25];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[25]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[26]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[27]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[28]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[29]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[30]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[31]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[31]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[31]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[31]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[31]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[31]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[31]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[31];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[31]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[32]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[33]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[34]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[35]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[36]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[37]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[38]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[39]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[39]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[39]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[39]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[39]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[39]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[39]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[39];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[39]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[40]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[41]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[41]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[41]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[41]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[41]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[41]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[41]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[41];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[41]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[42]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[43]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[43]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[43]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[43]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[43]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[43]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[43]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[43];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[43]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[44]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[45]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[45]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[45]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[45]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[45]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[45]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[45]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[45];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[45]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[46]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[47]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[47]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[47]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[47]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[47]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[47]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[47]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[47];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[47]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[48]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[49]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[49]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[49]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[49]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[49]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[49]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[49]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[49];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[49]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[50]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[51]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[51]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[51]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[51]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[51]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[51]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[51]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[51];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[51]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[52]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[53]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[53]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[53]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[53]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[53]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[53]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[53]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[53];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[53]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[54]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[55]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[55]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[55]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[55]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[55]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[55]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[55]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[55];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[55]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[56]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[57]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[57]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[57]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[57]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[57]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[57]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[57]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[57];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[57]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[58]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[58]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[58]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[58]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[58]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[58]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[58]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[58];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[58]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[59]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[60]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[60]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[60]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[60]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[60]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[60]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[60]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[60];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[60]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[61]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[62]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[62]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[62]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[62]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[62]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[62]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[62]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[62];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[62]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[63]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[64]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[64]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[64]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[64]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[64]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[64]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[64]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[64];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[64]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[65]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[66]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[66]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[66]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[66]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[66]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[66]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[66]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[66];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[66]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[67]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[67]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[67]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[67]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[67]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[67]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[67]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[67];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[67]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[68]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[68]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[68]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[68]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[68]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[68]{'args'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[68]{'args'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[0]{'contents'}[68];
$result_trees{'many_lines'}{'contents'}[0]{'contents'}[68]{'parent'} = $result_trees{'many_lines'}{'contents'}[0];
$result_trees{'many_lines'}{'contents'}[0]{'parent'} = $result_trees{'many_lines'};
$result_trees{'many_lines'}{'contents'}[1]{'parent'} = $result_trees{'many_lines'};
$result_trees{'many_lines'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[2];
$result_trees{'many_lines'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[2];
$result_trees{'many_lines'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[2];
$result_trees{'many_lines'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'many_lines'}{'contents'}[2];
$result_trees{'many_lines'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'many_lines'}{'contents'}[2];
$result_trees{'many_lines'}{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'many_lines'}{'contents'}[2];
$result_trees{'many_lines'}{'contents'}[2]{'parent'} = $result_trees{'many_lines'};
$result_trees{'many_lines'}{'contents'}[3]{'parent'} = $result_trees{'many_lines'};
$result_trees{'many_lines'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'many_lines'}{'contents'}[4];
$result_trees{'many_lines'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'many_lines'}{'contents'}[4];
$result_trees{'many_lines'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'many_lines'}{'contents'}[4];
$result_trees{'many_lines'}{'contents'}[4]{'parent'} = $result_trees{'many_lines'};

$result_texis{'many_lines'} = 'pagesizes @pagesizes 200mm,150mm following @@pagesizes arg
afourpaper @afourpaper
smallbook @smallbook
headings @headings on line following headings
oddfooting @oddfooting on line following oddfooting
everyheading @everyheading on line following everyheading
everyfooting @everyfooting on line following everyfooting
evenheading @evenheading on line following evenheading
evenfooting @evenfooting on line following evenfooting
oddheading @oddheading on line following
need @need 0.1 on line following
need @need 0.1
setchapternewpage @setchapternewpage on line following setchapternewpage
raisesections @raisesections
lowersections @lowersections
kbdinputstyle code @kbdinputstyle code something
afourpaper @afourpaper
afourlatex @afourlatex
afourwide @afourwide
paragraphindent asis @paragraphindent asis
paragraphindent 0 @paragraphindent 0
paragraphindent none @paragraphindent none
paragraphindent 4 @paragraphindent 4
firstparagraphindent none @firstparagraphindent none
exampleindent 6 @exampleindent 6 on line following exampleindent
exampleindent 6 @exampleindent 6
footnotestyle @footnotestyle end 
footnotestyle @footnotestyle separate 
documentencoding @documentencoding US-ascii encoding name
@documentencoding ISO-8859-1
frenchspacing @frenchspacing on
frenchspacing @frenchspacing off
fonttextsize @fonttextsize 10
everyheadingmarks @everyheadingmarks bottom on line following everyheadingmarks
@allowcodebreaks false
@allowcodebreaks true

Text line followed by finalout on the same line and another below @finalout
@finalout
Text line after the finalout followed by a fianlout @finalout
Text line after the text line followed by the finalout.

Test text after finalout
@finalout
Line after finalout
';


$result_texts{'many_lines'} = 'pagesizes afourpaper smallbook headings oddfooting everyheading everyfooting evenheading evenfooting oddheading need need setchapternewpage raisesections lowersections kbdinputstyle code afourpaper afourlatex afourwide paragraphindent asis paragraphindent 0 paragraphindent none paragraphindent 4 firstparagraphindent none exampleindent 6 exampleindent 6 footnotestyle footnotestyle documentencoding frenchspacing frenchspacing fonttextsize everyheadingmarks 
Text line followed by finalout on the same line and another below Text line after the finalout followed by a fianlout Text line after the text line followed by the finalout.

Test text after finalout
Line after finalout
';

$result_errors{'many_lines'} = [
  {
    'error_line' => ':1: warning: @pagesizes should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@pagesizes should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':2: warning: @afourpaper should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@afourpaper should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':3: warning: @smallbook should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@smallbook should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':4: warning: @headings should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => '@headings should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':4: Bad argument to @headings: on line following headings
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'Bad argument to @headings: on line following headings',
    'type' => 'error'
  },
  {
    'error_line' => ':5: warning: @oddfooting should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@oddfooting should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':6: warning: @everyheading should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => '@everyheading should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':7: warning: @everyfooting should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => '@everyfooting should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':8: warning: @evenheading should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 8,
    'macro' => '',
    'text' => '@evenheading should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':9: warning: @evenfooting should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 9,
    'macro' => '',
    'text' => '@evenfooting should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':10: warning: @oddheading should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => '@oddheading should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':11: warning: @need should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 11,
    'macro' => '',
    'text' => '@need should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':11: Bad argument to @need: 0.1 on line following
',
    'file_name' => '',
    'line_nr' => 11,
    'macro' => '',
    'text' => 'Bad argument to @need: 0.1 on line following',
    'type' => 'error'
  },
  {
    'error_line' => ':12: warning: @need should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 12,
    'macro' => '',
    'text' => '@need should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':13: warning: @setchapternewpage should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => '@setchapternewpage should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':13: @setchapternewpage arg must be `on\', `off\' or `odd\', not `on line following setchapternewpage\'
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => '@setchapternewpage arg must be `on\', `off\' or `odd\', not `on line following setchapternewpage\'',
    'type' => 'error'
  },
  {
    'error_line' => ':14: warning: @raisesections should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 14,
    'macro' => '',
    'text' => '@raisesections should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':15: warning: @lowersections should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 15,
    'macro' => '',
    'text' => '@lowersections should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':16: warning: @kbdinputstyle should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 16,
    'macro' => '',
    'text' => '@kbdinputstyle should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':16: @kbdinputstyle arg must be `code\'/`example\'/`distinct\', not `code something\'
',
    'file_name' => '',
    'line_nr' => 16,
    'macro' => '',
    'text' => '@kbdinputstyle arg must be `code\'/`example\'/`distinct\', not `code something\'',
    'type' => 'error'
  },
  {
    'error_line' => ':17: warning: @afourpaper should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 17,
    'macro' => '',
    'text' => '@afourpaper should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':18: warning: @afourlatex should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 18,
    'macro' => '',
    'text' => '@afourlatex should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':19: warning: @afourwide should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 19,
    'macro' => '',
    'text' => '@afourwide should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':20: warning: @paragraphindent should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 20,
    'macro' => '',
    'text' => '@paragraphindent should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':21: warning: @paragraphindent should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 21,
    'macro' => '',
    'text' => '@paragraphindent should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':22: warning: @paragraphindent should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 22,
    'macro' => '',
    'text' => '@paragraphindent should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':23: warning: @paragraphindent should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 23,
    'macro' => '',
    'text' => '@paragraphindent should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':24: warning: @firstparagraphindent should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 24,
    'macro' => '',
    'text' => '@firstparagraphindent should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':25: warning: @exampleindent should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 25,
    'macro' => '',
    'text' => '@exampleindent should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':26: warning: @exampleindent should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 26,
    'macro' => '',
    'text' => '@exampleindent should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':27: warning: @footnotestyle should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 27,
    'macro' => '',
    'text' => '@footnotestyle should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':28: warning: @footnotestyle should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 28,
    'macro' => '',
    'text' => '@footnotestyle should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':29: warning: @documentencoding should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 29,
    'macro' => '',
    'text' => '@documentencoding should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':31: warning: @frenchspacing should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 31,
    'macro' => '',
    'text' => '@frenchspacing should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':32: warning: @frenchspacing should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 32,
    'macro' => '',
    'text' => '@frenchspacing should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':33: warning: @fonttextsize should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 33,
    'macro' => '',
    'text' => '@fonttextsize should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':34: warning: @everyheadingmarks should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 34,
    'macro' => '',
    'text' => '@everyheadingmarks should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':34: @everyheadingmarks arg must be `top\' or `bottom\', not `bottom on line following everyheadingmarks\'
',
    'file_name' => '',
    'line_nr' => 34,
    'macro' => '',
    'text' => '@everyheadingmarks arg must be `top\' or `bottom\', not `bottom on line following everyheadingmarks\'',
    'type' => 'error'
  },
  {
    'error_line' => ':38: warning: @finalout should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 38,
    'macro' => '',
    'text' => '@finalout should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':40: warning: @finalout should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 40,
    'macro' => '',
    'text' => '@finalout should only appear at a line beginning',
    'type' => 'warning'
  }
];


