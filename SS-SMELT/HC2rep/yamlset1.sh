#!/bin/bash
NEWRUN="Ztest"

TEST="$(salishsea run spring15spun_${NEWRUN}_0.yaml $SCRATCH/results/spring15spun_${NEWRUN}_0 2>&1)"
echo $TEST
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo $JID
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions spring15spun_${NEWRUN}_1.yaml $SCRATCH/results/spring15spun_${NEWRUN}_1 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo $JID
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions spring15spun_${NEWRUN}_2.yaml $SCRATCH/results/spring15spun_${NEWRUN}_2 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions spring15spun_${NEWRUN}_3.yaml $SCRATCH/results/spring15spun_${NEWRUN}_3 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions spring15spun_${NEWRUN}_4.yaml $SCRATCH/results/spring15spun_${NEWRUN}_4 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions spring15spun_${NEWRUN}_5.yaml $SCRATCH/results/spring15spun_${NEWRUN}_5 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo "Ended run at $(date)"
exit
