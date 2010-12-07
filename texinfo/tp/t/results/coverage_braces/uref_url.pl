use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'uref_url'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--a'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--b'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'uref',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ],
              [
                {}
              ]
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--a'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'uref',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ]
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--b'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'uref',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              undef,
              [
                {}
              ]
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--a'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--b'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--c'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'uref',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ],
              [
                {}
              ],
              [
                {}
              ]
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 4,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--b'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--c'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'uref',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              undef,
              [
                {}
              ],
              [
                {}
              ]
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--a'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--c'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'uref',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ],
              undef,
              [
                {}
              ]
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 6,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--c'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'uref',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              undef,
              undef,
              [
                {}
              ]
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 7,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--a'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--b'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'url',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ],
              [
                {}
              ]
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 8,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--a'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--b'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--c'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'url',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ],
              [
                {}
              ],
              [
                {}
              ]
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 9,
            'macro' => ''
          },
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
    }
  ],
  'type' => 'text_root'
};
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[0]{'args'}[1];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[2];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[2]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[4];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[4];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[4]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[6];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'args'}[1];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'args'}[1]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[6];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'args'}[2];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'args'}[2]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[6];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'args'}[1]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'args'}[2]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[8];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[8]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[8]{'args'}[1];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[8]{'args'}[1]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[8];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[8]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[8]{'args'}[2];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[8]{'args'}[2]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[8];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[8]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[8]{'args'}[1]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[8]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[8]{'args'}[2]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[10]{'args'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[10];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[10]{'args'}[1]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[10];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[10]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[10]{'args'}[2];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[10]{'args'}[2]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[10];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[10]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[10]{'args'}[0]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[10]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[10]{'args'}[2]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[11]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[12];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[12]{'args'}[1]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[12];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[12]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[12]{'args'}[2];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[12]{'args'}[2]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[12];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[12]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[12]{'args'}[2]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[12]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[13]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[14]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[14]{'args'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[14];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[14]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[14]{'args'}[1];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[14]{'args'}[1]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[14];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[14]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[14]{'args'}[0]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[14]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[14]{'args'}[1]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[14]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[15]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'args'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'args'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[16];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'args'}[1];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'args'}[1]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[16];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'args'}[2];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'args'}[2]{'parent'} = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[16];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'args'}[0]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'args'}[1]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'args'}[2]{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[16]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'contents'}[17]{'parent'} = $result_trees{'uref_url'}{'contents'}[0];
$result_trees{'uref_url'}{'contents'}[0]{'parent'} = $result_trees{'uref_url'};

$result_texis{'uref_url'} = '@uref{--a,--b}
@uref{--a}
@uref{,--b}
@uref{--a,--b,--c}
@uref{,--b,--c}
@uref{--a,,--c}
@uref{,,--c}
@url{--a,--b}
@url{--a,--b,--c}
';


$result_texts{'uref_url'} = '--a
--a

--a

--a

--a
--a
';

$result_errors{'uref_url'} = [];



$result_converted{'plaintext'}->{'uref_url'} = '-b (--a) `--a\' -c -c -c -c -b (--a) -c
';

1;
