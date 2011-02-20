use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'printindex'} = {
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
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'index entry'
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
          'cmdname' => 'cindex',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'cindex',
              'index_name' => 'cp',
              'index_prefix' => 'c',
              'key' => 'index entry',
              'node' => {},
              'number' => 1
            },
            'misc_content' => []
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
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
                  'text' => 'index entry'
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
          'cmdname' => 'cindex',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'cindex',
              'index_name' => 'cp',
              'index_prefix' => 'c',
              'key' => 'index entry',
              'node' => {},
              'number' => 2
            },
            'misc_content' => []
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 4,
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
                  'text' => 'looooooooooooooooooooooooooooooooooooooooooooooooooooooooooong index entry'
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
          'cmdname' => 'cindex',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'cindex',
              'index_name' => 'cp',
              'index_prefix' => 'c',
              'key' => 'looooooooooooooooooooooooooooooooooooooooooooooooooooooooooong index entry',
              'node' => {},
              'number' => 3
            },
            'misc_content' => []
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
                  'text' => 'cp'
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
          'cmdname' => 'printindex',
          'extra' => {
            'misc_args' => [
              'cp'
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
                  'text' => 'after index'
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
          'cmdname' => 'cindex',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'cindex',
              'index_name' => 'cp',
              'index_prefix' => 'c',
              'key' => 'after index',
              'node' => {},
              'number' => 4
            },
            'misc_content' => []
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
                  'text' => 'cp'
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
          'cmdname' => 'printindex',
          'extra' => {
            'misc_args' => [
              'cp'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 11,
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
                  'text' => 'a counting anchor'
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
            'normalized' => 'a-counting-anchor'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 13,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'text' => '
',
          'type' => 'empty_spaces_after_close_brace'
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
$result_trees{'printindex'}{'contents'}[0]{'parent'} = $result_trees{'printindex'};
$result_trees{'printindex'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'printindex'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'node'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[1]{'extra'}{'misc_content'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'content'};
$result_trees{'printindex'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[2];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[2]{'extra'}{'index_entry'}{'command'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[2];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[2]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'printindex'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[2]{'extra'}{'index_entry'}{'node'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[2]{'extra'}{'misc_content'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[2]{'extra'}{'index_entry'}{'content'};
$result_trees{'printindex'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[3];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[3];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'printindex'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'node'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[3]{'extra'}{'misc_content'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content'};
$result_trees{'printindex'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[5]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[5]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[5]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[5];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[7];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[7]{'extra'}{'index_entry'}{'command'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[7];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[7]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'printindex'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[7]{'extra'}{'index_entry'}{'node'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[7]{'extra'}{'misc_content'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[7]{'extra'}{'index_entry'}{'content'};
$result_trees{'printindex'}{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[9]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[9]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[9]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[9];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[11]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[11];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[11]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'printindex'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[11]{'extra'}{'node_content'}[0] = $result_trees{'printindex'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[11]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'printindex'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'printindex'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'printindex'}{'contents'}[1]{'parent'} = $result_trees{'printindex'};

$result_texis{'printindex'} = '@node Top

@cindex index entry
@cindex index entry
@cindex looooooooooooooooooooooooooooooooooooooooooooooooooooooooooong index entry

@printindex cp

@cindex after index

@printindex cp

@anchor{a counting anchor}
';


$result_texts{'printindex'} = '




';

$result_sectioning{'printindex'} = {};

$result_nodes{'printindex'} = {
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

$result_menus{'printindex'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'printindex'} = [];



$result_converted{'debugcount'}->{'printindex'} = ' [1] (0,0) :element
  [2] (0,0) :text_root
  [2] (0,0)
  [3] (0,0) @node
   [4] (18,0) :code
    [5] (18,0) :text|Top|
    [5] (18,0)
 locations  (1) l 0 b 1
   [4] (18,0)
   [6] (28,0) :code
    [7] (28,0) :text|(|
    [7] (28,0)
    [8] (28,0) :text|dir|
    [8] (28,0)
    [9] (28,0) :text|)|
    [9] (28,0)
   [6] (28,0)
   [10] (35,3) :empty_line:text|\\n|
   [10] (35,3)
   [11] (35,3) @cindex
   [11] (35,3)
 locations  (2) l 3
   [12] (35,3) @cindex
   [12] (35,3)
 locations  (3) l 3
   [13] (35,3) @cindex
   [13] (35,3)
 locations  (4) l 3
   [14] (35,3) :empty_line:text|\\n|
   [14] (35,3)
   [15] (35,3) @printindex
    [16] (56,6) :frenchspacing
     [17] (56,6) :text|after index|
     [17] (61,6)
    [16] (61,6)
    [18] (97,6) :code
     [19] (97,6) :text|Top|
     [19] (97,6)
    [18] (97,6)
    [20] (129,7) :frenchspacing
     [21] (129,7) :text|index entry|
     [21] (134,7)
    [20] (134,7)
    [22] (170,7) :code
     [23] (170,7) :text|Top|
     [23] (170,7)
    [22] (170,7)
    [24] (202,8) :frenchspacing
     [25] (202,8) :text|index entry|
     [25] (207,8)
    [24] (207,8)
    [26] (243,8) :code
     [27] (243,8) :text|Top|
     [27] (243,8)
    [26] (243,8)
    [28] (275,9) :frenchspacing
     [29] (275,9) :text|looooooooooooooooooooooooooooooooooooooooooooooooooooooooooong index entry|
     [29] (343,9)
    [28] (343,9)
    [30] (353,9) :code
     [31] (353,9) :text|Top|
     [31] (353,9)
    [30] (353,9)
   [15] (432,12)
   [32] (432,12) :empty_line:text|\\n|
   [32] (432,12)
   [33] (432,12) @cindex
   [33] (432,12)
 locations  (5) l 12
   [34] (432,12) :empty_line:text|\\n|
   [34] (432,12)
   [35] (432,12) @printindex
    [36] (453,15) :frenchspacing
     [37] (453,15) :text|after index|
     [37] (458,15)
    [36] (458,15)
    [38] (494,15) :code
     [39] (494,15) :text|Top|
     [39] (494,15)
    [38] (494,15)
    [40] (526,16) :frenchspacing
     [41] (526,16) :text|index entry|
     [41] (531,16)
    [40] (531,16)
    [42] (567,16) :code
     [43] (567,16) :text|Top|
     [43] (567,16)
    [42] (567,16)
    [44] (599,17) :frenchspacing
     [45] (599,17) :text|index entry|
     [45] (604,17)
    [44] (604,17)
    [46] (640,17) :code
     [47] (640,17) :text|Top|
     [47] (640,17)
    [46] (640,17)
    [48] (672,18) :frenchspacing
     [49] (672,18) :text|looooooooooooooooooooooooooooooooooooooooooooooooooooooooooong index entry|
     [49] (740,18)
    [48] (740,18)
    [50] (750,18) :code
     [51] (750,18) :text|Top|
     [51] (750,18)
    [50] (750,18)
   [35] (829,21)
   [52] (829,21) :empty_line:text|\\n|
   [52] (829,21)
   [53] (829,21) @anchor
   [53] (829,21)
 locations  (6) l 21 b 829
   [54] (829,21) :empty_spaces_after_close_brace:text|\\n|
   [54] (829,21)
  [3] (829,21)
 [1] (829,21)


File: ,  Node: Top,  Up: (dir)

 [index ]
* Menu:

* after index:                           Top.                   (line 4)
* index entry:                           Top.                   (line 3)
* index entry <1>:                       Top.                   (line 3)
* looooooooooooooooooooooooooooooooooooooooooooooooooooooooooong index entry: Top.
                                                                (line 3)

 [index ]
* Menu:

* after index:                           Top.                  (line 12)
* index entry:                           Top.                  (line  3)
* index entry <1>:                       Top.                  (line  3)
* looooooooooooooooooooooooooooooooooooooooooooooooooooooooooong index entry: Top.
                                                               (line  3)

';


$result_converted{'info'}->{'printindex'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)

 [index ]
* Menu:

* after index:                           Top.                   (line 4)
* index entry:                           Top.                   (line 3)
* index entry <1>:                       Top.                   (line 3)
* looooooooooooooooooooooooooooooooooooooooooooooooooooooooooong index entry: Top.
                                                                (line 3)

 [index ]
* Menu:

* after index:                           Top.                  (line 12)
* index entry:                           Top.                  (line  3)
* index entry <1>:                       Top.                  (line  3)
* looooooooooooooooooooooooooooooooooooooooooooooooooooooooooong index entry: Top.
                                                               (line  3)



Tag Table:
Node: Top52
Ref: a counting anchor880

End Tag Table
';

1;
