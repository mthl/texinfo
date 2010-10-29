use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'a_comma_after_node'} = {
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
              'text' => 'Commands'
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
            },
            {
              'parent' => {},
              'text' => 'Requirements'
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
            },
            {
              'parent' => {},
              'text' => 'Nodes and Menus'
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
      'cmdname' => 'node',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'A comma in text, end.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Commands'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Requirements'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Nodes-and-Menus'
          }
        ]
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
$result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[0];
$result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[0];
$result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'a_comma_after_node'}{'contents'}[1];
$result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[1];
$result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'a_comma_after_node'}{'contents'}[1];
$result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[2];
$result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[2]{'contents'}[2]{'parent'} = $result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[2];
$result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'a_comma_after_node'}{'contents'}[1];
$result_trees{'a_comma_after_node'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'a_comma_after_node'}{'contents'}[1];
$result_trees{'a_comma_after_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'a_comma_after_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'a_comma_after_node'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'a_comma_after_node'}{'contents'}[1];
$result_trees{'a_comma_after_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'a_comma_after_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'a_comma_after_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'a_comma_after_node'}{'contents'}[1]{'args'}[2]{'contents'}[1];
$result_trees{'a_comma_after_node'}{'contents'}[1]{'parent'} = $result_trees{'a_comma_after_node'};

$result_texis{'a_comma_after_node'} = '@node Commands, Requirements, Nodes and Menus

A comma in text, end.
';


$result_texts{'a_comma_after_node'} = '
A comma in text, end.
';

$result_errors{'a_comma_after_node'} = [];


1;
