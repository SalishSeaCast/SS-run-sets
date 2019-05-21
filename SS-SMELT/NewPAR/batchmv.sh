#!/bin/bash

LOC1=/scratch/eolson/results/PAR_BSIdepfastSiLR_0/

echo "started at $(date)"
module load nco/4.6.6

for i in ${LOC1}*_sm.nc
do
   s=${i%_sm.nc}; 
   mv $i ${s}.nc;
done

echo "Results deflation ended at $(date)"
