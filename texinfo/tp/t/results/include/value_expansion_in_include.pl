use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'value_expansion_in_include'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'testvar',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'incl-incl.txi',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' testvar incl-incl.txi
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
          'text' => ' test - in the variable name, and concatenation of text after.
',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'c',
      'parent' => {}
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'test-var',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'incl-incl.tx',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' test-var incl-incl.tx
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
          'text' => ' test - in the variable name, and concatenation of text before and after.
',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'c',
      'parent' => {}
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'test_var',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'ncl-incl.tx',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' test_var ncl-incl.tx
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'testvar include: This is the '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'included'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'emph',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0
        },
        {
          'parent' => {},
          'text' => ' file (include-value2.txi).
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
          'text' => 'testvar verbatiminclude: '
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
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
              'text' => 'incl-incl.txi
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'verbatiminclude',
      'parent' => {}
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
          'text' => 'test-var include: This is the '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'included'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'emph',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0
        },
        {
          'parent' => {},
          'text' => ' file (include-value2.txi).
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
          'text' => 'test-var verbatiminclude: '
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
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
              'text' => 'incl-incl.txi
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'verbatiminclude',
      'parent' => {}
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
          'text' => 'test_var include: This is the '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'included'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'emph',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0
        },
        {
          'parent' => {},
          'text' => ' file (include-value2.txi).
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
          'text' => 'test_var verbatiminclude: '
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
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
              'text' => 'incl-incl.txi
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
$result_trees{'value_expansion_in_include'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[0];
$result_trees{'value_expansion_in_include'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[0];
$result_trees{'value_expansion_in_include'}{'contents'}[0]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[1]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[2];
$result_trees{'value_expansion_in_include'}{'contents'}[2]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[3];
$result_trees{'value_expansion_in_include'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[3];
$result_trees{'value_expansion_in_include'}{'contents'}[3]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[4]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[5];
$result_trees{'value_expansion_in_include'}{'contents'}[5]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[6];
$result_trees{'value_expansion_in_include'}{'contents'}[6]{'args'}[1]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[6];
$result_trees{'value_expansion_in_include'}{'contents'}[6]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[7]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[8]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[9]{'args'}[0];
$result_trees{'value_expansion_in_include'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[9]{'args'}[0];
$result_trees{'value_expansion_in_include'}{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[9];
$result_trees{'value_expansion_in_include'}{'contents'}[9]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[10]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[11];
$result_trees{'value_expansion_in_include'}{'contents'}[11]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[11]{'contents'}[1]{'args'}[0];
$result_trees{'value_expansion_in_include'}{'contents'}[11]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[11]{'contents'}[1];
$result_trees{'value_expansion_in_include'}{'contents'}[11]{'contents'}[1]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[11];
$result_trees{'value_expansion_in_include'}{'contents'}[11]{'contents'}[2]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[11];
$result_trees{'value_expansion_in_include'}{'contents'}[11]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[12]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[13];
$result_trees{'value_expansion_in_include'}{'contents'}[13]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[14]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[14]{'args'}[0];
$result_trees{'value_expansion_in_include'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[14]{'args'}[0];
$result_trees{'value_expansion_in_include'}{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[14];
$result_trees{'value_expansion_in_include'}{'contents'}[14]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[15]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[16]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[17]{'contents'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[17];
$result_trees{'value_expansion_in_include'}{'contents'}[17]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[17]{'contents'}[1]{'args'}[0];
$result_trees{'value_expansion_in_include'}{'contents'}[17]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[17]{'contents'}[1];
$result_trees{'value_expansion_in_include'}{'contents'}[17]{'contents'}[1]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[17];
$result_trees{'value_expansion_in_include'}{'contents'}[17]{'contents'}[2]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[17];
$result_trees{'value_expansion_in_include'}{'contents'}[17]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[18]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[19]{'contents'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[19];
$result_trees{'value_expansion_in_include'}{'contents'}[19]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[20]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[20]{'args'}[0];
$result_trees{'value_expansion_in_include'}{'contents'}[20]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[20]{'args'}[0];
$result_trees{'value_expansion_in_include'}{'contents'}[20]{'args'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[20];
$result_trees{'value_expansion_in_include'}{'contents'}[20]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[21]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[22]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[23]{'contents'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[23];
$result_trees{'value_expansion_in_include'}{'contents'}[23]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[23]{'contents'}[1]{'args'}[0];
$result_trees{'value_expansion_in_include'}{'contents'}[23]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[23]{'contents'}[1];
$result_trees{'value_expansion_in_include'}{'contents'}[23]{'contents'}[1]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[23];
$result_trees{'value_expansion_in_include'}{'contents'}[23]{'contents'}[2]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[23];
$result_trees{'value_expansion_in_include'}{'contents'}[23]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[24]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[25]{'contents'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[25];
$result_trees{'value_expansion_in_include'}{'contents'}[25]{'parent'} = $result_trees{'value_expansion_in_include'};
$result_trees{'value_expansion_in_include'}{'contents'}[26]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[26]{'args'}[0];
$result_trees{'value_expansion_in_include'}{'contents'}[26]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[26]{'args'}[0];
$result_trees{'value_expansion_in_include'}{'contents'}[26]{'args'}[0]{'parent'} = $result_trees{'value_expansion_in_include'}{'contents'}[26];
$result_trees{'value_expansion_in_include'}{'contents'}[26]{'parent'} = $result_trees{'value_expansion_in_include'};

$result_texis{'value_expansion_in_include'} = '@set testvar incl-incl.txi

@c test - in the variable name, and concatenation of text after.
@set test-var incl-incl.tx

@c test - in the variable name, and concatenation of text before and after.
@set test_var ncl-incl.tx


@node Top

testvar include: This is the @emph{included} file (include-value2.txi).

testvar verbatiminclude: @verbatiminclude incl-incl.txi


test-var include: This is the @emph{included} file (include-value2.txi).

test-var verbatiminclude: @verbatiminclude incl-incl.txi


test_var include: This is the @emph{included} file (include-value2.txi).

test_var verbatiminclude: @verbatiminclude incl-incl.txi
';


$result_texts{'value_expansion_in_include'} = '




testvar include: This is the included file (include-value2.txi).

testvar verbatiminclude: 

test-var include: This is the included file (include-value2.txi).

test-var verbatiminclude: 

test_var include: This is the included file (include-value2.txi).

test_var verbatiminclude: ';

$result_errors{'value_expansion_in_include'} = [];


