use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'format_on_first_footnote_line'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Texte'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'cmdname' => 'quotation',
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in quotation on the first footnote line
'
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
                              'extra' => {
                                'command' => {}
                              },
                              'parent' => {},
                              'text' => ' ',
                              'type' => 'empty_spaces_after_command'
                            },
                            {
                              'parent' => {},
                              'text' => 'quotation'
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
                        'command_argument' => 'quotation',
                        'text_arg' => 'quotation'
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
                    'end_command' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 1,
                    'macro' => ''
                  },
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'footnote',
          'contents' => [],
          'line_nr' => {},
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'Last text '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'cmdname' => 'example',
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in example
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
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
                              'text' => 'example'
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
                        'command_argument' => 'example',
                        'text_arg' => 'example'
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
                    'line_nr' => 6,
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
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'footnote',
          'contents' => [],
          'line_nr' => {},
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'line_nr'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'};
$result_trees{'format_on_first_footnote_line'}{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'};
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'line_nr'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'};

$result_texis{'format_on_first_footnote_line'} = 'Texte@footnote{@quotation
in quotation on the first footnote line
@end quotation
}.

Last text @footnote{@example
in example
@end example

}
';


$result_texts{'format_on_first_footnote_line'} = 'Texte.

Last text 
';

$result_errors{'format_on_first_footnote_line'} = [];



$result_converted{'plaintext'}->{'format_on_first_footnote_line'} = 'Texte(1).

   Last text (2)

   ---------- Footnotes ----------

   (1) in quotation on the first footnote line

   (2) in example

';

1;
