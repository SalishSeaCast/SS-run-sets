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

LOC1=/scratch/eolson/results/PAR1_3_0/

echo "started at $(date)"
module load nco/4.6.6

nccopy -s -4 -d4 /scratch/eolson/results/PAR1_3_1/SalishSea_1h_20170220_20170410_ptrc_T_20170322-20170331.nc /scratch/eolson/results/PAR1_3_1/SalishSea_1h_20170220_20170410_ptrc_T_20170322-20170331_sm.nc
nccopy -s -4 -d4 /scratch/eolson/results/PAR1_3_1/SalishSea_1h_20170220_20170410_ptrc_T_20170401-20170410.nc /scratch/eolson/results/PAR1_3_1/SalishSea_1h_20170220_20170410_ptrc_T_20170401-20170410_sm.nc

echo "Results deflation ended at $(date)"
