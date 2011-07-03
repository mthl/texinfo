use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'anchor_in_copying_in_footnote'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'copying',
          'contents' => [
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
                  'parent' => {},
                  'text' => 'Copying'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '
',
                          'type' => 'empty_spaces_before_argument'
                        },
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'In footnote.
'
                            },
                            {
                              'args' => [
                                {
                                  'contents' => [
                                    {
                                      'parent' => {},
                                      'text' => 'Copying footnote'
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
                                'normalized' => 'Copying-footnote'
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
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_context'
                    }
                  ],
                  'cmdname' => 'footnote',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 3,
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
              'args' => [
                {
                  'contents' => [
                    {
                      'extra' => {
                        'command' => {}
                      },
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
                'line_nr' => 8,
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
            'line_nr' => 1,
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
              'extra' => {
                'command' => {}
              },
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
        'line_nr' => 10,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'extra'}{'region'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'extra'}{'command'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'};
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying_in_footnote'};

$result_texis{'anchor_in_copying_in_footnote'} = '@copying

Copying@footnote{
In footnote.
@anchor{Copying footnote}
}.

@end copying

@node Top

@insertcopying

@insertcopying

';


$result_texts{'anchor_in_copying_in_footnote'} = '





';

$result_sectioning{'anchor_in_copying_in_footnote'} = {};

$result_nodes{'anchor_in_copying_in_footnote'} = {
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

$result_menus{'anchor_in_copying_in_footnote'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'anchor_in_copying_in_footnote'} = [];



$result_converted{'info'}->{'anchor_in_copying_in_footnote'} = 'This is , produced by makeinfo version 4.13 from .

Copying(1).

   ---------- Footnotes ----------

   (1) In footnote.


File: ,  Node: Top,  Up: (dir)

Copying(1).

   Copying(2).

   ---------- Footnotes ----------

   (1) In footnote.

   (2) In footnote.



Tag Table:
Node: Top122
Ref: Top-Footnote-1221
Ref: Copying footnote240
Ref: Top-Footnote-2242

End Tag Table
';

$result_converted_errors{'info'}->{'anchor_in_copying_in_footnote'} = [
  {
    'file_name' => '',
    'error_line' => ':5: @anchor `Copying footnote\' output more than once
',
    'text' => '@anchor `Copying footnote\' output more than once',
    'type' => 'error',
    'macro' => '',
    'line_nr' => 5
  }
];


1;
