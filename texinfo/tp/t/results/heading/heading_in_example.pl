use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'heading_in_example'} = {
  'contents' => [
    {
      'cmdname' => 'example',
      'contents' => [
        {
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'in example '
                },
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
                          'text' => 'heading'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'emph',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 2,
                    'macro' => ''
                  },
                  'parent' => {}
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
          'cmdname' => 'heading',
          'extra' => {
            'misc_content' => [
              {},
              {},
              {},
              {}
            ]
          },
          'level' => 2,
          'line_nr' => {},
          'parent' => {}
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'example'
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
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'example',
            'text_arg' => 'example'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {}
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
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'heading_in_example'}{'contents'}[0];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'extra'}{'misc_content'}[1] = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'extra'}{'misc_content'}[2] = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'extra'}{'misc_content'}[3] = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'line_nr'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'line_nr'};
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'heading_in_example'}{'contents'}[0];
$result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_example'}{'contents'}[0];
$result_trees{'heading_in_example'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'heading_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'heading_in_example'}{'contents'}[0]{'parent'} = $result_trees{'heading_in_example'};

$result_texis{'heading_in_example'} = '@example
@heading in example @@ @emph{heading}
@end example
';


$result_texts{'heading_in_example'} = 'in example @ heading
====================
';

$result_errors{'heading_in_example'} = [];



$result_converted{'plaintext'}->{'heading_in_example'} = '     in example @ _heading_
===========================

';

1;
