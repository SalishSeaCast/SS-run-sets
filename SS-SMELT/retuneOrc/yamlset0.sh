#!/bin/bash
NEWRUN="A02"
OLDRUN="A01"

#echo "working dir: $(pwd)"

sed "s/$OLDRUN/$NEWRUN/" "${OLDRUN}new_0.yaml" > "${NEWRUN}_0.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${OLDRUN}new_1.yaml" > "${NEWRUN}_1.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${OLDRUN}new_2.yaml" > "${NEWRUN}_2.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${OLDRUN}new_3.yaml" > "${NEWRUN}_3.yaml"
sed "s/$OLDRUN/$NEWRUN/" "${OLDRUN}new_4.yaml" > "${NEWRUN}_4.yaml"
exit
