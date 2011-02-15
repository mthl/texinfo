use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

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
                    }
                  ],
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
                    'line_nr' => 5,
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
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'line_nr'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'};
$result_trees{'format_on_first_footnote_line'}{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'};
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'line_nr'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'};

$result_texis{'format_on_first_footnote_line'} = 'Texte@footnote{@quotation
in quotation on the first footnote line
@end quotation}.

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
