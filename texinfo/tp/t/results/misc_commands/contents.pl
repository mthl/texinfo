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
          'text' => ' line following first content
'
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
          'text' => ' line following second content
'
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
          'text' => '
'
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
          'text' => ' eol
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
          'text' => ' eol
'
        },
        {
          'parent' => {},
          'text' => 'summarycontents '
        },
        {
          'cmdname' => 'summarycontents',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' line following summarycontents
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
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
$result_trees{'contents'}{'contents'}[1]{'contents'}[17]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[18]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[19]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[20]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[21]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'contents'}[22]{'parent'} = $result_trees{'contents'}{'contents'}[1];
$result_trees{'contents'}{'contents'}[1]{'parent'} = $result_trees{'contents'};

$result_texis{'contents'} = '
first @@contents @contents line following first content
second @@contents @contents line following second content
Third content on the following line on his own
@contents
Line following contents
shortcontents @shortcontents eol
shortcontents @shortcontents eol
summarycontents @summarycontents line following summarycontents
';

$result_errors{'contents'} = [];


