use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'expanded_tex'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'AAA
'
        },
        {
          'cmdname' => 'tex',
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            },
            {
              'parent' => {},
              'text' => 'TTT
',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => 'GGG',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'After
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
          'text' => 'second
'
        },
        {
          'cmdname' => 'tex',
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_line_after_command'
            },
            {
              'parent' => {},
              'text' => 'FFF
',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => 'GGG ',
              'type' => 'raw'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 9,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'After2.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'expanded_tex'}{'contents'}[0];
$result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[1];
$result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[1];
$result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[1];
$result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[1];
$result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[1];
$result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'expanded_tex'}{'contents'}[0];
$result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[1];
$result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'expanded_tex'}{'contents'}[0];
$result_trees{'expanded_tex'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'expanded_tex'}{'contents'}[0];
$result_trees{'expanded_tex'}{'contents'}[0]{'parent'} = $result_trees{'expanded_tex'};
$result_trees{'expanded_tex'}{'contents'}[1]{'parent'} = $result_trees{'expanded_tex'};
$result_trees{'expanded_tex'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'expanded_tex'}{'contents'}[2];
$result_trees{'expanded_tex'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'expanded_tex'}{'contents'}[2]{'contents'}[1];
$result_trees{'expanded_tex'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'expanded_tex'}{'contents'}[2]{'contents'}[1];
$result_trees{'expanded_tex'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'expanded_tex'}{'contents'}[2]{'contents'}[1];
$result_trees{'expanded_tex'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'expanded_tex'}{'contents'}[2]{'contents'}[1];
$result_trees{'expanded_tex'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'expanded_tex'}{'contents'}[2];
$result_trees{'expanded_tex'}{'contents'}[2]{'contents'}[2]{'extra'}{'command'} = $result_trees{'expanded_tex'}{'contents'}[2]{'contents'}[1];
$result_trees{'expanded_tex'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'expanded_tex'}{'contents'}[2];
$result_trees{'expanded_tex'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'expanded_tex'}{'contents'}[2];
$result_trees{'expanded_tex'}{'contents'}[2]{'parent'} = $result_trees{'expanded_tex'};

$result_texis{'expanded_tex'} = 'AAA
@tex
TTT
GGG
@end tex
After

second
@tex FFF
GGG @end tex
After2.
';


$result_texts{'expanded_tex'} = 'AAA
After

second
After2.
';

$result_errors{'expanded_tex'} = [
  {
    'error_line' => ':10: warning: @end tex should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => '@end tex should only appear at a line beginning',
    'type' => 'warning'
  }
];



$result_converted{'debugcount'}->{'expanded_tex'} = ' [1] (0,0) :text_root
  [2] (0,0) :paragraph
   [3] (0,0) :text|AAA\\n|
   [3] (3,0)
   [4] (3,0) @tex
    [5] (5,1) :empty_line_after_command:text|\\n|
    [5] (5,1)
    [6] (5,1) :raw:text|TTT\\n|
    [6] (9,2)
    [7] (9,2) :raw:text|GGG|
    [7] (9,2)
    [8] (9,2) :last_raw_newline:text|\\n|
    [8] (13,3)
   [4] (13,3)
   [9] (13,3) :empty_line_after_command:text|\\n|
   [9] (13,3)
   [10] (13,3) :text|After\\n|
   [10] (18,3)
  [2] (19,4)
  [11] (19,4) :empty_line:text|\\n|
  [11] (20,5)
  [12] (20,5) :paragraph
   [13] (20,5) :text|second\\n|
   [13] (29,5)
   [14] (29,5) @tex
    [15] (31,6) :empty_line_after_command:text| |
    [15] (31,6)
    [16] (31,6) :raw:text|FFF\\n|
    [16] (35,7)
    [17] (35,7) :raw:text|GGG |
    [17] (35,7)
   [14] (35,7)
   [18] (35,7) :empty_line_after_command:text|\\n|
   [18] (35,7)
   [19] (35,7) :text|After2.\\n|
   [19] (46,7)
  [12] (47,8)
 [1] (47,8)
AAA 
TTT
GGG
After

   second 
FFF
GGG After2.
';

1;
