#!/bin/bash
NEWRUN="T4"
#OLDRUN="R5"

#echo "working dir: $(pwd)"

#sed "s/$OLDRUN/$NEWRUN/" "spring2015_${OLDRUN}_0.yaml" > "spring2015_${NEWRUN}_0.yaml"
#sed "s/$OLDRUN/$NEWRUN/" "spring2015_${OLDRUN}_1.yaml" > "spring2015_${NEWRUN}_1.yaml"
#sed "s/$OLDRUN/$NEWRUN/" "spring2015_${OLDRUN}_2.yaml" > "spring2015_${NEWRUN}_2.yaml"
#sed "s/$OLDRUN/$NEWRUN/" "spring2015_${OLDRUN}_3.yaml" > "spring2015_${NEWRUN}_3.yaml"
#sed "s/$OLDRUN/$NEWRUN/" "spring2015_${OLDRUN}_4.yaml" > "spring2015_${NEWRUN}_4.yaml"

TEST="$(salishsea run --skylake spring2015_${NEWRUN}_0.yaml $SCRATCH/results/spring2015_${NEWRUN}_0 2>&1)"
echo $TEST
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo $JID
TEST=0
TEST="$(salishsea run --skylake --waitjob ${JID} --nocheck-initial-conditions spring2015_${NEWRUN}_1.yaml $SCRATCH/results/spring2015_${NEWRUN}_1 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo $JID
TEST=0
TEST="$(salishsea run --skylake --waitjob ${JID} --nocheck-initial-conditions spring2015_${NEWRUN}_2.yaml $SCRATCH/results/spring2015_${NEWRUN}_2 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
TEST=0
TEST="$(salishsea run --skylake --waitjob ${JID} --nocheck-initial-conditions spring2015_${NEWRUN}_3.yaml $SCRATCH/results/spring2015_${NEWRUN}_3 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
TEST=0
TEST="$(salishsea run --skylake --waitjob ${JID} --nocheck-initial-conditions spring2015_${NEWRUN}_4.yaml $SCRATCH/results/spring2015_${NEWRUN}_4 2>&1)"
echo $TEST
JID=0
if [[ $TEST != *"ERROR"* ]]; then
   JID=${TEST##* }
else
  exit
fi
echo "Ended run at $(date)"
exit
