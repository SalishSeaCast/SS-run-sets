#!/bin/bash
NEWRUN=NewLOGnSiTC

TEST="$(salishsea run ${NEWRUN}_2b.yaml $SCRATCH/results/${NEWRUN}_2b 2>&1)"
echo $TEST
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo $JID
sbatch --dependency=afterok:${JID} batchDeflate.sh ${NEWRUN} 2_0

for j in $(seq 3 5); do
  TEST=0
  TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions ${NEWRUN}_${j}.yaml $SCRATCH/results/${NEWRUN}_${j} 2>&1)"
  echo $TEST
  JID=0
  if [[ $TEST != *"ERROR"* ]]; then
     JID=${TEST##* }
  else
    exit
  fi
  echo $JID
  sbatch --dependency=afterok:${JID} batchDeflate.sh $NEWRUN $j
done
#TEST=0
#TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions ${NEWRUN}_2.yaml $SCRATCH/results/${NEWRUN}_2 2>&1)"
#echo $TEST
#JID=0
#if [[ $TEST != *"ERROR"* ]]; then
#   JID=${TEST##* }
#else
#  exit
#fi
#echo $JID
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
