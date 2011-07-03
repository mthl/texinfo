use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements);

use utf8;

$result_trees{'indent_in_quotation'} = {
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
          'cmdname' => 'indent',
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          },
          'parent' => {}
        },
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
              'text' => 'indent in quotation
'
            }
          ],
          'extra' => {
            'indent' => 1
          },
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
            'line_nr' => 4,
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
  'type' => 'text_root'
};
$result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'indent_in_quotation'}{'contents'}[0];
$result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'indent_in_quotation'}{'contents'}[0];
$result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'indent_in_quotation'}{'contents'}[0];
$result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[1];
$result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'indent_in_quotation'}{'contents'}[0];
$result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[3];
$result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'indent_in_quotation'}{'contents'}[0];
$result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[4];
$result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[4];
$result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[4]{'extra'}{'command'} = $result_trees{'indent_in_quotation'}{'contents'}[0];
$result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'indent_in_quotation'}{'contents'}[0];
$result_trees{'indent_in_quotation'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'indent_in_quotation'}{'contents'}[0]{'contents'}[4];
$result_trees{'indent_in_quotation'}{'contents'}[0]{'parent'} = $result_trees{'indent_in_quotation'};

$result_texis{'indent_in_quotation'} = '@quotation
@indent
indent in quotation
@end quotation
';


$result_texts{'indent_in_quotation'} = 'indent in quotation
';

$result_errors{'indent_in_quotation'} = [];



$result_converted{'plaintext'}->{'indent_in_quotation'} = '     indent in quotation
';

1;
