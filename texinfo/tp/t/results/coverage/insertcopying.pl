use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'insertcopying'} = {
  'contents' => [
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'License.
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
                  'text' => 'You are not allowed.
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        }
      ],
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'License:
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
      'cmdname' => 'insertcopying',
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'insertcopying'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'insertcopying'}{'contents'}[0];
$result_trees{'insertcopying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'insertcopying'}{'contents'}[0]{'contents'}[1];
$result_trees{'insertcopying'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'insertcopying'}{'contents'}[0];
$result_trees{'insertcopying'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'insertcopying'}{'contents'}[0];
$result_trees{'insertcopying'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'insertcopying'}{'contents'}[0]{'contents'}[3];
$result_trees{'insertcopying'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'insertcopying'}{'contents'}[0]{'contents'}[3]{'contents'}[1];
$result_trees{'insertcopying'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'insertcopying'}{'contents'}[0]{'contents'}[3];
$result_trees{'insertcopying'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'insertcopying'}{'contents'}[0];
$result_trees{'insertcopying'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'insertcopying'}{'contents'}[0];
$result_trees{'insertcopying'}{'contents'}[0]{'parent'} = $result_trees{'insertcopying'};
$result_trees{'insertcopying'}{'contents'}[1]{'parent'} = $result_trees{'insertcopying'};
$result_trees{'insertcopying'}{'contents'}[2]{'parent'} = $result_trees{'insertcopying'};
$result_trees{'insertcopying'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'insertcopying'}{'contents'}[3];
$result_trees{'insertcopying'}{'contents'}[3]{'parent'} = $result_trees{'insertcopying'};
$result_trees{'insertcopying'}{'contents'}[4]{'parent'} = $result_trees{'insertcopying'};
$result_trees{'insertcopying'}{'contents'}[5]{'parent'} = $result_trees{'insertcopying'};
$result_trees{'insertcopying'}{'contents'}[6]{'parent'} = $result_trees{'insertcopying'};

$result_texis{'insertcopying'} = '@copying
License.

@quotation 
You are not allowed.
@end quotation
@end copying

License:

@insertcopying
';


$result_texts{'insertcopying'} = '
License:


';

$result_errors{'insertcopying'} = [];



$result_converted{'plaintext'}->{'insertcopying'} = '
License:

   License.

     You are not allowed.
';

1;
