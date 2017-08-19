
# enable some translations which have not been updated after @tie{ }
# was changed to @tie{} in the document string

for f in *.po; do
   echo '%s/^#, \zsfuzzy, \ze.*\nmsgid "@tie{}//
wq' | vim -es $f
done
