use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'comment_between_text'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text
'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' comment
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'end para'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'comment_between_text'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_between_text'}{'contents'}[0];
$result_trees{'comment_between_text'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comment_between_text'}{'contents'}[0]{'contents'}[1];
$result_trees{'comment_between_text'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment_between_text'}{'contents'}[0];
$result_trees{'comment_between_text'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'comment_between_text'}{'contents'}[0];
$result_trees{'comment_between_text'}{'contents'}[0]{'parent'} = $result_trees{'comment_between_text'};

$result_texis{'comment_between_text'} = 'text
@c comment
end para';


$result_texts{'comment_between_text'} = 'text
end para';

$result_errors{'comment_between_text'} = [];



$result_converted{'plaintext'}->{'comment_between_text'} = 'text end para
';

1;
