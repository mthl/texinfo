use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'multitable'} = {
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'aaa'
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
                  'text' => 'bb1'
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
                  'text' => 'ccc'
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
                      'text' => 'aaa '
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'cell_number' => 1
              },
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
                      'text' => 'bb '
                    },
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'anch 1'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'anchor',
                      'contents' => [],
                      'extra' => {
                        'brace_command_contents' => [
                          [
                            {}
                          ]
                        ],
                        'node_content' => [
                          {}
                        ],
                        'normalized' => 'anch-1'
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
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'cell_number' => 2
              },
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
                      'text' => 'ccc
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'cell_number' => 3
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'row_number' => 1
          },
          'parent' => {},
          'type' => 'row'
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
                }
              ],
              'extra' => {
                'cell_number' => 1
              },
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
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'anch2'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'anchor',
                      'contents' => [],
                      'extra' => {
                        'brace_command_contents' => [
                          [
                            {}
                          ]
                        ],
                        'node_content' => [
                          {}
                        ],
                        'normalized' => 'anch2'
                      },
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 5,
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
                'cell_number' => 2
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'row_number' => 2
          },
          'parent' => {},
          'type' => 'row'
        }
      ],
      'extra' => {
        'max_columns' => 3,
        'prototypes' => [
          {
            'contents' => [],
            'parent' => {},
            'type' => 'bracketed_multitable_prototype'
          },
          {
            'contents' => [],
            'parent' => {},
            'type' => 'bracketed_multitable_prototype'
          },
          {
            'contents' => [],
            'parent' => {},
            'type' => 'bracketed_multitable_prototype'
          }
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
$result_trees{'multitable'}{'contents'}[0]{'parent'} = $result_trees{'multitable'};
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[5];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'node_content'}[0] = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'contents'}[2];
$result_trees{'multitable'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'multitable'}{'contents'}[1];
$result_trees{'multitable'}{'contents'}[1]{'extra'}{'prototypes'}[0]{'contents'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'multitable'}{'contents'}[1]{'extra'}{'prototypes'}[0]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'extra'}{'prototypes'}[1]{'contents'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[3]{'contents'};
$result_trees{'multitable'}{'contents'}[1]{'extra'}{'prototypes'}[1]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'extra'}{'prototypes'}[2]{'contents'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0]{'contents'}[5]{'contents'};
$result_trees{'multitable'}{'contents'}[1]{'extra'}{'prototypes'}[2]{'parent'} = $result_trees{'multitable'}{'contents'}[1]{'args'}[0];
$result_trees{'multitable'}{'contents'}[1]{'parent'} = $result_trees{'multitable'};
$result_trees{'multitable'}{'contents'}[2]{'parent'} = $result_trees{'multitable'};

$result_texis{'multitable'} = '
@multitable {aaa} {bb1} {ccc}
@item aaa @tab bb @anchor{anch 1}
@tab ccc
@item @tab @anchor{anch2}
@end multitable
';


$result_texts{'multitable'} = '
aaa bb 
ccc

';

$result_errors{'multitable'} = [];



$result_converted{'debugcount'}->{'multitable'} = ' [1] (0,0) :text_root
  [2] (0,0) :empty_line:text
  [2] (1,1)
  [3] (1,1) @multitable
   [4] (0,0) :bracketed_multitable_prototype
    [5] (0,0) :text
    [5] (0,0)
   [4] (0,0)
   [6] (0,0) :bracketed_multitable_prototype
    [7] (0,0) :text
    [7] (0,0)
   [6] (0,0)
   [8] (0,0) :bracketed_multitable_prototype
    [9] (0,0) :text
    [9] (0,0)
   [8] (0,0)
   [10] (1,1) :before_item
   [10] (1,1)
   [11] (1,1) :row
    [12] (1,1) @item
     [13] (0,0) :empty_spaces_after_command:text
     [13] (0,0)
     [14] (0,0) :paragraph
      [15] (0,0) :text
      [15] (4,1)
     [14] (4,1)
    [12] (1,1)
    [16] (1,1) @tab
     [17] (0,0) :empty_spaces_after_command:text
     [17] (0,0)
     [18] (0,0) :paragraph
      [19] (0,0) :text
      [19] (2,0)
      [20] (2,0) @anchor
      [20] (2,0)
 locations  (1) l 0 b 2
      [21] (2,0) :text
      [21] (2,0)
     [18] (3,1)
    [16] (1,1)
    [22] (1,1) @tab
     [23] (0,0) :empty_spaces_after_command:text
     [23] (0,0)
     [24] (0,0) :paragraph
      [25] (0,0) :text
      [25] (4,1)
     [24] (4,1)
    [22] (1,1)
   [11] (17,2)
 locations  (1) l 1 b 9
   [26] (17,2) :row
    [27] (17,2) @item
     [28] (0,0) :empty_spaces_after_command:text
     [28] (0,0)
    [27] (17,2)
    [29] (17,2) @tab
     [30] (0,0) :empty_spaces_after_command:text
     [30] (0,0)
     [31] (0,0) :paragraph
      [32] (0,0) @anchor
      [32] (0,0)
 locations  (2) l 0 b 0
      [33] (0,0) :text
      [33] (0,0)
     [31] (0,0)
    [29] (17,2)
   [26] (24,3)
 locations  (2) l 2 b 23
  [3] (24,3)
  [34] (24,3) :empty_line_after_command:text
  [34] (24,3)
 [1] (24,3)

aaa   bb    ccc
      
';

1;
