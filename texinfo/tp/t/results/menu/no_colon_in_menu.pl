use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'no_colon_in_menu'} = {
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
          'cmdname' => 'menu',
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '* a
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
              'parent' => {},
              'type' => 'menu_comment'
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
                      'text' => 'menu'
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
              'cmdname' => 'end',
              'extra' => {
                'command' => {},
                'command_argument' => 'menu',
                'text_arg' => 'menu'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'end_command' => {}
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
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
$result_trees{'no_colon_in_menu'}{'contents'}[0]{'parent'} = $result_trees{'no_colon_in_menu'};
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'args'}[0];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'args'}[0];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'args'}[0];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'no_colon_in_menu'}{'contents'}[1];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'no_colon_in_menu'}{'contents'}[1];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'no_colon_in_menu'}{'contents'}[1];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'no_colon_in_menu'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'no_colon_in_menu'}{'contents'}[1]{'parent'} = $result_trees{'no_colon_in_menu'};

$result_texis{'no_colon_in_menu'} = '@node Top

@menu
* a
@end menu
';


$result_texts{'no_colon_in_menu'} = '
* a
';

$result_sectioning{'no_colon_in_menu'} = {};

$result_nodes{'no_colon_in_menu'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menus' => [
    {
      'cmdname' => 'menu',
      'extra' => {
        'end_command' => {
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'menu',
            'text_arg' => 'menu'
          }
        }
      }
    }
  ],
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
$result_nodes{'no_colon_in_menu'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'no_colon_in_menu'}{'menus'}[0];

$result_menus{'no_colon_in_menu'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'no_colon_in_menu'} = [];



$result_converted{'plaintext'}->{'no_colon_in_menu'} = '
* Menu:

* a
';

1;
