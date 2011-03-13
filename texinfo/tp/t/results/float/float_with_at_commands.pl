use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'float_with_at_commands'} = {
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
              'text' => 'entr'
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
              'text' => 'e'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'premi'
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
              'text' => 're entr'
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
              'text' => 'e'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'space_at_end_block_command'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'float',
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
              'text' => 'Ceci est notre premi'
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
              'text' => 're entr'
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
              'text' => 'e.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'La premi'
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
                      'text' => 're entr'
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
                      'text' => 'e est importante'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'caption',
          'contents' => [],
          'extra' => {
            'float' => {}
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 4,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'float'
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
            'command_argument' => 'float',
            'text_arg' => 'float'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 6,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {},
            {},
            {}
          ],
          [
            {},
            {},
            {},
            {},
            {}
          ]
        ],
        'caption' => {},
        'end_command' => {},
        'node_content' => [
          {},
          {},
          {},
          {},
          {}
        ],
        'normalized' => 'premi_00e8re-entr_00e9e',
        'type' => {
          'content' => [
            {},
            {},
            {}
          ],
          'normalized' => 'entr_00e9e'
        }
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'number' => 1,
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'entr'
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
              'text' => 'e'
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
            {}
          ],
          'normalized' => 'entr_00e9e'
        }
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 9,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[2];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[3]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[4];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[4]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[5]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[6]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[1]{'contents'}[3];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[3];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'extra'}{'float'} = $result_trees{'float_with_at_commands'}{'contents'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[5];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[5]{'extra'}{'command'} = $result_trees{'float_with_at_commands'}{'contents'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][1] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][2] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[1][1] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[2];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[1][2] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[3];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[1][3] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[4];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[1][4] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[5];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'caption'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[2];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'float_with_at_commands'}{'contents'}[0]{'contents'}[5];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'node_content'}[0] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'node_content'}[1] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[2];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'node_content'}[2] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[3];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'node_content'}[3] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[4];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'node_content'}[4] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[1]{'contents'}[5];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'type'}{'content'}[0] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'type'}{'content'}[1] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'extra'}{'type'}{'content'}[2] = $result_trees{'float_with_at_commands'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'float_with_at_commands'}{'contents'}[0]{'parent'} = $result_trees{'float_with_at_commands'};
$result_trees{'float_with_at_commands'}{'contents'}[1]{'parent'} = $result_trees{'float_with_at_commands'};
$result_trees{'float_with_at_commands'}{'contents'}[2]{'parent'} = $result_trees{'float_with_at_commands'};
$result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'float_with_at_commands'}{'contents'}[3];
$result_trees{'float_with_at_commands'}{'contents'}[3]{'extra'}{'type'}{'content'}[0] = $result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'float_with_at_commands'}{'contents'}[3]{'extra'}{'type'}{'content'}[1] = $result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'float_with_at_commands'}{'contents'}[3]{'extra'}{'type'}{'content'}[2] = $result_trees{'float_with_at_commands'}{'contents'}[3]{'args'}[0]{'contents'}[3];
$result_trees{'float_with_at_commands'}{'contents'}[3]{'parent'} = $result_trees{'float_with_at_commands'};

$result_texis{'float_with_at_commands'} = '@float entr@\'ee, premi@`ere entr@\'ee

Ceci est notre premi@`ere entr@\'ee.
@caption{La premi@`ere entr@\'ee est importante}

@end float


@listoffloats entr@\'ee
';


$result_texts{'float_with_at_commands'} = '
Ceci est notre premie`re entre\'e.




';

$result_errors{'float_with_at_commands'} = [];


$result_floats{'float_with_at_commands'} = {
  'entr_00e9e' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'end_command' => {
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'float',
            'text_arg' => 'float'
          }
        },
        'normalized' => 'premi_00e8re-entr_00e9e',
        'type' => {
          'content' => [
            {
              'text' => 'entr'
            },
            {
              'cmdname' => '\''
            },
            {
              'text' => 'e'
            }
          ],
          'normalized' => 'entr_00e9e'
        }
      },
      'number' => 1
    }
  ]
};
$result_floats{'float_with_at_commands'}{'entr_00e9e'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'float_with_at_commands'}{'entr_00e9e'}[0];
$result_floats{'float_with_at_commands'}{'entr_00e9e'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_floats{'float_with_at_commands'}{'entr_00e9e'}[0];



$result_converted{'plaintext'}->{'float_with_at_commands'} = '
Ceci est notre premie`re entre\'e.

entre\'e 1: La premie`re entre\'e est importante

* Menu:

* entre\'e 1: premie`re entre\'e.          La premie`re entre\'e est ...

';

1;
