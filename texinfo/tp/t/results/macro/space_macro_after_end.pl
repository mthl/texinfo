use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

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
          'text' => '  
',
          'type' => 'raw'
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'in html
',
          'type' => 'raw'
        }
      ],
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '   ',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'space_macro_after_end'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'space_macro_after_end'}{'contents'}[0];
$result_trees{'space_macro_after_end'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_macro_after_end'}{'contents'}[0];
$result_trees{'space_macro_after_end'}{'contents'}[0]{'parent'} = $result_trees{'space_macro_after_end'};
$result_trees{'space_macro_after_end'}{'contents'}[1]{'parent'} = $result_trees{'space_macro_after_end'};
$result_trees{'space_macro_after_end'}{'contents'}[2]{'parent'} = $result_trees{'space_macro_after_end'};
$result_trees{'space_macro_after_end'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'space_macro_after_end'}{'contents'}[3];
$result_trees{'space_macro_after_end'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'space_macro_after_end'}{'contents'}[3];
$result_trees{'space_macro_after_end'}{'contents'}[3]{'parent'} = $result_trees{'space_macro_after_end'};
$result_trees{'space_macro_after_end'}{'contents'}[4]{'parent'} = $result_trees{'space_macro_after_end'};

$result_texis{'space_macro_after_end'} = '@macro spaces
  
@end macro

@html
in html
@end html   ';


$result_texts{'space_macro_after_end'} = '
';

$result_errors{'space_macro_after_end'} = [];


1;
