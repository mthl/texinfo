#! /bin/sh

if [ -z $8 ]; then
	exit 1
fi

echo "regenerating $1 from $3 $4 $5 $6 $2 $7 $8" 

sed -e "/@MYSIMPLE@/r $3" \
	    -e "/@T2H_I18N@/r $4" \
	    -e "/@INIT@/r $5" \
	    -e "/@T2H_TRANSLATIONS_FILE@/r $6" \
	    -e "/@T2H_L2H_INIT@/r $7" \
	    -e "/@T2H_L2H@/r $8" \
	                $2 >$1
