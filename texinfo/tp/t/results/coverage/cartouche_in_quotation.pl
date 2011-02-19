use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'cartouche_in_quotation'} = {
  'contents' => [
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
              'text' => 'In quotation
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'cartouche',
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
                  'text' => 'In cartouche in quotation
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'end quotation
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
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
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[1];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'};
$result_trees{'cartouche_in_quotation'}{'contents'}[1]{'parent'} = $result_trees{'cartouche_in_quotation'};

$result_texis{'cartouche_in_quotation'} = '@quotation
In quotation
@cartouche
In cartouche in quotation
@end cartouche
end quotation
@end quotation
';


$result_texts{'cartouche_in_quotation'} = 'In quotation
In cartouche in quotation
end quotation
';

$result_errors{'cartouche_in_quotation'} = [];



$result_converted{'plaintext'}->{'cartouche_in_quotation'} = '     In quotation
     In cartouche in quotation
     end quotation
';

1;
