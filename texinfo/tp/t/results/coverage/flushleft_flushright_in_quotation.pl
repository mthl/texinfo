use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'flushleft_flushright_in_quotation'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'quotation',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
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
              'parent' => {},
              'text' => '   ',
              'type' => 'empty_spaces_before_paragraph'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'f l
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
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
              'parent' => {},
              'text' => '  ',
              'type' => 'empty_spaces_before_paragraph'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'f r
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 7,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[0]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'};
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1];
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[1];
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[1];
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[1];
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1];
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1];
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1];
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[4];
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[4];
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[4]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[4]{'contents'}[2];
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[4];
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1];
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1];
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[1]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'};
$result_trees{'flushleft_flushright_in_quotation'}{'contents'}[2]{'parent'} = $result_trees{'flushleft_flushright_in_quotation'};

$result_texis{'flushleft_flushright_in_quotation'} = '
@quotation
@flushleft
   f l
@end flushleft

@flushright
  f r
@end flushright
@end quotation
';


$result_texts{'flushleft_flushright_in_quotation'} = '
f l

f r
';

$result_errors{'flushleft_flushright_in_quotation'} = [];



$result_converted{'plaintext'}->{'flushleft_flushright_in_quotation'} = '
     f l

                                                                    f r
';

1;
