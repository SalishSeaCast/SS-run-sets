#!/bin/bash
NEWRUN=NewLONoSiT

TEST="$(salishsea run ${NEWRUN}_4.yaml $SCRATCH/results/${NEWRUN}_4 2>&1)"
echo $TEST
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo $JID
sbatch --dependency=afterok:${JID} batchDeflate.sh ${NEWRUN} 0

TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions ${NEWRUN}_5.yaml $SCRATCH/results/${NEWRUN}_5 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo $JID
#TEST=0
#TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions ${NEWRUN}_3.yaml $SCRATCH/results/${NEWRUN}_3 2>&1)"
#echo $TEST
#JID=0
#if [[ $TEST != *"ERROR"* ]]; then
#   JID=${TEST##* }
#else
#  exit
#fi
#echo $JID
#TEST=0
#TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions ${NEWRUN}_4.yaml $SCRATCH/results/${NEWRUN}_4 2>&1)"
#echo $TEST
#JID=0
#if [[ $TEST != *"ERROR"* ]]; then
#   JID=${TEST##* }
#else
#  exit
#fi
#echo $JID
#TEST=0
#TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions ${NEWRUN}_5.yaml $SCRATCH/results/${NEWRUN}_5 2>&1)"
#echo $TEST
#JID=0
#if [[ $TEST != *"ERROR"* ]]; then
#   JID=${TEST##* }
#else
#  exit
#fi
#echo $JID
echo "Ended run at $(date)"
exit
