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
            'line_nr' => 6,
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
              'number' => 3
            },
            'misc_content' => []
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 8,
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
            'line_nr' => 10,
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
            'line_nr' => 12,
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
$result_trees{'printindex'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[4];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[6]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[6]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[6]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[6];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[6]{'extra'}{'index_entry'}{'command'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[6];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[6]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'printindex'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[6]{'extra'}{'index_entry'}{'node'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[6]{'extra'}{'misc_content'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[6]{'extra'}{'index_entry'}{'content'};
$result_trees{'printindex'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[8]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[8]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[8]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[8];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[10]{'args'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'printindex'}{'contents'}[1]{'contents'}[10];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[10]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'printindex'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[10]{'extra'}{'node_content'}[0] = $result_trees{'printindex'}{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[0];
$result_trees{'printindex'}{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'printindex'}{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'printindex'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'printindex'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'printindex'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'printindex'}{'contents'}[1]{'parent'} = $result_trees{'printindex'};

$result_texis{'printindex'} = '@node Top

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
   [13] (35,3) :empty_line:text|\\n|
   [13] (35,3)
   [14] (35,3) @printindex
    [15] (56,6) :frenchspacing
     [16] (56,6) :text|after index|
     [16] (61,6)
    [15] (61,6)
    [17] (97,6) :code
     [18] (97,6) :text|Top|
     [18] (97,6)
    [17] (97,6)
    [19] (129,7) :frenchspacing
     [20] (129,7) :text|index entry|
     [20] (134,7)
    [19] (134,7)
    [21] (170,7) :code
     [22] (170,7) :text|Top|
     [22] (170,7)
    [21] (170,7)
    [23] (202,8) :frenchspacing
     [24] (202,8) :text|looooooooooooooooooooooooooooooooooooooooooooooooooooooooooong index entry|
     [24] (270,8)
    [23] (270,8)
    [25] (280,8) :code
     [26] (280,8) :text|Top|
     [26] (280,8)
    [25] (280,8)
   [14] (359,11)
   [27] (359,11) :empty_line:text|\\n|
   [27] (359,11)
   [28] (359,11) @cindex
   [28] (359,11)
 locations  (4) l 11
   [29] (359,11) :empty_line:text|\\n|
   [29] (359,11)
   [30] (359,11) @printindex
    [31] (380,14) :frenchspacing
     [32] (380,14) :text|after index|
     [32] (385,14)
    [31] (385,14)
    [33] (421,14) :code
     [34] (421,14) :text|Top|
     [34] (421,14)
    [33] (421,14)
    [35] (453,15) :frenchspacing
     [36] (453,15) :text|index entry|
     [36] (458,15)
    [35] (458,15)
    [37] (494,15) :code
     [38] (494,15) :text|Top|
     [38] (494,15)
    [37] (494,15)
    [39] (526,16) :frenchspacing
     [40] (526,16) :text|looooooooooooooooooooooooooooooooooooooooooooooooooooooooooong index entry|
     [40] (594,16)
    [39] (594,16)
    [41] (604,16) :code
     [42] (604,16) :text|Top|
     [42] (604,16)
    [41] (604,16)
   [30] (683,19)
   [43] (683,19) :empty_line:text|\\n|
   [43] (683,19)
   [44] (683,19) @anchor
   [44] (683,19)
 locations  (5) l 19 b 683
   [45] (683,19) :empty_spaces_after_close_brace:text|\\n|
   [45] (683,19)
  [3] (683,19)
 [1] (683,19)


File: ,  Node: Top,  Up: (dir)

 [index ]
* Menu:

* after index:                           Top.                   (line 4)
* index entry:                           Top.                   (line 3)
* looooooooooooooooooooooooooooooooooooooooooooooooooooooooooong index entry: Top.
                                                                (line 3)

 [index ]
* Menu:

* after index:                           Top.                  (line 11)
* index entry:                           Top.                  (line  3)
* looooooooooooooooooooooooooooooooooooooooooooooooooooooooooong index entry: Top.
                                                               (line  3)

';


$result_converted{'info'}->{'printindex'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)

 [index ]
* Menu:

* after index:                           Top.                   (line 4)
* index entry:                           Top.                   (line 3)
* looooooooooooooooooooooooooooooooooooooooooooooooooooooooooong index entry: Top.
                                                                (line 3)

 [index ]
* Menu:

* after index:                           Top.                  (line 11)
* index entry:                           Top.                  (line  3)
* looooooooooooooooooooooooooooooooooooooooooooooooooooooooooong index entry: Top.
                                                               (line  3)



Tag Table:
Node: Top52
Ref: a counting anchor734

End Tag Table
';

1;
