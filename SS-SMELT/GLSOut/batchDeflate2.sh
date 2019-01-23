#!/bin/bash

#SBATCH --job-name=deflate
#SBATCH --time=3:00:00
#SBATCH --mail-user=eolson@eoas.ubc.ca
#SBATCH --mail-type=ALL
#SBATCH --account=def-allen
# stdout and stderr file paths/names
#SBATCH --output=/scratch/eolson/results/GLSsummer15_0/stdout_deflate2
#SBATCH --error=/scratch/eolson/results/GLSsummer15_0/stderr_deflate2


echo "started at $(date)"
module load nco/4.6.6

for i in /scratch/eolson/results/GLSsummer15_0/SalishSea_1h_20150501_20150629_dian_U_*.nc
do
   filenew=$(echo $i|cut -d'.' -f 1)
   nccopy -s -4 -d4 $i $filenew'_sm.nc'
done

echo "Results deflation ended at $(date)"
