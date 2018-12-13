#!/bin/bash
NEWRUN="Z7"
OLDRUN="Z6"

#echo "working dir: $(pwd)"

sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_0.yaml" > "spring16spun_${NEWRUN}_0.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_1.yaml" > "spring16spun_${NEWRUN}_1.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_2.yaml" > "spring16spun_${NEWRUN}_2.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_3.yaml" > "spring16spun_${NEWRUN}_3.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_4.yaml" > "spring16spun_${NEWRUN}_4.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring15spun_${OLDRUN}_5.yaml" > "spring16spun_${NEWRUN}_5.yaml"
exit
