use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'empty_listoffloats'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'listoffloats',
      'extra' => {
        'type' => {
          'normalized' => ''
        }
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'empty_listoffloats'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_listoffloats'}{'contents'}[0]{'args'}[0];
$result_trees{'empty_listoffloats'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_listoffloats'}{'contents'}[0];
$result_trees{'empty_listoffloats'}{'contents'}[0]{'parent'} = $result_trees{'empty_listoffloats'};

$result_texis{'empty_listoffloats'} = '@listoffloats
';


$result_texts{'empty_listoffloats'} = '';

$result_errors{'empty_listoffloats'} = [];



$result_converted{'plaintext'}->{'empty_listoffloats'} = '';

1;
