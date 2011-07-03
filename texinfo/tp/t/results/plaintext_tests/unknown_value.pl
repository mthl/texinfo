use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements);

use utf8;

$result_trees{'unknown_value'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'value',
      'type' => 'unknown'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'unknown_value'}{'contents'}[0]{'parent'} = $result_trees{'unknown_value'};

$result_texis{'unknown_value'} = '@value{unknown}';


$result_texts{'unknown_value'} = '';

$result_errors{'unknown_value'} = [
  {
    'error_line' => ':1: warning: undefined flag: unknown
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'undefined flag: unknown',
    'type' => 'warning'
  }
];



$result_converted{'plaintext'}->{'unknown_value'} = '{No value for `unknown\'}
';

1;
