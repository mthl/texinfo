use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'image_file_search'} = {
  'contents' => [
    {
      'contents' => [],
      'parent' => {},
      'type' => 'text_root'
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
      'contents' => [
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
                  'text' => 'tp/t/include/f--ile'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'image',
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
              'text' => 'image dot.
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => './tp/t/include/f--ile'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'image',
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
                'line_nr' => 6,
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
              'text' => 'image dot parent.
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '../include/f--ile'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'image',
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
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Top'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'image_file_search'}{'contents'}[0]{'parent'} = $result_trees{'image_file_search'};
$result_trees{'image_file_search'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'args'}[0];
$result_trees{'image_file_search'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'args'}[0];
$result_trees{'image_file_search'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'args'}[0];
$result_trees{'image_file_search'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[4];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[4];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[4]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[4]{'contents'}[2];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[4]{'contents'}[2]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[4];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[4];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[6];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[6];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[6]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[6]{'contents'}[2];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[6]{'contents'}[2]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[6];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1]{'contents'}[6];
$result_trees{'image_file_search'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'image_file_search'}{'contents'}[1];
$result_trees{'image_file_search'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'image_file_search'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'image_file_search'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'image_file_search'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'image_file_search'}{'contents'}[1]{'parent'} = $result_trees{'image_file_search'};

$result_texis{'image_file_search'} = '@node Top

@image{tp/t/include/f--ile}

@@image dot.
@image{./tp/t/include/f--ile}

@@image dot parent.
@image{../include/f--ile}
';


$result_texts{'image_file_search'} = '
tp/t/include/f--ile

@image dot.
./tp/t/include/f--ile

@image dot parent.
../include/f--ile
';

$result_sectioning{'image_file_search'} = {};

$result_nodes{'image_file_search'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'node_up' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'dir'
        }
      ]
    }
  }
};

$result_menus{'image_file_search'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'image_file_search'} = [];



$result_converted{'info'}->{'image_file_search'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)

 [image src="tp/t/include/f--ile.png" text="Image description\\"\\"\\\\." ]

@image dot. 

   @image dot parent. 


Tag Table:
Node: Top52

End Tag Table
';

$result_converted_errors{'info'}->{'image_file_search'} = [
  {
    'file_name' => '',
    'error_line' => ':6: warning: Cannot find @image file `./tp/t/include/f--ile.txt\'
',
    'text' => 'Cannot find @image file `./tp/t/include/f--ile.txt\'',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 6
  },
  {
    'file_name' => '',
    'error_line' => ':9: warning: Cannot find @image file `../include/f--ile.txt\'
',
    'text' => 'Cannot find @image file `../include/f--ile.txt\'',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 9
  }
];


1;
