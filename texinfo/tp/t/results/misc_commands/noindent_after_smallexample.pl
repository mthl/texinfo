use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'noindent_after_smallexample'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'To obtain.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'smallexample',
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
              'text' => '$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD&content-type=text/plain\'
'
            },
            {
              'parent' => {},
              'text' => '$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD&content-type=text/plain\'
'
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
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
      'cmdname' => 'noindent',
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
      'type' => 'empty_line_after_command'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Less recent versions are also present.
'
        }
      ],
      'extra' => {
        'noindent' => 1
      },
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'parent'} = $result_trees{'noindent_after_smallexample'};
$result_trees{'noindent_after_smallexample'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[1];
$result_trees{'noindent_after_smallexample'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[1]{'contents'}[1];
$result_trees{'noindent_after_smallexample'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[1]{'contents'}[1];
$result_trees{'noindent_after_smallexample'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[1];
$result_trees{'noindent_after_smallexample'}{'contents'}[1]{'parent'} = $result_trees{'noindent_after_smallexample'};
$result_trees{'noindent_after_smallexample'}{'contents'}[2]{'parent'} = $result_trees{'noindent_after_smallexample'};
$result_trees{'noindent_after_smallexample'}{'contents'}[3]{'parent'} = $result_trees{'noindent_after_smallexample'};
$result_trees{'noindent_after_smallexample'}{'contents'}[4]{'parent'} = $result_trees{'noindent_after_smallexample'};
$result_trees{'noindent_after_smallexample'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[5];
$result_trees{'noindent_after_smallexample'}{'contents'}[5]{'parent'} = $result_trees{'noindent_after_smallexample'};

$result_texis{'noindent_after_smallexample'} = 'To obtain.
@smallexample
$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD&content-type=text/plain\'
$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD&content-type=text/plain\'
@end smallexample
@noindent
Less recent versions are also present.
';


$result_texts{'noindent_after_smallexample'} = 'To obtain.
$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD&content-type=text/plain\'
$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD&content-type=text/plain\'
Less recent versions are also present.
';

$result_errors{'noindent_after_smallexample'} = [];



$result_converted{'plaintext'}->{'noindent_after_smallexample'} = 'To obtain.
     $ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD&content-type=text/plain\'
     $ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD&content-type=text/plain\'
Less recent versions are also present.
';

1;
