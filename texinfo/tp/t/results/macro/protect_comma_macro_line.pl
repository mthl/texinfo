use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'protect_comma_macro_line'} = {
  'contents' => [
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
          'text' => 'we get \\arg\\ and another \\arg\\
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => 'and another one on another line \\arg\\
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
          'text' => 'and a last in another paragraph
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'args_index' => {
          'arg' => 0
        },
        'macro_line' => ' macro2 { arg }
',
        'macrobody' => 'we get \\arg\\ and another \\arg\\
and another one on another line \\arg\\

and a last in another paragraph
'
      }
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
          'text' => 'we get arg,  comma \\, and another arg,  comma \\,
'
        },
        {
          'parent' => {},
          'text' => 'and another one on another line arg,  comma \\,
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
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
          'text' => 'and a last in another paragraph
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'protect_comma_macro_line'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'protect_comma_macro_line'}{'contents'}[0];
$result_trees{'protect_comma_macro_line'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'protect_comma_macro_line'}{'contents'}[0];
$result_trees{'protect_comma_macro_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'protect_comma_macro_line'}{'contents'}[0];
$result_trees{'protect_comma_macro_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'protect_comma_macro_line'}{'contents'}[0];
$result_trees{'protect_comma_macro_line'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'protect_comma_macro_line'}{'contents'}[0];
$result_trees{'protect_comma_macro_line'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'protect_comma_macro_line'}{'contents'}[0];
$result_trees{'protect_comma_macro_line'}{'contents'}[0]{'parent'} = $result_trees{'protect_comma_macro_line'};
$result_trees{'protect_comma_macro_line'}{'contents'}[1]{'parent'} = $result_trees{'protect_comma_macro_line'};
$result_trees{'protect_comma_macro_line'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'protect_comma_macro_line'}{'contents'}[2];
$result_trees{'protect_comma_macro_line'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'protect_comma_macro_line'}{'contents'}[2];
$result_trees{'protect_comma_macro_line'}{'contents'}[2]{'parent'} = $result_trees{'protect_comma_macro_line'};
$result_trees{'protect_comma_macro_line'}{'contents'}[3]{'parent'} = $result_trees{'protect_comma_macro_line'};
$result_trees{'protect_comma_macro_line'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'protect_comma_macro_line'}{'contents'}[4];
$result_trees{'protect_comma_macro_line'}{'contents'}[4]{'parent'} = $result_trees{'protect_comma_macro_line'};

$result_texts{'protect_comma_macro_line'} = '@macro macro2 { arg }
we get \\arg\\ and another \\arg\\
and another one on another line \\arg\\

and a last in another paragraph
@end macro

we get arg,  comma \\, and another arg,  comma \\,
and another one on another line arg,  comma \\,

and a last in another paragraph
';

$result_errors{'protect_comma_macro_line'} = [];


