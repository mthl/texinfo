use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'raw'} = {
  'contents' => [
    {
      'cmdname' => 'tex',
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
          'text' => 'in <tex>',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'last_raw_newline'
        }
      ],
      'extra' => {},
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Para
'
        },
        {
          'cmdname' => 'xml',
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
              'text' => '<in>',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 6,
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
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'raw'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw'}{'contents'}[0];
$result_trees{'raw'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'raw'}{'contents'}[0];
$result_trees{'raw'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'raw'}{'contents'}[0];
$result_trees{'raw'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'raw'}{'contents'}[0];
$result_trees{'raw'}{'contents'}[0]{'parent'} = $result_trees{'raw'};
$result_trees{'raw'}{'contents'}[1]{'extra'}{'command'} = $result_trees{'raw'}{'contents'}[0];
$result_trees{'raw'}{'contents'}[1]{'parent'} = $result_trees{'raw'};
$result_trees{'raw'}{'contents'}[2]{'parent'} = $result_trees{'raw'};
$result_trees{'raw'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'raw'}{'contents'}[3];
$result_trees{'raw'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw'}{'contents'}[3]{'contents'}[1];
$result_trees{'raw'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw'}{'contents'}[3]{'contents'}[1];
$result_trees{'raw'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw'}{'contents'}[3]{'contents'}[1];
$result_trees{'raw'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'raw'}{'contents'}[3]{'contents'}[1];
$result_trees{'raw'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'raw'}{'contents'}[3];
$result_trees{'raw'}{'contents'}[3]{'contents'}[2]{'extra'}{'command'} = $result_trees{'raw'}{'contents'}[3]{'contents'}[1];
$result_trees{'raw'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'raw'}{'contents'}[3];
$result_trees{'raw'}{'contents'}[3]{'parent'} = $result_trees{'raw'};

$result_texis{'raw'} = '@tex
in <tex>
@end tex

Para
@xml
<in>
@end xml
';


$result_texts{'raw'} = '
Para
';

$result_errors{'raw'} = [];



$result_converted{'xml'}->{'raw'} = '<tex>
in &lt;tex&gt;
</tex>


<para>Para
<in>
</para>';

1;
