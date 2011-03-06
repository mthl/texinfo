use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'space_in_footnote'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in footnote.'
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
            'line_nr' => 1,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0];
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1];
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0];
$result_trees{'space_in_footnote'}{'contents'}[0]{'parent'} = $result_trees{'space_in_footnote'};

$result_texis{'space_in_footnote'} = 'text@footnote{ in footnote.}';


$result_texts{'space_in_footnote'} = 'text';

$result_errors{'space_in_footnote'} = [];



$result_converted{'plaintext'}->{'space_in_footnote'} = 'text(1)

   ---------- Footnotes ----------

   (1) in footnote.

';

1;
