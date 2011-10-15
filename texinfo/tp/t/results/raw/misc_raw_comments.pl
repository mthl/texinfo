use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'misc_raw_comments'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'html',
      'contents' => [
        {
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => ' ',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => '@c comment space
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => 'in html ',
          'type' => 'raw'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => ' comment no space
',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'c',
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'tex',
      'contents' => [
        {
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => ' ',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'in tex',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'last_raw_newline'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 5,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'extra' => {
        'command' => {}
      },
      'parent' => {},
      'text' => '    ',
      'type' => 'empty_spaces_after_command'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => ' comment after end tex
',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'c',
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'verbatim',
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
          'text' => 'in verbatim @c in verbatim
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => 'in verbatim2
',
          'type' => 'raw'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 8,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'extra' => {
        'command' => {}
      },
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'misc_raw_comments'}{'contents'}[0]{'parent'} = $result_trees{'misc_raw_comments'};
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'parent'} = $result_trees{'misc_raw_comments'};
$result_trees{'misc_raw_comments'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[2];
$result_trees{'misc_raw_comments'}{'contents'}[2]{'parent'} = $result_trees{'misc_raw_comments'};
$result_trees{'misc_raw_comments'}{'contents'}[3]{'parent'} = $result_trees{'misc_raw_comments'};
$result_trees{'misc_raw_comments'}{'contents'}[4]{'contents'}[0]{'extra'}{'command'} = $result_trees{'misc_raw_comments'}{'contents'}[4];
$result_trees{'misc_raw_comments'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[4];
$result_trees{'misc_raw_comments'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[4];
$result_trees{'misc_raw_comments'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[4];
$result_trees{'misc_raw_comments'}{'contents'}[4]{'parent'} = $result_trees{'misc_raw_comments'};
$result_trees{'misc_raw_comments'}{'contents'}[5]{'extra'}{'command'} = $result_trees{'misc_raw_comments'}{'contents'}[4];
$result_trees{'misc_raw_comments'}{'contents'}[5]{'parent'} = $result_trees{'misc_raw_comments'};
$result_trees{'misc_raw_comments'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[6];
$result_trees{'misc_raw_comments'}{'contents'}[6]{'parent'} = $result_trees{'misc_raw_comments'};
$result_trees{'misc_raw_comments'}{'contents'}[7]{'parent'} = $result_trees{'misc_raw_comments'};
$result_trees{'misc_raw_comments'}{'contents'}[8]{'contents'}[0]{'extra'}{'command'} = $result_trees{'misc_raw_comments'}{'contents'}[8];
$result_trees{'misc_raw_comments'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[8];
$result_trees{'misc_raw_comments'}{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[8];
$result_trees{'misc_raw_comments'}{'contents'}[8]{'contents'}[2]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[8];
$result_trees{'misc_raw_comments'}{'contents'}[8]{'parent'} = $result_trees{'misc_raw_comments'};
$result_trees{'misc_raw_comments'}{'contents'}[9]{'extra'}{'command'} = $result_trees{'misc_raw_comments'}{'contents'}[8];
$result_trees{'misc_raw_comments'}{'contents'}[9]{'parent'} = $result_trees{'misc_raw_comments'};

$result_texis{'misc_raw_comments'} = '
@html @c comment space
in html @end html@c comment no space

@tex in tex
@end tex    @c comment after end tex

@verbatim
in verbatim @c in verbatim
in verbatim2
@end verbatim
';


$result_texts{'misc_raw_comments'} = '


in verbatim @c in verbatim
in verbatim2
';

$result_errors{'misc_raw_comments'} = [
  {
    'error_line' => ':3: warning: @end html should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@end html should only appear at a line beginning',
    'type' => 'warning'
  }
];



$result_converted{'plaintext'}->{'misc_raw_comments'} = 'in verbatim @c in verbatim
in verbatim2
';

1;
