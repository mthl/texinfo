use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'contents'} = {
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
          'text' => 'first '
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'contents '
        },
        {
          'cmdname' => 'contents',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'second '
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'contents '
        },
        {
          'cmdname' => 'contents',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'Third content on the following line on his own
'
        },
        {
          'cmdname' => 'contents',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'Line following contents
'
        },
        {
          'parent' => {},
          'text' => 'shortcontents '
        },
        {
          'cmdname' => 'shortcontents',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'shortcontents '
        },
        {
          'cmdname' => 'shortcontents',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'summarycontents '
        },
        {
          'cmdname' => 'summarycontents',
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'contents'}{'contents'}[0]{'parent'} = $result_trees{'contents'};
$result_trees{'contents'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[11]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[12]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[13]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[14]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[15]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[16]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'parent'} = $result_trees{'contents'};

$result_texis{'contents'} = '
first @@contents @contents
second @@contents @contents
Third content on the following line on his own
@contents
Line following contents
shortcontents @shortcontents
shortcontents @shortcontents
summarycontents @summarycontents
';


$result_texts{'contents'} = '
first @contents second @contents Third content on the following line on his own
Line following contents
shortcontents shortcontents summarycontents ';

$result_errors{'contents'} = [
  {
    'error_line' => ':2: warning: @contents should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@contents should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':3: warning: @contents should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@contents should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':7: warning: @shortcontents should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => '@shortcontents should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':8: warning: @shortcontents should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 8,
    'macro' => '',
    'text' => '@shortcontents should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':9: warning: @summarycontents should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 9,
    'macro' => '',
    'text' => '@summarycontents should only appear at a line beginning',
    'type' => 'warning'
  }
];


