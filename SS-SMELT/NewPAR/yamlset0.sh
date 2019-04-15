#!/bin/bash
NEWRUN="1_3_b"
OLDRUN="1_3"
PREFIX=PAR

#echo "working dir: $(pwd)"

sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}${OLDRUN}_0.yaml" > "${PREFIX}_${NEWRUN}_0.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}${OLDRUN}_1.yaml" > "${PREFIX}_${NEWRUN}_1.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}${OLDRUN}_2.yaml" > "${PREFIX}_${NEWRUN}_2.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}${OLDRUN}_3.yaml" > "${PREFIX}_${NEWRUN}_3.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}${OLDRUN}_4.yaml" > "${PREFIX}_${NEWRUN}_4.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}${OLDRUN}_5.yaml" > "${PREFIX}_${NEWRUN}_5.yaml"
exit
