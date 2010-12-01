use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'double_top_section'} = {
  'contents' => [
    {
      'contents' => [],
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
              'text' => 'First top'
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
      'cmdname' => 'top',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'First top.
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
              'text' => 'Second top'
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
      'cmdname' => 'top',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Second top.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
        'line_nr' => 5,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'double_top_section'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_top_section'}{'contents'}[1]{'args'}[0];
$result_trees{'double_top_section'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_top_section'}{'contents'}[1]{'args'}[0];
$result_trees{'double_top_section'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_top_section'}{'contents'}[1]{'args'}[0];
$result_trees{'double_top_section'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'double_top_section'}{'contents'}[1];
$result_trees{'double_top_section'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_top_section'}{'contents'}[1];
$result_trees{'double_top_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_top_section'}{'contents'}[1]{'contents'}[1];
$result_trees{'double_top_section'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'double_top_section'}{'contents'}[1];
$result_trees{'double_top_section'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'double_top_section'}{'contents'}[1];
$result_trees{'double_top_section'}{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'double_top_section'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'double_top_section'}{'contents'}[1]{'parent'} = $result_trees{'double_top_section'};
$result_trees{'double_top_section'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_top_section'}{'contents'}[2]{'args'}[0];
$result_trees{'double_top_section'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_top_section'}{'contents'}[2]{'args'}[0];
$result_trees{'double_top_section'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_top_section'}{'contents'}[2]{'args'}[0];
$result_trees{'double_top_section'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'double_top_section'}{'contents'}[2];
$result_trees{'double_top_section'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'double_top_section'}{'contents'}[2];
$result_trees{'double_top_section'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_top_section'}{'contents'}[2]{'contents'}[1];
$result_trees{'double_top_section'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'double_top_section'}{'contents'}[2];
$result_trees{'double_top_section'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'double_top_section'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'double_top_section'}{'contents'}[2]{'parent'} = $result_trees{'double_top_section'};

$result_texis{'double_top_section'} = '@top First top

First top.

@top Second top

Second top.
';


$result_texts{'double_top_section'} = 'First top
*********

First top.

Second top
**********

Second top.
';

$result_sectioning{'double_top_section'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'top',
      'extra' => {},
      'level' => 0,
      'section_up' => {}
    },
    {
      'cmdname' => 'top',
      'extra' => {},
      'level' => 0,
      'section_prev' => {},
      'section_up' => {}
    }
  ]
};
$result_sectioning{'double_top_section'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'double_top_section'};
$result_sectioning{'double_top_section'}{'section_childs'}[1]{'section_prev'} = $result_sectioning{'double_top_section'}{'section_childs'}[0];
$result_sectioning{'double_top_section'}{'section_childs'}[1]{'section_up'} = $result_sectioning{'double_top_section'};

$result_errors{'double_top_section'} = [
  {
    'error_line' => ':5: @top already exists
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@top already exists',
    'type' => 'error'
  }
];


1;
