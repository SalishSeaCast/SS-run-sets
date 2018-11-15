#!/bin/bash
NEWRUN="A02"

TEST="$(salishsea run ${NEWRUN}_0.yaml $SCRATCH/results/${NEWRUN}_0 2>&1)"
echo $TEST
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
   JID=${JID%.orca2.ibb}
else
  exit
fi
echo $JID
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions ${NEWRUN}_1.yaml $SCRATCH/results/${NEWRUN}_1 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
   JID=${JID%.orca2.ibb}
else
  exit
fi
echo $JID
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions ${NEWRUN}_2.yaml $SCRATCH/results/${NEWRUN}_2 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
   JID=${JID%.orca2.ibb}
else
  exit
fi
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions ${NEWRUN}_3.yaml $SCRATCH/results/${NEWRUN}_3 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
   JID=${JID%.orca2.ibb}
else
  exit
fi
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions ${NEWRUN}_4.yaml $SCRATCH/results/${NEWRUN}_4 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
   JID=${JID%.orca2.ibb}
else
  exit
fi
echo "Ended run at $(date)"
exit
