use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'sp'} = {
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
          'text' => 'Text line followed on the same line and another below '
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
      'parent' => {},
      'special' => {
        'misc_args' => [
          '1'
        ]
      }
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
      'parent' => {},
      'special' => {
        'misc_args' => [
          '2'
        ]
      }
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Text line after the sp followed by a sp '
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
      'parent' => {},
      'special' => {
        'misc_args' => [
          '1'
        ]
      }
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Text line after the text line followed by the sp.
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => '2 a number after sp'
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
      'parent' => {}
    }
  ]
};
$result_trees{'sp'}{'contents'}[0]{'parent'} = $result_trees{'sp'};
$result_trees{'sp'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'sp'}{'contents'}[1];
$result_trees{'sp'}{'contents'}[1]{'parent'} = $result_trees{'sp'};
$result_trees{'sp'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sp'}{'contents'}[2]{'args'}[0];
$result_trees{'sp'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'sp'}{'contents'}[2]{'args'}[0];
$result_trees{'sp'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'sp'}{'contents'}[2]{'args'}[0];
$result_trees{'sp'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'sp'}{'contents'}[2];
$result_trees{'sp'}{'contents'}[2]{'parent'} = $result_trees{'sp'};
$result_trees{'sp'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sp'}{'contents'}[3]{'args'}[0];
$result_trees{'sp'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'sp'}{'contents'}[3]{'args'}[0];
$result_trees{'sp'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'sp'}{'contents'}[3]{'args'}[0];
$result_trees{'sp'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'sp'}{'contents'}[3];
$result_trees{'sp'}{'contents'}[3]{'parent'} = $result_trees{'sp'};
$result_trees{'sp'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'sp'}{'contents'}[4];
$result_trees{'sp'}{'contents'}[4]{'parent'} = $result_trees{'sp'};
$result_trees{'sp'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sp'}{'contents'}[5]{'args'}[0];
$result_trees{'sp'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'sp'}{'contents'}[5]{'args'}[0];
$result_trees{'sp'}{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'sp'}{'contents'}[5]{'args'}[0];
$result_trees{'sp'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'sp'}{'contents'}[5];
$result_trees{'sp'}{'contents'}[5]{'parent'} = $result_trees{'sp'};
$result_trees{'sp'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'sp'}{'contents'}[6];
$result_trees{'sp'}{'contents'}[6]{'parent'} = $result_trees{'sp'};
$result_trees{'sp'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sp'}{'contents'}[7]{'args'}[0];
$result_trees{'sp'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'sp'}{'contents'}[7]{'args'}[0];
$result_trees{'sp'}{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'sp'}{'contents'}[7]{'args'}[0];
$result_trees{'sp'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'sp'}{'contents'}[7];
$result_trees{'sp'}{'contents'}[7]{'parent'} = $result_trees{'sp'};

$result_texis{'sp'} = '
Text line followed on the same line and another below @sp 1
@sp 2
Text line after the sp followed by a sp @sp 1
Text line after the text line followed by the sp.
@sp 2 a number after sp
';


$result_texts{'sp'} = '
Text line followed on the same line and another below 


Text line after the sp followed by a sp 
Text line after the text line followed by the sp.
';

$result_errors{'sp'} = [
  {
    'error_line' => ':7: @sp arg must be numeric, not `2 a number after sp\'
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => '@sp arg must be numeric, not `2 a number after sp\'',
    'type' => 'error'
  }
];


