#!/bin/bash
set -euo pipefail

source "pv-deploy-config.mk";

IP_BASE=`echo $GATEWAY | cut -d"." -f1-3`.

function run_apache {
    touch vm2.dat
    ab -t 1  "http://"$IP_BASE'4'"/" >> vm2.dat  &
    wait
}

echo "start experiment..."
wait
echo "old data cleaned"

    run_apache;
