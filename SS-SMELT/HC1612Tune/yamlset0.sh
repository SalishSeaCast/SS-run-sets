#!/bin/bash
NEWRUN="R2"
OLDRUN="R1"
PREFIX=spring15

#echo "working dir: $(pwd)"

sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}_${OLDRUN}_0.yaml" > "${PREFIX}_${NEWRUN}_0.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}_${OLDRUN}_1.yaml" > "${PREFIX}_${NEWRUN}_1.yaml"
exit
