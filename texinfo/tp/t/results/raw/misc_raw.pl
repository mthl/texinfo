use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'misc_raw'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'html',
      'contents' => [
        {
          'parent' => {},
          'text' => ' 
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'in html ',
          'type' => 'raw'
        }
      ],
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'tex',
      'contents' => [
        {
          'parent' => {},
          'text' => ' ',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'in tex
',
          'type' => 'raw'
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
    },
    {
      'cmdname' => 'verbatim',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'in verbatim
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => 'in verbatim2
',
          'type' => 'raw'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 8,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'misc_raw'}{'contents'}[0]{'parent'} = $result_trees{'misc_raw'};
$result_trees{'misc_raw'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'misc_raw'}{'contents'}[1];
$result_trees{'misc_raw'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'misc_raw'}{'contents'}[1];
$result_trees{'misc_raw'}{'contents'}[1]{'parent'} = $result_trees{'misc_raw'};
$result_trees{'misc_raw'}{'contents'}[2]{'parent'} = $result_trees{'misc_raw'};
$result_trees{'misc_raw'}{'contents'}[3]{'parent'} = $result_trees{'misc_raw'};
$result_trees{'misc_raw'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'misc_raw'}{'contents'}[4];
$result_trees{'misc_raw'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'misc_raw'}{'contents'}[4];
$result_trees{'misc_raw'}{'contents'}[4]{'parent'} = $result_trees{'misc_raw'};
$result_trees{'misc_raw'}{'contents'}[5]{'parent'} = $result_trees{'misc_raw'};
$result_trees{'misc_raw'}{'contents'}[6]{'parent'} = $result_trees{'misc_raw'};
$result_trees{'misc_raw'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'misc_raw'}{'contents'}[7];
$result_trees{'misc_raw'}{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'misc_raw'}{'contents'}[7];
$result_trees{'misc_raw'}{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'misc_raw'}{'contents'}[7];
$result_trees{'misc_raw'}{'contents'}[7]{'parent'} = $result_trees{'misc_raw'};
$result_trees{'misc_raw'}{'contents'}[8]{'parent'} = $result_trees{'misc_raw'};

$result_texis{'misc_raw'} = '
@html 
in html @end html

@tex in tex
@end tex

@verbatim
in verbatim
in verbatim2
@end verbatim
';


$result_texts{'misc_raw'} = '


in verbatim
in verbatim2
';

$result_errors{'misc_raw'} = [];



$result_converted{'plaintext'}->{'misc_raw'} = '
in verbatim
in verbatim2
';

1;
