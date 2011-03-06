use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'recursive_call_in_macro'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'norecurse',
          'type' => 'macro_name'
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
          'text' => '@norecurse{arg}
',
          'type' => 'raw'
        }
      ],
      'extra' => {
        'arg_line' => ' norecurse{arg}
',
        'args_index' => {
          'arg' => 0
        },
        'macrobody' => '@norecurse{arg}
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'recursive_call_in_macro'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'recursive_call_in_macro'}{'contents'}[0];
$result_trees{'recursive_call_in_macro'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'recursive_call_in_macro'}{'contents'}[0];
$result_trees{'recursive_call_in_macro'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'recursive_call_in_macro'}{'contents'}[0];
$result_trees{'recursive_call_in_macro'}{'contents'}[0]{'parent'} = $result_trees{'recursive_call_in_macro'};
$result_trees{'recursive_call_in_macro'}{'contents'}[1]{'parent'} = $result_trees{'recursive_call_in_macro'};
$result_trees{'recursive_call_in_macro'}{'contents'}[2]{'parent'} = $result_trees{'recursive_call_in_macro'};
$result_trees{'recursive_call_in_macro'}{'contents'}[3]{'parent'} = $result_trees{'recursive_call_in_macro'};

$result_texis{'recursive_call_in_macro'} = '@macro norecurse{arg}
@norecurse{arg}
@end macro


';


$result_texts{'recursive_call_in_macro'} = '

';

$result_errors{'recursive_call_in_macro'} = [
  {
    'error_line' => ':5: Recursive call of macro norecurse is not allowed; use @rmacro if needed (possibly involving @norecurse)
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => 'norecurse',
    'text' => 'Recursive call of macro norecurse is not allowed; use @rmacro if needed',
    'type' => 'error'
  }
];


1;
