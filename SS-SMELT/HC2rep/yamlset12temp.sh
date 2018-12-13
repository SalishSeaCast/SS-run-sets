#!/bin/bash
NEWRUN="Z6"

#sed "s/rrg-allen/def-allen/" "spring15spun_${NEWRUN}_23.yaml" > "spring15spun_${NEWRUN}_23d.yaml"
#sed "s/rrg-allen/def-allen/" "spring15spun_${NEWRUN}_24.yaml" > "spring15spun_${NEWRUN}_24d.yaml"
#sed "s/rrg-allen/def-allen/" "spring15spun_${NEWRUN}_25.yaml" > "spring15spun_${NEWRUN}_25d.yaml"


TEST="$(salishsea run spring15spun_${NEWRUN}_23d.yaml $SCRATCH/results/spring15spun_${NEWRUN}_23 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions spring15spun_${NEWRUN}_24d.yaml $SCRATCH/results/spring15spun_${NEWRUN}_24 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
TEST=0
TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions spring15spun_${NEWRUN}_25d.yaml $SCRATCH/results/spring15spun_${NEWRUN}_25 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo "Ended at $(date)"
exit
