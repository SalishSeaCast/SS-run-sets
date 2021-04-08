#!/bin/bash
for FILE in SalishSeaLake_S*
do
    RESULTS_PATH=$SCRATCH/Results/Lake/$(echo $FILE | cut -f 1 -d '.')
    mkdir -p $RESULTS_PATH
    salishsea run $FILE $RESULTS_PATH
done
