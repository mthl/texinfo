use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'also_not_line'} = {
  'contents' => [
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
          'text' => 'page '
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'page',
      'parent' => {}
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'noindent '
        },
        {
          'cmdname' => 'noindent',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' ',
          'type' => 'empty_spaces_after_command'
        },
        {
          'parent' => {},
          'text' => 'refill '
        },
        {
          'cmdname' => 'refill',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' something
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
      'cmdname' => 'noindent',
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '     ',
      'type' => 'empty_spaces_after_command'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'noindent at beginning of line
'
        },
        {
          'cmdname' => 'noindent',
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
          'text' => 'noindent on the preceding line
'
        },
        {
          'parent' => {},
          'text' => '  '
        },
        {
          'cmdname' => 'noindent',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '    ',
          'type' => 'empty_spaces_after_command'
        },
        {
          'parent' => {},
          'text' => 'noindent after space at beginning of line
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'page',
      'parent' => {}
    },
    {
      'cmdname' => 'page',
      'parent' => {}
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'After page on its own line.
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
          'text' => 'page '
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'page',
      'parent' => {}
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'noindent '
        },
        {
          'cmdname' => 'noindent',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '    ',
          'type' => 'empty_spaces_after_command'
        },
        {
          'parent' => {},
          'text' => 'refill '
        },
        {
          'cmdname' => 'refill',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' 
'
        },
        {
          'parent' => {},
          'text' => 'novalidate '
        },
        {
          'cmdname' => 'novalidate',
          'parent' => {}
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
              'text' => 'special
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'subheading',
      'parent' => {}
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
          'text' => 'Only valid between iftex:
'
        },
        {
          'parent' => {},
          'text' => 'vskip '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' 
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'vskip',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'cropmarks '
        },
        {
          'cmdname' => 'cropmarks',
          'parent' => {}
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
          'text' => 'exdent '
        },
        {
          'cmdname' => 'exdent',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' ',
          'type' => 'empty_spaces_after_command'
        },
        {
          'parent' => {},
          'text' => 'line after exdent
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'also_not_line'}{'contents'}[0]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[1]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'also_not_line'}{'contents'}[2];
$result_trees{'also_not_line'}{'contents'}[2]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[3]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'also_not_line'}{'contents'}[4];
$result_trees{'also_not_line'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'also_not_line'}{'contents'}[4];
$result_trees{'also_not_line'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'also_not_line'}{'contents'}[4];
$result_trees{'also_not_line'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'also_not_line'}{'contents'}[4];
$result_trees{'also_not_line'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'also_not_line'}{'contents'}[4];
$result_trees{'also_not_line'}{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'also_not_line'}{'contents'}[4];
$result_trees{'also_not_line'}{'contents'}[4]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[5]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[6]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[7]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'also_not_line'}{'contents'}[8];
$result_trees{'also_not_line'}{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'also_not_line'}{'contents'}[8];
$result_trees{'also_not_line'}{'contents'}[8]{'contents'}[2]{'parent'} = $result_trees{'also_not_line'}{'contents'}[8];
$result_trees{'also_not_line'}{'contents'}[8]{'contents'}[3]{'parent'} = $result_trees{'also_not_line'}{'contents'}[8];
$result_trees{'also_not_line'}{'contents'}[8]{'contents'}[4]{'parent'} = $result_trees{'also_not_line'}{'contents'}[8];
$result_trees{'also_not_line'}{'contents'}[8]{'contents'}[5]{'parent'} = $result_trees{'also_not_line'}{'contents'}[8];
$result_trees{'also_not_line'}{'contents'}[8]{'contents'}[6]{'parent'} = $result_trees{'also_not_line'}{'contents'}[8];
$result_trees{'also_not_line'}{'contents'}[8]{'contents'}[7]{'parent'} = $result_trees{'also_not_line'}{'contents'}[8];
$result_trees{'also_not_line'}{'contents'}[8]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[9]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[10]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'also_not_line'}{'contents'}[11];
$result_trees{'also_not_line'}{'contents'}[11]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[12]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'also_not_line'}{'contents'}[13];
$result_trees{'also_not_line'}{'contents'}[13]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[14]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'also_not_line'}{'contents'}[15];
$result_trees{'also_not_line'}{'contents'}[15]{'contents'}[1]{'parent'} = $result_trees{'also_not_line'}{'contents'}[15];
$result_trees{'also_not_line'}{'contents'}[15]{'contents'}[2]{'parent'} = $result_trees{'also_not_line'}{'contents'}[15];
$result_trees{'also_not_line'}{'contents'}[15]{'contents'}[3]{'parent'} = $result_trees{'also_not_line'}{'contents'}[15];
$result_trees{'also_not_line'}{'contents'}[15]{'contents'}[4]{'parent'} = $result_trees{'also_not_line'}{'contents'}[15];
$result_trees{'also_not_line'}{'contents'}[15]{'contents'}[5]{'parent'} = $result_trees{'also_not_line'}{'contents'}[15];
$result_trees{'also_not_line'}{'contents'}[15]{'contents'}[6]{'parent'} = $result_trees{'also_not_line'}{'contents'}[15];
$result_trees{'also_not_line'}{'contents'}[15]{'contents'}[7]{'parent'} = $result_trees{'also_not_line'}{'contents'}[15];
$result_trees{'also_not_line'}{'contents'}[15]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[16]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[17]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'also_not_line'}{'contents'}[17]{'args'}[0];
$result_trees{'also_not_line'}{'contents'}[17]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'also_not_line'}{'contents'}[17]{'args'}[0];
$result_trees{'also_not_line'}{'contents'}[17]{'args'}[0]{'parent'} = $result_trees{'also_not_line'}{'contents'}[17];
$result_trees{'also_not_line'}{'contents'}[17]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[18]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[19]{'contents'}[0]{'parent'} = $result_trees{'also_not_line'}{'contents'}[19];
$result_trees{'also_not_line'}{'contents'}[19]{'contents'}[1]{'parent'} = $result_trees{'also_not_line'}{'contents'}[19];
$result_trees{'also_not_line'}{'contents'}[19]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'also_not_line'}{'contents'}[19]{'contents'}[2];
$result_trees{'also_not_line'}{'contents'}[19]{'contents'}[2]{'parent'} = $result_trees{'also_not_line'}{'contents'}[19];
$result_trees{'also_not_line'}{'contents'}[19]{'contents'}[3]{'parent'} = $result_trees{'also_not_line'}{'contents'}[19];
$result_trees{'also_not_line'}{'contents'}[19]{'contents'}[4]{'parent'} = $result_trees{'also_not_line'}{'contents'}[19];
$result_trees{'also_not_line'}{'contents'}[19]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[20]{'parent'} = $result_trees{'also_not_line'};
$result_trees{'also_not_line'}{'contents'}[21]{'contents'}[0]{'parent'} = $result_trees{'also_not_line'}{'contents'}[21];
$result_trees{'also_not_line'}{'contents'}[21]{'contents'}[1]{'parent'} = $result_trees{'also_not_line'}{'contents'}[21];
$result_trees{'also_not_line'}{'contents'}[21]{'contents'}[2]{'parent'} = $result_trees{'also_not_line'}{'contents'}[21];
$result_trees{'also_not_line'}{'contents'}[21]{'contents'}[3]{'parent'} = $result_trees{'also_not_line'}{'contents'}[21];
$result_trees{'also_not_line'}{'contents'}[21]{'parent'} = $result_trees{'also_not_line'};

$result_texis{'also_not_line'} = '

page @page
noindent @noindent refill @refill something

@noindent     noindent at beginning of line
@noindent  
noindent on the preceding line
  @noindent    noindent after space at beginning of line
@page
@page
After page on its own line.

page @page
noindent @noindent    refill @refill 
novalidate @novalidate

@subheading special

Only valid between iftex:
vskip @vskip 
cropmarks @cropmarks

exdent @exdent line after exdent
';


$result_texts{'also_not_line'} = '

page noindent refill  something

noindent at beginning of line
noindent on the preceding line
  noindent after space at beginning of line
After page on its own line.

page noindent refill  
novalidate 
special

Only valid between iftex:
vskip cropmarks 
exdent line after exdent
';

$result_errors{'also_not_line'} = [
  {
    'error_line' => ':3: warning: @page should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@page should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':14: warning: @page should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 14,
    'macro' => '',
    'text' => '@page should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':16: warning: @novalidate should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 16,
    'macro' => '',
    'text' => '@novalidate should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':22: warning: @cropmarks should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 22,
    'macro' => '',
    'text' => '@cropmarks should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':24: warning: @exdent should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 24,
    'macro' => '',
    'text' => '@exdent should only appear at a line beginning',
    'type' => 'warning'
  }
];


