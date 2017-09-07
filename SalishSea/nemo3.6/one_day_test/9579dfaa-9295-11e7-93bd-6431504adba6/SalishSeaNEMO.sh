#!/bin/bash

#PBS -N 21mar15_Sept05
#PBS -S /bin/bash
#PBS -l procs=156
# memory per processor
#PBS -l pmem=2000mb
#PBS -l walltime=2:00:00
# email when the job [b]egins and [e]nds, or is [a]borted
#PBS -m bea
#PBS -M tjarnik@gmail.com
# stdout and stderr file paths/names
#PBS -o /home/tjarnik/MEOPAR/SalishSea/results/Sept05_17/stdout
#PBS -e /home/tjarnik/MEOPAR/SalishSea/results/Sept05_17/stderr
#PBS -l partition=QDR


RUN_ID="21mar15_Sept05"
RUN_DESC="SS_21mar15_v2.yaml"
WORK_DIR="/global/home/tjarnik/MEOPAR/SS-run-sets/SalishSea/nemo3.6/one_day_test/9579dfaa-9295-11e7-93bd-6431504adba6"
RESULTS_DIR="/home/tjarnik/MEOPAR/SalishSea/results/Sept05_17"
COMBINE="${PBS_O_HOME}/.local/bin/salishsea combine"
DEFLATE="${PBS_O_HOME}/.local/bin/salishsea deflate"
GATHER="${PBS_O_HOME}/.local/bin/salishsea gather"

module load intel
module load intel/14.0/netcdf-4.3.3.1_mpi
module load intel/14.0/netcdf-fortran-4.4.0_mpi
module load intel/14.0/hdf5-1.8.15p1_mpi
module load intel/14.0/nco-4.5.2
module load python

mkdir -p ${RESULTS_DIR}
cd ${WORK_DIR}
echo "working dir: $(pwd)"

echo "Starting run at $(date)"
mpirun -np 155 ./nemo.exe : -np 1 ./xios_server.exe
MPIRUN_EXIT_CODE=$?
echo "Ended run at $(date)"

echo "Results combining started at $(date)"
${COMBINE} ${RUN_DESC} --debug
echo "Results combining ended at $(date)"

echo "Results deflation started at $(date)"
${DEFLATE} *_grid_[TUVW]*.nc *_ptrc_T*.nc *_dia[12]_T*.nc --jobs 4 --debug
echo "Results deflation ended at $(date)"

echo "Results gathering started at $(date)"
${GATHER} ${RESULTS_DIR} --debug
echo "Results gathering ended at $(date)"

chmod go+rx ${RESULTS_DIR}
chmod g+rw ${RESULTS_DIR}/*
chmod o+r ${RESULTS_DIR}/*

echo "Deleting run directory" >>${RESULTS_DIR}/stdout
rmdir $(pwd)
echo "Finished at $(date)" >>${RESULTS_DIR}/stdout
exit ${MPIRUN_EXIT_CODE}
