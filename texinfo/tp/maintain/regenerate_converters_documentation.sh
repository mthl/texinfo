#! /bin/sh

for format in HTML XML DocBook Info Plaintext; do
  sed -i '/^__END__/q' Texinfo/Convert/$format.pm
  sed "s/OUTFORMAT/$format/g" maintain/template.pod > maintain/$format.pod
  sed -i "/^__END__/r maintain/$format.pod" Texinfo/Convert/$format.pm
  rm -f maintain/$format.pod
done
