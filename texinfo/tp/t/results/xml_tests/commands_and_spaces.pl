use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'commands_and_spaces'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'foo',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'some @value',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'extra' => {
        'arg_line' => '  foo   some @value
'
      },
      'parent' => {}
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
          'text' => 'ggg',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'unmacro',
      'extra' => {
        'arg_line' => '  ggg
'
      },
      'parent' => {}
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
          'text' => '@arrow',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'clickstyle',
      'extra' => {
        'arg_line' => '  @arrow
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => '  after  cropmarks.
',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'cropmarks',
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'commands_and_spaces'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'};
$result_trees{'commands_and_spaces'}{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'};
$result_trees{'commands_and_spaces'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[2];
$result_trees{'commands_and_spaces'}{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'};
$result_trees{'commands_and_spaces'}{'contents'}[3]{'parent'} = $result_trees{'commands_and_spaces'};
$result_trees{'commands_and_spaces'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[4];
$result_trees{'commands_and_spaces'}{'contents'}[4]{'parent'} = $result_trees{'commands_and_spaces'};
$result_trees{'commands_and_spaces'}{'contents'}[5]{'parent'} = $result_trees{'commands_and_spaces'};
$result_trees{'commands_and_spaces'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[6];
$result_trees{'commands_and_spaces'}{'contents'}[6]{'parent'} = $result_trees{'commands_and_spaces'};

$result_texis{'commands_and_spaces'} = '@set  foo   some @value

@unmacro  ggg

@clickstyle  @arrow

@cropmarks  after  cropmarks.
';


$result_texts{'commands_and_spaces'} = '


';

$result_errors{'commands_and_spaces'} = [];



$result_converted{'xml'}->{'commands_and_spaces'} = '<set name="foo" line="  foo   some @value">some @value</set>


<clickstyle command="arrow" line="  @arrow">@arrow</clickstyle>

<cropmarks line="  after  cropmarks."></cropmarks>
';

1;
