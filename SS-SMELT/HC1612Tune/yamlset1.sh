#!/bin/bash
NEWRUN="R4NoSiT"
PREFIX=spring15

TEST="$(salishsea run ${PREFIX}_${NEWRUN}_0.yaml $SCRATCH/results/${PREFIX}_${NEWRUN}_0 2>&1)"
echo $TEST
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo $JID
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions ${PREFIX}_${NEWRUN}_1.yaml $SCRATCH/results/${PREFIX}_${NEWRUN}_1 2>&1)"
echo $TEST
JID=0
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
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions ${PREFIX}_${NEWRUN}_3.yaml $SCRATCH/results/${PREFIX}_${NEWRUN}_3 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo "Ended run at $(date)"
exit
