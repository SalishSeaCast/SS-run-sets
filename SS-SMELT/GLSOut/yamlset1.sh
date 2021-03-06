#!/bin/bash
NEWRUN=Summer15
PREFIX=GLS

TEST="$(salishsea run ${PREFIX}_${NEWRUN}_1b.yaml $SCRATCH/results/${PREFIX}_${NEWRUN}_1b 2>&1)"
echo $TEST
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo $JID
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions ${PREFIX}_${NEWRUN}_2.yaml $SCRATCH/results/${PREFIX}_${NEWRUN}_2 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo $JID
echo "Ended run at $(date)"
exit
