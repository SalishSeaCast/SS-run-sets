#!/bin/bash
NEWRUN="13bfastSiLR"
OLDRUN="13bfastSi"
PREFIX=PAR

#echo "working dir: $(pwd)"

sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}_${OLDRUN}_0.yaml" > "${PREFIX}_${NEWRUN}_0.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}_${OLDRUN}_1.yaml" > "${PREFIX}_${NEWRUN}_1.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}_${OLDRUN}_2.yaml" > "${PREFIX}_${NEWRUN}_2.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}_${OLDRUN}_3.yaml" > "${PREFIX}_${NEWRUN}_3.yaml"
#sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}_${OLDRUN}_4.yaml" > "${PREFIX}_${NEWRUN}_4.yaml"
#sed "s/$OLDRUN/$NEWRUN/" "${PREFIX}_${OLDRUN}_5.yaml" > "${PREFIX}_${NEWRUN}_5.yaml"
exit
