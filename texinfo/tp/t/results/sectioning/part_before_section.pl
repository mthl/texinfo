use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'part_before_section'} = {
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
  'type' => 'document_root'
};
$result_trees{'part_before_section'}{'contents'}[0]{'parent'} = $result_trees{'part_before_section'};
$result_trees{'part_before_section'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_before_section'}{'contents'}[1]{'args'}[0];
$result_trees{'part_before_section'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_before_section'}{'contents'}[1]{'args'}[0];
$result_trees{'part_before_section'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_before_section'}{'contents'}[1]{'args'}[0];
$result_trees{'part_before_section'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'part_before_section'}{'contents'}[1];
$result_trees{'part_before_section'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'part_before_section'}{'contents'}[1];
$result_trees{'part_before_section'}{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'part_before_section'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'part_before_section'}{'contents'}[1]{'parent'} = $result_trees{'part_before_section'};
$result_trees{'part_before_section'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_before_section'}{'contents'}[2]{'args'}[0];
$result_trees{'part_before_section'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_before_section'}{'contents'}[2]{'args'}[0];
$result_trees{'part_before_section'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_before_section'}{'contents'}[2]{'args'}[0];
$result_trees{'part_before_section'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'part_before_section'}{'contents'}[2];
$result_trees{'part_before_section'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'part_before_section'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'part_before_section'}{'contents'}[2]{'parent'} = $result_trees{'part_before_section'};

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
          'extra' => {},
          'level' => 1,
          'number' => 1,
          'section_up' => {}
        }
      ],
      'section_up' => {}
    }
  ]
};
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


1;
