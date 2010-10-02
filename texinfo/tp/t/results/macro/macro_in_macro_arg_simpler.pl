use vars qw(%result_texts %result_trees %result_errors);

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
      'parent' => {},
      'special' => {
        'macro_line' => ' macro11
',
        'macrobody' => 'a, macro2
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
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
      'parent' => {},
      'special' => {
        'args_index' => {
          'arg' => 1,
          'text' => 0
        },
        'macro_line' => ' macro3{text, arg}
',
        'macrobody' => '\\text\\
&&&& \\arg\\
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
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
  ]
};
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[0];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[0];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'};
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'};
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[2];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[2];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[2];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[2];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[2];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[2]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'};
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[3]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'};
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[4];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'}{'contents'}[4];
$result_trees{'macro_in_macro_arg_simpler'}{'contents'}[4]{'parent'} = $result_trees{'macro_in_macro_arg_simpler'};

$result_texts{'macro_in_macro_arg_simpler'} = '@macro macro11
a, macro2
@end macro

@macro macro3{text, arg}
\\text\\
&&&& \\arg\\
@end macro

a, macro2text for macro2
&&&& 
';

$result_errors{'macro_in_macro_arg_simpler'} = [];


