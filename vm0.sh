#!/bin/bash
set -euo pipefail

source "pv-deploy-config.mk";

IP_BASE=`echo $GATEWAY | cut -d"." -f1-3`.

function run_apache {
    touch vm0.dat
    for i in `seq 1 10`; do
        siege -q -b -t2s http://10.0.0.2/  &
        wait
    done
}

echo "start experiment..."
wait

    run_apache;

mv /var/log/siege.log vm0.dat

