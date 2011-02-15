use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'many_conditionals'} = {
  'contents' => [
    {
      'cmdname' => 'html',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'This is html text.
',
          'type' => 'raw'
        }
      ],
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'This is ifhtml text.
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'This is ifinfo text.
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
      'cmdname' => 'tex',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'This is tex text.
',
          'type' => 'raw'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 23,
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
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'This is ifnottex text.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'many_conditionals'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'many_conditionals'}{'contents'}[0];
$result_trees{'many_conditionals'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'many_conditionals'}{'contents'}[0];
$result_trees{'many_conditionals'}{'contents'}[0]{'parent'} = $result_trees{'many_conditionals'};
$result_trees{'many_conditionals'}{'contents'}[1]{'parent'} = $result_trees{'many_conditionals'};
$result_trees{'many_conditionals'}{'contents'}[2]{'parent'} = $result_trees{'many_conditionals'};
$result_trees{'many_conditionals'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'many_conditionals'}{'contents'}[3];
$result_trees{'many_conditionals'}{'contents'}[3]{'parent'} = $result_trees{'many_conditionals'};
$result_trees{'many_conditionals'}{'contents'}[4]{'parent'} = $result_trees{'many_conditionals'};
$result_trees{'many_conditionals'}{'contents'}[5]{'parent'} = $result_trees{'many_conditionals'};
$result_trees{'many_conditionals'}{'contents'}[6]{'parent'} = $result_trees{'many_conditionals'};
$result_trees{'many_conditionals'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'many_conditionals'}{'contents'}[7];
$result_trees{'many_conditionals'}{'contents'}[7]{'parent'} = $result_trees{'many_conditionals'};
$result_trees{'many_conditionals'}{'contents'}[8]{'parent'} = $result_trees{'many_conditionals'};
$result_trees{'many_conditionals'}{'contents'}[9]{'parent'} = $result_trees{'many_conditionals'};
$result_trees{'many_conditionals'}{'contents'}[10]{'parent'} = $result_trees{'many_conditionals'};
$result_trees{'many_conditionals'}{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'many_conditionals'}{'contents'}[11];
$result_trees{'many_conditionals'}{'contents'}[11]{'contents'}[1]{'parent'} = $result_trees{'many_conditionals'}{'contents'}[11];
$result_trees{'many_conditionals'}{'contents'}[11]{'parent'} = $result_trees{'many_conditionals'};
$result_trees{'many_conditionals'}{'contents'}[12]{'parent'} = $result_trees{'many_conditionals'};
$result_trees{'many_conditionals'}{'contents'}[13]{'parent'} = $result_trees{'many_conditionals'};
$result_trees{'many_conditionals'}{'contents'}[14]{'parent'} = $result_trees{'many_conditionals'};
$result_trees{'many_conditionals'}{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'many_conditionals'}{'contents'}[15];
$result_trees{'many_conditionals'}{'contents'}[15]{'parent'} = $result_trees{'many_conditionals'};

$result_texis{'many_conditionals'} = '@html
This is html text.
@end html

This is ifhtml text.



This is ifinfo text.



@tex
This is tex text.
@end tex


This is ifnottex text.
';


$result_texts{'many_conditionals'} = '
This is ifhtml text.



This is ifinfo text.





This is ifnottex text.
';

$result_errors{'many_conditionals'} = [];


1;
