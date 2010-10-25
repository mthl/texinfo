use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'implicit_quoting_recursion'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'cat',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'a',
          'type' => 'macro_arg'
        },
        {
          'parent' => {},
          'text' => 'b',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'rmacro',
      'contents' => [
        {
          'parent' => {},
          'text' => '\\a\\\\b\\
',
          'type' => 'raw'
        }
      ],
      'extra' => {
        'arg_line' => ' cat{a,b}
',
        'args_index' => {
          'a' => 0,
          'b' => 1
        },
        'macrobody' => '\\a\\\\b\\
'
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'natopocotuototam
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'implicit_quoting_recursion'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'implicit_quoting_recursion'}{'contents'}[0];
$result_trees{'implicit_quoting_recursion'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'implicit_quoting_recursion'}{'contents'}[0];
$result_trees{'implicit_quoting_recursion'}{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'implicit_quoting_recursion'}{'contents'}[0];
$result_trees{'implicit_quoting_recursion'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'implicit_quoting_recursion'}{'contents'}[0];
$result_trees{'implicit_quoting_recursion'}{'contents'}[0]{'parent'} = $result_trees{'implicit_quoting_recursion'};
$result_trees{'implicit_quoting_recursion'}{'contents'}[1]{'parent'} = $result_trees{'implicit_quoting_recursion'};
$result_trees{'implicit_quoting_recursion'}{'contents'}[2]{'parent'} = $result_trees{'implicit_quoting_recursion'};
$result_trees{'implicit_quoting_recursion'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'implicit_quoting_recursion'}{'contents'}[3];
$result_trees{'implicit_quoting_recursion'}{'contents'}[3]{'parent'} = $result_trees{'implicit_quoting_recursion'};

$result_texis{'implicit_quoting_recursion'} = '@rmacro cat{a,b}
\\a\\\\b\\
@end rmacro

natopocotuototam
';


$result_texts{'implicit_quoting_recursion'} = '
natopocotuototam
';

$result_errors{'implicit_quoting_recursion'} = [];


$result_indices{'implicit_quoting_recursion'} = undef;


1;
