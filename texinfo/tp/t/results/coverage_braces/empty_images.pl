use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'empty_images'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'brace_command_arg'
        }
      ],
      'cmdname' => 'image',
      'contents' => [],
      'extra' => {
        'brace_command_contents' => [
          undef
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
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
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'aa'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'bb'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'cc'
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'dd'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        }
      ],
      'cmdname' => 'image',
      'contents' => [],
      'extra' => {
        'brace_command_contents' => [
          undef,
          [
            {}
          ],
          [
            {}
          ],
          [
            {}
          ],
          [
            {}
          ]
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
      'text' => '
'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'empty_images'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_images'}{'contents'}[0];
$result_trees{'empty_images'}{'contents'}[0]{'parent'} = $result_trees{'empty_images'};
$result_trees{'empty_images'}{'contents'}[1]{'parent'} = $result_trees{'empty_images'};
$result_trees{'empty_images'}{'contents'}[2]{'parent'} = $result_trees{'empty_images'};
$result_trees{'empty_images'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'empty_images'}{'contents'}[3];
$result_trees{'empty_images'}{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'empty_images'}{'contents'}[3]{'args'}[1];
$result_trees{'empty_images'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'empty_images'}{'contents'}[3];
$result_trees{'empty_images'}{'contents'}[3]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'empty_images'}{'contents'}[3]{'args'}[2];
$result_trees{'empty_images'}{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'empty_images'}{'contents'}[3];
$result_trees{'empty_images'}{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'empty_images'}{'contents'}[3]{'args'}[3];
$result_trees{'empty_images'}{'contents'}[3]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'empty_images'}{'contents'}[3]{'args'}[3];
$result_trees{'empty_images'}{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'empty_images'}{'contents'}[3];
$result_trees{'empty_images'}{'contents'}[3]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'empty_images'}{'contents'}[3]{'args'}[4];
$result_trees{'empty_images'}{'contents'}[3]{'args'}[4]{'parent'} = $result_trees{'empty_images'}{'contents'}[3];
$result_trees{'empty_images'}{'contents'}[3]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'empty_images'}{'contents'}[3]{'args'}[1]{'contents'}[0];
$result_trees{'empty_images'}{'contents'}[3]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'empty_images'}{'contents'}[3]{'args'}[2]{'contents'}[0];
$result_trees{'empty_images'}{'contents'}[3]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'empty_images'}{'contents'}[3]{'args'}[3]{'contents'}[0];
$result_trees{'empty_images'}{'contents'}[3]{'extra'}{'brace_command_contents'}[4][0] = $result_trees{'empty_images'}{'contents'}[3]{'args'}[4]{'contents'}[0];
$result_trees{'empty_images'}{'contents'}[3]{'parent'} = $result_trees{'empty_images'};
$result_trees{'empty_images'}{'contents'}[4]{'parent'} = $result_trees{'empty_images'};

$result_texis{'empty_images'} = '@image{}

@image{ ,aa,bb,cc ,dd}
';


$result_texts{'empty_images'} = '


';

$result_errors{'empty_images'} = [];


1;
