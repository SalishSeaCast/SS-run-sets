#!/bin/bash
NEWRUN="Z7"
OLDRUN="Z6"

#echo "working dir: $(pwd)"

sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_20.yaml" > "spring16spun_${NEWRUN}_0.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_21.yaml" > "spring16spun_${NEWRUN}_1.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_22.yaml" > "spring16spun_${NEWRUN}_2.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_23.yaml" > "spring16spun_${NEWRUN}_3.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_24.yaml" > "spring16spun_${NEWRUN}_4.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_25.yaml" > "spring16spun_${NEWRUN}_5.yaml"
exit
