use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'empty_macro'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'foo',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [],
      'extra' => {
        'arg_line' => ' foo
',
        'macrobody' => ''
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
$result_trees{'empty_macro'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_macro'}{'contents'}[0];
$result_trees{'empty_macro'}{'contents'}[0]{'parent'} = $result_trees{'empty_macro'};
$result_trees{'empty_macro'}{'contents'}[1]{'extra'}{'command'} = $result_trees{'empty_macro'}{'contents'}[0];
$result_trees{'empty_macro'}{'contents'}[1]{'parent'} = $result_trees{'empty_macro'};
$result_trees{'empty_macro'}{'contents'}[2]{'parent'} = $result_trees{'empty_macro'};
$result_trees{'empty_macro'}{'contents'}[3]{'parent'} = $result_trees{'empty_macro'};
$result_trees{'empty_macro'}{'contents'}[4]{'parent'} = $result_trees{'empty_macro'};
$result_trees{'empty_macro'}{'contents'}[5]{'parent'} = $result_trees{'empty_macro'};

$result_texis{'empty_macro'} = '@macro foo
@end macro




';


$result_texts{'empty_macro'} = '



';

$result_errors{'empty_macro'} = [];


1;
