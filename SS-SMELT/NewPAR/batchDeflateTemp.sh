#!/bin/bash
#SBATCH --job-name=deflate
#SBATCH --mem=2000M
#SBATCH --time=6:00:00
#SBATCH --mail-user=eolson@eoas.ubc.ca
#SBATCH --mail-type=ALL
#SBATCH --account=def-allen
# stdout and stderr file paths/names
#SBATCH --output=/scratch/eolson/results/stdout_deflate
#SBATCH --error=/scratch/eolson/results/stderr_deflate

LOC1=/scratch/eolson/results/PAR1_3_3/

echo "started at $(date)"
module load nco/4.6.6

nccopy -s -4 -d4 /scratch/eolson/results/PAR1_3_3/SalishSea_1h_20170411_20170530_ptrc_T_20170421-20170430.nc /scratch/eolson/results/PAR1_3_3/SalishSea_1h_20170411_20170530_ptrc_T_20170421-20170430_sm.nc
nccopy -s -4 -d4 /scratch/eolson/results/PAR1_3_3/SalishSea_1h_20170411_20170530_ptrc_T_20170501-20170510.nc /scratch/eolson/results/PAR1_3_3/SalishSea_1h_20170411_20170530_ptrc_T_20170501-20170510_sm.nc
nccopy -s -4 -d4 /scratch/eolson/results/PAR1_3_3/SalishSea_1h_20170411_20170530_ptrc_T_20170511-20170520.nc /scratch/eolson/results/PAR1_3_3/SalishSea_1h_20170411_20170530_ptrc_T_20170511-20170520_sm.nc
nccopy -s -4 -d4 /scratch/eolson/results/PAR1_3_3/SalishSea_1h_20170411_20170530_ptrc_T_20170521-20170530.nc /scratch/eolson/results/PAR1_3_3/SalishSea_1h_20170411_20170530_ptrc_T_20170521-20170530_sm.nc

echo "Results deflation ended at $(date)"
