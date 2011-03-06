use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'test_tie'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'tie',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'BBBBBBBBBBB
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'test_tie'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'test_tie'}{'contents'}[0];
$result_trees{'test_tie'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'test_tie'}{'contents'}[0]{'contents'}[1];
$result_trees{'test_tie'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'test_tie'}{'contents'}[0];
$result_trees{'test_tie'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'test_tie'}{'contents'}[0];
$result_trees{'test_tie'}{'contents'}[0]{'parent'} = $result_trees{'test_tie'};

$result_texis{'test_tie'} = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA@tie{}BBBBBBBBBBB
';


$result_texts{'test_tie'} = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBBBBBBBB
';

$result_errors{'test_tie'} = [];



$result_converted{'plaintext'}->{'test_tie'} = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBBBBBBBB
';

1;
