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
              'index_prefix' => 'v'
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
        'command_as_argument' => 'samp'
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
   [9] (18,0)
   [10] (18,0) @^
   [10] (18,0)
   [11] (18,0) :text|\\n|
   [11] (21,0)
  [2] (22,1)
  [12] (22,1) :empty_line:text|\\n|
  [12] (23,2)
  [13] (23,2) :paragraph
   [14] (23,2) :text|Hohoh\\n|
   [14] (31,2)
  [13] (32,3)
  [15] (32,3) :empty_line:text|\\n|
  [15] (33,4)
  [16] (33,4) @example
   [17] (33,4) :empty_line_after_command:text| \\n|
   [17] (33,4)
   [18] (33,4) :preformatted
    [19] (33,4) :text|truc\\n|
    [19] (43,5)
   [18] (43,5)
  [16] (43,5)
  [20] (43,5) :empty_line_after_command:text|\\n|
  [20] (43,5)
  [21] (43,5) :empty_line:text|\\n|
  [21] (44,6)
  [22] (44,6) @vtable
   [23] (44,6) :before_item
   [23] (44,6)
   [24] (44,6) @item
    [25] (44,6) 
     [26] (44,6) @samp
      [27] (44,6) :brace_command_arg
       [28] (44,6) :text|vitem table|
       [28] (50,6)
      [27] (50,6)
     [26] (50,6)
    [25] (50,6)
   [24] (58,7)
 locations  (1) l 7
   [29] (58,7) :empty_line:text|\\n|
   [29] (59,8)
   [30] (59,8) :paragraph
    [31] (59,8) :text|text\\n|
    [31] (68,8)
   [30] (69,9)
  [22] (69,9)
  [32] (69,9) :empty_line_after_command:text||
  [32] (69,9)
 [1] (69,9)
TeX. Ab.  @.   e~, i^

   Hohoh

     truc

`vitem table\'

     text
';

1;
