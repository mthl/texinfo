use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'chapter_before_part'} = [
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
                'text' => 'chapter'
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
        'cmdname' => 'chapter',
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
        'level' => 1,
        'line_nr' => {
          'file_name' => '',
          'line_nr' => 1,
          'macro' => ''
        },
        'number' => 1,
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
        'contents' => [],
        'extra' => {
          'misc_content' => [
            {}
          ]
        },
        'level' => 0,
        'line_nr' => {
          'file_name' => '',
          'line_nr' => 3,
          'macro' => ''
        },
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
$result_trees{'chapter_before_part'}[0]{'contents'}[0]{'parent'} = $result_trees{'chapter_before_part'}[0];
$result_trees{'chapter_before_part'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'chapter_before_part'}[0]{'contents'}[1];
$result_trees{'chapter_before_part'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'chapter_before_part'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'chapter_before_part'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'chapter_before_part'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'chapter_before_part'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'chapter_before_part'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'chapter_before_part'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'chapter_before_part'}[0]{'contents'}[1];
$result_trees{'chapter_before_part'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'chapter_before_part'}[0]{'contents'}[1];
$result_trees{'chapter_before_part'}[0]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'chapter_before_part'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'chapter_before_part'}[0]{'contents'}[1]{'parent'} = $result_trees{'chapter_before_part'}[0];
$result_trees{'chapter_before_part'}[0]{'extra'}{'element_command'} = $result_trees{'chapter_before_part'}[0]{'contents'}[1];
$result_trees{'chapter_before_part'}[0]{'extra'}{'section'} = $result_trees{'chapter_before_part'}[0]{'contents'}[1];
$result_trees{'chapter_before_part'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'chapter_before_part'}[1]{'contents'}[0];
$result_trees{'chapter_before_part'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'chapter_before_part'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'chapter_before_part'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'chapter_before_part'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'chapter_before_part'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'chapter_before_part'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'chapter_before_part'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'chapter_before_part'}[1]{'contents'}[0];
$result_trees{'chapter_before_part'}[1]{'contents'}[0]{'extra'}{'misc_content'}[0] = $result_trees{'chapter_before_part'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'chapter_before_part'}[1]{'contents'}[0]{'parent'} = $result_trees{'chapter_before_part'}[1];
$result_trees{'chapter_before_part'}[1]{'element_prev'} = $result_trees{'chapter_before_part'}[0];
$result_trees{'chapter_before_part'}[1]{'extra'}{'element_command'} = $result_trees{'chapter_before_part'}[1]{'contents'}[0];
$result_trees{'chapter_before_part'}[1]{'extra'}{'section'} = $result_trees{'chapter_before_part'}[1]{'contents'}[0];

$result_texis{'chapter_before_part'} = '@chapter chapter

@part part
';


$result_texts{'chapter_before_part'} = '1 chapter
*********

part
****
';

$result_sectioning{'chapter_before_part'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'chapter',
      'extra' => {},
      'level' => 1,
      'number' => 1,
      'section_up' => {}
    },
    {
      'cmdname' => 'part',
      'extra' => {},
      'level' => 0,
      'section_up' => {}
    }
  ]
};
$result_sectioning{'chapter_before_part'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'chapter_before_part'};
$result_sectioning{'chapter_before_part'}{'section_childs'}[1]{'section_up'} = $result_sectioning{'chapter_before_part'};

$result_errors{'chapter_before_part'} = [];


$result_elements{'chapter_before_part'} = [
  {
    'extra' => {
      'directions' => {
        'Forward' => {
          'extra' => {
            'directions' => {
              'Back' => {},
              'This' => {}
            },
            'element_command' => {
              'cmdname' => 'part',
              'extra' => {},
              'level' => 0
            },
            'section' => {}
          },
          'type' => 'element'
        },
        'This' => {}
      },
      'element_command' => {
        'cmdname' => 'chapter',
        'extra' => {},
        'level' => 1,
        'number' => 1
      },
      'section' => {}
    },
    'type' => 'element'
  },
  {}
];
$result_elements{'chapter_before_part'}[0]{'extra'}{'directions'}{'Forward'}{'extra'}{'directions'}{'Back'} = $result_elements{'chapter_before_part'}[0];
$result_elements{'chapter_before_part'}[0]{'extra'}{'directions'}{'Forward'}{'extra'}{'directions'}{'This'} = $result_elements{'chapter_before_part'}[0]{'extra'}{'directions'}{'Forward'};
$result_elements{'chapter_before_part'}[0]{'extra'}{'directions'}{'Forward'}{'extra'}{'section'} = $result_elements{'chapter_before_part'}[0]{'extra'}{'directions'}{'Forward'}{'extra'}{'element_command'};
$result_elements{'chapter_before_part'}[0]{'extra'}{'directions'}{'This'} = $result_elements{'chapter_before_part'}[0];
$result_elements{'chapter_before_part'}[0]{'extra'}{'section'} = $result_elements{'chapter_before_part'}[0]{'extra'}{'element_command'};
$result_elements{'chapter_before_part'}[1] = $result_elements{'chapter_before_part'}[0]{'extra'}{'directions'}{'Forward'};



$result_directions_text{'chapter_before_part'} = 'element: @chapter chapter
  Forward: @part part
  This: @chapter chapter
element: @part part
  Back: @chapter chapter
  This: @part part
';


$result_converted{'plaintext'}->{'chapter_before_part'} = '1 chapter
*********

';

1;
