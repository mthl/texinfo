use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'multitable_in_example'} = {
  'contents' => [
    {
      'cmdname' => 'example',
      'contents' => [
        {
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'AAA'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => '  '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'BBB'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
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
          'cmdname' => 'multitable',
          'contents' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'before_item'
            },
            {
              'contents' => [
                {
                  'cmdname' => 'item',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' ',
                          'type' => 'empty_spaces_after_command'
                        },
                        {
                          'parent' => {},
                          'text' => 'truc '
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'extra' => {
                    'cell_number' => 1
                  },
                  'parent' => {}
                },
                {
                  'cmdname' => 'tab',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' ',
                          'type' => 'empty_spaces_after_command'
                        },
                        {
                          'parent' => {},
                          'text' => 'bidule example
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'extra' => {
                    'cell_number' => 2
                  },
                  'parent' => {}
                }
              ],
              'extra' => {
                'row_number' => 1
              },
              'parent' => {},
              'type' => 'row'
            },
            {
              'contents' => [
                {
                  'cmdname' => 'item',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' ',
                          'type' => 'empty_spaces_after_command'
                        },
                        {
                          'parent' => {},
                          'text' => 'begin item example
'
                        },
                        {
                          'parent' => {},
                          'text' => '
',
                          'type' => 'empty_line'
                        },
                        {
                          'parent' => {},
                          'text' => 'new paragraph in item. example
'
                        },
                        {
                          'parent' => {},
                          'text' => '
',
                          'type' => 'empty_line'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'extra' => {
                    'cell_number' => 1
                  },
                  'parent' => {}
                },
                {
                  'cmdname' => 'tab',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' ',
                          'type' => 'empty_spaces_after_command'
                        },
                        {
                          'parent' => {},
                          'text' => 'begin tab example
'
                        },
                        {
                          'parent' => {},
                          'text' => '
',
                          'type' => 'empty_line'
                        },
                        {
                          'parent' => {},
                          'text' => 'new paragraph in tab. example
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'extra' => {
                    'cell_number' => 2
                  },
                  'parent' => {}
                }
              ],
              'extra' => {
                'row_number' => 2
              },
              'parent' => {},
              'type' => 'row'
            }
          ],
          'extra' => {
            'max_columns' => 2,
            'prototypes' => [
              {
                'contents' => [],
                'parent' => {},
                'type' => 'bracketed_multitable_prototype'
              },
              {
                'contents' => [],
                'parent' => {},
                'type' => 'bracketed_multitable_prototype'
              }
            ]
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        }
      ],
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'extra'}{'prototypes'}[0]{'contents'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'extra'}{'prototypes'}[0]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'extra'}{'prototypes'}[1]{'contents'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'contents'};
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'extra'}{'prototypes'}[1]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable_in_example'}{'contents'}[0];
$result_trees{'multitable_in_example'}{'contents'}[0]{'parent'} = $result_trees{'multitable_in_example'};
$result_trees{'multitable_in_example'}{'contents'}[1]{'parent'} = $result_trees{'multitable_in_example'};

$result_texis{'multitable_in_example'} = '@example
@multitable {AAA}  {BBB}
@item truc @tab bidule example
@item begin item example

new paragraph in item. example

@tab begin tab example

new paragraph in tab. example
@end multitable
@end example';


$result_texts{'multitable_in_example'} = 'truc bidule example
begin item example

new paragraph in item. example

begin tab example

new paragraph in tab. example
';

$result_errors{'multitable_in_example'} = [];



$result_converted{'plaintext'}->{'multitable_in_example'} = '     truc  bidule example
     begin item examplebegin tab example
           
     new paragraph in item. examplenew paragraph in tab. example

';

1;
