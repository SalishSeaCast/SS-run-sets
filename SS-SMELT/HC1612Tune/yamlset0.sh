#!/bin/bash
NEWRUN="R3"
OLDRUN="R2"
PREFIX=spring15

#echo "working dir: $(pwd)"

sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}_${OLDRUN}_0.yaml" > "${PREFIX}_${NEWRUN}_0.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}_${OLDRUN}_1.yaml" > "${PREFIX}_${NEWRUN}_1.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}_${OLDRUN}_2.yaml" > "${PREFIX}_${NEWRUN}_2.yaml"
exit
