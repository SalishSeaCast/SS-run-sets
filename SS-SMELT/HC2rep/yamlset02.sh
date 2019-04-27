#!/bin/bash
NEWRUN="Z6"
OLDRUN="Z5"

#echo "working dir: $(pwd)"

sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_0.yaml" > "spring15spun_${NEWRUN}_20.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_1.yaml" > "spring15spun_${NEWRUN}_21.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_2.yaml" > "spring15spun_${NEWRUN}_22.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_3.yaml" > "spring15spun_${NEWRUN}_23.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_4.yaml" > "spring15spun_${NEWRUN}_24.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_5.yaml" > "spring15spun_${NEWRUN}_25.yaml"
exit
