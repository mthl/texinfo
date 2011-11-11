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
          'text' => 'in html @end html@c comment no space
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '@tex in tex
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '@end tex    @c comment after end tex
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '@verbatim
',
          'type' => 'raw'
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
        },
        {
          'parent' => {},
          'text' => '@end verbatim
',
          'type' => 'raw'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'misc_raw_comments'}{'contents'}[0]{'parent'} = $result_trees{'misc_raw_comments'};
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'misc_raw_comments'}{'contents'}[1];
$result_trees{'misc_raw_comments'}{'contents'}[1]{'parent'} = $result_trees{'misc_raw_comments'};

$result_texis{'misc_raw_comments'} = '
@html @c comment space
in html @end html@c comment no space

@tex in tex
@end tex    @c comment after end tex

@verbatim
in verbatim @c in verbatim
in verbatim2
@end verbatim
@end html';


$result_texts{'misc_raw_comments'} = '
';

$result_errors{'misc_raw_comments'} = [
  {
    'error_line' => ':11: No matching `@end html\'
',
    'file_name' => '',
    'line_nr' => 11,
    'macro' => '',
    'text' => 'No matching `@end html\'',
    'type' => 'error'
  }
];



$result_converted{'plaintext'}->{'misc_raw_comments'} = '';

1;
