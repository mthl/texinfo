use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'preformatted'} = {
  'contents' => [
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'e--xample  some  
'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'parent' => {},
              'text' => '   text
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
            'line_nr' => 6,
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
        'line_nr' => 2,
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
      'cmdname' => 'format',
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
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'cmdname' => 'code',
                  'parent' => {},
                  'type' => 'command_as_argument'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'space_at_end_block_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'vtable',
          'contents' => [
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
                      'text' => 'item in table in format'
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
              'cmdname' => 'item',
              'extra' => {
                'index_entry' => {
                  'command' => {},
                  'content' => [
                    {}
                  ],
                  'index_at_command' => 'vtable',
                  'index_name' => 'vr',
                  'index_prefix' => 'v',
                  'number' => 1
                },
                'misc_content' => []
              },
              'parent' => {}
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'parent' => {},
                  'text' => 'in table in format
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
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'vtable'
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
                'command_argument' => 'vtable',
                'text_arg' => 'vtable'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 13,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'block_command_line_contents' => [
              [
                {}
              ]
            ],
            'command_as_argument' => {},
            'end_command' => {}
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 9,
            'macro' => ''
          },
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
                  'text' => 'format'
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
            'command_argument' => 'format',
            'text_arg' => 'format'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 14,
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
        'line_nr' => 8,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'preformatted'}{'contents'}[0]{'parent'} = $result_trees{'preformatted'};
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[1]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[1]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[1]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[1]{'contents'}[2];
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'preformatted'}{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'preformatted'}{'contents'}[1]{'contents'}[2];
$result_trees{'preformatted'}{'contents'}[1]{'parent'} = $result_trees{'preformatted'};
$result_trees{'preformatted'}{'contents'}[2]{'parent'} = $result_trees{'preformatted'};
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'extra'}{'misc_content'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'extra'}{'command_as_argument'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[3];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[2];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[2]{'extra'}{'command'} = $result_trees{'preformatted'}{'contents'}[3];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[3];
$result_trees{'preformatted'}{'contents'}[3]{'extra'}{'end_command'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[2];
$result_trees{'preformatted'}{'contents'}[3]{'parent'} = $result_trees{'preformatted'};

$result_texis{'preformatted'} = '
@example
e--xample  some  

   text
@end example

@format
@vtable @code
@item item in table in format

in table in format
@end vtable
@end format
';


$result_texts{'preformatted'} = '
e--xample  some  

   text

item in table in format

in table in format
';

$result_errors{'preformatted'} = [
  {
    'error_line' => ':10: Entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => 'Entry for index `vr\' outside of any node',
    'type' => 'error'
  }
];



$result_converted{'plaintext'}->{'preformatted'} = '     e--xample  some

        text

`item in table in format\'

     in table in format
';

1;
