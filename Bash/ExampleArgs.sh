#!/bin/bash


echo "Argument Parsing Example"
echo "Program name: $0"

if [ "$1" == "yes" ] || [ "$1" == "YES" ];
then
    TARGET="Exists"
else
    TARGET="Non"
fi
echo "Target by args: ${TARGET}"

if [ -z "$2" ];
then
    PARAM=10
else
    PARAM=$2
fi
echo "Param by args: ${PARAM}"

PARAM2=20
if [ ! -z "$3" ];
then
    PARAM2=$3
fi
echo "Param2 by args: ${PARAM2}"
