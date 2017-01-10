#!/bin/bash
set -euo pipefail

source "pv-deploy-config.mk";

IP_BASE=`echo $GATEWAY | cut -d"." -f1-3`.

function run_apache {
    touch vm3.dat
    ab -t 10  "http://"$IP_BASE'5'"/" >> vm3.dat  &
    wait
}

echo "start experiment..."
wait
echo "old data cleaned"

    run_apache;
