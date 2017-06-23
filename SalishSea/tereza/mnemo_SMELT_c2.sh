#!/bin/bash

#PWD=`pwd`
#!NAME=`basename $PWD`
#if [ $NAME != "CONFIG" ]; then
#  echo "$0 should be run from NEMOGCM/CONFIG, exiting"
#  exit
#fi

cd /data/tjarniko/MEOPAR/NEMO-3.6-code/NEMOGCM/CONFIG

if [ "$#" -ne 1 ]; then
  CFG=SMELT_c2
else
  CFG=$1
fi

echo "Cleaning NEMO .."
./makenemo -n $CFG -m GCC_SALISH clean

echo "Making NEMO ..."
./makenemo -n $CFG -m GCC_SALISH -j 8 

