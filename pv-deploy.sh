########################################################################
# Filename:    pv-deploy.sh
# Author:      Beichen Liu
# Version:     01.13.2017
# Description: This script is used to deploy n number of vms with 
#              n vcpus each machine.

#!/bin/bash
set -euo pipefail

if [ ! "$#" = "1" ]; then
    echo "Usage: $0 <number of vms>"
    exit
fi

NUM=$1






for i in `seq 1 $NUM`; do
  
    sudo xen-create-image \
        --hostname=vm$i \
        --memory=1024mb \
        --vcpus=$i \
        --bridge=xenbr0 \
        --ip=10.0.0.$(($i+10)) \
        --gateway=10.0.0.1 \
        --netmask=255.255.255.0 \
        --size=2gb \
        --password=a \
        --dir=/root/xen-domains \
        --genpass=0 \
        --install-method=debootstrap \
        --noswap
done

# TODO here check if we have enough loop device to launch everything, check hereif its built in:
# - http://askubuntu.com/questions/666880/loop-module-not-present-on-ubuntu-installation
# Or here if it's a module:
# https://yeri.be/xen-failed-to-find-an-unused-loop-device
