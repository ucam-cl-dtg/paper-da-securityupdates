#!/bin/bash

set -e

start_date='2011-07-01'
end_date='2014-07-31'
openssl_count=0
output=`wget --quiet -O - https://www.openssl.org/source/ | grep '.tar.gz' | cut -d'<' -f 1 |  sed 's/^ [0-9]\+ //' | tr ' ' '_'`
for i in $output
do
    i=`echo $i | tr '_' ' '`
    d=`date --date="$i" --rfc-3339='date'`
    if [[ $d > $start_date ]]
    then
        if [[ $d < $end_date  ]]
        then
            openssl_count=$((openssl_count+1))
        fi
    fi
done
echo "\\newcommand{\\opensslNumVersions}{$openssl_count}"
