use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'setfilename_on_top_and_after_node'} = {
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
      'contents' => [],
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
              'text' => 'In top'
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'spaces_at_end'
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
                      'text' => 'very badly placed setfilename'
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
              'cmdname' => 'setfilename',
              'extra' => {
                'invalid_nesting' => 1,
                'text_arg' => 'very badly placed setfilename'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 2,
                'macro' => ''
              },
              'parent' => {}
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
                  'text' => 'a bit too late'
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
          'cmdname' => 'setfilename',
          'extra' => {
            'text_arg' => 'a bit too late'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 4,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'misc_content' => [
          {},
          {},
          {}
        ]
      },
      'level' => 0,
      'line_nr' => {},
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[0]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'};
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[1]{'args'}[0];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[1]{'args'}[0];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[1]{'args'}[0];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[1];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[1]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'};
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[3];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'contents'}[1];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'extra'}{'misc_content'}[1] = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[2];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'extra'}{'misc_content'}[2] = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[3];
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'line_nr'} = $result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'setfilename_on_top_and_after_node'}{'contents'}[2]{'parent'} = $result_trees{'setfilename_on_top_and_after_node'};

$result_texis{'setfilename_on_top_and_after_node'} = '@node Top
@top In top @setfilename very badly placed setfilename

@setfilename a bit too late
';


$result_texts{'setfilename_on_top_and_after_node'} = 'In top
******

';

$result_sectioning{'setfilename_on_top_and_after_node'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'top',
      'extra' => {
        'associated_node' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'Top'
          }
        }
      },
      'level' => 0,
      'section_up' => {}
    }
  ]
};
$result_sectioning{'setfilename_on_top_and_after_node'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'setfilename_on_top_and_after_node'};

$result_nodes{'setfilename_on_top_and_after_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'level' => 0
    },
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

$result_menus{'setfilename_on_top_and_after_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'setfilename_on_top_and_after_node'} = [
  {
    'error_line' => ':2: warning: @setfilename should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@setfilename should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':2: warning: @setfilename should not appear in @top
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@setfilename should not appear in @top',
    'type' => 'warning'
  },
  {
    'error_line' => ':4: warning: Multiple @setfilename
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'Multiple @setfilename',
    'type' => 'warning'
  }
];


1;
