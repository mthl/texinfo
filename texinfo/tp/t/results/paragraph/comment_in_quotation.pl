use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'comment_in_quotation'} = {
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'Quotation '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
    },
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'Quotation no space'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 6,
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
$result_trees{'comment_in_quotation'}{'contents'}[0]{'parent'} = $result_trees{'comment_in_quotation'};
$result_trees{'comment_in_quotation'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'comment_in_quotation'}{'contents'}[1];
$result_trees{'comment_in_quotation'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'comment_in_quotation'}{'contents'}[1]{'contents'}[1];
$result_trees{'comment_in_quotation'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comment_in_quotation'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'comment_in_quotation'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'comment_in_quotation'}{'contents'}[1]{'contents'}[1];
$result_trees{'comment_in_quotation'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'comment_in_quotation'}{'contents'}[1];
$result_trees{'comment_in_quotation'}{'contents'}[1]{'parent'} = $result_trees{'comment_in_quotation'};
$result_trees{'comment_in_quotation'}{'contents'}[2]{'parent'} = $result_trees{'comment_in_quotation'};
$result_trees{'comment_in_quotation'}{'contents'}[3]{'parent'} = $result_trees{'comment_in_quotation'};
$result_trees{'comment_in_quotation'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'comment_in_quotation'}{'contents'}[4];
$result_trees{'comment_in_quotation'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'comment_in_quotation'}{'contents'}[4]{'contents'}[1];
$result_trees{'comment_in_quotation'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comment_in_quotation'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'comment_in_quotation'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'comment_in_quotation'}{'contents'}[4]{'contents'}[1];
$result_trees{'comment_in_quotation'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'comment_in_quotation'}{'contents'}[4];
$result_trees{'comment_in_quotation'}{'contents'}[4]{'parent'} = $result_trees{'comment_in_quotation'};
$result_trees{'comment_in_quotation'}{'contents'}[5]{'parent'} = $result_trees{'comment_in_quotation'};

$result_texis{'comment_in_quotation'} = '
@quotation
Quotation @c
@end quotation 

@quotation
Quotation no space@c
@end quotation 
';


$result_texts{'comment_in_quotation'} = '
Quotation 
Quotation no space';

$result_errors{'comment_in_quotation'} = [];



$result_converted{'plaintext'}->{'comment_in_quotation'} = '
     Quotation

     Quotation no space
';

1;
