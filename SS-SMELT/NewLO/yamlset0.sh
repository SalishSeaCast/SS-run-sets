#!/bin/bash
NEWRUN="NewLOGnSiTB"
OLDRUN="NewLOGnSiT"

#echo "working dir: $(pwd)"

sed "s/$OLDRUN/$NEWRUN/" "${OLDRUN}_0.yaml" > "${NEWRUN}_0.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${OLDRUN}_1.yaml" > "${NEWRUN}_1.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${OLDRUN}_2.yaml" > "${NEWRUN}_2.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${OLDRUN}_3.yaml" > "${NEWRUN}_3.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${OLDRUN}_4.yaml" > "${NEWRUN}_4.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${OLDRUN}_5.yaml" > "${NEWRUN}_5.yaml"
exit
