#!/bin/bash
NEWRUN="Z3"
OLDRUN="Z3LL"

#echo "working dir: $(pwd)"

sed "s/$OLDRUN/$NEWRUN/" "spring2017_${OLDRUN}_0.yaml" > "spring2017_${NEWRUN}_0.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring2017_${OLDRUN}_1.yaml" > "spring2017_${NEWRUN}_1.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring2017_${OLDRUN}_2.yaml" > "spring2017_${NEWRUN}_2.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring2017_${OLDRUN}_3.yaml" > "spring2017_${NEWRUN}_3.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring2017_${OLDRUN}_4.yaml" > "spring2017_${NEWRUN}_4.yaml"
exit
