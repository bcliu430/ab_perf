#!/bin/bash
set -euo pipefail

source "pv-deploy-config.mk";

IP_BASE=`echo $GATEWAY | cut -d"." -f1-3`.

function run_apache {
    touch vm3.dat
    for i in `seq 1 10`; do
        echo $i
        siege -q -b -t3s http://10.0.0.5/  &
        wait
    done
}

echo "start experiment..."
wait

    run_apache;
mv /var/log/siege.log vm3.dat

