use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

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
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => '^',
          'contents' => [],
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
          'text' => 'Hohoh
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
        }
      ],
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
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
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
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
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'command_as_argument' => {}
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '',
      'type' => 'empty_line_after_command'
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
$result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[1]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[2];
$result_trees{'commands'}{'contents'}[2]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[3]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[4];
$result_trees{'commands'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[4]{'contents'}[1];
$result_trees{'commands'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[4];
$result_trees{'commands'}{'contents'}[4]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[5]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[6]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[7]{'args'}[0];
$result_trees{'commands'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[7]{'args'}[0];
$result_trees{'commands'}{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[7]{'args'}[0];
$result_trees{'commands'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[7];
$result_trees{'commands'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[7];
$result_trees{'commands'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'commands'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'commands'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'commands'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[7]{'contents'}[1];
$result_trees{'commands'}{'contents'}[7]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'commands'}{'contents'}[7]{'contents'}[1];
$result_trees{'commands'}{'contents'}[7]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'commands'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'commands'}{'contents'}[7]{'contents'}[1]{'extra'}{'misc_content'} = $result_trees{'commands'}{'contents'}[7]{'contents'}[1]{'extra'}{'index_entry'}{'content'};
$result_trees{'commands'}{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[7];
$result_trees{'commands'}{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[7];
$result_trees{'commands'}{'contents'}[7]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[7]{'contents'}[3];
$result_trees{'commands'}{'contents'}[7]{'contents'}[3]{'parent'} = $result_trees{'commands'}{'contents'}[7];
$result_trees{'commands'}{'contents'}[7]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'commands'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'commands'}{'contents'}[7]{'extra'}{'command_as_argument'} = $result_trees{'commands'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'commands'}{'contents'}[7]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[8]{'parent'} = $result_trees{'commands'};

$result_texis{'commands'} = '@TeX{}. Ab. @@. @
@~e, @^{@dotless{i}}

Hohoh

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

$result_errors{'commands'} = [];



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
   [14] (22,2) :text|Hohoh\\n|
   [14] (30,2)
  [13] (31,3)
  [15] (31,3) :empty_line:text|\\n|
  [15] (32,4)
  [16] (32,4) @example
   [17] (32,4) :empty_line_after_command:text| \\n|
   [17] (32,4)
   [18] (32,4) :preformatted
    [19] (32,4) :text|truc\\n|
    [19] (42,5)
   [18] (42,5)
  [16] (42,5)
  [20] (42,5) :empty_line_after_command:text|\\n|
  [20] (42,5)
  [21] (42,5) :empty_line:text|\\n|
  [21] (43,6)
  [22] (43,6) @vtable
   [23] (43,6) :before_item
   [23] (43,6)
   [24] (43,6) @item
    [25] (43,6) :frenchspacing
     [26] (43,6) @samp
      [27] (43,6) :brace_command_arg
       [28] (43,6) :text|vitem table|
       [28] (49,6)
 locations  (1) l 6
      [27] (49,6)
     [26] (49,6)
    [25] (49,6)
   [24] (57,7)
   [29] (57,7) :empty_line:text|\\n|
   [29] (58,8)
   [30] (58,8) :paragraph
    [31] (58,8) :text|text\\n|
    [31] (67,8)
   [30] (68,9)
  [22] (68,9)
  [32] (68,9) :empty_line_after_command:text||
  [32] (68,9)
 [1] (68,9)
TeX. Ab.  @.  e~, i^

   Hohoh

     truc

`vitem table\'

     text
';

1;
