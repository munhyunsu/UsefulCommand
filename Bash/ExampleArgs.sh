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


