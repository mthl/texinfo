use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'anchor_in_copying'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'copying',
          'contents' => [
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
                  'text' => 'Copying.
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'Copying information'
                        }
                      ],
                      'extra' => {
                        'region' => {}
                      },
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'anchor',
                  'contents' => [],
                  'extra' => {
                    'brace_command_contents' => [
                      [
                        {}
                      ]
                    ],
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'Copying-information'
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 5,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'text' => '
',
                  'type' => 'empty_spaces_after_close_brace'
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
                      'text' => 'copying'
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
                'command_argument' => 'copying',
                'text_arg' => 'copying'
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
            'end_command' => {}
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
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
          'cmdname' => 'insertcopying',
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
          'cmdname' => 'insertcopying',
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
        'line_nr' => 9,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[2];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[0]{'extra'}{'region'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[2];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[4];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'extra'}{'command'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[4];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'};
$result_trees{'anchor_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'anchor_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'anchor_in_copying'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'anchor_in_copying'}{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying'};

$result_texis{'anchor_in_copying'} = '
@copying

Copying.
@anchor{Copying information}

@end copying

@node Top

@insertcopying

@insertcopying

';


$result_texts{'anchor_in_copying'} = '






';

$result_sectioning{'anchor_in_copying'} = {};

$result_nodes{'anchor_in_copying'} = {
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

$result_menus{'anchor_in_copying'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'anchor_in_copying'} = [];



$result_converted{'info'}->{'anchor_in_copying'} = 'This is , produced by makeinfo version 4.13 from .

Copying.


File: ,  Node: Top,  Up: (dir)

Copying.

   Copying.



Tag Table:
Node: Top62
Ref: Copying information104

End Tag Table
';

$result_converted_errors{'info'}->{'anchor_in_copying'} = [
  {
    'file_name' => '',
    'error_line' => ':5: @anchor `Copying information\' output more than once
',
    'text' => '@anchor `Copying information\' output more than once',
    'type' => 'error',
    'macro' => '',
    'line_nr' => 5
  }
];


1;
