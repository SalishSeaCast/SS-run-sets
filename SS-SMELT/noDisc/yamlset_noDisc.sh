#!/bin/bash
NEWRUN=noDis_30s
PREFIX=rev

TEST="$(salishsea run ${PREFIX}_${NEWRUN}_4.yaml $SCRATCH/results/${PREFIX}_${NEWRUN}_4 2>&1)"
echo $TEST
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo $JID
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions ${PREFIX}_${NEWRUN}_5.yaml $SCRATCH/results/${PREFIX}_${NEWRUN}_5 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo $JID
echo "Ended at $(date)"
exit
