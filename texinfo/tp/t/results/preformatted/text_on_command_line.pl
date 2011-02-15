use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'text_on_command_line'} = {
  'contents' => [
    {
      'cmdname' => 'example',
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'text on line
'
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
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
      'cmdname' => 'example',
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'text on line followed by text
'
            },
            {
              'parent' => {},
              'text' => 'normal text
'
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 4,
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
      'cmdname' => 'example',
      'contents' => [
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
              'text' => 'in example
'
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 8,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => ' ',
      'type' => 'empty_spaces_after_command'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text after end
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
      'cmdname' => 'example',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'cmdname' => 'example',
          'contents' => [
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 13,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'text after end example nested in example
'
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 12,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[0];
$result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[0];
$result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[0];
$result_trees{'text_on_command_line'}{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[2]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[3]{'contents'}[0];
$result_trees{'text_on_command_line'}{'contents'}[3]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[3]{'contents'}[0];
$result_trees{'text_on_command_line'}{'contents'}[3]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[3]{'contents'}[0];
$result_trees{'text_on_command_line'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[3];
$result_trees{'text_on_command_line'}{'contents'}[3]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[4]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[5]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6];
$result_trees{'text_on_command_line'}{'contents'}[6]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[7]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[8];
$result_trees{'text_on_command_line'}{'contents'}[8]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[9]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[10];
$result_trees{'text_on_command_line'}{'contents'}[10]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[10]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[10];
$result_trees{'text_on_command_line'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[10]{'contents'}[2];
$result_trees{'text_on_command_line'}{'contents'}[10]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[10]{'contents'}[2];
$result_trees{'text_on_command_line'}{'contents'}[10]{'contents'}[2]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[10];
$result_trees{'text_on_command_line'}{'contents'}[10]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[11]{'parent'} = $result_trees{'text_on_command_line'};

$result_texis{'text_on_command_line'} = '@example text on line
@end example

@example text on line followed by text
normal text
@end example

@example
in example
@end example text after end

@example
@example
@end example text after end example nested in example
@end example
';


$result_texts{'text_on_command_line'} = 'text on line

text on line followed by text
normal text

in example
text after end

text after end example nested in example
';

$result_errors{'text_on_command_line'} = [];



$result_converted{'plaintext'}->{'text_on_command_line'} = '     text on line

     text on line followed by text
     normal text

     in example
   text after end

     text after end example nested in example
';

1;
