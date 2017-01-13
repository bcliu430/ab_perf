#!/bin/bash
set -euo pipefail

if [ ! "$#" == "1" ]; then
    echo "Usage: $0 <vm number>"
    echo "example: $0 3"
    echo "will run the script on vm3"
    exit
fi

TIMES=$1

function run_apache {
    touch vm$TIMES.dat
    echo -n "" > vm$TIMES.dat
    for i in `seq 1 10`; do
        ab -t 3 "http://10.0.0.1"$TIMES"/" >> vm$TIMES.dat  &
        wait
    done
}

    echo "start experiment..."
    wait

    run_apache;
    wait
    echo "done..."


