#!/bin/bash

set -e

start_date='2011-07-01'
end_date='2014-07-31'
function do_count {
    name=$1
    output=$2
    count=0
    for i in $output
    do
        i=`echo $i | tr '_' ' '`
        d=`date --date="$i" --rfc-3339='date'`
        if [[ $d > $start_date ]]
        then
            if [[ $d < $end_date  ]]
            then
                count=$((count+1))
            fi
        fi
    done
    echo "\\newcommand{\\${name}NumVersions}{$count}"
}
do_count 'openssl' "`wget --quiet -O - https://www.openssl.org/source/ | grep '.tar.gz' | cut -d'<' -f 1 |  sed 's/^ [0-9]\+ //' | tr ' ' '_'`"
do_count 'linux' "`wget --quiet -O - https://www.kernel.org/pub/linux/kernel/v2.6/ | grep 'linux-' | grep '.tar.gz' | tr -s ' ' | cut -d' ' -f 3`
`wget --quiet -O - https://www.kernel.org/pub/linux/kernel/v3.0/ | grep 'linux-' | grep '.tar.gz' | tr -s ' ' | cut -d' ' -f 3`"

