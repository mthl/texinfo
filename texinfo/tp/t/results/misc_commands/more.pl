use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'more'} = {
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
                  'text' => '200mm,150mm following '
                },
                {
                  'cmdname' => '@',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'pagesizes arg
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
              'parent' => {},
              'text' => 'on',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'headings',
          'parent' => {},
          'special' => {
            'line_args' => [
              {
                'contents' => [
                  {
                    'parent' => {},
                    'text' => 'on line following headings
'
                  }
                ],
                'parent' => {},
                'type' => 'misc_line_arg'
              }
            ]
          }
        },
        {
          'parent' => {},
          'text' => 'oddfooting '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'on line following oddfooting
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
              'text' => 'on line following everyheading
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
              'text' => 'on line following everyfooting
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
              'text' => 'on line following evenheading
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
              'text' => 'on line following evenfooting
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
              'text' => 'on line following
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
              'parent' => {},
              'text' => '0.1',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'need',
          'parent' => {},
          'special' => {
            'line_args' => [
              {
                'contents' => [
                  {
                    'parent' => {},
                    'text' => '0.1 on line following
'
                  }
                ],
                'parent' => {},
                'type' => 'misc_line_arg'
              }
            ]
          }
        },
        {
          'parent' => {},
          'text' => 'need '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => '0.1',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'need',
          'parent' => {},
          'special' => {
            'line_args' => [
              {
                'contents' => [
                  {
                    'parent' => {},
                    'text' => '0.1
'
                  }
                ],
                'parent' => {},
                'type' => 'misc_line_arg'
              }
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
              'parent' => {},
              'text' => 'on',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'setchapternewpage',
          'parent' => {},
          'special' => {
            'line_args' => [
              {
                'contents' => [
                  {
                    'parent' => {},
                    'text' => 'on line following setchapternewpage
'
                  }
                ],
                'parent' => {},
                'type' => 'misc_line_arg'
              }
            ]
          }
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
              'parent' => {},
              'text' => 'code',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'kbdinputstyle',
          'parent' => {},
          'special' => {
            'line_args' => [
              {
                'contents' => [
                  {
                    'parent' => {},
                    'text' => 'code something
'
                  }
                ],
                'parent' => {},
                'type' => 'misc_line_arg'
              }
            ]
          }
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
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    }
  ]
};
$result_trees{'more'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[1];
$result_trees{'more'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[7];
$result_trees{'more'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[7]{'special'}{'line_args'}[0]{'contents'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[7]{'special'}{'line_args'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[7]{'special'}{'line_args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[7];
$result_trees{'more'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[9];
$result_trees{'more'}{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[11];
$result_trees{'more'}{'contents'}[0]{'contents'}[11]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[12]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[13];
$result_trees{'more'}{'contents'}[0]{'contents'}[13]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[14]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[15];
$result_trees{'more'}{'contents'}[0]{'contents'}[15]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[16]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[17]{'args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[17];
$result_trees{'more'}{'contents'}[0]{'contents'}[17]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[18]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[19]{'args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[19];
$result_trees{'more'}{'contents'}[0]{'contents'}[19]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[20]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[21]{'args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[21];
$result_trees{'more'}{'contents'}[0]{'contents'}[21]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[21]{'special'}{'line_args'}[0]{'contents'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[21]{'special'}{'line_args'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[21]{'special'}{'line_args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[21];
$result_trees{'more'}{'contents'}[0]{'contents'}[22]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[23]{'args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[23];
$result_trees{'more'}{'contents'}[0]{'contents'}[23]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[23]{'special'}{'line_args'}[0]{'contents'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[23]{'special'}{'line_args'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[23]{'special'}{'line_args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[23];
$result_trees{'more'}{'contents'}[0]{'contents'}[24]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[25]{'args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[25];
$result_trees{'more'}{'contents'}[0]{'contents'}[25]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[25]{'special'}{'line_args'}[0]{'contents'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[25]{'special'}{'line_args'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[25]{'special'}{'line_args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[25];
$result_trees{'more'}{'contents'}[0]{'contents'}[26]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[27]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[28]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[29]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[30]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[31]{'args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[31];
$result_trees{'more'}{'contents'}[0]{'contents'}[31]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[31]{'special'}{'line_args'}[0]{'contents'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[31]{'special'}{'line_args'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[31]{'special'}{'line_args'}[0]{'parent'} = $result_trees{'more'}{'contents'}[0]{'contents'}[31];
$result_trees{'more'}{'contents'}[0]{'contents'}[32]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[33]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[34]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[35]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[36]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'contents'}[37]{'parent'} = $result_trees{'more'}{'contents'}[0];
$result_trees{'more'}{'contents'}[0]{'parent'} = $result_trees{'more'};
$result_trees{'more'}{'contents'}[1]{'parent'} = $result_trees{'more'};

$result_texts{'more'} = 'pagesizes @pagesizes 200mm,150mm following @@pagesizes arg
afourpaper @afourpaper
smallbook @smallbook
headings @headings on
oddfooting @oddfooting on line following oddfooting
everyheading @everyheading on line following everyheading
everyfooting @everyfooting on line following everyfooting
evenheading @evenheading on line following evenheading
evenfooting @evenfooting on line following evenfooting
oddheading @oddheading on line following
need @need 0.1
need @need 0.1
setchapternewpage @setchapternewpage on
raisesections @raisesections
lowersections @lowersections
kbdinputstyle code @kbdinputstyle code
afourpaper @afourpaper
afourlatex @afourlatex
afourwide @afourwide

';

$result_errors{'more'} = [];


