#!/bin/bash

set -euo pipefail


ID=0
echo -n "" > result.csv
for i in `seq $ID $(($1-1))`; do
	cat vm$i.dat | grep "Request" | cut -d " " -f  7 >> "result.csv"
done

echo "please check the result in result.csv"

