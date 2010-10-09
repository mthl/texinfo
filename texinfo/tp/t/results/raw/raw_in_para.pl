use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'raw_in_para'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'para
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'verbatim',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in verbatim
',
          'type' => 'raw'
        }
      ],
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
          'text' => 'para b html
'
        },
        {
          'cmdname' => 'html',
          'contents' => [
            {
              'parent' => {},
              'text' => 'in html
',
              'type' => 'raw'
            }
          ],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'in para
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
          'text' => 'para b tex
'
        },
        {
          'cmdname' => 'tex',
          'contents' => [
            {
              'parent' => {},
              'text' => 'in tex1
',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => 'in tex2
',
              'type' => 'raw'
            }
          ],
          'parent' => {}
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
          'text' => 'End.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'raw_in_para'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[0];
$result_trees{'raw_in_para'}{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'};
$result_trees{'raw_in_para'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[1];
$result_trees{'raw_in_para'}{'contents'}[1]{'parent'} = $result_trees{'raw_in_para'};
$result_trees{'raw_in_para'}{'contents'}[2]{'parent'} = $result_trees{'raw_in_para'};
$result_trees{'raw_in_para'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[3];
$result_trees{'raw_in_para'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[3]{'contents'}[1];
$result_trees{'raw_in_para'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[3];
$result_trees{'raw_in_para'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[3];
$result_trees{'raw_in_para'}{'contents'}[3]{'parent'} = $result_trees{'raw_in_para'};
$result_trees{'raw_in_para'}{'contents'}[4]{'parent'} = $result_trees{'raw_in_para'};
$result_trees{'raw_in_para'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[5];
$result_trees{'raw_in_para'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[5]{'contents'}[1];
$result_trees{'raw_in_para'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[5]{'contents'}[1];
$result_trees{'raw_in_para'}{'contents'}[5]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[5]{'contents'}[1];
$result_trees{'raw_in_para'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[5];
$result_trees{'raw_in_para'}{'contents'}[5]{'parent'} = $result_trees{'raw_in_para'};
$result_trees{'raw_in_para'}{'contents'}[6]{'parent'} = $result_trees{'raw_in_para'};
$result_trees{'raw_in_para'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[7];
$result_trees{'raw_in_para'}{'contents'}[7]{'parent'} = $result_trees{'raw_in_para'};

$result_texts{'raw_in_para'} = 'para
@verbatim
in verbatim
@end verbatim

para b html
@html
in html
@end html
in para

para b tex
@tex
in tex1

in tex2
@end tex

End.
';

$result_errors{'raw_in_para'} = [];


