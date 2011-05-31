use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'commands'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'TeX',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '. Ab. '
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '. '
        },
        {
          'cmdname' => '
',
          'parent' => {}
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'e'
            }
          ],
          'cmdname' => '~',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ', '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'i'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'dotless',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 2,
                    'macro' => ''
                  },
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => '^',
          'contents' => [],
          'line_nr' => {},
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
    },
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
          'text' => 'Hohoh'
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => '2'
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
      'cmdname' => 'sp',
      'extra' => {
        'misc_args' => [
          '2'
        ]
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
              'text' => '3'
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
      'cmdname' => 'sp',
      'extra' => {
        'misc_args' => [
          '3'
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
      'cmdname' => 'example',
      'contents' => [
        {
          'parent' => {},
          'text' => ' 
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'truc
'
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
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
                  'text' => 'example'
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
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'example',
            'text_arg' => 'example'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 10,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {}
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
              'cmdname' => 'samp',
              'parent' => {},
              'type' => 'command_as_argument'
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
      'cmdname' => 'vtable',
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
                  'text' => 'vitem table'
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
          'cmdname' => 'item',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'vtable',
              'index_name' => 'vr',
              'index_prefix' => 'v',
              'number' => 1
            },
            'misc_content' => []
          },
          'parent' => {}
        },
        {
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
                  'text' => 'text
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {},
          'type' => 'table_item'
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
                  'text' => 'vtable'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'vtable',
            'text_arg' => 'vtable'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 16,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'command_as_argument' => {},
        'end_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 12,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'commands'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[5];
$result_trees{'commands'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[7];
$result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[1]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[2];
$result_trees{'commands'}{'contents'}[2]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[3]{'args'}[0];
$result_trees{'commands'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[3]{'args'}[0];
$result_trees{'commands'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[3]{'args'}[0];
$result_trees{'commands'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[3];
$result_trees{'commands'}{'contents'}[3]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[4]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[5]{'args'}[0];
$result_trees{'commands'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[5]{'args'}[0];
$result_trees{'commands'}{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[5]{'args'}[0];
$result_trees{'commands'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[5];
$result_trees{'commands'}{'contents'}[5]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[6]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[7];
$result_trees{'commands'}{'contents'}[7]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[7]{'contents'}[1];
$result_trees{'commands'}{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[7];
$result_trees{'commands'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'commands'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'commands'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'commands'}{'contents'}[7]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[7]{'contents'}[2];
$result_trees{'commands'}{'contents'}[7]{'contents'}[2]{'extra'}{'command'} = $result_trees{'commands'}{'contents'}[7];
$result_trees{'commands'}{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[7];
$result_trees{'commands'}{'contents'}[7]{'extra'}{'end_command'} = $result_trees{'commands'}{'contents'}[7]{'contents'}[2];
$result_trees{'commands'}{'contents'}[7]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[8]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[9]{'args'}[0];
$result_trees{'commands'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[9]{'args'}[0];
$result_trees{'commands'}{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[9]{'args'}[0];
$result_trees{'commands'}{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[9];
$result_trees{'commands'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'commands'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'commands'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'commands'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[9]{'contents'}[0];
$result_trees{'commands'}{'contents'}[9]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'commands'}{'contents'}[9]{'contents'}[0];
$result_trees{'commands'}{'contents'}[9]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'commands'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'commands'}{'contents'}[9]{'contents'}[0]{'extra'}{'misc_content'} = $result_trees{'commands'}{'contents'}[9]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'commands'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[9];
$result_trees{'commands'}{'contents'}[9]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[9]{'contents'}[1];
$result_trees{'commands'}{'contents'}[9]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[9]{'contents'}[1]{'contents'}[1];
$result_trees{'commands'}{'contents'}[9]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[9]{'contents'}[1];
$result_trees{'commands'}{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[9];
$result_trees{'commands'}{'contents'}[9]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[9]{'contents'}[2]{'args'}[0];
$result_trees{'commands'}{'contents'}[9]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[9]{'contents'}[2]{'args'}[0];
$result_trees{'commands'}{'contents'}[9]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[9]{'contents'}[2];
$result_trees{'commands'}{'contents'}[9]{'contents'}[2]{'extra'}{'command'} = $result_trees{'commands'}{'contents'}[9];
$result_trees{'commands'}{'contents'}[9]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[9];
$result_trees{'commands'}{'contents'}[9]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'commands'}{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'commands'}{'contents'}[9]{'extra'}{'command_as_argument'} = $result_trees{'commands'}{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'commands'}{'contents'}[9]{'extra'}{'end_command'} = $result_trees{'commands'}{'contents'}[9]{'contents'}[2];
$result_trees{'commands'}{'contents'}[9]{'parent'} = $result_trees{'commands'};

$result_texis{'commands'} = '@TeX{}. Ab. @@. @
@~e, @^{@dotless{i}}

Hohoh@sp 2

@sp 3

@example 
truc
@end example

@vtable @samp
@item vitem table

text
@end vtable';


$result_texts{'commands'} = 'TeX. Ab. @.  e~, i^

Hohoh






truc

vitem table

text
';

$result_errors{'commands'} = [
  {
    'error_line' => ':13: Entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => 'Entry for index `vr\' outside of any node',
    'type' => 'error'
  }
];



$result_converted{'debugcount'}->{'commands'} = ' [1] (0,0) :text_root
  [2] (0,0) :paragraph
   [3] (0,0) @TeX
   [3] (0,0)
   [4] (0,0) :text|. Ab. |
   [4] (8,0)
   [5] (8,0) @@
   [5] (8,0)
   [6] (8,0) :text|. |
   [6] (12,0)
   [7] (12,0) @

   [7] (12,0)
   [8] (12,0) @~
   [8] (12,0)
   [9] (12,0) :text|, |
   [9] (17,0)
   [10] (17,0) @^
   [10] (17,0)
   [11] (17,0) :text|\\n|
   [11] (20,0)
  [2] (21,1)
  [12] (21,1) :empty_line:text|\\n|
  [12] (22,2)
  [13] (22,2) :paragraph
   [14] (22,2) :text|Hohoh|
   [14] (22,2)
  [13] (31,3)
  [15] (31,3) @sp
  [15] (33,5)
  [16] (33,5) :empty_line:text|\\n|
  [16] (33,5)
  [17] (33,5) @sp
  [17] (36,8)
  [18] (36,8) :empty_line:text|\\n|
  [18] (36,8)
  [19] (36,8) @example
   [20] (36,8) :empty_line_after_command:text| \\n|
   [20] (36,8)
   [21] (36,8) :preformatted
    [22] (36,8) :text|truc\\n|
    [22] (46,9)
   [21] (46,9)
   [23] (46,9) @end
   [23] (46,9)
  [19] (46,9)
  [24] (46,9) :empty_line:text|\\n|
  [24] (47,10)
  [25] (47,10) @vtable
   [26] (47,10) @item
    [27] (47,10) :frenchspacing
     [28] (47,10) @samp
      [29] (47,10) :brace_command_arg
       [30] (47,10) :text|vitem table|
       [30] (53,10)
 locations  (1) l 10
      [29] (53,10)
     [28] (53,10)
    [27] (53,10)
   [26] (61,11)
   [31] (61,11) :table_item
    [32] (61,11) :empty_line:text|\\n|
    [32] (62,12)
    [33] (62,12) :paragraph
     [34] (62,12) :text|text\\n|
     [34] (71,12)
    [33] (72,13)
   [31] (72,13)
   [35] (72,13) @end
   [35] (72,13)
  [25] (72,13)
 [1] (72,13)
TeX. Ab.  @.  e~, i^

   Hohoh





     truc

`vitem table\'

     text
';

1;
