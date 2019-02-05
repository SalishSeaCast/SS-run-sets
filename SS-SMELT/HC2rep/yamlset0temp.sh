#!/bin/bash
NEWRUN="Z5"
OLDRUN="Z4"

#echo "working dir: $(pwd)"

sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_5.yaml" > "spring15spun_${NEWRUN}_5.yaml"
exit
