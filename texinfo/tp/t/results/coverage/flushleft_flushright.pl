use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'flushleft_flushright'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'flushleft',
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
              'text' => 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
'
            },
            {
              'parent' => {},
              'text' => 'ldskf dsflj
'
            },
            {
              'parent' => {},
              'text' => '     lklsdlv l    lll. Bbb.
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
              'text' => 'lhds
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
      'cmdname' => 'flushright',
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
              'text' => 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
'
            },
            {
              'parent' => {},
              'text' => 'ldskf dsflj
'
            },
            {
              'parent' => {},
              'text' => '     lklsdlv l    lll. Bbb.
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
              'text' => 'lhds
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
$result_trees{'flushleft_flushright'}{'contents'}[0]{'parent'} = $result_trees{'flushleft_flushright'};
$result_trees{'flushleft_flushright'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[1];
$result_trees{'flushleft_flushright'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[1]{'contents'}[1];
$result_trees{'flushleft_flushright'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[1]{'contents'}[1];
$result_trees{'flushleft_flushright'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[1]{'contents'}[1];
$result_trees{'flushleft_flushright'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[1];
$result_trees{'flushleft_flushright'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[1];
$result_trees{'flushleft_flushright'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[1]{'contents'}[3];
$result_trees{'flushleft_flushright'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[1];
$result_trees{'flushleft_flushright'}{'contents'}[1]{'parent'} = $result_trees{'flushleft_flushright'};
$result_trees{'flushleft_flushright'}{'contents'}[2]{'parent'} = $result_trees{'flushleft_flushright'};
$result_trees{'flushleft_flushright'}{'contents'}[3]{'parent'} = $result_trees{'flushleft_flushright'};
$result_trees{'flushleft_flushright'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[4];
$result_trees{'flushleft_flushright'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[4]{'contents'}[1];
$result_trees{'flushleft_flushright'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[4]{'contents'}[1];
$result_trees{'flushleft_flushright'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[4]{'contents'}[1];
$result_trees{'flushleft_flushright'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[4];
$result_trees{'flushleft_flushright'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[4];
$result_trees{'flushleft_flushright'}{'contents'}[4]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[4]{'contents'}[3];
$result_trees{'flushleft_flushright'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'flushleft_flushright'}{'contents'}[4];
$result_trees{'flushleft_flushright'}{'contents'}[4]{'parent'} = $result_trees{'flushleft_flushright'};
$result_trees{'flushleft_flushright'}{'contents'}[5]{'parent'} = $result_trees{'flushleft_flushright'};

$result_texis{'flushleft_flushright'} = '
@flushleft
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.

lhds
@end flushleft

@flushright
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.

lhds
@end flushright
';


$result_texts{'flushleft_flushright'} = '
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.

lhds

aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.

lhds
';

$result_errors{'flushleft_flushright'} = [];



$result_converted{'plaintext'}->{'flushleft_flushright'} = '
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
lklsdlv l lll.  Bbb.

lhds

aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
                                                            ldskf dsflj
                                                   lklsdlv l lll.  Bbb.

                                                                   lhds
';

1;
