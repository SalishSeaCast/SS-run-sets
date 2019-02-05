#!/bin/bash

#SBATCH --job-name=deflate
#SBATCH --constraint=skylake
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=5
#SBATCH --mem=0
#SBATCH --time=3:00:00
#SBATCH --mail-user=eolson@eoas.ubc.ca
#SBATCH --mail-type=ALL
#SBATCH --account=def-allen
# stdout and stderr file paths/names
#SBATCH --output=/scratch/eolson/results/spring15_R3_0/stdout_deflate
#SBATCH --error=/scratch/eolson/results/spring15_R3_0/stderr_deflate


RUN_ID="spring15_R3_0"
RUN_DESC="spring15_R3_0.yaml"
RESULTS_DIR="/scratch/eolson/results/spring15_R3_0"
DEFLATE="${HOME}/.local/bin/salishsea deflate"

module load netcdf-fortran-mpi/4.4.4
module load python/3.7.0

echo "Results deflation started at $(date)"
module load nco/4.6.6
${DEFLATE} SalishSea_1h*.nc --jobs 5 --debug
echo "Results deflation ended at $(date)"
