use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'all_spaces'} = {
  'contents' => [
    {
      'contents' => [
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
                  'text' => 'utf-8'
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
          'cmdname' => 'documentencoding',
          'extra' => {
            'input_encoding_name' => 'utf-8',
            'input_perl_encoding' => 'utf-8-strict',
            'spaces_after_command' => {},
            'text_arg' => 'utf-8'
          },
          'line_nr' => {
            'file_name' => 'all_spaces.texi',
            'line_nr' => 1,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'parent' => {},
      'type' => 'text_root'
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
              'text' => 'Top'
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
      'cmdname' => 'node',
      'contents' => [
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
              'text' => "EN SPACE: |\x{2002}|
"
            },
            {
              'parent' => {},
              'text' => "EN QUAD: |\x{2000}|
"
            },
            {
              'parent' => {},
              'text' => 'SPACE: | |
'
            },
            {
              'parent' => {},
              'text' => "IDEOGRAPHIC SPACE: |\x{3000}|
"
            },
            {
              'parent' => {},
              'text' => "PARAGRAPH SEPARATOR: |\x{2029}|
"
            },
            {
              'parent' => {},
              'text' => 'LINE TABULATION: ||
'
            },
            {
              'parent' => {},
              'text' => "EM QUAD: |\x{2001}|
"
            },
            {
              'parent' => {},
              'text' => 'CARRIAGE RETURN (CR): ||
'
            },
            {
              'parent' => {},
              'text' => "MEDIUM MATHEMATICAL SPACE: |\x{205f}|
"
            },
            {
              'parent' => {},
              'text' => "NARROW NO-BREAK SPACE: |\x{202f}|
"
            },
            {
              'parent' => {},
              'text' => "THIN SPACE: |\x{2009}|
"
            },
            {
              'parent' => {},
              'text' => "EM SPACE: |\x{2003}|
"
            },
            {
              'parent' => {},
              'text' => "THREE-PER-EM SPACE: |\x{2004}|
"
            },
            {
              'parent' => {},
              'text' => "NEXT LINE (NEL): |\x{85}|
"
            },
            {
              'parent' => {},
              'text' => "FOUR-PER-EM SPACE: |\x{2005}|
"
            },
            {
              'parent' => {},
              'text' => "SIX-PER-EM SPACE: |\x{2006}|
"
            },
            {
              'parent' => {},
              'text' => "NO-BREAK SPACE: |\x{a0}|
"
            },
            {
              'parent' => {},
              'text' => "HAIR SPACE: |\x{200a}|
"
            },
            {
              'parent' => {},
              'text' => "FIGURE SPACE: |\x{2007}|
"
            },
            {
              'parent' => {},
              'text' => "OGHAM SPACE MARK: |\x{1680}|
"
            },
            {
              'parent' => {},
              'text' => 'CHARACTER TABULATION: |	|
'
            },
            {
              'parent' => {},
              'text' => "MONGOLIAN VOWEL SEPARATOR: |\x{180e}|
"
            },
            {
              'parent' => {},
              'text' => 'LINE FEED (LF): |
'
            },
            {
              'parent' => {},
              'text' => '|
'
            },
            {
              'parent' => {},
              'text' => "LINE SEPARATOR: |\x{2028}|
"
            },
            {
              'parent' => {},
              'text' => 'FORM FEED (FF): |'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'parent' => {},
          'text' => '',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '|
'
            },
            {
              'parent' => {},
              'text' => "PUNCTUATION SPACE: |\x{2008}|
"
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Top',
        'spaces_after_command' => {}
      },
      'line_nr' => {
        'file_name' => 'all_spaces.texi',
        'line_nr' => 3,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'all_spaces'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'all_spaces'}{'contents'}[0]{'contents'}[0];
$result_trees{'all_spaces'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_spaces'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_spaces'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_spaces'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_spaces'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_spaces'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_spaces'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_spaces'}{'contents'}[0]{'contents'}[0];
$result_trees{'all_spaces'}{'contents'}[0]{'contents'}[0]{'extra'}{'spaces_after_command'} = $result_trees{'all_spaces'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'all_spaces'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_spaces'}{'contents'}[0];
$result_trees{'all_spaces'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_spaces'}{'contents'}[0];
$result_trees{'all_spaces'}{'contents'}[0]{'parent'} = $result_trees{'all_spaces'};
$result_trees{'all_spaces'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'all_spaces'}{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'args'}[0];
$result_trees{'all_spaces'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'args'}[0];
$result_trees{'all_spaces'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'args'}[0];
$result_trees{'all_spaces'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[11]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[12]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[13]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[14]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[15]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[16]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[17]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[19]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[20]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[21]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[23]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[24]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'contents'}[25]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[3];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1]{'contents'}[3];
$result_trees{'all_spaces'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'all_spaces'}{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'all_spaces'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'all_spaces'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'all_spaces'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'all_spaces'}{'contents'}[1]{'extra'}{'spaces_after_command'} = $result_trees{'all_spaces'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'all_spaces'}{'contents'}[1]{'parent'} = $result_trees{'all_spaces'};

$result_texis{'all_spaces'} = '@documentencoding utf-8

@node Top

EN SPACE: | |
EN QUAD: | |
SPACE: | |
IDEOGRAPHIC SPACE: |　|
PARAGRAPH SEPARATOR: | |
LINE TABULATION: ||
EM QUAD: | |
CARRIAGE RETURN (CR): ||
MEDIUM MATHEMATICAL SPACE: | |
NARROW NO-BREAK SPACE: | |
THIN SPACE: | |
EM SPACE: | |
THREE-PER-EM SPACE: | |
NEXT LINE (NEL): ||
FOUR-PER-EM SPACE: | |
SIX-PER-EM SPACE: | |
NO-BREAK SPACE: | |
HAIR SPACE: | |
FIGURE SPACE: | |
OGHAM SPACE MARK: | |
CHARACTER TABULATION: |	|
MONGOLIAN VOWEL SEPARATOR: |᠎|
LINE FEED (LF): |
|
LINE SEPARATOR: | |
FORM FEED (FF): ||
PUNCTUATION SPACE: | |
';


$result_texts{'all_spaces'} = '

EN SPACE: | |
EN QUAD: | |
SPACE: | |
IDEOGRAPHIC SPACE: |　|
PARAGRAPH SEPARATOR: | |
LINE TABULATION: ||
EM QUAD: | |
CARRIAGE RETURN (CR): ||
MEDIUM MATHEMATICAL SPACE: | |
NARROW NO-BREAK SPACE: | |
THIN SPACE: | |
EM SPACE: | |
THREE-PER-EM SPACE: | |
NEXT LINE (NEL): ||
FOUR-PER-EM SPACE: | |
SIX-PER-EM SPACE: | |
NO-BREAK SPACE: | |
HAIR SPACE: | |
FIGURE SPACE: | |
OGHAM SPACE MARK: | |
CHARACTER TABULATION: |	|
MONGOLIAN VOWEL SEPARATOR: |᠎|
LINE FEED (LF): |
|
LINE SEPARATOR: | |
FORM FEED (FF): ||
PUNCTUATION SPACE: | |
';

$result_sectioning{'all_spaces'} = {};

$result_nodes{'all_spaces'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'node_up' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'dir'
        }
      ],
      'top_node_up' => {}
    },
    'type' => 'top_node_up'
  }
};
$result_nodes{'all_spaces'}{'node_up'}{'extra'}{'top_node_up'} = $result_nodes{'all_spaces'};

$result_menus{'all_spaces'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'all_spaces'} = [];


$result_converted_errors{'file_html'}->{'all_spaces'} = [
  {
    'error_line' => 'all_spaces.texi: warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
