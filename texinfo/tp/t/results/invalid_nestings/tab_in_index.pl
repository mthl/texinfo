use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'tab_in_index'} = {
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'one nonlettered character'
                }
              ],
              'parent' => {},
              'type' => 'bracketed'
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'normal text'
                }
              ],
              'parent' => {},
              'type' => 'bracketed'
            },
            {
              'parent' => {},
              'text' => '
'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'multitable',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'contents' => [
            {
              'cmdname' => 'item',
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'one nonlettered character '
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {}
            },
            {
              'cmdname' => 'tab',
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'aaa
'
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
                              'text' => 'in index entry '
                            },
                            {
                              'parent' => {},
                              'text' => ' ',
                              'type' => 'empty_spaces_after_command'
                            },
                            {
                              'parent' => {},
                              'text' => 'in tab'
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
                      'cmdname' => 'vindex',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {}
            }
          ],
          'extra' => {
            'cell_number' => 2
          },
          'parent' => {},
          'type' => 'row'
        }
      ],
      'extra' => {
        'max_columns' => 2,
        'prototypes' => [
          {},
          {}
        ]
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1];
$result_trees{'tab_in_index'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'tab_in_index'}{'contents'}[0];
$result_trees{'tab_in_index'}{'contents'}[0]{'extra'}{'prototypes'}[0] = $result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'tab_in_index'}{'contents'}[0]{'extra'}{'prototypes'}[1] = $result_trees{'tab_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'tab_in_index'}{'contents'}[0]{'parent'} = $result_trees{'tab_in_index'};
$result_trees{'tab_in_index'}{'contents'}[1]{'parent'} = $result_trees{'tab_in_index'};

$result_texis{'tab_in_index'} = '@multitable {one nonlettered character} {normal text}
@item one nonlettered character @tab aaa
@vindex in index entry  in tab
@end multitable
';


$result_texts{'tab_in_index'} = 'one nonlettered character aaa
';

$result_errors{'tab_in_index'} = [
  {
    'error_line' => ':3: warning: @tab should not appear in @vindex
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@tab should not appear in @vindex',
    'type' => 'warning'
  },
  {
    'error_line' => ':3: ignoring @tab outside of multitable
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'ignoring @tab outside of multitable',
    'type' => 'error'
  }
];


$result_indices{'tab_in_index'} = undef;


1;
