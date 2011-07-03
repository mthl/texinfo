use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements);

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

1;
