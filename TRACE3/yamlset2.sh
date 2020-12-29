#!/bin/bash
NEWRUN=$1
NSTART=$2
NEND=$3
JID=$4

for j in $(seq $NSTART $NEND); do
  TEST=0
  TEST="$(salishsea run --waitjob ${JID} --nocheck-initial-conditions ${NEWRUN}_${j}.yaml $SCRATCH/results/${NEWRUN} 2>&1)"
  echo $TEST
  JID=0
  if [[ $TEST != *"ERROR"* ]]; then
     JID=${TEST##* }
  else
    exit
  fi
  echo $JID
done
