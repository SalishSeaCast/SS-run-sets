#!/bin/bash

#SBATCH --job-name=deflate
#SBATCH --mem=0
#SBATCH --time=1:00:00
#SBATCH --mail-user=eolson@eoas.ubc.ca
#SBATCH --mail-type=ALL
#SBATCH --account=def-allen
# stdout and stderr file paths/names
#SBATCH --output=/scratch/eolson/results/spring15_R3_0/stdout_deflate
#SBATCH --error=/scratch/eolson/results/spring15_R3_0/stderr_deflate

LOC1=/scratch/eolson/results/spring15_R3_0/

echo "started at $(date)"
module load nco/4.6.6

for i in ${LOC1}_SalishSea_1h_*.nc
do
   filenew=$(echo $i|cut -d'.' -f 1)
   nccopy -s -4 -d4 $i $filenew'_sm.nc'
done

echo "Results deflation ended at $(date)"
