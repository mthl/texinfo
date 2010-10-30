use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'node_empty_direction'} = {
  'contents' => [
    {
      'contents' => [],
      'type' => 'text_root'
    },
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
              'text' => 'name'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'name'
          },
          undef
        ],
        'normalized' => 'name'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'node_empty_direction'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_empty_direction'}{'contents'}[1]{'args'}[0];
$result_trees{'node_empty_direction'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node_empty_direction'}{'contents'}[1]{'args'}[0];
$result_trees{'node_empty_direction'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'node_empty_direction'}{'contents'}[1];
$result_trees{'node_empty_direction'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'node_empty_direction'}{'contents'}[1];
$result_trees{'node_empty_direction'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'node_empty_direction'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'node_empty_direction'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'node_empty_direction'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'node_empty_direction'}{'contents'}[1]{'parent'} = $result_trees{'node_empty_direction'};

$result_texis{'node_empty_direction'} = '@node name, ';


$result_texts{'node_empty_direction'} = '';

$result_sectioning{'node_empty_direction'} = {
  'text' => '_ROOT'
};
$result_errors{'node_empty_direction'} = [];


1;
