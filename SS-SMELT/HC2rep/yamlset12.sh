#!/bin/bash
NEWRUN="Z6"

TEST="$(salishsea run spring15spun_${NEWRUN}_20.yaml $SCRATCH/results/spring15spun_${NEWRUN}_20 2>&1)"
echo $TEST
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo $JID
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions spring15spun_${NEWRUN}_21.yaml $SCRATCH/results/spring15spun_${NEWRUN}_21 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo $JID
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions spring15spun_${NEWRUN}_22.yaml $SCRATCH/results/spring15spun_${NEWRUN}_22 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions spring15spun_${NEWRUN}_23.yaml $SCRATCH/results/spring15spun_${NEWRUN}_23 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions spring15spun_${NEWRUN}_24.yaml $SCRATCH/results/spring15spun_${NEWRUN}_24 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions spring15spun_${NEWRUN}_25.yaml $SCRATCH/results/spring15spun_${NEWRUN}_25 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo "Ended run at $(date)"
exit
