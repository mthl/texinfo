use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'paragraph_and_macro'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'empty',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [],
      'parent' => {},
      'special' => {
        'arg_line' => ' empty
',
        'macrobody' => ''
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
          'text' => 'space',
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
        'arg_line' => ' space
',
        'macrobody' => '   
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
          'text' => 'word',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'a word
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' word
',
        'macrobody' => 'a word
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
    },
    {
      'parent' => {},
      'text' => ' '
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text after empty.
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
    },
    {
      'parent' => {},
      'text' => '    '
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text after space.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'paragraph_and_macro'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'paragraph_and_macro'}{'contents'}[0];
$result_trees{'paragraph_and_macro'}{'contents'}[0]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[1]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[2]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'paragraph_and_macro'}{'contents'}[3];
$result_trees{'paragraph_and_macro'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'paragraph_and_macro'}{'contents'}[3];
$result_trees{'paragraph_and_macro'}{'contents'}[3]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[4]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[5]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'paragraph_and_macro'}{'contents'}[6];
$result_trees{'paragraph_and_macro'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'paragraph_and_macro'}{'contents'}[6];
$result_trees{'paragraph_and_macro'}{'contents'}[6]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[7]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[8]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[9]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[10]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[11]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[12]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[13]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[14]{'contents'}[0]{'parent'} = $result_trees{'paragraph_and_macro'}{'contents'}[14];
$result_trees{'paragraph_and_macro'}{'contents'}[14]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[15]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[16]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[17]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[18]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[19]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[20]{'parent'} = $result_trees{'paragraph_and_macro'};
$result_trees{'paragraph_and_macro'}{'contents'}[21]{'contents'}[0]{'parent'} = $result_trees{'paragraph_and_macro'}{'contents'}[21];
$result_trees{'paragraph_and_macro'}{'contents'}[21]{'parent'} = $result_trees{'paragraph_and_macro'};

$result_texis{'paragraph_and_macro'} = '@macro empty
@end macro

@macro space
   
@end macro

@macro word
a word
@end macro



    

 text after empty.

   

       

    text after space.
';


$result_texts{'paragraph_and_macro'} = '




    

 text after empty.

   

       

    text after space.
';

$result_errors{'paragraph_and_macro'} = [];


