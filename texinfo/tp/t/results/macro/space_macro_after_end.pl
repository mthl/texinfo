use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'space_macro_after_end'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'spaces',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '  ',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'last_raw_newline'
        }
      ],
      'extra' => {
        'arg_line' => ' spaces
',
        'macrobody' => '  
'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
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
    },
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
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'in html',
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
      'text' => '   ',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'space_macro_after_end'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'space_macro_after_end'}{'contents'}[0];
$result_trees{'space_macro_after_end'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_macro_after_end'}{'contents'}[0];
$result_trees{'space_macro_after_end'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_macro_after_end'}{'contents'}[0];
$result_trees{'space_macro_after_end'}{'contents'}[0]{'parent'} = $result_trees{'space_macro_after_end'};
$result_trees{'space_macro_after_end'}{'contents'}[1]{'extra'}{'command'} = $result_trees{'space_macro_after_end'}{'contents'}[0];
$result_trees{'space_macro_after_end'}{'contents'}[1]{'parent'} = $result_trees{'space_macro_after_end'};
$result_trees{'space_macro_after_end'}{'contents'}[2]{'parent'} = $result_trees{'space_macro_after_end'};
$result_trees{'space_macro_after_end'}{'contents'}[3]{'contents'}[0]{'extra'}{'command'} = $result_trees{'space_macro_after_end'}{'contents'}[3];
$result_trees{'space_macro_after_end'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'space_macro_after_end'}{'contents'}[3];
$result_trees{'space_macro_after_end'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'space_macro_after_end'}{'contents'}[3];
$result_trees{'space_macro_after_end'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'space_macro_after_end'}{'contents'}[3];
$result_trees{'space_macro_after_end'}{'contents'}[3]{'parent'} = $result_trees{'space_macro_after_end'};
$result_trees{'space_macro_after_end'}{'contents'}[4]{'extra'}{'command'} = $result_trees{'space_macro_after_end'}{'contents'}[3];
$result_trees{'space_macro_after_end'}{'contents'}[4]{'parent'} = $result_trees{'space_macro_after_end'};

$result_texis{'space_macro_after_end'} = '@macro spaces
  
@end macro

@html
in html
@end html   ';


$result_texts{'space_macro_after_end'} = '
';

$result_errors{'space_macro_after_end'} = [
  {
    'error_line' => ':7: warning: Superfluous argument to @end html:  @spaces{}
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'Superfluous argument to @end html:  @spaces{}',
    'type' => 'warning'
  }
];


1;
