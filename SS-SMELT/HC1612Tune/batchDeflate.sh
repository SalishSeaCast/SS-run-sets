#!/bin/bash

#SBATCH --job-name=deflate
#SBATCH --time=3:00:00
#SBATCH --mem=5G
#SBATCH --mail-user=eolson@eoas.ubc.ca
#SBATCH --mail-type=ALL
#SBATCH --account=def-allen
# stdout and stderr file paths/names
#SBATCH --output=/scratch/eolson/results/GLSsummer15_0/stdout_deflate
#SBATCH --error=/scratch/eolson/results/GLSsummer15_0/stderr_deflate

PATH=$/scratch/eolson/results/spring15_R2_0/

echo "started at $(date)"
module load nco/4.6.6

for i in ${PATH}_SalishSea_1h_*.nc
do
   filenew=$(echo $i|cut -d'.' -f 1)
   nccopy -s -4 -d4 $i $filenew'_sm.nc'
done

echo "Results deflation ended at $(date)"
