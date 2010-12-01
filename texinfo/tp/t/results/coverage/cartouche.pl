use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'cartouche'} = {
  'contents' => [
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
              'text' => 'in cartouche.
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
      'text' => '',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'cartouche'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'cartouche'}{'contents'}[0];
$result_trees{'cartouche'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'cartouche'}{'contents'}[0]{'contents'}[1];
$result_trees{'cartouche'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'cartouche'}{'contents'}[0];
$result_trees{'cartouche'}{'contents'}[0]{'parent'} = $result_trees{'cartouche'};
$result_trees{'cartouche'}{'contents'}[1]{'parent'} = $result_trees{'cartouche'};

$result_texis{'cartouche'} = '@cartouche
in cartouche.
@end cartouche';


$result_texts{'cartouche'} = 'in cartouche.
';

$result_errors{'cartouche'} = [];



$result_converted{'plaintext'}->{'cartouche'} = '   in cartouche.
';

1;
