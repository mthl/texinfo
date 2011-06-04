use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'paragraph_command'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => '@',
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
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'aaa'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'b',
          'contents' => [],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '.
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
                  'text' => 'i'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'dotless',
          'contents' => [],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' also dotless i.
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
                  'text' => 'm1'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'email',
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
            'line_nr' => 7,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' email.
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
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'foo,\\,//'
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
      'extra' => {
        'misc_args' => [
          'foo',
          '\\',
          '//'
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
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'cmdname' => '@',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'definfoenclose'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'foo',
          'contents' => [],
          'extra' => {
            'begin' => '\\',
            'end' => '//'
          },
          'parent' => {},
          'type' => 'definfoenclose_command'
        },
        {
          'parent' => {},
          'text' => ' should work at the beginning of a new paragraph.
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'lone footnote'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'footnote',
          'contents' => [],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 12,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '.
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
    }
  ],
  'type' => 'text_root'
};
$result_trees{'paragraph_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[0];
$result_trees{'paragraph_command'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[0];
$result_trees{'paragraph_command'}{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'};
$result_trees{'paragraph_command'}{'contents'}[1]{'parent'} = $result_trees{'paragraph_command'};
$result_trees{'paragraph_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[2]{'contents'}[0];
$result_trees{'paragraph_command'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[2];
$result_trees{'paragraph_command'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[2];
$result_trees{'paragraph_command'}{'contents'}[2]{'parent'} = $result_trees{'paragraph_command'};
$result_trees{'paragraph_command'}{'contents'}[3]{'parent'} = $result_trees{'paragraph_command'};
$result_trees{'paragraph_command'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_command'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[4]{'contents'}[0];
$result_trees{'paragraph_command'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[4];
$result_trees{'paragraph_command'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[4];
$result_trees{'paragraph_command'}{'contents'}[4]{'parent'} = $result_trees{'paragraph_command'};
$result_trees{'paragraph_command'}{'contents'}[5]{'parent'} = $result_trees{'paragraph_command'};
$result_trees{'paragraph_command'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_command'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[6]{'contents'}[0];
$result_trees{'paragraph_command'}{'contents'}[6]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'paragraph_command'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'paragraph_command'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[6];
$result_trees{'paragraph_command'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[6];
$result_trees{'paragraph_command'}{'contents'}[6]{'parent'} = $result_trees{'paragraph_command'};
$result_trees{'paragraph_command'}{'contents'}[7]{'parent'} = $result_trees{'paragraph_command'};
$result_trees{'paragraph_command'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'paragraph_command'}{'contents'}[8];
$result_trees{'paragraph_command'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[8]{'args'}[0];
$result_trees{'paragraph_command'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[8]{'args'}[0];
$result_trees{'paragraph_command'}{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[8]{'args'}[0];
$result_trees{'paragraph_command'}{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[8];
$result_trees{'paragraph_command'}{'contents'}[8]{'parent'} = $result_trees{'paragraph_command'};
$result_trees{'paragraph_command'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_command'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_command'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[9]{'contents'}[0];
$result_trees{'paragraph_command'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[9];
$result_trees{'paragraph_command'}{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[9];
$result_trees{'paragraph_command'}{'contents'}[9]{'parent'} = $result_trees{'paragraph_command'};
$result_trees{'paragraph_command'}{'contents'}[10]{'parent'} = $result_trees{'paragraph_command'};
$result_trees{'paragraph_command'}{'contents'}[11]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[11]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'paragraph_command'}{'contents'}[11]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[11]{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_command'}{'contents'}[11]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[11]{'contents'}[0];
$result_trees{'paragraph_command'}{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[11];
$result_trees{'paragraph_command'}{'contents'}[11]{'contents'}[1]{'parent'} = $result_trees{'paragraph_command'}{'contents'}[11];
$result_trees{'paragraph_command'}{'contents'}[11]{'parent'} = $result_trees{'paragraph_command'};
$result_trees{'paragraph_command'}{'contents'}[12]{'parent'} = $result_trees{'paragraph_command'};

$result_texis{'paragraph_command'} = '@@

@b{aaa}.

@dotless{i} also dotless i.

@email{m1} email.

@definfoenclose foo,\\,//
@foo{@@definfoenclose} should work at the beginning of a new paragraph.

@footnote{lone footnote}.

';


$result_texts{'paragraph_command'} = '@

aaa.

i also dotless i.

m1 email.

@definfoenclose should work at the beginning of a new paragraph.

.

';

$result_errors{'paragraph_command'} = [];



$result_converted{'plaintext'}->{'paragraph_command'} = '@

   aaa.

   i also dotless i.

   <m1> email.

   \\@definfoenclose// should work at the beginning of a new paragraph.

   (1).

   ---------- Footnotes ----------

   (1) lone footnote

';

1;
