#!/bin/bash
set -euo pipefail

source "pv-deploy-config.mk";

IP_BASE=`echo $GATEWAY | cut -d"." -f1-3`.

function run_apache {
    touch vm1.dat
    for i in `seq 1 10`; do
        siege -q -b -t3s http://10.0.0.3/ &
        wait
    done
}


    run_apache;

mv /var/log/siege.log vm1.dat
