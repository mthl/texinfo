use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'macro_in_early_commands'} = {
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
          'text' => 'macro_in_pass
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' begin-file
',
        'macrobody' => 'macro_in_pass
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
      'args' => [
        {
          'parent' => {},
          'text' => 'end-file-name',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'ext',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'texi_commands.\\ext\\
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' end-file-name {ext}
',
        'args_index' => {
          'ext' => 0
        },
        'macrobody' => 'texi_commands.\\ext\\
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
              'text' => 'macro_in_passtexi_commands.info'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'setfilename',
      'parent' => {},
      'special' => {
        'text_arg' => 'macro_in_passtexi_commands.info'
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
          'text' => 'latin1',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'ISO-8859-1
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' latin1 
',
        'macrobody' => 'ISO-8859-1
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
          'text' => 'documentencoding-command',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@documentencoding
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' documentencoding-command
',
        'macrobody' => '@documentencoding
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
              'parent' => {},
              'text' => '
',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'documentencoding',
      'parent' => {},
      'special' => {
        'text_arg' => 'ISO-8859-1'
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
          'text' => '@include inc_file.texi
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' multiinclude
',
        'macrobody' => 'macro_included.texi
@include inc_file.texi
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
              'text' => 'Top'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'spaces_at_end'
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
              'text' => 'top'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'spaces_at_end'
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'macro_in_pass_texi_commands'
        },
        {
          'cmdname' => '{',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'info'
        },
        {
          'cmdname' => '}',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        },
        {
          'parent' => {},
          'text' => 'texi_commands.info
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'macro_in_early_commands'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[0];
$result_trees{'macro_in_early_commands'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[0];
$result_trees{'macro_in_early_commands'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[2];
$result_trees{'macro_in_early_commands'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[2];
$result_trees{'macro_in_early_commands'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[2];
$result_trees{'macro_in_early_commands'}{'contents'}[2]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[3]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[4]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[5]{'args'}[0];
$result_trees{'macro_in_early_commands'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[5]{'args'}[0];
$result_trees{'macro_in_early_commands'}{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[5]{'args'}[0];
$result_trees{'macro_in_early_commands'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[5];
$result_trees{'macro_in_early_commands'}{'contents'}[5]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[6]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[7];
$result_trees{'macro_in_early_commands'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[7];
$result_trees{'macro_in_early_commands'}{'contents'}[7]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[8]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[9]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[10];
$result_trees{'macro_in_early_commands'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[10];
$result_trees{'macro_in_early_commands'}{'contents'}[10]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[11]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[12]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[13]{'args'}[0];
$result_trees{'macro_in_early_commands'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[13]{'args'}[0];
$result_trees{'macro_in_early_commands'}{'contents'}[13]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[13]{'args'}[0];
$result_trees{'macro_in_early_commands'}{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[13];
$result_trees{'macro_in_early_commands'}{'contents'}[13]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[14]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[15];
$result_trees{'macro_in_early_commands'}{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[15];
$result_trees{'macro_in_early_commands'}{'contents'}[15]{'contents'}[1]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[15];
$result_trees{'macro_in_early_commands'}{'contents'}[15]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[16]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[17]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[18]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[18]{'args'}[0];
$result_trees{'macro_in_early_commands'}{'contents'}[18]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[18]{'args'}[0];
$result_trees{'macro_in_early_commands'}{'contents'}[18]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[18]{'args'}[0];
$result_trees{'macro_in_early_commands'}{'contents'}[18]{'args'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[18];
$result_trees{'macro_in_early_commands'}{'contents'}[18]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[19]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[19]{'args'}[0];
$result_trees{'macro_in_early_commands'}{'contents'}[19]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[19]{'args'}[0];
$result_trees{'macro_in_early_commands'}{'contents'}[19]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[19]{'args'}[0];
$result_trees{'macro_in_early_commands'}{'contents'}[19]{'args'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[19];
$result_trees{'macro_in_early_commands'}{'contents'}[19]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[20]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[21]{'args'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[21];
$result_trees{'macro_in_early_commands'}{'contents'}[21]{'contents'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[21];
$result_trees{'macro_in_early_commands'}{'contents'}[21]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[22]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[23]{'contents'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[23];
$result_trees{'macro_in_early_commands'}{'contents'}[23]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[24]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[25]{'contents'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[25];
$result_trees{'macro_in_early_commands'}{'contents'}[25]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[26]{'parent'} = $result_trees{'macro_in_early_commands'};
$result_trees{'macro_in_early_commands'}{'contents'}[27]{'contents'}[0]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[27];
$result_trees{'macro_in_early_commands'}{'contents'}[27]{'contents'}[1]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[27];
$result_trees{'macro_in_early_commands'}{'contents'}[27]{'contents'}[2]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[27];
$result_trees{'macro_in_early_commands'}{'contents'}[27]{'contents'}[3]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[27];
$result_trees{'macro_in_early_commands'}{'contents'}[27]{'contents'}[4]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[27];
$result_trees{'macro_in_early_commands'}{'contents'}[27]{'contents'}[5]{'parent'} = $result_trees{'macro_in_early_commands'}{'contents'}[27];
$result_trees{'macro_in_early_commands'}{'contents'}[27]{'parent'} = $result_trees{'macro_in_early_commands'};

$result_texis{'macro_in_early_commands'} = '@macro begin-file
macro_in_pass
@end macro
@macro end-file-name {ext}
texi_commands.\\ext\\
@end macro

@setfilename macro_in_passtexi_commands.info

@macro latin1 
ISO-8859-1
@end macro

@macro documentencoding-command
@documentencoding
@end macro

@documentencoding ISO-8859-1

@macro multiinclude
macro_included.texi
@include inc_file.texi
@end macro

@node Top
@top top

@macro themacro
in themacro
@end macro
In included file.

in themacro

macro_in_pass_texi_commands@{info@}
texi_commands.info
';


$result_texts{'macro_in_early_commands'} = '





top

In included file.

in themacro

macro_in_pass_texi_commands{info}
texi_commands.info
';

$result_errors{'macro_in_early_commands'} = [
  {
    'error_line' => ':18: warning: @documentencoding-command defined with zero or more than one argument should be invoked with {}
',
    'file_name' => '',
    'line_nr' => 18,
    'macro' => '',
    'text' => '@documentencoding-command defined with zero or more than one argument should be invoked with {}',
    'type' => 'warning'
  },
  {
    'error_line' => ':28: warning: @multiinclude defined with zero or more than one argument should be invoked with {}
',
    'file_name' => '',
    'line_nr' => 28,
    'macro' => '',
    'text' => '@multiinclude defined with zero or more than one argument should be invoked with {}',
    'type' => 'warning'
  }
];


