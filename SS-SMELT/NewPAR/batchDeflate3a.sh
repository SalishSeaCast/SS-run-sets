#!/bin/bash
#SBATCH --job-name=deflate
#SBATCH --dependency=afterok:20316323
#SBATCH --mem=2000M
#SBATCH --time=6:00:00
#SBATCH --mail-user=eolson@eoas.ubc.ca
#SBATCH --mail-type=ALL
#SBATCH --account=rrg-allen
# stdout and stderr file paths/names
#SBATCH --output=/scratch/eolson/results/stdout_deflate
#SBATCH --error=/scratch/eolson/results/stderr_deflate

LOC1=/scratch/eolson/results/PAR_13bfastSiHR_1/

echo "started at $(date)"
module load nco/4.6.6

for i in ${LOC1}SalishSea_1h_*.nc
do
   filenew=$(echo $i|cut -d'.' -f 1)
   nccopy -s -4 -d4 $i $filenew'_sm.nc'
done

echo "Results deflation ended at $(date)"
