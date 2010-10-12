use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'macro_in_macro_arg'} = {
  'contents' => [
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
          'text' => 'macro1',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'a, @macro2
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' macro1
',
        'macrobody' => 'a, @macro2
'
      }
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
      'args' => [
        {
          'parent' => {},
          'text' => 'macro2',
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
          'text' => 'hello \\arg\\ after arg
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' macro2{arg}
',
        'args_index' => {
          'arg' => 0
        },
        'macrobody' => 'hello \\arg\\ after arg
'
      }
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
        'arg_line' => ' macro3{text, arg}
',
        'args_index' => {
          'arg' => 1,
          'text' => 0
        },
        'macrobody' => '\\text\\
&&&& \\arg\\
'
      }
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'a, hello text for macro2 after arg
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
$result_trees{'macro_in_macro_arg'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_macro_arg'};
$result_trees{'macro_in_macro_arg'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'macro_in_macro_arg'}{'contents'}[1];
$result_trees{'macro_in_macro_arg'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'macro_in_macro_arg'}{'contents'}[1];
$result_trees{'macro_in_macro_arg'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_macro_arg'};
$result_trees{'macro_in_macro_arg'}{'contents'}[2]{'parent'} = $result_trees{'macro_in_macro_arg'};
$result_trees{'macro_in_macro_arg'}{'contents'}[3]{'parent'} = $result_trees{'macro_in_macro_arg'};
$result_trees{'macro_in_macro_arg'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'macro_in_macro_arg'}{'contents'}[4];
$result_trees{'macro_in_macro_arg'}{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'macro_in_macro_arg'}{'contents'}[4];
$result_trees{'macro_in_macro_arg'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'macro_in_macro_arg'}{'contents'}[4];
$result_trees{'macro_in_macro_arg'}{'contents'}[4]{'parent'} = $result_trees{'macro_in_macro_arg'};
$result_trees{'macro_in_macro_arg'}{'contents'}[5]{'parent'} = $result_trees{'macro_in_macro_arg'};
$result_trees{'macro_in_macro_arg'}{'contents'}[6]{'parent'} = $result_trees{'macro_in_macro_arg'};
$result_trees{'macro_in_macro_arg'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'macro_in_macro_arg'}{'contents'}[7];
$result_trees{'macro_in_macro_arg'}{'contents'}[7]{'args'}[1]{'parent'} = $result_trees{'macro_in_macro_arg'}{'contents'}[7];
$result_trees{'macro_in_macro_arg'}{'contents'}[7]{'args'}[2]{'parent'} = $result_trees{'macro_in_macro_arg'}{'contents'}[7];
$result_trees{'macro_in_macro_arg'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'macro_in_macro_arg'}{'contents'}[7];
$result_trees{'macro_in_macro_arg'}{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'macro_in_macro_arg'}{'contents'}[7];
$result_trees{'macro_in_macro_arg'}{'contents'}[7]{'parent'} = $result_trees{'macro_in_macro_arg'};
$result_trees{'macro_in_macro_arg'}{'contents'}[8]{'parent'} = $result_trees{'macro_in_macro_arg'};
$result_trees{'macro_in_macro_arg'}{'contents'}[9]{'parent'} = $result_trees{'macro_in_macro_arg'};
$result_trees{'macro_in_macro_arg'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'macro_in_macro_arg'}{'contents'}[10];
$result_trees{'macro_in_macro_arg'}{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'macro_in_macro_arg'}{'contents'}[10];
$result_trees{'macro_in_macro_arg'}{'contents'}[10]{'parent'} = $result_trees{'macro_in_macro_arg'};

$result_texts{'macro_in_macro_arg'} = '
@macro macro1
a, @macro2
@end macro

@macro macro2{arg}
hello \\arg\\ after arg
@end macro

@macro macro3{text, arg}
\\text\\
&&&& \\arg\\
@end macro

a, hello text for macro2 after arg
&&&& 
';

$result_errors{'macro_in_macro_arg'} = [];


