use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'macro_in_menu'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'star',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '* 
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'macro_line' => ' star
',
        'macrobody' => '* 
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
      'parent' => {},
      'special' => {
        'macro_line' => ' spaces
',
        'macrobody' => '  
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
      'args' => [
        {
          'parent' => {},
          'text' => 'two-colon',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '::
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'macro_line' => ' two-colon
',
        'macrobody' => '::
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
      'cmdname' => 'menu',
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '* menu entry:: description
'
            },
            {
              'parent' => {},
              'text' => '  
',
              'type' => 'empty_line'
            },
            {
              'parent' => {},
              'text' => 'menu comment
'
            }
          ],
          'parent' => {},
          'type' => 'menu_comment'
        }
      ],
      'parent' => {}
    }
  ]
};
$result_trees{'macro_in_menu'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_menu'}{'contents'}[0];
$result_trees{'macro_in_menu'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_menu'}{'contents'}[0];
$result_trees{'macro_in_menu'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_menu'};
$result_trees{'macro_in_menu'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_menu'};
$result_trees{'macro_in_menu'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'macro_in_menu'}{'contents'}[2];
$result_trees{'macro_in_menu'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'macro_in_menu'}{'contents'}[2];
$result_trees{'macro_in_menu'}{'contents'}[2]{'parent'} = $result_trees{'macro_in_menu'};
$result_trees{'macro_in_menu'}{'contents'}[3]{'parent'} = $result_trees{'macro_in_menu'};
$result_trees{'macro_in_menu'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'macro_in_menu'}{'contents'}[4];
$result_trees{'macro_in_menu'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'macro_in_menu'}{'contents'}[4];
$result_trees{'macro_in_menu'}{'contents'}[4]{'parent'} = $result_trees{'macro_in_menu'};
$result_trees{'macro_in_menu'}{'contents'}[5]{'parent'} = $result_trees{'macro_in_menu'};
$result_trees{'macro_in_menu'}{'contents'}[6]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_menu'}{'contents'}[6]{'contents'}[0];
$result_trees{'macro_in_menu'}{'contents'}[6]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_menu'}{'contents'}[6]{'contents'}[0];
$result_trees{'macro_in_menu'}{'contents'}[6]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_menu'}{'contents'}[6]{'contents'}[0];
$result_trees{'macro_in_menu'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'macro_in_menu'}{'contents'}[6];
$result_trees{'macro_in_menu'}{'contents'}[6]{'parent'} = $result_trees{'macro_in_menu'};

$result_texts{'macro_in_menu'} = '@macro star
* 
@end macro

@macro spaces
  
@end macro

@macro two-colon
::
@end macro

@menu
* menu entry:: description
  
menu comment
@end menu
';

$result_errors{'macro_in_menu'} = [];


