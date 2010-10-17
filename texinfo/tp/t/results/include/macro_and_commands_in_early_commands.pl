use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'macro_and_commands_in_early_commands'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'begin-file',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'macro_i--n_pass@@
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' begin-file
',
        'macrobody' => 'macro_i--n_pass@@
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
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'macro_i--n_pass'
            },
            {
              'cmdname' => '@',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'texi_commands.info
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'setfilename',
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
          'text' => 'latin1',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'ISO-8859-1@@
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' latin1 
',
        'macrobody' => 'ISO-8859-1@@
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
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'ISO-8859-1'
            },
            {
              'cmdname' => '@',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'documentencoding',
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
          'text' => 'multiinclude',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'macro_included.texi
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '@include inc_@@f--ile.texi
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' multiinclude
',
        'macrobody' => 'macro_included.texi
@include inc_@@f--ile.texi
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
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'Top
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'node',
      'parent' => {},
      'remaining_args' => 4
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'top
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'top',
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
          'text' => 'themacro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in themacro
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' themacro
',
        'macrobody' => 'in themacro
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'In included file.
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
          'text' => 'in themacro
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
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'inc_'
            },
            {
              'cmdname' => '@',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'f--ile.texi
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'verbatiminclude',
      'parent' => {}
    }
  ]
};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[1]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[2]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[3]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[3];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[3]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[4]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[5];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[5];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[5]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[6]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[7]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[8]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[8]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[8]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[8]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[8]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[8];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[8]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[9]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[10];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[10];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[10];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[10]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[11]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[12]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[13]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[13]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[13];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[13]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[14]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[14]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[14]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[14];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[14]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[15]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[16]{'args'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[16];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[16]{'contents'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[16];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[16]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[17]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[18]{'contents'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[18];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[18]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[19]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[20]{'contents'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[20];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[20]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[21]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[22]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[22]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[22]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[22]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[22]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[22]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[22]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[22]{'args'}[0];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[22]{'args'}[0]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'}{'contents'}[22];
$result_trees{'macro_and_commands_in_early_commands'}{'contents'}[22]{'parent'} = $result_trees{'macro_and_commands_in_early_commands'};

$result_texis{'macro_and_commands_in_early_commands'} = '@macro begin-file
macro_i--n_pass@@
@end macro

@setfilename macro_i--n_pass@@texi_commands.info

@macro latin1 
ISO-8859-1@@
@end macro

@documentencoding ISO-8859-1@@

@macro multiinclude
macro_included.texi
@include inc_@@f--ile.texi
@end macro

@node Top
@top top

@macro themacro
in themacro
@end macro
In included file.

in themacro

@verbatiminclude inc_@@f--ile.texi
';


$result_texts{'macro_and_commands_in_early_commands'} = '




top

In included file.

in themacro

';

$result_errors{'macro_and_commands_in_early_commands'} = [
  {
    'error_line' => ':21: warning: @multiinclude defined with zero or more than one argument should be invoked with {}
',
    'file_name' => '',
    'line_nr' => 21,
    'macro' => '',
    'text' => '@multiinclude defined with zero or more than one argument should be invoked with {}',
    'type' => 'warning'
  }
];


