use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'image_text_lines_count'} = {
  'contents' => [
    {
      'contents' => [],
      'parent' => {},
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
      'contents' => [
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
                  'text' => 'count_image_text'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'image',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ]
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
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
                  'text' => 'index entry'
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
          'cmdname' => 'cindex',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'cindex',
              'index_name' => 'cp',
              'index_prefix' => 'c',
              'key' => 'index entry',
              'node' => {},
              'number' => 1
            },
            'misc_content' => []
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
            'macro' => ''
          },
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'cp'
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
          'cmdname' => 'printindex',
          'extra' => {
            'misc_args' => [
              'cp'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 7,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Top'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'image_text_lines_count'}{'contents'}[0]{'parent'} = $result_trees{'image_text_lines_count'};
$result_trees{'image_text_lines_count'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'args'}[0];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'args'}[0];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'args'}[0];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4]{'extra'}{'index_entry'}{'command'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4]{'extra'}{'index_entry'}{'node'} = $result_trees{'image_text_lines_count'}{'contents'}[1];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4]{'extra'}{'misc_content'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4]{'extra'}{'index_entry'}{'content'};
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[6]{'args'}[0];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[6]{'args'}[0];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[6]{'args'}[0];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[6];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'image_text_lines_count'}{'contents'}[1];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'image_text_lines_count'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'image_text_lines_count'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'image_text_lines_count'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'image_text_lines_count'}{'contents'}[1]{'parent'} = $result_trees{'image_text_lines_count'};

$result_texis{'image_text_lines_count'} = '@node Top

@image{count_image_text}

@cindex index entry

@printindex cp
';


$result_texts{'image_text_lines_count'} = '
count_image_text


';

$result_sectioning{'image_text_lines_count'} = {};

$result_nodes{'image_text_lines_count'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'node_up' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'dir'
        }
      ]
    }
  }
};

$result_menus{'image_text_lines_count'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'image_text_lines_count'} = [];



$result_converted{'info'}->{'image_text_lines_count'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)

aaaa
bbb
cc

ff


 [index ]
* Menu:

* index entry:                           Top.                  (line 10)



Tag Table:
Node: Top52

End Tag Table
';

1;
