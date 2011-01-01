use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'footnote_in_caption'} = {
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
              'text' => 'fl'
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
      'cmdname' => 'listoffloats',
      'extra' => {
        'type' => {
          'content' => [
            {}
          ],
          'normalized' => 'fl'
        }
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
              'text' => 'fl'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'label'
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
      'cmdname' => 'float',
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'In float.
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in caption'
                    },
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'in footnote'
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
                        'line_nr' => 5,
                        'macro' => ''
                      },
                      'parent' => {}
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
          'cmdname' => 'caption',
          'contents' => [],
          'extra' => {
            'float' => {}
          },
          'line_nr' => {},
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ],
          [
            {}
          ]
        ],
        'caption' => {},
        'node_content' => [
          {}
        ],
        'normalized' => 'label',
        'type' => {
          'content' => [
            {}
          ],
          'normalized' => 'fl'
        }
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 3,
        'macro' => ''
      },
      'number' => 1,
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
$result_trees{'footnote_in_caption'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[0]{'args'}[0];
$result_trees{'footnote_in_caption'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[0]{'args'}[0];
$result_trees{'footnote_in_caption'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[0]{'args'}[0];
$result_trees{'footnote_in_caption'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[0];
$result_trees{'footnote_in_caption'}{'contents'}[0]{'extra'}{'type'}{'content'}[0] = $result_trees{'footnote_in_caption'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'footnote_in_caption'}{'contents'}[0]{'parent'} = $result_trees{'footnote_in_caption'};
$result_trees{'footnote_in_caption'}{'contents'}[1]{'parent'} = $result_trees{'footnote_in_caption'};
$result_trees{'footnote_in_caption'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2]{'args'}[0];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2]{'args'}[0];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2]{'args'}[1];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2]{'args'}[1];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[0];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'extra'}{'float'} = $result_trees{'footnote_in_caption'}{'contents'}[2];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'line_nr'} = $result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'footnote_in_caption'}{'contents'}[2];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'footnote_in_caption'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'footnote_in_caption'}{'contents'}[2]{'args'}[1]{'contents'}[1];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'extra'}{'caption'} = $result_trees{'footnote_in_caption'}{'contents'}[2]{'contents'}[1];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'footnote_in_caption'}{'contents'}[2]{'args'}[1]{'contents'}[1];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'extra'}{'type'}{'content'}[0] = $result_trees{'footnote_in_caption'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'footnote_in_caption'}{'contents'}[2]{'parent'} = $result_trees{'footnote_in_caption'};
$result_trees{'footnote_in_caption'}{'contents'}[3]{'parent'} = $result_trees{'footnote_in_caption'};

$result_texis{'footnote_in_caption'} = '@listoffloats fl

@float fl, label
In float.
@caption{in caption@footnote{in footnote}}
@end float
';


$result_texts{'footnote_in_caption'} = '
In float.

';

$result_errors{'footnote_in_caption'} = [];


$result_floats{'footnote_in_caption'} = {
  'fl' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'label',
        'type' => {
          'content' => [
            {
              'text' => 'fl'
            }
          ],
          'normalized' => 'fl'
        }
      },
      'number' => 1
    }
  ]
};
$result_floats{'footnote_in_caption'}{'fl'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'footnote_in_caption'}{'fl'}[0];



$result_converted{'plaintext'}->{'footnote_in_caption'} = '
* Menu:

* fl 1: label.                           in caption(0)

In float.
fl 1: in caption(1)

   ---------- Footnotes ----------

   (1) in footnote

';

1;
