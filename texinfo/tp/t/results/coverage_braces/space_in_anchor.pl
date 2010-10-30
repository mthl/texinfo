use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'space_in_anchor'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'text' => '   ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'anchor  name'
                },
                {
                  'parent' => {},
                  'text' => '   ',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'anchor',
          'contents' => [],
          'extra' => {
            'node_content' => [
              {}
            ],
            'normalized' => 'anchor-name'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'space_in_anchor'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_anchor'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'space_in_anchor'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'space_in_anchor'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'space_in_anchor'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'space_in_anchor'}{'contents'}[0]{'contents'}[0];
$result_trees{'space_in_anchor'}{'contents'}[0]{'contents'}[0]{'extra'}{'node_content'}[0] = $result_trees{'space_in_anchor'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'space_in_anchor'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_anchor'}{'contents'}[0];
$result_trees{'space_in_anchor'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_anchor'}{'contents'}[0];
$result_trees{'space_in_anchor'}{'contents'}[0]{'parent'} = $result_trees{'space_in_anchor'};

$result_texis{'space_in_anchor'} = '@anchor{   anchor  name   }.
';


$result_texts{'space_in_anchor'} = '.
';

$result_errors{'space_in_anchor'} = [];


1;
