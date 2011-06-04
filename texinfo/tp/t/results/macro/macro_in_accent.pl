use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'macro_in_accent'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'a-letter',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'a
',
          'type' => 'raw'
        }
      ],
      'extra' => {
        'arg_line' => ' a-letter
',
        'macrobody' => 'a
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
      'extra' => {
        'arg_line' => ' space
',
        'macrobody' => '  
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
      'contents' => [
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'a',
              'type' => 'space_command_arg'
            }
          ],
          'cmdname' => 'ringaccent',
          'extra' => {
            'spaces' => ' '
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '.
'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'a',
              'type' => 'space_command_arg'
            }
          ],
          'cmdname' => 'ringaccent',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '.
'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'a'
            }
          ],
          'cmdname' => '~',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '.
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => '~',
          'contents' => [],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 12,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '.
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
          'args' => [
            {
              'parent' => {},
              'text' => 'a',
              'type' => 'space_command_arg'
            }
          ],
          'cmdname' => 'ringaccent',
          'extra' => {
            'spaces' => '  '
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'macro_in_accent'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[0];
$result_trees{'macro_in_accent'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[0];
$result_trees{'macro_in_accent'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_accent'};
$result_trees{'macro_in_accent'}{'contents'}[1]{'extra'}{'command'} = $result_trees{'macro_in_accent'}{'contents'}[0];
$result_trees{'macro_in_accent'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_accent'};
$result_trees{'macro_in_accent'}{'contents'}[2]{'parent'} = $result_trees{'macro_in_accent'};
$result_trees{'macro_in_accent'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[3];
$result_trees{'macro_in_accent'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[3];
$result_trees{'macro_in_accent'}{'contents'}[3]{'parent'} = $result_trees{'macro_in_accent'};
$result_trees{'macro_in_accent'}{'contents'}[4]{'extra'}{'command'} = $result_trees{'macro_in_accent'}{'contents'}[3];
$result_trees{'macro_in_accent'}{'contents'}[4]{'parent'} = $result_trees{'macro_in_accent'};
$result_trees{'macro_in_accent'}{'contents'}[5]{'parent'} = $result_trees{'macro_in_accent'};
$result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[0];
$result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[6];
$result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[6];
$result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[2];
$result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[6];
$result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[6];
$result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[4];
$result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[4]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[6];
$result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[5]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[6];
$result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[6]{'args'}[0];
$result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[6];
$result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[6]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[6];
$result_trees{'macro_in_accent'}{'contents'}[6]{'contents'}[7]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[6];
$result_trees{'macro_in_accent'}{'contents'}[6]{'parent'} = $result_trees{'macro_in_accent'};
$result_trees{'macro_in_accent'}{'contents'}[7]{'parent'} = $result_trees{'macro_in_accent'};
$result_trees{'macro_in_accent'}{'contents'}[8]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[8]{'contents'}[0];
$result_trees{'macro_in_accent'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[8];
$result_trees{'macro_in_accent'}{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'macro_in_accent'}{'contents'}[8];
$result_trees{'macro_in_accent'}{'contents'}[8]{'parent'} = $result_trees{'macro_in_accent'};

$result_texis{'macro_in_accent'} = '@macro a-letter
a
@end macro

@macro space
  
@end macro

@ringaccent a.
@ringaccenta.
@~a.
@~{a}.

@ringaccent  a.
';


$result_texts{'macro_in_accent'} = '

a*.
a*.
a~.
a~.

a*.
';

$result_errors{'macro_in_accent'} = [];


1;
