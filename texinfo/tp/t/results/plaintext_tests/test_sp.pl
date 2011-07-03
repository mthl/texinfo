use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'test_sp'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Para
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
              'extra' => {
                'command' => {}
              },
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
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'contents' => [
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
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
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
        'line_nr' => 6,
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
              'extra' => {
                'command' => {}
              },
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
        'line_nr' => 8,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Para after sp
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
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
          'text' => 'A
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
              'extra' => {
                'command' => {}
              },
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
        'line_nr' => 12,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'B
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
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
          'text' => 'sp after para
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
              'extra' => {
                'command' => {}
              },
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
        'line_nr' => 16,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'test_sp'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[0];
$result_trees{'test_sp'}{'contents'}[0]{'parent'} = $result_trees{'test_sp'};
$result_trees{'test_sp'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'test_sp'}{'contents'}[1];
$result_trees{'test_sp'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[1]{'args'}[0];
$result_trees{'test_sp'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'test_sp'}{'contents'}[1]{'args'}[0];
$result_trees{'test_sp'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'test_sp'}{'contents'}[1]{'args'}[0];
$result_trees{'test_sp'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[1];
$result_trees{'test_sp'}{'contents'}[1]{'parent'} = $result_trees{'test_sp'};
$result_trees{'test_sp'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[2];
$result_trees{'test_sp'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'test_sp'}{'contents'}[2];
$result_trees{'test_sp'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'test_sp'}{'contents'}[2];
$result_trees{'test_sp'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'test_sp'}{'contents'}[2];
$result_trees{'test_sp'}{'contents'}[2]{'parent'} = $result_trees{'test_sp'};
$result_trees{'test_sp'}{'contents'}[3]{'parent'} = $result_trees{'test_sp'};
$result_trees{'test_sp'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'test_sp'}{'contents'}[4];
$result_trees{'test_sp'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[4]{'args'}[0];
$result_trees{'test_sp'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'test_sp'}{'contents'}[4]{'args'}[0];
$result_trees{'test_sp'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'test_sp'}{'contents'}[4]{'args'}[0];
$result_trees{'test_sp'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[4];
$result_trees{'test_sp'}{'contents'}[4]{'parent'} = $result_trees{'test_sp'};
$result_trees{'test_sp'}{'contents'}[5]{'parent'} = $result_trees{'test_sp'};
$result_trees{'test_sp'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'test_sp'}{'contents'}[6];
$result_trees{'test_sp'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[6]{'args'}[0];
$result_trees{'test_sp'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'test_sp'}{'contents'}[6]{'args'}[0];
$result_trees{'test_sp'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'test_sp'}{'contents'}[6]{'args'}[0];
$result_trees{'test_sp'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[6];
$result_trees{'test_sp'}{'contents'}[6]{'parent'} = $result_trees{'test_sp'};
$result_trees{'test_sp'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[7];
$result_trees{'test_sp'}{'contents'}[7]{'parent'} = $result_trees{'test_sp'};
$result_trees{'test_sp'}{'contents'}[8]{'parent'} = $result_trees{'test_sp'};
$result_trees{'test_sp'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[9];
$result_trees{'test_sp'}{'contents'}[9]{'parent'} = $result_trees{'test_sp'};
$result_trees{'test_sp'}{'contents'}[10]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'test_sp'}{'contents'}[10];
$result_trees{'test_sp'}{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[10]{'args'}[0];
$result_trees{'test_sp'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'test_sp'}{'contents'}[10]{'args'}[0];
$result_trees{'test_sp'}{'contents'}[10]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'test_sp'}{'contents'}[10]{'args'}[0];
$result_trees{'test_sp'}{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[10];
$result_trees{'test_sp'}{'contents'}[10]{'parent'} = $result_trees{'test_sp'};
$result_trees{'test_sp'}{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[11];
$result_trees{'test_sp'}{'contents'}[11]{'parent'} = $result_trees{'test_sp'};
$result_trees{'test_sp'}{'contents'}[12]{'parent'} = $result_trees{'test_sp'};
$result_trees{'test_sp'}{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[13];
$result_trees{'test_sp'}{'contents'}[13]{'parent'} = $result_trees{'test_sp'};
$result_trees{'test_sp'}{'contents'}[14]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'test_sp'}{'contents'}[14];
$result_trees{'test_sp'}{'contents'}[14]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[14]{'args'}[0];
$result_trees{'test_sp'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'test_sp'}{'contents'}[14]{'args'}[0];
$result_trees{'test_sp'}{'contents'}[14]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'test_sp'}{'contents'}[14]{'args'}[0];
$result_trees{'test_sp'}{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'test_sp'}{'contents'}[14];
$result_trees{'test_sp'}{'contents'}[14]{'parent'} = $result_trees{'test_sp'};

$result_texis{'test_sp'} = 'Para
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
';


$result_texts{'test_sp'} = 'Para

other para
Now lone @sp:





Para after sp

A


B

sp after para

';

$result_errors{'test_sp'} = [];



$result_converted{'plaintext'}->{'test_sp'} = 'Para

   other para Now lone @sp:




   Para after sp

   A


   B

   sp after para

';

1;
