use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'exdent_and_commands'} = {
  'contents' => [
    {
      'cmdname' => 'quotation',
      'contents' => [
        {
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'quotation1
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'in exdented protected eol '
                },
                {
                  'cmdname' => '
',
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'exdent',
          'extra' => {
            'misc_content' => [
              {},
              {}
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'following
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'in exdented a '
                },
                {
                  'cmdname' => '@',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => '* '
                },
                {
                  'cmdname' => '*',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' and following'
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
          'cmdname' => 'exdent',
          'extra' => {
            'misc_content' => [
              {},
              {},
              {},
              {},
              {}
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'after exdented
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'quotation'
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
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'quotation',
            'text_arg' => 'quotation'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 7,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {}
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
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'example',
      'contents' => [
        {
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'example
'
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'in exdented protected eol '
                },
                {
                  'cmdname' => '
',
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'exdent',
          'extra' => {
            'misc_content' => [
              {},
              {}
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 11,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'following
'
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'in exdented a '
                },
                {
                  'cmdname' => '@',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => '* '
                },
                {
                  'cmdname' => '*',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' and following'
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
          'cmdname' => 'exdent',
          'extra' => {
            'misc_content' => [
              {},
              {},
              {},
              {},
              {}
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 13,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'after exdented
'
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'example'
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
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'example',
            'text_arg' => 'example'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 15,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 9,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'exdent_and_commands'}{'contents'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[1];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'}[1] = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[3];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'extra'}{'misc_content'}[1] = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'extra'}{'misc_content'}[2] = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[3];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'extra'}{'misc_content'}[3] = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[4];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'extra'}{'misc_content'}[4] = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[5];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[5];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[6];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[6];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[6]{'extra'}{'command'} = $result_trees{'exdent_and_commands'}{'contents'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'exdent_and_commands'}{'contents'}[0]{'contents'}[6];
$result_trees{'exdent_and_commands'}{'contents'}[0]{'parent'} = $result_trees{'exdent_and_commands'};
$result_trees{'exdent_and_commands'}{'contents'}[1]{'parent'} = $result_trees{'exdent_and_commands'};
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[0]{'extra'}{'command'} = $result_trees{'exdent_and_commands'}{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[1];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[2]{'extra'}{'misc_content'}[1] = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[3];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'extra'}{'misc_content'}[1] = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'extra'}{'misc_content'}[2] = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[3];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'extra'}{'misc_content'}[3] = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[4];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'extra'}{'misc_content'}[4] = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[5];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[5];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[6]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[6];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[6]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[6]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[6]{'args'}[0];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[6];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[6]{'extra'}{'command'} = $result_trees{'exdent_and_commands'}{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[6]{'parent'} = $result_trees{'exdent_and_commands'}{'contents'}[2];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'extra'}{'end_command'} = $result_trees{'exdent_and_commands'}{'contents'}[2]{'contents'}[6];
$result_trees{'exdent_and_commands'}{'contents'}[2]{'parent'} = $result_trees{'exdent_and_commands'};

$result_texis{'exdent_and_commands'} = '@quotation
quotation1
@exdent in exdented protected eol @
following
@exdent in exdented a @@* @* and following
after exdented
@end quotation

@example
example
@exdent in exdented protected eol @
following
@exdent in exdented a @@* @* and following
after exdented
@end example
';


$result_texts{'exdent_and_commands'} = 'quotation1
in exdented protected eol  
following
in exdented a @* 
 and following
after exdented

example
in exdented protected eol  
following
in exdented a @* 
 and following
after exdented
';

$result_errors{'exdent_and_commands'} = [];



$result_converted{'plaintext'}->{'exdent_and_commands'} = '     quotation1
in exdented protected eol  
     following
in exdented a @*
and following
     after exdented

     example
in exdented protected eol  
     following
in exdented a @* 
 and following
     after exdented
';


$result_converted{'html'}->{'exdent_and_commands'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Created by texi2html, http://www.gnu.org/software/texinfo/ -->
<head>
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="Generator" content="texi2html">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
a.summary-letter {text-decoration: none}
blockquote.smallquotation {font-size: smaller}
div.display {margin-left: 3.2em}
div.example {margin-left: 3.2em}
div.lisp {margin-left: 3.2em}
div.smalldisplay {margin-left: 3.2em}
div.smallexample {margin-left: 3.2em}
div.smalllisp {margin-left: 3.2em}
pre.display {font-family: serif}
pre.format {font-family: serif}
pre.menu-comment {font-family: serif}
pre.menu-preformatted {font-family: serif}
pre.smalldisplay {font-family: serif; font-size: smaller}
pre.smallexample {font-size: smaller}
pre.smallformat {font-family: serif; font-size: smaller}
pre.smalllisp {font-size: smaller}
span.nocodebreak {white-space:pre}
span.nolinebreak {white-space:pre}
span.roman {font-family:serif; font-weight:normal}
span.sansserif {font-family:sans-serif; font-weight:normal}
ul.no-bullet {list-style: none}
-->
</style>


</head>

<body lang="en" bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000">

<blockquote>
<p>quotation1
</p><p>in exdented protected eol &nbsp;
</p><p>following
</p><p>in exdented a @* <br> and following
</p><p>after exdented
</p></blockquote>

<div class="example">
<pre class="example">example
</pre><pre class="example">in exdented protected eol &nbsp;
</pre><pre class="example">following
</pre><pre class="example">in exdented a @* 
 and following
</pre><pre class="example">after exdented
</pre></div>
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'exdent_and_commands'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
