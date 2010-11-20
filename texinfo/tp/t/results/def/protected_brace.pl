use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'protected_brace'} = {
  'contents' => [
    {
      'cmdname' => 'deffn',
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
                  'cmdname' => '{',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => '
'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'extra' => {
            'def_args' => [
              [
                'category',
                {}
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'parent' => {},
          'type' => 'def_line'
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
$result_trees{'protected_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'protected_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'protected_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'protected_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'protected_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'protected_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'protected_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'protected_brace'}{'contents'}[0]{'contents'}[0];
$result_trees{'protected_brace'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'protected_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'protected_brace'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'protected_brace'}{'contents'}[0]{'contents'}[0];
$result_trees{'protected_brace'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'} = $result_trees{'protected_brace'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'};
$result_trees{'protected_brace'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'protected_brace'}{'contents'}[0];
$result_trees{'protected_brace'}{'contents'}[0]{'parent'} = $result_trees{'protected_brace'};
$result_trees{'protected_brace'}{'contents'}[1]{'parent'} = $result_trees{'protected_brace'};

$result_texis{'protected_brace'} = '@deffn @{
@end deffn
';


$result_texts{'protected_brace'} = '{
';

$result_errors{'protected_brace'} = [];


1;
