#!/bin/bash

#SBATCH --job-name=deflate2
#SBATCH --time=3:00:00
#SBATCH --mem=1000M
#SBATCH --mail-user=eolson@eoas.ubc.ca
#SBATCH --mail-type=ALL
#SBATCH --account=rrg-allen
# stdout and stderr file paths/names
#SBATCH --output=/scratch/eolson/results/spring15_R2_2/stdout_deflate
#SBATCH --error=/scratch/eolson/results/spring15_R2_2/stderr_deflate

PATH=$/scratch/eolson/results/spring15_R2_2/

echo "started at $(date)"
module load nco/4.6.6

for i in ${PATH}_SalishSea_1h_*.nc
do
   filenew=$(echo $i|cut -d'.' -f 1)
   nccopy -s -4 -d4 $i $filenew'_sm.nc'
done

echo "Results deflation ended at $(date)"
