use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements);

use utf8;

$result_trees{'part_before_section'} = [
  {
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
                'extra' => {
                  'command' => {}
                },
                'parent' => {},
                'text' => ' ',
                'type' => 'empty_spaces_after_command'
              },
              {
                'parent' => {},
                'text' => 'part'
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
        'cmdname' => 'part',
        'contents' => [
          {
            'parent' => {},
            'text' => '
',
            'type' => 'empty_line'
          }
        ],
        'extra' => {
          'misc_content' => [
            {}
          ]
        },
        'level' => 0,
        'line_nr' => {
          'file_name' => '',
          'line_nr' => 1,
          'macro' => ''
        },
        'parent' => {}
      }
    ],
    'extra' => {
      'element_command' => {},
      'section' => {}
    },
    'type' => 'element'
  },
  {
    'contents' => [
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
                'text' => 'section'
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
        'cmdname' => 'section',
        'contents' => [],
        'extra' => {
          'associated_part' => {},
          'misc_content' => [
            {}
          ]
        },
        'level' => 1,
        'line_nr' => {
          'file_name' => '',
          'line_nr' => 3,
          'macro' => ''
        },
        'number' => 1,
        'parent' => {}
      }
    ],
    'element_prev' => {},
    'extra' => {
      'element_command' => {},
      'section' => {}
    },
    'type' => 'element'
  }
];
$result_trees{'part_before_section'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_before_section'}[0];
$result_trees{'part_before_section'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_before_section'}[0]{'contents'}[1];
$result_trees{'part_before_section'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_before_section'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'part_before_section'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_before_section'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'part_before_section'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_before_section'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'part_before_section'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'part_before_section'}[0]{'contents'}[1];
$result_trees{'part_before_section'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'part_before_section'}[0]{'contents'}[1];
$result_trees{'part_before_section'}[0]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'part_before_section'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'part_before_section'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_before_section'}[0];
$result_trees{'part_before_section'}[0]{'extra'}{'element_command'} = $result_trees{'part_before_section'}[0]{'contents'}[1];
$result_trees{'part_before_section'}[0]{'extra'}{'section'} = $result_trees{'part_before_section'}[0]{'contents'}[1];
$result_trees{'part_before_section'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_before_section'}[1]{'contents'}[0];
$result_trees{'part_before_section'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_before_section'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'part_before_section'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_before_section'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'part_before_section'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_before_section'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'part_before_section'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'part_before_section'}[1]{'contents'}[0];
$result_trees{'part_before_section'}[1]{'contents'}[0]{'extra'}{'associated_part'} = $result_trees{'part_before_section'}[0]{'contents'}[1];
$result_trees{'part_before_section'}[1]{'contents'}[0]{'extra'}{'misc_content'}[0] = $result_trees{'part_before_section'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'part_before_section'}[1]{'contents'}[0]{'parent'} = $result_trees{'part_before_section'}[1];
$result_trees{'part_before_section'}[1]{'element_prev'} = $result_trees{'part_before_section'}[0];
$result_trees{'part_before_section'}[1]{'extra'}{'element_command'} = $result_trees{'part_before_section'}[1]{'contents'}[0];
$result_trees{'part_before_section'}[1]{'extra'}{'section'} = $result_trees{'part_before_section'}[1]{'contents'}[0];

$result_texis{'part_before_section'} = '@part part

@section section 
';


$result_texts{'part_before_section'} = 'part
****

1 section
*********
';

$result_sectioning{'part_before_section'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'part',
      'extra' => {},
      'level' => 0,
      'section_childs' => [
        {
          'cmdname' => 'section',
          'extra' => {
            'associated_part' => {}
          },
          'level' => 1,
          'number' => 1,
          'section_up' => {}
        }
      ],
      'section_up' => {}
    }
  ]
};
$result_sectioning{'part_before_section'}{'section_childs'}[0]{'section_childs'}[0]{'extra'}{'associated_part'} = $result_sectioning{'part_before_section'}{'section_childs'}[0];
$result_sectioning{'part_before_section'}{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'part_before_section'}{'section_childs'}[0];
$result_sectioning{'part_before_section'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'part_before_section'};

$result_errors{'part_before_section'} = [
  {
    'error_line' => ':3: Upping the section level of @section which is too low
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'Upping the section level of @section which is too low',
    'type' => 'error'
  }
];


$result_elements{'part_before_section'} = [
  {
    'extra' => {
      'directions' => {
        'FastForward' => {
          'extra' => {
            'directions' => {
              'Back' => {},
              'FastBack' => {},
              'This' => {},
              'Up' => {}
            },
            'element_command' => {
              'cmdname' => 'section',
              'extra' => {
                'associated_part' => {
                  'cmdname' => 'part',
                  'extra' => {},
                  'level' => 0
                }
              },
              'level' => 1,
              'number' => 1
            },
            'section' => {}
          },
          'type' => 'element'
        },
        'Forward' => {},
        'This' => {},
        'Up' => undef
      },
      'element_command' => {},
      'section' => {}
    },
    'type' => 'element'
  },
  {}
];
$result_elements{'part_before_section'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Back'} = $result_elements{'part_before_section'}[0];
$result_elements{'part_before_section'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'FastBack'} = $result_elements{'part_before_section'}[0];
$result_elements{'part_before_section'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'This'} = $result_elements{'part_before_section'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'part_before_section'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Up'} = $result_elements{'part_before_section'}[0];
$result_elements{'part_before_section'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'section'} = $result_elements{'part_before_section'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'element_command'};
$result_elements{'part_before_section'}[0]{'extra'}{'directions'}{'Forward'} = $result_elements{'part_before_section'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'part_before_section'}[0]{'extra'}{'directions'}{'This'} = $result_elements{'part_before_section'}[0];
$result_elements{'part_before_section'}[0]{'extra'}{'element_command'} = $result_elements{'part_before_section'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'element_command'}{'extra'}{'associated_part'};
$result_elements{'part_before_section'}[0]{'extra'}{'section'} = $result_elements{'part_before_section'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'element_command'}{'extra'}{'associated_part'};
$result_elements{'part_before_section'}[1] = $result_elements{'part_before_section'}[0]{'extra'}{'directions'}{'FastForward'};


1;
