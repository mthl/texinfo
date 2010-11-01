use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats);

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
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
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
      'type' => 'empty_line_after_command'
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
              'text' => '
',
              'type' => 'empty_line_after_command'
            },
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
          'text' => '
',
          'type' => 'empty_line_after_command'
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
              'text' => '
',
              'type' => 'empty_line_after_command'
            },
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
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
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
  ],
  'type' => 'text_root'
};
$result_trees{'raw_in_para'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[0];
$result_trees{'raw_in_para'}{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'};
$result_trees{'raw_in_para'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[1];
$result_trees{'raw_in_para'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[1];
$result_trees{'raw_in_para'}{'contents'}[1]{'parent'} = $result_trees{'raw_in_para'};
$result_trees{'raw_in_para'}{'contents'}[2]{'parent'} = $result_trees{'raw_in_para'};
$result_trees{'raw_in_para'}{'contents'}[3]{'parent'} = $result_trees{'raw_in_para'};
$result_trees{'raw_in_para'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[4];
$result_trees{'raw_in_para'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[4]{'contents'}[1];
$result_trees{'raw_in_para'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[4]{'contents'}[1];
$result_trees{'raw_in_para'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[4];
$result_trees{'raw_in_para'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[4];
$result_trees{'raw_in_para'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[4];
$result_trees{'raw_in_para'}{'contents'}[4]{'parent'} = $result_trees{'raw_in_para'};
$result_trees{'raw_in_para'}{'contents'}[5]{'parent'} = $result_trees{'raw_in_para'};
$result_trees{'raw_in_para'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[6];
$result_trees{'raw_in_para'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[6]{'contents'}[1];
$result_trees{'raw_in_para'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[6]{'contents'}[1];
$result_trees{'raw_in_para'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[6]{'contents'}[1];
$result_trees{'raw_in_para'}{'contents'}[6]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[6]{'contents'}[1];
$result_trees{'raw_in_para'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[6];
$result_trees{'raw_in_para'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[6];
$result_trees{'raw_in_para'}{'contents'}[6]{'parent'} = $result_trees{'raw_in_para'};
$result_trees{'raw_in_para'}{'contents'}[7]{'parent'} = $result_trees{'raw_in_para'};
$result_trees{'raw_in_para'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'raw_in_para'}{'contents'}[8];
$result_trees{'raw_in_para'}{'contents'}[8]{'parent'} = $result_trees{'raw_in_para'};

$result_texis{'raw_in_para'} = 'para
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


$result_texts{'raw_in_para'} = 'para
in verbatim

para b html
in para

para b tex

End.
';

$result_errors{'raw_in_para'} = [];


1;
