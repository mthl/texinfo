use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'value_node_directions'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'a--foo',
              'type' => 'misc_arg'
            },
            {
              'parent' => {},
              'text' => 'bar',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'set',
          'extra' => {
            'arg_line' => ' a--foo bar
'
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'type' => 'text_root'
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
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'bar'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => '(dir)'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => '(dir)'
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
      'contents' => [],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 3,
        'macro' => ''
      },
      'parent' => {}
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
              'text' => 'Var bar'
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
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'bar
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
              'text' => 'bar'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'BarFoo'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'Top'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => '(dir)'
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
      'contents' => [],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 7,
        'macro' => ''
      },
      'parent' => {}
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
              'text' => 'BarFoo'
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
      'cmdname' => 'chapter',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
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
              'text' => 'BarFoo'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'bar'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => '(dir)'
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
      'contents' => [],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 10,
        'macro' => ''
      },
      'parent' => {}
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
              'text' => 'bar'
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
      'cmdname' => 'chapter',
      'contents' => [],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 11,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'value_node_directions'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[0]{'contents'}[0];
$result_trees{'value_node_directions'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[0]{'contents'}[0];
$result_trees{'value_node_directions'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[0];
$result_trees{'value_node_directions'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[0];
$result_trees{'value_node_directions'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[1]{'args'}[0];
$result_trees{'value_node_directions'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[1]{'args'}[0];
$result_trees{'value_node_directions'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[1];
$result_trees{'value_node_directions'}{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[1]{'args'}[1];
$result_trees{'value_node_directions'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[1];
$result_trees{'value_node_directions'}{'contents'}[1]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[1]{'args'}[2];
$result_trees{'value_node_directions'}{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[1];
$result_trees{'value_node_directions'}{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[1]{'args'}[3];
$result_trees{'value_node_directions'}{'contents'}[1]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[1]{'args'}[3];
$result_trees{'value_node_directions'}{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[1];
$result_trees{'value_node_directions'}{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'};
$result_trees{'value_node_directions'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[2]{'args'}[0];
$result_trees{'value_node_directions'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[2]{'args'}[0];
$result_trees{'value_node_directions'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[2]{'args'}[0];
$result_trees{'value_node_directions'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[2];
$result_trees{'value_node_directions'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[2]{'contents'}[0];
$result_trees{'value_node_directions'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[2];
$result_trees{'value_node_directions'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[2];
$result_trees{'value_node_directions'}{'contents'}[2]{'parent'} = $result_trees{'value_node_directions'};
$result_trees{'value_node_directions'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[3]{'args'}[0];
$result_trees{'value_node_directions'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[3]{'args'}[0];
$result_trees{'value_node_directions'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[3];
$result_trees{'value_node_directions'}{'contents'}[3]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[3]{'args'}[1];
$result_trees{'value_node_directions'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[3];
$result_trees{'value_node_directions'}{'contents'}[3]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[3]{'args'}[2];
$result_trees{'value_node_directions'}{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[3];
$result_trees{'value_node_directions'}{'contents'}[3]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[3]{'args'}[3];
$result_trees{'value_node_directions'}{'contents'}[3]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[3]{'args'}[3];
$result_trees{'value_node_directions'}{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[3];
$result_trees{'value_node_directions'}{'contents'}[3]{'parent'} = $result_trees{'value_node_directions'};
$result_trees{'value_node_directions'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[4]{'args'}[0];
$result_trees{'value_node_directions'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[4]{'args'}[0];
$result_trees{'value_node_directions'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[4]{'args'}[0];
$result_trees{'value_node_directions'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[4];
$result_trees{'value_node_directions'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[4];
$result_trees{'value_node_directions'}{'contents'}[4]{'parent'} = $result_trees{'value_node_directions'};
$result_trees{'value_node_directions'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[5]{'args'}[0];
$result_trees{'value_node_directions'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[5]{'args'}[0];
$result_trees{'value_node_directions'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[5];
$result_trees{'value_node_directions'}{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[5];
$result_trees{'value_node_directions'}{'contents'}[5]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[5]{'args'}[2];
$result_trees{'value_node_directions'}{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[5];
$result_trees{'value_node_directions'}{'contents'}[5]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[5]{'args'}[3];
$result_trees{'value_node_directions'}{'contents'}[5]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[5]{'args'}[3];
$result_trees{'value_node_directions'}{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[5];
$result_trees{'value_node_directions'}{'contents'}[5]{'parent'} = $result_trees{'value_node_directions'};
$result_trees{'value_node_directions'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[6]{'args'}[0];
$result_trees{'value_node_directions'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[6]{'args'}[0];
$result_trees{'value_node_directions'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[6]{'args'}[0];
$result_trees{'value_node_directions'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'value_node_directions'}{'contents'}[6];
$result_trees{'value_node_directions'}{'contents'}[6]{'parent'} = $result_trees{'value_node_directions'};

$result_texis{'value_node_directions'} = '@set a--foo bar

@node Top, bar, (dir), (dir)
@top Var bar
bar

@node bar, BarFoo, Top, (dir)
@chapter BarFoo

@node BarFoo, , bar, (dir)
@chapter bar
';


$result_texts{'value_node_directions'} = '
Var bar
bar

BarFoo

bar
';

$result_errors{'value_node_directions'} = [];


$result_indices{'value_node_directions'} = undef;


1;
