#!/bin/bash

#SBATCH --job-name=01feb15_finish
#SBATCH --constraint=skylake
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --mem=0
#SBATCH --time=6:00:00
#SBATCH --mail-user=sallen@eoas.ubc.ca
#SBATCH --mail-type=ALL
#SBATCH --account=def-allen
# stdout and stderr file paths/names
#SBATCH --output=/scratch/allen/hindcast_v201812/01feb15/stdout_finish
#SBATCH --error=/scratch/allen/hindcast_v201812/01feb15/stderr_finish


RUN_ID="01feb15_hindcast"
RUN_DESC="01feb15hindcast.yaml"
RESULTS_DIR="/scratch/allen/hindcast_v201812/01feb15"
DEFLATE="${HOME}/.local/bin/salishsea deflate"

module load netcdf-fortran-mpi/4.4.4
module load python/3.7.0

echo "Results deflation started at $(date)"
module load nco/4.6.6
${DEFLATE} *_turb_T*.nc --jobs 48 --debug
echo "Results deflation ended at $(date)"
