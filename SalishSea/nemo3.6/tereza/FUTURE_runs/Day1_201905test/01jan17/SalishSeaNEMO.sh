#!/bin/bash

#PBS -N 01jan17hindcast
#PBS -S /bin/bash
#PBS -l walltime=10:00:00
# email when the job [b]egins and [e]nds, or is [a]borted
#PBS -m bea
#PBS -M sallen@eoas.ubc.ca
#PBS -l nodes=14:ppn=20
# memory per processor
#PBS -l pmem=2000mb
# stdout and stderr file paths/names
#PBS -o /scratch/sallen/dlatorne/hindcast.201905/01jan17/stdout
#PBS -e /scratch/sallen/dlatorne/hindcast.201905/01jan17/stderr


RUN_ID="01jan17hindcast"
RUN_DESC="/scratch/sallen/dlatorne/hindcast.201905/01jan17hindcast_2019-09-30T214444.978150-0700/01jan17hindcast.yaml"
WORK_DIR="/scratch/sallen/dlatorne/hindcast.201905/01jan17hindcast_2019-09-30T214444.978150-0700"
RESULTS_DIR="/scratch/sallen/dlatorne/hindcast.201905/01jan17"
COMBINE="${PBS_O_HOME}/bin/salishsea combine"
GATHER="${PBS_O_HOME}/bin/salishsea gather"

module load OpenMPI/2.1.6/GCC/SYSTEM

mkdir -p ${RESULTS_DIR}
cd ${WORK_DIR}
echo "working dir: $(pwd)"

echo "Starting run at $(date)"
mpiexec -hostfile $(openmpi_nodefile) --bind-to core -np 278 ./nemo.exe : --bind-to core -np 1 ./xios_server.exe
MPIRUN_EXIT_CODE=$?
echo "Ended run at $(date)"

echo "Results combining started at $(date)"
module load GCC/8.3
module load OpenMPI/2.1.6/GCC/8.3
module load ZLIB/1.2/11
module load use.paustin
module load HDF5/1.08/20
module load NETCDF/4.6/1
${COMBINE} ${RUN_DESC} --debug
echo "Results combining ended at $(date)"

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
