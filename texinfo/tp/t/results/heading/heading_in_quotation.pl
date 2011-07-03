use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements);

use utf8;

$result_trees{'heading_in_quotation'} = {
  'contents' => [
    {
      'cmdname' => 'quotation',
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
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
                  'text' => 'in quotation '
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
                    'line_nr' => 3,
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
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
                  'text' => 'quotation'
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
            'command_argument' => 'quotation',
            'text_arg' => 'quotation'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
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
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'heading_in_quotation'}{'contents'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[4];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'}[1] = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'}[2] = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[3];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'}[3] = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[4];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'line_nr'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[4]{'line_nr'};
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[4];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[4];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[4]{'extra'}{'command'} = $result_trees{'heading_in_quotation'}{'contents'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[4];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'parent'} = $result_trees{'heading_in_quotation'};

$result_texis{'heading_in_quotation'} = '@quotation

@heading in quotation @@ @emph{heading}

@end quotation
';


$result_texts{'heading_in_quotation'} = '
in quotation @ heading
======================

';

$result_errors{'heading_in_quotation'} = [];



$result_converted{'plaintext'}->{'heading_in_quotation'} = '     in quotation @ _heading_
=============================

';

1;
