use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'all_empty_def'} = {
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
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'parent' => {},
          'special' => {
            'def_command' => 'deffn'
          },
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
      'cmdname' => 'defvr',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'parent' => {},
          'special' => {
            'def_command' => 'defvr'
          },
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
      'cmdname' => 'deftypefn',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'parent' => {},
          'special' => {
            'def_command' => 'deftypefn'
          },
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
      'cmdname' => 'deftypeop',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'parent' => {},
          'special' => {
            'def_command' => 'deftypeop'
          },
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
      'cmdname' => 'deftypevr',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'parent' => {},
          'special' => {
            'def_command' => 'deftypevr'
          },
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
      'cmdname' => 'defcv',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'parent' => {},
          'special' => {
            'def_command' => 'defcv'
          },
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
      'cmdname' => 'deftypecv',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'parent' => {},
          'special' => {
            'def_command' => 'deftypecv'
          },
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
      'cmdname' => 'defop',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'parent' => {},
          'special' => {
            'def_command' => 'defop'
          },
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
      'cmdname' => 'deftp',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'parent' => {},
          'special' => {
            'def_command' => 'deftp'
          },
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
$result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[2]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[3]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[3];
$result_trees{'all_empty_def'}{'contents'}[3]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[4]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[5]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[6];
$result_trees{'all_empty_def'}{'contents'}[6]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[7]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[8]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[9]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[9];
$result_trees{'all_empty_def'}{'contents'}[9]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[10]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[11]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[12];
$result_trees{'all_empty_def'}{'contents'}[12]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[13]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[14]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[15]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[15]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[15]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[15];
$result_trees{'all_empty_def'}{'contents'}[15]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[16]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[17]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[18]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[18]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[18]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[18]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[18];
$result_trees{'all_empty_def'}{'contents'}[18]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[19]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[20]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[21]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[21]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[21]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[21]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[21];
$result_trees{'all_empty_def'}{'contents'}[21]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[22]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[23]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[24]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[24]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[24]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[24]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[24];
$result_trees{'all_empty_def'}{'contents'}[24]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[25]{'parent'} = $result_trees{'all_empty_def'};

$result_texis{'all_empty_def'} = '@deffn
@end deffn

@defvr
@end defvr

@deftypefn
@end deftypefn

@deftypeop
@end deftypeop

@deftypevr
@end deftypevr

@defcv
@end defcv

@deftypecv
@end deftypecv

@defop
@end defop

@deftp
@end deftp
';


$result_texts{'all_empty_def'} = '







';

$result_errors{'all_empty_def'} = [];


$result_indices{'all_empty_def'} = undef;


1;
