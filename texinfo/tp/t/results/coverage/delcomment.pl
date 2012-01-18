use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'delcomment'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'text' => '\\input texinfo
',
              'type' => 'preamble_text'
            }
          ],
          'parent' => {},
          'type' => 'preamble'
        }
      ],
      'parent' => {},
      'type' => 'preamble_before_setfilename'
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
              'text' => 'delcomment.info'
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
      'cmdname' => 'setfilename',
      'extra' => {
        'text_arg' => 'delcomment.info'
      },
      'line_nr' => {
        'file_name' => 'delcomment.texi',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
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
          'text' => 'This line is the only output.
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
      'cmdname' => 'bye',
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'delcomment'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'delcomment'}{'contents'}[0];
$result_trees{'delcomment'}{'contents'}[0]{'parent'} = $result_trees{'delcomment'};
$result_trees{'delcomment'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'delcomment'}{'contents'}[1];
$result_trees{'delcomment'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'delcomment'}{'contents'}[1]{'args'}[0];
$result_trees{'delcomment'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'delcomment'}{'contents'}[1]{'args'}[0];
$result_trees{'delcomment'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'delcomment'}{'contents'}[1]{'args'}[0];
$result_trees{'delcomment'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'delcomment'}{'contents'}[1];
$result_trees{'delcomment'}{'contents'}[1]{'parent'} = $result_trees{'delcomment'};
$result_trees{'delcomment'}{'contents'}[2]{'parent'} = $result_trees{'delcomment'};
$result_trees{'delcomment'}{'contents'}[3]{'parent'} = $result_trees{'delcomment'};
$result_trees{'delcomment'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'delcomment'}{'contents'}[4];
$result_trees{'delcomment'}{'contents'}[4]{'parent'} = $result_trees{'delcomment'};
$result_trees{'delcomment'}{'contents'}[5]{'parent'} = $result_trees{'delcomment'};
$result_trees{'delcomment'}{'contents'}[6]{'parent'} = $result_trees{'delcomment'};

$result_texis{'delcomment'} = '\\input texinfo
@setfilename delcomment.info


This line is the only output.

@bye
';


$result_texts{'delcomment'} = '

This line is the only output.

';

$result_errors{'delcomment'} = [];


1;
