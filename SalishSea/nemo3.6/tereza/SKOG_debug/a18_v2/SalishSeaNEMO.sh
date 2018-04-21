#!/bin/bash

#PBS -N 01sept16nowcast-dev
#PBS -S /bin/bash
#PBS -l procs=8
# memory per processor
#PBS -l pmem=2000mb
#PBS -l walltime=6:00:00
# email when the job [b]egins and [e]nds, or is [a]borted
#PBS -m bea
#PBS -M tjarnik@gmail.com
# stdout and stderr file paths/names
#PBS -o /data/tjarniko/results/a18_v2/stdout
#PBS -e /data/tjarniko/results/a18_v2/stderr


RUN_ID="01sept16nowcast-dev"
RUN_DESC="SS_SALISH_TS.yaml"
WORK_DIR="/data/tjarniko/MEOPAR/runs/01sept16nowcast-dev_2018-04-18T185121.538705-0700"
RESULTS_DIR="/data/tjarniko/results/a18_v2"
COMBINE="${HOME}/.local/bin/salishsea combine"
DEFLATE="${HOME}/.local/bin/salishsea deflate"
GATHER="${HOME}/.local/bin/salishsea gather"


mkdir -p ${RESULTS_DIR}
cd ${WORK_DIR}
echo "working dir: $(pwd)"

echo "Starting run at $(date)"
/usr/bin/mpirun -np 7 ./nemo.exe : -np 1 ./xios_server.exe
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
