#!/bin/bash
NEWRUN=NewLOSOGT2Si

TEST="$(salishsea run ${NEWRUN}_5.yaml $SCRATCH/results/${NEWRUN}_5 2>&1)"
echo $TEST
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo $JID
sbatch --dependency=afterok:${JID} batchDeflate.sh ${NEWRUN} 5
echo "Ended at $(date)"
exit
