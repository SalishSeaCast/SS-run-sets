#!/bin/bash
NEWRUN="LLR2"
OLDRUN="HCMZ"

echo "working dir: $(pwd)"

sed "s/$OLDRUN/$NEWRUN/" "spring2015_${OLDRUN}_0.yaml" > "spring2015_${NEWRUN}_0.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring2015_${OLDRUN}_1.yaml" > "spring2015_${NEWRUN}_1.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring2015_${OLDRUN}_2.yaml" > "spring2015_${NEWRUN}_2.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring2015_${OLDRUN}_3.yaml" > "spring2015_${NEWRUN}_3.yaml"
sed "s/$OLDRUN/$NEWRUN/" "spring2015_${OLDRUN}_4.yaml" > "spring2015_${NEWRUN}_4.yaml"

hg addremove
hg commit -m "'${NEWRUN} yamls'"

echo "done"
exit
