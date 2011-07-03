use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'macro_in_macro_arg_simpler'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'macro11',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'a, macro2
',
          'type' => 'raw'
        }
      ],
      'extra' => {
        'arg_line' => ' macro11
',
        'macrobody' => 'a, macro2
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
      'args' => [
        {
          'parent' => {},
          'text' => 'macro3',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'text',
          'type' => 'macro_arg'
        },
        {
          'parent' => {},
          'text' => 'arg',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '\\text\\
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '&&&& \\arg\\
',
          'type' => 'raw'
        }
      ],
      'extra' => {
        'arg_line' => ' macro3{text, arg}
',
        'args_index' => {
          'arg' => 1,
          'text' => 0
        },
        'macrobody' => '\\text\\
&&&& \\arg\\
'
      },
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'a, macro2text for macro2
'
        },
        {
          'parent' => {},
          'text' => '&&&& 
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[0];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[0];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'};
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[1]{'extra'}{'command'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[0];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'};
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[2]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'};
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[3];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[3];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[3];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[3];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[3];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[3]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'};
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[4]{'extra'}{'command'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[3];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[4]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'};
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[5]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'};
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[6];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[6];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[6]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'};

$result_texis{'macro_in_macro_arg_simpler'} = '@macro macro11
a, macro2
@end macro

@macro macro3{text, arg}
\\text\\
&&&& \\arg\\
@end macro

a, macro2text for macro2
&&&& 
';


$result_texts{'macro_in_macro_arg_simpler'} = '

a, macro2text for macro2
&&&& 
';

$result_errors{'macro_in_macro_arg_simpler'} = [];


1;
