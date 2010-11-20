use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'lettered_accent_and_spaces'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'a',
              'type' => 'space_command_arg'
            }
          ],
          'cmdname' => 'ringaccent',
          'extra' => {
            'spaces' => '    '
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'lettered_accent_and_spaces'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'lettered_accent_and_spaces'}{'contents'}[0]{'contents'}[0];
$result_trees{'lettered_accent_and_spaces'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'lettered_accent_and_spaces'}{'contents'}[0];
$result_trees{'lettered_accent_and_spaces'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'lettered_accent_and_spaces'}{'contents'}[0];
$result_trees{'lettered_accent_and_spaces'}{'contents'}[0]{'parent'} = $result_trees{'lettered_accent_and_spaces'};

$result_texis{'lettered_accent_and_spaces'} = '@ringaccent    a
';


$result_texts{'lettered_accent_and_spaces'} = 'a*
';

$result_errors{'lettered_accent_and_spaces'} = [];



$result_converted{'plaintext'}->{'lettered_accent_and_spaces'} = 'a*
';

1;
