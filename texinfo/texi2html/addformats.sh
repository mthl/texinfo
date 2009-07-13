#! /bin/sh

if [ -z $7 ]; then
	exit 1
fi

echo "Adding $3 $4 in $1"

sed -e "/@INIT_HTML@/r $3" \
	    -e "/@INIT_INFO@/r $4" \
	    -e "/@INIT_DOCBOOK@/r $5" \
	    -e "/@INIT_XML@/r $6" \
	    -e "/@INIT_PLAINTEXT@/r $7" \
	    $2 >$1
