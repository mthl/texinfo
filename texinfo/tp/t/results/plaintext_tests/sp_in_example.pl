use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'sp_in_example'} = {
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'Para
'
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
                      'text' => '1'
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
              'cmdname' => 'sp',
              'extra' => {
                'misc_args' => [
                  '1'
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'other para
'
            },
            {
              'parent' => {},
              'text' => 'Now lone '
            },
            {
              'cmdname' => '@',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'sp:
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
                      'text' => '1'
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
              'cmdname' => 'sp',
              'extra' => {
                'misc_args' => [
                  '1'
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 7,
                'macro' => ''
              },
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
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => '2'
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
              'cmdname' => 'sp',
              'extra' => {
                'misc_args' => [
                  '2'
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 9,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'Para after sp
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
              'text' => 'A
'
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
                      'text' => '2'
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
              'cmdname' => 'sp',
              'extra' => {
                'misc_args' => [
                  '2'
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 13,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'B
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
              'text' => 'sp after para
'
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
                      'text' => '1'
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
              'cmdname' => 'sp',
              'extra' => {
                'misc_args' => [
                  '1'
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 17,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
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
            'line_nr' => 18,
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
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[7];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[9]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[9]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[9]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[9];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[11]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[12]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[13]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[13]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[13]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[13];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[13]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[14]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[15]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[16]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[17]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[17]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[17]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[17]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[17]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[17]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[17]{'args'}[0]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[17];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[17]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'sp_in_example'}{'contents'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'sp_in_example'}{'contents'}[0];
$result_trees{'sp_in_example'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'sp_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'sp_in_example'}{'contents'}[0]{'parent'} = $result_trees{'sp_in_example'};

$result_texis{'sp_in_example'} = '@example
Para
@sp 1
other para
Now lone @@sp:

@sp 1

@sp 2
Para after sp

A
@sp 2
B

sp after para
@sp 1
@end example
';


$result_texts{'sp_in_example'} = 'Para

other para
Now lone @sp:





Para after sp

A


B

sp after para

';

$result_errors{'sp_in_example'} = [];



$result_converted{'plaintext'}->{'sp_in_example'} = '     Para

     other para
     Now lone @sp:





     Para after sp

     A


     B

     sp after para

';

1;
