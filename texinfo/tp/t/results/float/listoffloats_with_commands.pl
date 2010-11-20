use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'listoffloats_with_commands'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'th'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => 'e'
                }
              ],
              'cmdname' => '\'',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'or'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => 'e'
                }
              ],
              'cmdname' => '`',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'me'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'listoffloats',
      'extra' => {
        'type' => {
          'content' => [
            {},
            {},
            {},
            {},
            {}
          ],
          'normalized' => 'th_00e9or_00e8me'
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
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0];
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0];
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0];
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0];
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0];
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0];
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0];
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'listoffloats_with_commands'}{'contents'}[0];
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'extra'}{'type'}{'content'}[0] = $result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'extra'}{'type'}{'content'}[1] = $result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'extra'}{'type'}{'content'}[2] = $result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'extra'}{'type'}{'content'}[3] = $result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'extra'}{'type'}{'content'}[4] = $result_trees{'listoffloats_with_commands'}{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'listoffloats_with_commands'}{'contents'}[0]{'parent'} = $result_trees{'listoffloats_with_commands'};

$result_texis{'listoffloats_with_commands'} = '@listoffloats th@\'eor@`eme
';


$result_texts{'listoffloats_with_commands'} = '';

$result_errors{'listoffloats_with_commands'} = [];


1;
