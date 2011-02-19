use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'nested_args'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'cmdname' => '@',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in samp'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'samp',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 1,
                    'macro' => ''
                  },
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'descr '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in b'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'b',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'xref',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {},
                {},
                {}
              ],
              [
                {},
                {}
              ]
            ],
            'node_argument' => {
              'node_content' => [
                {},
                {},
                {}
              ],
              'normalized' => '_0040-in-samp'
            }
          },
          'line_nr' => {},
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '.'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[2]{'line_nr'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][1] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][2] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[1][1] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[1] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[2] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'line_nr'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested_args'}{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'parent'} = $result_trees{'nested_args'};

$result_texis{'nested_args'} = '@xref{@@ @samp{in samp}, descr @b{in b}}.';


$result_texts{'nested_args'} = '.';

$result_errors{'nested_args'} = [];



$result_converted{'plaintext'}->{'nested_args'} = '*Note descr in b: @ `in samp\'.
';

1;
