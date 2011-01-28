use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'flushright'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'flushright',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => '  ',
          'type' => 'empty_spaces_before_paragraph'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'aaa bb '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'rrr'
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
                'normalized' => 'rrr'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'text' => ' ',
              'type' => 'empty_spaces_after_close_brace'
            },
            {
              'parent' => {},
              'text' => 'ada   
'
            },
            {
              'parent' => {},
              'text' => ' dad  sff sd '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'a1'
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
                'normalized' => 'a1'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 4,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'text' => ' ',
              'type' => 'empty_spaces_after_close_brace'
            },
            {
              'parent' => {},
              'text' => 'and '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'a2'
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
                'normalized' => 'a2'
              },
              'line_nr' => {},
              'parent' => {}
            },
            {
              'text' => ' ',
              'type' => 'empty_spaces_after_close_brace'
            },
            {
              'parent' => {},
              'text' => 'dsdbf
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
              'text' => 'dqs
'
            },
            {
              'parent' => {},
              'text' => 'sqdd
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'alone'
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
                'normalized' => 'alone'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 9,
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
              'text' => 'new para.
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
$result_trees{'flushright'}{'contents'}[0]{'parent'} = $result_trees{'flushright'};
$result_trees{'flushright'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'flushright'}{'contents'}[1];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'flushright'}{'contents'}[1];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[5]{'args'}[0];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[5];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[5]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[7]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[8]{'args'}[0];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[8];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[8]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[8]{'args'}[0]{'contents'}[0];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[8]{'extra'}{'node_content'}[0] = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[8]{'args'}[0]{'contents'}[0];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[8]{'line_nr'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[5]{'line_nr'};
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[8]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'contents'}[10]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[2];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'flushright'}{'contents'}[1];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'flushright'}{'contents'}[1];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[4];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[4];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'flushright'}{'contents'}[1];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'flushright'}{'contents'}[1];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[6]{'contents'}[0];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[6]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'flushright'}{'contents'}[1]{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[6]{'contents'}[0]{'extra'}{'node_content'}[0] = $result_trees{'flushright'}{'contents'}[1]{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[6];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'flushright'}{'contents'}[1];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'flushright'}{'contents'}[1];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'flushright'}{'contents'}[1]{'contents'}[8];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'flushright'}{'contents'}[1];
$result_trees{'flushright'}{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'flushright'}{'contents'}[1];
$result_trees{'flushright'}{'contents'}[1]{'parent'} = $result_trees{'flushright'};
$result_trees{'flushright'}{'contents'}[2]{'parent'} = $result_trees{'flushright'};

$result_texis{'flushright'} = '
@flushright
  aaa bb @anchor{rrr} ada   
 dad  sff sd @anchor{a1} and @anchor{a2} dsdbf

dqs
sqdd

@anchor{alone}

new para.

@end flushright
';


$result_texts{'flushright'} = '
aaa bb ada   
 dad  sff sd and dsdbf

dqs
sqdd


new para.

';

$result_errors{'flushright'} = [];



$result_converted{'debugcount'}->{'flushright'} = ' [1] (0,0) :text_root
  [2] (0,0) :empty_line:text
  [2] (1,1)
  [3] (1,1) @flushright
   [4] (1,1) :empty_line_after_command:text
   [4] (1,1)
   [5] (1,1) :empty_spaces_before_paragraph:text
   [5] (1,1)
   [6] (1,1) :paragraph
    [7] (0,0) :text
    [7] (6,0)
    [8] (6,0) @anchor
    [8] (6,0)
 locations  (1) l 0 b 6
    [9] (6,0) :empty_spaces_after_close_brace:text
    [9] (6,0)
    [10] (6,0) :text
    [10] (11,1)
    [11] (11,1) :text
    [11] (21,1)
    [12] (21,1) @anchor
    [12] (21,1)
 locations  (2) l 1 b 21
    [13] (21,1) :empty_spaces_after_close_brace:text
    [13] (21,1)
    [14] (21,1) :text
    [14] (25,1)
    [15] (25,1) @anchor
    [15] (25,1)
 locations  (3) l 1 b 25
    [16] (25,1) :empty_spaces_after_close_brace:text
    [16] (25,1)
    [17] (25,1) :text
    [17] (32,2)
   [6] (143,3)
 locations  (1) l 1 b 68 (2) l 2 b 134 (3) l 2 b 138
   [18] (143,3) :empty_line:text
   [18] (144,4)
   [19] (144,4) :paragraph
    [20] (0,0) :text
    [20] (4,1)
    [21] (4,1) :text
    [21] (9,2)
   [19] (286,6)
   [22] (286,6) :empty_line:text
   [22] (287,7)
   [23] (287,7) :paragraph
    [24] (0,0) @anchor
    [24] (0,0)
 locations  (4) l 0 b 0
    [25] (0,0) :empty_spaces_after_close_brace:text
    [25] (0,0)
   [23] (287,7)
 locations  (4) l 7 b 287
   [26] (287,7) :empty_line:text
   [26] (288,8)
   [27] (288,8) :paragraph
    [28] (0,0) :text
    [28] (10,1)
   [27] (359,9)
   [29] (359,9) :empty_line:text
   [29] (360,10)
  [3] (360,10)
  [30] (360,10) :empty_line_after_command:text
  [30] (360,10)
 [1] (360,10)

                                                             aaa bb ada
                                                   dad sff sd and dsdbf

                                                                    dqs
                                                                   sqdd


                                                              new para.

';

1;
