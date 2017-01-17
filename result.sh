#!/bin/bash

set -euo pipefail

source pv-deploy-config.mk

POSTFIX=".dat"
TEMP="temp"

# echo -n "" > temp.dat;
echo -n "" > result.csv
for i in `seq  1 15`; do
	cat vm$i.dat | grep "Request" | cut -d " " -f  7 >> "temp$i.dat"
done

for i in `seq 1 15`; do
     cat temp$i.dat | awk  '{sum += $1; sumsq += ($1 * $1) } END {sqd = sumsq /     NR - (sum / NR)^2; if(sqd < 10^-8) sqd = 0; print  sum / NR " ," sqrt(sqd) }' >> result$i.csv
done

mkdir data_on_xeon 

mv *.dat *.csv ./data_on_xeon

echo "please check the result in result.csv"
