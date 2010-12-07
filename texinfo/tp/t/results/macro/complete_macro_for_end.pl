use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'complete_macro_for_end'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'the-end',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@end cartouche
',
          'type' => 'raw'
        }
      ],
      'extra' => {
        'arg_line' => ' the-end
',
        'macrobody' => '@end cartouche
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
      'cmdname' => 'cartouche',
      'contents' => [
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
$result_trees{'complete_macro_for_end'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'complete_macro_for_end'}{'contents'}[0];
$result_trees{'complete_macro_for_end'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'complete_macro_for_end'}{'contents'}[0];
$result_trees{'complete_macro_for_end'}{'contents'}[0]{'parent'} = $result_trees{'complete_macro_for_end'};
$result_trees{'complete_macro_for_end'}{'contents'}[1]{'parent'} = $result_trees{'complete_macro_for_end'};
$result_trees{'complete_macro_for_end'}{'contents'}[2]{'parent'} = $result_trees{'complete_macro_for_end'};
$result_trees{'complete_macro_for_end'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'complete_macro_for_end'}{'contents'}[3];
$result_trees{'complete_macro_for_end'}{'contents'}[3]{'parent'} = $result_trees{'complete_macro_for_end'};
$result_trees{'complete_macro_for_end'}{'contents'}[4]{'parent'} = $result_trees{'complete_macro_for_end'};

$result_texis{'complete_macro_for_end'} = '@macro the-end
@end cartouche
@end macro

@cartouche
@end cartouche';


$result_texts{'complete_macro_for_end'} = '
';

$result_errors{'complete_macro_for_end'} = [];


1;
