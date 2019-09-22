#!/bin/bash
#SBATCH --job-name=deflate
#SBATCH --mem=2000M
#SBATCH --time=12:00:00
#SBATCH --mail-user=eolson@eoas.ubc.ca
#SBATCH --mail-type=ALL
#SBATCH --account=rrg-allen
# stdout and stderr file paths/names
#SBATCH --output=/scratch/eolson/results/stdout_deflate
#SBATCH --error=/scratch/eolson/results/stderr_deflate

LOC1=/scratch/eolson/results/PAR_13bfastSiHR_3/

echo "started at $(date)"
module load nco/4.6.6

for i in ${LOC1}SalishSea_1h_*ptrc*7??.nc
do
   filenew=$(echo $i|cut -d'.' -f 1)
   nccopy -s -4 -d4 $i $filenew'_sm.nc'
done

for i in ${LOC1}SalishSea_1h_*ptrc*629.nc
do
   filenew=$(echo $i|cut -d'.' -f 1)
   nccopy -s -4 -d4 $i $filenew'_sm.nc'
done
#for i in ${LOC1}SalishSea_1h_*prod*05[23]0.nc
#do
#   filenew=$(echo $i|cut -d'.' -f 1)
#   nccopy -s -4 -d4 $i $filenew'_sm.nc'
#done

echo "Results deflation ended at $(date)"
